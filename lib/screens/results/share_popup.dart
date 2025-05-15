import 'package:flutter/material.dart';
import 'package:puppy_scan/shared/logo.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _ShareBottomSheetContent(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Color(0xFFEBEBEB),
    );
  }
}

class _ShareBottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Logo(),
              SizedBox(height: 12),
              Text(
                'Your pup is looking adorable!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(5),
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset('assets/scan_result.jpg'),
              ),
              SizedBox(height: 24),
              Container(
                height: 200,
                padding: EdgeInsets.fromLTRB(0, 21, 0, 28),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0x54545657).withAlpha(50)),
                  ),
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/share/instagram.svg',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: 7),
                          Text('Instagram'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/share/messages.png', width: 60),
                          SizedBox(height: 7),
                          Text('Messages'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/share/whatsapp.svg',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: 7),
                          Text('WhatsApp'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/share/facebook.svg',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: 7),
                          Text('Facebook'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/share/telegram.svg',
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(height: 7),
                          Text('Telegram'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 16,
          left: 20,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset('assets/svg/close.svg'),
          ),
        ),
      ],
    );
  }
}
