function compile_playrec_octave_linux_mataa

% Make sure we can see external m files, even if this file is not in the
% current working directory but on the path somewhere
mfilepath = mfilename('fullpath');
mfilepath = mfilepath(1:end-length(mfilename));

addpath([mfilepath,'m_files'])

if ~is_os('UNIX')
	error('This function is meant to run on Linux/UNIX only.')
end

if ~is_octave
	error('This function is meant to run on GNU Octave only.')
end


pa_path = find_folder(mfilepath, '.*portaudio.*', {'src/common', ...
                                                 'src/hostapi', ...
                                                 'src/os', ...
                                                 'include' ...
                                                }, 5);

compile_playrec_octave_linux_mataa_cmd(pa_path);
