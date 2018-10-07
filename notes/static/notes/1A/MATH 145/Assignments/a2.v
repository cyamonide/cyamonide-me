(** Load file for previous assignment. If you have trouble with this
    command, you can just delete the following line and cut and paste
    your file from assignment 1 into the top of this file. **)

Pwd.

(* Windows path *)
Add LoadPath "C:\Users\cyamo\Documents\GitHub\notes\1A\MATH 145\Assignments".
(* Linux path *)
Add LoadPath "/home/cyamo/GitHub/notes/1A/MATH 145/Assignments".
(* a1.v has been modified since my A1 submission; an updated
a1.v should be uploaded with this file. -SL*)
Load "a1".

(* in-class
(* Definition P := Ensemble. *)
Parameter N : P(Z). (* subset of natural numbers *)
(* see notes for two lines here *)
Axiom A : forall a : Z, (A E N disjoint a = 0 disjoint -a E N).
Definition less_than (a b : Z) := b-a E N.
Infix "<" = less_than.
*)

(** Definition of divides. In the course notes, the notation is
    slightly different: "a|b" instead of "(a|b)". Coq requires
    extra parentheses or else this notation would conflict with
    set notation. **)

Definition divide (x y : Z) := exists z, y = z*x.
Notation "( x | y )" := (divide x y).
(** Definition of ±, used in problem 5. **)
Definition pm (a b : Z) := (a = b ∨ a = -b).
Notation " a = ± b " := (pm a b) (at level 60).

Theorem A2P1 : ∀ a m n x y : Z, (a | m) ⇒ (a | n) ⇒ (a | m * x + n * y).
Proof.
  intros.
  unfold divide in H, H0.
  destruct H, H0.
  unfold divide.
  exists ((x0 * x) + (x1 * y)).
  pose proof (eq_refl a).
  apply (S2 _ _ ((x0 * x) + (x1 * y))) in H1.
  rewrite M1, D1 in H1.
  rewrite (M1 x0 x), M2 in H1 at 1.
  rewrite <-H in H1.
  rewrite (M1 x1 y) in H1 at 1.
  rewrite M2 in H1 at 1.
  rewrite <-H0 in H1.
  rewrite (M1 x m) in H1.
  rewrite (M1 y n) in H1.
  rewrite <-D1 in H1.
  exact H1.
Qed.

Theorem A2P2: ∀ a b c : Z, (a | b) ⇒ (b | c) ⇒ (a | c).
Proof.
  intros.
  unfold divide in H, H0.
  unfold divide.
  destruct H, H0.
  exists (x0*x).
  rewrite H in H0.
  rewrite <-M2 in H0.
  exact H0.
Qed.

Theorem A2P3 : 0 ≠ 1.
Proof.
  unfold not.
  intros.
  pose proof (O4) as H'.
  destruct (T 1) as [[H0 [H1 H2]] | [[H0 [H1 H2]] | [H0 [H1 H2]]]].
  - rewrite neq_symm in H1.
    tauto.
  - tauto. (* H' and H0 *)
  - tauto. (* H'a nd H0 *)
Qed.

(* division *)
Theorem A2P4 : ∀ a b c : Z, a * c = b * c ⇒ c ≠ 0 ⇒ a = b.
Proof.
  intros.
  apply (S1 _ _ (-(a*c))) in H.
  rewrite A4 in H.
  rewrite <-A1P7 in H.
  rewrite <-M2 in H.
  rewrite <-D1 in H.
  symmetry in H.
  apply A1P11 in H.
  destruct H.
  - rewrite A1P7 in H.
    apply (S1 _ _ a) in H.
    rewrite A2, (A1 (-a) a) in H.
    rewrite A4, A1P1, A1, A1P1 in H.
    symmetry in H.
    exact H.
  - tauto.
Qed.

Print Assumptions A2P4.

(* This separates the integers from the rationals,
  but does it isolate the integers from other number
  systems? -SL *)
Axiom M4 : ∀ a b : Z, a * b = 1 ⇒ ((a = 1) ∧ (b = 1)) ∨ ((a = (-1)) ∧ (b = (-1))).
(*
Proof.
  intros.
  split.
  pose proof (A1P10 a).
  pose proof (A1P3 b).
*)

Theorem A2P5 : ∀ a b : Z, (a | b) ⇒ (b | a) ⇒ a = ± b.
Proof.
  unfold pm.
  intros.
  unfold divide.
  unfold divide in H, H0.
  destruct H, H0.
  rewrite H in H0.
  rewrite <-M2 in H0.
  apply (S1 _ _ (-(x0 * x * a))) in H0.
  rewrite A4, <-A1P7 in H0.
  rewrite <-(M2 (-1) (x0*x) a), <-(M2 (-1) x0 x) in H0.
  rewrite <-(A1P3 a) in H0 at 1.
  rewrite <-D1 in H0.
  apply A1P11 in H0.
  destruct H0.
  - rewrite A1P7 in H0.
    apply (S1 _ _ (-1)) in H0.
    rewrite A1, <-A2, (A1 (-1) 1), A4 in H0.
    rewrite A1P1 in H0.
    rewrite A1P1 in H0.
    apply (S2 _ _ (-1)) in H0.
    rewrite A1P7, A1P5 in H0.
    rewrite M1, <-M2, A1P7, A1P5 in H0.
    apply M4 in H0.
    destruct H0.
    + destruct H0.
      rewrite H1, A1P3 in H.
      left.
      symmetry in H.
      exact H.
    + destruct H0.
      rewrite H1, A1P7 in H.
      apply (S2 _ _ (-1)) in H.
      rewrite M1, A1P7 in H.
      rewrite M1, A1P7, A1P5 in H.
      right.
      symmetry in H.
      exact H.
  - rewrite H0 in H.
    rewrite M1, A1P6 in H.
    left.
    congruence.
Qed.


(*
Theorem A2P6 : ∀ a b c : Z, (a | b * c) ⇒ (p | b) ∨ (a | c).
Proof.


(*
  intros.

  unfold divide in H.
  destruct H.
  unfold divide.
*)

(*
  I was unable to produce a proof in time for submission.
  The approach I took with my current set of axioms and 
  theorems was as follows.

  Once the lines of code in the above comment block 
  execute, we have 
    `H: b * c = x * a`
  to work with. Taking the left side of our goal, we 
  then have 
    `∃ z : Z, b = z * a`
  If we can show that (c | x), i.e x = x1 * c, we can 
  rewrite H to get 
    `H: b * c = x1 * c * a`
  then apply division of both sides (A2P4) by c to get
    `H: b = x1 * a`.
  `exists x1` and we are done. But, how do we show that (c | x)?
  We could show that (b | a) -> a = x2 * b so that c = x * x2
  but then we start going in circles.

  I likely need more axioms.

  -SL
*)dmitted.


Uncommented and 

- SL 
*)