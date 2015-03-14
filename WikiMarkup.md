=Wiki Markup und Syntax=

Umlaute sind ein Problem, aber wenn die Wiki-Seite UTF-8-Codiert ist, geht es. (Macht der Editor, in diesem Fall Notepad++.)

## Überschriften ##

Es gibt sechs Überschriftenebenen im Wiki, wirklich nutzbar sind aber nur die ersten drei bis vier. Die Syntax ist:

```
=Überschrift Ebene 1=
==Überschrift Ebene 2==
===Überschrift Ebene 3===
usw.
```

## Links ##

| **Syntax** | **Ergebnis** | **Beschreibung** |
|:-----------|:-------------|:-----------------|
| `WikiWordLink` | WikiWordLink  | Link auf eine andere Seite im gleichen Wiki. Wenn die Seite noch nicht existiert, wird ein <u>?</u> als Link angezeigt, über den die Seite dann angelegt werden kann. Funktioniert nur mit der Wiki-typischen Schreibweise, also ein zusammengesetztes Wort mit mehreren Großbuchstaben.|
| `[Anderewikiseite]` | [Anderewikiseite](Anderewikiseite.md) | Link auf eine andere Seite im gleichen Wiki, wenn die **nicht** in der Wiki-typischen Schreibweise benannt wurde. |
| `[Anderewikiseite beschreibender Text]` | [mit Beschreibung](Anderewikiseite.md) | Link auf eine andere Seite im gleichen Wiki, wobei der Link auf die Seite auf den Text nach dem ersten Leerzeichen lautet. |

Eine automatische Verlinkung verhindert ein vorangestelltes Ausrufezeichen. So etwa: WikiWordLink (Syntax: `!WikiWordLink`).

Externe Links funktionieren genau wie interne, nur das halt ein vollständiger URL angegeben werden muss:
```
[http://domain/page label]
http://domain/page
```

## Textauszeichnungen ##
```
*fett*
_kursiv_
`unformatierter Text`
escape: `*`
```

## Code-Block: ##
```
{{{
verbatim code block
}}}
```


## Listen/Aufzählungen ##

```
Indent lists 2 spaces:
  * bullet item
  # numbered list
```

Horizontale Linie:
```
----
```

Tabelle:
```
|| table || cells ||
```