import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);
    String returnUrlCep(String cep){
    return 'https://viacep.com.br/ws/'+cep+'/json/';
    }
  const String baseUrl = '';


