import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/categories_news_model.dart';
import 'package:news_app/models/news_channels_headlines_models.dart';
class NewsRepository{

  Future<NewsChannelsHeadlinesModels> fetchNewsChannelsHeadlinesApi(String channelName) async{
    String  url= 'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=131f8cee2ac74203840c7db5087b7697';
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final body=jsonDecode(response.body);
      return NewsChannelsHeadlinesModels.fromJson(body);
    }
    throw Exception('Error');

  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{
    String  url= 'https://newsapi.org/v2/everything?q=$category&apiKey=131f8cee2ac74203840c7db5087b7697';
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final body=jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Error');

  }
}