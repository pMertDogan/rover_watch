import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/state/galleryVM.dart';

class FilterComponents extends StatelessWidget {
  const FilterComponents({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GalleryVM>(
      builder: (context, galleryVM, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton<String>(
              value: galleryVM.selectedCamAPIName,
              icon: Icon(CupertinoIcons.camera),
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              onChanged: (String selected) {
                galleryVM.selectedCamAPIName = selected;
              },
              items: galleryVM.camOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Container(
              width: 100,
              height: 50,
              child: TextFormField(
                initialValue: galleryVM.solParameter.toString(),
                onFieldSubmitted: (text) => galleryVM.solParameter = int.parse(text),
                decoration: InputDecoration(hintText: "SOL", counterText: ""),
                keyboardType: TextInputType.number,
                maxLength: 3,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
