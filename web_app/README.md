# CENGDEN Web Application

## Overview
CENGDEN web application built using Flutter for the frontend, MongoDB as the database, SendGrid for email functionality, and AWS for web hosting. The application serves as an e-marketplace where users can buy, sell, and manage items.

## Deployment URL
The CENGDEN web application is deployed and can be accessed at https://cengden-ig47.onrender.com.

## Technologies Used
- Frontend: Flutter
- Backend: MongoDB, AWS
- Email Service: SendGrid

## Usage

## User Guide
1. To browse items by category or view featured items there is a menu bar top-left of the page. Users can filter the items from here.
2. User should press the Profile Button at the menu bar. Sign up for an "@ceng.metu.edu.tr" account or log in if you already have one.
3. After Log-in users can add new item, or updating their profile from here.
4. When user added item this item shown in My Items Page.
5. Click on an item to view its details. 
6. In Item details View users can add the item their favorites list. Also if its own item they can update or delete.
   
### Homepage
- Overview of featured items and some common features for all categories.

### Items of Specific Categories View
- Users can view items filtered by specific categories by the menu bar.

### Item Details View
-  In item details view user can add items to your favorite list. If the user is admin or owner of the item they can update or delete the item. Also, in updating page owner of the item can active or deactive item by changing the Item Visibility. 

### Sign-up View
- Users can only sign up with their "@ceng.metu.edu.tr" mail for an account. In order to sign up, verification code is sent to their email for email verification.
- Sometimes there will be a problem to sending verification code to "ceng" mail, but there is no problem with sending code to "gmail" or "metu" mail addresses.
- If you cannot get a code while signing up, you can log in with the example  account as admin:
- email: e2448025@ceng.metu.edu.tr
- password: admin
- Also you can log in with the example account as user:
- email:e2448488@ceng.metu.edu.tr
- password: user

### Log-in View
- Existing users can log in to their accounts.

### Account Management
- Authenticated users can update their account information such as username, phone number and password in Profile Page. When they update their accounts, they also updated in the favorite list collection and items createdBy field.
- When you log in with the administrator role, there is an All Users section in the menu bar. Administrator has the ability to delete any user here.

### Item Management
- Authenticated users can add, update, delete, deactivate/reactivate items.
- Admin users have additional privileges to delete users and items. For deleting user there is a All Users Page for admins to see all users registered in the website.

### Favorite List
- Authenticated users can add items to their favorite list. There is a Favorite Items Page, they can see their favorites item and also remove from their favorites list here. 

### Email Functionality
- Users receive an email notification while registiration process.
- Users receive an email notification when the price of a favorited item is updated with a decrease.
- I have used AWS lambda functions to send email to users. The triggering this lambda functions, function URL has been created. By doing http request to this URLs with email as input, lambda functions are triggered and sending to email to users.

## Pagination 
- For Pagination startIndex, endIndex and itemsPerPage information are stored. While getting items from database used this information as limiting and skipping inputs.
- With the help of this inputs it only gets between start and end index items not every items.

## Design Decisions
- The application is designed using Flutter for cross-platform compatibility.
- MongoDB is chosen as the database for its flexibility and scalability.
- SendGrid is used for email functionality due to its reliability and ease of integration.
- AWS is selected for web hosting to ensure high availability and performance. In AWS i have used lambda functions for sending email.

## Contributors
- Gürhan İlhan Adıgüzel (2448025)

