import 'package:news_app/models/categories_news_model.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:news_app/models/news_channels_headlines_models.dart';

class NewsViewModel{
  final _rep=NewsRepository();
  Future<NewsChannelsHeadlinesModels> fetchNewsChannelsHeadlinesApi(String channelName) async{
    final response= await _rep.fetchNewsChannelsHeadlinesApi(channelName);
    return response;

}

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String channelName) async{
    final response= await _rep.fetchCategoriesNewsApi(channelName);
    return response;

  }
}