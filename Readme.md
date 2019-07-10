[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/borko-rajkovic/Prodavac">
    <img src="./Prodavac_Icon1.ico" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Prodavac</h3>

  <p align="center">
    Desktop application for shoe sale built in Delphi
    <br />
    <a href="https://github.com/borko-rajkovic/Prodavac/issues">Report Bug</a>
    ·
    <a href="https://github.com/borko-rajkovic/Prodavac/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
  - [Splash screen](#splash-screen)
  - [Customers](#customers)
  - [Sale](#sale)
  - [Reports](#reports)
  - [Models](#models)
  - [Configuration](#configuration)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [Contact](#contact)

<!-- ABOUT THE PROJECT -->

## About The Project

Prodavac is shoe sale desktop application that features:
- Intuitive UI for sales
- Installment buying
- History of sales
- Management of users, products & rasters
- Role based authorization
- Reports & export to Excel

### Splash screen

Depending on user credentials, it will show more or less functionalities

![User login][user-login]

### Customers

On Customers screen you can create new Customer, edit or delete existing one. Application uses TWAIN for scanning ID of Customer

![Customers][customers]

You can define Customer groups

![Customer Groups][customer-groups]

### Sale


This screen is used to make installment sell. You can search for a Customer, create new sale and generate contract for a Customer

![Sale Installments][sale-installments]

Similar to previous screen, here you can make cash sale

![Sale Cash][sale-cash]

Here you can record new installment payment based on Customer and contract

![Installment Payment][installment-payment]

This screen is used to keep track of installments for sales, as well as Customers account cards

![Search Customer][search-customer-and-his-card]

### Reports

This shows daily report of sales with some filters

![Daily Report][daily-report]

Here you can see all statistics for sales with various filter and sort options

![Statistics][statistics]

Based on contracts generated, here you can keep track of unpayed sales and see which ones are beyond their expiration date (in red color)

![Debts][debts]

### Models

Shoe models overview. Helpfull if you want to check details like count of particular shoe model size, or available discounts

![Search Models][search-models]

Management of shoe models

![Manage Models][manage-models]

Groups of shoe models to which you can apply discounts

![Model Groups][model-groups]

Rasters

![Rasters][rasters]

Discounts

![Discounts][discounts]

### Configuration

User configuration

![User Configuration][user-configuration]


### Built With

- Delphi Embarcadero RAD Studio
- MySQL
- Fast Reports

<!-- GETTING STARTED -->

## Getting Started

To get a local copy of the project up and running, follow these simple steps:

1. Clone the repo

```sh
git clone https://github.com/borko-rajkovic/Prodavac
```

2. Create new database using sql script file located here:

```sh
DB setup/prodaja_na_rate.sql
```

3. Build Keygen project

4. Build Prodavac project

5. Run Prodavac.exe. It will ask for key

6. Run keygen to generate key and populate it in Prodavac.exe. Then you are ready to go

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->

## Contact

Borko Rajkovic - [LinkedIn](https://linkedin.com/in/othneildrew) - rajkovicborko@gmail.com

<!-- MARKDOWN LINKS & IMAGES -->

[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/borko-rajkovic/
[user-login]: ./Resources/Screenshots/User/Login.png
[user-configuration]: ./Resources/Screenshots/User/Configuration.png
[customers]: ./Resources/Screenshots/Customers/Customers.png
[customer-groups]: ./Resources/Screenshots/Customers/Customer%20groups.png
[daily-report]: ./Resources/Screenshots/Reports/Daily%20report.png
[statistics]: ./Resources/Screenshots/Reports/Statistics.png
[debts]: ./Resources/Screenshots/Reports/Debts.png
[sale-installments]: ./Resources/Screenshots/Sale/Sale-installments.png
[sale-cash]: ./Resources/Screenshots/Sale/Sale-cash.png
[installment-payment]: ./Resources/Screenshots/Sale/Installment%20payment.png
[search-customer-and-his-card]: ./Resources/Screenshots/Sale/Search%20Customer%20and%20his%20card.png
[search-models]: ./Resources/Screenshots/Models/Search%20models.png
[manage-models]: ./Resources/Screenshots/Models/Manage%20models.png
[model-groups]: ./Resources/Screenshots/Models/Model%20groups.png
[rasters]: ./Resources/Screenshots/Models/Rasters.png
[discounts]: ./Resources/Screenshots/Models/Discounts.png
