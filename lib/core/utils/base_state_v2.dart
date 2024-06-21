enum StatusState { initial, loading, success, error, empty }

class BaseStateV2<T> {
  StatusState status;
  T? data;
  dynamic message;

  BaseStateV2({
    this.status = StatusState.initial,
    this.data,
    this.message,
  });

  bool get isInitial => status == StatusState.initial;
  bool get isLoading => status == StatusState.loading;
  bool get isError => status == StatusState.error;
  bool get isSuccess => status == StatusState.success;
  bool get isEmpty => status == StatusState.empty;

  BaseStateV2<T> copyWith({
    StatusState? status,
    T? data,
    dynamic message,
  }) {
    return BaseStateV2<T>(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  BaseStateV2<T> clear() {
    return BaseStateV2<T>(
      status: StatusState.initial,
      data: null,
      message: null,
    );
  }
}
