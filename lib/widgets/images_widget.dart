import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/widgets/image_source_sheet.dart';

class ImagesWidget extends FormField<List> {
  ImagesWidget({
    FormFieldSetter<List> onSaved,
    FormFieldValidator<List> validator,
    List initialValue,
    bool autoValidate = false,
    BuildContext context,
  }) : super(
      onSaved: onSaved,
      validator: validator,
      initialValue: initialValue,
      autovalidate: autoValidate,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 124.0,
              padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: state.value.map<Widget>((i) {
                  return Container(
                    height: 100.0,
                    width: 100.0,
                    margin: EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      child: i is String
                          ? Image.network(i, fit: BoxFit.cover)
                          : Image.file(i, fit: BoxFit.cover),
                      onLongPress: () {
                        state.didChange(state.value..remove(i));
                      },
                    ),
                  );
                }).toList()
                  ..add(GestureDetector(
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      child: Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                      ),
                      color: Colors.white.withAlpha(50),
                    ),
                    onTap: () {
                      showModalBottomSheet(context: context,
                          builder: (context) =>
                              ImageSourceSheet(
                                onImageSelected: (image) {
                                  state.didChange(state.value..add(image));
                                  Navigator.of(context).pop();
                                },
                              ));
                    },
                  )),
              ),
            ),
            state.hasError ? Text(
              state.errorText,
              style: TextStyle(color: Colors.red, fontSize: 12.0),
            ) : Container(),
          ],
        );
      });
}
