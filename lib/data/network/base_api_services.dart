abstract class BaseApiServices {
  // Future<dynamic> getGetApiResponseWithoutHeader(
  //   String url,
  // );
  Future<dynamic> getPostApiResponse(String url, dynamic data,
      {Map<String, String>? header});
//       Future<dynamic> getGetApiResponse(String url,
//       {Map<String, String>? header});
// }
}
