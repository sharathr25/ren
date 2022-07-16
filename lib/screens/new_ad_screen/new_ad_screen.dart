import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class NewAdScreen extends StatefulWidget {
  const NewAdScreen({Key? key}) : super(key: key);

  @override
  State<NewAdScreen> createState() => _NewAdScreenState();
}

class _NewAdScreenState extends State<NewAdScreen> {
  int activeStep = 0; // Initial step set to 0.
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text("New Ad"),
        ),
        body: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  enableInfiniteScroll: false,
                ),
                carouselController: _controller,
                items: const [
                  Center(child: Text("1")),
                  Center(child: Text("2")),
                  Center(child: Text("3")),
                  Center(child: Text("4"))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotStepper(
                    dotCount: 4,
                    dotRadius: 6,
                    spacing: 10,
                    activeStep: activeStep,
                    onDotTapped: (tappedDotIndex) {
                      _controller.jumpToPage(tappedDotIndex);
                      setState(() {
                        activeStep = tappedDotIndex;
                      });
                    },
                    indicatorDecoration: IndicatorDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      if (activeStep != 0)
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              activeStep = activeStep - 1;
                            });
                            _controller.previousPage();
                          },
                          child: const Icon(Icons.arrow_back_ios_new),
                        ),
                      const SizedBox(width: 30),
                      if (activeStep != 3)
                        ElevatedButton(
                          // onPressed: null,
                          onPressed: () {
                            setState(() {
                              activeStep = activeStep + 1;
                            });
                            _controller.nextPage();
                          },
                          child: const Icon(Icons.arrow_forward_ios),
                        ),
                      if (activeStep == 3)
                        ElevatedButton(
                          onPressed: () {
                            print("Submit new ad");
                          },
                          child: const Icon(Icons.check),
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
