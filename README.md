# CV
A very opinionated skills oriented CV template.

## Install
* `bundle install`
* `compass compile`
* `ruby cv.rb`
* to view it live `localhost:4567`
* for pdf `wkhtmltopdf http://localhost:4567/ cv.pdf` , works with wkhtmltopdf 0.12.2.1 (with patched qt)

## Customize
* Each section is shipped with its `.json` for content, `partials/.scss` and `views/.haml` for display.
* The layout is at `views/index.haml`
