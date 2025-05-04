import 'package:dio/dio.dart';
import 'package:mortydex/domain/domain.dart';
import 'package:retrofit/retrofit.dart';

part 'characters_list_api_client.g.dart';

@RestApi()
abstract class CharactersListApiClient {
  factory CharactersListApiClient(Dio dio, {String baseUrl}) =
      _CharactersListApiClient;

  factory CharactersListApiClient.create({
    String? apiUrl,
  }) {
    final dio = Dio();

    if (apiUrl == null || apiUrl.isEmpty) {
      throw Exception('API_URL not found in .env file');
    } else {
      return CharactersListApiClient(dio, baseUrl: apiUrl);
    }
  }

  @GET('character')
  Future<CharactersListResponse> getCharactersList();
}
