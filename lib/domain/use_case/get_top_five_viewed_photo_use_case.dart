import 'package:image_search_20day/domain/model/photo.dart';
import 'package:image_search_20day/domain/repository/photo_repository.dart';

import '../../core/result.dart';

class GetTopFiveViewedPhotoUseCase {
  final PhotoRepository _photoRepository;

  GetTopFiveViewedPhotoUseCase(this._photoRepository);

  Future<Result<List<Photo>>> execute(query) async {
    try {
      final photos = await _photoRepository.getPhotos(query);
      photos.sort((a, b) => -a.views.compareTo(b.views));
      return Result.success(photos.take(5).toList());
    } catch (err) {
      return const Result.error('문제가 발생했습니다.');
    }
  }
}
