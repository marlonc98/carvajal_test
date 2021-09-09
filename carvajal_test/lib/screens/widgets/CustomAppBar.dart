import 'dart:convert';

import 'package:carvajal_test/GlobalVars/Language/AppLocalizations.dart';
import 'package:carvajal_test/GlobalVars/Language/KeyWordsLocalization.dart';
import 'package:carvajal_test/screens/widgets/CustomAppDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final Function(String word)? onChangeSearch;
  final bool allowSearch;
  final List? results;
  final bool showAppDrawer;
  CustomAppBar(
      {key,
      required this.title,
      this.allowSearch = false,
      this.showAppDrawer = false,
      this.results,
      this.onChangeSearch})
      : super(key: key);
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool searchMode = false;
  TextEditingController _textEditingController = new TextEditingController();
  late FocusNode focusSearch;

  _handleSearch() {
    if (!searchMode) {
      this.focusSearch.requestFocus();
    }
    setState(() {
      searchMode = !searchMode;
    });
  }

  @override
  void initState() {
    super.initState();
    this.focusSearch = FocusNode();
  }

  @override
  void dispose() {
    this.focusSearch.dispose();
    super.dispose();
  }

  @override
  SliverPadding build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 8),
      sliver: SliverAppBar(
        elevation: 16,
        floating: true,
        pinned: true,
        snap: true,
        expandedHeight: widget.results != null ? 80 : 0,
        flexibleSpace: widget.results != null
            ? FlexibleSpaceBar(
                background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text(localization.translate(
                        keyText: KeyWordsLocalization.CustomAppBarCountResults,
                        values: {"results": widget.results?.length})),
                  ),
                ],
              ))
            : null,
            automaticallyImplyLeading: !this.searchMode,
        leading:  !this.searchMode
            ? (widget.showAppDrawer ? IconButton(onPressed: () => Scaffold.of(context).openDrawer(), icon: Icon(Icons.account_circle_outlined, color: Colors.black,)) : BackButton(
                color: Colors.black,
              ))
            : null,
            actions: [widget.allowSearch ? (
              this.searchMode ?
              TextButton(onPressed: _handleSearch, child: Text(localization.translate(keyText: KeyWordsLocalization.cancel)))
              :IconButton(onPressed: _handleSearch, icon: Icon(Icons.search, color: Colors.black,))
            ) :Container()],
        title: this.searchMode
            ? CupertinoSearchTextField(
                focusNode: this.focusSearch,
                controller: _textEditingController,
                onSubmitted: (String value) =>
                    widget.onChangeSearch?..call(value),
              )
            : Text(
                widget.title,
                style: TextStyle(color: Colors.black),
              ),
      ),
    );
  }
}
