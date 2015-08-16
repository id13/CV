# CV
A very opinionated skills oriented CV template, preview here : https://goo.gl/3DQmRc .

## Install
* `bundle install`
* `ruby cv.rb`
* `wkhtmltopdf http://localhost:4567/ cv.pdf` , works with wkhtmltopdf 0.12.2.1 (with patched qt)

## Customize
* Each section is shipped with its `.json` for content, `partials/.scss` and `views/.haml` for display.
* The layout is at `views/index.haml`
