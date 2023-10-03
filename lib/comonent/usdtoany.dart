import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';

class UseToAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const UseToAny({super.key, this.rates, required this.currencies});

  @override
  State<UseToAny> createState() => _UseToAnyState();
}

class _UseToAnyState extends State<UseToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'INR';
  String answer = 'Converted Currency';
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Usd To Any Currnecy',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
               
                key: const Key('usd'),
                controller: usdController,
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white,fontSize: 25),
                decoration: const InputDecoration(
                  hintText: 'Enter Usd',
                  hintStyle: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                        dropdownColor: Colors.black,
                        value: dropdownValue,
                        style: const TextStyle(color: Colors.white,fontSize: 25),
                        icon: const Icon(
                          Icons.arrow_drop_down_circle_rounded,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          color: Colors.grey,
                          height: 2,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: widget.currencies.keys
                            .toSet()
                            .toList()
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList()),
                  ),
                  const SizedBox(height: 20),
                 
                ],
              ),
               Container(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          answer = usdController.text + 'USD    =     ' + convertusd(widget.rates, usdController.text, dropdownValue) + ' ' + dropdownValue;
                        });
                      },
                      child:const Text('Convert',style: TextStyle(fontSize: 30),),
                     
                    ),
                  ),
              const SizedBox(height :20),
              Container(child: Text(answer , style:const TextStyle(color: Colors.white,fontSize: 30),),)
            ],
          )
          ),
    );
  }
}
