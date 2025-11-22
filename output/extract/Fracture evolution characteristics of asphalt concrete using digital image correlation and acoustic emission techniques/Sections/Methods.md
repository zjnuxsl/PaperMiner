# 2. Materials and methods

# 2.1. Materials preparation

Three asphalts were selected for this study, including $^ { 7 0 \# }$ neat asphalt (NA), SBS modified asphalt (SBS), and high viscosity modified asphalt (HVMA). NA and SBS were sampled from Sinopec Zhenhai Refining and Chemical Company (Zhenhai, China). HVMA was produced by blending the SBS modified asphalt with high viscosity modifier produced from Guolu Gaoke Engineering Technology Institute Co., Ltd. (Beijing, China) with a $6 \%$ concentration (by asphalt weight) and heated at $1 7 5 ~ ^ { \circ } \mathrm { C }$ for $6 0 \ \mathrm { m i n }$ . The basic characteristics of binder materials, following the Standard Test Methods of Bitumen and Bituminous Mixtures for Highway Engineering (JTG E20–2011), are detailed in Table 1. Specifically, the penetration test, conducted at $2 5 ^ { \circ } \mathrm { C }$ , measures the depth a standard needle with a $1 0 0 ~ \mathrm { g }$ weight penetrates the asphalt sample over 5 seconds, with results recorded in $0 . 1 \mathrm { \ m m }$ units. The softening point test, using the Ring-and-Ball method, involves heating the asphalt sample at a controlled rate in a water bath and recording the temperature at which a steel ball sinks through the sample and touches the bottom plate. The ductility test, performed at $5 ^ { \circ } \mathrm { C }$ , measures the elongation length of the asphalt sample stretched at a rate of $5 \mathrm { { c m / m i n } }$ until it breaks, with results recorded in centimeters.

The dense gradation of asphalt mixture with a nominal maximum aggregate size of $1 3 ~ \mathrm { m m }$ was utilized with an asphalt content of $4 . 9 \%$ . The aggregate gradation curve was determined from the Marshall method and depicted in Fig. 1. Asphalt mixtures slabs measuring $3 0 0 { \times } 3 0 0 { \times } 5 0 ~ \mathrm { m m }$ was prepared using a roller compactor. Beam specimens, cut from these slabs, were $1 3 5 \mathrm { m m }$ in length, $3 5 \mathrm { m m }$ in width, and $5 0 \ \mathrm { m m }$ in height for fracture tests. Each specimen featured a pre-cut notch with dimensions of2mm in width and $1 0 \ \mathrm { m m }$ in depth located at the bottom of mid-span.

# 2.2. Experimental setup

Three-point bending tests were conducted synchronously using AE and DIC on a servo-hydraulic universal testing machine (UTM-30). Speckle pattern for DIC test and layout of sensors for AE test were illustrated in Fig. 2. Prior to testing, the specimens were maintained at $_ { 0 ^ { \circ } \mathrm { C } }$ for $^ { 2 \mathrm { ~ h ~ } }$ to ensure stable temperature conditions. Then the tests were carried out at a loading rate of $3 \mathrm { m m / m i n }$ . For each experimental condition, three replicates were conducted, and a representative outcome was selected for detailed analysis.

MISTRAS’s Micro II Express 8 AE-system was used in the study. The selected AE sensor model, R3a, has a frequency range of $2 0 \mathrm { k H z }$ to $1 8 0 ~ \mathrm { k H z }$ . A preamplifier gain of $4 0 \mathrm { d B }$ was configured, and a fixed threshold value of 33 dB was set. For data collection, a total of six AE sensors were affixed to the surface of the asphalt concrete specimens with coupling agent and secured with electrical tape.

During the three-point bending tests, the DIC system utilized two high-precision cameras to sequentially capture frames. These cameras featured with notable specifications, including a 50-megapixel resolution, less than 0.01 pixels sub-pixel displacement measurement accuracy, and swift 75fps frame rate, ensured high-quality data capture. A consistent data acquisition rate of 10 frames per second was maintained. The lighting system, consisting of two blue lights, was adjusted to suit the morphology and dimension of each test specimen. To ensure the accuracy of deformation measurement and analysis, the specimens were prepped with artificial speckle pattern. This involved applying a thin coat of matte white paint, followed by random black speckles, creating a randomized speckle pattern on the specimen’s surface. The testing commenced with the simultaneous activation of the loading system, image acquisition system, and AE acquisition system. These systems collaboratively executed measurements of full-field displacements, displacement rates, strains, strain rates, and AE signals of the asphalt concrete on the specimen’s surface until complete fracture and failure was reached.

Table1 Basic properties of asphalt binders.   

<table><tr><td>Materials</td><td>Penetration,0.1 mm</td><td>Softening point,C</td><td>Ductility, cm</td></tr><tr><td>NA</td><td>68.2</td><td>50.4</td><td>一</td></tr><tr><td>SBS</td><td>57.7</td><td>77.0</td><td>33.5</td></tr><tr><td>HVMA</td><td>48.3</td><td>108.4</td><td>37.9</td></tr></table>

![](../Figure/image_1.jpg)  
Fig. 1. Aggregate gradation curve of AC-13.

# 2.3. Crack tip opening displacement

CTOD is a parameter in fracture mechanics that measures the opening displacement of a defect at the crack front during the loading of test specimens or structures [37], as shown in Fig. 3. It is a critical indicator of crack driving forces and is widely used in the field of civil engineering. CTOD at a specified distance from the crack tip has been proven to be one of the most suitable indicators for simulating stable crack extension and instability during the fracture process [38–41]. Therefore, CTOD can be utilized to identify the stages of damage and cracking in asphalt concrete [37].

# 2.4. Fracture process zone

In fracture mechanics, FPZ is a plastic region situated at the tip of material cracks, as shown in Fig. 3. It forms as the local stress near the pre-crack tip gradually approaches and surpasses the material’s tensile strength. According to Wu et al. [42], the FPZ is identified as the region where strain exceeds a certain threshold. As the load nears its peak, the FPZ fully develops, and the crack opening displacement at the notch tip reaches a critical value, $w _ { c }$ , forming a traction-free crack (i.e., a cohesive-less crack) above the notch. After the peak, a TFZ forms at the notch tip, with the traction-free crack extending and the FPZ developing upwards while maintaining a constant length. As the macroscopic crack forms and propagates, the flexural strength decreases.

# 2.5. Correlation dimension

Concrete fracture failure represents a non-linear and continuous progression, evolving from microcracks to macrocracks, shifting from random damage to concentrated damage, and transitioning from a disordered to an ordered state. The correlation dimension analysis of AE signals effectively captures this evolutionary process, providing insights into the changes in the material’s internal structural behavior [43]. In this study, the correlation dimension $D$ is defined by Eq. (1), according to the Grassberger-Procaccia (G-P) algorithm.

![](../Figure/image_2.jpg)  
Fig. 2. Schematic diagram of AE sensors position and speckle area (unit: mm).

![](../Figure/image_3.jpg)  
Fig. 3. Schematic diagram of CTOD.

$$
D = \operatorname* { l i m } _ { m \to \infty } d ( m )
$$

where $d ( m )$ represents the estimated correlation exponent or scaling exponent for a given embedding dimension $m$ .

The correlation dimension, calculated using the G-P algorithm, could provide comprehensive insights into the health of concrete structures due to its sensitivity, robustness, and other advantages. Specifically, its sensitivity to changes in system dynamics allows for the early detection of critical damage during the deterioration of concrete structures. This sensitivity is particularly effective in capturing the nonlinear complexities of concrete damage processes, where traditional linear methods fall short. Additionally, the algorithm’s robustness to noise ensures reliable analysis in monitoring environments with typical data imperfections. Importantly, the correlation dimension offers a quantitative method for assessing structural complexity, facilitating objective evaluations of damage severity.

# 2.6. AE $^ { b }$ -value

Originally derived from seismology, AE b-value is an important metric for discerning transitions in material damage states within fracture mechanics. In fact, the AE b-value analysis is an application of catastrophe theory principles in the field of material damage assessment. Catastrophe theory is a mathematical framework used to model and explain sudden changes or discontinuities in the behavior of complex systems, provides a way to understand how small, continuous changes in input parameters can lead to abrupt, dramatic shifts in a system ’s output or state. Consequently, b-value typically exhibits systematic variations across various phases of the failure process, making it a valuable tool for evaluating the extent of material damage. Specifically, b-value serves as a key indicator of the relationship between the magnitude and the tot al number of AE events within a given region and time interval. The cumulative relationship between the frequency and the magnitude of AE signals can be quantified using the empirical formula proposed by Gutenberg and Richter:

$$
\log N = a - b M
$$

where $M$ is the magnitude, $N$ represents the number of earthquakes within the range from $M$ to $M \mathrm { + } \Delta M$ , and $a$ and $^ { b }$ are constants. The bvalue represents the ratio of small-magnitude events to large-magnitude earthquake events, while the a-value measures the regional seismic activity level. In the calculation of the AE b-value, $M$ is often converted using the amplitude $A _ { d B }$ , as shown in Eq. (3):

$$
M = \frac { A _ { d B } } { 2 0 }
$$

The b-value in this research was determined using Maximum Likelihood Estimation (MLE), an effective statistical method in AE studies for accurately estimating the b-value, crucial for analyzing the relationship between the magnitude and frequency of AE events [44].
