import 'package:flutter/material.dart';

import '../functions/fetchrates.dart';

class Anytoany extends StatefulWidget {
  final rates;
  final Map currencies;
  const Anytoany({super.key, this.rates, required this.currencies});

  @override
  State<Anytoany> createState() => _AnytoanyState();
}

class _AnytoanyState extends State<Anytoany> {
  TextEditingController AmountController = TextEditingController();
  String dropdownValue1 = 'USD';
  String dropdownValue2 = 'AUD';
  String answer = 'Converted Currency Will Show here :';
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.transparent,
      child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.min,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Converte Any Currnecy',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('usd'),
                controller: AmountController,
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
                        value: dropdownValue1,
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
                            dropdownValue1 = newValue!;
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
                  Expanded(
                    child: DropdownButton<String>(
                        dropdownColor: Colors.black,
                        value: dropdownValue2,
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
                            dropdownValue2 = newValue!;
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
                 
                ],
              ),
               Container(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          answer =AmountController.text +
                              ' ' +
                              dropdownValue1 +'  =  '+
                              convertany(widget.rates, AmountController.text,
                                  dropdownValue1, dropdownValue2) +
                              ' ' +
                              dropdownValue2;
                        });
                      },
                      child: const Text('Convert',style: TextStyle(fontSize: 30),),
                    ),
                  ),
              const SizedBox(height: 20),
              Container(
                child: Text(
                  answer,
                  style: const TextStyle(color: Colors.white,fontSize: 30),
                ),
              )
            ],
          )),
    );
  }
}
