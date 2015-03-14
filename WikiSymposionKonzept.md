﻿=Konzept=



## Konzepte ##

### Installation ###

  * Entweder nur ein Forum oder als Foren-Host. Ein einzelnes Forum erlaubt das Anlegen von Boards. Alle Boards sind zusammen unter einer Oberfläche erreichbar. Ein Foren-Host erlaubt das Anlegen mehrerer Foren, die nicht unter einer gemeinsamen Oberfläche erreichbar sind. (Oder doch? Oder nur für Admin/Besitzer?). Jedes einzelne Forum erlaubt das Anlegen von Boards. Ein einzelnes Forum wird so angelegt, dass es unter der Adresse `http://<forenname>.appspot.com` erreichbar ist. Im Foren-Host lautet die Adresse `http://<hostname>.appspot.com/<forenname>`. Diese Funktion erfordert einen Konfigurationssschritt beim installieren und die Angabe von Forenname (Pflicht) und Hostname (Nur für Forenhost) und dann ggf. mehrerer Forennamen.
  * Per Konfiguration: Für alle (anonym) les- und schreibbar ODER für alle lesbar aber nur nach Anmeldung schreibbar ODER nur nach Anmeldung les- und schreibbar

### Anmeldung ###

  * Anmeldung per Google-Konto
  * Eigene Benutzerverwaltung

Erstmal Anmeldung per Google-Konto, da das Forum dabei seinen eigenen Besitzer erkennt. Anmeldung über eigene Benutzerverwaltung so gestalten, dass der Besitzer des Forums automatisch beim Installieren als (nicht löschbarer und nicht sperrbarer) Administrator in die Benutzerverwaltung eingetragen wird? Oder so, dass das Forum ihn weiterhin automatisch erkennt?

### Benutzbarkeit ###

**Lesen und schreiben für alle öffentlich**

Name selber eingeben, im Cookie speichern (oder so, geht das überhaupt?)
Möglichkeit für Admin zum anmelden muss gegeben sein, also mindestens über Google-Konto.

**Lesen öffentlich, schreiben nach Anmeldung**

  * Anmeldung über Google
  * Eigene Benutzerverwaltung

![http://symposion-bb.googlecode.com/svn/wiki/WikiSymposionAnmeldung.jpg](http://symposion-bb.googlecode.com/svn/wiki/WikiSymposionAnmeldung.jpg)

### Rechte und Rollen ###

Rollen:
  * Benutzer, unangemeldet
  * Benutzer, angemeldet
  * Moderator
  * Administrator

Rechte:
  * Schreiben
  * Lesen
  * Moderieren
  * Administrieren

### Mehrsprachigkeit ###

Forumsweite Standardsprache, durch Administrator bei der Installation festgelegt.

### Umgang mit SPAM ###

  * Geeignetes Verfahren, um die Anmeldung von Spambots zu vermeiden (Captchas scheiden aus... Vielleicht Rechenaufgaben oder Wortpaare finden? Ist dann gleich auch ein Intelligenztest... ;))
  * Falls das Versagt: Funktion zum ECHTEN löschen von Benutzern inklusiv all seiner Beiträge

### Organisation der Inhalte ###

  * Unterteilung in Boards
  * Sichtbarkeit der Boards auf Gruppenebene einstellen können.

### Moderation ###

  * Möglichkeit vorsehen, zeitweise oder immer Kommentare erst nach Sichtung durch Moderator freizugeben. (Generell, Benutzerbezogen, Benutzergruppenbezogen?)

### Ignorieren ###

In der Thread-Form werden alle Ignorierte und alle dort angehängte Beiträge nicht angezeigt. Und in der Nicht-Thread-Form geht das wohl nicht. (Thread-Form: Kommentare beziehen sich auf einen bestimmten Kommentar bzw. ein konkretes Posting. Nicht-Thread-Form: Alle Kommentare beziehen sich immer auf das Ursprungs-Posting.)

### Bewertung ###

  * Am Thread mehrere Handlungsmöglichkeiten wie "gefällt mir", "gefällt mir nicht" ... ach quatsch, es soll eher eine Bewertungsfunktion (++, +, -, --) geben.

### Archivierung ###

Beiträge, die sich seit 30 Tagen (oder einen einstellbaren Zeitraum, einschließlich "nie") nicht mehr geändert haben, werden archiviert und können dann nicht mehr kommentiert werden. Beim archivieren können evtl. auch als "gelöscht" markierte Beiträge wirklich gelöscht werden. (Wenn es sowas gibt.)

Der Moderator kann ganze Boards archivieren.

Wie wird das Archiv eingebunden bzw. angezeigt? Extra "Archiv"-Board, in das Beiträge verschoben werden? Oder ein Link am Ende des jeweiligen Boards, in dem ältere Artikel stehen? Oder gar nicht, einfach nur kein "Kommentieren"-Button mehr anbieten?

