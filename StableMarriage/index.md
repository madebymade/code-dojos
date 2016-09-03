# Stable Marriage Problem

The stable marriage problem is the problem of finding a stable matching between two equally sized sets of elements given an ordering of preferences for each element.

A matching is a mapping from the elements of one set to the elements of the other set. A matching is not stable if:

1. There is an element A of the first matched set which prefers some given element B of the second matched set over the element to which A is already matched, and
2. B also prefers A over the element to which B is already matched.

##Application in the real world
Algorithms for finding solutions to the stable marriage problem have applications in a variety of real-world situations, such as assigning graduating medical students to their first hospital.

##Rules
- Consider a set of n women and n men.
- Each person has an ordered list of some members of the opposite sex as his or her preference list.
- Let µ be a matching between women and men. 
- A pair (m, w) is a blocking pair if both m and w prefer being together to their assignments under µ. Also, (x, x) is a blocking pair, if x prefers being single to his/her assignment under µ.
- A matching is stable if it does not have any blocking pair.

![Stable Marriage Problem](./example.png)