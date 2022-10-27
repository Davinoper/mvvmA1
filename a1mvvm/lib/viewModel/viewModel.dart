import 'package:a1mvvm/api/api.dart' as api;
import 'package:a1mvvm/model/endereco.dart';

class ViewModel{

  static bool login(String email, String senha){
    if(email == "admin" && senha =="1234") {
      return true;
    }
    return false;
  }

  static Future<Endereco> find(String cep) async{
    Uri uri = Uri.parse("https://brasilapi.com.br/api/cep/v1/" + cep);
    var retorno = await api.fetch(uri);
    List valores = [];
    retorno.forEach((key, value) { valores.add(value);});
    Endereco end = Endereco(valores[0],valores[1],valores[2],valores[3],valores[4],valores[5]);
    return end;
  }


}