abstract class UdateProdetState {}

class IninalSate extends UdateProdetState {}

class LodingUpdateProdect extends UdateProdetState {}

class SuccessUpdateProdect extends UdateProdetState {}

class ErrorUpdateProdect extends UdateProdetState {
  final String eror;
  ErrorUpdateProdect(this.eror);
}
