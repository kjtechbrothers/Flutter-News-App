import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class NewsDetailsScreen extends StatefulWidget {
  final String newsImage,newsTitle,newsData,author,description,content,source;
  const NewsDetailsScreen({
    required this.newsImage,
  required this.newsTitle,
  required this.newsData,
  required this.author,
  required this.description,
  required this.content,
  required this.source,
    super.key});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  final format = DateFormat('MMMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    DateTime dateTime=DateTime.parse(widget.newsData);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Details Of The News', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation:0,
      ),

      body: Stack(
        children: [
          SizedBox(
            height: height * .45,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: CachedNetworkImage(imageUrl: widget.newsImage,
              fit: BoxFit.cover,
              placeholder: (context,ulr)=>const Center(child: CircularProgressIndicator(),),),
            ),
          ),
          Container(
            height: height * .6,
            margin: EdgeInsets.only(top: height*.4),
            padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),

            ),
            child:ListView(
              children: [
                Text(widget.newsTitle,style: GoogleFonts.poppins(fontSize:20,color:Colors.black87,
                fontWeight:FontWeight.w700),),
                SizedBox(height: height*.02,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.source,style: GoogleFonts.poppins(fontSize:20,color:Colors.black87,
                        fontWeight:FontWeight.w600),),
                    SizedBox(height: height*.02,),
                    Text(format.format(dateTime),style: GoogleFonts.poppins(fontSize:12,color:Colors.black87,
                        fontWeight:FontWeight.w500),),
                    SizedBox(height: height*.03,),
                    Text(widget.description,style: GoogleFonts.poppins(fontSize:15,color:Colors.black87,
                        fontWeight:FontWeight.w500),),
                  ],
                )

              ],
            ) ,
          ),
        ],
      ),
    );
  }
}
