# Repaired lower Christmas globe

Use `globe_120mm_lower_FIXED.stl` with the existing `globe_120mm_upper.stl`.

## What was wrong

The original lower STL is a single connected, watertight mesh. Its problem is
printability, rather than a detached shell. The connector's internal root has a
2.388 mm horizontal ledge. In addition, when the connector lip is on the bed,
the exterior globe shoulder starts at 5 mm print height and jumps outward by
2.25 mm in radius beyond the lip. The next abrupt internal transition is at
8 mm print height. These shoulders lie in the reported 5–10 mm region.

The outer shoulder has no preceding material underneath its outer perimeter.
This is a geometric cause of unsupported extrusion in the reported orientation.
The precise toolpath producing the reported loose inner strand cannot be
identified without the failed sliced project or G-code. There is no separate
disconnected connector component in the supplied source STL.

## Correction and dimensional preservation

The flat internal root ledge is replaced by a 5 mm tall continuous conical
transition, approximately 28.54 degrees from vertical. It runs from assembly
Z = -8 to -3 mm and supports the inward-growing connector when printed with
the mounting opening down. The broad optical shell is 1.2 mm nominal normal
thickness, blended back into the original reinforced mounting region. The
mounting region and connector intentionally retain their original thickness.
The original model had a 2 mm spherical wall.

The following surfaces retain exactly the original float32 triangle geometry:

- Entire 120 mm diameter external sphere and equatorial shoulder.
- Bottom mounting opening, 54.4 mm nominal, including the surrounding mounting
  region through 9.8624 mm above its bottom face. Its original profile and fit
  are unchanged, rather than merely recreated at the same nominal diameter.
- Complete mating lip above the equator: 5 mm engagement; 115.5 mm base outside
  diameter; 115.06816 mm tip outside diameter; 111.06816 mm inside diameter.
  The lip follows the same spherical curve and retains the original clearance.

The upper STL was used only as a reference and is unchanged. No external collar
or extra seam was added. The original two-half equatorial joint remains.

## Print orientation and supports

**Print with the 54.4 mm mounting opening on the bed and the connector pointing
up.** Keep the axis vertical. The STL retains the original assembly coordinate
system, so use Drop to Bed in the slicer; do not scale or automatically rotate
the part onto its connector lip.

Use 0.16 mm layers with the 0.4 mm nozzle. Use ordinary build-plate supports
only under the lower curved exterior as needed, particularly the first
approximately 9 mm of the sphere, where the surface exceeds 45 degrees from
vertical. Keep supports out of the mounting bore, interior cavity, and mating
lip. No supports are needed for the redesigned connector transition in this
orientation. Preview the actual wall paths and supports before printing;
geometry verification does not replace material-specific slicer settings.

**Do not print this file lip-down without exterior shoulder supports.** Making
that orientation completely self-supporting would require changing the mating
lip, trimming the preserved exterior shoulder, or using a sacrificial support
feature. No such dimensional changes were made. The repair addresses the
internal transition itself; it does not use tree supports to conceal it.

## Verification at 0.16 mm

Actual STL meridian intersections were evaluated at 0.16 mm intervals over the
entire part in both orientations. Layer numbers use a uniform 0.16 mm first
layer and sample layer centers; a different first-layer height shifts the
numbering in Bambu Studio.

- Mesh: one connected component, watertight, consistently oriented, zero
  boundary/nonmanifold edges, no degenerate triangles, positive volume.
  The meridian is a valid simple polygon, with no crossing surfaces on revolution.
- Recommended orientation: no new isolated annulus anywhere. Layers 35–60
  have supported inner wall bead centers; layer 43 is sampled at 6.8 mm.
  These layers contain the lower spherical wall, not the connector.
- Connector transition and lip: approximately layers 271–352; maximum inward
  radial advance is 0.08702 mm per 0.16 mm layer, less than a 45-degree step
  and 22% of a 0.4 mm nominal bead width. Minimum material overlap between
  consecutive annuli is 1.21084 mm. All tested inner-wall bead centers lie
  above material in the previous layer.
- Lip-down analysis explicitly retains the 2.25 mm unsupported outer shoulder
  at 5 mm height. The corresponding CSV is not a support-free approval.

The CSV files contain every evaluated layer, including layers 35–60. Bead-center
checks use a nominal 0.4 mm width and do not simulate the Bambu wall generator,
bridging, extrusion, cooling, or adhesion. This is geometric verification, not
a physical print test or a Bambu Studio G-code simulation.

See the section PNG for the before/after connector profile and the validation
JSON for mesh counts, exact surface comparisons, and SHA-256 hashes.
