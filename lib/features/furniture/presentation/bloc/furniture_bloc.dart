import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/no_params.dart';
import '../../domain/entity/furniture.dart';
import '../../domain/usecase/get_all_furniture_usecase.dart';
import 'package:meta/meta.dart';

part 'furniture_event.dart';
part 'furniture_state.dart';

class FurnitureBloc extends Bloc<FurnitureEvent, FurnitureState> {
  FurnitureBloc({@required this.useCase}) : super(FurnitureEmpty());

  final GetAllFunitureUseCase useCase;

  @override
  Stream<FurnitureState> mapEventToState(
    FurnitureEvent event,
  ) async* {
    if (event is GetAllFurnitureEvent) {
      final result = await useCase(NoParams());

      yield FurnitureLoading();

      yield* _eitherFailureOrSuccess(result);
    }
  }

  Stream<FurnitureState> _eitherFailureOrSuccess(
      Either<Failure, List<Furniture>> failureOrSuccess) async* {
    yield failureOrSuccess.fold(
      (failure) => FurnitureError(message: _mapFailureToMessage(failure)),
      (furnitures) => FurnitureLoaded(furnitures: furnitures),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case DatabaseFailure:
        return 'Database Error: Failed to load last air quality from store.';
      default:
        return 'Unexpected Error';
    }
  }
}
