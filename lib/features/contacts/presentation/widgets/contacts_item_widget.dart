import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';
import '../../domain/entities/contact.dart';

class ContactsItemWidget extends StatelessWidget {
  const ContactsItemWidget({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: Image.asset('assets/images/star.png',width: 20.19,height: 20.19),
          title: Text(contact.name, style: Theme.of(context).textTheme.labelMedium,),
          subtitle: Text(contact.email,style: Theme.of(context).textTheme.labelMedium,),
        ),
      ),
    );
  }
}
