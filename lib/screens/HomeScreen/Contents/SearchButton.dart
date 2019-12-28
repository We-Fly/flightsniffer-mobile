import 'package:flutter/material.dart';
import 'package:flyx/screens/TicketResultsScreen/TicketResultsScreen.dart';
import 'package:flyx/services/NearBy/NearBy.dart';
import 'package:flyx/services/TicketNetworkCall/Request.dart';
import 'package:flyx/services/UserQuery/UserQuery.dart';
import 'package:provider/provider.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> departureSurrAirports =
        Provider.of<FetchNearBy>(context).originNearByIataCodes;
    final List<String> destinationSurrAirports =
        Provider.of<FetchNearBy>(context).destinationNearByIataCodes;
    final List<DateTime> depDates =
        Provider.of<UserQuery>(context).departureDateRange;
    final List<DateTime> destDates =
        Provider.of<UserQuery>(context).returnDateRange;
    return Card(
      shape: const StadiumBorder(),
      color: Colors.blueGrey,
      child: FlatButton.icon(
        icon: const Icon(
          Icons.search,
        ),
        label: const Text('SEARCH'),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TicketResults(),
            ),
          );
          Provider.of<FlightSearch>(context, listen: false).makeRequest(
            context,
            departureSurrAirports, destinationSurrAirports, depDates, destDates,
            // Provider.of<UserQuery>(context).vehicleType,
            'aircraft',
          );
        },
      ),
    );
  }
}