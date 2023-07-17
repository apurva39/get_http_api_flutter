import 'package:http/http.dart' as http;
import 'package:local_json_api/Models/posts_model.dart';

var base="https://dummyjson.com";

getPost()
async {
  Uri url=Uri.parse("https://dummyjson.com/products");

  var response=await http.get(url);

  try{
    if(response.statusCode==200)
    {
      var data=postsModelFromJson(response.body);
      return data.products;

    }
    else
    {
      print("error ehile connection");
      // var data=postsModelFromJson(response.body);
      // return data.products;
    }
  }
  catch(e)
  {
    print(e.toString());
  }

}