# Queue Server Reference Implementation

Reference implementation for the ParadiseSS13 Queue Server.

This is the queuing component of my general BYOND gatekeeper/bouncer instance, running at ParadiseSS13.
This component has been outsourced to allow downstreams to utilise it and ensure license compliance.
This release itself is very stripped down and contains just the queue server component.

## Important

This release does **NOT** function out of the box due to being very architecture dependant.
You will have to edit `code/overrides.dm` and put in the necessary code required for your codebase and infrastructure.
