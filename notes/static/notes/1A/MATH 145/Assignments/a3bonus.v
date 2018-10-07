Require Export Utf8 Reals.

 (* Definition of floor function
    (https://en.wikipedia.org/wiki/Floor_and_ceiling_functions) *)

Definition Floor x := (up x - 1)%Z.
Notation " ⌊ x ⌋ " := (Floor x).

(* Easier-to-type ascii notation for ⌊x⌋ *)

Notation " [ x ] " := (Floor x).

(* Unicode symbols *)

Notation "x ⇒ y" :=
  (x -> y) (at level 99, y at level 200, right associativity): type_scope.

Infix "≤" := Rle : R_scope.
Infix "≥" := Rge : R_scope.
Infix "≤" := Z.le : Z_scope.
Infix "≥" := Z.ge : Z_scope.

(* Lemma 1: For all x ∈ ℝ, ⌊x⌋ ≤ x *)
Lemma Lemma_1 : ∀ x : R, (IZR ⌊x⌋ ≤ x)%R.
Proof.
  intros x.
  unfold Floor, Z.sub.
  pose proof archimed x as [H H0].
  unfold Rminus in H0.
  apply (Rplus_le_compat_r (x+-1)) in H0.
  rewrite <-Rplus_assoc, (Rplus_assoc _ _ x), Rplus_opp_l, Rplus_0_r,
  (Rplus_comm 1), Rplus_assoc, Rplus_opp_l, Rplus_0_r in H0.
  rewrite plus_IZR.
  simpl.
  auto.
Qed.

(* Lemma 2: For all x ∈ ℝ and z ∈ ℤ, z ≤ x ⇒ z ≤ ⌊x⌋ *)
Lemma Lemma_2 : ∀ (x : R) (z : Z), (IZR z ≤ x)%R ⇒ (z ≤ ⌊x⌋)%Z.
Proof.
  intros x z H.
  pose proof archimed x as [H0 H1].
  rewrite <-Z.lt_succ_r.
  unfold Floor, Z.succ, Z.sub.
  rewrite <-Z.add_assoc, Z.add_opp_diag_r, Z.add_0_r.
  apply Znot_ge_lt.
  intros H2.
  apply IZR_ge, Rge_le in H2.
  apply Rgt_not_le in H0.
  eauto using Rle_trans.
Qed.

(* Lemma 3: For all x, y ∈ ℝ, x ≤ y ⇒ ⌊x⌋ ≤ ⌊y⌋ *)
Lemma Lemma_3 : ∀ x y : R, (x ≤ y)%R ⇒ (⌊x⌋ ≤ ⌊y⌋)%Z.
Proof.
  intros x y H.
  eauto using Rle_trans, Lemma_1, Lemma_2.
Qed.

(* IZR means treat the following as a real *)
(* a%Z means that a is about integers *)
(* A3 Bonus: For all x ∈ ℝ and n ∈ ℤ, 0 < n ⇒ ⌊x / n⌋ = ⌊⌊x⌋ / n⌋ *)
Theorem A3_Bonus : ∀ (x : R) (n : Z),
    (0 < n)%Z ⇒ ⌊x / IZR n⌋ = ⌊IZR ⌊x⌋ / IZR n⌋.
Proof.
Admitted.