package com.gb.flutter_gb_pos_nfc;

import android.device.PiccManager;
import android.util.Log;

import java.io.File;

public class PiccManagerCore {

    public static String checkCard() {
        try {
            PiccManager piccReader = new PiccManager();
            piccReader.open();

            byte CardType[] = new byte[2];
            byte Atq[] = new byte[14];
            char SAK = 1;
            byte sak[] = new byte[1];
            sak[0] = (byte) SAK;
            byte SN[] = new byte[10];

            int scanCard  = piccReader.request(CardType, Atq);
            if (scanCard > 0) {
                int SNLen = piccReader.antisel(SN, sak);
                return bytesToHexString(SN, SNLen);
            }
        } catch (Exception e) {
             return null;
        } 

        return null;
    }

    private static String bytesToHexString(byte[] src, int len) {
        StringBuilder stringBuilder = new StringBuilder("");
        if (src == null || src.length <= 0) {
            return null;
        }
        if (len <= 0) {
            return "";
        }
        for (int i = 0; i < len; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }
}
