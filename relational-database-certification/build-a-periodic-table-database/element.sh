#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  FIND_CONDITION=$([[ "$1" =~ ^-?[0-9]+$ ]] && echo "WHERE atomic_number=$1" || echo "WHERE symbol='$1' OR name='$1'")
  SELECT_COLUMN="atomic_number, symbol,name, atomic_mass, melting_point_celsius, boiling_point_celsius, type"
  ELEMENT=$($PSQL "SELECT $SELECT_COLUMN FROM elements
    LEFT JOIN properties
      USING(atomic_number)
    LEFT JOIN types
      USING(type_id)
    $FIND_CONDITION")

  if [[ $ELEMENT ]]
  then
    IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE <<< $ELEMENT
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  else
    echo "I could not find that element in the database."
  fi
fi
