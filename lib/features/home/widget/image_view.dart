import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seclob_task/core/constant/global_constants.dart';
import 'package:seclob_task/model/media_model.dart';

class ImageView extends StatefulWidget {
  final MediaModel media;
  const ImageView({super.key,required this.media});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width,
            height: height*0.3,
            child: Image.network(widget.media.filePath,fit: BoxFit.cover,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(CupertinoIcons.heart,color: Colors.black,size: width*0.06,),
                  Text(widget.media.likeCount.toString(),style: TextStyle(
                      fontSize: width*0.03,fontFamily: "Poppins",color: Colors.black))
                ],
              ),
              Column(
                children: [
                  SizedBox(
                      width: width*0.05,
                      child: Image.asset("assets/comment.png",color: Colors.black,)),
                  Text(widget.media.commentCount.toString(),style: TextStyle(
                      fontSize: width*0.03,fontFamily: "Poppins",color: Colors.black))
                ],
              ),

            ],
          ),
          Text(widget.media.description.toString(),style: TextStyle(
              fontSize: width*0.03,fontFamily: "Poppins",color: Colors.black)),
          Text(widget.media.createAt.substring(0,10).toString(),style: TextStyle(
              fontSize: width*0.03,fontFamily: "Poppins",color: Colors.black))
        ],
      ),
    );
  }
}
