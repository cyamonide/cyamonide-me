(** Load file for previous assignment. **)

Add LoadPath "/home/cyamo/GitHub/notes/1A/MATH 145/Assignments/".
Load "a2".

(** Definitions of ℕ and order relation from class. Comment out or delete
    this section if you have already defined them in your a2 file. **)

(* Definition ℤ := (Full_set Z).
Definition P := Ensemble. *)
Infix "∋" := (In Z) (at level 70).
Notation "x ∈ S" := (S ∋ x) (at level 70).
Notation "x ∉ S" := (¬(x ∈ S)) (at level 70).
Infix "⊂" := (Included Z) (at level 70).
Notation "∅" := (Empty_set Z).
Notation "{ x : A | P }" := (λ x : A, P).

(* Parameter ℕ : P(Z). *)

(* Definition lt (a b : Z) := b-a ∈ ℕ. *)
Infix "<" := lt.
Notation "x > y" := (y < x) (only parsing).
Definition lteq (x y : Z) := (x < y ∨ x = y).
Notation "x <= y" := (x < y ∨ x = y).
Notation "x ≤ y" := (x < y ∨ x = y) (at level 70).
Definition gteq (x y : Z) := (x > y ∨ x = y).
Notation "x >= y" := (x > y ∨ x = y).
Notation "x ≥ y" := (x > y ∨ x = y) (at level 70).
Definition ltx2 (x y z : Z) := (x < y ∧ y < z).
Notation "x < y < z" := (x < y ∧ y < z).
Notation "x <= y < z" := (x <= y ∧ y < z).
Notation "x ≤ y < z" :=
  (x ≤ y ∧ y < z) (at level 70, y at next level).

(* Well ordering principle *)
Axiom W1 : ∀ S : P(Z), (S ≠ ∅) ⇒ (S ⊂ ℕ) ⇒ ∃ m : Z, m ∈ S ∧ ∀ x : Z, x ∈ S ⇒ m < x ∨ m = x.

Lemma WOP : ∀ S : P(Z), (∃ x : Z, S x) ⇒ (∀ x : Z, S x ⇒ x ∈ ℕ) ⇒
 ∃ s : Z, S s ∧ ∀ t : Z, S t ⇒ s < t ∨ s = t.
Proof.
  intros S [x H] H0.
  destruct (W1 S) as [y H1]; try eauto.
  intros H1.
  subst S.
  contradiction H.
Qed.

(** Homework assignment problems are given below. **)

Theorem A3P1' : ∀ a b : Z,
    (a > b ∧ a ≠ b ∧ ¬ a < b) ∨ 
    (¬ a > b ∧ a = b ∧ ¬ a < b) ∨
    (¬ a > b ∧ a ≠ b ∧ a < b).
Proof.
  intros a b.
  destruct (T (a+-b)) as [[H [H0 H1]] | [[H [H0 H1]] | [H [H0 H1]]]].
  - left.
    repeat split.
    + apply (O1 _ _ b) in H.
      rewrite A1P1, A2, A1P2, A3 in H.
      exact H.
    + intros H2.
      apply (S1 _ _ (-b)) in H2.
      rewrite A4 in H2.
      contradiction.
    + intros H2.
      apply (O1 _ _ (-b)) in H2.
      rewrite A4 in H2.
      contradiction.
  - right. left.
    repeat split.
    + intros H2.
      apply (O1 _ _ (-b)) in H2.
      rewrite A4 in H2.
      contradiction.
    + apply (S1 _ _ b) in H0.
      rewrite A1P1, A2, A1P2, A3 in H0.
      exact H0.
    + intros H2.
      apply (O1 _ _ (-b)) in H2.
      rewrite A4 in H2.
      contradiction.
  - right. right.
    repeat split.
    + intros H2.
      apply (O1 _ _ (-b)) in H2.
      rewrite A4 in H2.
      contradiction.
    + intros H2.
      apply (S1 _ _ (-b)) in H2.
      rewrite A4 in H2.
      contradiction.
    + apply (O1 _ _ b) in H1.
      rewrite A1P1, A2, A1P2, A3 in H1.
      exact H1.
Qed.

Theorem A3P1 : ∀ a b : Z, a < b ∨ a = b ∨ a > b.
Proof.
  intros.
  destruct (T (a + (-b))) as [[H0 [H1 H2]] | [[H0 [H1 H2]] | [H0 [H1 H2]]]].
  - apply (O1 0 (a + (-b)) b) in H0.
    rewrite A2, (A1 (-b) b), A4, A3, A1P1 in H0.
    tauto.
  - apply (S1 _ _ b) in H1.
    rewrite A2, (A1 (-b) b), A4, A3, A1P1 in H1.
    tauto.
  - apply (O1 (a + (-b)) 0 b) in H2.
    rewrite A2, (A1 (-b) b), A4, A3, A1P1 in H2.
    tauto.
Qed.

Axiom EQ: ∀ a b c : Z, a < b < c -> a < c.
Axiom O5 : ∀ a b c : Z, a <= b ⇒ a + c <= b + c.

