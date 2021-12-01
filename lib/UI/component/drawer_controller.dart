import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DrawerIndex {
  HOME,
  // Payment,
  YourServices,
  Wallet,
  // Passbook,
  Settings,
  Help,
  Refer,
}

class DrawerUserController extends StatefulWidget {
  const DrawerUserController({
    Key? key,
    this.drawerWidth = 250,
    required this.onDrawerCall,
    required this.screenView,
    this.animatedIconData = AnimatedIcons.arrow_menu,
    required this.menuView,
    required this.drawerIsOpen,
    required this.screenIndex,
  }) : super(key: key);

  final double drawerWidth;
  final Function(DrawerIndex) onDrawerCall;
  final Widget screenView;
  final Function(bool) drawerIsOpen;
  final AnimatedIconData animatedIconData;
  final Widget menuView;
  final DrawerIndex screenIndex;

  @override
  _DrawerUserControllerState createState() => _DrawerUserControllerState();
}

class _DrawerUserControllerState extends State<DrawerUserController>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  late AnimationController iconAnimationController;
  late AnimationController animationController;

  double scrolloffset = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 0));
    iconAnimationController
      ..animateTo(1.0,
          duration: const Duration(milliseconds: 0),
          curve: Curves.fastOutSlowIn);
    scrollController =
        ScrollController(initialScrollOffset: widget.drawerWidth);
    scrollController
      ..addListener(() {
        if (scrollController.offset <= 0) {
          if (scrolloffset != 1.0) {
            setState(() {
              scrolloffset = 1.0;
              try {
                widget.drawerIsOpen(true);
              } catch (_) {}
            });
          }
          iconAnimationController.animateTo(0.0,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        } else if (scrollController.offset > 0 &&
            scrollController.offset < widget.drawerWidth.floor()) {
          iconAnimationController.animateTo(
              (scrollController.offset * 100 / (widget.drawerWidth)) / 100,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        } else {
          if (scrolloffset != 0.0) {
            setState(() {
              scrolloffset = 0.0;
              try {
                widget.drawerIsOpen(false);
              } catch (_) {}
            });
          }
          iconAnimationController.animateTo(1.0,
              duration: const Duration(milliseconds: 0),
              curve: Curves.fastOutSlowIn);
        }
      });
    WidgetsBinding.instance!.addPostFrameCallback((_) => getInitState());
    super.initState();
  }

  Future<bool> getInitState() async {
    scrollController.jumpTo(
      widget.drawerWidth,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width + widget.drawerWidth,
          //we use with as screen width and add drawerWidth (from navigation_home_screen)
          child: Row(
            children: <Widget>[
              SizedBox(
                width: widget.drawerWidth,
                //we divided first drawer Width with HomeDrawer and second full-screen Width with all home screen, we called screen View
                height: MediaQuery.of(context).size.height,
                child: AnimatedBuilder(
                  animation: iconAnimationController,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      //transform we use for the stable drawer  we, not need to move with scroll view
                      transform: Matrix4.translationValues(
                          scrollController.offset, 0.0, 0.0),
                      child: HomeDrawer(
                        screenIndex: widget.screenIndex == null
                            ? DrawerIndex.HOME
                            : widget.screenIndex,
                        iconAnimationController: iconAnimationController,
                        callBackIndex: (DrawerIndex indexType) {
                          onDrawerClick();
                          try {
                            widget.onDrawerCall(indexType);
                          } catch (e) {}
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                //full-screen Width with widget.screenView
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.6), blurRadius: 54),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      //this IgnorePointer we use as touch(user Interface) widget.screen View, for example scrolloffset == 1 means drawer is close we just allow touching all widget.screen View
                      IgnorePointer(
                        ignoring: scrolloffset == 1 || false,
                        child: widget.screenView,
                      ),
                      //alternative touch(user Interface) for widget.screen, for example, drawer is close we need to tap on a few home screen area and close the drawer
                      if (scrolloffset == 1.0)
                        InkWell(
                          onTap: () {
                            onDrawerClick();
                          },
                        ),
                      // this just menu and arrow icon animation

                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top + 8,
                            left: 0),
                        child: SizedBox(
                          width: AppBar().preferredSize.height - 8,
                          height: AppBar().preferredSize.height - 8,
                          child: Material(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                  AppBar().preferredSize.height),
                              child: Center(
                                // if you use your own menu view UI you add form initialization
                                child: widget.menuView != null
                                    ? widget.menuView
                                    : AnimatedIcon(
                                        icon: widget.animatedIconData != null
                                            ? widget.animatedIconData
                                            : AnimatedIcons.close_menu,
                                        color: Colors.white,
                                        progress: iconAnimationController),
                              ),
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                onDrawerClick();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDrawerClick() {
    //if scrollcontroller.offset != 0.0 then we set to closed the drawer(with animation to offset zero position) if is not 1 then open the drawer
    if (scrollController.offset != 0.0) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}

class HomeDrawer extends StatefulWidget {
  const HomeDrawer(
      {Key? key,
      required this.screenIndex,
      required this.iconAnimationController,
      required this.callBackIndex})
      : super(key: key);

  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBackIndex;

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<DrawerList> drawerList = [];
  // SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    initprefs();
    setDrawerListArray();
  }

  Future<void> initprefs() async {
    // prefs = await SharedPreferences.getInstance();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.HOME,
        labelName: 'Home',
        icon: Icon(Icons.home),
      ),
      /*DrawerList(
        index: DrawerIndex.Payment,
        labelName: 'Payment',
        icon: Icon(CupertinoIcons.creditcard),
      ),*/
      DrawerList(
        index: DrawerIndex.YourServices,
        labelName: 'Your Services',
        icon: Icon(Icons.select_all_rounded),
      ),
      DrawerList(
        index: DrawerIndex.Wallet,
        labelName: 'Wallet',
        icon: Icon(Icons.account_balance_wallet_outlined),
      ),
      /* DrawerList(
        index: DrawerIndex.Passbook,
        labelName: 'Passbook',
        icon: Icon(CupertinoIcons.book),
      ),*/
      DrawerList(
        index: DrawerIndex.Settings,
        labelName: 'Settings',
        icon: Icon(CupertinoIcons.settings),
      ),
      DrawerList(
        index: DrawerIndex.Help,
        labelName: 'Help',
        icon: Icon(CupertinoIcons.info),
      ),
      DrawerList(
        index: DrawerIndex.Refer,
        labelName: 'Refer',
        icon: Icon(CupertinoIcons.share),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topRight,
                  colors: [Colors.red, Colors.red])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AnimatedBuilder(
                            animation: widget.iconAnimationController,
                            builder: (BuildContext context, Widget? child) {
                              return ScaleTransition(
                                  scale: AlwaysStoppedAnimation<double>(1.0 -
                                      (widget.iconAnimationController.value) *
                                          0.2),
                                  child: RotationTransition(
                                    turns: AlwaysStoppedAnimation<double>(Tween<
                                                double>(begin: 0.0, end: 24.0)
                                            .animate(CurvedAnimation(
                                                parent: widget
                                                    .iconAnimationController,
                                                curve: Curves.fastOutSlowIn))
                                            .value /
                                        360),
                                    child: Image.asset(
                                      'assets/images/userImage.png',
                                      height: 50,
                                      width: 50,
                                    ),
                                  ));
                            },
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 10),
                                  child: Text(
                                    "domnic"
                                            " " +
                                        "lakra",
                                    maxLines: 2,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 2, left: 10),
                                  child: Text(
                                    "email",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Divider(
                height: 1,
                color: Colors.white.withOpacity(0.3),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(0.0),
                  itemCount: drawerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return inkwell(drawerList[index]);
                  },
                ),
              ),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.6),
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Sign Out',
                      style: TextStyle(
                        // fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    trailing: Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                    ),
                    onTap: () {
                      // _logoutDialog();
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom,
                  )
                ],
              ),
            ],
          ),
        ));
  }

  // Future<void> _logoutDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return CupertinoAlertDialog(
  //         title: Text('Logout'),
  //         content: Text('Are you sure you want to logout?'),
  //         actions: <Widget>[
  //           CupertinoDialogAction(
  //             child: Text('No'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           CupertinoDialogAction(
  //             child: Text('Yes'),
  //             onPressed: () async {
  //               Navigator.of(context).pop();

  //               SharedPreferences prefs = await SharedPreferences.getInstance();

  //               prefs.remove(SharedPrefsKeys.USER_ID);
  //               prefs.remove(SharedPrefsKeys.LAST_NAME);
  //               prefs.remove(SharedPrefsKeys.FIRST_NAME);
  //               prefs.remove(SharedPrefsKeys.EMAIL_ADDRESS);
  //               prefs.remove(SharedPrefsKeys.ACCESS_TOKEN);
  //               prefs.remove(SharedPrefsKeys.TOKEN_TYPE);
  //               prefs.remove(SharedPrefsKeys.LOGEDIN);
  //               prefs.setInt(SharedPrefsKeys.LOGEDIN_STATUS, 1);
  //               Navigator.pushReplacement(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) {
  //                     return LoginScreen();
  //                   },
  //                 ),
  //               );
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoScreen(listData.index);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 6.0,
                    height: 46.0,
                    // decoration: BoxDecoration(
                    //   color: widget.screenIndex == listData.index
                    //       ? Colors.blue
                    //       : Colors.transparent,
                    //   borderRadius: new BorderRadius.only(
                    //     topLeft: Radius.circular(0),
                    //     topRight: Radius.circular(16),
                    //     bottomLeft: Radius.circular(0),
                    //     bottomRight: Radius.circular(16),
                    //   ),
                    // ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  listData.isAssetsImage
                      ? Container(
                          width: 24,
                          height: 24,
                          child: Image.asset(listData.imageName,
                              color: widget.screenIndex == listData.index
                                  ? Colors.white
                                  : Colors.red),
                        )
                      : Icon(listData.icon.icon,
                          color: widget.screenIndex == listData.index
                              ? Colors.white
                              : Colors.red),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: widget.screenIndex == listData.index
                          ? Colors.white
                          : Colors.red,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            widget.screenIndex == listData.index
                ? AnimatedBuilder(
                    animation: widget.iconAnimationController,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) *
                                (1.0 -
                                    widget.iconAnimationController.value -
                                    1.0),
                            0.0,
                            0.0),
                        child: Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * 0.75 - 64,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius: new BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(28),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
    widget.callBackIndex(indexScreen);
  }
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    required this.icon,
    required this.index,
    this.imageName = '',
  });

  String labelName;
  Icon icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex index;
}
