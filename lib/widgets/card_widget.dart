import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  var image;
  var titlename;
  var coursename;
  var session;
  var type;
  var lock;

  CardWidget(this.image, this.titlename, this.coursename, this.session, this.type,
      {this.lock = false});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
          height: 260,
          width: 310,
          child: Card(
            color: Colors.white,
            elevation: 4,
            shadowColor: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.image,
                  width: MediaQuery.of(context).size.width/1,
                  fit: BoxFit.cover,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        widget.titlename,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    widget.coursename,
                    style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
                Row(
                  children: [
                    Text(widget.session),
                    Spacer(),
                    widget.type == 0
                        ? Container()
                        : widget.type == 1
                            ? Container(
                                height: 15,
                                width: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "book",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              )
                            : widget.lock
                                ? Icon(Icons.lock,size: 15,)
                                : Icon(Icons.lock_open,size: 15),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
