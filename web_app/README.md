# E-Marketplace Web Application

## Overview
This is a web application built using Flutter for the frontend, MongoDB as the database, SendGrid for email functionality, and AWS for web hosting. The application serves as an e-marketplace where users can buy, sell, and manage items.

## Deployment URL
The web application is deployed and can be accessed at [deployment_url](deployment_url).

## Technologies Used
- Frontend: Flutter
- Backend: MongoDB, AWS
- Email Service: SendGrid

## Installation
1. Clone this repository.
2. Install Flutter and its dependencies.
3. Set up MongoDB and create the necessary collections.
4. Set up SendGrid API for email functionality.
5. Deploy the backend on AWS.
6. Configure the frontend to connect to the backend API.
7. Run the Flutter application.

## Usage
### Homepage
- Overview of featured items and categories.

### Items of Specific Categories View
- Users can view items filtered by specific categories.

### Item Details View
- Detailed information about a selected item.

### Sign-up
- Users can sign up for an account. Verification email is sent for account verification.

### Log-in
- Existing users can log in to their accounts.

### Account Management
- Authenticated users can update their account information.

### Item Management
- Authenticated users can add, update, delete, deactivate/reactivate items.
- Admin users have additional privileges to delete users and items.

### Favorite List
- Authenticated users can add items to their favorite list.

### Email Functionality
- Users receive an email notification when the price of a favorited item is updated with a decrease.

## Pagination (Bonus)
- Pagination feature is implemented for better user experience.

## Design Decisions
- The application is designed using Flutter for cross-platform compatibility.
- MongoDB is chosen as the database for its flexibility and scalability.
- SendGrid is used for email functionality due to its reliability and ease of integration.
- AWS is selected for web hosting to ensure high availability and performance.

## User Guide
1. Sign up for an account or log in if you already have one.
2. Browse items by category or view featured items on the homepage.
3. Click on an item to view its details.
4. Add items to your favorite list.
5. Manage your account and items as needed.

## Contributors
- [Your Name]
- [Contributor 2]
- [Contributor 3]

## License
This project is licensed under the [License Name] License.

