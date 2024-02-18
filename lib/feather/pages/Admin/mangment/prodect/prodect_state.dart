abstract class ProdectState {}

class LoadingState extends ProdectState {}

class LodingCreatProdect extends ProdectState {}
class LodingCreatorderp extends ProdectState {}

class ScafullCreatProdect extends ProdectState {}
class ScafullCreatorders extends ProdectState {}

class ErrorCreatProdect extends ProdectState {}

class RemoveimageProdect extends ProdectState {}

class LodingGetimageProdect extends ProdectState {}

class ScafullGetimageProdect extends ProdectState {}

class ErrorGetimageProdect extends ProdectState {}

class ScafullUploadprodectImage extends ProdectState {}

class ErrorUploadcreatprodectImage extends ProdectState {}

class ErrorUploadprodectImage extends ProdectState {}

class LodingGetcatroiesState extends ProdectState {}

class ScafullGetcatroiesstate extends ProdectState {}

class ErrorGetcatroiesstate extends ProdectState {}

class LodingGetListprodects extends ProdectState {}

class ScafullGetListCatroies extends ProdectState {}

class SuccessDeleteCatgies extends ProdectState {}

class ErrorDeleteCatgies extends ProdectState {
  final String eror;
  ErrorDeleteCatgies(this.eror);
}

class SuccessDeleteProect extends ProdectState {}

class ErrorDeleteProdect extends ProdectState {
  final String eror;
  ErrorDeleteProdect(this.eror);
}

class LodingUpdateProdect extends ProdectState {}

class SuccessUpdateProdect extends ProdectState {}

class ErrorUpdateProdect extends ProdectState {
  final String eror;
  ErrorUpdateProdect(this.eror);
}
