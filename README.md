# renovision_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

##########
# Start of Documentation for Capstone Class
##########

## 1. User Guide

  # Introduction
  Our app, RenoVision, aims to eliminate the need for typical calculations
  of home renovation projects.  Normally, you would need to pull out the ol'
  ruler, tape measure, and a means to store/add up the measurements.  Sure, you
  can find calculators online for 'paint estimation', 'flooring estimation', 
  or 'roofing estimation', but there is no system that combines all of these
  features into one area.  Furthermore, the current setup of the most common 
  renovation calculators are hard to navigate through, don't offer sufficient
  input boxes to get precise measurements, and don't account for various other
  problems/techniques that go into home renovation products.  Secondly, there is
  not really a software system that is specific to construction workers that would
  allow them to register for jobs local to their area.  
  In order to remedy these problems, we created RenoVision as a hub for various
  types of estimations (painting, flooring, and roofing) as well as a platform
  to connect potential clients with contractors. We have implemented the linkage
  to an AR measurement app on the user's phone which is used to take the 
  measurements of their surface(s) in order to calculate a result.  The process
  of estimation is pretty intuitive, and allows for great flexibility with the
  used metrics.  Secondly, we added a contractor registration form for contractors
  who want to show up in the 'view contractors' list to be pointed out to potential
  clients also on the app.  
  We have lots of features we wanted to add, but due to time constraints and
  technical skill, we have produced an app with the features listed prior.
  RenoVision sees a gap in the marketplace where there is no main tool for these
  kind of projects or networking with contractors and aims to be the predominant
  name for all home renovation needs one day.

  # Download and Installation Instructions:
  1. Visit the GitHub Repository
  2. Navigate to the GitHub repository containing the RenoVision app code.
  3. Clone or Download the Repository
  4. Use the "Clone" or "Download" button on the repository page to obtain the app code.
     
  # Set Up the Development Environment:
  1. Follow the provided instructions in the repository to set up the development
     environment on your machine.
  2. Open a terminal within the project directory and run the command 'flutter pub get'
     to install dependencies.
  3. Run the App Locally
  4. Execute the necessary commands to run the app locally on your development machine.

  # Initial Setup Steps:
  1. Open the app within your chosen development environment.
  2. Create a test account by using the provided registration feature.
  3. Input a username, email, password, and confirm the password for the test account.
  4. Log in using the created test account to access the main screen and rest of features.

  # User Interface Overview
  
  8 Primary Buttons:
  - Help (?)
      > general steps for using the app
  - Paint
      > paint estimation screen
  - Flooring
      > flooring estimation screen
  - Roofing
      > roofing estimation screen    
  - View Contractors
      > list of all registered contractors   
  - Register as Contractor
      > registration form to become contractor  
  - Scan
      > sends user to AR measurement app
  - Estimate!
      > calculates materials result based on inputs

  3 Primary Features:
  - User Registration/Login
      > connected to Firebase, users can create a RenoVision profile with
      a username, email, and password.
  - Measuring and Calculation Process
      > users can choose an estimation type, click on the camera button to
      gather measurements for the necessary inputs, and click Estimate! to
      generate a respective result
  - Contractors
      > users can view a list of registered contractors or they can register
        to become a contractor- then they're appended to the view contractors list

  # Privacy and Security 

  - User Authentication
  > RenoVision utilizes Firebase for user authentication, ensuring a secure and efficient
    login process. User credentials, including passwords, are hashed and stored with
    advanced encryption techniques.

  - Data Handling
  > We prioritize user privacy by not storing additional user data beyond what's essential
    for authentication. Firebase securely manages and authenticates user accounts, following
    industry best practices.

  - Continuous Security Measures
  > RenoVision is committed to continuous monitoring and improvement of security measures.
    We stay informed about the latest security practices and promptly address any potential
    vulnerabilities.

  - Encryption and Privacy Policy
  > All data transmitted between the app and Firebase is encrypted using industry-standard
    protocols. For a comprehensive understanding of data management and security, please
    refer to our Privacy Policy.

  - Reporting Concerns:
  > If you identify security concerns or have suggestions, contact our support team. Your
    feedback is essential for maintaining a secure environment for all RenoVision users.

  # Trouble Shooting
  1.  Pod Error/No Pod File/Pod Not Found:  If you come across this error, this is how
      to fix it. (answer for MacOS related problems)
      > Step 1:  Make sure you are in the project directory terminal (' cd RenoVision_Github' )
      > Step 2:  Go to this ios folder (' cd ios ')
      > Step 3:  Type ' pod install '
      This should fix the issue and allow you to run the app as normal.

  # Conclusion/Future Plans
  As stated prior, our technical skills are limited with app development, and the time limit
  was not very long to develop everything we had initially planned on. One feature we would like
  is to have an AR measurer of our own- built into the app.  This way, the user stays within the
  RenoVision app through the entirety of the calculation process.  The next feature would be a way
  to automatically input the measurements into the appropriate field so that the user doesn't even
  have to type in their measurements- they are auto populated into the field.  The last big thing
  that we wanted to add was a shop feature.  In here users could potentially get discounts from
  stores who teamed up with RenoVision to sell their products (paint, tile, hardwood, shingles).
  We planned on reaching out to stores who wanted to use us as a way to advertise their products.
  RenoVision would really need to make a name for itself in this sector of the market to be able to
  pull that off, but it is definitely possible considering there is no other app like this out there
  yet.  
  RenoVision will hopefully one day be the first thing people think about when they plan on doing
  any sort of home renovation project, locating a contractor, or buying materials for their home.

## 3.  Plans for all phases of SDLC

[All Prior Documentation](https://github.com/JJ-Gallegos/RenoVision_Github/tree/9fea3879ba00bfcfd02bfa476882b8f9e2b4346c/All%20Prior%20Documentation)

## 4.  Presentation

- PDF of the PowerPoint
[RenoVision Group 1.pdf](https://github.com/JJ-Gallegos/RenoVision_Github/blob/0c34ae2d3712ec2829a60888b1b63c258a2d6ee0/RenoVision%20Group%201.pdf)

- YouTube of Demo Video
[Watch the Video on YouTube](https://youtu.be/F8dN8cbFl1A)
