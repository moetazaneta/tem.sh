// #set text(lang: "en")

#import "./theme.typ": custom-title, education-heading, project-heading, resume, skills, work-heading, work-subheading

#let t_months = "months"
#let t_years = "y"


#show: resume.with(
  name: "Artem Sotnichenko",
  // position: [Frontend Engineer | React, Vue | 4+ years of experience | Georgia, Tbilisi],
  phone: "+996 220 518 825",
  email: "moetazaneta@gmail.com",
  // github: "moetazaneta",
  linkedin: "moeta",
  telegram: "tem_kg",
  location: "Georgia, Tbilisi",
)

#custom-title("About Me")[
  *Frontend developer* with *5+ years of experience* working *on FinTech*, *SaaS* and *MedTech* projects, using *React*, *Vue*, and *Angular*. Building MVPs, debugging bugs in iOS webview, delivering production-ready features from start to finish, and *refactoring legacy* systems to modern stack. Worked in *teams of 2-10* people, writing *performant*, *reliable* and *testable* code. Focus on *UI/UX optimizations*, *developer experience*, and *collaboration*. Ability to *lead projects* and *mentor junior developers*.
  Knowledge in *design tools* and *design principles*, with passion to built pretty and thoughtful interfaces.
]


#custom-title("Experience")[
  #work-heading(
    "TradingView",
    "",
    "",
    datetime(year: 2025, month: 11, day: 1),
    datetime.today(),
  )[
    - Building Order Panel and Account Manager for the Supercharts product.
    - Led the native implementation of the Broker Selection screen in the mobile app, collaborating with several mobile teams, improving user satisfaction by \~10%.
    - Led the order presets storage migration, ensuring existing presets were preserved while improving loading speed by \~100% and reducing storage usage by \~5%.
    - Led the redesign of order information and crypto order tickets through multiple rounds of user feedback and iteration.
    - Contributed to internal company tools: Planning poker, Diff viewer.
    - Conducting technical interviews as part of the recruitment process.
    - Participated in AI adoption: introduced custom skills and practices.
  ]

  #work-heading(
    "Saritasa",
    "",
    "",
    datetime(year: 2022, month: 1, day: 1),
    datetime(year: 2025, month: 11, day: 1),
  )[

  ]

  #work-heading(
    "Company-Wide Initiatives & Mentorship",
    "",
    "",
    "",
    "",
    // datetime(year:2022, month:1, day:1),
    // datetime(year:2024, month:2, day:1),
  )[
    - Initiated and built a company-wide shared solutions repository (React/Vue components, Figma assets), cutting average feature development time by \~20% across 10+ client projects.
    // - Published an internal NPM library for ESLint/Prettier/Stylelint configurations, slashing new project setup time by 90% and enforcing consistent code quality company-wide.
    - Mentored and onboarded over 10 junior developers and interns, creating personalized development plans that accelerated their ramp-up time and contribution to project goals.
  ]

  #work-subheading("Project Highlight: Urban Infrastructure Platform | React")[
    - Architected and delivered a unified design system from scratch, enabling a large-scale rewrite of the main application and ensuring visual consistency for all future development.
    - Optimized performance of critical data tables by 40% (from 7s to \<5s) by implementing virtualization and memoizing selectors, directly improving usability for data analysts.
    - Designed and launched an interactive map feature using \@vis.gl/react-google-maps, allowing users to visualize complex datasets with custom filters and shareable public links.
  ]

  #work-subheading("Project Highlight: Healthcare Legacy System Modernization | Vue")[
    - Led the migration of a 6-year-old monolithic application (jQuery, Vue 2, Vuex) to a modern micro-frontend architecture using Vue 3, TypeScript, and Pinia.
    // - Reduced new developer onboarding time from 5 days to 2 by creating comprehensive project documentation and a structured onboarding plan.
    - Improved codebase stability by introducing a modern toolchain: implemented TypeScript for type safety, set up CI/CD pipelines with GitHub Actions for automated builds, and enforced code style with ESLint.
    - Formed an onboarding plan and wrote project documentation, which reduced the time to integrate new developers into the project from 5 days to 2.
  ]

  #work-subheading("Project Highlight: ERP/CRM Applications | React, Vue")[
    - Cut initial page load time by over 50% by reducing the main bundle size by 66% (from ~1.5MB to 500KB) through code splitting and asset optimization and tuned Google Web Vitals (LCP -50%, FCP -12%, CLS -100%)
    - Collaborated with backend engineers to implement automatic code generation for the API layer, reducing time for new features by 5-20%.
  ]

  #work-heading(
    "Sibdev | Vue",
    "",
    "",
    datetime(year: 2020, month: 9, day: 1),
    datetime(year: 2021, month: 1, day: 1),
  )[
    - Audited and resolved many UI inconsistencies between Figma designs and the production app, establishing a pixel-perfect standard and documenting guidelines for the team.
    - Refactored and shipped 5+ new components for a shared UI library used across multiple teams, improving code reusability and development speed.
    - Implemented i18n localization using the vue-i18n library, enabling the application to support multiple languages and expand into new markets.
  ]
]


#custom-title("Skills")[
  #skills()[
    *Languages:* TypeScript, JavaScript (ES6+), Node.js, Go\
    *Frameworks/Libraries:* React, Redux, Zustand, Vue, Pinia, Angular, RxJS\
    *UI & Styling:* MUI, Shadcn, Vuetify, Tailwind CSS, SCSS, CSS Modules, Framer Motion\
    *Testing & Tooling:* Jest, Vitest, Playwright, Webpack, Vite, Docker, GitHub Actions\
  ]
]

#custom-title("Education")[
  #education-heading(
    "Siberian Federal University",
    "",
    "Bachelor of Arts",
    "Computer Software Engineering",
    datetime(year: 2018, month: 9, day: 1),
    datetime(year: 2022, month: 7, day: 1),
  )[
  ]
]
