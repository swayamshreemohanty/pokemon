// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchTextField extends StatefulWidget {
  final String? hint;
  final FocusNode? focusNode;
  final bool dataLoading;
  final void Function(String text) onQuery;
  final int waitingMilliSeconds;
  final TextEditingController? controller;
  final Widget? extraSuffixIcon;
  final Color? fillColor;
  final Color? searchIconColor;
  const SearchTextField({
    super.key,
    this.hint,
    this.focusNode,
    this.waitingMilliSeconds = 500,
    this.dataLoading = false,
    required this.onQuery,
    this.controller,
    this.extraSuffixIcon,
    this.fillColor,
    this.searchIconColor,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late TextEditingController searchController =
      widget.controller ?? TextEditingController();

  Timer? timer;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, textFieldState) {
      return TextFormField(
        focusNode: widget.focusNode,
        controller: searchController,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          filled: true,
          fillColor: widget.fillColor ?? Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            FeatherIcons.search,
            color: widget.searchIconColor ??
                const Color.fromRGBO(193, 193, 194, 1),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (searchController.text.isNotEmpty)
                widget.dataLoading
                    ? SizedBox(
                        width: 20,
                        child: SpinKitFadingCircle(size: 25),
                      )
                    : GestureDetector(
                        onTap: searchController.text.trim().isEmpty
                            ? null
                            : () {
                                searchController.clear();
                                FocusScope.of(context).unfocus();
                                widget.onQuery.call("");
                              },
                        child: const Icon(Icons.cancel),
                      ),
              if (widget.extraSuffixIcon != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: widget.extraSuffixIcon!,
                ),
            ],
          ),
        ),
        onChanged: (value) {
          if (value.isEmpty) {
            if (timer != null && timer!.isActive) {
              timer!.cancel();
            }
            widget.onQuery.call(value);
          } else {
            if (timer != null && timer!.isActive) {
              timer!.cancel();
            }
            timer =
                Timer(Duration(milliseconds: widget.waitingMilliSeconds), () {
              // Call method here after defined milliseconds of no activity in the text field
              widget.onQuery.call(value);
            });
          }
          textFieldState(() {});
        },
      );
    });
  }
}
