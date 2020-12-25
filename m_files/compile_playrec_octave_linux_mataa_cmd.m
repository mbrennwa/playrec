function compile_playrec_octave_linux_mataa_cmd(pa_path)

dsound_path = '';
asio_path = '';
sdk_path = '';


% Set defaults
debug = 1;
verbose = 1;
case_insensitive = 0;

use_alsa = 1;
use_asihpi = 0;
use_asio = 0;
use_coreaudio = 0;
use_dsound = 0;
use_jack = 0;
use_oss = 0;
use_wasapi = 0;
use_wdmks = 0;
use_wmme = 0;


disp ('Please select the options required when compiling Playrec for Octave/Linux/MATAA:');
pa_path = get_string_input('PortAudio installation directory', pa_path);
debug   = get_yes_no_input('Use debug mode', debug);
verbose = get_yes_no_input('Use verbose mode', verbose);
case_insensitive = get_yes_no_input('Use case insensitive function names', case_insensitive);

%compile_playrec_func(1,1,1,0,0,1,0,0,0,0,0,0,0,'C:\Programming\matlab\playrec_2_1_0\lib\asiosdk2','','C:\Programming\matlab\playrec_2_1_0\lib\portaudio\portaudio_v19','')
if compile_playrec_func(debug, ...
                        verbose, ...
                        case_insensitive, ...
                        use_alsa, ...
                        use_asihpi, ...
                        use_asio, ...
                        use_coreaudio, ...
                        use_dsound, ...
                        use_jack, ...
                        use_oss, ...
                        use_wasapi, ...
                        use_wdmks, ...
                        use_wmme, ...
                        asio_path, ...
                        dsound_path, ...
                        pa_path, ...
                        sdk_path)

    disp ('Compiling Playrec failed, see the Command Window for more information.');
end

function [ret_val] = get_string_input(msg, default)
if is_octave
    ret_val = input([msg, ' [', default, ']: '], 's');
else
    ret_val = input([msg, ' [', regexprep(default, '(\\|%)', '$1$1'), ']: '], 's');
end

if isempty(ret_val)
    ret_val = default;
end

function [ret_val] = get_yes_no_input(msg, default)
if default
    default_string = 'Y';
else
    default_string = 'N';
end

ret_string = input([msg, ' [', default_string, ']: '], 's');

if isempty(ret_string)
    ret_val = default;
elseif strncmpi(ret_string, 'y', 1)
    ret_val = 1;
else
    ret_val = 0;
end
