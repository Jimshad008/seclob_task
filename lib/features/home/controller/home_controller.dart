import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seclob_task/features/home/repository/home_repository.dart';

import '../../../model/media_model.dart';
final homeControllerProvider=Provider((ref) => HomeController(homeRepository: ref.read(homeRepositoryProvider)));
final fetchDataProvider=FutureProvider((ref) => ref.read(homeControllerProvider).fetchData());
class HomeController{
  final HomeRepository _homeRepository;
  HomeController({required HomeRepository homeRepository}):_homeRepository=homeRepository;
  Future<List<MediaModel>>fetchData(){
    return _homeRepository.fetchData();
  }
}