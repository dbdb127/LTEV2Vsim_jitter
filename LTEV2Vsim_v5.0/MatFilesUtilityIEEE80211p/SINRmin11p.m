function gammaMin_dB = SINRmin11p(Mode)
% IEEE 802.11p: find minimum SINR which depends on the operating Mode
% Starting from version 5.0.11, the Modes are numbered from 0 to 7

% ==============
% Copyright (C) Alessandro Bazzi, University of Bologna, and Alberto Zanella, CNR
% 
% All rights reserved.
% 
% Permission to use, copy, modify, and distribute this software for any 
% purpose without fee is hereby granted, provided that this entire notice 
% is included in all copies of any software which is or includes a copy or 
% modification of this software and in all copies of the supporting 
% documentation for such software.
% 
% THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED 
% WARRANTY. IN PARTICULAR, NEITHER OF THE AUTHORS MAKES ANY REPRESENTATION 
% OR WARRANTY OF ANY KIND CONCERNING THE MERCHANTABILITY OF THIS SOFTWARE 
% OR ITS FITNESS FOR ANY PARTICULAR PURPOSE.
% 
% Project: LTEV2Vsim
% ==============

% OLD THRESHOLDS
% Values are derived from IEEE 802.11-2007, section 17.3.10.1
% if Mode==0
%     gammaMin_dB = 10;
% elseif Mode==1
%     gammaMin_dB = 11;
% elseif Mode==2
%     gammaMin_dB = 13;
% elseif Mode==3
%     gammaMin_dB = 15;
% elseif Mode==4
%     gammaMin_dB = 18;
% elseif Mode==5
%     gammaMin_dB = 22;
% elseif Mode==6
%     gammaMin_dB = 26;
% elseif Mode==7
%     gammaMin_dB = 27;
% end

% NEW THRESHOLDS 
% FROM U-BLOX
if Mode==0
    gammaMin_dB = 4.1;
elseif Mode==1
    gammaMin_dB = 5.6;
elseif Mode==2
    gammaMin_dB = 6.5;
elseif Mode==3
    gammaMin_dB = 9.0;
elseif Mode==4
    gammaMin_dB = 11.7;
elseif Mode==5
    gammaMin_dB = 15.5;
elseif Mode==6
    gammaMin_dB = 19.9;
elseif Mode==7
    gammaMin_dB = 22.0;
end


end
