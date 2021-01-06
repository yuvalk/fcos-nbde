#!/bin/bash -x

{% for tangid in range(0, tang_servers_number) %}
export tang{{ tangid}}_ip=nbde-tang-{{ tangid }}
export tang{{ tangid}}_thumbprint=$(ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no nbde-tang-{{ tangid }} tang-show-keys)
{% endfor %}

{% for nbdeid in range(0, nbde_clients_number) %}
envsubst < nbde-47.ign.template > nbde-47-{{ nbdeid }}.ign
{% endfor %}
