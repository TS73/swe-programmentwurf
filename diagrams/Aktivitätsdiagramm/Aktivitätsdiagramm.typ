== Aktivitätsdiagramme
Aktivitätsdiagramme werden zur Modellierung beliebiger prozedualer Abläufe verwendet. 
Diese veranschaulichen somit komplexe Verläufe, Nebenläufigkeiten oder auch alternative Veranschaulichungswege, um ein klares Verständins der gewünschten Abläufe eines Produkets zwischen Auftraggeber und -nehmer zu gewährleisten.

Bei diesem Diagrammen werden für eine bessere Übersicht ineinanderliegende Entscheidungsknoten und Schleifen in unterschiedlichen Farben gekennzeichnet.
Zusätzlich sind Prozesse, welche in Pseudocode und in einem Aktivitätsdiagramm verfeinert wurden, in Rosa markiert, sowie Prozesse, welche nur in Pseudocode verfeinert wurden, in Orange.
=== Materialbestellung
#image("Aktivitätsdiagramm.svg")

Für die Modellierung eines Aktivitätsdiagrammes wurde hierbei der Prozess einer Materialbestellung gewählt. Dieser hat als Eingabewert den Kundenauftrag, welcher bereits mit einem gewählten Angebot verknüpft wurde. 
Von diesem Angebot werden anschließend alle Materialposten auf eine vollständige Verfügbarkeit überprüft und je nach Lagerbestand eine entsprechende Nachbestellung eingeleitet oder nicht. 

Hierbei ist zu beachten, dass  erst nach der Überprüfung aller nötigen Materialposten die Bestellung abgesendet wird. Dadurch werden Materialien, welche von dem selben Lieferanten beschaffen werden sollen, gemeinsam in einem Eigenauftrag bestellt und mehrere Einzelbestellungen vermieden.

Ebenfalls wird bei nicht Erhaltung einer Bestellbestätigung überprüft, wodurch ein Fehler bei der Bestellung zustande gekommen ist. Da bei einer passenden Eingabe der nötigen Daten nur ein Fehler von Seite der Lieferanten entstehen kann, muss der entsprechende Lieferant geändert und die Bestellung erneut durchgeführt werden. 

Im Pseudocode sind zusätzlich die Prozesse "Lieferant kontaktieren" und "Rechnung archivieren" verfeinert dargestellt, um eine mögliche Detaillierung der Prozesse abzubilden.

==== Pseudocode

Im folgenden wird die Aktion "Materialbestellungen für obigen Auftrag durchführen“ von der Bestandsprüfung der für einen Auftrag nötigen Materialien bis zur Verwaltung der Rechnung in Form von Pseudocode realisiert.
```
ANFANG Materialbestellung
  Kundenauftrag auswählen
  Finales, verknüpftes Angebot auswählen
  FÜR-ALLE Materialposten des finalen Angebots 
      Lagerbestand des zugeordnetes Produkts prüfen 
      WENN nicht genug verfügbar
          Lieferant aus Hauplieferanten auswählen
          WENN kein Lieferant verfügbar
              Lieferanten recherchieren
              Lieferant auswählen
              Lieferant kontaktieren 
              Angebote empfangen
              Lieferant anlegen
              Lieferant auswählen
          ENDE-WENN
          WENN Lieferant bereits eine offene Bestellung hat
              Material dem vorhandenen Eigenauftrag mit selbem Lieferanten hinzufügen
          SONST 
              Neuen Eigenauftrag für Bestellung anlegen (Für Verfeinerung vgl. Auftrag anlegen)
              Eigenauftrag in Kontext des Kundenauftrags setzen
              Eigenauftrag als verknüpften Auftrag des Kundenauftrags hinzufügen
              Material dem neuen Eigenauftrag hinzufügen
          ENDE-WENN
      ENDE-WENN
  ENDE-FÜR-ALLE
  Alle offenen Eigenaufträge absenden
  WENN Bestellbestätigung erhalten -> Rechnung erhalten //Rechnung als Output 
  der Bestellbestätigung
      Rechnung archivieren (Rechnung) //Rechnung als Input für das Archivieren der Rechnung
  SONST
      Fehler prüfen
      Neue Bestellung mit anderem Lieferanten für fehlgeschlagenes Produkt anlegen
  ENDE-WENN
ENDE Materialbestellung
```
```
ANFANG Lieferant kontaktieren
  WENN Mailadresse als Kontaktmöglichkeit vorhanden
      Mailprogramm öffnen
      Empfänger eintragen
      Betreff definieren 
      Mail mit Angebotsanfrage verfassen 
      Mail absenden
  SONST-WENN Telefonnummer als Kontakmöglichkeit vorhanden 
      Telefon holen 
      Telefonnummer eingeben
      Anrufen 
      WENN Lieferant nicht ran geht
          Auf die Mailbox sprechen
      SONST
          Angebote einholen
          Vereinbaren diese via Mail oder Post zu bekommen
      ENDE WENN
  SONST-WENN Adresse als Kontaktmöglichkeit vorhanden
      Word öffnen 
      Anschreiben verfassen 
      Drucker anschalten
      Dokument drucken
      Drucker ausschalten
      Briefumschlag holen
      Absender, Empfänger und Briefmarke auf den Umschlag schreiben
      Brief falten 
      Brief in den Briefumschlag legen
      Briefumschlag verschließen
      Brief wegbringen
  SONST
      Neuen Lieferanten suchen //keine Kontaktdaten vorhanden
  ENDE WENN
ENDE Lieferant kontaktieren
```
```
ANFANG Rechnung archivieren (Rechnung)
  WENN Rechung in Papierformat
      Rechnung einscannen
  WENN Rechnung nicht in PDF Format
      Rechnung in PDF konvertieren
  ENDE WENN
  Rechnung dem Eigenauftrag der Bestellung anhängen
ENDE Rechnung archivieren (Rechnung)
```

