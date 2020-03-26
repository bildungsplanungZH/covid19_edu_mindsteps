# Mindsteps data for Monitoring Covid 19

## Datenlieferant [source]

Universität Zürich, Institut für Bildungsevaluation

## Beteiligte

Lukas Giesinger <lukas.giesinger@uzh.ch>, Institut für Bildungsevaluation

Nina König <nina.koenig@ibe.uzh.ch>, Institut für Bildungsevaluation

Flavian Imlig <flavian.imlig@bi.zh.ch>, Bildungsdirektion

## Ziel

Daten zur täglichen Nutzung der Lernplattform [Mindsteps](https://www.mindsteps.ch/) im Rahmen des Projekts [Monitoring Covid19](https://github.com/statistikZH/monitoring_covid19) öffentlich verfügbar machen.

## Vorgehen

* Manuelles Update des Datenfiles `base_data_IBE.csv` durch das IBE, in der Regel täglich (Nina, Lukas)
* R-Skript `prepareDate.R` zum Generieren der erforderlichen Datenstruktur (Flavian)
* Generieren möglichst automatisch auslösen

## Indikatorbeschreibung [variable_long]

Anzahl durchgeführter Mindsteps-Aufgabenserien

## Open data [public]

Kann die Variable OGD gestellt werden?

* Ja

## Struktur der Basisdaten:

Datei `base_data_IBE.csv`

* `date`: Datum, Format yyyy-mm-dd
* `region`: (optional) regionale Einschränkung der Nutzer, z. B. Kanton ZH, leer lassen für Gesamtzahl der Deutschschweiz
* `value`: Anzahl, nur Ganzzahlen verwenden
* `comment`: Kommentare zum Eintrag
