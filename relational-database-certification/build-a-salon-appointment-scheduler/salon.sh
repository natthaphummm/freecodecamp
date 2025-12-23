#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

# ($PSQL "TRUNCATE TABLE appointments, customers")

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

SERVICES_RESULT=$($PSQL "SELECT service_id, name FROM services")

# show service list
MENU_SERVICES() {
  echo "$SERVICES_RESULT" | while read SERVICE_ID BAR NAME;
  do
    if [[ $SERVICE_ID =~ ^[0-9]+$ ]]
    then
      echo "$SERVICE_ID) $NAME"
    fi
  done

  read SERVICE_ID_SELECTED

  if [[ -z $($PSQL "SELECT * FROM services WHERE service_id=$SERVICE_ID_SELECTED") ]]
  then
    echo -e "\nI could not find that service. What would you like today?"
    MENU_SERVICES
  fi
}

CREATE_CUSTOMER() {
  local INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$1', '$2')")
  echo $($PSQL "SELECT customer_id FROM customers WHERE phone='$1'")
}

CREATE_APPOINTMENT() {
  echo $($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($1, $2, '$3')")
}

MAIN_MENU() {
  MENU_SERVICES
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # check phone is exists
  COSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # if not exists custome
  if [[ -z $COSTOMER_ID ]]
  then
    # create new customer
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    COSTOMER_ID=$(CREATE_CUSTOMER $CUSTOMER_PHONE $CUSTOMER_NAME)
  fi

  echo -e "\nWhat time would you like your$SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  
  CREATE_APPOINTMENT_RESULT=$(CREATE_APPOINTMENT $COSTOMER_ID $SERVICE_ID_SELECTED $SERVICE_TIME)
  
  if [[ -z $CREATE_APPOINTMENT_RESULT ]]
  then
    echo "Something went wrong"
    MAIN_MENU
  else
    echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU
