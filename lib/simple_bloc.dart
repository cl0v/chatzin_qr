
import 'dart:async';

class SimpleBloc<T> {
  final _controller = StreamController<T>();
  Stream<T> get stream => _controller.stream;

  add(T obj) {
    if (!_controller.isClosed) _controller.sink.add(obj);
  }

  subscribe(Stream<T> source) {
    if (!_controller.isClosed) _controller.addStream(source);
  }

  addError(T obj) {
    if (!_controller.isClosed) _controller.sink.add(obj);
  }

  dispose() {
    if (!_controller.isClosed) _controller.close();
  }


}
