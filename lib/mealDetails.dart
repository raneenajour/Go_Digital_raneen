import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class details extends StatefulWidget {
  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  int quantity = 1;
  double sizePrice = 0;
  int selectedSizeIndex = 100;
  List<int> selectedIndexes = [];
  double basePrice = 21.00;
  String totalText = "21,00";
  double totalPrice = 21.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              child: Image.network(
                                  "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGl6emF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"
                                ,height: 200,fit: BoxFit.cover,width: double.infinity,)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                              const EdgeInsets.only(top: 30, right: 20),
                              child: Text("بيتزا بالخضار ",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text("بيتزا بالخضار مميزة ",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 10),
                                  child: Container(
                                    width: 120,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              // زيادة الكمية بمقدار واحد
                                              if (quantity < 10) {
                                                quantity++;
                                                totalPrice = 21.00 * quantity;
                                                // تحديث السعر الإجمالي
                                                totalText =
                                                    totalPrice.toStringAsFixed(
                                                        2);
                                                basePrice = totalPrice;
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            size: 18,
                                            color: Colors.lightBlueAccent,
                                          ),
                                        ),
                                        Text("$quantity",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              // نقص الكمية بمقدار واحد
                                              if (quantity > 1) {
                                                quantity--;
                                                totalPrice = 21.00 * quantity;
                                                totalText =
                                                    totalPrice.toStringAsFixed(2);
                                                basePrice = totalPrice;
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            size: 18,
                                            color: Colors.lightBlueAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 35),
                                child: Row(
                                  children: [
                                    // Text("د.ا"),
                                    Text("د.ا${totalPrice.toStringAsFixed(2)} د.أ"),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(height: 10,color: Colors.grey,),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200.0),
              child: Text(":اختيارك من الحجم (اختياري)", style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold)),
            ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "صنف${index + 1}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Text("${index * 9}د.أ"),
                          Radio(
                            value: index,
                            groupValue: selectedSizeIndex,
                            onChanged: (v) {
                              setState(() {
                                selectedSizeIndex = index;
                                if (index == 0) {
                                  sizePrice = 0;
                                } else if (index == 1) {
                                  sizePrice = 9;
                                } else {
                                  sizePrice = 18;
                                }
                                totalPrice = basePrice + sizePrice;
                              });
                            },
                          )
                        ],
                      ),
                    );
                  })
,        Container(height: 10,color: Colors.grey,),

            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 190.0),
                      child: Text("اختيارك من الاضافات ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Text("(اختياري)",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey))
                  ],
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "صنف${index + 1}",
                              style: TextStyle(fontSize: 18),
                            ),
                            Spacer(),
                            Text("${index * 9}د.أ"),
                            Checkbox(
                                value: selectedIndexes.contains(index),
                                onChanged: (v) {
                                  if (selectedIndexes.contains(index)) {
                                    selectedIndexes.remove(index);
                                  } else {
                                    selectedIndexes.add(index);
                                  }
                                  double additionsPrice = selectedIndexes.length * 9.0;
                                  totalPrice = basePrice + sizePrice + additionsPrice;
                                  setState(() {

                                  });
                                })
                          ],
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: ElevatedButton(

                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      primary: Colors.blue[300]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "21,00",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "أضف إلى السلة",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )


              ],
            ),
          ],
        ),
      ),
    );
  }
}
