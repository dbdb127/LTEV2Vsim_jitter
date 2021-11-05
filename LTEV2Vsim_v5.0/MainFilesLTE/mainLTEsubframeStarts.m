function [sinrManagement,stationManagement,timeManagement] = ...
            mainLTEsubframeStarts(appParams,phyParams,timeManagement,sinrManagement,stationManagement,simParams,simValues)
% an LTE subframe starts
        
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

% Compute the number of elapsed subframes (i.e., phyParams.Tsf)
timeManagement.elapsedTime_subframes = floor((timeManagement.timeNow+1e-9)/phyParams.Tsf) + 1;

% BR adopted in the time domain (i.e., TTI)
BRidT = ceil((stationManagement.BRid)/appParams.NbeaconsF);
BRidT(stationManagement.BRid<=0)=-1;

% Find IDs of vehicles that are currently transmitting
stationManagement.transmittingIDsLTE = find(BRidT == (mod((timeManagement.elapsedTime_subframes-1),appParams.NbeaconsT)+1));

% RSU일 경우 진짜 transmit할 때가 맞는지 확인(전송 주기가 다름)
% 만일 transmit 시간이 아니라면 packet이 generate 안됨
txOK = find((timeManagement.timeNow - timeManagement.timeLastPacket(stationManagement.transmittingIDsLTE)) < 0.1);
stationManagement.transmittingIDsLTE = stationManagement.transmittingIDsLTE(txOK);

if ~isempty(stationManagement.transmittingIDsLTE)     
    % Find index of vehicles that are currently transmitting
    stationManagement.indexInActiveIDsOnlyLTE_OfTxLTE = zeros(length(stationManagement.transmittingIDsLTE),1);
    stationManagement.indexInActiveIDs_OfTxLTE = zeros(length(stationManagement.transmittingIDsLTE),1);
    for ix = 1:length(stationManagement.transmittingIDsLTE)
        %A = find(stationManagement.activeIDsLTE == stationManagement.transmittingIDsLTE(ix));
        %if length(A)~=1
        %    error('X');
        %end
        stationManagement.indexInActiveIDsOnlyLTE_OfTxLTE(ix) = find(stationManagement.activeIDsLTE == stationManagement.transmittingIDsLTE(ix));
        stationManagement.indexInActiveIDs_OfTxLTE(ix) = find(stationManagement.activeIDs == stationManagement.transmittingIDsLTE(ix));
    end
end

% 새로운 subframe이 시작하므로 renew RSU reservation
if rem(timeManagement.elapsedTime_subframes,appParams.NbeaconsT)==1
    for i = 1:appParams.Nbeacons
        stationManagement.RSUreservation(:, i, :) = circshift(stationManagement.RSUreservation(:, i, :),10);
    end
end
stationManagement.RSUreservation(11, :, :) = 0;

% Initialization of the received power
[sinrManagement] = initLastPowerLTE(timeManagement,stationManagement,sinrManagement,simParams,appParams,phyParams);
    