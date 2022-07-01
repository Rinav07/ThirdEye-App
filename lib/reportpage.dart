import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thirdeye/constant.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: pblack,
          body: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.95,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                        radius: 33,
                        backgroundColor: pyellow,
                        child: SvgPicture.asset('assets/Vector (1).svg'),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'Missing Vehicle Report',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        'Enter the details of the missing/stolen vehicle for us to investigate.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF9B9797),
                          fontWeight: FontWeight.normal,
                        ),
                        maxLines: 2,
                      ),
                    ),


                    Container(
                      height: 62,
                      decoration: BoxDecoration(
                        color: const Color(0xFF262931),
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(color: const Color(0x143A4853)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: pyellow,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(

                              hintText: 'NAME OF THE OWNER',
                              hintStyle: const TextStyle(color: Color(0xFF666565)),
                              border: InputBorder.none,
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/person_outline.svg',
                                ),
                              ),
                              // Icon(
                              //   Icons.mail_outline_rounded,
                              //   color: Color(0x9f292D32),
                              // ),
                              //prefixIconColor: Color(0xff292D32),
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: pyellow,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 62,
                      decoration: BoxDecoration(
                        color: const Color(0xFF262931),
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(color: const Color(0x143A4853)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: pyellow,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(

                              hintText: 'LOCATION OF CRIME',
                              hintStyle: const TextStyle(color: Color(0xFF666565)),
                              border: InputBorder.none,
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/location_on.svg',
                                ),
                              ),
                              // Icon(
                              //   Icons.mail_outline_rounded,
                              //   color: Color(0x9f292D32),
                              // ),
                              //prefixIconColor: Color(0xff292D32),
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: pyellow,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 62,
                      decoration: BoxDecoration(
                        color: const Color(0xFF262931),
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(color: const Color(0x143A4853)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: pyellow,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(

                              hintText: 'DATE OF CRIME',
                              hintStyle: const TextStyle(color: Color(0xFF666565)),
                              border: InputBorder.none,
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/date_range.svg',
                                ),
                              ),
                              // Icon(
                              //   Icons.mail_outline_rounded,
                              //   color: Color(0x9f292D32),
                              // ),
                              //prefixIconColor: Color(0xff292D32),
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: pyellow,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 62,
                      decoration: BoxDecoration(
                        color: const Color(0xFF262931),
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(color: const Color(0x143A4853)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: pyellow,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(

                              hintText: 'TYPE OF VEHICLE ( 4 WHEELER / 2 WHEELER)',
                              hintStyle: const TextStyle(color: Color(0xFF666565)),
                              border: InputBorder.none,
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/car_crash.svg',
                                ),
                              ),
                              // Icon(
                              //   Icons.mail_outline_rounded,
                              //   color: Color(0x9f292D32),
                              // ),
                              //prefixIconColor: Color(0xff292D32),
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: pyellow,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 62,
                      decoration: BoxDecoration(
                        color: const Color(0xFF262931),
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(color: const Color(0x143A4853)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextField(
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: pyellow,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(

                              hintText: 'REGISTERED LICENSE PLATE',
                              hintStyle: const TextStyle(color: Color(0xFF666565)),
                              border: InputBorder.none,
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  'assets/key.svg',
                                ),
                              ),
                              // Icon(
                              //   Icons.mail_outline_rounded,
                              //   color: Color(0x9f292D32),
                              // ),
                              //prefixIconColor: Color(0xff292D32),
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: pyellow,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'UPLOAD PHOTO OF THE VEHICLE (OPTIONAL)    ',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 2,
                        ),
                        Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20,),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(pyellow),
                        ),
                        child: const SizedBox(
                          height: 62,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'ADD TO SHERLOCK',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
