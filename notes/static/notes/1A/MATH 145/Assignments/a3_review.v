(** Load file for previous assignment. **)

Add LoadPath "/home/cyamo/GitHub/notes/1A/MATH 145/Assignments/".
Load "a2".

(** Definitions of ℕ and order relation from class. Comment out or delete
    this section if you have already defined them in your a2 file. **)

(*
Definition ℤ := (Full_set Z).
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
Notation "x <= y" := (x < y ∨ x = y).
Notation "x ≤ y" := (x < y ∨ x = y) (at level 70).
Notation "x >= y" := (x > y ∨ x = y).
Notation "x ≥ y" := (x > y ∨ x = y) (at level 70).
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

(* Axiom N0 : ℕ ≠ ∅.
Axiom N1 : ∀ a b : Z, a ∈ ℕ ⇒ b ∈ ℕ ⇒ a+b ∈ ℕ.
Axiom N2 : ∀ a b : Z, a ∈ ℕ ⇒ b ∈ ℕ ⇒ a*b ∈ ℕ. *)

(* Theorem O1 : ∀ a b c : Z, a < b ⇒ a + c < b + c.
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
Qed. *)

Theorem A3P1' : ∀ a b c : Z,
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
    + (* contradiction *)
      intros H2.
      apply (S1 _ _ (-b)) in H2.
      rewrite A4 in H2.
      (* H2 directly contradicts H0 *)
      contradiction.
    + (* b > a => false, contradiction *)
      intros H2.
      apply (O1 _ _ (-b)) in H2.
      rewrite A4 in H2.
      contradiction.
  - right. left.
    repeat split.
    + intros H2.
      apply (O1 _ _ (-b)) in H2.
      rewrite A4 in H2.
      (* H2 contadicts H *)
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
      (* copy pasta *)
Admitted.

(** Homework assignment problems are given below. **)

Theorem A3P1 : ∀ a b : Z, a < b ∨ a = b ∨ a > b.
Proof.
Admitted.

Theorem A3P2 : ∀ a : Z, ¬ (0 < a < 1).
Proof.
Admitted.

Theorem A3P3 : ∀ a b : Z, (a | b) ⇒ a ≤ b.
Proof.
Admitted.


(* Division Algorithm *)
(* Theorem 5.1 in course notes *)
Theorem A3P4 : ∀ a b : Z,
    0 < a ⇒ 0 < b ⇒ (∃ q r : Z, a = b * q + r ∧ 0 ≤ r < b).
Proof.
  intros a b H H0.
  destruct (WOP {x : Z | x > 0 ∧ ∃ k : Z, x = a + -(b*k)})
            (* destruct a bunch of things, see third - bullet *)
           as [r [[H1 [q H2]] H3]]; autounfold.
  - exists a.
    split.
    + auto.
    + exists 0.
      rewrite M1, A1P6, <-(A3 (-0)), A1P2, A3.
      reflexivity.
  - (* automatic split *)
    intros x [H1 H2].
    rewrite <-(A3 x), <-(A4 0), <-A2, A3.
    exact H1.
  - (* WOP stage, a little complicated *)
    (* if r=0, the correct remainder is b
        the correct thing to do here is to compare r with b *)
    destruct (A3P1' r b) as [[H4 [H5 H6]] | [[H4 [H5 H6]] | [H4 [H5 H6]]]].
    + (* most interesting case *)
      (* if r > b, then a b can be subtracted from r and still get
          a positive integer *)
      destruct (H3 (r+-b)).
      split.
      * (* something *)
      * (* now show that r-b is a legal remainder *)
      * (* know a contradiction is lurking somewhere in there*)
        exfalso.
        (* H0 and H7 basically says a < b and b < a
            this contradicts A1P3'
            tauto that shit *)
Admitted.















