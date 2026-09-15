// styles
#let top-margin = 0.4in
#let bottom-margin = 0.2in
#let left-margin = 0.3in
#let right-margin = 0.3in

#let font = "New Computer Modern"
#let font-size = 11pt
#let personal-info-font-size = 10.5pt
#let author-position = center
#let personal-info-position = center

// i18n
#let t_months = state("months", "")
#let t_years = state("years", "")

#let resume(
  doc: "cv-artem-sotnichenko",
  name: "",
  position: "",
  phone: "",
  email: "",
  github: "",
  linkedin: "",
  telegram: "",
  location: "",
  lang: "en",
  body,
) = {
  if (lang == "en") {
    set text(lang: "en")
  } else {
    set text(lang: "ru")
  }
  if (lang == "en") {
    t_months.update("months")
  } else {
    t_months.update("месяцев")
  }
  if (lang == "en") {
    t_years.update("years")
  } else {
    t_years.update("года")
  }

  set document(
    title: doc,
    author: name,
    keywords: "cv",
    date: none,
  )

  set page(
    paper: "a4",
    margin: (
      top: top-margin,
      bottom: bottom-margin,
      left: left-margin,
      right: right-margin,
    ),
  )

  set text(
    font: font,
    size: font-size,
    lang: "en",
    ligatures: false,
  )

  show heading.where(
    level: 1,
  ): it => block(width: 100%)[
    #set text(font-size + 2pt, weight: "regular")
    #smallcaps(it.body)
    #v(-1em)
    #line(length: 100%, stroke: stroke(thickness: 0.4pt))
    #v(-0.2em)
  ]

  let contact_item(value, link-type: "", prefix: "") = {
    if value != "" {
      if link-type != "" {
        underline(offset: 0.3em)[#link(link-type + value)[#(prefix + value)]]
      } else {
        value
      }
    }
  }

  align(author-position, [
    #upper(text(font-size + 10pt, weight: "extrabold")[#name])
    #v(-1em)
  ])

  align(personal-info-position, text(personal-info-font-size)[
    #{
      let sepSpace = 0.2em
      let items = (
        contact_item(position),
      )
      items.filter(x => x != none).join("   ")
    }
    #v(-0.5em)
  ])

  align(personal-info-position, text(personal-info-font-size)[
    #{
      let sepSpace = 0.2em
      let items = (
        contact_item(location),
        contact_item(email, link-type: "mailto:"),
        contact_item(linkedin, link-type: "https://linkedin.com/in/", prefix: "linkedin.com/in/"),
        contact_item(github, link-type: "https://github.com/", prefix: "github.com/"),
        contact_item(telegram, link-type: "https://t.me/", prefix: "t.me/"),
      )
      items.filter(x => x != none).join(" | ")
    }
  ])

  body
}

// ---
// Custom functions

#let generic_1x2(r1c1, r1c2) = {
  grid(
    columns: (1fr, 1fr),
    align(left)[#r1c1], align(right)[#r1c2],
  )
}

#let generic_2x2(cols, r1c1, r1c2, r2c1, r2c2) = {
  // sanity checks
  assert.eq(type(cols), array)

  grid(
    columns: cols,
    align(left)[#r1c1 \ #r2c1],
    align(right)[#r1c2 \ #r2c2]
  )
}

#let custom-title(title, spacing-between: -0.5em, body) = {
  [= #title]
  body
  v(spacing-between)
}

// Custom list to be used inside custom-title section.
#let skills(body) = {
  if body != [] {
    set par(leading: 0.6em)
    set list(
      body-indent: 0.1em,
      indent: 0em,
      marker: [],
    )
    body
  }
}

// Converts datetime format into readable period.
#let period_worked(start-date, end-date) = {
  // sanity checks
  // assert.eq(type(start-date), datetime)
  assert(type(start-date) == datetime or type(start-date) == str)
  assert(type(end-date) == datetime or type(end-date) == str)

  if end-date == "" and start-date == "" {
    return []
  }

  if type(end-date) == str and type(start-date) == str {
    return [#start-date -- #end-date]
  }

  if type(end-date) == str and end-date == "Present" {
    end-date = datetime.today()
  }

  return [
    #if (type(start-date) == datetime) [
      #start-date.display("[month repr:short] [year]") --
    ] else [
      start-date
    ]
    #if (
      (end-date.month() == datetime.today().month()) and (end-date.year() == datetime.today().year())
    ) [
      Present
    ] else [
      #end-date.display("[month repr:short] [year]")
    ]
  ]
}

// Pretty self-explanatory.
#let work-heading(title, company, location, start-date, end-date, body) = {
  // sanity checks
  // assert.eq(type(start-date), datetime)
  assert(type(start-date) == datetime or type(start-date) == str)
  assert(type(end-date) == datetime or type(end-date) == str)

  let distance = ""
  if (type(start-date) == datetime and type(end-date) == datetime) {
    let days = (end-date - start-date).days()
    let months = calc.ceil(calc.rem(days, 365) / 30)
    let lang = context text.lang
    let t_months = if (lang != "en") [months] else [месяцев]
    let t_years = if (lang != "en") [years] else [лет]
    distance = [*#months #t_months |*]
    let years = calc.floor(days / 365)
    if (years > 0) {
      distance = [*#years #t_years #months #t_months |*]
    }
  }

  generic_2x2(
    (1fr, 1fr),
    [*#title*],
    [#distance *#period_worked(start-date, end-date)*],
    [#company],
    emph(location),
  )
  v(-0.2em)
  if body != [] {
    v(-0.4em)
    set par(leading: 0.6em)
    set list(indent: 0.5em)
    body
  }
}

#let work-subheading(title, body) = {
  if (title != []) [*#title*]

  v(-0.2em)
  if body != [] {
    v(-0.4em)
    set par(leading: 0.6em)
    set list(indent: 0.5em)
    body
  }
}

// Pretty self-explanatory.
#let project-heading(name, stack: "", project-url: "", body) = {
  if project-url.len() != 0 { link(project-url)[*#name*] } else {
    [*#name*]
  }
  if stack != "" {
    [
      #show "|": sep => {
        h(0.3em)
        [|]
        h(0.3em)
      }
      |*#stack*
    ]
  }
  v(-0.2em)
  if body != [] {
    v(-0.4em)
    set par(leading: 0.6em)
    set list(indent: 0.5em)
    body
  }
}

// Pretty self-explanatory.
#let education-heading(institution, location, degree, major, start-date, end-date, body) = {
  // sanity checks
  // assert.eq(type(start-date), datetime)
  assert(type(start-date) == datetime or type(start-date) == str)
  assert(type(end-date) == datetime or type(end-date) == str)

  generic_2x2(
    (70%, 30%),
    [*#institution*],
    [*#location*],
    [#degree, #major],
    period_worked(start-date, end-date),
  )
  v(-0.2em)
  if body != [] {
    v(-0.4em)
    set par(leading: 0.6em)
    set list(indent: 0.5em)
    body
  }
}
