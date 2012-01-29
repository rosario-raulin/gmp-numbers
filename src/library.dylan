module: dylan-user

define library gmp-numbers
  use common-dylan;
  use c-ffi;
  use io;

  export gmp-integer;
end library;

define module gmp-integer
  use common-dylan, exclude: { format-to-string };
  use c-ffi;
  use format;
  use print;
  
  export
    <gmp-integer>,
    make-integer,
    destroy-integer,
    number,
    number-setter,
    base,
    base-setter,
    with-integer;
end module;

define module gmp-test
  use common-dylan;
  use gmp-integer;
  use format-out;
  use c-ffi;
end module;
