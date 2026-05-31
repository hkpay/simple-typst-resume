#import "@preview/fontawesome:0.6.0": *

#set page(
  paper: "us-letter",
  margin: (x: 0.3in, y: 0.3in),
)

#set text(
   font: "segoe ui",
   size: 10pt,
)

#let header_name(personalinfo) = {
  set text(size: 20pt, weight: "bold")
  [#personalinfo.firstname #personalinfo.lastname]
}

#let contact_info(personalinfo) = { 
  set text(size: 8pt)
  [ 
    #fa-icon("envelope") #h(0.3em) #personalinfo.email #h(0.6em) #fa-icon("phone") #h(0.3em) #personalinfo.phone #h(0.6em) #fa-icon("location-pin") #h(0.3em) #personalinfo.location #h(0.6em) #fa-icon("github") #h(0.3em) #link(personalinfo.github)[Github] #h(0.6em) #fa-icon("linkedin") #h(0.3em) #link(personalinfo.linkedin)[Linkedin] 
  ]
}

#let headline(personalinfo) = {
  [ 
    #personalinfo.headline \ \ 
  ]
}

#let render_header(profile) = {
  let personalinfo = profile.personal
  set align(center)
  [ 
    #header_name(personalinfo) \ 
    #contact_info(personalinfo) 
  ]
}

#let section(title) = [
  #set text( 
    size: 13pt,
    weight: "bold"
  )
  #title 
  #v(-0.8em)
  #line(length: 100%)
  #v(-0.6em)
]

#let jobtitle(jobtitle) = [
  #text(weight: "bold", size: 10pt)[#jobtitle]
]

#let jobheader(job) = {
  [
    #jobtitle(job.title)
    #h(1fr) 
    #fa-icon("calendar") #h(0.3em) #job.start - #job.end \ 
  ]
  [ 
    #text(style: "italic")[#job.company]
    #h(1fr)
    #job.location
  ]
}

#let render_experience(profile) = {
  for (i, experience) in profile.experience.enumerate() [ 
    #jobheader(experience) \ 
    #for highlight in experience.highlights [ 
      - #highlight
    ]
    #if i < profile.experience.len() - 1 { 
      v(-0.3em)
      line(length: 100%, stroke: (dash: "dashed"))
      v(-0.6em)
    }
  ]
}

#let render_education(profile) = {
  for (i, ed) in profile.education.enumerate() { 
    [ 
      #text(weight: "bold", size: 10pt)[#ed.diploma]#h(1fr)#ed.start - #ed.end \ 
    ]
    [#ed.school #if "grade" in ed [ \ #ed.grade] else [] \ ]
    if i < profile.education.len() - 1 { 
      v(-0.3em)
      line(length: 100%, stroke: (dash: "dashed"))
      v(-0.6em)
    }
  }
}

#let render_skillsets(profile) = {
  for skillset in profile.skillsets [
    #text(weight: "bold")[#skillset.name] : #skillset.skills.join(", ")
    \
  ]
  [ \ ]
}

#let render_interests(profile) = {
  for interest in profile.interests [ 
    #interest \ 
  ]
}

#let profile = yaml(sys.inputs.yamlpath)

#render_header(profile)
#section[Professional Summary]
#headline(profile.personal)
#section[Skills]
#render_skillsets(profile)
#section[Experience]
#render_experience(profile)
#section[Education]
#render_education(profile)
