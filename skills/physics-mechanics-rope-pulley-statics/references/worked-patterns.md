# Ideal rope patterns and constraints

Use these as **templates**; always redraw the user's specific geometry.

## One rope, two masses over a single fixed ideal pulley

- One tension \(T\) on both sides (same strand).
- Equations: \(m_1 g - T = m_1 a_1\), \(T - m_2 g = m_2 a_2\) with constraint \(a_1 = -a_2\) if positive is “down” for \(m_1\) and “up” for \(m_2\) (adjust signs to match your diagram).

## Atwood machine

Same as above; \(a = (m_1 - m_2)g / (m_1 + m_2)\) for the common textbook choice of directions.

## Moving pulley (“gun tackle” style)

If the **pulley moves with the load** and one end is **anchored**, a **rope-length** count often gives **2:1** ideal MA on the load **if** the free end is pulled at twice the load's displacement rate. Confirm with: total constant length \(L = \text{fixed segments} + \text{moving segments}\).

## Block and tackle (ideal)

Count how many rope segments **support the moving block** only after checking which strand is **input** vs **fixed**; mis-labeling the fixed vs moving block is the usual error.

## Inclined plane + rope

Split weight into components along and normal to the plane; friction (if any) belongs in **`physics-mechanics-rope-friction-real-systems`**, not here—unless given as a simple constant \( \mu N \) with direction along the plane.

## Matrix habit (optional)

Multiple masses: unknowns \((T_1,\ldots,a_1,\ldots)\). Constraint rows eliminate dependent accelerations; remainder is a small linear system.
