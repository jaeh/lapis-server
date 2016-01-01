import Widget from require "lapis.html"

cdn_host = (file) ->
  "http://s1.localhost:8080/#{file}"

class Layout extends Widget
  content: =>
    html_5 ->
      head ->
        meta charset: "utf-8"
        title @title or "MagicShifter!"
        link src: cdn_host "css/index.css"

        link
          rel: "icon"
          href: cdn_host "favicon.ico"

        meta
          name: "description"
          content: "MagicShifter
                    - the Open Source Digital Magic Lamp!
                    for Lighting, Gaming, and POV Applications."

        meta
          name: "viewport"
          content: "width=device-width, initial-scale=1"

        link
          rel: "stylesheet"
          href: cdn_host "css/main.css"

      body id: "♥", ->
        menu_items = {
          "about": "#♥"
          "video": "#video"
          "features": "#features"
          "program": "#program"
          "contact": "#contact"
        }

        header class: "main", ->
          div class: "wrapper", ->
            a {
                id: "logo"
                href: "#about"}, ->
                img
                  src: "/img/logo.png"
                  alt: "magicshifter"

            a class: "menu-toggle", ->
              span
              span
              span

            nav class: "main", ->
              ul ->
                for item in pairs menu_items
                  li ->
                    a href: @url_for(item.href, name: item.text)

        @content_for "inner"


        footer class: "main", ->
          div class: "container", id: "imprint", ->
            span "created @"
            a href: "http://www.metalab.at", target: "metalab", ->
              img src: cdn_host "img/metalab.png", alt: "Metalab"

          div id: "aws", ->
            span "supported by"
            a href: "http://www.awsg.at/kreativwirtschaft", target: "aws", ->
              img src: cdn_host "img/aws-logo.jpg"

          div id: "proudowner", ->
            div class: "container", ->
              p "
                “Any sufficiently advanced
                technology is indistinguishable
                from a MagicShifter!”
                "

              p "Arthur C. Clarke, proud owner"

