Cyclistic
================

# 🚲 Cyclistic Bike-Share Analysis Case Study

------------------------------------------------------------------------

## Table of Contents

- [The Scenario](#the-scenario)
  - [Characters & Teams](#characters-teams)
  - [About the Company](#about-the-company)
- [The Business Task](#the-business-task)
- [Data Sources](#data-sources)
- [The Data](#the-data)
  - [Data Cleaning](#data-cleaning)
  - [The Analysis](#the-analysis)
    - [Ride Length](#ride-length)
    - [Day of the Week](#day-of-week)
    - [Season](#season)
- [Conclusion](#conclusion)
  - [Appendix](#appendix)

## 1️⃣ The Scenario

You are a junior data analyst working on the marketing analyst team at
Cyclistic, a bike-share company in Chicago. The director of marketing
believes the company’s future success depends on maximizing the number
of annual memberships. Therefore, your team wants to understand how
casual riders and annual members use Cyclistic bikes differently. From
these insights, your team will design a new marketing strategy to
convert casual riders into annual members. But first, Cyclistic
executives must approve your recommendations, so they must be backed up
with compelling data insights and professional data visualizations.

### Characters & Teams

- **Cyclistic**: A bike-share program that features more than 5,800
  bicycles and 600 docking stations. Cyclistic sets itself apart by also
  offering reclining bikes, hand tricycles, and cargo bikes, making
  bike-share more inclusive to people with disabilities and users who
  can’t use a standard two-wheeled bike. The majority of users opt for
  traditional bikes; about 8% of users use the assistive options.
  Cyclistic users are more likely to ride for leisure, but about 30% use
  the bikes to commute to work each day.
- **Lily Moreno**: The director of marketing and your manager. Moreno is
  responsible for the development of campaigns and initiatives to
  promote the bike-share program. These may include email, social media,
  and other channels.
- **Cyclistic marketing analytics team**: A team of data analysts who
  are responsible for collecting, analyzing, and reporting data that
  helps guide Cyclistic marketing strategy. You joined this team six
  months ago and have been busy learning about Cyclistic’s mission and
  business goals—as well as how you, as a junior data analyst, can help
  Cyclistic achieve them.
- **Cyclistic executive team**: The notoriously detail-oriented
  executive team will decide whether to approve the recommended
  marketing program.

### About the Company

In 2016, Cyclistic launched a successful bike-share offering. Since
then, the program has grown to a fleet of 5,824 bicycles that are
geotracked and locked into a network of 692 stations across Chicago. The
bikes can be unlocked from one station and returned to any other station
in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general
awareness and appealing to broad consumer segments. One approach that
helped make these things possible was the flexibility of its pricing
plans: single-ride passes, full-day passes, and annual memberships.
Customers who purchase single-ride or full-day passes are referred to as
casual riders. Customers who purchase annual memberships are Cyclistic
members.

Cyclistic’s finance analysts have concluded that annual members are much
more profitable than casual riders. Although the pricing flexibility
helps Cyclistic attract more customers, Moreno believes that maximizing
the number of annual members will be key to future growth. Rather than
creating a marketing campaign that targets all-new customers, Moreno
believes there is a solid opportunity to convert casual riders into
members. She notes that casual riders are already aware of the Cyclistic
program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at
converting casual riders into annual members. In order to do that,
however, the team needs to better understand how annual members and
casual riders differ, why casual riders would buy a membership, and how
digital media could affect their marketing tactics. Moreno and her team
are interested in analyzing the Cyclistic historical bike trip data to
identify trends.

Three questions will guide the future marketing program:

- How do annual members and casual riders use Cyclistic bikes
  differently?
- Why would casual riders buy Cyclistic annual memberships?
- How can Cyclistic use digital media to influence casual riders to
  become members?

Moreno has assigned you the first question to answer: How do annual
members and casual riders use Cyclistic bikes differently?

## 2️⃣ The Business Task

The problem that we are trying to solve in this report is: **“How can
Cyclistic maximize the number of annual memberships?”**

We will answer this question by identifying how annual members and
casual riders use Cyclistic bikes differently. We will specifically be
looking at how they differ in ride length, usage within the week, and
usage per month.

## 3️⃣ Data Sources

The data used in this report comes from the Cyclistic trip data which
has been made available by Motivate International Inc. under this
[license](https://divvybikes.com/data-license-agreement).

Each table in the data set contains the following information concerning
individual rides:

- Unique ride id
- Type of bike used
- Date and time the ride started and ended
- Station that the ride started at & its unique id
- Station that the ride ended at & its unique id
- Starting latitude & longitude
- Ending latitude & longitude
- Type of rider that used the bike

## 4️⃣ The Data

### Data Cleaning

View the [Change Log](#) to see how to data was cleaned.

### The Analysis

#### Ride Length

To get a better idea of how casual riders differ from members, we will
be looking at the differences in their ride lengths. We can do this by
measuring the average ride length and longest ride length of casual
riders and comparing it those of members:

``` r
casual_ride_length <- ride_length %>% 
  filter(member_casual=='casual')

casual_mean <- round(mean(casual_ride_length$ride_in_seconds, na.rm=TRUE))

casual_max <- round(max(casual_ride_length$ride_in_seconds, na.rm=TRUE))

member_ride_length <- ride_length %>% 
  filter(member_casual=='member')

member_mean <- round(mean(member_ride_length$ride_in_seconds, na.rm=TRUE))

member_max <- round(max(member_ride_length$ride_in_seconds, na.rm=TRUE))
```

    ## [1] "Casual Ride Length Mean: 1438 seconds or 23.9666666666667 minutes"

    ## [1] "Casual Ride Length Max: 90562 seconds or 1509.36666666667 minutes"

    ## [1] "Member Ride Length Mean: 746 seconds or 12.4333333333333 minutes"

    ## [1] "Member Ride Length Max: 89859 seconds or 1497.65 minutes"

Based on the calculations done in R Studio, we can see that casual
riders have a higher average and max ride length, meaning that they
typically take longer rides than members.

The following box plots show the difference between the ride lengths of
casual riders and members by dividing the data into separate plots based
on how many hours (0-25) the rides took and using the excess minutes to
plot individual rides. For instance, a ride that took approximately 12
hours and 45 minutes would be plotted in box plot 12 and y-coordinate
45.

![image](https://github.com/user-attachments/assets/a03868e8-b862-40d9-9d6e-9511712a01b6)

#### Day of week

Next, we can check which day of the week casual riders and members use
Cyclistic the most.

The data shows that most casual rides happen on Friday whereas Tuesday
has the most member rides.

The line plot below shows that number of rides per week day separated by
rider type. Furthermore, it also shows that the highest peak in casual
rides is on Friday while the highest peak in member rides is on Tuesday.

![image](https://github.com/user-attachments/assets/e184c242-818e-4a93-ae4c-e12e16d5fbee)

### Season: Casual Riders vs. Members

Finally, we can look at which season the most Cyclistic casual rides and
member rides occur.

The data shows that both casual riders and members use Cyclistic the
most during the summer.

This is supported by the line plot because both lines peak during the
Summer.

![image](https://github.com/user-attachments/assets/5f918f3b-16cb-4318-a643-442f512d7e35)

## 🏁 Conclusion

Based on our analysis, we identified three key differences between
casual riders and members.

- Casual riders tend to go on longer rides than members.
- Casual riders use Cyclystic most on Friday while members use it more
  on Tuesday.
- Both casual riders and members use Cyclistic the most during the
  Summer.

In the future, we could potentially run an analysis on the most popular
riding stations, months, and hours to determine where and when Cyclistic
ads would be most effective.

### Appendix

- Data: <https://divvy-tripdata.s3.amazonaws.com/index.html>
