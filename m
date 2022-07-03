Content-Type: multipart/mixed; boundary="===============1019344717968234477=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.19-r3 8/32] drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect_pwr.c:51:5: error: no previous prototype for '_wmt_detect_output_low'
Date: Sun, 03 Jul 2022 18:22:57 +0800
Message-ID: <202207031842.U2YAsTv7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1019344717968234477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect_pwr.c:5=
1:5: error: no previous prototype for '_wmt_detect_output_low' [-Werror=3Dm=
issing-prototypes]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.19-r3
head:   7d03f72e7be57030ee768e645b8f09e3cf8bbc40
commit: 38795507c8e76948a0f37e0234ef667513ba5f46 [8/32] mt6625l: include wi=
fi-code
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-s032-20220703 (https://download.01.org/0day-ci/archi=
ve/20220703/202207031842.U2YAsTv7-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/frank-w/BPI-R2-4.14/commit/38795507c8e76948a0f=
37e0234ef667513ba5f46
        git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R=
2-4.14
        git fetch --no-tags frank-w-bpi-r2-4.14 5.19-r3
        git checkout 38795507c8e76948a0f37e0234ef667513ba5f46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash arch/arm/kernel/ drivers/misc/mediatek/btif/common/ dr=
ivers/misc/mediatek/connectivity/common/common_detect/ drivers/misc/mediate=
k/connectivity/common/conn_soc/core/ drivers/misc/mediatek/connectivity/com=
mon/conn_soc/linux/pri/ drivers/misc/mediatek/connectivity/common/conn_soc/=
linux/pub/ drivers/misc/mediatek/connectivity/common/conn_soc/mt7623/ drive=
rs/misc/mediatek/connectivity/wlan/gen2/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or =
directory [-Wmissing-include-dirs]
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/mgmt/scan.h:269,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:237,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/dump.c:47:
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:152:1: warning: 'lstats_vendor_test_policy' defined but not used [-Wunuse=
d-const-variable=3D]
     152 | lstats_vendor_test_policy[LSTATS_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:140:1: warning: 'rtt_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
     140 | rtt_vendor_test_policy[RTT_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:120:1: warning: 'gscan_vendor_test_policy' defined but not used [-Wunused=
-const-variable=3D]
     120 | gscan_vendor_test_policy[GSCAN_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:93:1: warning: 'wifi_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
      93 | wifi_vendor_test_policy[WIFI_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_kal.h:543,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_os.h:594,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:171,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/dump.c:47:
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:935:=
21: warning: 'aucRateTableSize' defined but not used [-Wunused-const-variab=
le=3D]
     935 | static const UINT_8 aucRateTableSize[PREAMBLE_OPTION_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:878:=
21: warning: 'aucRateIndex2RateCode' defined but not used [-Wunused-const-v=
ariable=3D]
     878 | static const UINT_8 aucRateIndex2RateCode[PREAMBLE_OPTION_NUM][R=
ATE_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~~~~~~
--
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or =
directory [-Wmissing-include-dirs]
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c: In funct=
ion 'wlanSendCommand':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:2004:21: =
warning: variable 'prTxCtrl' set but not used [-Wunused-but-set-variable]
    2004 |         P_TX_CTRL_T prTxCtrl;
         |                     ^~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c: In funct=
ion 'wlanSendNicPowerCtrlCmd':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:2575:23: =
warning: variable 'prGlueInfo' set but not used [-Wunused-but-set-variable]
    2575 |         P_GLUE_INFO_T prGlueInfo;
         |                       ^~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c: In funct=
ion 'wlanProcessQueuedSwRfb':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:3270:21: =
warning: variable 'prRxCtrl' set but not used [-Wunused-but-set-variable]
    3270 |         P_RX_CTRL_T prRxCtrl;
         |                     ^~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:3269:21: =
warning: variable 'prTxCtrl' set but not used [-Wunused-but-set-variable]
    3269 |         P_TX_CTRL_T prTxCtrl;
         |                     ^~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c: At top l=
evel:
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:5431:1: w=
arning: no previous prototype for 'wlanoidQueryACSChannelList' [-Wmissing-p=
rototypes]
    5431 | wlanoidQueryACSChannelList(IN P_ADAPTER_T prAdapter,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/mgmt/scan.h:269,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:237,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/wlan_lib.c:967:
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:152:1: warning: 'lstats_vendor_test_policy' defined but not used [-Wunuse=
d-const-variable=3D]
     152 | lstats_vendor_test_policy[LSTATS_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:140:1: warning: 'rtt_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
     140 | rtt_vendor_test_policy[RTT_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:120:1: warning: 'gscan_vendor_test_policy' defined but not used [-Wunused=
-const-variable=3D]
     120 | gscan_vendor_test_policy[GSCAN_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:93:1: warning: 'wifi_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
      93 | wifi_vendor_test_policy[WIFI_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_kal.h:543,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_os.h:594,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:171,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/wlan_lib.c:967:
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:935:=
21: warning: 'aucRateTableSize' defined but not used [-Wunused-const-variab=
le=3D]
     935 | static const UINT_8 aucRateTableSize[PREAMBLE_OPTION_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:878:=
21: warning: 'aucRateIndex2RateCode' defined but not used [-Wunused-const-v=
ariable=3D]
     878 | static const UINT_8 aucRateIndex2RateCode[PREAMBLE_OPTION_NUM][R=
ATE_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~~~~~~
--
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or =
directory [-Wmissing-include-dirs]
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c: In funct=
ion 'wlanoidQueryBssidList':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c:1384:23: =
warning: variable 'prGlueInfo' set but not used [-Wunused-but-set-variable]
    1384 |         P_GLUE_INFO_T prGlueInfo;
         |                       ^~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c: In funct=
ion 'wlanoidSetBssid':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c:1704:16: =
warning: variable 'i4Idx' set but not used [-Wunused-but-set-variable]
    1704 |         INT_32 i4Idx =3D -1;
         |                ^~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c: In funct=
ion 'wlanoidSetSsid':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c:1963:16: =
warning: variable 'i4Idx' set but not used [-Wunused-but-set-variable]
    1963 |         INT_32 i4Idx =3D -1, i4MaxRSSI =3D INT_MIN;
         |                ^~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c: In funct=
ion 'wlanoidSetInfrastructureMode':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c:2218:23: =
warning: variable 'prGlueInfo' set but not used [-Wunused-but-set-variable]
    2218 |         P_GLUE_INFO_T prGlueInfo;
         |                       ^~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c: In funct=
ion 'wlanoidSetAuthMode':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c:2388:23: =
warning: variable 'prGlueInfo' set but not used [-Wunused-but-set-variable]
    2388 |         P_GLUE_INFO_T prGlueInfo;
         |                       ^~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c: In funct=
ion 'wlanoidSetEncryptionStatus':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c:3496:23: =
warning: variable 'prGlueInfo' set but not used [-Wunused-but-set-variable]
    3496 |         P_GLUE_INFO_T prGlueInfo;
         |                       ^~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c: In funct=
ion 'wlanoidSetSwCtrlWrite':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c:5428:23: =
warning: variable 'prGlueInfo' set but not used [-Wunused-but-set-variable]
    5428 |         P_GLUE_INFO_T prGlueInfo;
         |                       ^~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c: In funct=
ion 'wlanoidSetGSCNAction':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c:10356:23:=
 warning: variable 'prScanInfo' set but not used [-Wunused-but-set-variable]
   10356 |         P_SCAN_INFO_T prScanInfo;
         |                       ^~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/mgmt/scan.h:269,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:237,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/wlan_oid.c:1061:
   At top level:
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:152:1: warning: 'lstats_vendor_test_policy' defined but not used [-Wunuse=
d-const-variable=3D]
     152 | lstats_vendor_test_policy[LSTATS_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:140:1: warning: 'rtt_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
     140 | rtt_vendor_test_policy[RTT_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:120:1: warning: 'gscan_vendor_test_policy' defined but not used [-Wunused=
-const-variable=3D]
     120 | gscan_vendor_test_policy[GSCAN_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:93:1: warning: 'wifi_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
      93 | wifi_vendor_test_policy[WIFI_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_kal.h:543,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_os.h:594,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:171,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/wlan_oid.c:1061:
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:935:=
21: warning: 'aucRateTableSize' defined but not used [-Wunused-const-variab=
le=3D]
     935 | static const UINT_8 aucRateTableSize[PREAMBLE_OPTION_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:878:=
21: warning: 'aucRateIndex2RateCode' defined but not used [-Wunused-const-v=
ariable=3D]
     878 | static const UINT_8 aucRateIndex2RateCode[PREAMBLE_OPTION_NUM][R=
ATE_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~~~~~~
--
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or =
directory [-Wmissing-include-dirs]
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowCmdReadRSSI':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:997:25: w=
arning: variable 'prBowReadRSSI' set but not used [-Wunused-but-set-variabl=
e]
     997 |         P_BOW_READ_RSSI prBowReadRSSI;
         |                         ^~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowCmdReadLinkQuality':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:1029:33: =
warning: variable 'prBowReadLinkQuality' set but not used [-Wunused-but-set=
-variable]
    1029 |         P_BOW_READ_LINK_QUALITY prBowReadLinkQuality;
         |                                 ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'wlanbowCmdEventSetSetupConnection':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:1492:26: =
warning: variable 'prBowFsmInfo' set but not used [-Wunused-but-set-variabl=
e]
    1492 |         P_BOW_FSM_INFO_T prBowFsmInfo;
         |                          ^~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowStopping':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:1650:22: =
warning: variable 'prBowBssInfo' set but not used [-Wunused-but-set-variabl=
e]
    1650 |         P_BSS_INFO_T prBowBssInfo;
         |                      ^~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:1649:26: =
warning: variable 'prBowFsmInfo' set but not used [-Wunused-but-set-variabl=
e]
    1649 |         P_BOW_FSM_INFO_T prBowFsmInfo;
         |                          ^~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowValidateProbeReq':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:1953:26: =
warning: variable 'prBowFsmInfo' set but not used [-Wunused-but-set-variabl=
e]
    1953 |         P_BOW_FSM_INFO_T prBowFsmInfo;
         |                          ^~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowResponderScan':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:2051:22: =
warning: variable 'prBssInfo' set but not used [-Wunused-but-set-variable]
    2051 |         P_BSS_INFO_T prBssInfo;
         |                      ^~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowFsmRunEventJoinComplete':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:2356:22: =
warning: variable 'prBssInfo' set but not used [-Wunused-but-set-variable]
    2356 |         P_BSS_INFO_T prBssInfo;
         |                      ^~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowRunEventAAAComplete':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:2617:26: =
warning: variable 'prBowFsmInfo' set but not used [-Wunused-but-set-variabl=
e]
    2617 |         P_BOW_FSM_INFO_T prBowFsmInfo;
         |                          ^~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowRunEventRxDeAuth':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:2656:22: =
warning: variable 'prBowBssInfo' set but not used [-Wunused-but-set-variabl=
e]
    2656 |         P_BSS_INFO_T prBowBssInfo;
         |                      ^~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowRunEventChGrant':
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:2972:22: =
warning: variable 'prBowBssInfo' set but not used [-Wunused-but-set-variabl=
e]
    2972 |         P_BSS_INFO_T prBowBssInfo;
         |                      ^~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c: In funct=
ion 'bowGetBowTableContent':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:3267:100:=
 warning: parameter 'prBowTable' set but not used [-Wunused-but-set-paramet=
er]
    3267 | BOOLEAN bowGetBowTableContent(IN P_ADAPTER_T prAdapter, IN UINT_=
8 ucBowTableIdx, OUT P_BOW_TABLE_T prBowTable)
         |                                                                 =
                     ~~~~~~~~~~~~~~^~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/mgmt/scan.h:269,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:237,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/wlan_bow.c:319:
   At top level:
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:152:1: warning: 'lstats_vendor_test_policy' defined but not used [-Wunuse=
d-const-variable=3D]
     152 | lstats_vendor_test_policy[LSTATS_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:140:1: warning: 'rtt_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
     140 | rtt_vendor_test_policy[RTT_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:120:1: warning: 'gscan_vendor_test_policy' defined but not used [-Wunused=
-const-variable=3D]
     120 | gscan_vendor_test_policy[GSCAN_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:93:1: warning: 'wifi_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
      93 | wifi_vendor_test_policy[WIFI_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_kal.h:543,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_os.h:594,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:171,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/wlan_bow.c:319:
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:935:=
21: warning: 'aucRateTableSize' defined but not used [-Wunused-const-variab=
le=3D]
     935 | static const UINT_8 aucRateTableSize[PREAMBLE_OPTION_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:878:=
21: warning: 'aucRateIndex2RateCode' defined but not used [-Wunused-const-v=
ariable=3D]
     878 | static const UINT_8 aucRateIndex2RateCode[PREAMBLE_OPTION_NUM][R=
ATE_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~~~~~~
--
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or =
directory [-Wmissing-include-dirs]
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_p2p.c: In funct=
ion 'wlanoidSetRemoveP2PKey':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_p2p.c:487:17: w=
arning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     487 |                 ; /* return WLAN_STATUS_NOT_ACCEPTED; */
         |                 ^
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_p2p.c: In funct=
ion 'wlanoidSetP2pSupplicantVersion':
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_p2p.c:1527:16: =
warning: variable 'ucVersionNum' set but not used [-Wunused-but-set-variabl=
e]
    1527 |         UINT_8 ucVersionNum;
         |                ^~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/mgmt/scan.h:269,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:237,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/wlan_p2p.c:217:
   At top level:
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:152:1: warning: 'lstats_vendor_test_policy' defined but not used [-Wunuse=
d-const-variable=3D]
     152 | lstats_vendor_test_policy[LSTATS_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:140:1: warning: 'rtt_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
     140 | rtt_vendor_test_policy[RTT_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:120:1: warning: 'gscan_vendor_test_policy' defined but not used [-Wunused=
-const-variable=3D]
     120 | gscan_vendor_test_policy[GSCAN_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:93:1: warning: 'wifi_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
      93 | wifi_vendor_test_policy[WIFI_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_kal.h:543,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_os.h:594,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:171,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/commo=
n/wlan_p2p.c:217:
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:935:=
21: warning: 'aucRateTableSize' defined but not used [-Wunused-const-variab=
le=3D]
     935 | static const UINT_8 aucRateTableSize[PREAMBLE_OPTION_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:878:=
21: warning: 'aucRateIndex2RateCode' defined but not used [-Wunused-const-v=
ariable=3D]
     878 | static const UINT_8 aucRateIndex2RateCode[PREAMBLE_OPTION_NUM][R=
ATE_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~~~~~~
--
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or =
directory [-Wmissing-include-dirs]
   drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_tx.c: In function '=
nicTxReturnMsduInfoProfiling':
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_tx.c:1082:40: warni=
ng: variable 'ucNetIndex' set but not used [-Wunused-but-set-variable]
    1082 |                                 UINT_8 ucNetIndex;
         |                                        ^~~~~~~~~~
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_tx.c:1010:17: warni=
ng: variable 'u4PktPrintPeriod' set but not used [-Wunused-but-set-variable]
    1010 |         UINT_32 u4PktPrintPeriod =3D 0;
         |                 ^~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/mgmt/scan.h:269,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:237,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/nic/n=
ic_tx.c:426:
   At top level:
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:152:1: warning: 'lstats_vendor_test_policy' defined but not used [-Wunuse=
d-const-variable=3D]
     152 | lstats_vendor_test_policy[LSTATS_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:140:1: warning: 'rtt_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
     140 | rtt_vendor_test_policy[RTT_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:120:1: warning: 'gscan_vendor_test_policy' defined but not used [-Wunused=
-const-variable=3D]
     120 | gscan_vendor_test_policy[GSCAN_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:93:1: warning: 'wifi_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
      93 | wifi_vendor_test_policy[WIFI_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_kal.h:543,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_os.h:594,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:171,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/nic/n=
ic_tx.c:426:
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:935:=
21: warning: 'aucRateTableSize' defined but not used [-Wunused-const-variab=
le=3D]
     935 | static const UINT_8 aucRateTableSize[PREAMBLE_OPTION_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:878:=
21: warning: 'aucRateIndex2RateCode' defined but not used [-Wunused-const-v=
ariable=3D]
     878 | static const UINT_8 aucRateIndex2RateCode[PREAMBLE_OPTION_NUM][R=
ATE_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~~~~~~
--
>> cc1: warning: drivers/misc/mediatek/base/power/include: No such file or =
directory [-Wmissing-include-dirs]
   drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_rx.c: In function '=
nicRxProcessGOBroadcastPkt':
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_rx.c:1337:21: warni=
ng: variable 'prTxCtrl' set but not used [-Wunused-but-set-variable]
    1337 |         P_TX_CTRL_T prTxCtrl;
         |                     ^~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_rx.c: In function '=
nicRxProcessEventPacket':
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_rx.c:2371:32: warni=
ng: variable 'realnum' set but not used [-Wunused-but-set-variable]
    2371 |                         UINT_8 realnum =3D 0;
         |                                ^~~~~~~
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_rx.c:1727:23: warni=
ng: variable 'prGlueInfo' set but not used [-Wunused-but-set-variable]
    1727 |         P_GLUE_INFO_T prGlueInfo;
         |                       ^~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_rx.c: In function '=
nicRxSDIOAggReceiveRFBs':
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_rx.c:3078:23: warni=
ng: variable 'prSDIOCtrl' set but not used [-Wunused-but-set-variable]
    3078 |         P_SDIO_CTRL_T prSDIOCtrl;
         |                       ^~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/mgmt/scan.h:269,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:237,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/nic/n=
ic_rx.c:812:
   At top level:
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:152:1: warning: 'lstats_vendor_test_policy' defined but not used [-Wunuse=
d-const-variable=3D]
     152 | lstats_vendor_test_policy[LSTATS_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:140:1: warning: 'rtt_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
     140 | rtt_vendor_test_policy[RTT_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:120:1: warning: 'gscan_vendor_test_policy' defined but not used [-Wunused=
-const-variable=3D]
     120 | gscan_vendor_test_policy[GSCAN_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_vendor.=
h:93:1: warning: 'wifi_vendor_test_policy' defined but not used [-Wunused-c=
onst-variable=3D]
      93 | wifi_vendor_test_policy[WIFI_SUBCMD_MAX + 1] =3D {
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_kal.h:543,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/os/li=
nux/include/gl_os.h:594,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/inclu=
de/precomp.h:171,
                    from drivers/misc/mediatek/connectivity/wlan/gen2/nic/n=
ic_rx.c:812:
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:935:=
21: warning: 'aucRateTableSize' defined but not used [-Wunused-const-variab=
le=3D]
     935 | static const UINT_8 aucRateTableSize[PREAMBLE_OPTION_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~
   drivers/misc/mediatek/connectivity/wlan/gen2/include/nic/wlan_def.h:878:=
21: warning: 'aucRateIndex2RateCode' defined but not used [-Wunused-const-v=
ariable=3D]
     878 | static const UINT_8 aucRateIndex2RateCode[PREAMBLE_OPTION_NUM][R=
ATE_NUM] =3D {
         |                     ^~~~~~~~~~~~~~~~~~~~~
..


sparse warnings: (new ones prefixed by >>)
>> drivers/misc/mediatek/btif/common/btif_dma_plat.c:1289:35: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1289:35: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1289:35: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1270:29: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1270:29: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1270:29: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:555:31: sparse: sparse=
: incorrect type in argument 1 (different address spaces) @@     expected v=
oid const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:555:31: sparse:     ex=
pected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:555:31: sparse:     go=
t unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:557:17: sparse: sparse=
: incorrect type in argument 1 (different address spaces) @@     expected v=
oid const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:557:17: sparse:     ex=
pected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:557:17: sparse:     go=
t unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:557:17: sparse: sparse=
: incorrect type in argument 1 (different address spaces) @@     expected v=
oid const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:557:17: sparse:     ex=
pected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:557:17: sparse:     go=
t unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:523:31: sparse: sparse=
: incorrect type in argument 1 (different address spaces) @@     expected v=
oid const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:523:31: sparse:     ex=
pected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:523:31: sparse:     go=
t unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:525:17: sparse: sparse=
: incorrect type in argument 1 (different address spaces) @@     expected v=
oid const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:525:17: sparse:     ex=
pected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:525:17: sparse:     go=
t unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:525:17: sparse: sparse=
: incorrect type in argument 1 (different address spaces) @@     expected v=
oid const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:525:17: sparse:     ex=
pected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:525:17: sparse:     go=
t unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1191:20: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1191:20: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1191:20: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1192:18: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1192:18: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1192:18: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1193:16: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1193:16: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1193:16: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1194:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1194:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1194:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1195:15: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1195:15: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1195:15: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1196:15: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1196:15: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1196:15: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1197:19: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1197:19: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1197:19: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1198:22: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1198:22: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1198:22: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1213:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1213:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1213:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1215:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1215:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1215:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1216:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1216:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1216:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1218:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1218:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1218:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1220:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1220:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1220:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1222:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1222:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1222:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1224:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1224:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1224:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1226:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1226:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1226:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1115:20: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1115:20: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1115:20: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1116:18: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1116:18: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1116:18: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1117:16: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1117:16: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1117:16: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1118:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1118:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1118:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1119:15: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1119:15: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1119:15: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1120:15: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1120:15: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1120:15: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1121:19: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1121:19: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1121:19: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1122:22: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1122:22: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1122:22: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1137:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1137:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1137:17: sparse:     g=
ot unsigned int *
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1139:17: sparse: spars=
e: incorrect type in argument 1 (different address spaces) @@     expected =
void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_dma_plat.c:1139:17: sparse:     e=
xpected void const volatile [noderef] __iomem *addr
--
   drivers/misc/mediatek/btif/common/btif_plat.c: note: in included file:
   drivers/misc/mediatek/btif/common/plat_inc/btif_priv.h:28:12: sparse: sp=
arse: symbol 'clk_btif_apdma' was not declared. Should it be static?
   drivers/misc/mediatek/btif/common/plat_inc/btif_priv.h:29:12: sparse: sp=
arse: symbol 'clk_btif' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/btif_plat.c:30:18: sparse: sparse: sym=
bol 'mtk_btif_irq' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/btif_plat.c:49:19: sparse: sparse: sym=
bol 'mtk_btif' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/btif_plat.c:835:15: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:835:15: sparse:     expect=
ed void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:835:15: sparse:     got un=
signed int *
>> drivers/misc/mediatek/btif/common/btif_plat.c:838:34: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
const volatile [noderef] __iomem *addr @@     got unsigned char * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:838:34: sparse:     expect=
ed void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:838:34: sparse:     got un=
signed char *
   drivers/misc/mediatek/btif/common/btif_plat.c:855:23: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:855:23: sparse:     expect=
ed void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:855:23: sparse:     got un=
signed int *
   drivers/misc/mediatek/btif/common/btif_plat.c:898:15: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:898:15: sparse:     expect=
ed void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:898:15: sparse:     got un=
signed int *
   drivers/misc/mediatek/btif/common/btif_plat.c:771:15: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:771:15: sparse:     expect=
ed void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:771:15: sparse:     got un=
signed int *
   drivers/misc/mediatek/btif/common/btif_plat.c:789:23: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:789:23: sparse:     expect=
ed void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:789:23: sparse:     got un=
signed int *
   drivers/misc/mediatek/btif/common/btif_plat.c:1153:15: sparse: sparse: i=
ncorrect type in argument 1 (different address spaces) @@     expected void=
 const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:1153:15: sparse:     expec=
ted void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:1153:15: sparse:     got u=
nsigned int *
   drivers/misc/mediatek/btif/common/btif_plat.c:1154:18: sparse: sparse: i=
ncorrect type in argument 1 (different address spaces) @@     expected void=
 const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:1154:18: sparse:     expec=
ted void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:1154:18: sparse:     got u=
nsigned int *
   drivers/misc/mediatek/btif/common/btif_plat.c:1160:32: sparse: sparse: i=
ncorrect type in argument 1 (different address spaces) @@     expected void=
 const volatile [noderef] __iomem *addr @@     got unsigned char * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:1160:32: sparse:     expec=
ted void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:1160:32: sparse:     got u=
nsigned char *
   drivers/misc/mediatek/btif/common/btif_plat.c:1231:15: sparse: sparse: i=
ncorrect type in argument 1 (different address spaces) @@     expected void=
 const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:1231:15: sparse:     expec=
ted void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:1231:15: sparse:     got u=
nsigned int *
   drivers/misc/mediatek/btif/common/btif_plat.c:1234:26: sparse: sparse: i=
ncorrect type in argument 1 (different address spaces) @@     expected void=
 const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:1234:26: sparse:     expec=
ted void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:1234:26: sparse:     got u=
nsigned int *
   drivers/misc/mediatek/btif/common/btif_plat.c:1388:9: sparse: sparse: in=
correct type in argument 1 (different address spaces) @@     expected void =
const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/misc/mediatek/btif/common/btif_plat.c:1388:9: sparse:     expect=
ed void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/btif/common/btif_plat.c:1388:9: sparse:     got un=
signed int *
--
>> drivers/misc/mediatek/btif/common/mtk_btif.c:150:18: sparse: sparse: sym=
bol 'g_btif_setting' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/mtk_btif.c:202:27: sparse: sparse: sym=
bol 'apbtif_of_ids' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/mtk_btif.c:208:25: sparse: sparse: sym=
bol 'mtk_btif_drv_pm_ops' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/mtk_btif.c:214:24: sparse: sparse: sym=
bol 'mtk_btif_dev_drv' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/mtk_btif.c:434:7: sparse: sparse: symb=
ol 'btif_dev' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/mtk_btif.c:435:14: sparse: sparse: sym=
bol 'p_btif_class' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/mtk_btif.c:436:15: sparse: sparse: sym=
bol 'p_btif_dev' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/mtk_btif.c:437:12: sparse: sparse: sym=
bol 'p_btif_dev_name' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/mtk_btif.c:469:17: sparse: sparse: inc=
orrect type in initializer (different base types) @@     expected restricte=
d __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/misc/mediatek/btif/common/mtk_btif.c:469:17: sparse:     expecte=
d restricted __poll_t ( *poll )( ... )
   drivers/misc/mediatek/btif/common/mtk_btif.c:469:17: sparse:     got uns=
igned int ( * )( ... )
>> drivers/misc/mediatek/btif/common/mtk_btif.c:459:30: sparse: sparse: sym=
bol 'mtk_btif_fops' was not declared. Should it be static?
>> drivers/misc/mediatek/btif/common/mtk_btif.c:508:52: sparse: sparse: Usi=
ng plain integer as NULL pointer
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_pwr_mgt.c:309:9: sp=
arse: sparse: symbol 'u4OriRegValue' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_pwr_mgt.c:377:41: s=
parse: sparse: incorrect type in argument 1 (different address spaces) @@  =
   expected void const volatile [noderef] __iomem *addr @@     got unsigned=
 int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_pwr_mgt.c:377:41: s=
parse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic_pwr_mgt.c:377:41: s=
parse:     got unsigned int volatile [usertype] *
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/platform.c:201:16:=
 sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/platform.c:202:19:=
 sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/platform.c:207:9: =
sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/platform.c:207:9: =
sparse: sparse: incorrect type in argument 2 (different address spaces) @@ =
    expected void const * @@     got restricted __be32 [noderef] __rcu * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/platform.c:207:9: =
sparse:     expected void const *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/platform.c:207:9: =
sparse:     got restricted __be32 [noderef] __rcu *
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:102:=
6: sparse: sparse: symbol 'p2pCheckInterfaceName' was not declared. Should =
it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:151:=
16: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:152:=
19: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:157:=
9: sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:157:=
9: sparse: sparse: incorrect type in argument 2 (different address spaces) =
@@     expected void const * @@     got restricted __be32 [noderef] __rcu *=
 @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:157:=
9: sparse:     expected void const *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:157:=
9: sparse:     got restricted __be32 [noderef] __rcu *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:266:=
16: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:267:=
19: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:272:=
9: sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:272:=
9: sparse: sparse: incorrect type in argument 2 (different address spaces) =
@@     expected void const * @@     got restricted __be32 [noderef] __rcu *=
 @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:272:=
9: sparse:     expected void const *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_init.c:272:=
9: sparse:     got restricted __be32 [noderef] __rcu *
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:510:40: =
sparse: sparse: incorrect type in argument 2 (different address spaces) @@ =
    expected void const [noderef] __user *from @@     got char const *buffe=
r @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:510:40: =
sparse:     expected void const [noderef] __user *from
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:510:40: =
sparse:     got char const *buffer
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:542:23: =
sparse: sparse: incorrect type in initializer (incompatible argument 2 (dif=
ferent address spaces)) @@     expected int ( *proc_write )( ... ) @@     g=
ot int ( * )( ... ) @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:542:23: =
sparse:     expected int ( *proc_write )( ... )
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:542:23: =
sparse:     got int ( * )( ... )
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:590:40: =
sparse: sparse: incorrect type in argument 2 (different address spaces) @@ =
    expected void const [noderef] __user *from @@     got char const *buffe=
r @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:590:40: =
sparse:     expected void const [noderef] __user *from
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:590:40: =
sparse:     got char const *buffer
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:626:23: =
sparse: sparse: incorrect type in initializer (incompatible argument 2 (dif=
ferent address spaces)) @@     expected int ( *proc_write )( ... ) @@     g=
ot int ( * )( ... ) @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:626:23: =
sparse:     expected int ( *proc_write )( ... )
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:626:23: =
sparse:     got int ( * )( ... )
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:660:23: =
sparse: sparse: incorrect type in initializer (incompatible argument 2 (dif=
ferent address spaces)) @@     expected int ( *proc_write )( ... ) @@     g=
ot int ( * )( ... ) @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:660:23: =
sparse:     expected int ( *proc_write )( ... )
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:660:23: =
sparse:     got int ( * )( ... )
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_proc.c:712:11: =
sparse: sparse: symbol 'gCoexBuf1' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_bow.c:256:17: s=
parse: sparse: incorrect type in initializer (different base types) @@     =
expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )=
( ... ) @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_bow.c:256:17: s=
parse:     expected restricted __poll_t ( *poll )( ... )
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_bow.c:256:17: s=
parse:     got unsigned int ( * )( ... )
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_bow.c:347:17: s=
parse: sparse: symbol 'arBowCmdTable' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1470=
:20: sparse: sparse: incorrect type in argument 1 (different address spaces=
) @@     expected void const volatile [noderef] __iomem *addr @@     got un=
signed int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1470=
:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1470=
:20: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1472=
:20: sparse: sparse: incorrect type in argument 1 (different address spaces=
) @@     expected void const volatile [noderef] __iomem *addr @@     got un=
signed int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1472=
:20: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1472=
:20: sparse:     got unsigned int volatile [usertype] *
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1477=
:9: sparse: sparse: incorrect type in argument 2 (different address spaces)=
 @@     expected void volatile [noderef] __iomem *addr @@     got unsigned =
int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1477=
:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1477=
:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1243=
:17: sparse: sparse: incorrect type in argument 2 (different address spaces=
) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned=
 int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1243=
:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1243=
:17: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1247=
:9: sparse: sparse: incorrect type in argument 2 (different address spaces)=
 @@     expected void volatile [noderef] __iomem *addr @@     got unsigned =
int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1247=
:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1247=
:9: sparse:     got unsigned int volatile [usertype] *
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:311:=
24: sparse: sparse: symbol 'MtkPltmAhb_driver' was not declared. Should it =
be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:445:=
33: sparse: sparse: incorrect type in assignment (different address spaces)=
 @@     expected unsigned char [usertype] *[usertype] HifRegBaseAddr @@    =
 got void [noderef] __iomem * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:445:=
33: sparse:     expected unsigned char [usertype] *[usertype] HifRegBaseAddr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:445:=
33: sparse:     got void [noderef] __iomem *
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:446:=
33: sparse: sparse: incorrect type in assignment (different address spaces)=
 @@     expected unsigned char [usertype] *[usertype] McuRegBaseAddr @@    =
 got void [noderef] __iomem * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:446:=
33: sparse:     expected unsigned char [usertype] *[usertype] McuRegBaseAddr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:446:=
33: sparse:     got void [noderef] __iomem *
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:452:=
35: sparse: sparse: Using plain integer as NULL pointer
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:459:=
35: sparse: sparse: incorrect type in argument 1 (different address spaces)=
 @@     expected void const volatile [noderef] __iomem *addr @@     got uns=
igned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:459:=
35: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:459:=
35: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:521:=
35: sparse: sparse: incorrect type in argument 1 (different address spaces)=
 @@     expected void volatile [noderef] __iomem *iomem_cookie @@     got u=
nsigned char [usertype] *[usertype] HifRegBaseAddr @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:521:=
35: sparse:     expected void volatile [noderef] __iomem *iomem_cookie
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:521:=
35: sparse:     got unsigned char [usertype] *[usertype] HifRegBaseAddr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:522:=
35: sparse: sparse: incorrect type in argument 1 (different address spaces)=
 @@     expected void volatile [noderef] __iomem *iomem_cookie @@     got u=
nsigned char [usertype] *[usertype] DmaRegBaseAddr @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:522:=
35: sparse:     expected void volatile [noderef] __iomem *iomem_cookie
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:522:=
35: sparse:     got unsigned char [usertype] *[usertype] DmaRegBaseAddr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:523:=
35: sparse: sparse: incorrect type in argument 1 (different address spaces)=
 @@     expected void volatile [noderef] __iomem *iomem_cookie @@     got u=
nsigned char [usertype] *[usertype] McuRegBaseAddr @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:523:=
35: sparse:     expected void volatile [noderef] __iomem *iomem_cookie
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:523:=
35: sparse:     got unsigned char [usertype] *[usertype] McuRegBaseAddr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:805:=
21: sparse: sparse: incorrect type in argument 1 (different address spaces)=
 @@     expected void const volatile [noderef] __iomem *addr @@     got uns=
igned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:805:=
21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:805:=
21: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:837:=
9: sparse: sparse: incorrect type in argument 2 (different address spaces) =
@@     expected void volatile [noderef] __iomem *addr @@     got unsigned i=
nt volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:837:=
9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:837:=
9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:889:=
21: sparse: sparse: incorrect type in argument 1 (different address spaces)=
 @@     expected void const volatile [noderef] __iomem *addr @@     got uns=
igned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:889:=
21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:889:=
21: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:891:=
17: sparse: sparse: incorrect type in argument 2 (different address spaces)=
 @@     expected void volatile [noderef] __iomem *addr @@     got unsigned =
int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:891:=
17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:891:=
17: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:997:=
25: sparse: sparse: incorrect type in argument 2 (different address spaces)=
 @@     expected void volatile [noderef] __iomem *addr @@     got unsigned =
int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:997:=
25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:997:=
25: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1019=
:36: sparse: sparse: incorrect type in argument 1 (different address spaces=
) @@     expected void const volatile [noderef] __iomem *addr @@     got un=
signed int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1019=
:36: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1019=
:36: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1024=
:25: sparse: sparse: incorrect type in argument 2 (different address spaces=
) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned=
 int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1024=
:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1024=
:25: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1075=
:21: sparse: sparse: incorrect type in argument 1 (different address spaces=
) @@     expected void const volatile [noderef] __iomem *addr @@     got un=
signed int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1075=
:21: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1075=
:21: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1077=
:17: sparse: sparse: incorrect type in argument 2 (different address spaces=
) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned=
 int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1077=
:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1077=
:17: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1170=
:25: sparse: sparse: incorrect type in argument 2 (different address spaces=
) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned=
 int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1170=
:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1170=
:25: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1195=
:25: sparse: sparse: incorrect type in argument 2 (different address spaces=
) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned=
 int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1195=
:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1195=
:25: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1200=
:25: sparse: sparse: incorrect type in argument 2 (different address spaces=
) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned=
 int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1200=
:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1200=
:25: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1637=
:17: sparse: sparse: incorrect type in argument 1 (different address spaces=
) @@     expected void const volatile [noderef] __iomem *addr @@     got un=
signed int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1637=
:17: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/ahb.c:1637=
:17: sparse:     got unsigned int volatile [usertype] *
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_kal.c:1038:=
75: sparse: sparse: incorrect type in argument 6 (different base types) @@ =
    expected unsigned int [usertype] flags @@     got restricted gfp_t @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_kal.c:1038:=
75: sparse:     expected unsigned int [usertype] flags
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_p2p_kal.c:1038:=
75: sparse:     got restricted gfp_t
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:976:14: s=
parse: sparse: symbol 'aucPriorityParam2TC' was not declared. Should it be =
static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:1017:22: =
sparse: sparse: symbol 'apfnOidSetHandlerWOHwAccess' was not declared. Shou=
ld it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:1026:22: =
sparse: sparse: symbol 'apfnOidQueryHandlerWOHwAccess' was not declared. Sh=
ould it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:1045:22: =
sparse: sparse: symbol 'apfnOidSetHandlerAllowedInRFTest' was not declared.=
 Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:1054:22: =
sparse: sparse: symbol 'apfnOidQueryHandlerAllowedInRFTest' was not declare=
d. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:1062:22: =
sparse: sparse: symbol 'apfnOidWOTimeoutCheck' was not declared. Should it =
be static?
   drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_lib.c:1167:17: =
sparse: sparse: memset with byte count of 213740
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:1580:31:=
 sparse: sparse: cast removes address space '__user' of expression
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:2536:35:=
 sparse: sparse: mixing different enum types:
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:2536:35:=
 sparse:    unsigned int enum _ENUM_ACPI_STATE_T
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:2536:35:=
 sparse:    unsigned int enum _PARAM_DEVICE_POWER_STATE
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:3327:28:=
 sparse: sparse: cast removes address space '__user' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:3328:28:=
 sparse: sparse: cast removes address space '__user' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:3538:58:=
 sparse: sparse: cast removes address space '__user' of expression
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:3538:58:=
 sparse: sparse: incorrect type in argument 2 (different address spaces) @@=
     expected void const [noderef] __user *from @@     got unsigned char * =
@@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:3538:58:=
 sparse:     expected void const [noderef] __user *from
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:3538:58:=
 sparse:     got unsigned char *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:3539:46:=
 sparse: sparse: cast removes address space '__user' of expression
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:1417:49:=
 sparse: sparse: cast truncates bits from constant value (100 becomes 0)
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext.c:1418:49:=
 sparse: sparse: cast truncates bits from constant value (100 becomes 0)
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:591:=
45: sparse: sparse: incorrect type in assignment (different base types) @@ =
    expected unsigned short [addressable] [assigned] [usertype] u2CapInfo @=
@     got restricted __le16 const [usertype] cap_info @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:591:=
45: sparse:     expected unsigned short [addressable] [assigned] [usertype]=
 u2CapInfo
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:591:=
45: sparse:     got restricted __le16 const [usertype] cap_info
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:593:=
50: sparse: sparse: incorrect type in assignment (different base types) @@ =
    expected unsigned short [addressable] [assigned] [usertype] u2ExtHtCapI=
nfo @@     got restricted __le16 const [usertype] extended_ht_cap_info @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:593:=
50: sparse:     expected unsigned short [addressable] [assigned] [usertype]=
 u2ExtHtCapInfo
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:593:=
50: sparse:     got restricted __le16 const [usertype] extended_ht_cap_info
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:594:=
49: sparse: sparse: incorrect type in assignment (different base types) @@ =
    expected unsigned int [addressable] [assigned] [usertype] u4TxBfCapInfo=
 @@     got restricted __le32 const [usertype] tx_BF_cap_info @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:594:=
49: sparse:     expected unsigned int [addressable] [assigned] [usertype] u=
4TxBfCapInfo
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:594:=
49: sparse:     got restricted __le32 const [usertype] tx_BF_cap_info
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:598:=
52: sparse: sparse: incorrect type in assignment (different base types) @@ =
    expected unsigned short [addressable] [assigned] [usertype] u2RxHighest=
 @@     got restricted __le16 const [usertype] rx_highest @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:598:=
52: sparse:     expected unsigned short [addressable] [assigned] [usertype]=
 u2RxHighest
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:598:=
52: sparse:     got restricted __le16 const [usertype] rx_highest
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:2406=
:1: sparse: sparse: symbol 'mtk_cfg80211_testmode_get_link_detection' was n=
ot declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:2581=
:1: sparse: sparse: symbol 'mtk_cfg80211_testmode_set_poorlink_param' was n=
ot declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_cfg80211.c:2702=
:43: sparse: sparse: dubious: x & !y
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/nic.c:643:14: sparse: s=
parse: symbol 'aucPhyCfg2PhyTypeSet' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:855=
:1: sparse: sparse: symbol 'scanEnvResult' was not declared. Should it be s=
tatic?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:129=
3:8: sparse: sparse: symbol 'gucBufDbgCode' was not declared. Should it be =
static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:156=
2:60: sparse: sparse: incorrect type in initializer (different address spac=
es) @@     expected signed int [usertype] *setting @@     got void [noderef=
] __user *pointer @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:156=
2:60: sparse:     expected signed int [usertype] *setting
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:156=
2:60: sparse:     got void [noderef] __user *pointer
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:184=
9:30: sparse: sparse: cast removes address space '__user' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:195=
3:30: sparse: sparse: cast removes address space '__user' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:239=
2:9: sparse: sparse: cast removes address space '__user' of expression
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:240=
6:53: sparse: sparse: incorrect type in argument 1 (different address space=
s) @@     expected unsigned char [usertype] *InStr @@     got void [noderef=
] __user *pointer @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:240=
6:53: sparse:     expected unsigned char [usertype] *InStr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:240=
6:53: sparse:     got void [noderef] __user *pointer
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:266=
3:5: sparse: sparse: symbol 'priv_driver_set_chip_config' was not declared.=
 Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_wext_priv.c:272=
2:5: sparse: sparse: symbol 'priv_driver_set_miracast' was not declared. Sh=
ould it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:102:12: sparse: sparse: symbol 'g_clk_wifi_pdma' was not declared. =
Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:244:18: sparse: sparse: incorrect type in argument 1 (different add=
ress spaces) @@     expected void const volatile [noderef] __iomem *addr @@=
     got unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:244:18: sparse:     expected void const volatile [noderef] __iomem =
*addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:244:18: sparse:     got unsigned int volatile [usertype] *
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:248:9: sparse: sparse: incorrect type in argument 2 (different addr=
ess spaces) @@     expected void volatile [noderef] __iomem *addr @@     go=
t unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:248:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:248:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:252:9: sparse: sparse: incorrect type in argument 2 (different addr=
ess spaces) @@     expected void volatile [noderef] __iomem *addr @@     go=
t unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:252:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:252:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:256:9: sparse: sparse: incorrect type in argument 2 (different addr=
ess spaces) @@     expected void volatile [noderef] __iomem *addr @@     go=
t unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:256:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:256:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:260:9: sparse: sparse: incorrect type in argument 2 (different addr=
ess spaces) @@     expected void volatile [noderef] __iomem *addr @@     go=
t unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:260:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:260:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:280:18: sparse: sparse: incorrect type in argument 1 (different add=
ress spaces) @@     expected void const volatile [noderef] __iomem *addr @@=
     got unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:280:18: sparse:     expected void const volatile [noderef] __iomem =
*addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:280:18: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:281:9: sparse: sparse: incorrect type in argument 2 (different addr=
ess spaces) @@     expected void volatile [noderef] __iomem *addr @@     go=
t unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:281:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:281:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:284:18: sparse: sparse: incorrect type in argument 1 (different add=
ress spaces) @@     expected void const volatile [noderef] __iomem *addr @@=
     got unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:284:18: sparse:     expected void const volatile [noderef] __iomem =
*addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:284:18: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:285:9: sparse: sparse: incorrect type in argument 2 (different addr=
ess spaces) @@     expected void volatile [noderef] __iomem *addr @@     go=
t unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:285:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:285:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:307:18: sparse: sparse: incorrect type in argument 1 (different add=
ress spaces) @@     expected void const volatile [noderef] __iomem *addr @@=
     got unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:307:18: sparse:     expected void const volatile [noderef] __iomem =
*addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:307:18: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:308:9: sparse: sparse: incorrect type in argument 2 (different addr=
ess spaces) @@     expected void volatile [noderef] __iomem *addr @@     go=
t unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:308:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:308:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:340:18: sparse: sparse: incorrect type in argument 1 (different add=
ress spaces) @@     expected void const volatile [noderef] __iomem *addr @@=
     got unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:340:18: sparse:     expected void const volatile [noderef] __iomem =
*addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:340:18: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:359:18: sparse: sparse: incorrect type in argument 1 (different add=
ress spaces) @@     expected void const volatile [noderef] __iomem *addr @@=
     got unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:359:18: sparse:     expected void const volatile [noderef] __iomem =
*addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:359:18: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:379:18: sparse: sparse: incorrect type in argument 1 (different add=
ress spaces) @@     expected void const volatile [noderef] __iomem *addr @@=
     got unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:379:18: sparse:     expected void const volatile [noderef] __iomem =
*addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:379:18: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:380:9: sparse: sparse: incorrect type in argument 2 (different addr=
ess spaces) @@     expected void volatile [noderef] __iomem *addr @@     go=
t unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:380:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:380:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:431:26: sparse: sparse: incorrect type in argument 1 (different add=
ress spaces) @@     expected void const volatile [noderef] __iomem *addr @@=
     got unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:431:26: sparse:     expected void const volatile [noderef] __iomem =
*addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:431:26: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:462:9: sparse: sparse: incorrect type in argument 2 (different addr=
ess spaces) @@     expected void volatile [noderef] __iomem *addr @@     go=
t unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:462:9: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:462:9: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:472:17: sparse: sparse: incorrect type in argument 2 (different add=
ress spaces) @@     expected void volatile [noderef] __iomem *addr @@     g=
ot unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:472:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:472:17: sparse:     got unsigned int volatile [usertype] *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:474:17: sparse: sparse: incorrect type in argument 2 (different add=
ress spaces) @@     expected void volatile [noderef] __iomem *addr @@     g=
ot unsigned int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:474:17: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:474:17: sparse:     got unsigned int volatile [usertype] *
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:151:18: sparse: sparse: symbol 'HifPdmaOps' was not declared. Shoul=
d it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:185:33: sparse: sparse: incorrect type in assignment (different add=
ress spaces) @@     expected unsigned char [usertype] *[usertype] DmaRegBas=
eAddr @@     got void [noderef] __iomem * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:185:33: sparse:     expected unsigned char [usertype] *[usertype] D=
maRegBaseAddr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/hif/ahb/mt8127/ahb=
_pdma.c:185:33: sparse:     got void [noderef] __iomem *
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/que_mgt.c:483:12: spars=
e: sparse: symbol 'g_arMissTimeout' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/que_mgt.c:1115:12: spar=
se: sparse: symbol 'qmFlushStaRxQueue' was not declared. Should it be stati=
c?
>> drivers/misc/mediatek/connectivity/wlan/gen2/nic/que_mgt.c:1464:35: spar=
se: sparse: marked inline, but without a definition
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:1136:14:=
 sparse: sparse: symbol '_cfg80211_classify8021d' was not declared. Should =
it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:1841:6: =
sparse: sparse: symbol 'wlanSchedScanStoppedWorkQueue' was not declared. Sh=
ould it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2022:25:=
 sparse: sparse: symbol 'wlanGetStats' was not declared. Should it be stati=
c?
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2562:16:=
 sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2563:19:=
 sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2566:9: =
sparse: sparse: cast removes address space '__rcu' of expression
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2566:9: =
sparse: sparse: incorrect type in argument 2 (different address spaces) @@ =
    expected void const * @@     got restricted __be32 [noderef] __rcu * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2566:9: =
sparse:     expected void const *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2566:9: =
sparse:     got restricted __be32 [noderef] __rcu *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2685:16:=
 sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2686:19:=
 sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2690:9: =
sparse: sparse: cast removes address space '__rcu' of expression
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2690:9: =
sparse: sparse: incorrect type in argument 2 (different address spaces) @@ =
    expected void const * @@     got restricted __be32 [noderef] __rcu * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2690:9: =
sparse:     expected void const *
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:2690:9: =
sparse:     got restricted __be32 [noderef] __rcu *
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:3000:41:=
 sparse: sparse: incorrect type in argument 1 (different address spaces) @@=
     expected void const volatile [noderef] __iomem *addr @@     got unsign=
ed int volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:3000:41:=
 sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/gl_init.c:3000:41:=
 sparse:     got unsigned int volatile [usertype] *
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/auth.c:201:19: sparse:=
 sparse: symbol 'txAuthIETable' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/auth.c:205:19: sparse:=
 sparse: symbol 'rxAuthIETable' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/hem_mbox.c:605:6: spar=
se: sparse: symbol 'mboxInitMsgMap' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/assoc.c:396:23: sparse=
: sparse: symbol 'txAssocReqIETable' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/assoc.c:432:19: sparse=
: sparse: symbol 'rxAssocReqIETable' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/assoc.c:436:23: sparse=
: sparse: symbol 'txAssocRespIETable' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/bss.c:514:23: sparse: =
sparse: symbol 'txProbRspIETable' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/bss.c:2513:6: sparse: =
sparse: symbol 'bssCreateStaRecFromAuth' was not declared. Should it be sta=
tic?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/bss.c:2518:6: sparse: =
sparse: symbol 'bssUpdateStaRecFromAssocReq' was not declared. Should it be=
 static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/ais_fsm.c:1152:9: spar=
se: sparse: symbol 'ucScanTimeoutTimes' was not declared. Should it be stat=
ic?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/ais_fsm.c:3905:17: spa=
rse: sparse: incorrect type in argument 1 (different address spaces) @@    =
 expected void const volatile [noderef] __iomem *addr @@     got unsigned i=
nt volatile [usertype] * @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/ais_fsm.c:3905:17: spa=
rse:     expected void const volatile [noderef] __iomem *addr
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/ais_fsm.c:3905:17: spa=
rse:     got unsigned int volatile [usertype] *
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rate.c:80:14: sparse: =
sparse: symbol 'aucDataRate' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rate.c:115:15: sparse:=
 sparse: symbol 'afgIsOFDMRate' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/privacy.c:468:9: spars=
e: sparse: symbol 'secGetPortStatus' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rlm_obss.c:213:9: spar=
se: sparse: symbol 'rlmObssUpdateChnlLists' was not declared. Should it be =
static?
--
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rlm_domain.c: note: in=
 included file:
   drivers/misc/mediatek/connectivity/wlan/gen2/include/mgmt/rlm_txpwr_init=
.h:49:35: sparse: sparse: symbol 'g_rRlmPowerLimitDefault' was not declared=
. Should it be static?
   drivers/misc/mediatek/connectivity/wlan/gen2/include/mgmt/rlm_txpwr_init=
.h:994:41: sparse: sparse: symbol 'g_rRlmPowerLimitConfiguration' was not d=
eclared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rlm_domain.c:251:19: s=
parse: sparse: symbol 'arSupportedRegDomains' was not declared. Should it b=
e static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rlm_domain.c:658:10: s=
parse: sparse: Using plain integer as NULL pointer
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rlm_domain.c:655:19: s=
parse: sparse: symbol 'arSupportedRegDomains_Passive' was not declared. Sho=
uld it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rlm_domain.c:685:19: s=
parse: sparse: symbol 'g_rRlmSubBand' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rlm_domain.c:1396:6: s=
parse: sparse: symbol 'rlmDomainBuildCmdByDefaultTable' was not declared. S=
hould it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rlm_domain.c:1529:6: s=
parse: sparse: symbol 'rlmDomainBuildCmdByConfigTable' was not declared. Sh=
ould it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls_com.c:308:35: spa=
rse: sparse: incorrect type in assignment (different base types) @@     exp=
ected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls_com.c:308:35: spa=
rse:     expected unsigned short [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls_com.c:308:35: spa=
rse:     got restricted __be16 [usertype]
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/sec_fsm.c:270:1: spars=
e: sparse: symbol 'secFsmUnInit' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/sec_fsm.c:484:6: spars=
e: sparse: symbol 'secFsmSteps' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/common/wlan_oid.c:2807:8: s=
parse: sparse: symbol 'keyBuffer' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/swcr.c:135:9: sparse: =
sparse: symbol 'g_u4mDNSRXFilter' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/swcr.c:162:21: sparse:=
 sparse: symbol 'g_arSwCrModHandle' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/swcr.c:255:6: sparse: =
sparse: symbol 'dumpQueue' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/swcr.c:308:6: sparse: =
sparse: symbol 'dumpSTA' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/swcr.c:373:6: sparse: =
sparse: symbol 'dumpBss' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/swcr.c:634:1: sparse: =
sparse: symbol 'testPsSendQoSNullFrame' was not declared. Should it be stat=
ic?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/swcr.c:691:6: sparse: =
sparse: symbol 'testPsSetupBss' was not declared. Should it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/scan_fsm.c:1520:9: spa=
rse: sparse: symbol 'scnFsmPSCNSetHotlist' was not declared. Should it be s=
tatic?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/scan_fsm.c:1701:1: spa=
rse: sparse: symbol 'scnSubCombineNLOtoPSCN' was not declared. Should it be=
 static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/scan_fsm.c:1729:1: spa=
rse: sparse: symbol 'scnSubCombineBatchSCNtoPSCN' was not declared. Should =
it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/scan_fsm.c:1758:1: spa=
rse: sparse: symbol 'scnSubCombineGSCNtoPSCN' was not declared. Should it b=
e static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/scan_fsm.c:1814:1: spa=
rse: sparse: symbol 'scnRemoveFromPSCN' was not declared. Should it be stat=
ic?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_scan.c:95:6: spars=
e: sparse: symbol 'scanInvalidAllP2pClientDevice' was not declared. Should =
it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_scan.c:109:6: spar=
se: sparse: symbol 'scanRemoveInvalidP2pClientDevice' was not declared. Sho=
uld it be static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_ie.c:27:26: sparse=
: sparse: symbol 'txAssocRspWFDAttributesTable' was not declared. Should it=
 be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_ie.c:369:1: sparse=
: sparse: symbol 'wfdFuncGenerateWfd_IE' was not declared. Should it be sta=
tic?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_ie.c:518:6: sparse=
: sparse: symbol 'p2pFuncComposeNoaAttribute' was not declared. Should it b=
e static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/scan.c:2135:9: sparse:=
 sparse: symbol 'scanCheckBssIsLegal' was not declared. Should it be static?
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/scan.c:745:9: sparse: =
sparse: memset with byte count of 121344
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1564:6: sparse: =
sparse: symbol 'rsnGenMicErrorEvent' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1296:25: sparse:=
 sparse: cast truncates bits from constant value (2f25000 becomes 0)
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1296:25: sparse:=
 sparse: cast truncates bits from constant value (2f250 becomes 50)
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1296:25: sparse:=
 sparse: cast truncates bits from constant value (2f2 becomes f2)
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1308:25: sparse:=
 sparse: cast truncates bits from constant value (2f25000 becomes 0)
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1308:25: sparse:=
 sparse: cast truncates bits from constant value (2f250 becomes 50)
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1308:25: sparse:=
 sparse: cast truncates bits from constant value (2f2 becomes f2)
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1320:25: sparse:=
 sparse: cast truncates bits from constant value (2f25000 becomes 0)
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1320:25: sparse:=
 sparse: cast truncates bits from constant value (2f250 becomes 50)
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/rsn.c:1320:25: sparse:=
 sparse: cast truncates bits from constant value (2f2 becomes f2)
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_fsm.c:1515:6: spar=
se: sparse: symbol 'p2pFsmRunEventScanAbort' was not declared. Should it be=
 static?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:8:26: spars=
e: sparse: symbol 'txAssocRspAttributesTable' was not declared. Should it b=
e static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:13:23: spar=
se: sparse: symbol 'txProbeRspIETable' was not declared. Should it be stati=
c?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:760:1: spar=
se: sparse: symbol 'p2pFuncDeauth' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:816:1: spar=
se: sparse: symbol 'p2pFuncDisassoc' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1080:12: sp=
arse: sparse: symbol 'p2p_to_string' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1105:12: sp=
arse: sparse: symbol 'pa_to_string' was not declared. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1127:12: sp=
arse: sparse: symbol 'action_to_string' was not declared. Should it be stat=
ic?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1167:6: spa=
rse: sparse: symbol 'p2pFuncTagActionActionP2PFrame' was not declared. Shou=
ld it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1179:6: spa=
rse: sparse: symbol 'p2pFuncTagActionActionFrame' was not declared. Should =
it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1215:6: spa=
rse: sparse: symbol 'p2pFuncTagActionCategoryFrame' was not declared. Shoul=
d it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1251:1: spa=
rse: sparse: symbol 'p2pFuncTagMgmtFrame' was not declared. Should it be st=
atic?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1748:33: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [usertype] u2CategoryId @@     got restricted __be16 =
[usertype] @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1748:33: sp=
arse:     expected unsigned short [usertype] u2CategoryId
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1748:33: sp=
arse:     got restricted __be16 [usertype]
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1749:36: sp=
arse: sparse: incorrect type in assignment (different base types) @@     ex=
pected unsigned short [usertype] u2SubCategoryId @@     got restricted __be=
16 [usertype] @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1749:36: sp=
arse:     expected unsigned short [usertype] u2SubCategoryId
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:1749:36: sp=
arse:     got restricted __be16 [usertype]
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:3607:1: spa=
rse: sparse: symbol 'p2pFuncGenerateBeaconProbeRsp' was not declared. Shoul=
d it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:3638:1: spa=
rse: sparse: symbol 'p2pFuncComposeBeaconProbeRspTemplate' was not declared=
. Should it be static?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:3714:13: sp=
arse: sparse: symbol 'wfdAdjustResource' was not declared. Should it be sta=
tic?
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/p2p_func.c:3741:13: sp=
arse: sparse: symbol 'wfdAdjustThread' was not declared. Should it be stati=
c?
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:684:27: sparse:=
 sparse: incorrect type in assignment (different base types) @@     expecte=
d unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:684:27: sparse:=
     expected unsigned short [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:684:27: sparse:=
     got restricted __be16 [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1069:27: sparse=
: sparse: incorrect type in assignment (different base types) @@     expect=
ed unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1069:27: sparse=
:     expected unsigned short [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1069:27: sparse=
:     got restricted __be16 [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1179:27: sparse=
: sparse: incorrect type in assignment (different base types) @@     expect=
ed unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1179:27: sparse=
:     expected unsigned short [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1179:27: sparse=
:     got restricted __be16 [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1308:27: sparse=
: sparse: incorrect type in assignment (different base types) @@     expect=
ed unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1308:27: sparse=
:     expected unsigned short [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1308:27: sparse=
:     got restricted __be16 [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1482:35: sparse=
: sparse: incorrect type in assignment (different base types) @@     expect=
ed unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1482:35: sparse=
:     expected unsigned short [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:1482:35: sparse=
:     got restricted __be16 [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:2022:27: sparse=
: sparse: incorrect type in assignment (different base types) @@     expect=
ed unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:2022:27: sparse=
:     expected unsigned short [usertype]
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:2022:27: sparse=
:     got restricted __be16 [usertype]
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:2074:44: sparse=
: sparse: incorrect type in assignment (different base types) @@     expect=
ed unsigned int [usertype] u4Value @@     got restricted __be32 [usertype] =
@@
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:2074:44: sparse=
:     expected unsigned int [usertype] u4Value
   drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:2074:44: sparse=
:     got restricted __be32 [usertype]
>> drivers/misc/mediatek/connectivity/wlan/gen2/mgmt/tdls.c:4295:59: sparse=
: sparse: Using plain integer as NULL pointer
--
>> drivers/misc/mediatek/connectivity/common/common_detect/sdio_detect.c:26=
:14: sparse: sparse: symbol 'gComboChipId' was not declared. Should it be s=
tatic?
>> drivers/misc/mediatek/connectivity/common/common_detect/sdio_detect.c:29=
:28: sparse: sparse: symbol 'gChipInfoArray' was not declared. Should it be=
 static?
--
>> drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.c:38:=
14: sparse: sparse: symbol 'pDetectClass' was not declared. Should it be st=
atic?
>> drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.c:39:=
15: sparse: sparse: symbol 'pDetectDev' was not declared. Should it be stat=
ic?
>> drivers/misc/mediatek/connectivity/common/common_detect/wmt_detect.c:159=
:30: sparse: sparse: symbol 'gWmtDetectFops' was not declared. Should it be=
 static?

vim +/_wmt_detect_output_low +51 drivers/misc/mediatek/connectivity/common/=
common_detect/wmt_detect_pwr.c

762944ce0113d0 Frank Wunderlich 2022-06-05  50  =

762944ce0113d0 Frank Wunderlich 2022-06-05 @51  int _wmt_detect_output_low(=
unsigned int id)
762944ce0113d0 Frank Wunderlich 2022-06-05  52  {
762944ce0113d0 Frank Wunderlich 2022-06-05  53  	if (INVALID_PIN_ID !=3D gp=
io_ctrl_info.gpio_ctrl_state[id].gpio_num) {
762944ce0113d0 Frank Wunderlich 2022-06-05  54  		gpio_direction_output(gpi=
o_ctrl_info.gpio_ctrl_state[id].gpio_num, 0);
762944ce0113d0 Frank Wunderlich 2022-06-05  55  		WMT_DETECT_DBG_FUNC("WMT-=
DETECT: set GPIO%d to output %d\n",
762944ce0113d0 Frank Wunderlich 2022-06-05  56  				gpio_ctrl_info.gpio_ctr=
l_state[id].gpio_num,
762944ce0113d0 Frank Wunderlich 2022-06-05  57  				gpio_get_value(gpio_ctr=
l_info.gpio_ctrl_state[id].gpio_num));
762944ce0113d0 Frank Wunderlich 2022-06-05  58  	}
762944ce0113d0 Frank Wunderlich 2022-06-05  59  =

762944ce0113d0 Frank Wunderlich 2022-06-05  60  	return 0;
762944ce0113d0 Frank Wunderlich 2022-06-05  61  }
762944ce0113d0 Frank Wunderlich 2022-06-05  62  =


:::::: The code at line 51 was first introduced by commit
:::::: 762944ce0113d06981bb5cb2b4fd151ccbcc82ab mt6625l: add driver from 5.=
18

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1019344717968234477==--

