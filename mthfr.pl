#!/usr/bin/perl

use warnings;
use strict;
use Data::Dumper;

our %genome;
our %length = ( gene => 4, rsid => 4, "risk allele" => 11 );

our @SNPs = (
    [   "DETOX",
        {   "gene"        => "CYP1A1*2C A4889G",
            "rsid"        => "rs1048943",
            "risk allele" => "C"
        },
        {   "gene"        => "CYP1A1*4 C2453A",
            "rsid"        => "rs1799814",
            "risk allele" => "T"
        },
        {   "gene"        => "CYP1A2 C164A",
            "rsid"        => "rs762551",
            "risk allele" => "C"
        },
        {   "gene"        => "CYP1B1 L432V",
            "rsid"        => "rs1056836",
            "risk allele" => "C"
        },
        {   "gene"        => "CYP1B1 N453S",
            "rsid"        => "rs1800440",
            "risk allele" => "C"
        },
        {   "gene"        => "CYP1B1 R48G",
            "rsid"        => "rs10012",
            "risk allele" => "C"
        },
        {   "gene"        => "CYP2A6*2 A1799T",
            "rsid"        => "rs1801272",
            "risk allele" => "T"
        },
        {   "gene"        => "CYP2C19*17",
            "rsid"        => "rs12248560",
            "risk allele" => "T"
        },
        {   "gene"        => "CYP2C9*2 C430T",
            "rsid"        => "rs1799853",
            "risk allele" => "T"
        },
        {   "gene"        => "CYP2C9*3 A1075C",
            "rsid"        => "rs1057910",
            "risk allele" => "C"
        },
        {   "gene"        => "CYP2D6 S486T",
            "rsid"        => "rs1135840",
            "risk allele" => "G"
        },
        {   "gene"        => "CYP2D6 T100C",
            "rsid"        => "rs1065852",
            "risk allele" => "A"
        },
        {   "gene"        => "CYP2D6 T2850C",
            "rsid"        => "rs16947",
            "risk allele" => "A"
        },
        {   "gene"        => "CYP2E1*1B G9896C",
            "rsid"        => "rs2070676",
            "risk allele" => "G"
        },
        {   "gene"        => "CYP2E1*4 A4768G",
            "rsid"        => "rs6413419",
            "risk allele" => "A"
        },
        {   "gene"        => "CYP3A4*1B",
            "rsid"        => "rs2740574",
            "risk allele" => "C"
        },
        {   "gene"        => "CYP3A4*3 M445T",
            "rsid"        => "rs4986910",
            "risk allele" => "G"
        },
        {   "gene"        => "GPX3",
            "rsid"        => "rs8177412",
            "risk allele" => "C"
        },
        {   "gene"        => "GSTM1",
            "rsid"        => "rs12068997",
            "risk allele" => "T"
        },
        {   "gene"        => "GSTM1",
            "rsid"        => "rs4147565",
            "risk allele" => "A"
        },
        {   "gene"        => "GSTM1",
            "rsid"        => "rs4147567",
            "risk allele" => "G"
        },
        {   "gene"        => "GSTM1",
            "rsid"        => "rs4147568",
            "risk allele" => "A"
        },
        {   "gene"        => "GSTM1",
            "rsid"        => "rs1056806",
            "risk allele" => "T"
        },
        {   "gene"        => "GSTM1",
            "rsid"        => "rs12562055",
            "risk allele" => "A"
        },
        {   "gene"        => "GSTM1",
            "rsid"        => "rs2239892",
            "risk allele" => "G"
        },
        {   "gene"        => "GSTP I105V",
            "rsid"        => "rs1695",
            "risk allele" => "G"
        },
        {   "gene"        => "GSTP1 A114V",
            "rsid"        => "rs1138272",
            "risk allele" => "T"
        },
        {   "gene"        => "NAT1 A560G(?) (R187Q)",
            "rsid"        => "rs4986782",
            "risk allele" => "A"
        },
        {   "gene"        => "NAT2 A803G (K268R)",
            "rsid"        => "rs1208",
            "risk allele" => "G"
        },
        {   "gene"        => "NAT2 C190T (R64W)",
            "rsid"        => "rs1805158",
            "risk allele" => "T"
        },
        {   "gene"        => "NAT2 G590A (R197Q)",
            "rsid"        => "rs1799930",
            "risk allele" => "A"
        },
        {   "gene"        => "NAT2 G857A (G286E)",
            "rsid"        => "rs1799931",
            "risk allele" => "A"
        },
        {   "gene"        => "NAT2 T341C (I114T)",
            "rsid"        => "rs1801280",
            "risk allele" => "C"
        },
        {   "gene"        => "SOD2",
            "rsid"        => "rs2758331",
            "risk allele" => "A"
        },
        {   "gene"        => "SOD3",
            "rsid"        => "rs2855262",
            "risk allele" => "T"
        },
        {   "gene"        => "SOD2 A16V",
            "rsid"        => "rs4880",
            "risk allele" => "G"
        },
        {   "gene"        => "PON1 Q192R",
            "rsid"        => "rs662",
            "risk allele" => "C"
        },
    ],
    [   "TONGUE TIE / CLEFT PALATE",
        {   "gene"        => "CTH S4031I",
            "rsid"        => "rs1021737",
            "risk allele" => "T"
        },
        {   "gene"        => "IRF6",
            "rsid"        => "rs987525",
            "risk allele" => "A"
        },
        {   "gene"        => "IRF6",
            "rsid"        => "rs861020",
            "risk allele" => "A"
        },
        {   "gene"        => "RARA",
            "rsid"        => "rs7217852",
            "risk allele" => "G"
        },
        {   "gene"        => "RARA",
            "rsid"        => "rs9904270",
            "risk allele" => "T"
        },
        {   "gene"        => "TBX22",
            "rsid"        => "rs41307258",
            "risk allele" => "A"
        },
        {   "gene"        => "TBX22",
            "rsid"        => "rs28935177",
            "risk allele" => "T"
        },
    ],
    [   "ALLERGY/MOLD",
        {   "gene"        => "HLA",
            "rsid"        => "rs7775228",
            "risk allele" => "C"
        },
        {   "gene"        => "HLA",
            "rsid"        => "rs2155219",
            "risk allele" => "T"
        },
    ],
    [   "IgE",
        {   "gene"        => "FCER1A",
            "rsid"        => "rs2427837",
            "risk allele" => "A"
        },
        {   "gene"        => "IL-13 C1112T",
            "rsid"        => "rs1800925",
            "risk allele" => "T"
        },
        {   "gene"        => "DARC",
            "rsid"        => "rs2814778",
            "risk allele" => "C"
        },
        {   "gene"        => "IL13",
            "rsid"        => "rs1295685",
            "risk allele" => "A"
        },
        {   "gene"        => "CD14",
            "rsid"        => "rs2569191",
            "risk allele" => "C"
        },
        {   "gene"        => "SOCS-1 -820G>T",
            "rsid"        => "rs33977706",
            "risk allele" => "A"
        },
        {   "gene"        => "C3",
            "rsid"        => "rs366510",
            "risk allele" => "G"
        },
        {   "gene"        => "FCER1A / OR10J2P",
            "rsid"        => "rs2494262",
            "risk allele" => "A"
        },
        {   "gene"        => "FCER1A",
            "rsid"        => "rs2251746",
            "risk allele" => "C"
        },
        {   "gene"        => "RAD50",
            "rsid"        => "rs2040704",
            "risk allele" => "G"
        },
        {   "gene"        => "RAD50",
            "rsid"        => "rs2240032",
            "risk allele" => "T"
        },
    ],
    [   "IgG",
        {   "gene"        => "FCGR2A",
            "rsid"        => "rs1801274",
            "risk allele" => "A"
        },
        {   "gene"        => "GSTM3 V224I",
            "rsid"        => "rs7483",
            "risk allele" => "T"
        },
        {   "gene"        => "TNFRSF13B",
            "rsid"        => "rs4792800",
            "risk allele" => "G"
        },
    ],
    [   "IgA",
        {   "gene"        => "TRAF1",
            "rsid"        => "rs3761847",
            "risk allele" => "G"
        },
        {   "gene"        => "IRF5",
            "rsid"        => "rs4728142",
            "risk allele" => "A"
        },
        {   "gene"        => "IGF1R",
            "rsid"        => "rs2229765",
            "risk allele" => "A"
        },
        {   "gene"        => "IFIH1 (HLA)",
            "rsid"        => "rs1990760",
            "risk allele" => "C"
        },
        {   "gene"        => "HLA",
            "rsid"        => "rs9271366",
            "risk allele" => "G"
        },
        {   "gene"        => "CFH",
            "rsid"        => "rs6677604",
            "risk allele" => "A"
        },
        {   "gene"        => "HLA-DQA2",
            "rsid"        => "rs9275224",
            "risk allele" => "A"
        },
        {   "gene"        => "MTC03P1",
            "rsid"        => "rs9275596",
            "risk allele" => "C"
        },
        {   "gene"        => "PSMB8 / TAP1 / TAP2",
            "rsid"        => "rs9357155",
            "risk allele" => "A"
        },
        {   "gene"        => "HLA-DPB2 / COL11A2P",
            "rsid"        => "rs1883414",
            "risk allele" => "A"
        },
    ],
    [   "CLOTTING FACTORS",
        {   "gene"        => "CETP",
            "rsid"        => "rs1800775",
            "risk allele" => "C"
        },
        {   "gene"        => "CYP4V2",
            "rsid"        => "rs13146272",
            "risk allele" => "C"
        },
        {   "gene"        => "GP6",
            "rsid"        => "rs1613662",
            "risk allele" => "G"
        },
        {   "gene"        => "ITGB3 T196C",
            "rsid"        => "rs5918",
            "risk allele" => "C"
        },
        {   "gene"        => "KNG I598T",
            "rsid"        => "rs2731672",
            "risk allele" => "T"
        },
        {   "gene"        => "NR1I2",
            "rsid"        => "rs1523127",
            "risk allele" => "C"
        },
        {   "gene"        => "SERPINC1",
            "rsid"        => "rs2227589",
            "risk allele" => "T"
        },
        {   "gene"        => "HRG",
            "rsid"        => "rs9898",
            "risk allele" => "T"
        },
        {   "gene"        => "F12",
            "rsid"        => "rs1801020",
            "risk allele" => "A"
        },
        {   "gene"        => "F11",
            "rsid"        => "rs2289252",
            "risk allele" => "T"
        },
        {   "gene"        => "F11",
            "rsid"        => "rs2036914",
            "risk allele" => "T"
        },
        {   "gene"        => "F10 113777509",
            "rsid"        => "rs3211719",
            "risk allele" => "G"
        },
        {   "gene"        => "F7 A353G",
            "rsid"        => "rs6046",
            "risk allele" => "A"
        },
        {   "gene"        => "F2 (Prothrombin 20210A)",
            "rsid"        => "i3002432",
            "risk allele" => "A"
        },
        {   "gene"        => "F3 94997288",
            "rsid"        => "rs1324214",
            "risk allele" => "A"
        },
        {   "gene"        => "F5 (Factor V Leiden)",
            "rsid"        => "rs6025",
            "risk allele" => "T"
        },
        {   "gene"        => "F9 G580A",
            "rsid"        => "rs6048",
            "risk allele" => "G"
        },
    ],
    [   "METHYLATION",
        {   "gene"        => "ACE Del16",
            "rsid"        => "rs4343",
            "risk allele" => "G"
        },
        {   "gene"        => "ADD1 G460W",
            "rsid"        => "rs4961",
            "risk allele" => "T"
        },
        {   "gene"        => "ACAT1-02",
            "rsid"        => "rs3741049",
            "risk allele" => "A"
        },
        {   "gene"        => "AGT M235T/C4072T",
            "rsid"        => "rs699",
            "risk allele" => "G"
        },
        {   "gene"        => "AHCY-01",
            "rsid"        => "rs819147",
            "risk allele" => "C"
        },
        {   "gene"        => "AHCY-02",
            "rsid"        => "rs819134",
            "risk allele" => "G"
        },
        {   "gene"        => "AHCY-19",
            "rsid"        => "rs819171",
            "risk allele" => "C"
        },
        {   "gene"        => "BHMT",
            "rsid"        => "rs16876512",
            "risk allele" => "T"
        },
        {   "gene"        => "BHMT",
            "rsid"        => "rs6875201",
            "risk allele" => "G"
        },
        {   "gene"        => "BHMT-02",
            "rsid"        => "rs567754",
            "risk allele" => "T"
        },
        {   "gene"        => "BHMT-04",
            "rsid"        => "rs617219",
            "risk allele" => "C"
        },
        {   "gene"        => "BHMT-08",
            "rsid"        => "rs651852",
            "risk allele" => "T"
        },
        {   "gene"        => "BHMT R239Q",
            "rsid"        => "rs3733890",
            "risk allele" => "A"
        },
        {   "gene"        => "CBS A13637G",
            "rsid"        => "rs2851391",
            "risk allele" => "T"
        },
        {   "gene"        => "CBS A360A",
            "rsid"        => "rs1801181",
            "risk allele" => "A"
        },
        {   "gene"        => "CBS C19150T",
            "rsid"        => "rs4920037",
            "risk allele" => "A"
        },
        {   "gene"        => "CBS C699T",
            "rsid"        => "rs234706",
            "risk allele" => "A"
        },
        {   "gene"        => "CBS N212N",
            "rsid"        => "rs2298758",
            "risk allele" => "A"
        },
        {   "gene"        => "COMT",
            "rsid"        => "rs6269",
            "risk allele" => "G"
        },
        {   "gene"        => "COMT -61 P199P",
            "rsid"        => "rs769224",
            "risk allele" => "A"
        },
        {   "gene"        => "COMT H62H",
            "rsid"        => "rs4633",
            "risk allele" => "T"
        },
        {   "gene"        => "COMT V158M",
            "rsid"        => "rs4680",
            "risk allele" => "A"
        },
        {   "gene"        => "DAO",
            "rsid"        => "rs2070586",
            "risk allele" => "A"
        },
        {   "gene"        => "DAO",
            "rsid"        => "rs2111902",
            "risk allele" => "G"
        },
        {   "gene"        => "DAO",
            "rsid"        => "rs3741775",
            "risk allele" => "C"
        },
        {   "gene"        => "DHFR",
            "rsid"        => "rs1643649",
            "risk allele" => "C"
        },
        {   "gene"        => "FOLR1",
            "rsid"        => "rs2071010",
            "risk allele" => "A"
        },
        {   "gene"        => "FOLR2",
            "rsid"        => "rs651933",
            "risk allele" => "A"
        },
        {   "gene"        => "FOLR3",
            "rsid"        => "rs7925545",
            "risk allele" => "G"
        },
        {   "gene"        => "FOLR3",
            "rsid"        => "rs7926875",
            "risk allele" => "A"
        },
        {   "gene"        => "FUT2",
            "rsid"        => "rs492602",
            "risk allele" => "G"
        },
        {   "gene"        => "FUT2",
            "rsid"        => "rs601338",
            "risk allele" => "A"
        },
        {   "gene"        => "FUT2",
            "rsid"        => "rs602662",
            "risk allele" => "A"
        },
        {   "gene"        => "G6PD",
            "rsid"        => "rs1050828",
            "risk allele" => "T"
        },
        {   "gene"        => "G6PD",
            "rsid"        => "rs1050829",
            "risk allele" => "C"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs3749034",
            "risk allele" => "A"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs2241165",
            "risk allele" => "C"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs769407",
            "risk allele" => "C"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs2058725",
            "risk allele" => "C"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs3791851",
            "risk allele" => "C"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs3791850",
            "risk allele" => "A"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs12185692",
            "risk allele" => "A"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs3791878",
            "risk allele" => "T"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs10432420",
            "risk allele" => "A"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs3828275",
            "risk allele" => "T"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs701492",
            "risk allele" => "T"
        },
        {   "gene"        => "GAD1",
            "rsid"        => "rs769395",
            "risk allele" => "G"
        },
        {   "gene"        => "GAD2",
            "rsid"        => "rs1805398",
            "risk allele" => "T"
        },
        {   "gene"        => "GAMT",
            "rsid"        => "rs17851582",
            "risk allele" => "A"
        },
        {   "gene"        => "GAMT",
            "rsid"        => "rs55776826",
            "risk allele" => "T"
        },
        {   "gene"        => "GIF (TCN3)",
            "rsid"        => "rs558660",
            "risk allele" => "A"
        },
        {   "gene"        => "MAO A R297R",
            "rsid"        => "rs6323",
            "risk allele" => "T"
        },
        {   "gene"        => "MAT1A",
            "rsid"        => "rs72558181",
            "risk allele" => "T"
        },
        {   "gene"        => "MTHFD1 C105T",
            "rsid"        => "rs1076991",
            "risk allele" => "C"
        },
        {   "gene"        => "MTHFD1 G1958A",
            "rsid"        => "rs2236225",
            "risk allele" => "A"
        },
        {   "gene"        => "MTHFD1L",
            "rsid"        => "rs11754661",
            "risk allele" => "A"
        },
        {   "gene"        => "MTHFD1L",
            "rsid"        => "rs17349743",
            "risk allele" => "C"
        },
        {   "gene"        => "MTHFD1L",
            "rsid"        => "rs6922269",
            "risk allele" => "A"
        },
        {   "gene"        => "MTHFD1L",
            "rsid"        => "rs803422",
            "risk allele" => "A"
        },
        {   "gene"        => "MTHFR 03 P39P",
            "rsid"        => "rs2066470",
            "risk allele" => "A"
        },
        {   "gene"        => "MTHFR A1298C",
            "rsid"        => "rs1801131",
            "risk allele" => "G"
        },
        {   "gene"        => "MTHFR A1572G",
            "rsid"        => "rs17367504",
            "risk allele" => "G"
        },
        {   "gene"        => "MTHFR C677T",
            "rsid"        => "rs1801133",
            "risk allele" => "A"
        },
        {   "gene"        => "MTHFR G1793A (R594Q)",
            "rsid"        => "rs2274976",
            "risk allele" => "T"
        },
        {   "gene"        => "MTHFR",
            "rsid"        => "rs12121543",
            "risk allele" => "A"
        },
        {   "gene"        => "MTHFR",
            "rsid"        => "rs13306560",
            "risk allele" => "T"
        },
        {   "gene"        => "MTHFR",
            "rsid"        => "rs13306561",
            "risk allele" => "G"
        },
        {   "gene"        => "MTHFR",
            "rsid"        => "rs1476413",
            "risk allele" => "T"
        },
        {   "gene"        => "MTHFR",
            "rsid"        => "rs17037390",
            "risk allele" => "A"
        },
        {   "gene"        => "MTHFR",
            "rsid"        => "rs17037396",
            "risk allele" => "T"
        },
        {   "gene"        => "MTHFR",
            "rsid"        => "rs3737964",
            "risk allele" => "T"
        },
        {   "gene"        => "MTHFR",
            "rsid"        => "rs4846048",
            "risk allele" => "G"
        },
        {   "gene"        => "MTHFR",
            "rsid"        => "rs4846049",
            "risk allele" => "T"
        },
        {   "gene"        => "MTHFS",
            "rsid"        => "rs6495446",
            "risk allele" => "C"
        },
        {   "gene"        => "MTR A2756G",
            "rsid"        => "rs1805087",
            "risk allele" => "G"
        },
        {   "gene"        => "MTRR A66G",
            "rsid"        => "rs1801394",
            "risk allele" => "G"
        },
        {   "gene"        => "MTRR H595Y",
            "rsid"        => "rs10380",
            "risk allele" => "T"
        },
        {   "gene"        => "MTRR K350A",
            "rsid"        => "rs162036",
            "risk allele" => "G"
        },
        {   "gene"        => "MTRR R415T",
            "rsid"        => "rs2287780",
            "risk allele" => "T"
        },
        {   "gene"        => "MTRR-11 A664A",
            "rsid"        => "rs1802059",
            "risk allele" => "A"
        },
        {   "gene"        => "MTRR",
            "rsid"        => "rs10520873",
            "risk allele" => "C"
        },
        {   "gene"        => "MTRR",
            "rsid"        => "rs1532268",
            "risk allele" => "T"
        },
        {   "gene"        => "MTRR",
            "rsid"        => "rs162049",
            "risk allele" => "G"
        },
        {   "gene"        => "MTRR",
            "rsid"        => "rs3776467",
            "risk allele" => "G"
        },
        {   "gene"        => "MTRR",
            "rsid"        => "rs9332",
            "risk allele" => "A"
        },
        {   "gene"        => "NOS1",
            "rsid"        => "rs3782206",
            "risk allele" => "T"
        },
        {   "gene"        => "NOS2",
            "rsid"        => "rs2297518",
            "risk allele" => "A"
        },
        {   "gene"        => "NOS2",
            "rsid"        => "rs2274894",
            "risk allele" => "T"
        },
        {   "gene"        => "NOS2",
            "rsid"        => "rs2248814",
            "risk allele" => "A"
        },
        {   "gene"        => "NOS3",
            "rsid"        => "rs1800783",
            "risk allele" => "A"
        },
        {   "gene"        => "NOS3",
            "rsid"        => "rs1800779",
            "risk allele" => "G"
        },
        {   "gene"        => "NOS3",
            "rsid"        => "rs3918188",
            "risk allele" => "A"
        },
        {   "gene"        => "NOS3 G10T",
            "rsid"        => "rs7830",
            "risk allele" => "T"
        },
        {   "gene"        => "NOS3 T786C",
            "rsid"        => "rs2070744",
            "risk allele" => "C"
        },
        {   "gene"        => "PEMT",
            "rsid"        => "rs4244593",
            "risk allele" => "T"
        },
        {   "gene"        => "PEMT",
            "rsid"        => "rs4646406",
            "risk allele" => "A"
        },
        {   "gene"        => "PEMT",
            "rsid"        => "rs7946",
            "risk allele" => "C"
        },
        {   "gene"        => "SHMT1 C1420T",
            "rsid"        => "rs1979277",
            "risk allele" => "A"
        },
        {   "gene"        => "SHMT1",
            "rsid"        => "rs9909104",
            "risk allele" => "C"
        },
        {   "gene"        => "SHMT2",
            "rsid"        => "rs12319666",
            "risk allele" => "T"
        },
        {   "gene"        => "SHMT2",
            "rsid"        => "rs34095989",
            "risk allele" => "A"
        },
        {   "gene"        => "SLC19A1",
            "rsid"        => "rs1888530",
            "risk allele" => "T"
        },
        {   "gene"        => "SLC19A1",
            "rsid"        => "rs3788200",
            "risk allele" => "A"
        },
        {   "gene"        => "TCN1",
            "rsid"        => "rs526934",
            "risk allele" => "G"
        },
        {   "gene"        => "TCN2 C766G",
            "rsid"        => "rs1801198",
            "risk allele" => "G"
        },
        {   "gene"        => "TYMS",
            "rsid"        => "rs502396",
            "risk allele" => "C"
        },
        {   "gene"        => "VDR Bsm",
            "rsid"        => "rs1544410",
            "risk allele" => "T"
        },
    ],
    [   "CELIAC DISEASE/GLUTEN INTOLERANCE",
        {   "gene"        => "HLA",
            "rsid"        => "rs2858331",
            "risk allele" => "G"
        },
        {   "gene"        => "HLA DQA1",
            "rsid"        => "rs2187668",
            "risk allele" => "T"
        },
    ],
    [   "THYROID",
        {   "gene"        => "CTLA4",
            "rsid"        => "rs231775",
            "risk allele" => "G"
        },
        {   "gene"        => "FOXE1",
            "rsid"        => "rs1867277",
            "risk allele" => "A"
        },
        {   "gene"        => "FOXE1",
            "rsid"        => "rs7043516",
            "risk allele" => "C"
        },
        {   "gene"        => "FOXE1",
            "rsid"        => "rs10984009",
            "risk allele" => "A"
        },
    ],
    [   "EYE HEALTH",
        {   "gene"        => "BCMO1",
            "rsid"        => "rs4889294",
            "risk allele" => "C"
        },
        {   "gene"        => "BCMO1 R267S",
            "rsid"        => "rs12934922",
            "risk allele" => "T"
        },
        {   "gene"        => "BCMO1 A379V",
            "rsid"        => "rs7501331",
            "risk allele" => "T"
        },
    ],
    [   "MITOCHONDRIAL FUNCTION",
        {   "gene"        => "ATP5g3",
            "rsid"        => "rs185584",
            "risk allele" => "G"
        },
        {   "gene"        => "ATP5g3",
            "rsid"        => "rs36089250",
            "risk allele" => "C"
        },
        {   "gene"        => "ATP5c1",
            "rsid"        => "rs2778475",
            "risk allele" => "A"
        },
        {   "gene"        => "ATP5c1",
            "rsid"        => "rs1244414",
            "risk allele" => "T"
        },
        {   "gene"        => "ATP5c1",
            "rsid"        => "rs1244422",
            "risk allele" => "T"
        },
        {   "gene"        => "ATP5c1",
            "rsid"        => "rs12770829",
            "risk allele" => "T"
        },
        {   "gene"        => "ATP5c1",
            "rsid"        => "rs4655",
            "risk allele" => "C"
        },
        {   "gene"        => "COX5A",
            "rsid"        => "rs8042694",
            "risk allele" => "G"
        },
        {   "gene"        => "COX6C",
            "rsid"        => "rs4626565",
            "risk allele" => "C"
        },
        {   "gene"        => "COX6C",
            "rsid"        => "rs7844439",
            "risk allele" => "A"
        },
        {   "gene"        => "COX6C",
            "rsid"        => "rs4510829",
            "risk allele" => "A"
        },
        {   "gene"        => "COX6C",
            "rsid"        => "rs1135382",
            "risk allele" => "A"
        },
        {   "gene"        => "COX6C",
            "rsid"        => "rs7828241",
            "risk allele" => "C"
        },
        {   "gene"        => "COX6C",
            "rsid"        => "rs12544943",
            "risk allele" => "G"
        },
        {   "gene"        => "COX6C",
            "rsid"        => "rs4518636",
            "risk allele" => "C"
        },
        {   "gene"        => "NDUFS3",
            "rsid"        => "rs2233354",
            "risk allele" => "C"
        },
        {   "gene"        => "NDUFS3",
            "rsid"        => "rs4147730",
            "risk allele" => "A"
        },
        {   "gene"        => "NDUFS3",
            "rsid"        => "rs4147731",
            "risk allele" => "A"
        },
        {   "gene"        => "NDUFS7",
            "rsid"        => "rs2332496",
            "risk allele" => "A"
        },
        {   "gene"        => "NDUFS7",
            "rsid"        => "rs7254913",
            "risk allele" => "G"
        },
        {   "gene"        => "NDUFS7",
            "rsid"        => "rs1142530",
            "risk allele" => "T"
        },
        {   "gene"        => "NDUFS7",
            "rsid"        => "rs7258846",
            "risk allele" => "T"
        },
        {   "gene"        => "NDUFS7",
            "rsid"        => "rs11666067",
            "risk allele" => "A"
        },
        {   "gene"        => "NDUFS7",
            "rsid"        => "rs2074895",
            "risk allele" => "A"
        },
        {   "gene"        => "NDUFS7",
            "rsid"        => "rs809359",
            "risk allele" => "G"
        },
        {   "gene"        => "NDUFS8",
            "rsid"        => "rs4147776",
            "risk allele" => "C"
        },
        {   "gene"        => "NDUFS8",
            "rsid"        => "rs1122731",
            "risk allele" => "A"
        },
        {   "gene"        => "NDUFS8",
            "rsid"        => "rs999571",
            "risk allele" => "A"
        },
        {   "gene"        => "NDUFS8",
            "rsid"        => "rs2075626",
            "risk allele" => "C"
        },
        {   "gene"        => "NDUFS8",
            "rsid"        => "rs3115546",
            "risk allele" => "G"
        },
        {   "gene"        => "NDUFS8",
            "rsid"        => "rs1104739",
            "risk allele" => "C"
        },
        {   "gene"        => "NDUFS8",
            "rsid"        => "rs1051806",
            "risk allele" => "T"
        },
        {   "gene"        => "UQCRC2",
            "rsid"        => "rs6497563",
            "risk allele" => "C"
        },
        {   "gene"        => "UQCRC2",
            "rsid"        => "rs4850",
            "risk allele" => "A"
        },
        {   "gene"        => "UQCRC2",
            "rsid"        => "rs11648723",
            "risk allele" => "T"
        },
        {   "gene"        => "UQCRC2",
            "rsid"        => "rs12922362",
            "risk allele" => "A"
        },
        {   "gene"        => "UQCRC2",
            "rsid"        => "rs2965803",
            "risk allele" => "T"
        },
    ],
    [   "OTHER IMMUNE FACTORS",
        {   "gene"        => "4q27 Region",
            "rsid"        => "rs6822844",
            "risk allele" => "T"
        },
        {   "gene"        => "APOE",
            "rsid"        => "rs429358",
            "risk allele" => "C"
        },
        {   "gene"        => "ATG16L1",
            "rsid"        => "rs10210302",
            "risk allele" => "T"
        },
        {   "gene"        => "GSDMB",
            "rsid"        => "rs7216389",
            "risk allele" => "T"
        },
        {   "gene"        => "HLA-DRB1",
            "rsid"        => "rs660895",
            "risk allele" => "G"
        },
        {   "gene"        => "IL5",
            "rsid"        => "rs2069812",
            "risk allele" => "A"
        },
        {   "gene"        => "IL-13",
            "rsid"        => "rs20541",
            "risk allele" => "A"
        },
        {   "gene"        => "IL4R Q576R",
            "rsid"        => "rs1801275",
            "risk allele" => "G"
        },
        {   "gene"        => "MeFV A744S",
            "rsid"        => "i4000409",
            "risk allele" => "A"
        },
        {   "gene"        => "MeFV E148Q",
            "rsid"        => "rs3743930",
            "risk allele" => "G"
        },
        {   "gene"        => "MeFV F479L",
            "rsid"        => "i4000403",
            "risk allele" => "C"
        },
        {   "gene"        => "MeFV K695R",
            "rsid"        => "i4000407",
            "risk allele" => "C"
        },
        {   "gene"        => "MeFV M680I",
            "rsid"        => "rs28940580",
            "risk allele" => "G"
        },
        {   "gene"        => "MeFV M694I",
            "rsid"        => "rs28940578",
            "risk allele" => "T"
        },
        {   "gene"        => "MeFV M694V",
            "rsid"        => "i4000406",
            "risk allele" => "C"
        },
        {   "gene"        => "MeFV P369S",
            "rsid"        => "rs11466023",
            "risk allele" => "A"
        },
        {   "gene"        => "MeFV R761H",
            "rsid"        => "i4000410",
            "risk allele" => "T"
        },
        {   "gene"        => "STAT4",
            "rsid"        => "rs10181656",
            "risk allele" => "G"
        },
        {   "gene"        => "TNF -308",
            "rsid"        => "rs1800629",
            "risk allele" => "A"
        },
        {   "gene"        => "TNF -238",
            "rsid"        => "rs361525",
            "risk allele" => "A"
        },
        {   "gene"        => "TYR (MeFV) V726A",
            "rsid"        => "rs28940879",
            "risk allele" => "A"
        },
    ],
    [   "SULFONOTRANSFERASE",
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs35728980",
            "risk allele" => "G"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs1801030",
            "risk allele" => "C"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs1042157",
            "risk allele" => "A"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs36043491",
            "risk allele" => "T"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs60749306",
            "risk allele" => "C"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs9282862",
            "risk allele" => "C"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs1042008",
            "risk allele" => "A"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs2925627",
            "risk allele" => "C"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs2925631",
            "risk allele" => "C"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs3020800",
            "risk allele" => "G"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs4149385",
            "risk allele" => "T"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs60701883",
            "risk allele" => "A"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs4149381",
            "risk allele" => "G"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs8057055",
            "risk allele" => "A"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs6498090",
            "risk allele" => "A"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs7193599",
            "risk allele" => "C"
        },
        {   "gene"        => "SULT1A1",
            "rsid"        => "rs7192559",
            "risk allele" => "T"
        },
        {   "gene"        => "SULT1A3",
            "rsid"        => "rs1059667",
            "risk allele" => "A"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs296366",
            "risk allele" => "T"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs296365",
            "risk allele" => "C"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs11569679",
            "risk allele" => "T"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs4149452",
            "risk allele" => "T"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs8113396",
            "risk allele" => "G"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs2547242",
            "risk allele" => "C"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs2910393",
            "risk allele" => "T"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs4149449",
            "risk allele" => "T"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs2547231",
            "risk allele" => "C"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs4149448",
            "risk allele" => "G"
        },
        {   "gene"        => "SULT2A1",
            "rsid"        => "rs11083907",
            "risk allele" => "A"
        },
    ]
);

