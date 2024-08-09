import 'package:flutter/material.dart';
import 'confirmation.dart';

class TicketDetails extends StatefulWidget {
  final String fromStation;
  final String toStation;
  final String trainNumber;
  final double fare;
  final DateTime date;
  final String onboardingTime;
  final String arrivalTime;
  final int numberOfTickets;

  TicketDetails({
    required this.fromStation,
    required this.toStation,
    required this.trainNumber,
    required this.fare,
    required this.date,
    required this.onboardingTime,
    required this.arrivalTime,
    required this.numberOfTickets,
  });

  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  late int _numberOfTickets;
  late double _totalFare;
  String _selectedPaymentMethod = 'Metro Card';

  @override
  void initState() {
    super.initState();
    _numberOfTickets = widget.numberOfTickets;
    _totalFare = widget.fare * _numberOfTickets;
  }

  void _updateFare(int count) {
    setState(() {
      _numberOfTickets = count;
      _totalFare = widget.fare * _numberOfTickets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.35, 0.35],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 40),

                Text(
                  'Ticket Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(height: 15),
                                    Text('One Way'),
                                    SizedBox(width: 10),
                                    Text('Round'),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'From',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                Text(widget.fromStation,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                SizedBox(height: 15),
                                Text(
                                  'To',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.toStation,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  'Route info',
                                  style: TextStyle(color: Colors.green),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Onboarding',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.onboardingTime,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  'Arrival',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                Text(
                                  widget.arrivalTime,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 15),
                              Text(
                                'Train No.',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 14),
                              ),
                              Text(
                                widget.trainNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 14),
                              ),
                              Text(
                                '${widget.date.day}/${widget.date.month}/${widget.date.year}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 18),
                              Text(
                                'Fare',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal, fontSize: 14),
                              ),
                              Text(
                                'BDT ${widget.fare.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.green),
                              ),
                              SizedBox(height: 15),
                              Text('No. of Ticket'),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove_circle_rounded,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (_numberOfTickets > 1) {
                                        _updateFare(_numberOfTickets - 1);
                                      }
                                    },
                                  ),
                                  Text('$_numberOfTickets'),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_box,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      _updateFare(_numberOfTickets + 1);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(color: Colors.green[100]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.green,
                            ),
                            child: Text(
                              'BDT ${_totalFare.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth * 0.9,
                      child: Divider(
                        color: Colors.green[200],
                        thickness: 2.0,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      RadioListTile<String>(
                        title: const Text('Metro Card'),
                        value: 'Metro Card',
                        groupValue: _selectedPaymentMethod,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedPaymentMethod = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('bKash'),
                        value: 'bKash',
                        groupValue: _selectedPaymentMethod,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedPaymentMethod = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Visa/Master Card'),
                        value: 'Visa/Master Card',
                        groupValue: _selectedPaymentMethod,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedPaymentMethod = value!;
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () {



                        },
                        child: Text(
                          'Add Payment Method',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Confirmation(
                              fromStation: widget.fromStation,
                              toStation: widget.toStation,
                              trainNumber: widget.trainNumber,
                              fare: widget.fare,
                              date: widget.date,
                              onboardingTime: widget.onboardingTime,
                              arrivalTime: widget.arrivalTime,
                              numberOfTickets: _numberOfTickets,
                              // totalFare: _totalFare,
                            ),
                          ),
                        );
                          // Handle Make Payment
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text('Make Payment'),
                      ),
                      SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () {
                          // Handle Save For Later
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          side: BorderSide(color: Colors.green),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text('Save For Later'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
