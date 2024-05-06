import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seclob_task/core/error_text.dart';
import 'package:seclob_task/core/loader.dart';
import 'package:seclob_task/features/home/controller/home_controller.dart';
import 'package:seclob_task/features/home/screen/tabs/constant.dart';
import 'package:seclob_task/features/home/screen/tabs/profile_page.dart';
import 'package:http/http.dart' as http;
import '../../../core/constant/global_constants.dart';
final indexProvider = StateProvider<int>((ref) {
  return 0;
});
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  void initState() {
    _pageController = PageController(initialPage: ref.read(indexProvider));
    super.initState();
  }
  PageController? _pageController;
  @override
  Widget build(BuildContext context) {
    final selectIndex = ref.watch(indexProvider);
    return WillPopScope(
      onWillPop: () async {
        if (selectIndex == 0) {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Exit App',

                ),
                content: const Text(
                  'Are you sure you want to exit the app?',

                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text(
                      'Exit',
                    ),
                  ),
                ],
              );
            },
          ).then((value) {
            if (value == true) {
              return true;
            } else {
              return false;
            }
          });
        } else {
          _pageController?.animateToPage(
            0,
            duration: const Duration(milliseconds: 10), // Increase the duration
            curve: Curves.easeInOut,
          );
          ref.read(indexProvider.notifier).update((state) => 0);
          return false;
        }
      },
      child: Consumer(
        builder: (context,ref,child) {
          return ref.watch(fetchDataProvider).when(data: (data) {
            return Scaffold(
              body: PageView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                controller: _pageController,
                onPageChanged: (index) {
                  ref.read(indexProvider.notifier).update((state) => state = index);
                },
                children:  [
                  ConstPage(),
                  ConstPage(),
                  ConstPage(),
                  ConstPage(),
                  ProfilePage(medias: data,)
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                showSelectedLabels: true,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: primaryColor,
                currentIndex: selectIndex,
                onTap: (i) {
                  _pageController?.animateToPage(
                    i,
                    duration:
                    const Duration(milliseconds: 10), // Increase the duration
                    curve: Curves.easeInOut,
                  );
                  ref.read(indexProvider.notifier).update((state) => state = i);
                },
                items: [

                  BottomNavigationBarItem(

                    backgroundColor: primaryColor,
                    icon: Image.asset("assets/home.png",width: width*0.08,),
                    label: '-',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: primaryColor,
                    icon: Image.asset("assets/search.png",width: width*0.08,),
                    label: '-',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: primaryColor,
                    icon: Image.asset("assets/image.png",width: width*0.08,),
                    label: '-',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: primaryColor,
                    icon: Image.asset("assets/video.png",width: width*0.08,),
                    label: "-",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: primaryColor,
                    icon:CircleAvatar(
                      radius: width*0.047,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: width*0.043,
                        backgroundImage: NetworkImage(data[0].profilePic),
                      ),
                    ),

                    label: '-',
                  ),
                ],
              ),
            );
          }, error: (error, stackTrace) {
            return ErrorText(error: error.toString());
          }, loading: () => Loader(),);

        }
      ),
    );
  }
}
