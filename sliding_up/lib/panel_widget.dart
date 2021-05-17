import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelcontroller;
  const PanelWidget({this.controller, this.panelcontroller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 14,
        ),
        buildDragHandler(),
        SizedBox(
          height: 36,
        ),
        buildAboutText(),
        SizedBox(
          height: 24,
        )
      ],
    );
  }

  Widget buildDragHandler() {
    return GestureDetector(
      onTap: () {
        panelcontroller.isPanelOpen
            ? panelcontroller.close()
            : panelcontroller.open();
      },
      child: Center(
        child: Container(
          height: 10,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget buildAboutText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Make hard-boiled eggs",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
              "Eggs — hard-boiled, soft-boiled, scrambled, and so on — are a breakfast staple. Whether you're kicking off your day with an egg breakfast, making an appetizer (we're thinking about you deviled), or you're just trying to add some protein to your salad, follow this fail-proof method. Did we mention eggs are healthy in a variety of ways too?"),
          SizedBox(
            height: 24,
          ),
          Text(
            "There are three ways to make hard-boiled eggs",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              "You can pop 'em in an egg cooker, try the Test Kitchen-approved microwave approach, or go the old-fashioned route with a pot of boiling water."),
          SizedBox(height: 24),
          Text(
            "How do you hard-boil eggs so they peel easily?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              "It actually comes down to the eggs — not necessarily the method — that you're using. The older the egg, the easier they are to peel. For the best results, use eggs that are 7–10 days old. Harold McGee in On Food and Cooking, explains that difficult peeling is characteristic of fresh eggs with a relatively low albumen pH, which somehow causes the albumen to adhere to the inner shell membrane more strongly than it coheres to itself. So if you only have a fresh dozen in your fridge, Harold McGee suggests adding adding a 1/2 tsp baking soda to the water which will raise the Ph levels and possibly make them easier to peel."),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
