# Corrected Christmas globe mounting fit

## Print the full-depth fit test first

- `globe_mounting_fit_TEST.stl` reproduces the **entire corrected internal
  cavity**, including the gradual taper and the narrow connector bore.
- It is intentionally **52.4515 mm tall**, rather than only 10–15 mm. The
  original reference has no separate socket end or internal seating stop, so
  a short ring could pass while missing interference higher up.
- Its internal surface triangles are identical to those of the complete
  corrected lower globe. Only the outside is pared back; it uses about 33%
  less material than the corrected lower half, before supports.
- It includes the original opening face and lower outer mounting contact
  region. It does not test the upper globe's external press-fit connection.
- Print it opening-down and slide it fully over the actual pole topper. Check
  that it seats to the same position as the original, with no visible gap.
  If it does not, report where contact occurs or provide the topper STL/scan
  and seated dimensions before printing the complete lower half.

`globe_120mm_lower_CORRECTED_FIT.stl` is the corresponding complete lower half.
Keep using the existing `globe_120mm_upper.stl` without changes.

## Measured comparison

| Feature | Original fitting reference | Successful lower before correction | Corrected lower |
|---|---:|---:|---:|
| Inner opening at the rim | 69.449219 mm | 54.400002 mm | 69.449219 mm |
| Outer rim diameter | 73.440002 mm | 62.476875 mm | 73.440002 mm |
| Globe outside diameter | 120 mm | 120 mm | 120 mm |
| Opening plane below equator | 47.451466 mm | 51.226555 mm | 47.451466 mm |

The uploaded master is `Christmas_Globe_120mm_PRESS_FIT_BOTTOM.stl` (without the
`(1)` suffix). Its actual geometry was used; the approximate 69.4 mm number was
not substituted for it. The original is a 1.2 mm spherical shell cut at the
mounting opening. Its curved cavity has no separate cylindrical socket,
flat internal seat, or distinct depth stop.

The original reference was aligned by its sphere center/equatorial plane,
without scaling. Its complete curved cavity was copied through **39.4015 mm
above the opening**, including the full angular polygon profile. A 0.05 mm
high blend connects it to the existing taper at 39.4515 mm. The mounting rim
and the lower exterior region were copied from the reference as well.

The corrected bottom is 3.775089 mm higher within the same 120 mm sphere.
This is the reference opening position, not a uniform enlargement or scaling.
The broad shell remains approximately 1.2 mm thick. The successful body above
the lower mounting region, entire gradual taper and upper connector retain
their existing geometry; all 87,840 triangles at/above assembly Z = -8 mm
match the successful STL exactly. No new internal stop or shoulder was added.
The upper globe file was not modified.

## Clearance limitation above the copied cavity

The pole topper itself has not been supplied or measured. Consequently,
**full seating and absence of interference with the taper are not yet
confirmed**. This cannot be inferred from the two globe cavities alone.

The unchanged successful taper begins 39.4515 mm above the new opening and
narrows to **111.06816 mm inside diameter** at 44.4515 mm height. That bore
continues through the connector to 52.4515 mm height. The original spherical
cavity is wider in this region. A topper that occupies the removed volume
would interfere even though it fits the original globe.

The supplied test reproduces this restriction, so its physical seating test
checks the actual potential conflict. No mating dimensions were changed to
hide that conflict. If it interferes, the topper geometry/contact dimensions
are needed to determine whether only a transition change can resolve it or
whether preserving the connector makes full seating impossible.

## Geometry verification

- Both STLs: watertight, manifold, one connected component, consistent winding,
  no degenerate triangles and positive volume. Meridian profiles are simple
  polygons with no self-intersections.
- Complete corrected outside diameter: exactly 120 mm in the STL coordinates.
- Protected connector and gradual taper: unchanged triangle geometry.
- Original/corrected cavity comparisons: every 0.16 mm through 39.4 mm, plus
  named heights; maximum measured diameter difference about 0.0000045 mm,
  attributable to float32 translation rounding.
- Independent horizontal cuts through the serialized STL at 10 heights and
  6 azimuths verify the angular profile as well as its nominal diameter.
- First 15 mm: checked in 0.16 mm increments, with no isolated annulus and all
  nominal 0.4 mm inner-wall bead centers above previous-layer material.
- Layers 35–60: no new isolated wall; maximum exterior radial advance is
  0.156951 mm per 0.16 mm layer, within a 45-degree geometric criterion.
- The first few millimeters of the curved outside exceed that criterion:
  maximum checked exterior advance is 0.204921 mm per layer. Exterior supports
  are recommended there; this is separate from the supported internal cavity.

See the JSON and CSV files for measurements and layer data. These are geometric
checks, not a Bambu Studio toolpath simulation, physical print or pole fit test.
Uniform 0.16 mm first-layer height is assumed for layer numbering; a different
first-layer height in Bambu Studio shifts the numbers.

## Printing

Print **mounting opening down, connector/cavity throat up**, axis vertical,
at 100% scale. Use Drop to Bed; files retain the common assembly coordinate
system, with the equator at Z = 0. The test uses the same orientation.

For the P2S, 0.4 mm nozzle and 0.16 mm layers, use ordinary build-plate supports
under the steep lower exterior, approximately the first 5–6 mm as indicated by
slicer preview. Keep supports out of the mounting opening, cavity, gradual
taper and connector bore. The connector transition needs no supports in this
orientation. A brim may help the test remain stable; remove it and any exterior
support contact residue before assessing seating. Inspect the actual sliced
perimeters, especially layers 35–60, before printing.

Do not assess fit by scaling either STL or by sanding away the test's internal
cavity. If the full-depth test seats correctly, use the complete corrected
lower file and the unchanged upper file.
