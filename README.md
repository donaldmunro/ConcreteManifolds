# ConcreteManifolds
The intention behind this document is to provide an extended and comprehensive example of a smooth manifold for dumbasses 
like me who can't always grok the heavily abstract without a more concrete example, or as the OO framework types would say,
a reification. The extended example is the prototypical/canonical stereographic projection considering the sphere S<sup>2</sup> as a manifold. 
Examples cover deriving the charts, finding the inverses functions between manifolds including deriving an ellipsoid stereographic manifold, 
and tangent spaces including both equivalence classes of curves and derivation based approaches, illustrating proofs of vector space closure
and change of basis of tangent vectors. The examples are based on using the open source [SageMath](https://www.sagemath.org/) Computer Algebra System (CAS)
to create an interactive notebook. Sage is available on most Linux distributions and the web site also has a Windows installer. The notebook has also 
been converted to a Latex/SageTex document which hides most of the Sage specific manipulation and shows just the mathematics for those who aren't interested in
Sage (although you lose the ability to interact with the content including the graphs). Note Sage does have 
[built in Manifold](http://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/differentiable/manifold.html) support, but this document won't be using it
as the intention is to provide examples from first principles. Errors or misunderstandings on my part or also more than likely as I am a computer scientist who 
dabbles in mathematics for Computer Vision, Machine Learning and Neural Networks, therefore any error corrections or suggestions 
for improvements would also be welcome.
