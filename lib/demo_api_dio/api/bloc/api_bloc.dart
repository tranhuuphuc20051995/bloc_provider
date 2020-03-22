import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutterapp/demo_api_dio/api/model/packages_model.dart';
import 'package:flutterapp/demo_api_dio/api/service/buy_credit_service.dart';
import 'package:rxdart/rxdart.dart';

class ApiBloc implements Bloc {
  PackagesModel _model = PackagesModel();

  BehaviorSubject<PackagesModel> _packagesController = BehaviorSubject();

  ValueStream<PackagesModel> get streamPackage => _packagesController.stream;

  ApiBloc() {
    getPackages();
    BuyCreditService().testPost();
  }

  void getPackages() {
    getPackagesRemote();
  }

  Future<void> getPackagesRemote() async {
    await BuyCreditService().getPackages(
        onFailure: (e) {},
        onSuccess: (model) {
          _model = model;
          _packagesController.add(_model);
        },
        onErrorHttp: () {});
  }

  @override
  void dispose() {
    _packagesController.close();
    // TODO: implement dispose
  }
}
