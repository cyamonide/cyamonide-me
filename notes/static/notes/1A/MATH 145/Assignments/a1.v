(** Load required packages. **)

Require Export Setoid Peano List Sorted Constructive_sets Utf8_core.
Require Export Classical_Prop.

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
  (* congruence states that these things are obviously equal. Swap a for b. *)
  congruence.
Qed.

Lemma S2 : ∀ a b c : Z, a = b ⇒ a * c = b * c.
Proof.
  intros a b c H.
  congruence.
Qed.

Lemma neq_symm : ∀ a b : Z, a ≠ b ⇔ b ≠ a.
Proof.
  intros a b.
  split; intros H H0; symmetry in H0; contradiction.
Qed.

(** Homework assignment problems are given below. **)

Theorem A1P1 : ∀ a : Z, 0 + a = a.
Proof.
  intros.
  (*
    pose proof (A3 a).
    pose proof A1.
    congruence.
  *)
  pose proof (A1 0 a).
  rewrite A3 in H.
  exact H.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P2 : ∀ a : Z, -a + a = 0.
Proof.
  intros.
  pose proof (A1 (-a) a).
  rewrite A4 in H.
  exact H.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P3 : ∀ a : Z, 1 * a = a.
Proof.
  intros.
  pose proof (M3 a).
  rewrite M1 in H.
  exact H.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P4 : ∀ a b : Z, a + b = 0 ⇒ b = -a.
Proof.
  intros.
  rewrite A1 in H.
  apply (S1 _ _ (-a)) in H.
  rewrite (A2 b a (-a)) in H.
  rewrite (A4 a) in H.
  rewrite (A1 0 (-a)) in H.
  rewrite A3 in H.
  rewrite A3 in H.
  exact H.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P5 : ∀ a : Z, -(-a) = a.
Proof.
  intros.
  pose proof (eq_refl 0).
  rewrite <-(A4 (-a)) in H at 1.
  rewrite <-(A4 a) in H.
  rewrite A1 in H.
  apply (S1 _ _ a) in H.
  rewrite A4 in H.
  rewrite A2 in H.
  rewrite (A1 (-a) a) in H.
  rewrite A4 in H.
  rewrite (A1 0 a) in H.
  rewrite A3 in H.
  rewrite A3 in H.
  exact H.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P6 : ∀ a : Z, 0 * a = 0.
Proof.
  intros.
  pose proof (D1 0 1 a).
  symmetry in H.
  rewrite (M1 1 a) in H.
  rewrite M3 in H.
  rewrite (A1 0 1) in H.
  rewrite A3 in H.
  rewrite (M1 1 a) in H.
  rewrite M3 in H.
  apply (S1 _ _ (-a)) in H.
  rewrite (A4 a) in H.
  rewrite (A2 (0*a) a (-a)) in H.
  rewrite (A4 a) in H.
  rewrite (A3 (0*a)) in H.
  exact H.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P7 : ∀ a : Z, -1 * a = -a.
Proof.
  intros.
  pose proof (D1 1 (-1) a).
  symmetry in H.
  apply (S1 _ _ (-a)) in H.
  rewrite (A4 1) in H.
  rewrite A1P6 in H.
  rewrite (A1 0 (-a)) in H.
  rewrite A3 in H.
  rewrite (A1 (1*a) ((-1)*a)) in H.
  rewrite (M1 1 a) in H.
  rewrite M3 in H.
  rewrite (A2 ((-1)*a) a (-a)) in H.
  rewrite (A4 a) in H.
  rewrite (A3 (-1*a)) in H.
  exact H.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P8 : ∀ a b : Z, -a * -b = a * b.
Proof.
  intros.
  pose proof (eq_refl (a*b)).
  rewrite <-(M3 a) in H at 1.
  rewrite (M1 a 1) in H at 1.
  rewrite <-(A1P5 1) in H at 1.
  rewrite <-(A1P7 (-1)) in H.
  rewrite (M2 (-1) (-1) a) in H.
  rewrite (M1 (-1) ((-1) * a)) in H.
  rewrite A1P7 in H.
  rewrite M2 in H.
  rewrite A1P7 in H.
  exact H.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P9 : ∀ a b : Z, a + b = a ⇒ b = 0.
Proof.
  intros.
  apply (S1 _ _ (-a)) in H.
  rewrite (A1 a b) in H.
  rewrite A2 in H.
  rewrite A4 in H.
  rewrite A3 in H.
  exact H.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

Theorem A1P10 : ∀ b : Z, (∀ a : Z, a * b = a) ⇒ b = 1.
Proof.
  intros.
  pose proof (H 1) as H0.
  rewrite M1 in H0.
  rewrite M3 in H0.
  exact H0.
Qed. (* replace "Admitted." with "Qed." when your proof is finished. *)

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

Axiom N0 : ℕ ≠ ∅.
Axiom N1 : ∀ a b : Z, a ∈ ℕ ⇒ b ∈ ℕ ⇒ a+b ∈ ℕ.
Axiom N2 : ∀ a b : Z, a ∈ ℕ ⇒ b ∈ ℕ ⇒ a*b ∈ ℕ.


Theorem O1 : ∀ a b c : Z, a < b ⇒ a + c < b + c.
Proof.
  unfold lt, sub.
  intros a b c H.
  rewrite <-(A1P7), M1, D1, M1, A1P7, M1, A1P7, A2, (A1 c), A2, A1P2, A3.
  exact H.
Qed.

Theorem O2 : ∀ a b c : Z, a < b ⇒ c > 0 ⇒ a * c < b * c.
Proof.
  unfold lt, sub.
  intros a b c H H0.
  rewrite <-A1P7, <-M2, <-D1, A1P7.
  (* P => Q does not help you prove P. It helps you prove Q. *)
  apply N2.
  - exact H.
  - rewrite <-A3, <-(A4 0), A1P1.
    exact H0.
Qed.

Theorem O3' : ∀ a b c : Z, a<b ⇒ b<c ⇒ a<c.
Proof.
  unfold lt, sub.
  intros a b c H H0.
  (* Coq does this without complaint
     However, we have to prove that these two are equal *)
  replace (c+-a) with ((c+-b)+(b+-a)).
  - apply N1; auto. (* those two goals are easy *)
  - rewrite A2, <-(A2 (-b)), A1P2, A1P1.
    reflexivity.
Qed.

Axiom O3 : ∀ a b c : Z, a < b ⇒ c < 0 ⇒ a * c > b * c.

(* trichotomy axiom (look into this) *)
(* states that every real number (integers in our case)
  is either positive, negative, or zero *)
(* Axiom T : ∀ a : Z, a ∈ ℕ ∨ a = 0 ∨ -a ∈ ℕ. *)
Axiom T : ∀ a : Z,
(a > 0 ∧ a ≠ 0 ∧ ¬a < 0) ∨
(¬a > 0 ∧ a = 0 ∧ ¬a < 0) ∨
(¬a > 0 ∧ a ≠ 0 ∧ a < 0).

Axiom O4 : 0 < 1.

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
      (* contradict since by trichotomy, a*b cannot equal 0 (H1) and be less than 0 (H6) *)
      tauto.
  (* a = 0 case *)
  - tauto.
  - destruct (T b) as [[H3 [H4 H5]] | [[H3 [H4 H5]] | [H3 [H4 H5]]]].
    + pose proof (O2 a 0 b) as H6.
      rewrite A1P6 in H6.
      pose proof (T (a*b)).
      tauto.
    + tauto.
    + pose proof (O3 a 0 b) as H6.
      rewrite A1P6 in H6.
    pose proof (T (a*b)).
    tauto.
Qed.