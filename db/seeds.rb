



50.times {Org.create(
  name: "Example Org #{rand(0..1000000)}",
  initials: "EO",
  city: "Buenos Aires",
  address: "1242 Av Libertador, 5-D",
  telephone: "(123)456-7894",
  email: "example@email.com",
  website: "www.example.com",
  transparency: LEVELS.sample,
  youtube: "http://www.youtube.com/embed/LHKLS6TECTA",
  mission: "Do no Evil",
  fte: 23,
  pte: 12,
  volunteers: 42,
  leader_name: "Bartolomeo de las Casas",
  leader_title: "Executive Director",
  founding_date: Date.parse('31-10-1975'),
  starting_date: Date.parse('01-12-1978'),
  legal_type: "Foundation",
  legal_num: "123-123-123",
  cuit: "523-5243-8",
  trans_policy: [true,false].sample,
  vat_exempt: [true,false].sample,
  income_exempt: [true,false].sample,
  tax_ded: [true,false].sample,
  code_conduct:[true,false].sample,
  external_auditor: [true,false].sample,
  auditor_name: "Ernst & Young",
  annual_reporting: [true,false].sample,
  external_prog_eval: [true,false].sample,
  num_prog_ind: Random.rand(0..20),
  num_prog_org:Random.rand(0..20),
  num_prog_pub:Random.rand(0..20),
  facebook: "www.facebook.com",
  linkedin: "www.linkedin.com",
  twitter:"CIPPEC",
  logo_url: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ9tf5cX2cqeC-Xd8o_S2uCadlMDyYx7THn76V0S36rVe9DagYf"

)}



# need to seed objectives after merge

PROVINCES.each {|prov| Province.create(name: prov)}
CAUSES.each {|cause| Cause.create(description: cause)}
ACTIVITIES.each {|act| Activity.create(description: act)}
AGES.each {|age| Age.create(description: age)}
LEGALS.each {|type| Legal.create(legal_type: type)}

Org.all.each do |seed_org|
  3.times do
    myloc = Location.new(primary: false)
    myloc.province = Province.find_by_name(PROVINCES.sample)
    seed_org.locations << myloc
  end

  seed_org.locations.first.update_attributes(primary: true)
  seed_org.branches << Branch.create( description: "sdfsdfs")
  seed_org.branches << Branch.create( description: "Fakeasdadsdet_name")
  seed_org.causes << Cause.find_by_description(CAUSES.sample)
  seed_org.causes << Cause.find_by_description(CAUSES.sample)
  seed_org.activities << Activity.find_by_description(ACTIVITIES.sample)
  seed_org.activities << Activity.find_by_description(ACTIVITIES.sample)
  seed_org.ages << Age.find_by_description(AGES.sample)
  seed_org.legal = Legal.first
  seed_org.board = Board.create(btype: "executive board")
  seed_org.affiliations << Affiliation.create(aff_name: "Fundacion Navarro Viola", aff_type: "National Foundation", aff_description: "Co-gestion del Concurso de Proyectos Sociales - nuestros Mayores. ")
  seed_org.affiliations << Affiliation.create(aff_name: "Embajada de Suiza", aff_type: "International Government", aff_description: "Colaboracion en el desarrollo del Concurso 'Segundos para Todos'.")
  seed_org.networks << Network.create(net_name: "RACI", net_scope: "National", net_status: "Member")
  seed_org.networks << Network.create(net_name: "AEDROS", net_scope: "National", net_status: "Member")
  seed_org.prizes << Prize.create(prize_name: "Mejor Think Tanks de Argentina", prize_date: '31-12-2010' , prize_giver: "Universidad de Pennsylvania")
  seed_org.prizes << Prize.create(prize_name: "Premio Juscelino Kubitchek", prize_date: '31-02-2010', prize_giver: "BID")
  seed_org.board.people << Person.create(name: "Faker::Name.name")
  seed_org.board.people << Person.create(name: "Faker::Name.name")
  seed_org.advisory = Advisory.create()
  seed_org.advisory.people << Person.create(name: "Faker::Name.name")
  3.times{seed_org.objectives << Objective.create(summary:"Faker::Lorem.paragraph")}

  3.times{seed_org.programs << Program.create(pro_name: "Faker::Name.name", pro_goal:"Faker::Name.name", pro_description: "Faker::Name.name", pro_target: "343", pro_location:"Buenos Aires", pro_budget: "US$100,000", pro_funding_sources:"government grant", pro_affiliations:"none", pro_metrics:"none", pro_results:"pending")}


end



