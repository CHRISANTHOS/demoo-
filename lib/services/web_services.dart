import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

class WebServices{

  Future<void> downloadVideo(String youTubeVideoUrl, String title)async{
    await FlutterYoutubeDownloader.downloadVideo(youTubeVideoUrl, title, 18);
  }

}