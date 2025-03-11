# Three-Tier-Terrafrom-Web-App
This repository contains Terraform scripts to deploy a 3-tier web application on AWS, including a web tier (EC2), backend (EC2), and database (RDS). It provisions networking, security groups, and autoscaling for high availability and scalability. 
![alt text](https://github.com/RonakFabian/Three-Tier-Terrafrom-Web-App/blob/main/Diagram.jpg)

A 3 Tier Architecture breaks down an application in 3 different tiers.

The front end tier is the client facing presentation tier such as a website. This can send content to your web browser in the form of HTML/CSS/JS and displays it nice in the form of GUI (graphical user interface) where clients can come in and make requests. For example, when you go to a website to shop for your favourite brand of coffee.

The application tier is where the client’s request is processed. This tier houses all the backend and application source code needed to process the client request and run functions. Using the example from above, when you click “buy coffee” (in the front end tier) that request goes to the application tier to be processed.

The database tier is where all the application data is stored and managed. All the requests that are processed by the application is saved in this database tier.

So why do we break down the application in 3 different tiers?

Increased Scalability — Each tier can scale independently and have its own auto-scaling group without being reliant on other tiers, ensuring that you only utilize the necessary resources for each tier.

Improved Security — Each tier has the flexibility to have its own security group allowing for tailored permission based specifically on the requirements of each tier.

Fault tolerant — Each tier can have multiple resources in multiple availability zones and the success and availability of one tier is independent of the other tiers

Better processing time — All 3 tiers can simultaneously work on their own tiers which leads to a decrease in processing time.
