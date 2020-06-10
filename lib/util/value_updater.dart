typedef OnUpdate<T> = T Function(T oldValue, T newValue);
class ValueUpdater<T> {
  final OnUpdate<T> onUpdate;
  T value;

  ValueUpdater({this.value, this.onUpdate});

  T update(T newValue) => value = onUpdate(value, newValue);
}