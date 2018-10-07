(** Load required packages. **)

Require Export Setoid Plus List Sorted Constructive_sets Utf8_core.

(** Unicode (UTF8) notations. **)

Notation "x ⇒ y" := (x -> y)
  (at level 99, y at level 200, right associativity): type_scope.

Notation "x ⇔ y" := (x <-> y) (at level 95, no associativity): type_scope.

Notation "∃ ! x .. y , p" :=
  (ex (unique (fun x => .. (ex (unique (fun y => p))) ..)))
  (at level 200, x binder, right associativity,
   format "'[' '∃'  !  '/  ' x  ..  y ,  '/  ' p ']'")
  : type_scope.

(** Useful symbols: ∀ ∃ ⇒ ⇔ ∧ ∨ ¬ ≠ ≤ ≥ ℕ ℤ ∈ ∉ ⊂ ∑ ∏ **)

(** Axioms for the integers. **)

Parameter Z : Set.

Parameter add mult : Z → Z → Z.
Parameter neg : Z → Z.
Parameter zero one : Z.
Notation "0" := zero.
Notation "1" := one.
Infix "+" := add.
Infix "*" := mult.
Notation "- x" := (neg x).
Notation "- 0" := (neg 0) (only parsing).
Notation "- 1" := (neg 1).
Definition sub a b := a + -b.
Infix "-" := sub.

Axiom A1 : ∀ a b   : Z, a + b = b + a.
Axiom A2 : ∀ a b c : Z, (a + b) + c = a + (b + c).
Axiom A3 : ∀ a     : Z, a + 0 = a.
Axiom A4 : ∀ a     : Z, a + -a = 0.
Axiom M1 : ∀ a b   : Z, a * b = b * a.
Axiom M2 : ∀ a b c : Z, (a * b) * c = a * (b * c).
Axiom M3 : ∀ a     : Z, a * 1 = a.
Axiom D1 : ∀ a b c : Z, (a + b) * c = a * c + b * c.

(** Some useful lemmas. **)

Lemma S1 : ∀ a b c : Z, a = b ⇒ a + c = b + c.
Proof.
  intros a b c H. 
  congruence.
Qed.

Lemma S2 : ∀ a b c : Z, a = b ⇒ a * c = b * c.
Proof.
  intros a b c H. 
  congruence.
Qed.

(** Homework assignment problems are given below. **)

Theorem A1P1 : ∀ a : Z, 0 + a = a.
Proof.
Admitted. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P2 : ∀ a : Z, -a + a = 0.
Proof.
Admitted. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P3 : ∀ a : Z, 1 * a = a.
Proof.
Admitted. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P4 : ∀ a b : Z, a + b = 0 ⇒ b = -a.
Proof.
Admitted. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P5 : ∀ a : Z, -(-a) = a.
Proof.
Admitted. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P6 : ∀ a : Z, 0 * a = 0.
Proof.
Admitted. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P7 : ∀ a : Z, -1 * a = -a.
Proof.
Admitted. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P8 : ∀ a b : Z, -a * -b = a * b.
Proof.
Admitted. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P9 : ∀ a b : Z, a + b = a ⇒ b = 0.
Proof.
Admitted. (* replace "Admitted." with "Qed." when your proof is finished. *)

Definition ℤ := (Full_set Z).
Definition P := Ensemble.
Infix "∋" := (In Z) (at level 70).
Notation "x ∈ S" := (S ∋ x) (at level 70).
Notation "x ∉ S" := (¬(x ∈ S)) (at level 70).
Infix "⊂" := (Included Z) (at level 70).
Notation "∅" := (Empty_set Z).
Notation "{ x : A | P }" := (λ x : A, P).

(* def'n is notation
some of those def'ns are "Notation"
axiom is a mathematical assumption
*)

(* going to try use only this axiom to prove stuff *)
Parameter ℕ : P(Z).

Definition lt (a b : Z) := b-a ∈ ℕ.
Infix "<" := lt.
(* def'n of gt, saying that this goes the other way *)
Notation "x > y" := (y < x).

Theorem lt_N : ℕ = {x : Z | 0 < x}.
Proof.
  apply Extensionality_Ensembles.
  split.
  - unfold Included.
    intros x H.
    unfold In, lt, sub.
    rewrite <-(A3 x), A2, A4, A3.
    exact H.
  - unfold Included.
    intros x H.
    unfold In, lt, sub in H.
    rewrite <-(A3 x), A2, A4, A3 in H.
    exact H.
Qed.

Theorem lt_N_elt : ∀ x : Z, x ∈ ℕ <-> x > 0.
Proof.
  split.
  - unfold In, lt, sub.
    rewrite <-(A3 x), A2, A4, A3.
    intros H.
    exact H.
  - unfold In, lt, sub.
    rewrite <-(A3 x), A2, A4, A3.
    intros H.
    exact H.
Qed.

(* or
split;
unfold In, lt, sub;
rewrite <-(A3 x), A2, A4, A3;
intros H;
exact_H.
*)

(* see course notes for O1 and O2 *)

(* this can be a theorem instead of an axiom *)
Theorem O1 : ∀ a b c : Z, a < b ⇒ a + c < b + c.
Proof.
  unfold lt, sub.
  intros a b c H.
  rewrite <-(A1P7), M1, D1, M1, A1P7, M1, A1P7, A2, (A1 c), A2, A1P2, A3.
  exact H.
Qed.

Axiom O2 : ∀ a b c : Z, a < b ⇒ c > 0 ⇒ a * c < b * c.

(** The proof below is INCORRECT, even though Coq thinks it is correct.
    Find the error, and correct it. **)

(* trichotomy axiom (look into this) *)
(* states that every real number (integers in our case)
  is either positive, negative, or zero *)
(* Axiom T : ∀ a : Z, a ∈ ℕ ∨ a = 0 ∨ -a ∈ ℕ. *)
Axiom T : ∀ a : Z,
(a > 0 ∧ a ≠ 0 ∧ ¬a < 0) ∨
(¬a > 0 ∧ a = 0 ∧ ¬a < 0) ∨
(¬a > 0 ∧ a ≠ 0 ∧ a < 0).

Theorem A1P11 : ∀ a b : Z, a * b = 0 ⇒ a = 0 ∨ b = 0.
Proof.
  intros a b H.
  destruct (T a) as [[H0 [H1 H2]] | [[H0 [H1 H2]] | [H0 [H1 H2]]]].
  - destruct (T b) as [[H3 [H4 H5]] | [[H3 [H4 H5]] | [H3 [H4 H5]]]].
    (* + apply (O2 0 a b) in H0. *)
    + pose proof (O2 0 a b) as H6.
      rewrite A1P6 in H6.
      (* at this point, would only contradict if we use T *)
      pose proof (T (a*b)).
      (* tauto states that at this point, this is logically valid, so use tauto *)
      (* tauto looks for logical contradictions or logical proofs *)
      (* do not overuse this without uderstanding *)
      tauto.
    + tauto. (* b = 0 case *)
    + pose proof (O2 b 0 a) as H6.
      rewrite A1P6, M1 in H6.
      pose proof (T (a*b)).
      tauto.
Qed.

