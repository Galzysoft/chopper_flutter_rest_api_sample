import 'package:chopper/chopper.dart';
//to create a chopper sevice class we first start by creating the part for the  code generator
//part: "partname.chopper.dart;"
part 'post_api_service.chopper.dart';

//first anotatae the class with and include A base url for that service class  @ chopperapi(baseurl:"/post")
@ChopperApi(baseUrl: '/posts')
//note the class must be an abstract class that is extenended to chopperservicess
abstract class PostApiService extends ChopperService {
  //herer our  first service is the  Get() these returns all the lists of the posts
  @Get()
  //every annotation in chopper must be followed by a future method which helps to lazy load the  method eg
  //Future<Response> method_name()

  Future<Response> getposts();
  //here u can get the   a specific selected id elemnt  by id or any method parameter using path : "/{id}"
  //@Get(path:"id")
  @Get(path: '/{id}')
  //here you canspecify the future  method for path using eg
  //                       *****parameter***variable
  //Future<Response> getpost( @path("id") int id);
  // )
  Future<Response> getpost(@Path('id') int id);
  //to post stuffs you use @post();

  @Post()
  //using a future method of these such eg
  //@Body() means that we are posting a body of a program and it is follwed by the  format of map variable
  // Future <Response> postpost(@Body() map<String,dynamic> body,);
  Future<Response> postpost(
    // posts use  to have body
    @Body() Map<String, dynamic> body,
  );

//  here we create a link that passes  or links the two  classes together
//  we also declera a chopper client  it takes tree input parameters  \
// baseurl : it is the api url
// service: these mneanse the custom generator class that  generates
// converter is used to specify the method of selerization we wil be using
  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: "https://jsonplaceholder.typicode.com",
      services: [
        _$PostApiService(),
      ],
      converter: JsonConverter(),
    );
    return _$PostApiService(client);
  }
}
