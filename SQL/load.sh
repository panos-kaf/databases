#!/bin/bash

DB="databases25"
DIR="inserts"

echo adding continents 
mysql "$DB" < "$DIR/continent.sql"
echo adding locations 
mysql "$DB" < "$DIR/location.sql"
echo adding festivals 
mysql "$DB" < "$DIR/festival.sql"
echo adding genres 
mysql "$DB" < "$DIR/genre.sql"
echo adding subgenres 
mysql "$DB" < "$DIR/subgenre.sql"
echo adding artists 
mysql "$DB" < "$DIR/artist.sql"
echo adding bands 
mysql "$DB" < "$DIR/band.sql"
echo adding band artists 
mysql "$DB" < "$DIR/band_artist.sql"
echo adding artist subgenres 
mysql "$DB" < "$DIR/artist_subgenre.sql"
echo adding band subgenres 
mysql "$DB" < "$DIR/band_subgenre.sql"
echo adding ticket types 
mysql "$DB" < "$DIR/ticket_type.sql"
echo adding purchase types 
mysql "$DB" < "$DIR/purchase_type.sql"
echo adding performance types 
mysql "$DB" < "$DIR/performance_type.sql"
echo adding roles 
mysql "$DB" < "$DIR/role.sql"
echo adding experiences 
mysql "$DB" < "$DIR/experience.sql"
echo adding visitors 
mysql "$DB" < "$DIR/visitor.sql"
echo adding buildings 
mysql "$DB" < "$DIR/building.sql"
echo adding events 
mysql "$DB" < "$DIR/event.sql"
echo adding tickets 
mysql "$DB" < "$DIR/ticket.sql"
#mysql "$DB" < "$DIR/resale_queue.sql"
echo adding buyers 
mysql "$DB" < "$DIR/buyer.sql"
echo adding staffs 
mysql "$DB" < "$DIR/staff.sql"
echo adding equipments 
mysql "$DB" < "$DIR/equipment.sql"
echo adding performances 
mysql "$DB" < "$DIR/performance.sql"
echo adding artist performances 
mysql "$DB" < "$DIR/artist_performance.sql"
echo adding criterias 
mysql "$DB" < "$DIR/criteria.sql"
echo adding reviews 
mysql "$DB" < "$DIR/review.sql"
mysql "$DB" < "$DIR/more_reviews.sql"
echo adding image descriptions 
mysql "$DB" < "$DIR/image_descriptions.sql"

echo 'Filled database.'
