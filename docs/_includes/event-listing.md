<!-- PERFORMERS -->
<div markdown="1">
{% if event.Presents %}<h5>{{ event.Presents }}</h5>{% endif %}
{% assign performers = event.Artists | split: "," %}
{% for performer in performers -%}
  {%- if forloop.length > 1 -%}
    {% if forloop.first %}
### {{ performer }}
Support: {% continue %}{% endif %}
{{ performer }}{% unless forloop.last %}, {% endunless -%}
  {% else %}
### {{ performer }}
  {%- endif -%}
{% endfor %}

{% if event.Cancelled !="1"  %}
<!-- DESCRIPTION -->
{{ event.Description }}
{: class="description" }
<!--<div class="event-badge" markdown="1">[Event link]({{ event.Link }})</div>-->
<!--{% if event.Time %}Doors: {{ event.Time | date: "%l:%M%P" }} <br/>{% endif %}-->
{% if event.Time %}*From: {{ event.Time}}*
{: class="description" }{% endif %}
<!--{% if event.link %}[Get Tickets for {{ event.eventname }}]({{ event.link }}){:class="btn btn-primary"}{% endif %}-->
<!--{% if event.entryprice %}£{{ event.entryprice }}{% endif %}-->


<!-- Price -->
*Price: {{ event.Price }}*
{: class="description" }
{% if event.Tickets %} [Buy Tickets]({{ event.Tickets }}){% endif %}
{% else %} <!-- is cancelled -->
## CANCELLED
{{ event.CancelledText }}
{: class="description" }
{% endif %} <!-- not cancelled -->

<!-- LINKS -->
{% for performer in performers -%}
{% assign artist = site.data.artists | where:"Name", performer | first %}
<div class="performer-links" markdown="1">
{%- if forloop.length > 1 -%}* {{artist.Name }}:{% endif %}
{% if event.Cancelled !="1"  %}
{% if event.Link %}* <i class="fa-solid fa-globe"></i> [Event Info]({{ event.Link }}){% endif %}
{% else %} <!-- is cancelled -->
{% if event.CancelledLink %}* <i class="fa-solid fa-globe"></i> [Cancellation Info]({{ event.CancelledLink }}){% endif %}
{% endif %} <!-- not cancelled -->

{% if artist.Web %}* <i class="fa-solid fa-globe"></i> [Website]({{ artist.Web }}){% endif %}
{% if artist.Facebook %}* <i class="fa-brands fa-facebook"></i> [Facebook]({{ artist.Facebook }}){% endif %}
{% if artist.Twitter %}* <i class="fa-brands fa-twitter"></i> [Twitter]({{ artist.Twitter }}){% endif %}
{% if artist.Instagram %}* <i class="fa-brands fa-instagram"></i> [Instagram]({{ artist.Instagram }}){% endif %}
{% if artist.Bandcamp %}* <i class="fa-brands fa-bandcamp"></i> [Bandcamp]({{ artist.Bandcamp }}){% endif %}
</div>
{% endfor %}

<!-- VENUE IFNO-->
{% for venue in venues %}
{% if venue.Name == event.Venue %}
{% assign ThisVenue = site.venues | where:"Name", venue.Name | first %}
**[{{ venue.Name }}]( {{ ThisVenue.url }} )**
{: class="venue-name" }
*{{ venue.Area }}*<br>
{{ venue.Address }}{% if venue.Postcode %}, {{ venue.Postcode }}{% endif %}
{: class="description" }
<div class="performer-links" markdown="1">
{% if venue.Web %}* <i class="fa-solid fa-globe"></i> [Website]({{ venue.Web }}){% endif %}
{% if venue.Facebook %}* <i class="fa-brands fa-facebook"></i> [Facebook]({{ venue.Facebook }}){% endif %}
</div>
{% endif %}
{% endfor %}

{% if event.LastUpdated %}Data fetched on: {{ event.LastUpdated | date: "%A %d %B %Y" }} 
{: class="last-updated" }{% endif %}
</div>