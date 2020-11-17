import 'package:dart_date/dart_date.dart';
import 'package:test/test.dart';

void main() {
  group('Getters', () {
    test('timestamp', () {
      expect(Date.unix(0).timestamp, 0);
      expect(Date.parse('1996-03-29T11:11:11.011Z').timestamp, 828097871011);
    });

    test('isFirstDayOfMonth', () {
      expect(DateTime(2011, 2, 1, 11).isFirstDayOfMonth, true);
      expect(
          Date.parse('November 01 2018, 9:14:29 PM',
                  pattern: 'MMMM dd y, h:mm:ss a')
              .isFirstDayOfMonth,
          true);
      expect(
          Date.parse('November 30 2011, 0:14:29 PM',
                  pattern: 'MMMM dd y, h:mm:ss a')
              .isFirstDayOfMonth,
          false);
    });

    test('isLastDayOfMonth', () {
      expect(DateTime(2011, 2, 1, 11).isLastDayOfMonth, false);
      expect(
          Date.parse('November 01 2018, 9:14:29 PM',
                  pattern: 'MMMM dd y, h:mm:ss a')
              .isLastDayOfMonth,
          false);
      expect(
          Date.parse('November 30 2011, 0:14:29 PM',
                  pattern: 'MMMM dd y, h:mm:ss a')
              .isLastDayOfMonth,
          true);
    });

    test('isLeapYear', () {
      expect(DateTime(2011, 2, 1, 11).isLeapYear, false);
      expect(Date.parse('September 12 2012', pattern: 'MMMM dd y').isLeapYear,
          true);
    });
  });

  group('Week', () {
    test('getWeek', () {
      expect(DateTime(2005, DateTime.january, 3).getWeek, 2);
    });

    test('getWeekPreviousYear', () {
      expect(DateTime(2005, DateTime.january, 2).getWeek, 1);
    });

    test('getWeekBefore100AD', () {
      expect(DateTime(7, DateTime.december, 30).getWeek, 52);
    });

    test('getISOWeek', () {
      expect(DateTime(2005, DateTime.january, 3).getISOWeek, 1);
    });

    test('getISOWeekPreviousYear', () {
      expect(DateTime(2005, DateTime.january, 2).getISOWeek, 0);
    });

    test('getISOWeekBefore100AD', () {
      expect(DateTime(7, DateTime.december, 30).getISOWeek, 52);
    });

    test('getWeekYear', () {
      expect(DateTime(2004, DateTime.december, 26).getWeekYear, 2005);
    });

    test('startOfWeekYear', () {
      expect(DateTime(2005, DateTime.july, 2).startOfWeekYear,
          DateTime(2004, DateTime.december, 26));
    });

    test('startOfWeekYearBefore100AD', () {
      expect(DateTime(9, DateTime.january, 1).startOfWeekYear,
          DateTime(8, DateTime.december, 28));
    });

    test('startOfISOWeekYear', () {
      expect(DateTime(2005, DateTime.july, 2).startOfISOWeekYear,
          DateTime(2005, DateTime.january, 3));
    });

    test('startOfISOWeekYearOnFirstJanuary', () {
      expect(DateTime(2007, DateTime.february, 10).startOfISOWeekYear,
          DateTime(2007, DateTime.january, 1));
    });

    test('startOfISOWeekYearBefore100AD', () {
      expect(DateTime(9, DateTime.january, 1).startOfISOWeekYear,
          DateTime(8, DateTime.december, 29));
    });

    test('getISOWeeksInYear', () {
      expect(DateTime(2014, DateTime.march, 21).getISOWeeksInYear, 52);
    });

    test('getISOWeeksInYear53Weeks', () {
      expect(DateTime(2015, DateTime.february, 11).getISOWeeksInYear, 53);
    });

    test('getISOWeeksInYearBefore100AD', () {
      expect(DateTime(4, DateTime.january, 4).getISOWeeksInYear, 53);
    });
  });
}
