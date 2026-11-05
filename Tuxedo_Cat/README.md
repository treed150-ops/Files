# Tuxedo Cat Book

Black cat with a white muzzle, chest bib, and white eye details around black slit pupils.
The original uploaded mesh supplies the body, tail, circular opening, tail hole, face relief, pointed ears, flat base, and scale. The beagle floppy-ear replacement is not present in this version. A shallow white bib is the only added outer geometry; color divisions do not change the rest of the mesh.

## Files and Bambu Studio

- `Tuxedo_Cat_Book.3mf`: portable assembly with black and white material parts. Open/import this model and assign black filament to `Tuxedo_Cat_Black` and white filament to `Tuxedo_Cat_White`. Core 3MF material colors are included, but Bambu Studio may require manual filament assignments. This is a model assembly, not a tested Bambu printer profile.
- `Tuxedo_Cat_Black.stl` and `Tuxedo_Cat_White.stl`: fallback for two-color printing. Select BOTH files together when importing and choose to load as one object with multiple parts. Keep their original relative coordinates; do not place each part independently on the bed. Assign each part its matching filament. The white material contains five closed islands (muzzle/bib and eye details), supported and surrounded by the black part during printing.
- `Tuxedo_Cat_Book.stl`: complete single-solid version for painting or single-color printing. STL contains no color assignments.
- `Tuxedo_Cat_Preview.png`: preview rendered from the actual black and white output meshes.
- `validation.json`: measured mesh validation results.

Dimensions: **94.624 × 59.178 × 13.600 mm**, identical to the original upload. Import in millimeters, maintain Z=0 flat on the build plate, and retain 100% scale. The new bib is 0.4 mm above the original 12.4 mm body surface, below the existing 13.6 mm maximum height. Black pupil widths are 0.64 mm; white eye patches are 2.7 mm across. Use a layer preview to inspect these details with a 0.4 mm nozzle.

## Validation

The exported combined STL is one watertight, consistently wound solid with positive volume. Reloaded black and white STLs and their serialized 3MF meshes are watertight and consistently wound; Manifold3D accepts each exported STL with NoError. Black and white parts meet without volumetric overlap, and their union reconstructs the complete model. No original volume was removed. Both openings remain open at Z=0.1, 6, and 12 mm. The largest measured section-boundary difference is under 0.001 mm near the bottom chamfer; mid and top sections agree to numerical precision. Original and final Euler characteristic: -2.

Bambu Studio slicing and a physical print have not been performed. The model includes no printer-specific slicing settings, supports, purge tower, or filament configuration.
