PROGRAM PRG_AlarmHandler
VAR
    aAlarms      : ARRAY[1..64] OF ST_Alarm;
    nActiveCount : INT;
    fbAckTimer   : TON;
END_VAR

// ---- fastUpdate BEGIN (do not modify) ----
FOR i := 1 TO 64 DO
    aAlarms[i].bActive := GVL_IO.abAlarmInputs[i];
END_FOR
// ---- fastUpdate END ----

// Latching, acknowledge and horn logic follows (about 580 lines).
