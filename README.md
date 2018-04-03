# APSort
Spike-Sorting by Spectral Analysis of Single Action Potentials

Electrical activities that originate from the nervous system contain information
that can be characterized at several levels. Spike bursts and firing rate of spikes
are analyzed for information content. These entities can be characterized by the
frequency content. An action potential also has a frequency content that can be
characterized by its spectral density.

Many methods for detecting and classifying action potentials have been developed.
Detection generally uses threshold-crossing to detect action potential and the
refractory period is used to detect overlaps. The general method of cluster-cutting,
where correlations of various attributes of a spike train are plotted, is used in
classifying spikes; this includes the use of shape attributes, such as amplitude and
width, of an action potential.

Although the information content of an action potential is generally considered to be low,
it does provide information on the morphology of the neuron. The shape of an action potential
is determined by the properties of the neuron and, in turn, the shape can be decomposed into
its frequency content which is characteristic of the neuron. In this project, the frequency
content of individual action potentials from simulated multi-unit spike trains is computed;
this information is analyzed to sort the spikes.
