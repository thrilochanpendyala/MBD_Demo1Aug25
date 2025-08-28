% Create a new Simulink model
model = 'myModel';
new_system(model);
open_system(model);

% Add a Subsystem block
add_block('simulink/Ports & Subsystems/Subsystem', [model '/MySubsystem']);

% Add blocks inside the subsystem
add_block('simulink/Commonly Used Blocks/Constant', [model '/MySubsystem/Constant']);
add_block('simulink/Commonly Used Blocks/Gain', [model '/MySubsystem/Gain']);
add_block('simulink/Commonly Used Blocks/Out1', [model '/MySubsystem/Out1']);

% Connect the blocks
add_line([model '/MySubsystem'], 'Constant/1', 'Gain/1');
add_line([model '/MySubsystem'], 'Gain/1', 'Out1/1');

% Save and close the model
save_system(model);
close_system(model);