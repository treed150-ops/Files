# Upper globe light-transmission correction

Use `globe_120mm_upper_LIGHT_MATCH.stl` with the existing lower globe.
Neither lower STL nor the original upper STL was overwritten.

## Measured thickness

The original upper is a 2.0 mm concentric spherical shell. The desired broad
shell in `globe_120mm_lower_FIXED.stl` is 1.2 mm, with deliberately thicker
mounting and connector regions. Identical slicer settings therefore did not
give identical amounts of plastic through the visible upper and lower walls.

Thickness was measured along radial rays, normal to the ideal spherical
surface, by intersecting the actual STL meridian facets. Latitude is measured
from the equator; corresponding lower measurements use negative latitude.

| Latitude | Upper before | Lower FIXED reference | Upper LIGHT_MATCH |
|---|---:|---:|---:|
| 10 degrees | 1.99996 mm | 1.19988 mm | 1.19941 mm |
| 15 degrees | 2.00000 mm | 1.19933 mm | 1.20050 mm |
| 20 degrees | 1.99996 mm | 1.19978 mm | 1.19927 mm |
| 25 degrees | 1.99996 mm | 1.19937 mm | 1.19914 mm |
| 30 degrees | 2.00000 mm | 1.19956 mm | 1.20013 mm |
| 35 degrees | 1.99996 mm | 1.19944 mm | 1.19892 mm |
| 60 degrees | 2.00000 mm | Not on lower half | 1.20057 mm |
| Crown, vertical | 2.00000 mm | Not on lower half | 1.20000 mm |

Small differences from 1.2/2.0 mm reflect finite STL facets rather than extra
shells. Full multi-location measurements are in the thickness CSV. The upper
at 0–5 degree latitude remains 2 mm to protect the mating socket. At 8 degrees,
the gradual socket blend measures 1.51608 mm; this is intentional.

## Geometry changes and preserved surfaces

- Exterior: **exactly the same 172,080 exterior triangles**, preserving the
  120 mm outside diameter and original smooth tessellated sphere.
- Mating socket and seating face: **the same 20,160 triangles** through
  Z = 5.307094 mm. This covers the complete existing 5 mm male engagement,
  so all contact geometry and the original clearance remain unchanged.
- Socket reinforcement blends internally from 2 mm at Z = 5.307094 mm to
  1.2 mm at Z = 10 mm. The exterior is not changed to create this blend.
- Above that blend, the inner sphere is changed from radius 58 to 58.8 mm,
  leaving the requested 1.2 mm nominal spherical shell and a hollow LED cavity.
- Crown: inner apex rises from Z = 58 to 58.8 mm; outer apex remains Z = 60 mm.
  Its vertical thickness becomes 1.2 mm. No flat internal roof was added.
- No overlapping duplicate shells, detached internal walls, internal ribs or
  unintended solid blocks were found. The small solid crown is the normal
  closed end of a finite-thickness spherical shell.
- Final STL: watertight, manifold, one component, consistent winding, positive
  volume, no degenerate faces, with a simple nonintersecting meridian profile.
- The lower reference retains SHA-256
  `097ad6c0d1c93a83650ad1e2e5360e593fe7816eaa43495eced83df5063ac16d`.
  No lower shell geometry was changed.

## Actual Bambu Studio slicing comparison

All three files were sliced with the official **Bambu Studio 02.09.01.70**
Linux release and its **Bambu Lab P2S 0.4 nozzle** and **Bambu PLA Basic**
profiles. The same flattened profile settings were supplied to each run:

- 0.16 mm layers, including the first layer.
- 0.4 mm nozzle; three requested wall loops; 0% sparse infill.
- Classic wall generator; nominal 0.42 mm outer and 0.45 mm inner line widths.
- Six top shell layers and four bottom shell layers from the standard profile.
- Supports off for this controlled shell comparison. Lower-body exterior
  support recommendations from the previous repair still apply when printing.
- Upper models rim-down; lower mounting-opening-down. No automatic reorientation.

The generated G-code configuration blocks were checked for the requested
settings; all slicing jobs returned success. These are actual toolpaths,
not a predicted count derived only from STL thickness.

| Sliced measure | Upper before | Upper LIGHT_MATCH | Lower FIXED reference |
|---|---:|---:|---:|
| Bead crossings through shell near 30-degree latitude | 6 | 3 | 3 |
| Estimated filament mass, entire model | 53.56 g | 35.02 g | 41.40 g |
| Extruded filament for internal solid infill | 2111.1 mm | 367.7 mm | 931.1 mm |
| Toolpaths labeled Floating vertical shell | Present | None | Present in reinforced lower regions |

Three wall loops is a requested maximum perimeter treatment around each
boundary; it does not guarantee three deposited lines across every annular
wall. At the inspected location, the original upper has two outer-boundary
paths plus four inner-wall paths. The revised upper and lower each have two
boundary paths with one variable-width gap-fill path between them. Gap-fill
width there is approximately 0.604 mm in the revised upper and 0.605 mm in
the lower. Their actual shell deposition is closely matched.

`Floating vertical shell` is a slicer feature label for a fill treatment, not
by itself evidence of a disconnected mesh or an unsupported extrusion. It is
reported above to make the before/after toolpath classification auditable.

The full-model masses are not directly equal targets: the lower has a mounting
region and a reinforced male connector, while the upper has a closing crown.
Zero sparse infill still permits gap fill and solid top/bottom surfaces.

The toolpath detail PNG shows the actual +X shell crossings at about 30-degree
latitude. The comparison JSON contains path lengths, extrusion totals and
bridge heights; the layer CSV contains feature-by-feature extrusion for every
layer. A slicing-evidence ZIP includes the generated G-code, results, profile
JSON and a note that these are comparison artifacts rather than a ready-to-print
replacement for the user's own printer project.

## Crown printability

The new crown preserves a curved closure rather than adding a wide horizontal
ceiling. In the actual no-support slice, bridge-labeled moves occur at
Z = 58.56, 58.72 and 58.88 mm. The longest bridge-labeled extrusion move is
**12.296 mm**, compared with **12.222 mm** in the original 2 mm upper that
already printed. Thus, bridge lengths are effectively unchanged, rather than
turning the dome into a large flat roof. No Floating vertical shell feature
is generated for the revised upper.

These are short crown closure bridges, not a claim that every crown extrusion
is directly supported underneath. Use the PLA profile's bridge cooling and
bridge speed, and inspect the crown in your Bambu Studio version. Slicing
success and similar bridge spans support printability, but no physical print
test was performed here.

## Printing and expected appearance

Print the upper with its **equatorial mating rim flat on the bed**, crown up,
100% scale. Use the requested 0.16 mm, 0.4 mm nozzle, three wall loops and 0%
infill. The controlled slice needed no internal supports for the upper.
Avoid support inside the socket, which could change the fit through residue.

This correction matches the visible-shell thickness and closely matches the
reference's actual deposited toolpaths. Exact perceived brightness also depends
on LED position and emission direction, distance to the shell, filament pigment
and batch, extrusion flow, temperature, cooling and surface texture. A tea light
near the lower half can still illuminate the crown differently even when the
wall thicknesses match. The retained socket band will remain thicker by design.
