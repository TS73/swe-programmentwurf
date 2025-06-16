= Entwurfs-Klassendiagramm

#figure(
  image("Entwurfsklassendiagramm1.svg", width: 110%),
  caption: "Entwurfs-Klassendiagramm - Teil 1",
)<fig:entwurfs-klassendiagramm-1>

Auf Basis des Analyse-Klassendiagramms wurde das Modelpackage des Entwurfs-Klassendiagramms erstellt. Dieses Diagramm hat einige Änderungen im Vergleich zum Analyse-Klassendiagramm erfahren, um die Ideen und Konzepte der Analyse zu konkretisieren und die Struktur des Modells zu optimieren.

Zu den Änderungen gehört unter anderem, dass aus der Zugriffsrechtsart ein Enum der beiden Zugriffsrechtsarten erstellt wurde. Außerdem wurde bei den Rollen eine Zugriffsmethode eingeführt, mit der sich der Zugriff auf bestimmte Objekte überprüfen lässt.

Die Klasse Geschäftspartner wurde abstrahiert, da diese lediglich als Wrapper für Kunden und Lieferanten diente. In diesem Zusammenhang wurde auch die Klasse Privatkunde entfernt, da sie keine zusätzlichen Eigenschaften oder Funktionalitäten gegenüber der Klasse Kunde bot.

Auch die Klasse Auftrag wurde abstrahiert, da jeder Auftrag entweder ein Kundenauftrag oder ein Eigenauftrag ist. Zusätzlich wurde ein Status Enum eingeführt, mit dem die verschiedenen Status eines Auftrags (angelegt, in Bearbeitung, abgeschlossen) abgebildet werden können.

Die Klasse Posten wurde in Dienstleistungs- und Produktposten unterteilt, da die bisherige Implementierung über kein Preisfeld für Posten ohne Produkt verfügte. Die Klasse Posten ist nun abstrakt und kann über die Methode kosten die Kostenberechnung für die Postenarten abstrahieren.


#figure(
  image("Entwurfsklassendiagramm2.svg", width: 110%),
  caption: "Entwurfs-Klassendiagramm - Teil 2",
)<fig:entwurfs-klassendiagramm-2>


Zusätzlich zum Modelpackage wurden noch fünf weiter Packages erstellt, welche die verschiedenen Aspekte des Entwurfs-Klassendiagramms abbilden.

Diese sind:
- ImportExport
- Datenbank
- Views
- Controller
- Events

Das ImportExport-Package enthält die Funktionalitäten zur Umsetzung der verschiedenen Im- und Exportvorgänge des Systems. Für das Standard-CSV-Format wurden Interfaces definiert, die von den jeweiligen Modellklassen implementiert werden. Der Export von PDFs und Druckvorgänge erfolgen über den PDF-Exporter und den PDF-Printer. Um eine Überverwendung statischer Methoden zu vermeiden, werden diese als Singletons implementiert.

Das Datenbank-Package enthält eine abstrakte, generische EntityManager-Klasse. Für jede Modellklasse wird hier eine konkrete EntityManager-Klasse erstellt, die vom abstrakten EntityManager Klasse erbt und die jeweiligen Datenbankzugriffe managed. Im Diagramm sind exemplarisch nur der Auftrags- und MitarbeiterManager dargestellt. Der EntityManager verwendet außerdem eine EntityFactory, die das Erstellen der verschiedenen Modelobjekte übernimmt. Diese Factory ist ebenfalls als Singleton implementiert.
In der Implementierung wird dieses Package voraussichtlich durch JPA Annotationen ergänzt.

Die Events und zugehörigen Event-Observer Interfaces sind im Events-Package zusammengefasst. Hier wird zwischen Update- und GUI-Events unterschieden. Die Events selber sind komplexe Enums, welche die verschiedenen Ereignisse und Befehle im System abbilden.

Im Controller Package sind exemplarisch verschiedene Controller-Klassen dargestellt. Die Controller implementieren mindestens ein Event-Observer Interface und haben Zugriff auf sowohl die Model- als auch die UI-Klassen, welche sie verwalten. Genauere Verfeinerungen hierzu erfolgen in der UML-UI Modelierung.
