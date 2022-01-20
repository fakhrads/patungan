import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'group_listing_event.dart';
part 'group_listing_state.dart';

class GroupListingBloc extends Bloc<GroupListingEvent, GroupListingState> {
  GroupListingBloc() : super(GroupListingInitial()) {
    on<GroupListingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
