import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

abstract class ViewModel<T extends ViewStatus> with ChangeNotifier {
  late T _status;

  T get status => _status;

  set status(T value) {
    _status = value;
    notifyListeners();
  }
}

abstract class EffectsViewModel<T extends ViewStatus, E extends Effect>
    extends ViewModel<T> {
  @visibleForTesting
  Subject<E> effectSubject = ReplaySubject<E>();

  Stream<E> get effects => effectSubject.stream;

  void addEffect(E effect) {
    effectSubject.add(effect);
  }

  @override
  void dispose() {
    effectSubject.close();
    super.dispose();
  }
}

abstract class ViewStatus {}

abstract class Effect {}
