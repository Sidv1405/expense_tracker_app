/// Base UseCase cho các hành động trả về Future (như Add, Update, Delete)
abstract class BaseUseCase<In, Out> {
  Future<Out> execute(In input);
}

/// Base UseCase cho các hành động trả về Stream (như Watch Transactions)
abstract class StreamUseCase<In, Out> {
  Stream<Out> execute(In input);
}

/// Class dùng khi UseCase không cần tham số đầu vào
class NoParameters {
  const NoParameters();
}