### Weitere Funktionen ###

  * Möglichkeit zum initiieren einer Abstimmung
  * Bilder einfügen (barrierefreiheit gewährleistet?)
  * Einladungssystem: Benutzer können sich nicht mehr selber anmelden, sondern müssen von einem Benutzer eingeladen werden. (Angabe von Benutzername und Email-Adresse durch den Einladenden). Aus diesem System könnte man dann auch ein Beziehungsgeflecht ableiten und für das Bewertungs-/Reputationssystem benutzen.
  * Signaturen: Jeder Benutzer kann sich eine Signatur erstellen, die unter jedem seiner Beiträge angezeigt wird. (Mit Beitrag gespeichert, also alte Signaturen werden weiterhin angezeigt, oder wird auch bei älteren Beiträgen die aktuelle Signatur angezeigt? Die Frage alleine zeigt doch schon, dass Signaturen albern und unnütz sind.) Ob Signaturen angezeigt werden, kann jeder Benutzer in seinem Profil selber einstellen. Per Default werden Signaturen NICHT angezeigt.
  * Thread-Eröffner kann Thread selber schließen. (Nach mindestens 2h oder so. Oder 48h? Oder nach einer für alle konfigurierbaren Zeit? Ist das überhaupt sinnvoll?)

### Layout ###

![http://symposion-bb.googlecode.com/svn/wiki/WikiSymposionLayout.jpg](http://symposion-bb.googlecode.com/svn/wiki/WikiSymposionLayout.jpg)

**Typografie** beachten, es soll ein ausgesprochen gutaussehendes Forum werden!


---


## ToDos/Notes ##

  * Layout für ein Forum mit nur einem Board?


---


## Funktionen ##

### Benutzer ###

Benutzer anlegen/registrieren
Benutzer löschen
Benutzer anmelden
Benutzer abmelden
Email-Adresse ändern
Passwort ändern
Neues Passwort anfordern

#### Profilbezogen ####

Emailbenachrichtigung aktivieren
Emailbenachrichtigung deaktivieren (1-klick auch aus der Email heraus)

#### Forumsfunktionen ####

Beitrag anlegen
Beitrag kommentieren
Beitrag bearbeiten (nur eigenen)(?)
Beitrag löschen (nur eigenen) (?)
Beitrag bewerten
Beitrag/Kommentar melden

#### Benutzerbezogen ####

Benutzer eine Nachricht schicken
Nachricht ansehen
Nachricht löschen

### Moderator ###

Thread schließen

### Administrator ###

#### Benutzerbezogen ####

Benutzer verwarnen
Benutzer sperren
Benutzer löschen (durch Admin)
  * mit allen Beiträgen (SPAMbot)
  * nur Benutzer (=sperren? oder Benutzer löschen und Beiträge von dem einem Standardbenutzer "Gelöschter Benutzer" zuweisen?)
|Benutzer sperren|Ein gesperrter Benutzer wird abgemeldet und bekommt bei einer erneuten Anmeldung im Zeitraum der Sperre eine Nachricht, die ihn über die Sperre, deren Grund und deren Dauer informiert. ("Hallo `<Benutzername>`, Du wurdest von einem Moderator wegen eines Verstoßes gegen die Forenregeln gesperrt. Deine Sperre läuft bis zum 01.01.1970. Anschließend steht Dir das Forum wieder wie bisher zur Verfügung."|
|:---------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
Benutzerrolle ändern (Benutzer, Moderator, Administrator(?))

#### Konfigurationsbezogen ####

Standardsprache angeben
Standardsprache ändern
Forum anlegen
Board anlegen
Board umbenennen
Board löschen
Board archivieren(?)
Boardsichtbarkeit für verschiedene Benutzergruppen festlegen.

#### Forumsbezogen ####

Beitrag löschen
Beitrag editieren (?)
Beitrag/Kommentar freigeben (bei entsprechender Konfiguration)
Thread schließen
Beitrag als "Wichtig" o.ä. markieren, so dass er immer zu Beginn eines Boards angezeigt wird.

## Ablauf ##

Aufruf der Seite .../index.jsp:
  * Als Admin: Neues Forum anlegen
  * Für alle anderen: 404 ODER Begrüßungsseite mit LInk auf das Symposion-Forum ODER gleich Weiterleitung auf Forum?

## Reihenfolge der Entwicklung ##

  1. Installation:
    * Kann die Anwendung vor der Installation so konfiguriert werden, dass sie ein einzelnes Forum bzw. einen Forenhost installiert?
    * Können die verschiedenen Anmeldeverfahren per Konfiguration voreingestellt werden?