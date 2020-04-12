import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);

  const String clientUrl = 'http://35.208.89.16/api/clientes';
  const String userUrl = "http://35.208.89.16/api/usuarios";
  const String serviceOrderUrl = 'http://35.208.89.16/api/ordemservico';


