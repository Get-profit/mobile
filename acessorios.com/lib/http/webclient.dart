import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);

const String viaCepUrl = 'https://viacep.com.br/ws/#numerodocepaqui/json/';
const String baseUrl = '';


