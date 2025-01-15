#!/usr/bin/env awk

# for yelp_academic_dataset_business.json
# find `"name":"business_id":"--` and replace it with `"name":"--`
{
    gsub(/"name":"business_id":"--/, "\"name\":\"--")
    print
}
# find `"date":"2015-04-02 21:45:17"}"Lone Spur Cafe",` and remove it
{
    gsub(/"date":"2015-04-02 21:45:17"}"Lone Spur Cafe",/, "")
    print
}
# find `{"business_id":"GK6nRDNGiLoJuIXTD8gwqw","name":"No Gamble Carpet Cleaning","address":"2657 Win` and remove it
{
    gsub(/{\"business_id\":\"GK6nRDNGiLoJuIXTD8gwqw\",\"name\":\"No Gamble Carpet Cleaning\",\"address\":\"2657 Win/, "")
    print
}
# find `mill Pkwy, Ste 621` and add `{"business_id":"GK6nRDNGiLoJuIXTD8gwqw","name":"No Gamble Carpet Cleaning","address":"2657 Win`
{
    gsub(/mill Pkwy, Ste 621/, "{\"business_id\":\"GK6nRDNGiLoJuIXTD8gwqw\",\"name\":\"No Gamble Carpet Cleaning\",\"address\":\"2657 Win")
    print
}
