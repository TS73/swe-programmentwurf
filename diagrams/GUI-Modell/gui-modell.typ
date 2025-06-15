= GUI-Modell

#figure(
  image("gui-modell.svg", width: 110%),
  caption: "Exemplarisches GUI-Modell für den RechnungErstellenView",
)<fig:gui-modell>

Die GUI-Modellierung als Verfeinerung des Entwurfs-Klassendiagramm (#ref(<fig:entwurfs-klassendiagramm-1>) und #ref(<fig:entwurfs-klassendiagramm-2>)) erfolgt hier nur exemplarisch für den Rechnungserstellungsview (Mockup: #ref(<fig:rechnung-erstellen>)).

Für die Übersichtlichkeit wird Packagezugehörigkeit über Farbkodierung dargestellt.
Der RechnungErstellenView, der hier verfeinert wird, ist pink.

Das Component-Package ist in Blau dargestellt. Alle Komponenten erben von der abstrakten Klasse ObservableComponent, die Teil des Observer-Patterns ist. Für die Übersichtlichkeit wurde nur exemplarisch bei PostenComponent der Vererbungspfeil gezeichnet. ObservableComponent erbt wiederum von JComponent, wodurch alle Komponenten auch die Funktionalitäten von JComponent erben.

In orange sind die relevanten Controller des Controller-Packages dargestellt, diese implementieren die Event-Observer-Interfaces aus dem Events-Package in rot. Den Events wurden die für diese Verfeinerung relevanten Enum-Varianten zugeordnet.


Dieses Diagramm verwendet externe Packages. Die Standard Swing- und AWT-Komponenten, die von unseren Komponenten verwendet werden, sind dunkelblau. Die Vererbung von JComponent ist hier für die Übersichtlichkeit nicht explizit dargestellt.

Das letzte Package, in grün, ist PDF-Box. Dabei handelt es sich um eine externe Bibliothek, die für das Rendern von PDFs verwendet wird. Diese Bibliothek wird von der RechnungsViewComponent verwendet, um die Rechnungs-PDF anzuzeigen.

Eine interessante Modelierung ergibt sich bei der Navigation Component. Um beliebige Navigationstiefen abzubilden, kann diese Komponente eine weitere NavigationComponent referenzieren. So ergibt sich eine rekursive Struktur, die einer verketteten Liste ähnelt, womit dann beliebig viele Navigationselemente in der GUI abgebildet werden können.
