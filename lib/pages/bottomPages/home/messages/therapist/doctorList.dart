import 'package:cached_network_image/cached_network_image.dart';
import 'package:champe/pages/bottomPages/home/messages/therapist/aboutDoctor/doctorDetails.dart';
import 'package:champe/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top > 0 ? 40 : 10, left: 10,right: 10),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(
                      CupertinoIcons.arrow_left_circle_fill,
                      color: ColorList.black,
                      size: 25,
                    ),
                  ),
                ),
                const Text(
                  "Book a Therapist",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: ColorList.black,
                      fontSize: 25),
                ),
              ],
            ),
            Expanded(child: ListView(
              padding: EdgeInsets.zero,
              children: [
                topDoctorsAbout(
                    img: 'https://images.pexels.com/photos/5452224/pexels-photo-5452224.jpeg?auto=compress&cs=tinysrgb&w=600',
                    doctorName: 'Dr.Gilbert Kinara',
                    doctorTitle: 'Psychologists',
                    rating: 5.0,
                    about: 'I am a dedicated dental practitioner specializing in dental medicine. With expertise in preventive care, restorative dentistry, and cosmetic treatments, he is committed to providing exceptional patient care. Driven by continuous learning, I am a trusted name in the field of dental medicine.'),
                topDoctorsAbout(
                    img: 'https://images.pexels.com/photos/3825457/pexels-photo-3825457.jpeg?auto=compress&cs=tinysrgb&w=600',
                    doctorName: 'Dr.Muhammed Syahid',
                    doctorTitle: 'Psychiatrists',
                    rating: 3.4,
                    about: 'I am a dedicated dental practitioner specializing in dental medicine. With expertise in preventive care, restorative dentistry, and cosmetic treatments, he is committed to providing exceptional patient care. Driven by continuous learning, I am a trusted name in the field of dental medicine.'),
                topDoctorsAbout(
                    img: 'https://images.pexels.com/photos/6129203/pexels-photo-6129203.jpeg?auto=compress&cs=tinysrgb&w=600',
                    doctorName: 'Dr.Malombe Kilo',
                    doctorTitle: 'Counselors',
                    rating: 4.4,
                    about: 'I am a dedicated dental practitioner specializing in dental medicine. With expertise in preventive care, restorative dentistry, and cosmetic treatments, he is committed to providing exceptional patient care. Driven by continuous learning, I am a trusted name in the field of dental medicine.'),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget topDoctorsAbout(
      {required String img,
        required String doctorName,
        required String doctorTitle,
        required double rating,
        required String about}) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorList.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DoctorDetails(
                      img: img,
                      doctorName: doctorName,
                      doctorTitle: doctorTitle,
                      rating: rating,
                      about:about
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: img,
                width: 80,
                height: 80,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName,
                      style: const TextStyle(
                          color: ColorList.navy,
                          fontSize: 12,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    doctorTitle,
                    style: const TextStyle(
                        color: ColorList.navy,
                        fontSize: 9,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 10,
                        itemPadding:
                        const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('${rating.toString()} - 5.0 Reviews',
                          style: const TextStyle(
                              color: ColorList.black,
                              fontSize: 9,
                              fontWeight: FontWeight.w400)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
