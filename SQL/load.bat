@echo off
setlocal

:: Configuration
set "DB=databases25"
set "DIR=inserts"

:: Optional: If using .my.cnf (or my.ini), you don't need to include -u or -p
:: If you want to set username/password explicitly, uncomment the next line:
:: set "MYSQL=mysql -u root -proot"
set "MYSQL=mysql"

:: Execute each SQL file
%MYSQL% %DB% < "%DIR%\continent.sql"
%MYSQL% %DB% < "%DIR%\location.sql"
%MYSQL% %DB% < "%DIR%\festival.sql"
%MYSQL% %DB% < "%DIR%\genre.sql"
%MYSQL% %DB% < "%DIR%\subgenre.sql"
%MYSQL% %DB% < "%DIR%\artist.sql"
%MYSQL% %DB% < "%DIR%\band.sql"
%MYSQL% %DB% < "%DIR%\band_artist.sql"
%MYSQL% %DB% < "%DIR%\artist_subgenre.sql"
%MYSQL% %DB% < "%DIR%\band_subgenre.sql"
%MYSQL% %DB% < "%DIR%\ticket_type.sql"
%MYSQL% %DB% < "%DIR%\purchase_type.sql"
%MYSQL% %DB% < "%DIR%\performance_type.sql"
%MYSQL% %DB% < "%DIR%\role.sql"
%MYSQL% %DB% < "%DIR%\experience.sql"
%MYSQL% %DB% < "%DIR%\visitor.sql"
%MYSQL% %DB% < "%DIR%\building.sql"
%MYSQL% %DB% < "%DIR%\event.sql"
%MYSQL% %DB% < "%DIR%\ticket.sql"
%MYSQL% %DB% < "%DIR%\resale_queue.sql"
%MYSQL% %DB% < "%DIR%\buyer.sql"
%MYSQL% %DB% < "%DIR%\staff.sql"
%MYSQL% %DB% < "%DIR%\equipment.sql"
%MYSQL% %DB% < "%DIR%\performance.sql"
%MYSQL% %DB% < "%DIR%\artist_performance.sql"
:: %MYSQL% %DB% < "%DIR%\review.sql"
:: %MYSQL% %DB% < "%DIR%\criteria.sql"

echo All SQL scripts executed.
endlocal
pause
