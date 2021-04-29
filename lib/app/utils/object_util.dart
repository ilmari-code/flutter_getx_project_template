bool isEmpty(Object object) {
  if (object == null) return true;
  if (object is String) return object.isEmpty;
  if (object is List) return object.isEmpty;
  if (object is Map) return object.isEmpty;
  return false;
}

bool isNotEmpty(Object object) {
  return !isEmpty(object);
}
