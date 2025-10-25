import 'package:flutter/material.dart';

class CurrencyConverterr extends StatefulWidget {
  const CurrencyConverterr({super.key});
  @override
  // State<CurrencyConverterr> createState() => _CurrencyConverterPage(); or
  State<CurrencyConverterr> createState() {
    return _CurrencyConverterPage();
  }
}

class _CurrencyConverterPage extends State<CurrencyConverterr> {
  final TextEditingController editingController = TextEditingController();
  double result = 0;
  String selectedValue = '\u0024'; // Initially selected item
  
  List<String> items = ["\u0024", "\u20B9"];
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${selectedValue == '\u20B9' ? '\u0024 ${result != 0 ? (result / 88).toStringAsFixed(2) : '0'}' : '\u20B9 ${result != 0 ? (result * 88).toStringAsFixed(2) : '0'}'}",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              //idhar padding ki place pe container bhi use kar sakte hai
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: editingController,
                showCursor: true,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ), //for input text color
                cursorColor: Colors.black,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black26,
                  hintText: "Enter amount in USDT",
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedValue, //selected value
                        dropdownColor: Colors.black87,
                        iconEnabledColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: items.map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  prefixStyle: TextStyle(color: Colors.white),
                  focusedBorder: border,
                  enabledBorder: border,
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  //   // borderSide: BorderSide.none,
                  //   borderRadius: BorderRadius.all(Radius.circular(25)),
                  // ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  //   borderRadius: BorderRadius.all(Radius.circular(25)),
                  //   // borderRadius: BorderRadius.horizontal(
                  //   //   left: Radius.circular(20),
                  //   // ),
                  // ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black),
                  // ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                //Elevated bhi likh sakte hai
                onPressed: () {
                  // or use debugPrint("Button Clicked");
                  // print("number is ${editingController.text}");
                  // int val = int.parse(editingController.text);//ye nahi kar sakte kyu ki user decimal me bhi input kar sakta hai
                  setState(() {
                    result = double.parse(editingController.text);
                    // print((result * 88).toStringAsFixed(2));
                    // result = (result * 88);
                  });
                },
                // style: ButtonStyle(
                //   elevation: WidgetStatePropertyAll(30),
                //   backgroundColor: WidgetStatePropertyAll(Colors.black),
                //   foregroundColor: WidgetStatePropertyAll(Colors.white),
                //   // fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
                //   minimumSize: WidgetStatePropertyAll(
                //     Size(double.infinity, 50),
                //   ),
                //   shape: WidgetStatePropertyAll(
                //     RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(
                //         15,
                //       ), // 👈 no rounding, pure square
                //     ),
                //   ),
                // ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//1] helper text,label , label text, hint text
//2] prefix , prefix icons , suffix , suffix icons
//3] filled , fill color
//4] focused border , enabled border, or border thoda karna
// focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                   // borderSide: BorderSide.none,
//                 ),
//                 // enabledBorder: UnderlineInputBorder(
//                 //   borderSide: BorderSide(color: Colors.black),
//                 // ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                 ),

// Note me lena :->
// focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                   // borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black),
//                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                   // borderRadius: BorderRadius.horizontal(
//                   //   left: Radius.circular(20),
//                   // ),
//                 ),

// 5] borderRadius: BorderRadius.all(Radius.circular(25)),
// 6] borderRadius: BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(25)),
// 7] ye dekhna hai ki borderRadius ko hum horizontal or vertical dono tarike se bhi de sakte hai
// 8] borderRadius: BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(25)),
// 9] borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius  .circular(25)),.circular(25)),
// 10] ye dekhna hai ki borderRadius ko hum horizontal or vertical dono tarike se bhi de sakte hai

// 11] padding / margin
// 12]fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50)), minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),maximumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),

// 13] shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),),
// 14] Elevatedbutton , textbutton , outlinedbutton

// 14]style : TextButton.styleFrom() -->easy as compared to ButtonStyle

// const MyWidget({Key? key}) : super(key: key); // ✅ initializer list
// const MyWidget({super.key}); //

// Note :->

// Dart/Flutter mein thoda confusing lagta hai, main clear karta hoon:

// 🔹 StatelessWidget

// Immutable hota hai → iska jo bhi field hoga wo final hona chahiye.

// Ek baar ban gaya toh uska andar ka data change nahi hota. Agar data change karna hai toh naya widget instance banana padta hai (rebuild).

// 🔹 StatefulWidget

// Ye bhi immutable hi hota hai ✅
// Matlab iske constructor se jo properties aayi, wo final rahenge, widget object banne ke baad change nahi hote.

// Lekin difference ye hai ki StatefulWidget ek State object ke saath link hota hai.

// 🔹 State

// Mutable hoti hai 🔥

// setState() ke through aap State ke variables change kar sakte ho, aur jab state change hoti hai toh Flutter dobara build() call karta hai.

// 💡 Simple samajh lo:

// Widget (chahe Stateless ho ya Stateful) = immutable blueprint/configuration.

// State (sirf Stateful mein) = wo jagah jaha aap data ko mutable rakh sakte ho.

// Container or sizebox me ye difference hai ki container me hum decoration use kar sakte hai but sizebox me hum decoration use nahi kar sakte hai
// or sizebox const use kar sakte hai but container me const use nahi kar sakte hai

// initState( ) or dispose( ) kya hai?--->ye dekhna
// initState() : Ye method tab call hota hai jab widget pehli baar create hota hai. Yahan aap initial data set kar sakte ho.

// Example :->

// class initStateExample extends StatefulWidget {
//   const initStateExample({super.key});

//   @override
//   State<initStateExample> createState() => _initStateExampleState();
// }

// class _initStateExampleState extends State<initStateExample> {
//   late int a;
//   @override
//   void initState() {
//     super.initState();
//     a = 10; // Initializing 'a' in initState
//     print("initState called, a is initialized to $a");
//   }
//   Widget build(BuildContext context) {
//     return  Scaffold(body: Text(a.toString()),);
//   }
// }

// dispose() : Ye method tab call hota hai jab widget permanently remove ho raha hota hai. Yahan aap resources ko clean up kar sakte ho, jaise ki controllers ko dispose karna.

// Example :->
// @override
// void dispose(){
//   super.dispose();
// }

// didChangeDependencies() : Ye method tab call hota hai jab widget ki dependencies change hoti hain. Ye method initState ke baad aur build se pehle call hota hai. Yahan aapko wo kaam karna chahiye jo aapko har baar dependencies change hone par karna ho.
// didUpdateWidget() : Ye method tab call hota hai jab parent widget apne properties ko change karta hai aur ye widget rebuild hota hai. Yahan aapko wo kaam karna chahiye jo aapko parent ke properties change hone par karna ho.
