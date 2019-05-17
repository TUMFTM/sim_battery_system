# sim_battery_system

A simulation framework for lithium-ion battery systems.

Developed at the **[Institute of Automotive Technology](https://www.ftm.mw.tum.de/en/home/)**, **[Technical University of Munich](https://www.tum.de/nc/en/)**.

**Contact:** [Christoph Reiter](mailto:christoph.reiter@tum.de)

* * *


## Introduction

This is a model for the simulation of lithium-ion battery systems of any number of serial and parallel cells. Everything is set up using parameters, so no changes of the model itself are necessary to adapt to different system architectures.

Further information about the modelling approach and the validation of the model can be found in the following publication:

*Reiter Et al.: A Holistic Approach for Simulation and Evaluation of Electrical and Thermal Loads in Lith-ium-Ion Battery Systems. In: 2019 Fourteenth International Conference on Ecological Vehicles and Re-newable Energies (EVER). Monaco. IEEE. 2019. Forthcoming.* 

(DOI and Link follow as soon as the paper is published.)

* * *


## Features

These are the currently planned features of the simulation framework:

- [x] **Electric cell simulation** using an ECM from 0 to 4 RC elements
- [x] **State dependent ECM parameters** influenced by SOC, temperature and current rate of the cell
- [x] **Battery system simulation** of any desired number of **cells connected in parallel or serial**
- [x] Individual respresentation of cells inside the battery system --> **Monitor individual cell behavior** inside a battery pack
- [x] Simulate **passive balancing** of cells connected in serial.
- [x] Automatic assignment of statistical **parameter deviations** to all cells inside the battery system
- [ ] Assign **individual parameter sets** to cells
- [x] Simulation of **irreversible and reversible cell heat dissipation**
- [x] Simulation of **thermal cell state** using a lumped mass approach
- [x] **Heat dissipation simulation** from cell to its environment
- [ ] Simulation of **heat fluxes between cells** inside the battery system
- [ ] Simulating the behavior of **temperature sensors** placed in the battery system
- [x] Automated **logging, plotting and saving** of simulation results
- [ ] In-depth **analysis of cell load** using load spectrum analysis

All the things listed here that are not included as of now will be made available as soon as they are thoroughly tested and streamlined.


## Use and Expansion of the Framework

We are very happy is you choose this framework for your projects and research! We are looking forward to hear your feedback and kindly ask you to share bugfixes, improvements and updates in this repository.

**Please cite the paper above if you use the framework for your publications!**

The model is released under the GNU LESSER GENERAL PUBLIC LICENSE Version 3 (29 June 2007). Please refer to the license file for any further questions about incorporating this framework into your projects.

* * *


## Requirements

The model was created with **MATLAB 2018b**. If you want to commit an updated version using another toolbox please give us a short heads-up. 

Required Toolboxes:
- Simulink 9.2
- DSP Systems Toolbox 9.7
- Simulink Coder 9.0

The insitute usually follows the 'b' releases of Mathworks, so the framework may get updated to 2019b in the future.

* * *


## How To Use

The framework in this repository is provided with sample data and should run 'out of the box'. 

### Basic steps

Use the following steps to start the simulation:
- Set *simulation_framework\\* as MATLAB's current folder
- Open `sim_battery_system.prj` --> This adds all relevant paths and checks if all files are where they have to be.
- Run `main_sim_battery_system.m` --> The simulation starts.

### How to adapt the framework to your battery system

1. Provide the cell data in *parameters\\*
   - Examples are given in `cell_parameters_NCR18650PF_2RC.m` and `cell_parameters_NCR18650PF_4RC.m`
   - Provide a lookup-table for your cell's open circuit voltate
   - Decide how many RC-elements you want to have (currently: 0-4), set unneeded ones to false and provide dummy data for those.
   - Provide the dynamic ECM parameters depending on temperature, SOC and current rate. You need at least two breakpoints for each value. If you don't want a dependency modelled use two arbitrary breakpoints, e.g. 25 °C and 25.01°C. The model doesn't extrapolate to the value will be treated as static.
   - If needed: Provide the thermal cell parameters.
   - If needed: Provide the standard deviations for all cell parameters. No deviation for a parameter? Set the value to 0.
2. Set up the system parameters in *parameters\\*
   - Sample Data is provided in `system_parameters.m`
   - Set up the number of cells connected in serial and parallel.
   - Set up the system's initial state. At least the SOC is needed and - if in consideration the cells temperatures. This must be set for every individual cell!
   - Set up the parameters for passive balancing  (or disable cell balancing).
   - Enable or dissable the thermal simulation and provide the ambient temperatures around each cell. The sample implementation used static ambient temperatures, the model also accepts dynamic imputs. The latter must be provided in the Simulink model.
3. Provide the load cycle in *load_cycles\\*
   - The variable must be named load_cycle
   - The structure is composed of colummn vectors **`[time [s], voltage [V], current [A]]`**
   - The voltage is just for comparison purposes, only the current is used as simulation input
   - The example implementation uses load data from a single cell and scales that depending on the number of serial and parallel cells. Of course you can directly provide data for your system. In this case edit the scaling in `main_sim_battery_system.m`
4. Select the things that are logged in the Simulink model `sim_battery_system.slx`
   - Go to the block *Monitoring and Logging* and comment in all signals you need
5. Set up the simulation in `main_sim_battery_system.m`
   - Choose the cell and system parameters and the load cycle
   - Choose the simulation step-size and the max. simulation time
   - Choose if you want plot or save the results
6. Start the simulation
   - If you chose to save your plots and/or simulation results you can find those file in the folder *simulation_results\\* after the simulation

* * *


## Authors and Maintainers

- [Christoph Reiter](mailto:christoph.reiter@tum.de)
  - Idea, structure, underlying concepts and algorithms except where noted otherwise.
  - Research of the theoretical background.
  - Supervision of the contributing student's thesises.
  - Final revision and benchmarking.
- [Leo Wildfeuer](wildfeuer@ftm.mw.tum.de)
  - Cell measurements and parameter fitting of the 4 RC ECM.

* * *


## Contributions

The authors want to thank the following persons, who, whith their brilliant contributions made the framework possible.
  
- [Johannes Dirnecker](mailto:johannes.dirnecker@gmx.net)
  - Initial implementation in Simulink and MATLAB and development of the matrix-based parallel circuit simulation as part of his term project.
- André Thomaser
  - Initial implementation of the submodel simulating heat fluxes between cells as part of his bachelor's thesis.
- Thilo Krahl
  - Initial implementation and development of the submodel for load spectrum analysis as part of his master's thesis.
- [Sebastian Huber](mailto:sebastian-huber@tum.de)
  - Initial implementation of the submodel for the simulation of temperature sensors as part of his term project.
- Thilo Wurster
  - Initial implementation of the method for assigning individual parameter sets to the cells as part of his master's thesis.
- Michael Baumann
  - Providing advice for cell modelling and cell measurements and parameter fitting of the 2 RC ECM.
  - Being an awesome colleague and office mate at the insitute. 