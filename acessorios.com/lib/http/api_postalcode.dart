import 'package:dio/dio.dart';
import 'package:get_profit/http/webclients/api_error.dart';
import 'package:get_profit/http/webclients/api_response.dart';
import 'package:get_profit/models/address.dart';

Future<ApiResponse>getAddressFromApi(String postalCode) async {

  final String endpoint = 'https://viacep.com.br/ws/${postalCode.replaceAll('.', '').replaceAll('-', '')}/json/';


  try{
    final Response response = await Dio().get<Map>(endpoint);
    if(response.data.containsKey('erro') && response.data['erro']){
        return ApiResponse.error(
          error: ApiError(
            code: -1,
            message: "Cep Inválido"
          )
        );
    }
    final Address address = Address(
      place: response.data['logradouro'],
      district: response.data['bairro'],
      city: response.data['localidade'],
      postalcode: response.data['cep'],
      federativeUnit: response.data['uf']
    );

    return ApiResponse.sucess(result: address);

  } on DioError catch(e){
    return ApiResponse.error(
      error: ApiError(
        code: -1,
        message: 'Falha ao contactar VIACEP'
      )
    );
  }



}