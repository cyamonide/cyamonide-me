(** Load file for previous assignment. **)

Add LoadPath "/home/cyamo/GitHub/notes/1A/MATH 145/Assignments/".
Load "a3".

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
Admitted.

Notation "x ≠ ± y" := (¬ (x = ± y)) (at level 60).

(* You may choose to use these definitions, or replace them with
   your own. If you replace them, you should ensure that the
   contents of the assignment problems are substantially similar
   to what they are using my definitions. *)

(* transitivity *)
Theorem O6 : ∀ a b c : Z, a<b ⇒ b<c ⇒ a<c.
Proof.
  unfold lt, sub.
  intros a b c H H0.
  replace (c+-a) with ((c+-b)+(b+-a)).
  - apply N1; auto.
  - rewrite A2, <-(A2 (-b)), A1P2, A1P1.
    reflexivity.
Qed.

Definition gcd (a b d : Z) :=
  (d | a) ∧ (d | b) ∧ ∀ x : Z, (x | a) ⇒ (x | b) ⇒ (x | d).

Definition prime (p : Z) :=
  p ≠ ± 1 ∧ ∀ d : Z, (d | p) ⇒ d = ± 1 ∨ d = ± p.

Axiom coprime : ∀ a b : Z, ¬(b | a) ∧ ¬(a | b) ⇒ 1 ∈ gcd a b.

(** Homework assignment problems are given below. **)

(* Bezout's Theorem *)
Theorem bezout : ∀ a b : Z, (a ≠ 0) ∧ (b ≠ 0) ⇒ ∃ x y : Z, (a*x)+(b*y) ∈ gcd a b.
Proof.
  intros.
  destruct (WOP {x : Z | x > 0 ∧ ∃ m n : Z, x = (m*a)+(n*b)}).
  - destruct (T a) as [[H0 [H1 H2]] | [[H0 [H1 H2]] | [H0 [H1 H2]]]].
    + exists a.
      split.
      exact H0.
      exists 1, 0.
      rewrite A1P6, A3, A1P3.
      reflexivity.
    + tauto.
    + exists (-a).
      split.
      apply (O1 _ _ (-a)) in H2.
      rewrite A1P1, A4 in H2.
      exact H2.
      exists (-1), 0.
      rewrite A1P6, A3, A1P7.
      reflexivity.
  - intros.
    destruct H0.
    rewrite <-(A3 x), <-(A4 0), <-A2, A3.
    exact H0.
  - (* at this point, H0 states that x is the least element in S *)
    pose proof A3P4 as H1.
Admitted.

Theorem A4P1 : ∀ a b : Z, 1 ∈ gcd a b ⇒ ∃ x y : Z, a * x + b * y = 1.
Proof.
  intros.
  unfold gcd in H.
  unfold In in H.
  destruct H; destruct H0.
  pose proof (H1 1).

  destruct (WOP {x : Z | ∀ a b : Z, (a ≠ 0) ∧ (b ≠ 0) ∧ (∃ m n : Z, x = a*m + b*n) ⇒ x > 0}).
  - exists d.
    intros.
    destruct H0.
    destruct H1.
    destruct H2; destruct H2.
    destruct (T a0) as [[H3 [H4 H5]] | [[H3 [H4 H5]] | [H3 [H4 H5]]]].
    + 
      exists 1, 0.
      rewrite (M1 b0 0), A1P6, A3, M1, A1P3.
  unfold gcd in H.
Admitted.

(* The following proof, previously done in class on the board (but not in Coq)
   is totally correct; you may use it on your assignment if you wish. *)
Theorem Gauss's_lemma : ∀ a b c : Z, (a | b * c) ⇒ 1 ∈ gcd a b ⇒ (a | c).
Proof.
  intros a b c H H0.
  destruct (A4P1 a b H0) as [x [y H1]].
  apply (S2 _ _ c) in H1.
  rewrite A1P3, D1, M2, (M2 b), (M1 y), <-(M2 b) in H1.
  assert (a | a) by (exists 1; eauto using A1P3).
  rewrite <-H1.
  eauto using A2P1.
Qed.

Theorem A4P2 : ∀ a b p : Z, p ∈ prime ⇒ (p | a * b) ⇒ (p | a) ∨ (p | b).
Proof.
  intros.
  pose proof (classic (p | a)).
  destruct H1.
  - auto.
  - pose proof (Gauss's_lemma p a b).
    destruct H2.
    + exact H0.
    + pose proof (coprime p a).
      apply H2.
      split.
      unfold not.
      intros.
      unfold prime, In in H.
      destruct H.
      pose proof (H4 p).


      unfold gcd, In.
      repeat split.
      * unfold divide.
        exists p.
        rewrite M3.
        reflexivity.
      * unfold divide.
        exists a.
        rewrite M3.
        reflexivity.
      * intros.
        unfold prime, In in H.
        destruct H.
        pose proof (H4 x).
        destruct H5.
        -- exact H2.
        -- destruct H5.
          ++ exists 1.
             rewrite A1P3.
             auto.
          ++ exists (-1).
             rewrite A1P7.
             apply (S2 _ _ (-1)) in H5.
             rewrite M1, A1P7, A1P7, A1P5 in H5.
             auto.
        -- destruct H5.
          ++ unfold divide.
             replace x.
             pose proof M4.
        exact H2.
        unfold pm in H5.
        unfold divide.
        exists 1.
        rewrite A1P3.
        symmetry.
        destruct H5.
        exact H5.

        unfold divide in H2, H3.
        destruct H2, H3.
        exists 1.

  unfold prime, In in H.
  destruct H.
  unfold divide in H0.
  destruct H0.
  unfold divide.
  pose proof (H1 x).
Admitted.

Theorem A4P3 : ∀ n : Z, ∃ p : Z, p ∈ prime ∧ (p | n).
Proof.
Admitted.

(** Definition of prime factorization, from Piazza @178. **)

Fixpoint product (L : list Z) :=
  match L with
    | nil => 1
    | p :: L => p * product L
  end.

Notation "∏ L" := (product L) (at level 50).

Definition prime_factorization (L : list Z) (n : Z) :=
  n = ∏ L ∧ (∀ p : Z, List.In p L ⇒ p ∈ prime).

(* Theorem A4_Bonus: Every positive integer has a prime factorization. *)

Theorem A4_Bonus : ∀ n : Z, 0 < n ⇒ ∃ L : list Z, prime_factorization L n.
Proof.
Admitted.