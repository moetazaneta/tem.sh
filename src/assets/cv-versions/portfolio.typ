#import "design.typ": *
#show: setup.with(variant: "02 / PORTFOLIO")
#hero(split: true)
#v(10pt)
#grid(columns: (49mm, 1fr), gutter: 8mm,
  [
    #label("01 / PROFILE")
    #v(6pt)
    #data.summary
    #section("02", "Toolkit")
    #set text(size: 8pt)
    #skills()
  ],
  [
    #label("03 / EXPERIENCE")
    #job("TradingView", "")
    #label("Nov 2025 to present")
    #bullets(data.trading)
    #job("Saritasa", "")
    #label("Jan 2022 to Nov 2025")
    #bullets(data.mentoring)
  ]
)
#pagebreak()
#continuation("PROJECT RECORD")
#section("04", "Saritasa / selected work")
#project("Urban infrastructure platform", "REACT", data.urban)
#project("Healthcare legacy modernization", "VUE", data.health)
#project("ERP / CRM applications", "REACT / VUE", data.erp)
#section("05", "Earlier experience")
#job("Sibdev", "Sep 2020 to Jan 2021")
#bullets(data.sibdev)
#section("06", "Education")
#education()
