# PowerShell.Toolbox
Powershell cmdlets that I use frequently

# Gridscale VM Power Controller

Welcome to the Gridscale VM Power Controller! This script allows you to easily start or stop your Gridscale virtual machines (VMs) using Gridscale's API. Perfect for automating your VM management, this script helps ensure your infrastructure is only running when you need it.

## Features

- **Start or Stop VMs**: Seamlessly control the power state of your Gridscale VMs.
- **Simple Configuration**: Easily set up your user credentials and target server.
- **API Integration**: Utilizes Gridscale's REST API for reliable and secure operations.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following:

- A Gridscale account with API access
- PowerShell installed on your system

# SQL Database to CSV Exporter

## Overview

This PowerShell script automates the extraction of all tables from a specified SQL database and exports their contents into CSV files. It’s a handy tool for database administrators and developers who need to quickly dump database tables for analysis, migration, or backup purposes.

## Features

- **Automated Table Detection**: Automatically fetches all table names and their schemas from the specified database.
- **CSV Export**: Exports each table's content to a separate CSV file, named according to its schema and table name.
- **Customizable Output Directory**: Define your preferred output directory for the CSV files.
- **No Quoted Values**: Writes CSV data without enclosing values in quotes, ensuring compatibility with various data processing tools.

## Requirements

- PowerShell 5.0 or later
- SQL Server with integrated security enabled
- Appropriate permissions to read from the target database
