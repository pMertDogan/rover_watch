import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rover_watch/state/camFilter/cam_filter_cubit.dart';
import 'package:rover_watch/state/sol/sol_cubit.dart';

class FilterComponents extends StatelessWidget {
  const FilterComponents({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<CamFilterCubit, CamFilterState>(
          builder: (context, state) {
            //tersi kurulup as ler kaldırılabilir
            return state is CamFilterInitial
                ? CircularProgressIndicator()
                : DropdownButton<String>(
                    value: (state as UpdatedCamFilter).selected,
                    icon: Icon(CupertinoIcons.camera),
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    onChanged: (String selected) {
                      context
                          .read<CamFilterCubit>()
                          .updateCamSelection(selected);
                    },
                    items: (state as UpdatedCamFilter)
                        .options
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
          },
        ),
        Row(
          children: [
            Text("SOL: "),
            Container(
              width: 50,
              height: 30,
              child: BlocBuilder<SolCubit, int>(
                builder: (context, state) {
                  return TextFormField(
                    initialValue: state.toString(),
                    onFieldSubmitted: (text) => context
                        .read<SolCubit>()
                        .solGuncellendi(int.parse(text)),
                    decoration:
                        InputDecoration(hintText: "SOL", counterText: ""),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
