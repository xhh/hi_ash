defmodule HiAshTest do
  use ExUnit.Case, async: true
  use TypeCheck.ExUnit

  # Test all functions that have `@spec!`s in `MyModule`
  spectest(HiAsh)

  # Test all functions that have `@spec!`s in `MyOtherModule`,
  # except `MyOtherModule.bar/2` and `MyOtherModule.baz/0`
  # spectest(MyOtherModule, except: [{:bar, 2}, {:baz, 0}])

  # Test only `OneMoreModule.foo/2` and `MyOtherModule.qux/0`
  # spectest(OneMoreModule, only: [{:foo, 2}, {:qux, 0}])
end
