import 'api_error.dart';

class ApiResponse{

  ApiResponse.sucess({this.result}){
     sucess = true;
  }
  ApiResponse.error({this.error}){
    sucess = false;
  }
  bool sucess;
  dynamic result;
  ApiError error;
}