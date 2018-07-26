module Projects exposing (Project, projects)

type alias Project =
    { name : String,
      url : String,
      readmeSnippet : String
    }

projects : List Project
projects =
    [
        { name = "Test",
          url = "example.com",
          readmeSnippet = "Coolest project ever"
        }
    ]