@cippec = Org.create(
  name: "CIPPEC",
  initials: "CIPPEC",
  city: "Ciudad de Buenos Aires",
  address: "Callao 25",
  telephone: "(0 54 11) 4384-9009",
  email: "info@cippec.org",
  website: "www.cippec.org",
  transparency: 3,
  youtube: "http://www.youtube.com/embed/LHKLS6TECTA",
  mission: "Trabajar por un Estado justo, democratico y eficiente que mejore la vida de las personas.",
  fte: 45,
  pte: 16,
  volunteers: 0,
  leader_name: "Fernando Straface",
  leader_title: "Director Ejecutivo",
  founding_date: Date.parse('01-06-2000'),
  starting_date: Date.parse('01-06-2000'),
  legal_type: "Fundacion",
  legal_num: "C- 1679794/2000",
  cuit: "33-70724137-9",
  trans_policy: true,
  vat_exempt: true,
  income_exempt: true,
  tax_ded: true,
  code_conduct: true,
  external_auditor: true,
  auditor_name: "Deloitte",
  annual_reporting: true,
  external_prog_eval: false,
  num_prog_ind: 0,
  num_prog_org: 0,
  num_prog_pub: 5,
  facebook: "https://www.facebook.com/cippec.org",
  linkedin: "http://www.linkedin.com/company/cippec",
  twitter:"cippec",
  logo_url: "https://www.evernote.com/shard/s189/sh/ec6de880-f441-4620-91ba-18ebd35d4e8e/d202aa23b90e45133091cb4f3a71c1c7/deep/0/Screenshot%2010/3/13%2011:02%20PM.png"
  )

  3.times {
    myloc = Location.new(primary: false)
    myloc.province = Province.find_by_name(PROVINCES.sample)
    @cippec.locations << myloc 
  }

  @cippec.locations.first.update_attributes(primary: true)
  @cippec.branches << Branch.create(description: "n/a")
  @cippec.causes << Cause.create(description: "Community Development")
  @cippec.causes << Cause.create(description: "Public Policy")
  @cippec.causes << Cause.create(description: "Health and Nutrition")
  @cippec.causes << Cause.create(description: "Institutional Development")
  @cippec.activities << Activity.create(description: "Technical Support / Consulting")
  @cippec.activities << Activity.create(description: "Training")
  @cippec.activities << Activity.create(description: "Lobbying / Policy work")
  @cippec.ages << Age.create(description: "Adults")
  @cippec.legal = Legal.create(legal_type: "Fundacion")
  @cippec.board = Board.create(btype: "Board of Directors")
  @cippec.affiliations << Affiliation.create(aff_name: "Fundacion Navarro Viola", aff_type: "National Foundation", aff_description: "Co-gestion del Concurso de Proyectos Sociales - nuestros Mayores. ")
  @cippec.affiliations << Affiliation.create(aff_name: "Embajada de Suiza", aff_type: "International Government", aff_description: "Colaboracion en el desarrollo del Concurso 'Segundos para Todos'.")
  @cippec.networks << Network.create(net_name: "RACI", net_scope: "National", net_status: "Member")
  @cippec.networks << Network.create(net_name: "AEDROS", net_scope: "National", net_status: "Member")
  @cippec.prizes << Prize.create(prize_name: "Mejor Think Tanks de Argentina", prize_date: '31-12-2010' , prize_giver: "Universidad de Pennsylvania")
  @cippec.prizes << Prize.create(prize_name: "Premio Juscelino Kubitchek", prize_date: '31-02-2010', prize_giver: "BID")
  @cippec.board.people << Person.create(name: "Juan Fulano")
  @cippec.board.people << Person.create(name: "Ricardo Gonzalez")
  @cippec.advisory = Advisory.create()
  @cippec.advisory.people << Person.create(name: "Carlos Adamo")
  @cippec.advisory.people << Person.create(name: "Gustavo Herrero")
  @cippec.objectives << Objective.create(summary: "Trabajar para que el Estado sea capaz de responder a las necesidades de los ciudadanos , promoviendo la implementacion de mejores practicas en el sector estatal y el desarrollo de mas y mejores profesionales con vocacion por lo publico.")
  @cippec.objectives << Objective.create(summary: "Desarrollar y difundir herramientas que permitan a la sociedad civil incrementar su capacidad de participacion en las politicas de Estado.")
  @cippec.objectives << Objective.create(summary: "Servir como fuente permanente de consulta sobre politicas publicas y contribuir al debate publico con propuestas innovadoras para mejorar el accionar del Estado y el bienestar de la sociedad.")
  @cippec.objectives << Objective.create(summary: "Llevar a cabo proyectos de investigacion que complementen el trabajo de otros centros de estudio y que se propongan comprender y solucionar los problemas fundamentales de la realidad argentina.")

  @cippec.programs << Program.create(pro_name: "Desarrollo Local", 
                                     pro_goal: "Fortalecer las instituciones politicas, economicas y sociales de los ambitos locales a traves de la capacitacion, asesoramiento, investigacion y analisis de la realidad municipal. Consolidar la relacion con lideres locales ya identificados..." , 
                                     pro_description: "El programa de Desarrollo Local capacito a 70 funcionarios ejecutivos municipales de todo el pais, entre ellos 15 intendentes, en la VI Edicion del Programa Lideres Municipales... ", 
                                     pro_target: "Poblacion Objetivo: Tomadores de decision", 
                                     pro_location: "Buenos Aires", 
                                     pro_budget: "US$100,000", 
                                     pro_funding_sources: "Gobiernos, Empresas y Organizaciones de Cooperacion Internacional", 
                                     pro_affiliations: "none", 
                                     pro_metrics: "none", 
                                     pro_results: "El programa de Desarrollo Local capacito a 70 funcionarios ejecutivos municipales de todo el pais, entre ellos 15 intendentes, en la VI Edicion del Programa Lideres Municipales...", 
                                     )

