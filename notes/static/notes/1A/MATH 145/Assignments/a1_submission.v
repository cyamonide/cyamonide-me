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

Parameter less_than : Z → Z → Prop.
Parameter greater_than : Z → Z → Prop.
Infix "<" := less_than.
Infix ">" := greater_than.

Axiom A1 : ∀ a b   : Z, a + b = b + a.
Axiom A2 : ∀ a b c : Z, (a + b) + c = a + (b + c).
Axiom A3 : ∀ a     : Z, a + 0 = a.
Axiom A4 : ∀ a     : Z, a + -a = 0.
Axiom M1 : ∀ a b   : Z, a * b = b * a.
Axiom M2 : ∀ a b c : Z, (a * b) * c = a * (b * c).
Axiom M3 : ∀ a     : Z, a * 1 = a.
Axiom D1 : ∀ a b c : Z, (a + b) * c = a * c + b * c.

Axiom O1 : ∀ a b : Z, a < b ⇒ b > a.
Axiom O2 : ∀ a b c : Z, a < b ∧ b < c ⇒ a < c.

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

Lemma P2 : ∀ a b c : Z, a < b ⇒ a + c < b + c.

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

(* Division on both sides *)
Theorem S3 : forall a b c : Z, a * c = b * c /\ c ≠ 0 ⇒ a = b.
Proof.
  intros.
  destruct H as [H1 H2].
  apply (S1 _ _ (-(b*c))) in H1.
  rewrite (A4 (b*c)) in H1.
  rewrite <-A1P7 in H1.
  rewrite <-M2 in H1.
  rewrite <-D1 in H1.
  (* however, this requires A1P11 to show that either
  (a + (-1) * b) or c is equal to zero, and since c is 
  not equal to zero,
    (a + (-1) * b) = 0 =>
    a = b
  *)
give_up.

(** The proof below is INCORRECT, even though Coq thinks it is correct.
    Find the error, and correct it. **)
(* Explain how such a thing is possible, and find the error in the proof *)

Theorem A1P11 : ∀ a b : Z, a * b = 0 ⇒ a = 0 ∨ b = 0.
Proof.
  intros a b H.
  apply (S1 (a*b) 0 (1*b)) in H.
  rewrite <-D1 in H.
  rewrite A1P3 in H.
  rewrite A1P1 in H.
  rewrite M1 in H.

  
  pose proof (A1P10 (a+1)) as H0.
  pose proof (H0 (b)) as H1.
  
  apply ((A1P10 (a+1)) (b)) in H.
  (*
		When applying A1P10 in H, an error occurs due to the nested forall condition.
		Is it valid to pose that ∀ b : Z, b * (a+1) = b ?
		How would one implement the addition of the forall to the hypothesis?
	*)
  (* apply A1P10 in H. *)
	
  pose proof (A1P10 (a+1)) as H0.
  apply (S1 _ _ (-1)) in H0.
  rewrite A2 in H0.
  rewrite A4 in H0.
  rewrite A3 in H0.
  left.
  exact H0.

  apply (H0 a) in H.
  apply (S1 (a+1) 1 (-1)) in H.
  rewrite A2 in H.
  rewrite A4 in H.
  rewrite A3 in H.
  left.
  exact H.
Qed.
