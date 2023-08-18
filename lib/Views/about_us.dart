import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        toolbarHeight: 50,
        elevation: 14,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70))),
        title: Text(
          "About Us :",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Row(
            children: [
              // Container(
              //   height: 40,
              //   width: 40,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(boxShadow: [
              //     BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.red)
              //   ], shape: BoxShape.circle, color: Colors.redAccent),
              //   child: IconButton(
              //     onPressed: () => controller2.logOut(),
              //     icon: Icon(
              //       Icons.logout,
              //       size: 20,
              //     ),
              //   ),
              // ),
              SizedBox(
                width: 26,
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            // Text(
            //   'About Us:',
            //   style: TextStyle(
            //     fontSize: 24.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 16.0),
            Text(
              'Welcome to SHADDAI, a new starter mobile app development company specializing in creating innovative and dynamic mobile applications using the Flutter framework. Our passion for technology and commitment to excellence drive us to deliver exceptional solutions that cater to the modern digital landscape.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Who We Are?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                'At SHADDI, we are a team of dedicated professionals with a shared vision to transform ideas into remarkable digital experiences. With a diverse skill set and a deep understanding of Flutter\'s capabilities, we pride ourselves on our ability to craft user-centric apps that stand out in today\'s competitive market.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),

            SizedBox(height: 16.0),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Our Mission:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                'Our mission is to empower businesses and individuals with cutting-edge mobile applications that seamlessly blend creativity and functionality. We aim to push the boundaries of innovation, providing solutions that not only meet but exceed our clients\' expectations.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),

            SizedBox(height: 16.0),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Why Choose Us?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                '- Flutter Experts: Our proficiency in Flutter allows us to harness the full potential of this powerful framework, resulting in apps that are visually appealing, fast, and reliable.\n\n'
                '- Tailored Solutions: We understand that each project is unique. That\'s why we work closely with our clients to develop customized solutions that align with their specific goals and requirements.\n\n'
                '- User-Centric Approach: User experience is at the core of our design philosophy. We prioritize creating intuitive and engaging interfaces that provide seamless navigation and a delightful user journey.\n\n'
                '- Transparency: We believe in fostering transparent and open communication throughout the development process. Our clients are kept informed every step of the way, ensuring that their vision is translated into reality.\n\n'
                '- Quality Assurance: Our rigorous testing procedures guarantee that the final product is free from glitches and performs flawlessly across different devices and platforms.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),

            SizedBox(height: 16.0),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Get in Touch',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                'Ready to turn your app idea into reality? Reach out to our team of experts, and let\'s discuss how we can collaborate to create something extraordinary. We\'re excited to embark on this journey with you.\n',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),

            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  'Contact Information:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              subtitle: Text('Phone Number: 01551415772',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            ListTile(
                title: Text(' Email: petothabt@yahoo.com',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),

            SizedBox(height: 8.0),

            ListTile(
              titleAlignment: ListTileTitleAlignment.threeLine,
              title: Center(
                child: Text(
                  ':من نحن',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                'مرحبًا بك في شاداي, شركة رائدة في تطوير تطبيقات الهواتف المحمولة متخصصة في إنشاء تطبيقات مبتكرة وديناميكية باستخدام فلتر يدفعنا شغفنا بالتكنولوجيا والتفاني في التميز لتقديم حلول استثنائية تتناسب مع المشهد الرقمي الحديث',
              ),
            ),

            SizedBox(height: 16.0),
            // Text(
            //   'من نحن',
            //   style: TextStyle(
            //     fontSize: 20.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 8.0),
            // Text(
            //   'في [اسم الشركة], نحن فريق من المحترفين المخلصين لديهم رؤية مشتركة لتحويل الأفكار إلى تجارب رقمية رائعة. بفضل مجموعة متنوعة من المهارات وفهم عميق لإمكانيات ، نفخر بقدرتنا على صناعة تطبيقات موجهة نحو المستخدمين تتميز في سوق اليوم المنافس.',
            // ),
            // SizedBox(height: 16.0),

            ListTile(
              title: Center(
                child: Text(
                  ':مهمتنا',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Text(
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ' مهمتنا هي تمكين الأعمال والأفراد من تطبيقات الهواتف المحمولة المبتكرة التي تمزج بسلاسة بين الإبداع والوظائف. نهدف إلى دفع حدود الابتكار، وتقديم حلول لا تفوق توقعات عملائنا ففط بل  نتجاوزها  ',
              ),
            ),

            // Text(
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            //   ' ا',
            // ),
            SizedBox(height: 16.0),
            // Text(
            //   'لماذا نختارنا',
            //   style: TextStyle(
            //     fontSize: 20.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //         ' خبراءفلتر : إن إتقاننا لـفلتر  يسمح لنا بالاستفادة الكاملة\n من هذا الإطار القوي، مما يؤدي إلى تطبيقات جذابة بصرياً، سريعة'),
            //   ],
            // ),
            // SizedBox(height: 8.0),
            // Text(
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            //   ' خبراءفلتر : إن إتقاننا لـفلتر  يسمح لنا بالاستفادة الكاملة من هذا الإطار القوي، مما يؤدي إلى تطبيقات جذابة بصرياً، سريعة'
            //   ' حلول مخصصة: نحن ندرك أن كل مشروع فريد. لهذا السبب نعمل عن كثب مع عملائنا لتطوير حلول مخصصة تتماشى مع أهدافهم ومتطلباتهم الخاصة'
            //   ' منهج محوري نحو المستخدم: تجربة المستخدم في قلب فلسفة تصميمنا. نحن نولي أهمية كبيرة لإنشاء واجهات بسيطة ومليئة بالتفاعل توفر تجربة ملاحة سلسة ورحلة مستخدم ممتعة'
            //   ' الشفافية: نؤمن بتعزيز التواصل الشفاف والمفتوح طوال عملية التطوير. يتم إبقاء عملائنا على علم في كل خطوة على الطريق، مما يضمن ترجمة رؤيتهم إلى واقع'
            //   'ضمان الجودة: إجراءات الاختبار الدقيقة لدينا تضمن أن المنتج النهائي خالي من الأخطاء ويعمل بشكل مثالي عبر أجهزة ومنصات مختلفة.',
            // ),
            SizedBox(height: 16.0),
            ListTile(
              title: Center(
                child: Text(
                  ':تواصل معنا',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              subtitle: Center(
                child: Text(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  '    هل أنت جاهز لتحويل فكرة تطبيقك إلى واقع؟ تواصل مع فريق خبرائنا ولنناقش كيفية التعاون لإنشاء شئ استثنائي نحن متحمسون للانطلاق في هذه الرحلة معك ',
                ),
              ),
            ),
            SizedBox(height: 8.0),

            // Text(
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            //   'خبرائنا ولنناقش كيفية التعاون لإنشاء شئ استثنائي نحن',
            // ),
            // Text(
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            //   'متحمسون للانطلاق في هذه الرحلة معك ',
            // ),
            ListTile(
              title: Center(
                child: Text(
                  ':اتصل بنا ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Center(
                child: Text(
                  'رقم الهاتف :01551415772',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            Center(
              child: Text(
                'petothabt@yahoo.com :الايميل ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),

            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
