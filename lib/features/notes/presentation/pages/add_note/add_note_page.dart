import 'package:clean_architecture_notes_app/core/constant/colos.dart';
import 'package:clean_architecture_notes_app/features/notes/domain/entities/add_note_entity.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/notes_bloc/bloc/notes_bloc.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key, this.note});
  final AddNoteEntity? note;
  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late ValueNotifier<int> _color;
  ValueNotifier<String> _title = ValueNotifier('');
  ValueNotifier<String> _body = ValueNotifier('');
  @override
  void initState() {
    super.initState();
    _color = ValueNotifier(colorsValues.first);
    if (widget.note != null) {
      _color = ValueNotifier(widget.note!.color);
      _title.value = widget.note?.title ?? '';
      _body.value = widget.note?.body ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'gg',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: widget.note != null
            ? const Icon(Icons.edit)
            : const Icon(Icons.add),
        onPressed: () {
          context.read<NotesBloc>().add(AddNoteEvent(AddNoteEntity(
              id: widget.note?.id,
              date: DateTime.now(),
              title: _title.value,
              body: _body.value,
              color: _color.value)));
        },
      ),
      body: ListenableBuilder(
          listenable: _color,
          builder: (context, child) {
            return AnimatedContainer(
              duration: const Duration(
                milliseconds: 500,
              ),
              color: Color(_color.value),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back)),
                      )),
                  ColorListWidget(
                    function: (colorValue) {
                      _color.value = colorValue;
                    },
                    selectedColor: colorsValues
                        .indexWhere((element) => element == widget.note?.color),
                  ),
                  SizedBox(width: 0.0, height: size.height * 0.1),
                  SizedBox(
                    width: size.width * 0.9,
                    child: CustomizedTextField(
                      initValue: _title.value,
                      onChanged: (value) {
                        _title.value = value;
                      },
                      max: 1,
                      hintText: 'Title',
                    ),
                  ),
                  SizedBox(width: 0.0, height: size.height * 0.1),
                  SizedBox(
                    width: size.width * 0.9,
                    child: CustomizedTextField(
                      initValue: _body.value,
                      onChanged: (value) {
                        _body.value = value;
                      },
                      max: 7,
                      hintText: 'Description',
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ColorListWidget extends StatefulWidget {
  const ColorListWidget(
      {super.key, required this.function, this.selectedColor});
  final Function(int colorValue) function;
  final int? selectedColor;
  @override
  State<ColorListWidget> createState() => _ColorListWidgetState();
}

class _ColorListWidgetState extends State<ColorListWidget> {
  int? _selectedColor = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.selectedColor != -1) {
      _selectedColor = widget.selectedColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FractionallySizedBox(
        heightFactor: 0.3,
        widthFactor: 1,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemCount: colorsValues.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 20.0, height: 0.0);
          },
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                widget.function(colorsValues[index]);

                setState(() {
                  _selectedColor = index;
                });
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    border: _selectedColor == index
                        ? Border.all(
                            width: 3,
                          )
                        : null,
                    color: Color(colorsValues[index]),
                    shape: BoxShape.circle),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomizedTextField extends StatelessWidget {
  const CustomizedTextField(
      {super.key,
      required this.hintText,
      this.initValue = '',
      required this.max,
      required this.onChanged});
  final String hintText;
  final int max;
  final String? initValue;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: max,
      controller: TextEditingController(text: initValue),
      onChanged: onChanged,
      maxLines: 8,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          focusColor: Colors.transparent,
          enabledBorder: null,
          border: null,
          focusedBorder: null,
          disabledBorder: null),
    );
  }
}
