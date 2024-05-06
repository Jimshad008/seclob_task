import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seclob_task/core/constant/global_constants.dart';
import 'package:seclob_task/features/home/widget/image_view.dart';
import 'package:seclob_task/features/login/screen/loginScreen.dart';

import '../../../../model/media_model.dart';

class ProfilePage extends StatefulWidget {
  final List<MediaModel> medias;
  const ProfilePage({super.key,required this.medias});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        width: width*0.5,
        child: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const LoginScreen(),), (route) => false);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logout"),
              Icon(Icons.logout),
            ],
          ),
        ),
      ),
     body: SafeArea(
       child: Column(
         children: [
           SizedBox(height: height*0.015,),
           Padding(
             padding:  EdgeInsets.only(left: width*0.05,right: width*0.05),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                     SizedBox(
                       width: width*0.12,
                         child: Image.asset("assets/share.png")),
                     GestureDetector(
                       onTap: () {
                         _scaffoldKey.currentState?.openEndDrawer();
                       },
                       child: SizedBox(
                           width: width*0.12,
                           child: Image.asset("assets/menu.png")),
                     )
               ],
             ),
           ),
           SizedBox(height: height*0.02,),
           Padding(
             padding:  EdgeInsets.only(left: width*0.05,right: width*0.05),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     CircleAvatar(
                       radius: width*0.115,
                       backgroundImage: NetworkImage(widget.medias[0].profilePic),
                     ),
                     SizedBox(height: height*0.01,),
                     Text("${widget.medias[0].firstName} ${widget.medias[0].lastName}",style: TextStyle(
                       fontSize: width*0.04,fontFamily: "Poppins",color: primaryColor,fontWeight: FontWeight.w500
                     ),),
                     Text("Photographer",style: TextStyle(
                         fontSize: width*0.03,fontFamily: "Poppins",color: primaryColor,fontWeight: FontWeight.w400
                     ),),
                     Text("🌟 You are beautiful, and \n I'm here to capture it! 🌟",style: TextStyle(
                         fontSize: width*0.03,fontFamily: "Poppins",color: primaryColor,fontWeight: FontWeight.w400
                     ),),
                   ],
                 ),
                 Padding(
                   padding:  EdgeInsets.only(top: height*0.02),
                   child: Column(
                     children: [
                       Text(widget.medias.length.toString(),style: TextStyle(
                           fontSize: width*0.05,fontFamily: "Poppins",color: primaryColor,fontWeight: FontWeight.w500
                       ),),
                       Text("Post",style: TextStyle(
                           fontSize: width*0.03,fontFamily: "Poppins",color: primaryColor,fontWeight: FontWeight.w400
                       ),),
                     ],
                   ),
                 ),
                 Padding(
                   padding:  EdgeInsets.only(top: height*0.02),
                   child: Column(
                     children: [
                       Text("565",style: TextStyle(
                           fontSize: width*0.05,fontFamily: "Poppins",color: primaryColor,fontWeight: FontWeight.w500
                       ),),
                       Text("Followers",style: TextStyle(
                           fontSize: width*0.03,fontFamily: "Poppins",color: primaryColor,fontWeight: FontWeight.w400
                       ),),
                     ],
                   ),
                 ),
                 Padding(
                   padding:  EdgeInsets.only(top: height*0.02),
                   child: Column(
                     children: [
                       Text("565",style: TextStyle(
                           fontSize: width*0.05,fontFamily: "Poppins",color: primaryColor,fontWeight: FontWeight.w500
                       ),),
                       Text("Following",style: TextStyle(
                           fontSize: width*0.03,fontFamily: "Poppins",color: primaryColor,fontWeight: FontWeight.w400
                       ),),
                     ],
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left: width*0.05,right: width*0.05),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                  Container(
                    width: width*0.37,
                    height: height*0.050,
                    decoration: BoxDecoration(
                      color: Color(0xcff184AC0),
                      borderRadius: BorderRadius.circular(width*0.045)
                    ),
                    child: Center(
                      child: Text("Edit Profile",style: TextStyle(
                      fontSize: width*0.04,fontFamily: "Poppins",color: Colors.white,fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                 Container(
                   width: width*0.37,
                   height: height*0.050,
                   decoration: BoxDecoration(
                       color: Color(0xcff28426B),
                       borderRadius: BorderRadius.circular(width*0.045)
                   ),
                   child: Center(
                     child: Text("Wallet",style: TextStyle(
                         fontSize: width*0.04,fontFamily: "Poppins",color: Colors.white,fontWeight: FontWeight.w500
                     ),),
                   ),
                 ),
                 Container(
                   width: width*0.125,
                   height: height*0.050,
                   decoration: BoxDecoration(
                       color: Color(0xcff184AC0),
                       borderRadius: BorderRadius.circular(width*0.045)
                   ),
                   child: Center(
                     child: Icon(CupertinoIcons.phone,color: Colors.white,)
                   ),
                 )
               ],
             ),
           ),
           SizedBox(height: height*0.015,),
       TabBar(
         indicatorColor: Colors.transparent,
         labelColor: Colors.grey,
         unselectedLabelColor: Colors.grey,
         controller: _tabController,
         tabs: const [
           Tab( text: 'Photos'),
           Tab( text: 'Videos'),
         ],),
           Padding(
             padding:  EdgeInsets.only(left: width*0.03,right: width*0.03),
             child: SizedBox(width: width,
             height: height*0.42,
               child: TabBarView(
                 controller: _tabController,
                 children: [
                   GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: width*0.02,mainAxisSpacing: width*0.02,childAspectRatio: 0.8), itemCount: widget.medias.length,itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap:  () {
                            showDialog(context: context, builder:(context) {
                              return AlertDialog(
                                content: ImageView(media: widget.medias[index]),
                              );
                            },);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width*0.02),
                              image: DecorationImage(image: NetworkImage(widget.medias[index].filePath),fit: BoxFit.cover)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(CupertinoIcons.heart,color: Colors.white,size: width*0.06,),
                                        Text(widget.medias[index].likeCount.toString(),style: TextStyle(
                                        fontSize: width*0.03,fontFamily: "Poppins",color: Colors.white))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                         width: width*0.05,
                                            child: Image.asset("assets/comment.png")),
                                        Text(widget.medias[index].commentCount.toString(),style: TextStyle(
                                        fontSize: width*0.03,fontFamily: "Poppins",color: Colors.white))
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: height*0.005,)
                              ],
                            ),
                          ),
                        );

                   },),
                   // Videos Tab
                   Center(
                     child: Text(
                       'No Videos',
                       style: TextStyle(fontSize: 24.0),
                     ),
                   ),
                 ],
               ),
             ),
           )
         ],
       ),
     ),

    );
  }
}
