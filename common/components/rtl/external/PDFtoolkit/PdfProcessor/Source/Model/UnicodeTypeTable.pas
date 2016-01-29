unit UnicodeTypeTable;

interface

uses
  gtTypes;

type

  UnicodeCaseTableVector = record
    Codes: array[0..255] of TgtUnicode;
  end;

const
  CaseTable00: UnicodeCaseTableVector =
  (Codes:
    (
    $0000, $0001, $0002, $0003, $0004, $0005, $0006, $0007,
    $0008, $0009, $000A, $000B, $000C, $000D, $000E, $000F,
    $0010, $0011, $0012, $0013, $0014, $0015, $0016, $0017,
    $0018, $0019, $001A, $001B, $001C, $001D, $001E, $001F,
    $0020, $0021, $0022, $0023, $0024, $0025, $0026, $0027,
    $0028, $0029, $002A, $002B, $002C, $002D, $002E, $002F,
    $0030, $0031, $0032, $0033, $0034, $0035, $0036, $0037,
    $0038, $0039, $003A, $003B, $003C, $003D, $003E, $003F,
    $0040, $0061, $0062, $0063, $0064, $0065, $0066, $0067,
    $0068, $0069, $006A, $006B, $006C, $006D, $006E, $006F,
    $0070, $0071, $0072, $0073, $0074, $0075, $0076, $0077,
    $0078, $0079, $007A, $005B, $005C, $005D, $005E, $005F,
    $0060, $0061, $0062, $0063, $0064, $0065, $0066, $0067,
    $0068, $0069, $006A, $006B, $006C, $006D, $006E, $006F,
    $0070, $0071, $0072, $0073, $0074, $0075, $0076, $0077,
    $0078, $0079, $007A, $007B, $007C, $007D, $007E, $007F,
    $0080, $0081, $0082, $0083, $0084, $0085, $0086, $0087,
    $0088, $0089, $008A, $008B, $008C, $008D, $008E, $008F,
    $0090, $0091, $0092, $0093, $0094, $0095, $0096, $0097,
    $0098, $0099, $009A, $009B, $009C, $009D, $009E, $009F,
    $00A0, $00A1, $00A2, $00A3, $00A4, $00A5, $00A6, $00A7,
    $00A8, $00A9, $00AA, $00AB, $00AC, $00AD, $00AE, $00AF,
    $00B0, $00B1, $00B2, $00B3, $00B4, $03BC, $00B6, $00B7,
    $00B8, $00B9, $00BA, $00BB, $00BC, $00BD, $00BE, $00BF,
    $00E0, $00E1, $00E2, $00E3, $00E4, $00E5, $00E6, $00E7,
    $00E8, $00E9, $00EA, $00EB, $00EC, $00ED, $00EE, $00EF,
    $00F0, $00F1, $00F2, $00F3, $00F4, $00F5, $00F6, $00D7,
    $00F8, $00F9, $00FA, $00FB, $00FC, $00FD, $00FE, $00DF,
    $00E0, $00E1, $00E2, $00E3, $00E4, $00E5, $00E6, $00E7,
    $00E8, $00E9, $00EA, $00EB, $00EC, $00ED, $00EE, $00EF,
    $00F0, $00F1, $00F2, $00F3, $00F4, $00F5, $00F6, $00F7,
    $00F8, $00F9, $00FA, $00FB, $00FC, $00FD, $00FE, $00FF
    )
    );

  CaseTable01: UnicodeCaseTableVector =
  (Codes:
    (
    $0101, $0101, $0103, $0103, $0105, $0105, $0107, $0107,
    $0109, $0109, $010B, $010B, $010D, $010D, $010F, $010F,
    $0111, $0111, $0113, $0113, $0115, $0115, $0117, $0117,
    $0119, $0119, $011B, $011B, $011D, $011D, $011F, $011F,
    $0121, $0121, $0123, $0123, $0125, $0125, $0127, $0127,
    $0129, $0129, $012B, $012B, $012D, $012D, $012F, $012F,
    $0130, $0131, $0133, $0133, $0135, $0135, $0137, $0137,
    $0138, $013A, $013A, $013C, $013C, $013E, $013E, $0140,
    $0140, $0142, $0142, $0144, $0144, $0146, $0146, $0148,
    $0148, $0149, $014B, $014B, $014D, $014D, $014F, $014F,
    $0151, $0151, $0153, $0153, $0155, $0155, $0157, $0157,
    $0159, $0159, $015B, $015B, $015D, $015D, $015F, $015F,
    $0161, $0161, $0163, $0163, $0165, $0165, $0167, $0167,
    $0169, $0169, $016B, $016B, $016D, $016D, $016F, $016F,
    $0171, $0171, $0173, $0173, $0175, $0175, $0177, $0177,
    $00FF, $017A, $017A, $017C, $017C, $017E, $017E, $0073,
    $0180, $0253, $0183, $0183, $0185, $0185, $0254, $0188,
    $0188, $0256, $0257, $018C, $018C, $018D, $01DD, $0259,
    $025B, $0192, $0192, $0260, $0263, $0195, $0269, $0268,
    $0199, $0199, $019A, $019B, $026F, $0272, $019E, $0275,
    $01A1, $01A1, $01A3, $01A3, $01A5, $01A5, $0280, $01A8,
    $01A8, $0283, $01AA, $01AB, $01AD, $01AD, $0288, $01B0,
    $01B0, $028A, $028B, $01B4, $01B4, $01B6, $01B6, $0292,
    $01B9, $01B9, $01BA, $01BB, $01BD, $01BD, $01BE, $01BF,
    $01C0, $01C1, $01C2, $01C3, $01C6, $01C6, $01C6, $01C9,
    $01C9, $01C9, $01CC, $01CC, $01CC, $01CE, $01CE, $01D0,
    $01D0, $01D2, $01D2, $01D4, $01D4, $01D6, $01D6, $01D8,
    $01D8, $01DA, $01DA, $01DC, $01DC, $01DD, $01DF, $01DF,
    $01E1, $01E1, $01E3, $01E3, $01E5, $01E5, $01E7, $01E7,
    $01E9, $01E9, $01EB, $01EB, $01ED, $01ED, $01EF, $01EF,
    $01F0, $01F3, $01F3, $01F3, $01F5, $01F5, $0195, $01BF,
    $01F9, $01F9, $01FB, $01FB, $01FD, $01FD, $01FF, $01FF
    )
    );

  CaseTable02: UnicodeCaseTableVector =
  (Codes:
    (
    $0201, $0201, $0203, $0203, $0205, $0205, $0207, $0207,
    $0209, $0209, $020B, $020B, $020D, $020D, $020F, $020F,
    $0211, $0211, $0213, $0213, $0215, $0215, $0217, $0217,
    $0219, $0219, $021B, $021B, $021D, $021D, $021F, $021F,
    $019E, $0221, $0223, $0223, $0225, $0225, $0227, $0227,
    $0229, $0229, $022B, $022B, $022D, $022D, $022F, $022F,
    $0231, $0231, $0233, $0233, $0234, $0235, $0236, $0237,
    $0238, $0239, $023A, $023B, $023C, $023D, $023E, $023F,
    $0240, $0241, $0242, $0243, $0244, $0245, $0246, $0247,
    $0248, $0249, $024A, $024B, $024C, $024D, $024E, $024F,
    $0250, $0251, $0252, $0253, $0254, $0255, $0256, $0257,
    $0258, $0259, $025A, $025B, $025C, $025D, $025E, $025F,
    $0260, $0261, $0262, $0263, $0264, $0265, $0266, $0267,
    $0268, $0269, $026A, $026B, $026C, $026D, $026E, $026F,
    $0270, $0271, $0272, $0273, $0274, $0275, $0276, $0277,
    $0278, $0279, $027A, $027B, $027C, $027D, $027E, $027F,
    $0280, $0281, $0282, $0283, $0284, $0285, $0286, $0287,
    $0288, $0289, $028A, $028B, $028C, $028D, $028E, $028F,
    $0290, $0291, $0292, $0293, $0294, $0295, $0296, $0297,
    $0298, $0299, $029A, $029B, $029C, $029D, $029E, $029F,
    $02A0, $02A1, $02A2, $02A3, $02A4, $02A5, $02A6, $02A7,
    $02A8, $02A9, $02AA, $02AB, $02AC, $02AD, $02AE, $02AF,
    $02B0, $02B1, $02B2, $02B3, $02B4, $02B5, $02B6, $02B7,
    $02B8, $02B9, $02BA, $02BB, $02BC, $02BD, $02BE, $02BF,
    $02C0, $02C1, $02C2, $02C3, $02C4, $02C5, $02C6, $02C7,
    $02C8, $02C9, $02CA, $02CB, $02CC, $02CD, $02CE, $02CF,
    $02D0, $02D1, $02D2, $02D3, $02D4, $02D5, $02D6, $02D7,
    $02D8, $02D9, $02DA, $02DB, $02DC, $02DD, $02DE, $02DF,
    $02E0, $02E1, $02E2, $02E3, $02E4, $02E5, $02E6, $02E7,
    $02E8, $02E9, $02EA, $02EB, $02EC, $02ED, $02EE, $02EF,
    $02F0, $02F1, $02F2, $02F3, $02F4, $02F5, $02F6, $02F7,
    $02F8, $02F9, $02FA, $02FB, $02FC, $02FD, $02FE, $02FF
    )
    );

  CaseTable03: UnicodeCaseTableVector =
  (Codes:
    (
    $0300, $0301, $0302, $0303, $0304, $0305, $0306, $0307,
    $0308, $0309, $030A, $030B, $030C, $030D, $030E, $030F,
    $0310, $0311, $0312, $0313, $0314, $0315, $0316, $0317,
    $0318, $0319, $031A, $031B, $031C, $031D, $031E, $031F,
    $0320, $0321, $0322, $0323, $0324, $0325, $0326, $0327,
    $0328, $0329, $032A, $032B, $032C, $032D, $032E, $032F,
    $0330, $0331, $0332, $0333, $0334, $0335, $0336, $0337,
    $0338, $0339, $033A, $033B, $033C, $033D, $033E, $033F,
    $0340, $0341, $0342, $0343, $0344, $03B9, $0346, $0347,
    $0348, $0349, $034A, $034B, $034C, $034D, $034E, $034F,
    $0350, $0351, $0352, $0353, $0354, $0355, $0356, $0357,
    $0358, $0359, $035A, $035B, $035C, $035D, $035E, $035F,
    $0360, $0361, $0362, $0363, $0364, $0365, $0366, $0367,
    $0368, $0369, $036A, $036B, $036C, $036D, $036E, $036F,
    $0370, $0371, $0372, $0373, $0374, $0375, $0376, $0377,
    $0378, $0379, $037A, $037B, $037C, $037D, $037E, $037F,
    $0380, $0381, $0382, $0383, $0384, $0385, $03AC, $0387,
    $03AD, $03AE, $03AF, $038B, $03CC, $038D, $03CD, $03CE,
    $0390, $03B1, $03B2, $03B3, $03B4, $03B5, $03B6, $03B7,
    $03B8, $03B9, $03BA, $03BB, $03BC, $03BD, $03BE, $03BF,
    $03C0, $03C1, $03A2, $03C3, $03C4, $03C5, $03C6, $03C7,
    $03C8, $03C9, $03CA, $03CB, $03AC, $03AD, $03AE, $03AF,
    $03B0, $03B1, $03B2, $03B3, $03B4, $03B5, $03B6, $03B7,
    $03B8, $03B9, $03BA, $03BB, $03BC, $03BD, $03BE, $03BF,
    $03C0, $03C1, $03C3, $03C3, $03C4, $03C5, $03C6, $03C7,
    $03C8, $03C9, $03CA, $03CB, $03CC, $03CD, $03CE, $03CF,
    $03B2, $03B8, $03D2, $03D3, $03D4, $03C6, $03C0, $03D7,
    $03D9, $03D9, $03DB, $03DB, $03DD, $03DD, $03DF, $03DF,
    $03E1, $03E1, $03E3, $03E3, $03E5, $03E5, $03E7, $03E7,
    $03E9, $03E9, $03EB, $03EB, $03ED, $03ED, $03EF, $03EF,
    $03BA, $03C1, $03F2, $03F3, $03B8, $03B5, $03F6, $03F8,
    $03F8, $03F2, $03FB, $03FB, $03FC, $03FD, $03FE, $03FF
    )
    );

  CaseTable04: UnicodeCaseTableVector =
  (Codes:
    (
    $0450, $0451, $0452, $0453, $0454, $0455, $0456, $0457,
    $0458, $0459, $045A, $045B, $045C, $045D, $045E, $045F,
    $0430, $0431, $0432, $0433, $0434, $0435, $0436, $0437,
    $0438, $0439, $043A, $043B, $043C, $043D, $043E, $043F,
    $0440, $0441, $0442, $0443, $0444, $0445, $0446, $0447,
    $0448, $0449, $044A, $044B, $044C, $044D, $044E, $044F,
    $0430, $0431, $0432, $0433, $0434, $0435, $0436, $0437,
    $0438, $0439, $043A, $043B, $043C, $043D, $043E, $043F,
    $0440, $0441, $0442, $0443, $0444, $0445, $0446, $0447,
    $0448, $0449, $044A, $044B, $044C, $044D, $044E, $044F,
    $0450, $0451, $0452, $0453, $0454, $0455, $0456, $0457,
    $0458, $0459, $045A, $045B, $045C, $045D, $045E, $045F,
    $0461, $0461, $0463, $0463, $0465, $0465, $0467, $0467,
    $0469, $0469, $046B, $046B, $046D, $046D, $046F, $046F,
    $0471, $0471, $0473, $0473, $0475, $0475, $0477, $0477,
    $0479, $0479, $047B, $047B, $047D, $047D, $047F, $047F,
    $0481, $0481, $0482, $0483, $0484, $0485, $0486, $0487,
    $0488, $0489, $048B, $048B, $048D, $048D, $048F, $048F,
    $0491, $0491, $0493, $0493, $0495, $0495, $0497, $0497,
    $0499, $0499, $049B, $049B, $049D, $049D, $049F, $049F,
    $04A1, $04A1, $04A3, $04A3, $04A5, $04A5, $04A7, $04A7,
    $04A9, $04A9, $04AB, $04AB, $04AD, $04AD, $04AF, $04AF,
    $04B1, $04B1, $04B3, $04B3, $04B5, $04B5, $04B7, $04B7,
    $04B9, $04B9, $04BB, $04BB, $04BD, $04BD, $04BF, $04BF,
    $04C0, $04C2, $04C2, $04C4, $04C4, $04C6, $04C6, $04C8,
    $04C8, $04CA, $04CA, $04CC, $04CC, $04CE, $04CE, $04CF,
    $04D1, $04D1, $04D3, $04D3, $04D5, $04D5, $04D7, $04D7,
    $04D9, $04D9, $04DB, $04DB, $04DD, $04DD, $04DF, $04DF,
    $04E1, $04E1, $04E3, $04E3, $04E5, $04E5, $04E7, $04E7,
    $04E9, $04E9, $04EB, $04EB, $04ED, $04ED, $04EF, $04EF,
    $04F1, $04F1, $04F3, $04F3, $04F5, $04F5, $04F6, $04F7,
    $04F9, $04F9, $04FA, $04FB, $04FC, $04FD, $04FE, $04FF
    )
    );

  CaseTable05: UnicodeCaseTableVector =
  (Codes:
    (
    $0501, $0501, $0503, $0503, $0505, $0505, $0507, $0507,
    $0509, $0509, $050B, $050B, $050D, $050D, $050F, $050F,
    $0510, $0511, $0512, $0513, $0514, $0515, $0516, $0517,
    $0518, $0519, $051A, $051B, $051C, $051D, $051E, $051F,
    $0520, $0521, $0522, $0523, $0524, $0525, $0526, $0527,
    $0528, $0529, $052A, $052B, $052C, $052D, $052E, $052F,
    $0530, $0561, $0562, $0563, $0564, $0565, $0566, $0567,
    $0568, $0569, $056A, $056B, $056C, $056D, $056E, $056F,
    $0570, $0571, $0572, $0573, $0574, $0575, $0576, $0577,
    $0578, $0579, $057A, $057B, $057C, $057D, $057E, $057F,
    $0580, $0581, $0582, $0583, $0584, $0585, $0586, $0557,
    $0558, $0559, $055A, $055B, $055C, $055D, $055E, $055F,
    $0560, $0561, $0562, $0563, $0564, $0565, $0566, $0567,
    $0568, $0569, $056A, $056B, $056C, $056D, $056E, $056F,
    $0570, $0571, $0572, $0573, $0574, $0575, $0576, $0577,
    $0578, $0579, $057A, $057B, $057C, $057D, $057E, $057F,
    $0580, $0581, $0582, $0583, $0584, $0585, $0586, $0587,
    $0588, $0589, $058A, $058B, $058C, $058D, $058E, $058F,
    $0590, $0591, $0592, $0593, $0594, $0595, $0596, $0597,
    $0598, $0599, $059A, $059B, $059C, $059D, $059E, $059F,
    $05A0, $05A1, $05A2, $05A3, $05A4, $05A5, $05A6, $05A7,
    $05A8, $05A9, $05AA, $05AB, $05AC, $05AD, $05AE, $05AF,
    $05B0, $05B1, $05B2, $05B3, $05B4, $05B5, $05B6, $05B7,
    $05B8, $05B9, $05BA, $05BB, $05BC, $05BD, $05BE, $05BF,
    $05C0, $05C1, $05C2, $05C3, $05C4, $05C5, $05C6, $05C7,
    $05C8, $05C9, $05CA, $05CB, $05CC, $05CD, $05CE, $05CF,
    $05D0, $05D1, $05D2, $05D3, $05D4, $05D5, $05D6, $05D7,
    $05D8, $05D9, $05DA, $05DB, $05DC, $05DD, $05DE, $05DF,
    $05E0, $05E1, $05E2, $05E3, $05E4, $05E5, $05E6, $05E7,
    $05E8, $05E9, $05EA, $05EB, $05EC, $05ED, $05EE, $05EF,
    $05F0, $05F1, $05F2, $05F3, $05F4, $05F5, $05F6, $05F7,
    $05F8, $05F9, $05FA, $05FB, $05FC, $05FD, $05FE, $05FF
    )
    );

  CaseTable1e: UnicodeCaseTableVector =
  (Codes:
    (
    $1E01, $1E01, $1E03, $1E03, $1E05, $1E05, $1E07, $1E07,
    $1E09, $1E09, $1E0B, $1E0B, $1E0D, $1E0D, $1E0F, $1E0F,
    $1E11, $1E11, $1E13, $1E13, $1E15, $1E15, $1E17, $1E17,
    $1E19, $1E19, $1E1B, $1E1B, $1E1D, $1E1D, $1E1F, $1E1F,
    $1E21, $1E21, $1E23, $1E23, $1E25, $1E25, $1E27, $1E27,
    $1E29, $1E29, $1E2B, $1E2B, $1E2D, $1E2D, $1E2F, $1E2F,
    $1E31, $1E31, $1E33, $1E33, $1E35, $1E35, $1E37, $1E37,
    $1E39, $1E39, $1E3B, $1E3B, $1E3D, $1E3D, $1E3F, $1E3F,
    $1E41, $1E41, $1E43, $1E43, $1E45, $1E45, $1E47, $1E47,
    $1E49, $1E49, $1E4B, $1E4B, $1E4D, $1E4D, $1E4F, $1E4F,
    $1E51, $1E51, $1E53, $1E53, $1E55, $1E55, $1E57, $1E57,
    $1E59, $1E59, $1E5B, $1E5B, $1E5D, $1E5D, $1E5F, $1E5F,
    $1E61, $1E61, $1E63, $1E63, $1E65, $1E65, $1E67, $1E67,
    $1E69, $1E69, $1E6B, $1E6B, $1E6D, $1E6D, $1E6F, $1E6F,
    $1E71, $1E71, $1E73, $1E73, $1E75, $1E75, $1E77, $1E77,
    $1E79, $1E79, $1E7B, $1E7B, $1E7D, $1E7D, $1E7F, $1E7F,
    $1E81, $1E81, $1E83, $1E83, $1E85, $1E85, $1E87, $1E87,
    $1E89, $1E89, $1E8B, $1E8B, $1E8D, $1E8D, $1E8F, $1E8F,
    $1E91, $1E91, $1E93, $1E93, $1E95, $1E95, $1E96, $1E97,
    $1E98, $1E99, $1E9A, $1E61, $1E9C, $1E9D, $1E9E, $1E9F,
    $1EA1, $1EA1, $1EA3, $1EA3, $1EA5, $1EA5, $1EA7, $1EA7,
    $1EA9, $1EA9, $1EAB, $1EAB, $1EAD, $1EAD, $1EAF, $1EAF,
    $1EB1, $1EB1, $1EB3, $1EB3, $1EB5, $1EB5, $1EB7, $1EB7,
    $1EB9, $1EB9, $1EBB, $1EBB, $1EBD, $1EBD, $1EBF, $1EBF,
    $1EC1, $1EC1, $1EC3, $1EC3, $1EC5, $1EC5, $1EC7, $1EC7,
    $1EC9, $1EC9, $1ECB, $1ECB, $1ECD, $1ECD, $1ECF, $1ECF,
    $1ED1, $1ED1, $1ED3, $1ED3, $1ED5, $1ED5, $1ED7, $1ED7,
    $1ED9, $1ED9, $1EDB, $1EDB, $1EDD, $1EDD, $1EDF, $1EDF,
    $1EE1, $1EE1, $1EE3, $1EE3, $1EE5, $1EE5, $1EE7, $1EE7,
    $1EE9, $1EE9, $1EEB, $1EEB, $1EED, $1EED, $1EEF, $1EEF,
    $1EF1, $1EF1, $1EF3, $1EF3, $1EF5, $1EF5, $1EF7, $1EF7,
    $1EF9, $1EF9, $1EFA, $1EFB, $1EFC, $1EFD, $1EFE, $1EFF
    )
    );

  CaseTable1f: UnicodeCaseTableVector =
  (Codes:
    (
    $1F00, $1F01, $1F02, $1F03, $1F04, $1F05, $1F06, $1F07,
    $1F00, $1F01, $1F02, $1F03, $1F04, $1F05, $1F06, $1F07,
    $1F10, $1F11, $1F12, $1F13, $1F14, $1F15, $1F16, $1F17,
    $1F10, $1F11, $1F12, $1F13, $1F14, $1F15, $1F1E, $1F1F,
    $1F20, $1F21, $1F22, $1F23, $1F24, $1F25, $1F26, $1F27,
    $1F20, $1F21, $1F22, $1F23, $1F24, $1F25, $1F26, $1F27,
    $1F30, $1F31, $1F32, $1F33, $1F34, $1F35, $1F36, $1F37,
    $1F30, $1F31, $1F32, $1F33, $1F34, $1F35, $1F36, $1F37,
    $1F40, $1F41, $1F42, $1F43, $1F44, $1F45, $1F46, $1F47,
    $1F40, $1F41, $1F42, $1F43, $1F44, $1F45, $1F4E, $1F4F,
    $1F50, $1F51, $1F52, $1F53, $1F54, $1F55, $1F56, $1F57,
    $1F58, $1F51, $1F5A, $1F53, $1F5C, $1F55, $1F5E, $1F57,
    $1F60, $1F61, $1F62, $1F63, $1F64, $1F65, $1F66, $1F67,
    $1F60, $1F61, $1F62, $1F63, $1F64, $1F65, $1F66, $1F67,
    $1F70, $1F71, $1F72, $1F73, $1F74, $1F75, $1F76, $1F77,
    $1F78, $1F79, $1F7A, $1F7B, $1F7C, $1F7D, $1F7E, $1F7F,
    $1F80, $1F81, $1F82, $1F83, $1F84, $1F85, $1F86, $1F87,
    $1F80, $1F81, $1F82, $1F83, $1F84, $1F85, $1F86, $1F87,
    $1F90, $1F91, $1F92, $1F93, $1F94, $1F95, $1F96, $1F97,
    $1F90, $1F91, $1F92, $1F93, $1F94, $1F95, $1F96, $1F97,
    $1FA0, $1FA1, $1FA2, $1FA3, $1FA4, $1FA5, $1FA6, $1FA7,
    $1FA0, $1FA1, $1FA2, $1FA3, $1FA4, $1FA5, $1FA6, $1FA7,
    $1FB0, $1FB1, $1FB2, $1FB3, $1FB4, $1FB5, $1FB6, $1FB7,
    $1FB0, $1FB1, $1F70, $1F71, $1FB3, $1FBD, $03B9, $1FBF,
    $1FC0, $1FC1, $1FC2, $1FC3, $1FC4, $1FC5, $1FC6, $1FC7,
    $1F72, $1F73, $1F74, $1F75, $1FC3, $1FCD, $1FCE, $1FCF,
    $1FD0, $1FD1, $1FD2, $1FD3, $1FD4, $1FD5, $1FD6, $1FD7,
    $1FD0, $1FD1, $1F76, $1F77, $1FDC, $1FDD, $1FDE, $1FDF,
    $1FE0, $1FE1, $1FE2, $1FE3, $1FE4, $1FE5, $1FE6, $1FE7,
    $1FE0, $1FE1, $1F7A, $1F7B, $1FE5, $1FED, $1FEE, $1FEF,
    $1FF0, $1FF1, $1FF2, $1FF3, $1FF4, $1FF5, $1FF6, $1FF7,
    $1F78, $1F79, $1F7C, $1F7D, $1FF3, $1FFD, $1FFE, $1FFF
    )
    );

  CaseTable21: UnicodeCaseTableVector =
  (Codes:
    (
    $2100, $2101, $2102, $2103, $2104, $2105, $2106, $2107,
    $2108, $2109, $210A, $210B, $210C, $210D, $210E, $210F,
    $2110, $2111, $2112, $2113, $2114, $2115, $2116, $2117,
    $2118, $2119, $211A, $211B, $211C, $211D, $211E, $211F,
    $2120, $2121, $2122, $2123, $2124, $2125, $03C9, $2127,
    $2128, $2129, $006B, $00E5, $212C, $212D, $212E, $212F,
    $2130, $2131, $2132, $2133, $2134, $2135, $2136, $2137,
    $2138, $2139, $213A, $213B, $213C, $213D, $213E, $213F,
    $2140, $2141, $2142, $2143, $2144, $2145, $2146, $2147,
    $2148, $2149, $214A, $214B, $214C, $214D, $214E, $214F,
    $2150, $2151, $2152, $2153, $2154, $2155, $2156, $2157,
    $2158, $2159, $215A, $215B, $215C, $215D, $215E, $215F,
    $2170, $2171, $2172, $2173, $2174, $2175, $2176, $2177,
    $2178, $2179, $217A, $217B, $217C, $217D, $217E, $217F,
    $2170, $2171, $2172, $2173, $2174, $2175, $2176, $2177,
    $2178, $2179, $217A, $217B, $217C, $217D, $217E, $217F,
    $2180, $2181, $2182, $2183, $2184, $2185, $2186, $2187,
    $2188, $2189, $218A, $218B, $218C, $218D, $218E, $218F,
    $2190, $2191, $2192, $2193, $2194, $2195, $2196, $2197,
    $2198, $2199, $219A, $219B, $219C, $219D, $219E, $219F,
    $21A0, $21A1, $21A2, $21A3, $21A4, $21A5, $21A6, $21A7,
    $21A8, $21A9, $21AA, $21AB, $21AC, $21AD, $21AE, $21AF,
    $21B0, $21B1, $21B2, $21B3, $21B4, $21B5, $21B6, $21B7,
    $21B8, $21B9, $21BA, $21BB, $21BC, $21BD, $21BE, $21BF,
    $21C0, $21C1, $21C2, $21C3, $21C4, $21C5, $21C6, $21C7,
    $21C8, $21C9, $21CA, $21CB, $21CC, $21CD, $21CE, $21CF,
    $21D0, $21D1, $21D2, $21D3, $21D4, $21D5, $21D6, $21D7,
    $21D8, $21D9, $21DA, $21DB, $21DC, $21DD, $21DE, $21DF,
    $21E0, $21E1, $21E2, $21E3, $21E4, $21E5, $21E6, $21E7,
    $21E8, $21E9, $21EA, $21EB, $21EC, $21ED, $21EE, $21EF,
    $21F0, $21F1, $21F2, $21F3, $21F4, $21F5, $21F6, $21F7,
    $21F8, $21F9, $21FA, $21FB, $21FC, $21FD, $21FE, $21FF
    )
    );

  CaseTable24: UnicodeCaseTableVector =
  (Codes:
    (
    $2400, $2401, $2402, $2403, $2404, $2405, $2406, $2407,
    $2408, $2409, $240A, $240B, $240C, $240D, $240E, $240F,
    $2410, $2411, $2412, $2413, $2414, $2415, $2416, $2417,
    $2418, $2419, $241A, $241B, $241C, $241D, $241E, $241F,
    $2420, $2421, $2422, $2423, $2424, $2425, $2426, $2427,
    $2428, $2429, $242A, $242B, $242C, $242D, $242E, $242F,
    $2430, $2431, $2432, $2433, $2434, $2435, $2436, $2437,
    $2438, $2439, $243A, $243B, $243C, $243D, $243E, $243F,
    $2440, $2441, $2442, $2443, $2444, $2445, $2446, $2447,
    $2448, $2449, $244A, $244B, $244C, $244D, $244E, $244F,
    $2450, $2451, $2452, $2453, $2454, $2455, $2456, $2457,
    $2458, $2459, $245A, $245B, $245C, $245D, $245E, $245F,
    $2460, $2461, $2462, $2463, $2464, $2465, $2466, $2467,
    $2468, $2469, $246A, $246B, $246C, $246D, $246E, $246F,
    $2470, $2471, $2472, $2473, $2474, $2475, $2476, $2477,
    $2478, $2479, $247A, $247B, $247C, $247D, $247E, $247F,
    $2480, $2481, $2482, $2483, $2484, $2485, $2486, $2487,
    $2488, $2489, $248A, $248B, $248C, $248D, $248E, $248F,
    $2490, $2491, $2492, $2493, $2494, $2495, $2496, $2497,
    $2498, $2499, $249A, $249B, $249C, $249D, $249E, $249F,
    $24A0, $24A1, $24A2, $24A3, $24A4, $24A5, $24A6, $24A7,
    $24A8, $24A9, $24AA, $24AB, $24AC, $24AD, $24AE, $24AF,
    $24B0, $24B1, $24B2, $24B3, $24B4, $24B5, $24D0, $24D1,
    $24D2, $24D3, $24D4, $24D5, $24D6, $24D7, $24D8, $24D9,
    $24DA, $24DB, $24DC, $24DD, $24DE, $24DF, $24E0, $24E1,
    $24E2, $24E3, $24E4, $24E5, $24E6, $24E7, $24E8, $24E9,
    $24D0, $24D1, $24D2, $24D3, $24D4, $24D5, $24D6, $24D7,
    $24D8, $24D9, $24DA, $24DB, $24DC, $24DD, $24DE, $24DF,
    $24E0, $24E1, $24E2, $24E3, $24E4, $24E5, $24E6, $24E7,
    $24E8, $24E9, $24EA, $24EB, $24EC, $24ED, $24EE, $24EF,
    $24F0, $24F1, $24F2, $24F3, $24F4, $24F5, $24F6, $24F7,
    $24F8, $24F9, $24FA, $24FB, $24FC, $24FD, $24FE, $24FF
    )
    );

  CaseTableff: UnicodeCaseTableVector =
  (Codes:
    (
    $FF00, $FF01, $FF02, $FF03, $FF04, $FF05, $FF06, $FF07,
    $FF08, $FF09, $FF0A, $FF0B, $FF0C, $FF0D, $FF0E, $FF0F,
    $FF10, $FF11, $FF12, $FF13, $FF14, $FF15, $FF16, $FF17,
    $FF18, $FF19, $FF1A, $FF1B, $FF1C, $FF1D, $FF1E, $FF1F,
    $FF20, $FF41, $FF42, $FF43, $FF44, $FF45, $FF46, $FF47,
    $FF48, $FF49, $FF4A, $FF4B, $FF4C, $FF4D, $FF4E, $FF4F,
    $FF50, $FF51, $FF52, $FF53, $FF54, $FF55, $FF56, $FF57,
    $FF58, $FF59, $FF5A, $FF3B, $FF3C, $FF3D, $FF3E, $FF3F,
    $FF40, $FF41, $FF42, $FF43, $FF44, $FF45, $FF46, $FF47,
    $FF48, $FF49, $FF4A, $FF4B, $FF4C, $FF4D, $FF4E, $FF4F,
    $FF50, $FF51, $FF52, $FF53, $FF54, $FF55, $FF56, $FF57,
    $FF58, $FF59, $FF5A, $FF5B, $FF5C, $FF5D, $FF5E, $FF5F,
    $FF60, $FF61, $FF62, $FF63, $FF64, $FF65, $FF66, $FF67,
    $FF68, $FF69, $FF6A, $FF6B, $FF6C, $FF6D, $FF6E, $FF6F,
    $FF70, $FF71, $FF72, $FF73, $FF74, $FF75, $FF76, $FF77,
    $FF78, $FF79, $FF7A, $FF7B, $FF7C, $FF7D, $FF7E, $FF7F,
    $FF80, $FF81, $FF82, $FF83, $FF84, $FF85, $FF86, $FF87,
    $FF88, $FF89, $FF8A, $FF8B, $FF8C, $FF8D, $FF8E, $FF8F,
    $FF90, $FF91, $FF92, $FF93, $FF94, $FF95, $FF96, $FF97,
    $FF98, $FF99, $FF9A, $FF9B, $FF9C, $FF9D, $FF9E, $FF9F,
    $FFA0, $FFA1, $FFA2, $FFA3, $FFA4, $FFA5, $FFA6, $FFA7,
    $FFA8, $FFA9, $FFAA, $FFAB, $FFAC, $FFAD, $FFAE, $FFAF,
    $FFB0, $FFB1, $FFB2, $FFB3, $FFB4, $FFB5, $FFB6, $FFB7,
    $FFB8, $FFB9, $FFBA, $FFBB, $FFBC, $FFBD, $FFBE, $FFBF,
    $FFC0, $FFC1, $FFC2, $FFC3, $FFC4, $FFC5, $FFC6, $FFC7,
    $FFC8, $FFC9, $FFCA, $FFCB, $FFCC, $FFCD, $FFCE, $FFCF,
    $FFD0, $FFD1, $FFD2, $FFD3, $FFD4, $FFD5, $FFD6, $FFD7,
    $FFD8, $FFD9, $FFDA, $FFDB, $FFDC, $FFDD, $FFDE, $FFDF,
    $FFE0, $FFE1, $FFE2, $FFE3, $FFE4, $FFE5, $FFE6, $FFE7,
    $FFE8, $FFE9, $FFEA, $FFEB, $FFEC, $FFED, $FFEE, $FFEF,
    $FFF0, $FFF1, $FFF2, $FFF3, $FFF4, $FFF5, $FFF6, $FFF7,
    $FFF8, $FFF9, $FFFA, $FFFB, $FFFC, $FFFD, $FFFE, $FFFF
    )
    );

