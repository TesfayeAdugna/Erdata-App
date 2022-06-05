import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sec_2/erdata/blocs/blocs.dart';
// import 'package:sec_2/erdata/blocs/children_state.dart';
// import 'package:sec_2/erdata/data_providers/children_data_provider.dart';
import 'package:sec_2/erdata/repository/children_repository.dart';
// import 'package:sec_2/erdata/blocs/children_bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:sec_2/erdata/data_providers/data_provider.dart';
import 'package:sec_2/erdata/models/model.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:sec_2/erdata/screens/children.dart';
// import 'package:sec_2/erdata/screens/screens.dart';

class MockChildRepository extends Mock implements ChildrenRepository {}

void main() {
  group('children bloc test', () {
    ChildrenBloc childrenBloc;
    ChildrenRepository childrenRepository;
    ChildrenDataProvider childrenProvider = ChildrenDataProvider();

    setUp(() {
      // EquatableConfig.stringify = true;
      childrenRepository = MockChildRepository();
      childrenBloc = ChildrenBloc(childrenRepository: childrenRepository);
    });

    // test('Throw AssertionError if is null', () {
    //   expect(
    //     () => ChildrenBloc(),
    //   throwsA(isAssertionError),
    //   );
    // });

    Children addedChild;
    blocTest<ChildrenBloc, ChildrenState>(
      "emits [ChildrenLoading, ChildrenOperationSuccess] states for"
      "successful Children loads",
      build: () {
        when(childrenRepository.create(Children(
          id: 3,
          first_name: 'kira',
          last_name: 'kira',
          gender: 'male',
        ))).thenAnswer((_) => Future.value(childrenProvider.create(children)));

        return childrenBloc;
      },
      act: (bloc) => bloc.add(ChildrenCreate(children: 'hello')),
      expect: () => [
        [
          ChildrenLoading(),
          ChildrenOperationSuccess(
              Children: childrenProvider.create(addedChild)),
        ],
      ],
    );

    tearDown(() {
      childrenBloc.close();
    });
  });
}
