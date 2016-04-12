# Sales Engine

## Importing CSVs into database
After running rake tasks to create the database and migrate, choose from the following to import CSVs into your tables:

Recommended:
`rake import:all`: Will import all files currently needed

If you would like to only import some of the tables (most of them are dependent on each other, so this is only recommended for customers or merchants), use `rake import:plural_resource` for each of customers, merchants, items, invoices, transactions, and invoice_items, in that order of needing to be imported, as shown in the example below:

`rake import:customers`
`rake import:invoice_items`