type

  TgtUnicodeTypeTable = class
  public
    CaseTable: array[0..255] of UnicodeCaseTableVector;

    procedure Init;
    function UnicodeToUpper(AC: TgtUnicode): TgtUnicode;
  end;

implementation


{ TgtUnicodeTypeTable }

procedure TgtUnicodeTypeTable.Init;
begin
  CaseTable[0] := CaseTable00;
  CaseTable[1] := caseTable01;
  CaseTable[2] := caseTable02;
  CaseTable[3] := CaseTable03;
  CaseTable[4] := CaseTable04;
  CaseTable[5] := CaseTable05;
  CaseTable[30] := CaseTable1e;
  CaseTable[31] := CaseTable1f;
  CaseTable[33] := CaseTable21;
  CaseTable[36] := CaseTable24;
  CaseTable[255] := CaseTableff;
end;

function TgtUnicodeTypeTable.UnicodeToUpper(AC: TgtUnicode): TgtUnicode;
//var
//  LI: Integer;
begin
(*
  Init;
  if (AC > $ffff) then
  begin
    Result := AC;
    Exit;
  end;
  LI := (AC shr 8) and $ff;
  if (CaseTable[LI].Codes[0] <> 0) then
  begin
    Result := CaseTable[LI].Codes[AC and $ff];
  end;
 *)
  Result := AC;
end;

end.
