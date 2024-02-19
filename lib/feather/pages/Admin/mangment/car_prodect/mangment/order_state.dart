abstract class OrderState {}

class IninalSate extends OrderState {}

class ScafullCreatOrderCar extends OrderState {}

class ErrorCreatOrderCar extends OrderState {
  final String error;
  ErrorCreatOrderCar({required this.error});
}

class GetOrderUserScafull extends OrderState {}

class ScafullDealetCarProdect extends OrderState {}

class ScafullCreatorder extends OrderState {}
