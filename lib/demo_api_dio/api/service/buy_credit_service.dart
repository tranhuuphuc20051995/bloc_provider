import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutterapp/demo_api_dio/api/model/packages_model.dart';

class BuyCreditService {
  Dio dio = Dio();

  Future<dynamic> getPackages(
      {Function(PackagesModel) onSuccess,
      Function(String) onFailure,
      Function onErrorHttp}) async {
    var path = '';
    var _param = {'locale': 'vi'};
    dio
        .get(path,
            queryParameters: _param,
            options: Options(headers: {
              'access_token':
                  '88dd7889a2747d220b93beedd0e8b1dd60a812131795c123fa63878d9ccda52d'
            }))
        .then((reponse) {
      if (reponse.statusCode >= 200 && reponse.statusCode <= 299) {
        PackagesModel model = PackagesModel.fromJson(reponse.data);
        if (model.flag == 143) {
          onSuccess(model);
        } else {
          onFailure('Loi nay la loi sever tra ve');
        }
      } else {
        onErrorHttp();
      }
      print('reponse: ${reponse.data}');
    });
  }

  Future<dynamic> testPost() async {
    var path = '';
    var _param = {
      "voucher": "32",
      "locale": "vi",
      'access_token':
          '88dd7889a2747d220b93beedd0e8b1dd60a812131795c123fa63878d9ccda52d',
    };
    dio
        .post(
      path,
      data: _param,
    )
        .then((reponse) {
      print('reponse : ${reponse.data}');
    });
  }
}
