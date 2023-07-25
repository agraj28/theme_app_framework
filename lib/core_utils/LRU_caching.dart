import 'dart:collection';

class LRUCache<K, V> {
  final Map<K, V> cacheMap = HashMap<K, V>();
  final Queue<K> queue = Queue<K>();

  LRUCache();

  V? get(K key) {
    if (cacheMap.containsKey(key)) {
      queue.remove(key);
      queue.addLast(key);
      return cacheMap[key];
    }
    return null;
  }

  void put(K key, V value) {
    if (cacheMap.containsKey(key)) {
      queue.remove(key);
    }
    cacheMap[key] = value;
    queue.addLast(key);
  }
}
