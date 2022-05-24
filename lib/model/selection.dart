class Selection {
  String image;
  String name;
  Selection({
    required this.image,
    required this.name,
  });
}

// Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: size.height * 0.02,
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(right: 20),
//                         child: Align(
//                           alignment: Alignment.centerRight,
//                           child: Text(
//                             "IMMEDIATE\nNEED?",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   child: Row(
//                                     children: [
//                                       Checkbox(
//                                           activeColor: AppTheme.colorPrimary,
//                                           value: counter,
//                                           onChanged: (val) {
//                                             setState(() {
//                                               counter = val!;
//                                             });
//                                           }),
//                                       GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               !counter
//                                                   ? counter = true
//                                                   : counter = false;
//                                             });
//                                           },
//                                           child: Text(
//                                             "Counter",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText1!
//                                                 .copyWith(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 16,
//                                                   color: AppTheme.darkerText,
//                                                 ),
//                                           )),
//                                     ],
//                                   ),
//                                 ),
//                                 Checkbox(
//                                     activeColor: AppTheme.colorPrimary,
//                                     value: immediate,
//                                     onChanged: (val) {
//                                       setState(() {
//                                         counter
//                                             ? immediate = val!
//                                             : immediate = false;
//                                       });
//                                     }),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   child: Row(
//                                     children: [
//                                       Checkbox(
//                                           activeColor: AppTheme.colorPrimary,
//                                           value: cabinets,
//                                           onChanged: (val) {
//                                             setState(() {
//                                               cabinets = val!;
//                                             });
//                                           }),
//                                       GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               !cabinets
//                                                   ? cabinets = true
//                                                   : cabinets = false;
//                                             });
//                                           },
//                                           child: Text(
//                                             "Cabinets",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText1!
//                                                 .copyWith(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 16,
//                                                   color: AppTheme.darkerText,
//                                                 ),
//                                           )),
//                                     ],
//                                   ),
//                                 ),
//                                 Checkbox(
//                                     activeColor: AppTheme.colorPrimary,
//                                     value: immediate1,
//                                     onChanged: (val) {
//                                       setState(() {
//                                         cabinets
//                                             ? immediate1 = val!
//                                             : immediate1 = false;
//                                       });
//                                     }),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Container(
//                                   child: Row(
//                                     children: [
//                                       Checkbox(
//                                           activeColor: AppTheme.colorPrimary,
//                                           value: floors,
//                                           onChanged: (val) {
//                                             setState(() {
//                                               floors = val!;
//                                             });
//                                           }),
//                                       GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               !floors
//                                                   ? floors = true
//                                                   : floors = false;
//                                             });
//                                           },
//                                           child: Text(
//                                             "Floors",
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyText1!
//                                                 .copyWith(
//                                                   fontWeight: FontWeight.w600,
//                                                   fontSize: 16,
//                                                   color: AppTheme.darkerText,
//                                                 ),
//                                           )),
//                                     ],
//                                   ),
//                                 ),
//                                 Checkbox(
//                                     activeColor: AppTheme.colorPrimary,
//                                     value: immediate2,
//                                     onChanged: (val) {
//                                       setState(() {
//                                         floors
//                                             ? immediate2 = val!
//                                             : immediate2 = false;
//                                       });
//                                     }),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: size.height * 0.03,
//                       ),
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20),
//                         height: size.height * 0.25,
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: AppTheme.grey.withOpacity(0.5),
//                                 width: 2),
//                             // boxShadow: [
//                             //   BoxShadow(
//                             //       color: AppTheme.grey.withOpacity(0.3),
//                             //       blurRadius: 3,
//                             //       spreadRadius: 1,
//                             //       offset: Offset(3, 3))
//                             // ],
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white),
//                         child: TextFormField(
//                           controller: _Attentioncontroller,
//                           minLines: 2,
//                           maxLines: 100,
//                           textInputAction: TextInputAction.done,
//                           cursorColor: AppTheme.colorPrimary,
//                           decoration: InputDecoration(
//                               hintText: "Add note to inspection report",
//                               hintStyle: Theme.of(context).textTheme.bodyText1,
//                               focusedBorder: UnderlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.transparent)),
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.transparent)),
//                               border: UnderlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Colors.transparent))),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),