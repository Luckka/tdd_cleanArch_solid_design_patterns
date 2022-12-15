import 'package:clean_arch/domain/usecases/authentication.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class RemoteAuthentication{
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});
  Future<void> auth(AuthenticationParms params) async{
    await httpClient.request(url: url,method: 'post',body: params.toJson());
  }
}

abstract class HttpClient{
  Future<void> request({
    @required String url,
    @required String method,
    Map body
  });
}

class HttpClientSpy extends Mock implements HttpClient {}
void main(){
  HttpClientSpy httpClient;
  RemoteAuthentication sut;
  String url;

  setUp((){
     httpClient = HttpClientSpy();
     url = faker.internet.httpUrl();
     sut = RemoteAuthentication(httpClient: httpClient,url:url);
  });
  test('Should call HttpClient with correct values',() async {
    final params = AuthenticationParms(email: faker.internet.email(), password: faker.internet.password());
    
    await sut.auth(params);
    verify(
      httpClient.request(
        url:url,
        method: 'post',
        body:{'email': params.email, 'password': params.password}
      )
    );
  });
}