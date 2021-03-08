module Option = Belt.Option

type motionElement

type initial = [#hidden | #visible]

@deriving(abstract)
type motionProps = {
  @optional className: string,
  @optional @as("ref") innerRef: ReactDOM.domRef,
  @optional id: string,
  @optional href: string,
  @optional target: string,
  @optional initial: initial,
  @optional variants: FramerMotion.variants,
  @optional animate: FramerMotion.animateValue,
}

external identity: 'a => FramerMotion.animateValue = "%identity"

@module("react")
external createElement: (motionElement, motionProps, React.element) => React.element =
  "createElement"

@module("react")
external createVoidElement: (motionElement, motionProps) => React.element = "createElement"

let unwrapAnimate = v =>
  switch v {
  | #controlled(v) => identity(v)
  | v => identity(v)
  }

module type IMakeElement = {
  let element: motionElement
}

module MakeElement = (M: IMakeElement) => {
  @react.component
  let make = (
    ~className=?,
    ~initial=?,
    ~variants=?,
    ~animate: option<FramerMotion.animate>=?,
    ~innerRef=?,
    ~id=?,
    ~href=?,
    ~children,
  ) => {
    let props = motionProps(
      ~className?,
      ~innerRef?,
      ~id?,
      ~initial?,
      ~animate=?animate->Option.map(unwrapAnimate),
      ~variants?,
      ~href?,
      (),
    )
    createElement(M.element, props, children)
  }
}