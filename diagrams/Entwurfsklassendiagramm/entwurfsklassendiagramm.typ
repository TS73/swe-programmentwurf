= Entwurfs-Klassendiagramm

#figure(
  image("Entwurfsklassendiagramm1.svg", width: 110%),
  caption: "Entwurfs-Klassendiagramm - Teil 1",
)<fig:entwurfs-klassendiagramm-1>

Auf Basis des Analyse-Klassendiagramms wurde das Modelpackage des Entwurfs-Klassendiagramms erstellt. Dieses Diagramm hat einige Änderungen im Vergleich zum Analyse-Klassendiagramm erfahren, um die Ideen und Konzepte der Analyse zu konkretisieren und die Struktur des Modells zu optimieren.

Zu den Änderungen gehören, aus der Zugriffsrechtsart ein Enum der beiden Zugriffsrechtsarten zu machen. Bei den Rollen wurde auch eine Zugriffsmethode eingeführt, die es ermöglicht, den Zugriff auf bestimmte Objekte zu überprüfen.

Die Klasse Geschäftspartner wurde abstrakt gemacht, da diese nur ein Wrapper für Kunden und Lieferanten ist. Die Klasse Privatkunde wurde entfernt, da sie nichts zum Kunden hinzufügt.

Ähnlich wurde auch der Auftrag abstrakt gemacht, da jeder Auftrag ein Kundenauftrag oder ein Eigenauftrag ist. Der Auftrag hat außerdem ein Status Enum bekommen, mit dem die verschiedenen Status eines Auftrags (angelegt, in Bearbeitung, abgeschlossen) abgebildet werden können.

Die Postenklasse wurde in Dienstleistungs- und Produktposten unterteilt, da die bisherige Implementation auf kein Preisfeld für Posten ohne Produkt hatte. Die Prostenklasse ist abstrakt und kann über die kosten Methode, die Kostenberechnung für die Postenarten abstrahieren.


#figure(
  image("Entwurfsklassendiagramm2.svg", width: 110%),
  caption: "Entwurfs-Klassendiagramm - Teil 2",
)<fig:entwurfs-klassendiagramm-2>


Zusätzlich zum Modelpackage wurde noch fünf weiter Packages erstellt, die die verschiedenen Aspekte des Entwurfs-Klassendiagramms abbilden. Diese sind:
- ImportExport
- Datenbank
- Views
- Controller
- Events

Das ImportExport-Packages enthält Funktionalitäten, um die verschiedene Im- und Exporte des Systems zu ermöglichen. Für das Standard-CSV-Format wurden Interfaces erstellt, die von den Modelklassen implemntiert werden. PDFs und Drucken werden über den PDF-Exporter und den PDF-Printer realisiert. Um zu viele statische Methoden zu vermeiden, werden diese als Singletons implementiert.

Das Datenbank-Package enthält eine abstrakte, generische EntityManager-Klasse. Für jede Modelklasse wird hier eine konkrete EntityManager-Klasse erstellt, die vom abstrakten EntityManager erbt und die Datenbankzugriffe managed. Im Diagramm sind exemplarisch nur der Auftrags- und MitarbeiterManager eingeziechnet. Der EntityManager hat außerdem eine EntityFactory, die das Erstellen der verschiedenen Modelobjekte übernimmt. Diese Factory ist auch als Singleton implementiert.
In der Implementierung wird dieses Package wahrscheinlich noch durch JPA Annotationen ergänzt.

Im Controller- und Event-Package sind exemplarisch verschiedene Events und Controller-Klassen eingeziechnet. Die Controller haben Zugriff auf Model- und UI-Klassen und die Events, die sie verwalten. Genauere Verfeinerungen hierzu kommen in der UML-UI Modelierung.
