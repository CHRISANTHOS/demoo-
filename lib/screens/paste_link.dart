import 'package:flutter/material.dart';
import 'package:youtube_downloader/services/web_services.dart';

class PasteLink extends StatefulWidget {

  @override
  State<PasteLink> createState() => _PasteLinkState();
}

class _PasteLinkState extends State<PasteLink> {
  final TextEditingController _controller = TextEditingController();
  WebServices webServices = WebServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: const Icon(Icons.link_outlined, color: Colors.black54,),
              hintText: 'Paste link',
              hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          ElevatedButton(onPressed: (){
            if(_controller.text.isNotEmpty){
              webServices.downloadVideo(_controller.text.trim(), 'Uche youtube downloader');
            }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('paste link')));
            }
          }, child: const Text('Download'))
        ],
      ),
    );
  }
}