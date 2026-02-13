{% assign wednesday = include.wednesday %}
<div class="card-group event-card text-dark mb-2">
<div class="card mb-0 border-0">
<div class="card-body py-4 border-bottom {% if event.Date == dateToday  %}bg-light{% endif %}">
<div class="row">
<div class="col-lg-3 col-md-5 date pb-4">
<p class="p-0 m-0 display-8">{{ wednesday | date: "%A" }}</p>
<p class="p-0 m-0 display-1">{{ wednesday | date: "%d" }}</p>
<p class="p-0 m-0 display-8">{{ wednesday | date: "%B" }}</p>
{% if wednesday == dateToday  %}<h5 class="p-0 m-0 display-8 ">TODAY</h5>{% endif %}
</div>
<div class="col-lg-9 col-md-7">
<div class="d-flex flex-column">
<h3 class="card-title text-capitalize mt-0"><strong markdown="1">Traditional Music At the Chip</strong></h3>
<div class="card-text" markdown="1">
Come and hear local musicians at this Pick Up 'n' Play session at the Chip 'N' Ern. Just listen or bring an instrument and join in.

*From: approx 8pm*
{: class="description" }

*Price: Free*
{: class="description" }

</div>
</div>
</div>
</div>
</div>
</div>
</div>
