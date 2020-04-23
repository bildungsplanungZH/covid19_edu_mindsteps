---
pagetitle: Gesellschaftsmonitoring COVID19, Daten Mindsteps
---

![](https://github.com/bildungsmonitoringZH/bildungsmonitoringZH.github.io/raw/master/assets/ktzh_bi_logo_de-300x88.jpg)
![](https://github.com/bildungsmonitoringZH/bildungsmonitoringZH.github.io/raw/master/assets/uzh_logo_d_pos-300x88.jpg)

# Gesellschaftsmonitoring COVID19, Daten Mindsteps

Daten zur täglichen Nutzung der Lernplattform [Mindsteps](https://www.mindsteps.ch/) im Rahmen des Projekts [Gesellschaftsmonitoring COVID19](https://statistikzh.github.io/covid19monitoring/)

## Datenlieferant

Universität Zürich, Institut für Bildungsevaluation

## Beteiligte

Lukas Giesinger <lukas.giesinger@uzh.ch>, Institut für Bildungsevaluation

Nina König <nina.koenig@ibe.uzh.ch>, Institut für Bildungsevaluation

Flavian Imlig <flavian.imlig@bi.zh.ch>, Bildungsdirektion

## Indikatorbeschreibung

### Nutzung der Lernplattform Mindsteps

Der Indikator beschreibt die Anzahl durchgeführter Aufgabenserien pro Tag.

Die Plattform Mindsteps wurde für die Kantone Aargau, Basel-Landschaft, Basel-Stadt und Solothurn entwickelt und in diesen Kantonen verwendet. Am 17. März 2020 haben die vier Kantone die Plattform allen Deutschschweizer Schulen kostenlos zur Verfügung gestellt, zumindest bis Ende Schuljahr 2019/20 (weitere Informationen [hier](https://www.mindsteps.ch/header/aktuelles/detail/kostenlose-nutzung-von-mindsteps-bis-ende-schuljahr-201920/)).

## Struktur der Basisdaten:

Datei `base_data_IBE.csv`

* `date`: Datum, Format yyyy-mm-dd
* `region`: (optional) regionale Einschränkung der Nutzer, z. B. Kanton ZH, leer lassen für Gesamtzahl der Deutschschweiz
* `value`: Anzahl, nur Ganzzahlen verwenden
* `comment`: Kommentare zum Eintrag

## Vorgehen

* Manuelles Update des Datenfiles `base_data_IBE.csv` durch das IBE, in der Regel täglich.
* R-Skript `prepareDate.R` zum Generieren der erforderlichen Datenstruktur, automatisch ausgeführt bei update von `base_data_IBE.csv`.
