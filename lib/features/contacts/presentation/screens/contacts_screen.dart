
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/locator.dart';
import '../../../../core/theme/colors.dart';
import '../../../shared/presentation/widgets/error_title_widget.dart';
import '../../../shared/presentation/widgets/loader_widget.dart';
import '../widgets/contacts_item_widget.dart';
import '../widgets/title_contacts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/data/data_source/local_data_source.dart';
import '../blocs/contacts/contacts_bloc.dart';
import '../blocs/contacts/contacts_event.dart';
import '../blocs/contacts/contacts_state.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: sl<LocalDataSource>().getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoaderWidget();
        } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
          return Scaffold(
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [purpleTop ,babyBlueTop ]
                    )
                ),
                child: Center(child: Text(AppLocalizations.of(context)!.translate('not_authenticated'),style: Theme.of(context).textTheme.titleMedium,))),
          );
        }

        final token = snapshot.data!.trim();
        return BlocProvider(
          create: (_) => sl<ContactsBloc>()..add(GetContactsEvent(token)),
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [purpleTop ,babyBlueTop ]
                  )
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TitleContactsWidget(),
                  Expanded(
                    child: BlocBuilder<ContactsBloc, ContactsState>(
                      builder: (context, state) {
                        if (state is ContactsLoading) {
                          return LoaderWidget();
                        } else if (state is ContactsLoaded) {
                          return ListView.builder(
                            itemCount: state.contacts.length,
                            itemBuilder: (context, index) {
                              final contact = state.contacts[index];
                              return ContactsItemWidget(contact: contact);
                            },
                          );
                        } else if (state is ContactsFailure) {
                          return ErrorTitleWidget(message: state.message);
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}




