@echo off
setlocal

:: Configuration
set "DB=databases25"
set "DIR=inserts"

:: If you want to set username/password explicitly, uncomment the next line:
set "MYSQL=mysql -u root -proot"

:: Execute each SQL file
%MYSQL% %DB% < "%DIR%\continent.sql"
echo added continents 
%MYSQL% %DB% < "%DIR%\location.sql"
echo added locations 
%MYSQL% %DB% < "%DIR%\festival.sql"
echo added festivals 
%MYSQL% %DB% < "%DIR%\genre.sql"
echo added genres 
%MYSQL% %DB% < "%DIR%\subgenre.sql"
echo added subgenres 
%MYSQL% %DB% < "%DIR%\artist.sql"
echo added artists 
%MYSQL% %DB% < "%DIR%\band.sql"
echo added bands 
%MYSQL% %DB% < "%DIR%\band_artist.sql"
echo added band artists 
%MYSQL% %DB% < "%DIR%\artist_subgenre.sql"
echo added artist subgenres 
%MYSQL% %DB% < "%DIR%\band_subgenre.sql"
echo added band subgenres 
%MYSQL% %DB% < "%DIR%\ticket_type.sql"
echo added ticket types 
%MYSQL% %DB% < "%DIR%\purchase_type.sql"
echo added purchase types 
%MYSQL% %DB% < "%DIR%\performance_type.sql"
echo added performance types 
%MYSQL% %DB% < "%DIR%\role.sql"
echo added roles 
%MYSQL% %DB% < "%DIR%\experience.sql"
echo added experiences 
%MYSQL% %DB% < "%DIR%\visitor.sql"
echo added visitors 
%MYSQL% %DB% < "%DIR%\building.sql"
echo added buildings 
%MYSQL% %DB% < "%DIR%\event.sql"
echo added events 
%MYSQL% %DB% < "%DIR%\ticket.sql"
echo added tickets 
:: %MYSQL% %DB% < "%DIR%\resale_queue.sql"
%MYSQL% %DB% < "%DIR%\buyer.sql"
echo added buyers 
%MYSQL% %DB% < "%DIR%\staff.sql"
echo added staffs 
%MYSQL% %DB% < "%DIR%\equipment.sql"
echo added equipments 
%MYSQL% %DB% < "%DIR%\performance.sql"
echo added performances 
%MYSQL% %DB% < "%DIR%\artist_performance.sql"
echo added artist performances 
%MYSQL% %DB% < "%DIR%\criteria.sql"
echo added criterias 
%MYSQL% %DB% < "%DIR%\review.sql"
%MYSQL% %DB% < "%DIR%\more_reviews.sql"
echo added reviews 
%MYSQL% %DB% < "%DIR%\image_descriptions.sql"
echo added image descriptions 

echo All SQL scripts executed.
endlocal
pause
