module Array = Belt.Array
open CssJs

let wrapper = style(.[
  maxWidth(Theme.Constants.maxWidth),
  display(#flex),
  flexDirection(column),
  alignItems(center),
  justifyContent(center),
  position(relative),
  Media.xs([
    margin4(~top=5.2->rem, ~bottom=0.0->rem, ~left=auto, ~right=auto),
    padding2(~v=zero, ~h=3.2->rem),
  ]),
  Media.sm([
    margin4(~top=5.2->rem, ~bottom=0.0->rem, ~left=auto, ~right=auto),
    padding2(~v=zero, ~h=3.2->rem),
  ]),
  Media.sm([margin4(~top=7.2->rem, ~bottom=0.0->rem, ~left=auto, ~right=auto)]),
])

let symbolWrapper = style(.[Media.xs([width(28.0->rem)]), Media.sm([width(35.0->rem)])])

let text = style(.[
  color(Theme.Colors.white),
  fontFamily(Theme.fontFamily->#custom),
  textAlign(#center),
  position(relative),
  top(-100->px),
  selector(
    "> span",
    [background(Theme.Colors.gradient)]->Array.concat(Theme.Constants.clipBackground),
  ),
  Media.xs([fontSize(3.2->rem)]),
  Media.sm([fontSize(3.8->rem)]),
  Media.md([maxWidth(60.0->rem), fontSize(4.2->rem)]),
  Media.lg([maxWidth(75.2->rem), fontSize(5.2->rem)]),
  Media.xl([fontSize(5.8->rem), maxWidth(900->px)]),
])

let arrowAnimation = keyframes(.[
  (0, [transform(translateY(5->px))]),
  (50, [transform(translateY(zero))]),
  (100, [transform(translateY(5->px))]),
])

let button = style(.
  [
    padding(zero),
    margin(zero),
    outlineStyle(none),
    borderStyle(none),
    background(Theme.Colors.gradient),
    fontFamily(Theme.fontFamily->#custom),
    fontSize(1.8->rem),
    fontWeight(600->#num),
    position(relative),
    cursor(pointer),
    textDecoration(none),
    Media.xs([top(-20->px)]),
    Media.lg([position(absolute), bottom(5.6->rem)]),
    after([
      contentRule("assets/arrow-down.svg"->#url),
      position(absolute),
      bottom(-0.5->rem),
      width(2.0->rem),
      height(1.0->rem),
      left(50.0->pct),
      marginLeft(-1.0->rem),
      animation(~duration=1000, ~iterationCount=#infinite, arrowAnimation),
    ]),
  ]->Array.concat(Theme.Constants.clipBackground),
)
