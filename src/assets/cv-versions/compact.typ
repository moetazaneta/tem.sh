#import "design.typ": *
#show: setup.with(variant: "03 / CONCISE", compact: true)
#hero()
#v(7pt)
Frontend developer with 5+ years in FinTech, SaaS, and MedTech. Builds interfaces with React, Vue, and Angular. Focused on performance, design systems, legacy modernization, and mentoring.
#section("01", "Experience")
#job("TradingView", "Nov 2025 to present")
#bullets((data.trading.at(0), data.trading.at(1), data.trading.at(2), "Led order information and crypto order ticket redesigns. Contributed to internal tools, technical interviews, and AI adoption."))
#job("Saritasa", "Jan 2022 to Nov 2025")
#bullets((
  "Built shared React/Vue components and Figma assets, cutting average feature development time by approximately 20% across 10+ client projects. Mentored 10+ junior developers and interns.",
  "Built an urban infrastructure design system and interactive maps. Improved data-table performance by 40% using virtualization and memoized selectors.",
  "Led a healthcare monolith migration to Vue 3, TypeScript, and Pinia micro-frontends. Introduced CI/CD and reduced onboarding from 5 days to 2.",
  "Cut ERP/CRM initial load time by over 50% and bundle size by 66%. API code generation reduced feature development time by 5% to 20%.",
))
#job("Sibdev", "Sep 2020 to Jan 2021")
Resolved UI inconsistencies, shipped 5+ shared components, and added multilingual support with vue-i18n.
#section("02", "Technical skills")
#for pair in data.skills [#text(weight: "semibold", pair.at(0)) #h(4pt) #pair.at(1) #parbreak()]
#section("03", "Education")
#grid(columns: (1fr, auto), [*Siberian Federal University*\ Bachelor of Arts, Computer Software Engineering], label("Sep 2018 to Jul 2022"))
