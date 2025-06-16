= GUI-Modell

#figure(
  image("gui-modell.svg", width: 110%),
  caption: "Exemplarisches GUI-Modell für den RechnungErstellenView",
)<fig:gui-modell>

Die GUI-Modellierung als Verfeinerung des Entwurfs-Klassendiagramm (#ref(<fig:entwurfs-klassendiagramm-1>) und #ref(<fig:entwurfs-klassendiagramm-2>)) erfolgt hier nur exemplarisch für den Rechnungserstellungsview (Mockup: #ref(<fig:rechnung-erstellen>)).

Für die Übersichtlichkeit wird Packagezugehörigkeit über Farbkodierung dargestellt.
Der RechnungErstellenView, der hier verfeinert wird, ist pink.

Das Component-Package ist in Blau dargestellt. Alle Komponenten erben von der abstrakten Klasse ObservableComponent, die Teil des Observer-Patterns ist. Für die Übersichtlichkeit wurde nur exemplarisch bei PostenComponent der Vererbungspfeil gezeichnet. ObservableComponent erbt wiederum von JComponent, wodurch alle Komponenten auch die Funktionalitäten von JComponent erben.

In Orange sind die relevanten Controller des Controller-Packages dargestellt, diese implementieren die Event-Observer-Interfaces aus dem Events-Package in rot. Den Events wurden die für diese Verfeinerung relevanten Enum-Varianten zugeordnet.


Dieses Diagramm verwendet externe Packages. Die Standard Swing- und AWT-Komponenten, welche von unseren Komponenten verwendet werden, sind dunkelblau. Die Vererbung von JComponent ist hier für die Übersichtlichkeit nicht explizit dargestellt.

Das letzte Package, in grün, ist PDF-Box. Dabei handelt es sich um eine externe Bibliothek, die für das Rendern von PDFs verwendet wird. Diese Bibliothek wird von der RechnungsViewComponent verwendet, um die Rechnungs-PDF anzuzeigen.

Eine interessante Modelierung ergibt sich bei dem Navigation Component. Um beliebige Navigationstiefen abzubilden, kann diese Komponente eine weitere NavigationComponent referenzieren. So ergibt sich eine rekursive Struktur, die einer verketteten Liste ähnelt, womit beliebig viele Navigationselemente in der GUI abgebildet werden können.

== Aufbau eines GUI-Beispiels

#figure(
  image("gui-aufbau.svg", width: 110%),
  caption: "Bestandteile des GUI bei Verwendung von Java Swing",
)<fig:gui-aufbau>

In dieser Abbildung ist der RechnungserstellungsView exemplarisch in die SWING-Bestandteile einer möglichen Realisierung in JAVA aufgeteilt worden. 
Hierbei basiert das GUI zunächst auf einem JFrame, welches das Hauptfenster für die vier JPanels darstellt. 

Das obere Panel, welches nach "NORTH" gerichtet ist beinhaltet zum einen die bereits im GUI-Modell beschriebene Navigation, welche durch einen Navigations-Balken realisiert wird. Hierbei ist zu beachten, dass die Komponente nicht als SWING- Element gekennzeichnet ist. 
Dies ist damit zu begründen, dass innerhalb dieser zwar JLabels und JIcons verwendet werden, es sich jedoch bei dem gesamten Navigations-Balken nicht um eine SWING-Komponente handelt. 
Somit handelt es sich hierbei um eine eigene Komponente??

Zusätzlich ist in diesem Panel der Seitentitel in Form eines JLabels, sowie ein weiteres JPanel mit Informationen zum Profil des Nutzers (Name, Profilbild) abgebildet. 

Das nächste JPanel mit der Ausrichutng "WEST" beinhaltet neben dem JLabel und einer JCombobox zwei weiter JPanels. Diese beinhalten jeweils einen JScrollpane mit einer JTable, sowie diverse JTextFields oder auch JButtons. 
Diese haben jeweils den Zweck den Input für die Erstellung der Rechnung zu steuern, sodass der Nutzer die Leictungs- und Materialposteneintragen kann. 

Im JPanel in Richtung "EAST", wird dafür eine live Vorschau der erstellten Rechnung geliefert. 
Hierbei ist zu beachten, dass der PDFRenderer ebenfalls keine Java SWING Komponente ist, dies ligt daran, dass wie bei dem Navigations-Balken ebenfalls noch mehr Logik hinter der Derstellung liegt als eine einzele SWING Komponente, weshalb es sich hier auch um eine eigene ... handelt. 

Im letzten JPanel mit der Richtung "SOUTH" sind schließlich drei JButtons mit den Funktionalitäten "Abbrechen", "Entwurf speichern" und "Erstellen und Senden", welche die Rechnung entsprechend verwalten.


