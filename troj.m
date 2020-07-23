function troj(in)
%% Initialize toolbox TROJ
%
%   Toolbox TROJ was initialized.
%   Authors: Trautenberger, Oravec.
%   The latest update 2020-07-23

if( isempty( in ) )
    in = 'init'; % Default setup: initialize toolbox troj
end
    
if( isequal( in, 'init' ) )
    %% Initialize toolbox
    ops = get_ops; % call ops
    self_ops
    disp(' Toolbox TROJ was initialized.')
    disp(' Authors: Trautenberger, Oravec.')   
    disp(sprintf(' Preset language: %s',ops.language ))
    disp(sprintf(' Tollbox version: %d',ops.version ))

elseif( isequal( in, 'update' ) )
    %% Update
    disp(' TROJ: running updates. Internet connection is necessary.')
    update_table_of_elements % download table of elements using Internet
    table_of_elements = get_table_of_elements; % call table of elements
    disp(' TROJ: Update termined.')

elseif( isequal( in, 'reset' ) )
    %% Reset
    disp(' TROJ: Reset is not supported, yet.')

else
    %% Unexpected input
    disp(sprintf(' TROJ: Unexpected input ''%s''! ',in ))
end % if

end % function