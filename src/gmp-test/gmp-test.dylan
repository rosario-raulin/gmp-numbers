module: gmp-test

define constant $test-bignum :: <string>
  = as(<C-char*>, "1234567891234567891234567891234567890");

define function integer-test () => ()
  let a :: <mpz-type> = make(<mpz-type>);
  mpz-init(a);
  mpz-set-str(a, $test-bignum, 10);
  format-out("%s\n", mpz-get-str(null-pointer(<C-char*>), 10, a));
end function integer-test;

define function main () => ()
  integer-test();
end function main;

main();
