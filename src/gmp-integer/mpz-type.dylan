module: gmp-integer

define C-subtype <mpz-type> (<C-void*>)
end C-subtype <mpz-type>;

define C-function mpz-init
  parameter mpz :: <mpz-type>;
  c-name: "mpz_init";
end C-function mpz-init;

define C-function mpz-set-str
  parameter mpz :: <mpz-type>;
  parameter str :: <C-char*>;
  parameter base :: <C-int>;
  c-name: "mpz_set_str";
end C-function mpz-set-str;

define C-function mpz-init-set-str
  parameter mpz :: <mpz-type>;
  parameter str :: <C-char*>;
  parameter base :: <C-int>;
  c-name: "mpz_init_set_str";
end C-function mpz-init-set-str;

define C-function mpz-get-str
  parameter str :: <C-char*>;
  parameter base :: <C-int>;
  parameter mpz :: <mpz-type>;
  result number-string :: <C-char*>;
  c-name: "mpz_get_str";
end C-function mpz-get-str;