=== Verfeinerung: Lieferant anlegen
#image("Aktivitätsdiagramm-LieferantAnlegen.svg")

Zur Veranschaulichung einer Verfeinerung in einem Aktivitätsdiagramm wurde exemplarisch der Prozess des Anlegens eines neuen Lieferantens gewählt. 

Dieser beginnt mit dem Öffnen des Lieferantenmenüs sowie des zugehörigen Editors. 
Anschließend wird ein neuer Lieferant angelegt, dem schrittweise alle nötigen Attribute zugewiesen werden. 
Danach erfolgt die Erstellung einer Rechnungsadresse. 
Nach dem Setzen der zugehörigen Attribute wird diese dem Lieferanten zugewiesen.

Im nächsten Schritt wird eine Hauptkontaktperson einschließlich der zugehörigen Attribute angelegt. Diese wird dem Lieferanten zugewiesen, bevor anschließend ein Vertreter erstellt wird.

Daraufhin werden die Produkte angelegt, die zum Lieferanten gehören. Für jedes Produkt aus der vorhandenen Bestellliste wird ein neues Produkt erstellt und mit den nötigen Informationen wie Produkt-ID, Name und Beschreibung versehen. Anschließend wird geprüft, ob der Lieferant als Hauptlieferant für das Produkt eingetragen werden soll. Wenn das der Fall ist, wird die Verbindung entsprechend hergestellt.

/* Hierbei wird der Lieferant zunächst mit allen nötigen Attributen und Referenzen erstellt.
Von diesem werden anschließend alle Produkte der Bestelliste hinzugefügt, wobei dieser potentiell für das jeweilige Produkt als Hauptlieferant gekennzeichnet werden kann. */

==== Pseudocode

Im folgenden wird die Aktion "Lieferant anlegen“ von der Erstellung eines Lieferantenprofils bis zur Übertragung seiner Produkte in Form von Pseudocode realisiert.
```
ANFANG Lieferant anlegen
    Öffne Lieferantenmenü
    Öffne Lieferanten-Editor

    Neuen Lieferanten hinzufügen

    Attribute setzen (Name, Steuernummer)
    Rechnungsadresse erstellen 
    Attribute setzen (Postleitzahl, Stadt, Straße, Hausnummer)
    Referenz auf Rechnungsadresse hinzufügen
    Hauptperson erstellen
    Attribute setzen (Anrede, Vorname, Nachname, Telefonnummer, E-Mail-
    Adresse)
    Referenz auf Hauptkontakt hinzufügen
    Vertreter hinzufügen

    FÜR-ALLE Produkte eines Lieferanten
        Produkt der Bestellliste hinzufügen 
        Attribute setzen (ProduktID, Name, Beschreibung, Hersteller, 
        Stückpreis)
        WENN Hauptlieferant des Produktes
            Produkt mit Lieferant als Hauptlieferant verknüpfen
        ENDE-WENN
    ENDE-FÜR-ALLE
ENDE Lieferant anlegen
```