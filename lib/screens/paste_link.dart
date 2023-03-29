import 'package:flutter/material.dart';

class PasteLink extends StatefulWidget {

  @override
  State<PasteLink> createState() => _PasteLinkState();
}

class _PasteLinkState extends State<PasteLink> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
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

            }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('paste link')));
            }
          }, child: Text('Download'))
        ],
      ),
    );
  }
}
