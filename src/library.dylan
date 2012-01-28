module: dylan-user

define library gmp-numbers
  use common-dylan;
  use c-ffi;
  use io;

  export gmp-integer;
end library;

define module gmp-integer
  use common-dylan;
  use c-ffi;
  
  export
    <mpz-type>,
    mpz-init,
    mpz-set-str,
    mpz-init-set-str,
    mpz-get-str;
end module;

define module gmp-test
  use common-dylan;
  use gmp-integer;
  use format-out;
  use c-ffi;
end module;
