import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file/file.dart' hide FileSystem;
import 'package:file/local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_cache_manager/src/storage/file_system/file_system.dart';
import 'package:flutter_getx_project_template/gen_a/A.dart';
import 'package:octo_image/octo_image.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

//"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1604478826459&di=284b6e08d87ef6431079aa9ea6f2faf6&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F56%2F12%2F01300000164151121576126282411.jpg"
///图片加载控件
///默认切割0dp圆角
class ImageWidget extends StatefulWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double radius;

  ///asstes 图片地址
  final String? placeholderPath;

  ///asstes 图片地址
  final String? errorPath;
  final OctoPlaceholderBuilder? placeholderBuilder;
  final OctoErrorBuilder? errorBuilder;

  ///用于展示前处理image
  final OctoImageBuilder? imageBuilder;

  const ImageWidget(
      {Key? key,
      this.fit,
      this.placeholderBuilder,
      this.errorBuilder,
      this.placeholderPath,
      this.errorPath,
      this.radius = 0,
      this.imageUrl,
      this.width,
      this.imageBuilder,
      this.height})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImageWidgetState();
  }
}

class _ImageWidgetState extends State<ImageWidget> {
  final int cacheSize = 86;

  @override
  Widget build(BuildContext context) {
    Widget? childWidget;
    if (widget.imageUrl?.isEmpty ?? true) {
      if (widget.placeholderBuilder != null) {
        childWidget = widget.placeholderBuilder?.call(context);
      } else {
        childWidget = Image.asset(
          widget.placeholderPath ?? A.assets_images_placehold,
          width: widget.width,
          height: widget.height,
          fit: widget.fit ?? BoxFit.fill,
        );
      }
    } else {
      childWidget = OctoImage(
        width: widget.width,
        height: widget.height,
        fit: widget.fit ?? BoxFit.fill,
        // memCacheHeight: cacheHeight,
        // memCacheWidth: cacheWidth ,
        image: CachedNetworkImageProvider(
          widget.imageUrl!,
          cacheManager: MyDefaultCacheManager(),
        ),
        imageBuilder: widget.imageBuilder ??
            (context, child) {
              return child;
            },
        placeholderBuilder: widget.placeholderBuilder ??
            (context) {
              return Image.asset(
                widget.placeholderPath ?? A.assets_images_placehold,
                fit: widget.fit ?? BoxFit.fill,
              );
            },
        errorBuilder: widget.errorBuilder ??
            (context, error, stack) {
              // Log.warning("img_path : ${widget.imageUrl}", error, stack, false);
              return Image.asset(
                widget.errorPath ?? A.assets_images_placehold,
                fit: widget.fit ?? BoxFit.fill,
              );
            },
      );
    }
    if (widget.radius > 0) {
      childWidget = ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius),
        child: childWidget,
      );
    }
    return childWidget ?? Container();
  }
}

class MyDefaultCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static MyDefaultCacheManager? _instance;
  factory MyDefaultCacheManager() {
    _instance ??= MyDefaultCacheManager._();
    return _instance!;
  }

  MyDefaultCacheManager._()
      : super(Config(
          key,
          fileSystem: MyIOFileSystem(key),
        ));
}

class MyIOFileSystem implements FileSystem {
  final Future<Directory> _fileDir;
  final String _cacheKey;
  MyIOFileSystem(this._cacheKey) : _fileDir = createDirectory(_cacheKey);

  static Future<Directory> createDirectory(String key) async {
    var baseDir = await getTemporaryDirectory();
    var path = p.join(baseDir.path, key);

    var fs = const LocalFileSystem();
    var directory = fs.directory((path));
    await directory.create(recursive: true);
    return directory;
  }

  @override
  Future<File> createFile(String name) async {
    var directory = (await _fileDir);
    //修复 当缓存被删除后 导致file不存在 报错的bug
    //解决 flutter_cache_manager 2.1.0版本  flutter_cached_network_image 2.5.0版本的bug
    if (!(await directory.exists())) {
      await createDirectory(_cacheKey);
    }
    return directory.childFile(name);
  }
}
