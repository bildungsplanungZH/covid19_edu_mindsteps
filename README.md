![](assets/ktzh_bi_logo_de-300x88.jpg)
![](assets/uzh_logo_d_pos-300x88.jpg)

# Gesellschaftsmonitoring COVID19, Daten Mindsteps

Daten zur täglichen Nutzung der Lernplattform [Mindsteps](https://www.mindsteps.ch/) im Rahmen des Projekts [Gesellschaftsmonitoring COVID19](https://statistikzh.github.io/covid19monitoring/)

## Datenlieferant

[source] Universität Zürich, Institut für Bildungsevaluation

## Beteiligte

Lukas Giesinger <lukas.giesinger@uzh.ch>, Institut für Bildungsevaluation

Nina König <nina.koenig@ibe.uzh.ch>, Institut für Bildungsevaluation

Flavian Imlig <flavian.imlig@bi.zh.ch>, Bildungsdirektion

## Indikatorbeschreibung

[topic] Bildung

[variable_short] training_mindsteps

[variable_long] Nutzung der Lernplattform Mindsteps

[location] Deutschschweiz (default)

[unit] Anzahl durchgeführter Aufgabenserien

[update] täglich

[description] https://github.com/bildungsmonitoringZH/covid19_edu_mindsteps

## Open data

Kann die Variable OGD gestellt werden?

[public] Ja

## Struktur der Basisdaten:

Datei `base_data_IBE.csv`

* `date`: Datum, Format yyyy-mm-dd
* `region`: (optional) regionale Einschränkung der Nutzer, z. B. Kanton ZH, leer lassen für Gesamtzahl der Deutschschweiz
* `value`: Anzahl, nur Ganzzahlen verwenden
* `comment`: Kommentare zum Eintrag

## Vorgehen

* Manuelles Update des Datenfiles `base_data_IBE.csv` durch das IBE, in der Regel täglich.
* R-Skript `prepareDate.R` zum Generieren der erforderlichen Datenstruktur, automatisch ausgeführt bei update von `base_data_IBE.csv`.
