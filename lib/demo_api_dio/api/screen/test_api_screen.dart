import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/demo_api_dio/api/bloc/api_bloc.dart';
import 'package:flutterapp/demo_api_dio/api/model/packages_model.dart';

class ApiScreen extends StatefulWidget {
  static Widget newInstance() {
    return BlocProvider<ApiBloc>(
      creator: (_context, _bag) => ApiBloc(),
      child: ApiScreen(),
    );
  }

  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  ApiBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<ApiBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: StreamBuilder<PackagesModel>(
          stream: _bloc.streamPackage,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: snapshot.data.packages
                      .map((p) => Container(
                            width: MediaQuery.of(context).size.width / 3 - 16,
                            height: 100,
                            color: Colors.blue,
                            alignment: Alignment.center,
                            child: Text(p.toString()),
                          ))
                      .toList()),
            );
          }),
    );
  }
}
