import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/results_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ResultsModel>> getLatestNews() async {
    try {
      String apiKey = dotenv.env['API_KEY']!;
      Response response = await dio.get(
          'https://newsdata.io/api/1/latest?apikey=$apiKey&language=en');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;
        List<dynamic> results = jsonData['results'];

        List<ResultsModel> resultsList = [];
        for (var result in results) {
          ResultsModel resultsModel = ResultsModel(
            imageUrl: result['image_url'] ??
                'assets/default_image.png', // Handle null case
            title: result['title'] ??
                'No Title Available', // Provide a default value
            description: result['description'] ??
                'No Description Available', // Provide a default
          );
          resultsList.add(resultsModel);
        }
        return resultsList;
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching latest news: $e');
      return [];
    }
  }

  Future<List<ResultsModel>> getNewsByCategory(String category) async {
    try {
      Response response = await dio.get(
          'https://newsdata.io/api/1/news?apikey=pub_56627fc63a79bbfb5730802962c0cfaa2c80a&language=en&category=$category');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;
        List<dynamic> results = jsonData['results'];

        List<ResultsModel> resultsList = [];
        for (var result in results) {
          ResultsModel resultModel = ResultsModel(
            imageUrl: result['image_url'] ??
                'assets/default_image.png', // Handle null case
            title: result['title'] ??
                'No Title Available', // Provide a default value
            description: result['description'] ??
                'No Description Available', // Provide a default
          );
          resultsList.add(resultModel);
        }
        return resultsList;
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching news by category: $e');
      return [];
    }
  }
}
