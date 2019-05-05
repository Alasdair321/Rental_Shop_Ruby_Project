# Arthur's Seat Ski Hire

## An equipment rental management system

### Includes:
 - Manage Customer Details
 - Manage Equipment Stocks
 - Create leases 
 - Store records of all previous leases

### Summary:
The website is has been programmed using Ruby and PSQL for databasing. The web application framework, Sinatra, has been employed to run the website in the browser.

### Screenshots:

![test image](public/background.JPG)
![home page](public/screenshot1.png)
![Customer Details](public/screenshot2.png)
![Equipment Details 1](public/screenshot3.png)
![Equipment Details 2](public/screenshot4.png)
![Create lease 1](public/screenshot5.png)
![Create lease 2](public/screenshot6.png)
![Current and Ended Leases](public/screenshot7.png)


### Features
- The database is protected against SQL injection by using prepared statements. 
- For each requested lease the stock availability is checked within the proposed date range. The process counts the number of items leased for each proposed date and focuses on the maximum number leased over the range, if this is equal to the total stock, then that item cannot be leased in this date range.
- On an ended lease, all of the data is copied to a 'records' table, such that the dependencies on the Equipment and Customer SQL tables are severed and the information can be changed without altering the recorded lease details. 
