# == Class: bareos::profile::director::schedule
# Default schedules
class bareos::profile::director::schedule {

  # Default Cycles
  ::bareos::director::schedule { 'WeeklyCycle':
    description => 'Default Backup shedule.',
    run         => [
      'Full 1st sat at 21:00',
      'Differential 2nd-5th sat at 21:00',
      'Incremental mon-fri at 21:00',
    ],
  }

  ::bareos::director::schedule { 'WeeklyCycleAfterBackup':
    description => 'This schedule does the catalog backup.',
    run         => 'Full mon-sun at 23:30',
  }

  ::bareos::director::schedule { 'Hourly':
    run         => [
      'Full daily at 01:00',
      'Incremental hourly at 0:30',
    ],
  }

  # These cycles are set up so that we can spread out the full backups of our
  # servers across the week. Some at the weekend, some mid-week.
  ::bareos::director::schedule { 'WeeklyOnMonday':
    run         => [
      'Full First Mon at 18:30',
      'Differential Second-Fifth Mon at 18:30',
      'Incremental Tue-Sun at 20:00',
    ],
  }

  ::bareos::director::schedule { 'WeeklyOnTuesday':
    run         => [
      'Full First Tue at 18:30',
      'Differential Second-Fifth Tue at 18:30',
      'Incremental Wed-Mon at 20:00',
    ],
  }

  ::bareos::director::schedule { 'WeeklyOnWednesday':
    run         => [
      'Full First Wed at 18:30',
      'Differential Second-Fifth Wed at 18:30',
      'Incremental Thu-Tue at 20:00',
    ],
  }

  ::bareos::director::schedule { 'WeeklyOnThursday':
    run         => [
      'Full First Thu at 18:30',
      'Differential Second-Fifth Thu at 18:30',
      'Incremental Fri-Wed at 20:00',
    ],
  }

  ::bareos::director::schedule { 'WeeklyOnFriday':
    run         => [
      'Full First Fri at 18:30',
      'Differential Second-Fifth Fri at 18:30',
      'Incremental Sat-Thu at 20:00',
    ],
  }

  ::bareos::director::schedule { 'WeeklyOnSaturday':
    run         => [
      'Full First Sat at 15:30',
      'Differential Second-Fifth Sat at 15:30',
      'Incremental Sun-Fri at 20:00',
    ],
  }

  ::bareos::director::schedule { 'WeeklyOnSunday':
    run         => [
      'Full First Sun at 15:30',
      'Differential Second-Fifth Sun at 15:30',
      'Incremental Mon-Sat at 20:00',
    ],
  }
}
