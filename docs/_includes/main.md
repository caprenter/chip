<article class="post"> <!-- centres the content in the page -->
<section class="main-page">
<div markdown="1">

<h1 class="text-center">Music at the Chip 'n' Ern</h1>
<!-- # Every Thursday
## Doors 7:30pm. Music from 8pm  -->

 <div class="px-4 py-5 my-5 text-center bg-light" markdown="1">

## Every Wednesday Evening

**Live Traditional Music** in the pub 

## Every Thursday Evening

**Live Acoustic Music** in the upstairs room from **local artists**<br>
or The Bingley Ukulele Group<br>
(1st/3rd/5th Thursday of the month).

## Third Sunday of the month

Come and be the **DJ** at **Vinyl Revival** on the 3rd Sunday of the month.<br>
Playing **vinyl records** from 4pm to late.  

## Touring musicians, album launches...

We also host **ad hoc music events** featuring **touring musicians**, **album launches**, and so on.

</div>

 <div class="px-4 py-5 my-5 text-center bg-light">
    <h1 class="display-5 fw-bold">Wanna play at the Chip'n' Ern?</h1>
    <div class="col-lg-6 mx-auto" markdown="1">

Contact us via this <a href="https://forms.gle/KFJNwX2jU95YL1rU8">booking form</a>.

Or just turn up and join in with the traditional music in the pub every Wednesday evening, and the Bingley Ukulele Group that meets upstairs on the 1st, 3rd, and 5th Thursdays of the month.

</div>
<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
<a type="button" class="btn btn-secondary btn-lg px-4 gap-3 text-white" href="https://forms.gle/KFJNwX2jU95YL1rU8">Booking Form</a>
</div>
</div>



# What's On
{% assign dateToday = 'now' | date: "%Y-%m-%d" %}
{% assign dayToday = dateToday | date: "%u" %}
{% assign events = site.data.events | sort: "Date"  %}
{% assign artists = site.data.artists %}
{% assign venues = site.data.venues %}
{% assign count = 0 %}
{% assign unixtime = dateToday | date: "%s" %}
{% assign daystoadd = 3 | minus: dayToday %}
{% if daystoadd < 0 %}
{% assign daystoadd = daystoadd | plus:7 %}
{% endif %}
{% assign secondstoadd = daystoadd | times: 86400 %}
{% assign WednesdayUnix = unixtime | plus: secondstoadd %}
{% assign wednesdayDate = WednesdayUnix | date: "%Y-%m-%d" %}
{% assign wednesdayDateDayOfYear = wednesdayDate | date: "%j" %}

<div class="container p-0">
<div class="row">
<div class="col-md-12">
{% for event in events %}
{% if event.Venue == "Chip 'n' Ern" %}
{% if event.Date >= dateToday  %}
{% assign count = count | plus:1 %}
{% if event.Artists and event.Artists != nil and event.Artists != "" %}
{% assign eventYear = event.Date | date: "%Y" %}
{% assign eventDay = event.Date | date: "%u" %}
{% assign eventDayOfYear = event.Date | date: "%j" %}
{% assign dayTodayOfYear = dateToday | date: "%j" %}
{% assign slug = event.Date | date:"%A-%d-%B-%Y" %}

{% if dayTodayOfYear <= eventDayOfYear and wednesdayDateDayOfYear <= eventDayOfYear and count == 1 %}
{% include traditional-music.md wednesday=wednesdayDate %}
{% assign unixtime = wednesdayDate | date: "%s" %}
{% assign secondstoadd = 7 | times: 86400 %}
{% assign WednesdayUnix = unixtime | plus: secondstoadd %}
{% assign wednesdayDate = WednesdayUnix | date: "%Y-%m-%d" %}
{% assign wednesdayDateDayOfYear = wednesdayDate | date: "%j" %}
{% endif %}

{% if count > 1 and eventDayOfYear >= wednesdayDateDayOfYear | plus: 7 %}
{% include traditional-music.md wednesday=wednesdayDate %}
{% assign unixtime = wednesdayDate | date: "%s" %}
{% assign secondstoadd = 7 | times: 86400 %}
{% assign WednesdayUnix = unixtime | plus: secondstoadd %}
{% assign wednesdayDate = WednesdayUnix | date: "%Y-%m-%d" %}
{% assign wednesdayDateDayOfYear = wednesdayDate | date: "%j" %}
{% endif %}

<div class="card-group event-card text-dark mb-2">
<div class="card mb-0 border-0">
<div class="card-body py-4 border-bottom {% if event.Date == dateToday  %}bg-light{% endif %}">
<div class="row">
<div class="col-lg-3 col-md-5 date pb-4">
<p class="p-0 m-0 display-8">{{ event.Date | date: "%A" }}</p>
<p class="p-0 m-0 display-1">{{ event.Date | date: "%d" }}</p>
<p class="p-0 m-0 display-8">{{ event.Date | date: "%B" }}</p>
{% if event.Date == dateToday  %}<h5 class="p-0 m-0 display-8 ">TODAY</h5>{% endif %}
</div>
<div class="col-lg-9 col-md-7">
<div class="d-flex flex-column">
{% if event.Presents %}<h5>{{ event.Presents }}</h5>{% endif %}
<h3 class="card-title text-capitalize mt-0 {% if event.Artists == 'Available' %}text-muted{% endif %}">
<strong markdown="1">{% if event.Cancelled =="1" %}CANCELLED <br>{% endif %}{{ event.Artists }}</strong>                    
</h3>
<div class="card-text" markdown="1">**[{{ ThisVenue.Name }}]( {{ ThisVenue.url }} )**{: class="venue-name" }
{% if event.Cancelled =="1" %}
{{ event.CancelledText }}
{: class="description" }
{% else %}
{{ event.Description }}
{: class="description" }
{% if event.Time %}*From: {{ event.Time}}*
{: class="description" }{% endif %}
{% if event.Price %}
*Price: {{ event.Price }}*
{: class="description" }
{% endif %}
{% if event.Tickets %} [Buy Tickets]({{ event.Tickets }}){% endif %}
{% endif %}
</div>
</div>
</div>
</div>
</div>
</div>
</div>
{% assign week-date = event.Date %}
{%- endif -%}
{%- endif -%}
{%- endif -%}
{%- endfor -%}
</div>
</div>
</div>
</div>
</section>
</article>