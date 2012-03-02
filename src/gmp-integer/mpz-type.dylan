module: gmp-integer

define constant <unsigned-integer> = limited(<integer>, min: 0);

define C-subtype <mpz-type> (<C-void*>)
end C-subtype <mpz-type>;

define C-function mpz-init-set-str
  parameter integer :: <mpz-type>;
  parameter str :: <C-string>;
  parameter base :: <C-int>;
  c-name: "__gmpz_init_set_str";
end C-function mpz-init-set-str;

define C-function mpz-init-set-si
  parameter integer :: <mpz-type>;
  parameter op :: <C-signed-int>;
  c-name: "__gmpz_init_set_si";
end C-function mpz-init-set-si;

define C-function mpz-get-str
  parameter str :: <C-string>;
  parameter base :: <C-int>;
  parameter integer :: <mpz-type>;
  result number-string :: <C-string>;
  c-name: "__gmpz_get_str";
end C-function mpz-get-str;

define C-function mpz-add
  parameter sum :: <mpz-type>;
  parameter op1 :: <mpz-type>;
  parameter op2 :: <mpz-type>;
  c-name: "__gmpz_add";
end C-function mpz-add;

define C-function mpz-add-ui
  parameter sum :: <mpz-type>;
  parameter op1 :: <mpz-type>;
  parameter op2 :: <C-unsigned-int>;
  c-name: "__gmpz_add_ui";
end C-function mpz-add-ui;

define C-function mpz-sub
  parameter diff :: <mpz-type>;
  parameter op1 :: <mpz-type>;
  parameter op2 :: <mpz-type>;
  c-name: "__gmpz_sub";
end C-function mpz-sub;

define C-function mpz-sub-ui
  parameter diff :: <mpz-type>;
  parameter op1 :: <mpz-type>;
  parameter op2 :: <C-unsigned-int>;
  c-name: "__gmpz_sub_ui";
end C-function mpz-sub-ui;

define C-function mpz-ui-sub
  parameter diff :: <mpz-type>;
  parameter op1 :: <C-unsigned-int>;
  parameter op2 :: <mpz-type>;
  c-name: "__gmpz_ui_sub";
end C-function mpz-ui-sub;

define C-function mpz-mul
  parameter product :: <mpz-type>;
  parameter op1 :: <mpz-type>;
  parameter op2 :: <mpz-type>;
  c-name: "__gmpz_mul";
end C-function mpz-mul;

define C-function mpz-mul-si
  parameter product :: <mpz-type>;
  parameter op1 :: <mpz-type>;
  parameter op2 :: <C-signed-int>;
  c-name: "__gmpz_mul_si";
end C-function mpz-mul-si;

define C-function mpz-mul-ui
  parameter product :: <mpz-type>;
  parameter op1 :: <mpz-type>;
  parameter op2 :: <C-unsigned-int>;
  c-name: "__gmpz_mul_ui";
end C-function mpz-mul-ui;

define C-function mpz-tdiv-qr
  parameter quotient :: <mpz-type>;
  parameter remainder :: <mpz-type>;
  parameter op1 :: <mpz-type>;
  parameter op2 :: <mpz-type>;
  c-name: "__gmpz_tdiv_qr";
end C-function mpz-tdiv-qr;

define C-function mpz-abs
  parameter abs-value :: <mpz-type>;
  parameter op :: <mpz-type>;
  c-name: "__gmpz_abs";
end C-function mpz-abs;

define C-function mpz-cmp
  parameter op1 :: <mpz-type>;
  parameter op2 :: <mpz-type>;
  result cmp-result :: <C-int>;
  c-name: "__gmpz_cmp";
end C-function mpz-cmp;

define C-function mpz-cmp-ui
  parameter op1 :: <mpz-type>;
  parameter op2 :: <C-unsigned-int>;
  result cmp-result :: <C-int>;
  c-name: "__gmpz_cmp_ui";
end C-function mpz-cmp-ui;

define C-function mpz-clear
  parameter integer :: <mpz-type>;
  c-name: "__gmpz_clear";
end C-function mpz-clear;

define method destroy (mpz :: <mpz-type>, #key) => ()
  mpz-clear(mpz);
end method destroy;