(* Worked with Diana Chung on this proof *)
Theorem A3P2 : ∀ a : Z, ¬ (0 < a < 1).
Proof.
  intros a H.
  destruct (WOP {x : Z | 0 < x}).
  - exists a.
    tauto.
  - simpl.
    intros x H0.
    unfold lt, sub in H0.
    rewrite <- (A1P1 (-0)), A4, A3 in H0.
    exact H0.
  - destruct H0 as [H1 H2].
    pose proof (H2 (x * x)).
    assert (x < 1).
    pose proof (H2 a).
    destruct H3.
    tauto.
    destruct H.
    pose proof (conj H3 H4).
    apply EQ in H5.
    exact H5.
    symmetry in H3.
    rewrite H3 in H.
    tauto.
    pose proof H1.
    apply (O2 _ _ (x)) in H3.
    rewrite (M1 (1) (x)) in H3.
    rewrite M3 in H3.
    apply (O2 0 x x) in H1.
    rewrite A1P6 in H1.
    pose proof (H0 H1).
    pose proof (conj H3 H5).
    destruct H6.
    apply (O1 _ _ (- x)) in H6.
    rewrite A4 in H6.
    apply (O5 _ _ (-x)) in H5.
    rewrite A4 in H5.
    pose proof (T (x * x + (- x))).
    intuition.
    exact H1.
    exact H4.
Qed.

(*

Axiom P0 : ∀ x a : Z, x * a < x ⇒ x > 0 ⇒ a < 1.

Theorem O5 : ∀ a b c d: Z, a < b < c ⇒ d > 0 ⇒ a * d < b * d < c * d.
Proof.
  intros.
  unfold ltx2 in H.
  destruct H.
  apply (O2 b c d) in H1.
  apply (O2 a b d) in H.
  unfold ltx2.
  exact (conj H H1).
  tauto. tauto.
Qed.

*)

(* seek proofs if time allows *)
Axiom P1 : ∀ a b c : Z, a = b * c ⇒ (a > 0 ∧ c > 0) ⇒ b > 0.

(* prove using set theory? *)
Axiom P2 : ∀ a : Z, ¬(0 < a < 1) ∧ a > 0 ⇒ a ≥ 1.

Theorem A3P3 : ∀ a b : Z, (a | b) ⇒ a > 0 ⇒ b > 0 ⇒ a ≤ b.
Proof.
  intros.
  unfold divide in H.
  destruct H.
  pose proof H as H3.
  apply (P1 b x a) in H.
  pose proof (conj (A3P2 x) H).
  apply (P2 x) in H2.
  unfold gteq in H2.
  unfold lteq.
  destruct H2.
  - apply (O2 1 x a) in H2.
    rewrite A1P3 in H2.
    replace (x*a) with b in H2.
    left.
    exact H2.
    tauto.
  - replace x with 1 in H3.
    rewrite A1P3 in H3.
    right.
    symmetry in H3.
    exact H3.
  - pose proof (conj H1 H0).
    exact H2.
Qed.
(* 
(* Division Theorem *)
Theorem A3P4 : ∀ a b : Z,
    0 < a ⇒ 0 < b ⇒ (∃ q r : Z, a = b * q + r ∧ 0 ≤ r < b).
Proof.
  intros a b H H0.
(*   destruct (WOP {x : Z | x > 0 ∧ ∃ k : Z, x = a + -(b*k)}). *)
  destruct (WOP {x : Z | x > 0 ∧ ∃ k : Z, x = a + -(b*k)})
           as [r [[H1 [q H2]] H3]]; autounfold.
  - exists a.
    split.
    + auto.
    + exists 0.
      rewrite M1, A1P6, <-(A3 (-0)), A1P2, A3.
      reflexivity.
  - intros x [H1 H2].
    rewrite <-(A3 x), <-(A4 0), <-A2, A3.
    exact H1.
  - destruct (A3P1' r b) as [[H4 [H5 H6]] | [[H4 [H5 H6]] | [H4 [H5 H6]]]].
    + destruct (H3 (r+-b)).
      split.
      * apply (O1 _ _ (-b)) in H4.
        rewrite A4 in H4.
        exact H4.
      * exists (q+1).
        subst r.
        rewrite <-(A1P7 (b*(q+1))), <-M2, A1P7, (M1 (-b)), D1,
        A1P3, <-(A2 a), <-(A1P7 (b*q)), <-M2, A1P7, (M1 q).
        reflexivity.
      * (* Case r < r + -b *)
        exfalso.
        apply (O1 _ _ (r+-b)) in H0.
        rewrite A1P1, A1, <-A2, A4, A1P1, A1 in H0.
        pose proof (A3P1' (r+-b) r).
        tauto.
      * (* case r = r + -b *)
        exfalso.
        apply (O1 _ _ (-b + r)) in H0.
        rewrite <-(A2 b (-b) r), A4, A1P1, A1P1, A1 in H0.
        pose proof (A3P1' r (r+-b)).
        tauto.
    + 
Admitted. *)