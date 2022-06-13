import 'dart:math' as math;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  @override
  State createState() {
    return FAQState();
  }
}

class FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black45),
        title: Container(
          margin: EdgeInsets.only(right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("News", style: TextStyle(color: Colors.blue)), Text("App", style: TextStyle(color: Colors.black))],
          ),
        ),
        actions: <Widget>[Container(padding: EdgeInsets.symmetric(horizontal: 16))],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Card1(),
            Card2(),
            Card3(),
            Card4(),
          ],
        ),
      ),
    );
  }
}

const wyszukiwanie =
    "Aby wyszukać artykuły należy: \n 1.Przejść do ekranu głównego\n2. Kliknąć ikonę wyszukiwania znajdującą się w prawym górnym rogu ekranu, bądź rozwinąć panel boczny i wybrać przycisk wyszukiwania\n3. W polu wyszukiwania wpisać słowa kluczowe\n4. Kliknąć przycisk 'Wyszukaj'";

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child:
                        Text("Jak wyszukać artykuły?", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15))),
                collapsed: Text(
                  wyszukiwanie,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          wyszukiwanie,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

const addfav =
    "Aby dodać artykuł do ulubionych należy: \n 1.Otworzyć interesujący nas artykuł\n2. Kliknąć ikonę '+' znajdującą się w prawym górnym rogu ekranu\n3. Po pomyślnym dodaniu artykułu do ulubionych na dole ekranu wyświetli się komunikat 'Dodano do ulubionych' ";

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Jak dodać artykuł do ulubionych?",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15))),
                collapsed: Text(
                  addfav,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          addfav,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

const remfav =
    "Aby usunąć artykuł z ulubionych należy: \n 1.Przejść do ekranu 'Ulubione'\n2. W ekranie wyświetlą się wszystkie polubione artykuły. W lewym górnym rogu widnieje ikona '-'\n3. Po kliknięciu w ikonę '-' następuje usunięcie artykułu z ulubionych";

class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Jak usunąć artykuł z ulubionych?",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15))),
                collapsed: Text(
                  remfav,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          remfav,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

const getcat =
    "Aby filtrować artykułu pod kątem kategorii należy: \n 1. Przejść do ekanu głównego\n 2. Na górze ekranu wyświetlone są nazwy wybranch kategorii, po kliknięciu w jedną z nich zostanie otworzone okno z artykułami z danej kategorii";

class Card4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Jak filtrować artykuły pod kątem kategorii",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15))),
                collapsed: Text(
                  getcat,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          getcat,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