while (<>) {
    next if /^#/;
    my ( $rsid, $chromosome, $position, $genotype ) = split;
    $genome{$rsid} = $genotype;
}

foreach (@SNPs) {
    foreach ( @{$_}[ 1 .. $#{$_} ] ) {
        for my $key ( keys $_ ) {
            $length{$key}
                = $length{$key} < length( $_->{$key} )
                    ? length( $_->{$key} )
                        : $length{$key};
        }
    }
}

foreach (@SNPs) {
    my $cat = shift @{$_};
    print "=" x ( ( ( 70 - length($cat) ) / 2 ) - 1 )
        . " $cat "
            . "=" x ( ( ( 70 - length($cat) ) / 2 ) - 1 ) . "\n";
    printf "%-$length{gene}s %-$length{rsid}s %-$length{'risk allele'}s %s\n",
        "Gene & Variation", "rsID #", "Risk Allele", "Your Alleles & Results";
    foreach ( @{$_} ) {
        printf
            "%-$length{gene}s %-$length{rsid}s %-$length{'risk allele'}s %-2s\t",
                $_->{"gene"},
                    $_->{"rsid"}, $_->{"risk allele"},
                        defined $genome{ $_->{"rsid"} }
                            ? $genome{ $_->{"rsid"} }
                                : "";
        if (!defined $genome{ $_->{"rsid"} }) {
        } elsif ($genome{ $_->{"rsid"} } eq "--") {
        } elsif (length($genome{ $_->{"rsid"} }) == 2) {
            print ((substr ($genome{ $_->{"rsid"} }, 0, 1) eq $_->{"risk allele"}) ? "+" : "-");
            print "/";
            print ((substr ($genome{ $_->{"rsid"} }, 1, 1) eq $_->{"risk allele"}) ? "+" : "-");
        } elsif (length($genome{ $_->{"rsid"} }) == 1) {
            print (($genome{ $_->{"rsid"} } eq $_->{"risk allele"}) ? "+" : "-");
        }
        print "\n";
    }
}
