import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);

  const String clientUrl = 'https://projeto-acessorios.appspot.com/api/clientes';
  const String userUrl = "https://projeto-acessorios.appspot.com/api/usuarios";
  const String serviceOrderUrl = 'https://projeto-acessorios.appspot.com/api/ordemservico';


