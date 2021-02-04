import 'package:flutter/material.dart';

class CalculateTipScreen extends StatefulWidget {
  @override
  _CalculateTipScreenState createState() => _CalculateTipScreenState();
}

class _CalculateTipScreenState extends State<CalculateTipScreen> {
  //default amount
  static const _billAmount = 0.0;
  static const _tipPercentage = 15;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _billController =
      new TextEditingController(text: _billAmount.toString());
  TextEditingController _tipPercentageController =
      new TextEditingController(text: _tipPercentage.toString());
//stores latest value of amount
  double billAmount = _billAmount;
  int tipPercentage = _tipPercentage;

  @override
  void initState() {

    super.initState();
    _billController.addListener(onBillAmountChange);
    _tipPercentageController.addListener(onTipPercentChange);
  }

  onBillAmountChange() {
    setState(() {
      billAmount = double.tryParse(_billController.text) ?? 0.0;
    });
  }

  onTipPercentChange() {
    setState(() {
      tipPercentage = int.tryParse(_tipPercentageController.text) ?? 0;
    });
  }
//return a tip amount
  _getTipAmount() => billAmount * tipPercentage / 100;

//return total amount to be paid
  _getTotalAmount() => billAmount + _getTipAmount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Tip Calculator"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: new ListView(
        children: [
          SizedBox(
            height: 150,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _billController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter the Bill Amount',
                        labelText: 'Bill Amount',
                        labelStyle: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _tipPercentageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter the Tip Percentage',
                        labelText: 'Tip Percentage',
                        labelStyle: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tip Amount: " + _getTipAmount().toString(),
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 22),
                            ),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Total Amount: " + _getTotalAmount().toString(),
                              style: TextStyle(
                                  color: Colors.blueGrey.shade800,
                                  fontSize: 22),
                            ),)],))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
