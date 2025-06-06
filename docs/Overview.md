# Orchard Overview

## What is Orchard?

Orchard is a side project that is meant to explore more about Ruby and what it can do
by creating a Linktree-like app using Sinatra. Although this isn't meant to be a project
to profit or anything like that, more of an exercise and study of what Ruby can do. Plus,
Ruby seems incredibly straightforward in how things are done and its incredibly pleasant

## Features of Orchard

These are the feature of what I have planned for Orchard:

- User Profile creation
  - shareable profile
  - profile stub
  - visible links to other social media
- Dashboard
  - able top view which links were interacted with
  - profile editing
  - lightweight stats on links and clicks
- Verification
  - links can be verified to establish ownership of actual account (either with oauth or something else)
  - badge showing this verification for everyone

## Tech stack of Orchard

Because of the lightweight nature of Sinatra, it has support for enough technologies that 
allows me to use an incredibly light stack:

- *Backend Framework*: Sinatra
- *Frontend Framework*: Haml templating + Alpine.js + Tailwindcss (ruby gem)
- *Database*: MongoDb Atlas
- *Hosting*: Azure (either web apps or container apps)

I'm able to avoid the complexity of needing to do something like react by including **alpine.js**,
letting do stuff like having reactive state and simple transitions within html, and it works seamlessly
within the Haml templating. The templating itself is to avoid the need for a separate frontend project
entirely, making this an **SSR solution**. Sinatra allows passing data into templates very easily.  