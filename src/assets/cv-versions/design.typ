#let cream = rgb("F0E5C5")
#let ink = rgb("332B1C")
#let green = rgb("E2F4CB")
#let data = json("data.json")
#let label(body) = text(size: 7.5pt, weight: "medium", tracking: 0.7pt, upper(body))
#let display(body, size: 26pt) = text(font: "Barlow", stretch: 75%, weight: "medium", size: size, body)
#let rule() = line(length: 100%, stroke: 0.6pt + ink)
#let setup(body, variant: "01 / MANIFEST", compact: false) = {
  set document(title: "Artem Sotnichenko | Frontend developer", author: "Artem Sotnichenko")
  set page(paper: "a4", fill: cream, margin: (x: 15mm, top: 12mm, bottom: 15mm), footer: context {
    rule()
    v(3pt)
    grid(columns: (1fr, auto), label("ARTEM SOTNICHENKO / CURRICULUM VITAE"), label(str(counter(page).get().first()) + " / " + str(counter(page).final().first())))
  })
  set text(font: "IBM Plex Mono", size: if compact { 9pt } else { 10pt }, fill: ink, lang: "en")
  set par(leading: 0.55em, spacing: 7pt)
  set list(indent: 0pt, body-indent: 10pt, spacing: 7pt, marker: [·])
  grid(columns: (1fr, auto), label("FRONTEND DEVELOPMENT"), label(variant))
  rule()
  v(8pt)
  body
}
#let contacts() = text(size: 7.5pt)[
  #link("mailto:moetazaneta@gmail.com")[moetazaneta\@gmail.com] #h(1fr) #link("https://linkedin.com/in/moeta")[linkedin.com/in/moeta]\
  #link("https://t.me/tem_kg")[t.me/tem_kg] #h(1fr) #link("tel:+996220518825")[+996 220 518 825]
]
#let hero(split: false) = {
  display(if split { [ARTEM\ SOTNICHENKO] } else { [ARTEM SOTNICHENKO] }, size: if split { 49pt } else { 43pt })
  v(3pt)
  grid(columns: (1fr, auto), label("Frontend developer / 5+ years"), label("Tbilisi, Georgia"))
  v(7pt)
  contacts()
  v(7pt)
  rule()
}
#let section(n, title) = block(above: 13pt, below: 8pt, sticky: true, width: 100%, fill: green, inset: 5pt, stroke: 0.6pt + ink)[
  #grid(columns: (25pt, 1fr), label(n), display(title, size: 22pt))
]
#let job(name, dates) = block(above: 9pt, below: 7pt, sticky: true)[
  #grid(columns: (1fr, auto), display(name, size: 21pt), align(bottom, label(dates)))
]
#let bullets(items) = list(..items)
#let project(title, stack, items) = {
  block(above: 8pt, below: 5pt, sticky: true)[#text(weight: "semibold", title) #h(1fr) #label(stack)]
  bullets(items)
}
#let skills() = {
  for pair in data.skills {
    block(above: 7pt, below: 3pt, sticky: true, label(pair.at(0)))
    [#pair.at(1)]
    parbreak()
  }
}
#let education() = [
  #text(weight: "semibold")[Siberian Federal University]\
  Bachelor of Arts\
  Computer Software Engineering\
  #label("Sep 2018 to Jul 2022")
]
#let continuation(title) = {
  display(title, size: 36pt)
  v(4pt)
  label("ARTEM SOTNICHENKO / FRONTEND DEVELOPER")
  v(8pt)
  rule()
}
