// #set text(lang: "en")

#import "./theme.typ": (
  custom-title, education-heading, generic_2fr_1fr, generic_2x2, project-heading, resume, skills, work-heading,
  work-subheading,
)

#let t_months = "months"
#let t_years = "y"


#show: resume.with(
  name: "Artem Sotnichenko",
  // position: [Frontend Engineer | React, Vue, Angular | Georgia, Tbilisi],
  phone: "+995 220 518 825",
  email: "job@tem.sh",
  github: "temske",
  linkedin: "temske",
  telegram: "temuske",
  // location: "Senior Frontend Engineer | Georgia, Tbilisi",
)

#custom-title("About Me")[
  // *Frontend developer* with *5+ years of experience* working *on FinTech*, *SaaS* and *MedTech* projects, using *React*, *Vue*, and *Angular*. Building MVPs, debugging bugs in iOS webview, delivering production-ready features from start to finish, and *refactoring legacy* systems to modern stack. Worked in *teams of 2-10* people, writing *performant*, *reliable* and *testable* code. Focus on *UI/UX optimizations*, *developer experience*, and *collaboration*. Ability to *lead projects* and *mentor junior developers*.
  // Knowledge in *design tools* and *design principles*, with passion to built pretty and thoughtful interfaces.

  Senior Frontend Developer with 5+ years of experience specializing in FinTech, SaaS, and MedTech. Focused on design systems, architecture, performance, and quality gates for agent infrastructure. Delivering high-impact features: cutting Typescript build from 40 min to 2 min and setup QA agent pipeline at TradingView; led a full migration from a jQuery monolith to a TypeScript micro-frontend architecture at Saritasa.
]


#custom-title("Experience")[
  #work-heading(
    "TradingView",
    "",
    "",
    datetime(year: 2025, month: 11, day: 1),
    datetime.today(),
  )[
    _Global charting platform and social network for 50M+ traders and investors._
    - Architected and implemented a CI-based QA agentic pipeline, cutting the TypeScript build process from 40 minutes to 2 minutes and reducing regression testing time by 2-3x.
    - Led the native implementation of the Broker Selection Screen for the mobile app, collaborating with multiple mobile teams, improving Task Completion Rate by \~10%.
    - Engineered a data migration for order presets that reduced storage usage by 30% while ensuring 100% data integrity for all user accounts.
    - Built internal company tools, including Planning poker, Diff viewer. Received 50 heart reactions in Slack.
  ]

  #work-heading(
    "Saritasa",
    "",
    "",
    datetime(year: 2022, month: 1, day: 1),
    datetime(year: 2025, month: 11, day: 1),
  )[
    _US-based custom software development company delivering solutions for SMBs and enterprises._
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
    - Initiated and built a company-wide shared solutions repository for UI components, cutting average feature development time by \~20% across 10+ projects.
    // - Published an internal NPM library for ESLint/Prettier/Stylelint configurations, slashing new project setup time by 90% and enforcing consistent code quality company-wide.
    - Mentored and onboarded over 10 junior developers and interns, creating personalized development plans that accelerated their ramp-up time and contribution to project goals.
  ]

  #work-subheading("Project Highlight: Urban Infrastructure Platform")[
    - Architected and delivered a unified design system from scratch, enabling a large-scale rewrite of the main application and ensuring visual consistency for all future development.
    - Optimized performance of critical data tables by 60% (from 7s to 4s) by implementing virtualization and memoization, directly improving usability for data analysts.
    - Designed and launched an interactive map from basic idea to polished app, allowing users to visualize complex datasets with custom filters and shareable public links.
    - Implemented API code generation for DTOs and schemas, reducing time for new features by 5-20% and catching 5-10 bugs related to contracts.
    - Cut initial page load time by over 50% by reducing the main bundle size by 66% (1.5MB to 500KB) through code splitting and asset optimization and tuned Google Web Vitals (LCP -50%, FCP -12%, CLS -100%)
  ]

  #work-subheading("Project Highlight: Healthcare Legacy System Modernization")[
    - Migrated legacy monolith (jQuery, JavaScript) to a modern micro-frontend architecture using TypeScript.
    - Improved codebase stability by introducing a modern toolchain: implemented TypeScript for type safety, set up CI/CD pipelines with GitHub Actions for automated builds, and enforced code style with ESLint.
    - Formed an onboarding plan, wrote documentation, simplified and organized project initialization on new machine to one command, which reduced the time to integrate developers into the project from 5 days to 2.
  ]

  #work-heading(
    "Break to focus on university",
    "",
    "",
    datetime(year: 2021, month: 1, day: 1),
    datetime(year: 2021, month: 12, day: 1),
  )[
    // - Focusing on university
  ]

  #work-heading(
    "Sibdev",
    "",
    "",
    datetime(year: 2020, month: 9, day: 1),
    datetime(year: 2021, month: 1, day: 1),
  )[
    - Audited and resolved many UI inconsistencies between Figma designs and the production app, establishing a pixel-perfect standard and documenting guidelines for the team.
  ]
]


#custom-title("Skills")[
  #skills()[
    // *Languages/Frameworks/Libraries:* TypeScript, JavaScript (ES6+), Node.js, Go\
    // *Frameworks/Libraries:* React, Next.js, Redux, Zustand, Vue, Nuxt.js, Pinia, Angular, RxJS\
    // *UI & Styling:* MUI, Shadcn, Vuetify, Tailwind CSS, SCSS, CSS Modules, Framer Motion\
    // *Testing & Tooling:* Jest, Vitest, Playwright, Webpack, Vite, Docker, GitHub Actions\
    #let stack = sys.inputs.at("stack", default: "react")
    #if stack == "react" [
      *Technologies:* TypeScript, JavaScript (ES6+), Node.js, React, Next.js, Redux, Zustand\
      *UI & Styling:* MUI, Shadcn, Tailwind CSS, SCSS, CSS Modules, Framer Motion\
    ] else if stack == "vue" [
      *Technologies:* TypeScript, JavaScript (ES6+), Node.js, Vue, Nuxt.js, Pinia\
      *UI & Styling:* Vuetify, Shadcn, Tailwind CSS, SCSS, CSS Modules, Framer Motion\
    ] else if stack == "angular" [
      *Technologies:* TypeScript, JavaScript (ES6+), Node.js, Angular, RxJS\
      *UI & Styling:* Tailwind CSS, SCSS, CSS Modules, Framer Motion\
    ]
    // Tools
    *Tools:* Git, Claude, Jest, Vitest, Playwright, Webpack, Eslint, Oxlint, Vite, Docker, GitHub Actions\
  ]
]

// #custom-title("Education")[
//   #education-heading(
//     "Siberian Federal University",
//     // "Sep 2018 – Jul 2022",
//     "",
//     "Bachelor of Arts",
//     "Computer Software Engineering",
//     datetime(year: 2018, month: 9, day: 1),
//     datetime(year: 2022, month: 7, day: 1),
//   )[
//   ]
// ]


#v(4pt)

#generic_2fr_1fr(
  custom-title("Education")[
    #education-heading(
      "Siberian Federal University",
      // "Sep 2018 – Jul 2022",
      "",
      "Bachelor of Arts",
      "Computer Software Engineering",
      datetime(year: 2018, month: 9, day: 1),
      datetime(year: 2022, month: 7, day: 1),
    )[
    ]
  ],
  custom-title("Languages")[
    *Russian:* Native\
    *English:* Intermediate
  ],
)
