Content-Type: multipart/mixed; boundary="===============8568539171169689375=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [freescale-fslc:5.4-2.3.x-imx 14893/21308] drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1213:30: sparse: sparse: Using plain integer as NULL pointer
Date: Tue, 28 Sep 2021 14:06:03 +0800
Message-ID: <202109281432.TDPaxUjO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8568539171169689375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Otavio Salvador <otavio@ossystems.com.br>

Hi Fugang,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/Freescale/linux-fslc 5.4-2.3.x-imx
head:   5e2f889a8a3a0b326eb96497906bc7bcb6bcb743
commit: f186a4e65f54a28973c743f8c007b18c1ce95be6 [14893/21308] MLK-24962 ne=
t: wireless: nxp: mxm_wifiex: upgrade to mxm5x16203 release
:::::: branch date: 5 days ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-s022-20210927 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/Freescale/linux-fslc/commit/f186a4e65f54a28973=
c743f8c007b18c1ce95be6
        git remote add freescale-fslc https://github.com/Freescale/linux-fs=
lc
        git fetch --no-tags freescale-fslc 5.4-2.3.x-imx
        git checkout f186a4e65f54a28973c743f8c007b18c1ce95be6
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/net/wireless/nxp/mxm_wifi=
ex/wlan_src/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1213:30: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1232:58: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1262:56: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1275:51: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1002:30: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1023:57: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1052:55: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1064:50: s=
parse: sparse: Using plain integer as NULL pointer
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:548:13: sp=
arse: sparse: symbol 'wlan_disable_pcie_host_int' was not declared. Should =
it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:594:17: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:599:17: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:605:33: sp=
arse: sparse: Using plain integer as NULL pointer
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:581:13: sp=
arse: sparse: symbol 'wlan_clear_pending_int_status' was not declared. Shou=
ld it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:624:13: sp=
arse: sparse: symbol 'wlan_enable_pcie_host_int' was not declared. Should i=
t be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:700:17: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:715:57: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:767:30: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:788:57: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:820:55: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:834:50: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:852:30: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:902:17: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:922:25: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:936:25: sp=
arse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1082:30: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1123:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1142:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1156:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1291:30: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1304:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1314:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1341:30: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1362:53: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1408:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1489:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1518:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1527:33: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1543:65: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1657:42: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1674:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1679:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1704:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1710:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1769:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1783:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1796:33: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1812:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1816:54: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1891:30: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1911:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1925:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1936:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1941:64: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1942:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1969:74: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1970:48: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1983:33: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1990:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:1999:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2004:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2069:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2078:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2108:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2112:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2117:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2125:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2140:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2165:33: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2177:33: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2189:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2201:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2211:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2222:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2281:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2297:32: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2304:22: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2305:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2344:33: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2359:66: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2375:53: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2383:33: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2392:33: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2452:50: s=
parse: sparse: Using plain integer as NULL pointer
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2428:13: s=
parse: sparse: symbol 'wlan_pcie_cmdrsp_complete' was not declared. Should =
it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2531:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2578:65: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2626:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2631:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2670:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2679:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2697:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2727:25: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2760:17: s=
parse: sparse: Using plain integer as NULL pointer
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2648:13: s=
parse: sparse: symbol 'wlan_pcie_event_complete' was not declared. Should i=
t be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2794:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2803:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2809:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2822:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2833:17: s=
parse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c:2843:17: s=
parse: sparse: too many warnings
--
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c: n=
ote: in included file:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_fw.h:4153:47: spa=
rse: sparse: array of flexible structures
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_fw.h:2834:41: spa=
rse: sparse: array of flexible structures
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:62=
:13: sparse: sparse: symbol 'wlan_cmd_set_get_band_steering_cfg' was not de=
clared. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:93=
:13: sparse: sparse: symbol 'wlan_ret_set_get_band_steering_cfg' was not de=
clared. Should it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:12=
6:13: sparse: sparse: symbol 'wlan_cmd_set_get_beacon_stuck_cfg' was not de=
clared. Should it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:15=
7:13: sparse: sparse: symbol 'wlan_ret_set_get_beacon_stuck_cfg' was not de=
clared. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:20=
3:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:21=
4:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:22=
2:51: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:22=
3:42: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:27=
4:49: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:29=
8:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:31=
2:31: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:32=
7:6: sparse: sparse: symbol 'wlan_notify_station_deauth' was not declared. =
Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:37=
8:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:37=
9:49: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:38=
0:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:38=
1:58: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:38=
2:47: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:38=
9:26: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:41=
4:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:49=
0:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:55=
0:38: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:58=
1:29: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:59=
1:61: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:59=
1:68: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:59=
7:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:63=
7:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:66=
7:28: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
0:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
1:42: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
2:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
3:58: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
4:54: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
5:50: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
6:45: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
7:50: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
8:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:67=
9:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
0:51: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
1:54: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
2:54: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
3:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
4:58: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
5:58: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
6:60: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
7:54: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
8:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:68=
9:69: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
0:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
1:70: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
2:64: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
3:64: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
4:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
5:53: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
6:57: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
7:42: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
8:50: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:69=
9:64: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
0:40: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
1:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
2:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
3:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
4:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
5:58: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
6:46: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
7:42: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
8:58: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:70=
9:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:72=
1:27: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:74=
9:25: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
66:9: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
86:28: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
89:42: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
90:51: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
91:51: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
92:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
93:50: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
94:54: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
95:58: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
96:57: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
97:42: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
98:53: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:14=
99:55: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:15=
05:43: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:15=
06:34: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:15=
12:27: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:15=
21:27: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:16=
52:41: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:16=
81:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:17=
96:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:18=
26:33: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:19=
23:28: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:19=
24:36: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:19=
28:42: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:19=
29:48: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:19=
30:58: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:19=
31:54: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:19=
32:50: sparse: sparse: Using plain integer as NULL pointer
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_uap_cmdevent.c:19=
33:45: sparse: sparse: too many warnings
--
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c: no=
te: in included file (through include/uapi/linux/wireless.h, include/linux/=
wireless.h, ...):
   /usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h:406:9: sparse: sparse: =
preprocessor token offsetof redefined
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c: no=
te: in included file (through include/uapi/linux/posix_types.h, include/uap=
i/linux/types.h, include/linux/types.h, ...):
   include/linux/stddef.h:17:9: sparse: this was the original definition
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:190=
:5: sparse: sparse: symbol 'string2raw' was not declared. Should it be stat=
ic?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:293=
:13: sparse: sparse: symbol 'woal_set_miracast_mode' was not declared. Shou=
ld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:341=
:5: sparse: sparse: symbol 'woal_get_priv_driver_version' was not declared.=
 Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:570=
:5: sparse: sparse: symbol 'woal_priv_customie' was not declared. Should it=
 be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:633=
:5: sparse: sparse: symbol 'woal_setget_priv_bandcfg' was not declared. Sho=
uld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:760=
:5: sparse: sparse: symbol 'woal_setget_priv_httxcfg' was not declared. Sho=
uld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:859=
:5: sparse: sparse: symbol 'woal_setget_priv_htcapinfo' was not declared. S=
hould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:961=
:5: sparse: sparse: symbol 'woal_setget_priv_addbapara' was not declared. S=
hould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
7:5: sparse: sparse: symbol 'woal_priv_delba' was not declared. Should it b=
e static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:116=
3:5: sparse: sparse: symbol 'woal_priv_rejectaddbareq' was not declared. Sh=
ould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:124=
3:13: sparse: sparse: symbol 'woal_ioctl_addba_reject' was not declared. Sh=
ould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:134=
4:13: sparse: sparse: symbol 'woal_ioctl_addba_param' was not declared. Sho=
uld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:139=
3:5: sparse: sparse: symbol 'woal_set_rx_ba_winsize' was not declared. Shou=
ld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:147=
2:5: sparse: sparse: symbol 'woal_set_tx_ba_winsize' was not declared. Shou=
ld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:155=
7:5: sparse: sparse: symbol 'woal_setget_priv_aggrpriotbl' was not declared=
. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:164=
5:5: sparse: sparse: symbol 'woal_setget_priv_addbareject' was not declared=
. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:172=
8:5: sparse: sparse: symbol 'woal_setget_priv_vhtcfg' was not declared. Sho=
uld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:188=
3:5: sparse: sparse: symbol 'woal_setget_priv_opermodecfg' was not declared=
. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:196=
6:5: sparse: sparse: symbol 'woal_get_priv_datarate' was not declared. Shou=
ld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:201=
6:5: sparse: sparse: symbol 'woal_setget_priv_txratecfg' was not declared. =
Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c: no=
te: in included file (through drivers/net/wireless/nxp/mxm_wifiex/wlan_src/=
mlinux/mlan.h, drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_mai=
n.h):
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/mlan_ioctl.h:2351:22=
: sparse: sparse: array of flexible structures
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:228=
1:5: sparse: sparse: symbol 'woal_get_priv_getlog' was not declared. Should=
 it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:232=
1:5: sparse: sparse: symbol 'woal_setget_priv_esuppmode' was not declared. =
Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:241=
1:5: sparse: sparse: symbol 'woal_setget_priv_passphrase' was not declared.=
 Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:261=
6:5: sparse: sparse: symbol 'woal_priv_deauth' was not declared. Should it =
be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:283=
3:5: sparse: sparse: symbol 'woal_priv_bssrole' was not declared. Should it=
 be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:291=
4:5: sparse: sparse: symbol 'woal_priv_setuserscan' was not declared. Shoul=
d it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:294=
8:5: sparse: sparse: symbol 'woal_priv_get_chanstats' was not declared. Sho=
uld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:306=
5:5: sparse: sparse: symbol 'woal_priv_getscantable' was not declared. Shou=
ld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:312=
6:5: sparse: sparse: symbol 'woal_priv_extcapcfg' was not declared. Should =
it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:320=
2:5: sparse: sparse: symbol 'woal_priv_setgetdeepsleep' was not declared. S=
hould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:327=
6:5: sparse: sparse: symbol 'woal_priv_setgetipaddr' was not declared. Shou=
ld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:337=
0:5: sparse: sparse: symbol 'woal_priv_setwpssession' was not declared. Sho=
uld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:343=
8:5: sparse: sparse: symbol 'woal_priv_otpuserdata' was not declared. Shoul=
d it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:350=
8:5: sparse: sparse: symbol 'woal_priv_set_get_countrycode' was not declare=
d. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:358=
5:5: sparse: sparse: symbol 'woal_priv_get_cfpinfo' was not declared. Shoul=
d it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:364=
7:5: sparse: sparse: symbol 'woal_priv_setgettcpackenh' was not declared. S=
hould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:371=
1:5: sparse: sparse: symbol 'woal_priv_assocessid' was not declared. Should=
 it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:384=
7:5: sparse: sparse: symbol 'woal_priv_getwakeupreason' was not declared. S=
hould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:390=
5:5: sparse: sparse: symbol 'woal_priv_set_get_listeninterval' was not decl=
ared. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:398=
6:5: sparse: sparse: symbol 'woal_priv_set_get_drvdbg' was not declared. Sh=
ould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:408=
4:5: sparse: sparse: symbol 'woal_priv_mgmt_filter' was not declared. Shoul=
d it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:416=
1:5: sparse: sparse: symbol 'woal_priv_hscfg' was not declared. Should it b=
e static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:436=
5:5: sparse: sparse: symbol 'woal_priv_hssetpara' was not declared. Should =
it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:441=
3:5: sparse: sparse: symbol 'woal_priv_set_get_scancfg' was not declared. S=
hould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:452=
6:5: sparse: sparse: symbol 'woal_priv_getnlnum' was not declared. Should i=
t be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:455=
8:5: sparse: sparse: symbol 'woal_priv_set_get_aggrctrl' was not declared. =
Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:647=
2:5: sparse: sparse: symbol 'woal_priv_set_get_auto_arp' was not declared. =
Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:698=
6:5: sparse: sparse: symbol 'woal_priv_hotspotcfg' was not declared. Should=
 it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:705=
3:5: sparse: sparse: symbol 'woal_priv_mgmt_frame_passthru_ctrl' was not de=
clared. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:749=
3:5: sparse: sparse: symbol 'woal_priv_macctrl' was not declared. Should it=
 be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:756=
1:5: sparse: sparse: symbol 'woal_priv_getwap' was not declared. Should it =
be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:761=
0:5: sparse: sparse: symbol 'woal_priv_region_code' was not declared. Shoul=
d it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:775=
9:5: sparse: sparse: symbol 'woal_priv_fwmacaddr' was not declared. Should =
it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:782=
5:5: sparse: sparse: symbol 'woal_priv_offchannel' was not declared. Should=
 it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:798=
0:5: sparse: sparse: symbol 'woal_priv_set_get_dscp_map' was not declared. =
Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:801=
5:5: sparse: sparse: symbol 'woal_priv_get_driver_verext' was not declared.=
 Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:963=
9:5: sparse: sparse: symbol 'woal_priv_set_get_pmfcfg' was not declared. Sh=
ould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
01:77: sparse: sparse: incorrect type in assignment (different base types) =
@@     expected restricted __le16 [usertype] rx_mcs_map @@     got int @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
01:77: sparse:     expected restricted __le16 [usertype] rx_mcs_map
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
01:77: sparse:     got int
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
06:77: sparse: sparse: incorrect type in assignment (different base types) =
@@     expected restricted __le16 [usertype] tx_mcs_map @@     got int @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
06:77: sparse:     expected restricted __le16 [usertype] tx_mcs_map
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
06:77: sparse:     got int
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
21:77: sparse: sparse: incorrect type in assignment (different base types) =
@@     expected restricted __le16 [usertype] rx_mcs_map @@     got int @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
21:77: sparse:     expected restricted __le16 [usertype] rx_mcs_map
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
21:77: sparse:     got int
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
26:77: sparse: sparse: incorrect type in assignment (different base types) =
@@     expected restricted __le16 [usertype] tx_mcs_map @@     got int @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
26:77: sparse:     expected restricted __le16 [usertype] tx_mcs_map
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:106=
26:77: sparse:     got int
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:116=
74:24: sparse: sparse: cast from restricted __be16
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:116=
74:24: sparse: sparse: cast from restricted __be16
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:125=
40:5: sparse: sparse: symbol 'woal_set_scan_chan_gap' was not declared. Sho=
uld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:130=
21:6: sparse: sparse: symbol 'woal_get_center_freq_idx' was not declared. S=
hould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:139=
70:5: sparse: sparse: symbol 'woal_priv_rx_abort_cfg' was not declared. Sho=
uld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:140=
53:5: sparse: sparse: symbol 'woal_priv_rx_abort_cfg_ext' was not declared.=
 Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:141=
50:5: sparse: sparse: symbol 'woal_priv_tx_ampdu_prot_mode' was not declare=
d. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:142=
30:5: sparse: sparse: symbol 'woal_priv_rate_adapt_cfg' was not declared. S=
hould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:143=
36:5: sparse: sparse: symbol 'woal_priv_cck_desense_cfg' was not declared. =
Should it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:145=
48:5: sparse: sparse: symbol 'woal_priv_arbcfg' was not declared. Should it=
 be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:146=
82:33: sparse: sparse: incorrect type in argument 2 (different address spac=
es) @@     expected void const [noderef] <asn:1> *from @@     got char *[as=
signed] cmd_buf @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:146=
82:33: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:146=
82:33: sparse:     got char *[assigned] cmd_buf
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:162=
24:42: sparse: sparse: incorrect type in argument 1 (different address spac=
es) @@     expected void [noderef] <asn:1> *to @@     got char *[assigned] =
cmd_buf @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:162=
24:42: sparse:     expected void [noderef] <asn:1> *to
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:162=
24:42: sparse:     got char *[assigned] cmd_buf
--
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
 note: in included file (through include/uapi/linux/wireless.h, include/lin=
ux/wireless.h, ...):
   /usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h:406:9: sparse: sparse: =
preprocessor token offsetof redefined
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
 note: in included file (through include/uapi/linux/posix_types.h, include/=
uapi/linux/types.h, include/linux/types.h, ...):
   include/linux/stddef.h:17:9: sparse: this was the original definition
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
38:11: sparse: sparse: symbol 'cfg80211_cipher_suites' was not declared. Sh=
ould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
2024:29: sparse: sparse: incorrect type in assignment (different base types=
) @@     expected unsigned short [usertype] frame_control @@     got restri=
cted __le16 [usertype] @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
2024:29: sparse:     expected unsigned short [usertype] frame_control
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
2024:29: sparse:     got restricted __le16 [usertype]
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
2075:31: sparse: sparse: incorrect type in assignment (different base types=
) @@     expected unsigned short [usertype] auth_alg @@     got restricted =
__le16 [usertype] @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
2075:31: sparse:     expected unsigned short [usertype] auth_alg
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
2075:31: sparse:     got restricted __le16 [usertype]
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
520:6: sparse: sparse: symbol 'is_cfg80211_special_region_code' was not dec=
lared. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
1209:13: sparse: sparse: symbol 'woal_set_ewpa_mode' was not declared. Shou=
ld it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
1625:5: sparse: sparse: symbol 'woal_cfg80211_connect_scan' was not declare=
d. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
1711:6: sparse: sparse: symbol 'woal_save_assoc_params' was not declared. S=
hould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
1770:6: sparse: sparse: symbol 'woal_save_auth_params' was not declared. Sh=
ould it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
2279:6: sparse: sparse: symbol 'woal_assoc_resp_event' was not declared. Sh=
ould it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
2921:6: sparse: sparse: symbol 'woal_cfg80211_fill_rate_info' was not decla=
red. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
3624:13: sparse: sparse: symbol 'woal_role_switch' was not declared. Should=
 it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
3714:13: sparse: sparse: symbol 'woal_uap_scan' was not declared. Should it=
 be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
3801:6: sparse: sparse: symbol 'woal_is_scan_result_expired' was not declar=
ed. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4199:29: sparse: sparse: incorrect type in assignment (different base types=
) @@     expected unsigned short [usertype] frame_control @@     got restri=
cted __le16 [usertype] @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4199:29: sparse:     expected unsigned short [usertype] frame_control
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4199:29: sparse:     got restricted __le16 [usertype]
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4305:29: sparse: sparse: incorrect type in assignment (different base types=
) @@     expected unsigned short [usertype] frame_control @@     got restri=
cted __le16 [usertype] @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4305:29: sparse:     expected unsigned short [usertype] frame_control
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4305:29: sparse:     got restricted __le16 [usertype]
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4316:31: sparse: sparse: incorrect type in assignment (different base types=
) @@     expected unsigned short [usertype] auth_alg @@     got restricted =
__le16 [usertype] @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4316:31: sparse:     expected unsigned short [usertype] auth_alg
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4316:31: sparse:     got restricted __le16 [usertype]
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4317:39: sparse: sparse: incorrect type in assignment (different base types=
) @@     expected unsigned short [usertype] auth_transaction @@     got res=
tricted __le16 [usertype] @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4317:39: sparse:     expected unsigned short [usertype] auth_transaction
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4317:39: sparse:     got restricted __le16 [usertype]
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4318:34: sparse: sparse: incorrect type in assignment (different base types=
) @@     expected unsigned short [usertype] status_code @@     got restrict=
ed __le16 [usertype] @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4318:34: sparse:     expected unsigned short [usertype] status_code
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
4318:34: sparse:     got restricted __le16 [usertype]
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
5033:6: sparse: sparse: symbol 'woal_bandcfg_to_ieee_band' was not declared=
. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
6637:5: sparse: sparse: symbol 'woal_update_okc_roaming_ie' was not declare=
d. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
7186:29: sparse: sparse: incorrect type in assignment (different base types=
) @@     expected restricted __le16 [usertype] frame_control @@     got int=
 @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
7186:29: sparse:     expected restricted __le16 [usertype] frame_control
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
7186:29: sparse:     got int
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
7189:36: sparse: sparse: incorrect type in assignment (different base types=
) @@     expected restricted __le16 [usertype] reason_code @@     got unsig=
ned short [usertype] reason_code @@
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
7189:36: sparse:     expected restricted __le16 [usertype] reason_code
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
7189:36: sparse:     got unsigned short [usertype] reason_code
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
7320:13: sparse: sparse: symbol 'woal_cfg80211_init_wiphy' was not declared=
. Should it be static?
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_sta_cfg80211.c:=
7501:6: sparse: sparse: symbol 'woal_update_channel_flag' was not declared.=
 Should it be static?
--
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c: note: i=
n included file (through include/uapi/linux/wireless.h, include/linux/wirel=
ess.h, ...):
   /usr/lib/gcc/x86_64-linux-gnu/9/include/stddef.h:406:9: sparse: sparse: =
preprocessor token offsetof redefined
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c: note: i=
n included file (through include/uapi/linux/posix_types.h, include/uapi/lin=
ux/types.h, include/linux/types.h, ...):
   include/linux/stddef.h:17:9: sparse: this was the original definition
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:394:5: s=
parse: sparse: symbol 'woal_pcie_probe' was not declared. Should it be stat=
ic?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:896:13: =
sparse: sparse: symbol 'woal_pcie_write_data_sync' was not declared. Should=
 it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:912:13: =
sparse: sparse: symbol 'woal_pcie_read_data_sync' was not declared. Should =
it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1418:5: =
sparse: sparse: symbol 'woal_pcie_dump_reg_info' was not declared. Should i=
t be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1736:21:=
 sparse: sparse: symbol 'mem_type_mapping_tbl_8997' was not declared. Shoul=
d it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1752:13:=
 sparse: sparse: symbol 'woal_read_reg_eight_bit' was not declared. Should =
it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1767:13:=
 sparse: sparse: symbol 'woal_pcie_rdwr_firmware' was not declared. Should =
it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:2013:6: =
sparse: sparse: symbol 'woal_pcie_dump_fw_info_v2' was not declared. Should=
 it be static?
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:2192:6: =
sparse: sparse: symbol 'woal_pcie_dump_fw_info' was not declared. Should it=
 be static?

Please review and possibly fold the followup patch.

vim +1213 drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlan/mlan_pcie.c

688b67b2c7220b Fugang Duan 2020-04-19  1201  =

688b67b2c7220b Fugang Duan 2020-04-19  1202  /**
688b67b2c7220b Fugang Duan 2020-04-19  1203   *  @brief This function frees=
 event buffer descriptor ring
688b67b2c7220b Fugang Duan 2020-04-19  1204   *
688b67b2c7220b Fugang Duan 2020-04-19  1205   *  @param pmadapter  A pointe=
r to mlan_adapter structure
688b67b2c7220b Fugang Duan 2020-04-19  1206   *
688b67b2c7220b Fugang Duan 2020-04-19  1207   *  @return 	      MLAN_STATUS=
_SUCCESS or MLAN_STATUS_FAILURE
688b67b2c7220b Fugang Duan 2020-04-19  1208   */
6b4a83a75fc1dc Fugang Duan 2020-05-28  1209  static mlan_status wlan_pcie_d=
elete_evtbd_ring(mlan_adapter *pmadapter)
688b67b2c7220b Fugang Duan 2020-04-19  1210  {
688b67b2c7220b Fugang Duan 2020-04-19  1211  	t_u32 i;
688b67b2c7220b Fugang Duan 2020-04-19  1212  	pmlan_callbacks pcb =3D &pmad=
apter->callbacks;
688b67b2c7220b Fugang Duan 2020-04-19 @1213  	mlan_buffer *pmbuf =3D MNULL;
688b67b2c7220b Fugang Duan 2020-04-19  1214  #if defined(PCIE8997) || defin=
ed(PCIE8897)
688b67b2c7220b Fugang Duan 2020-04-19  1215  	mlan_pcie_evt_buf *pevtbd_buf;
688b67b2c7220b Fugang Duan 2020-04-19  1216  #endif
688b67b2c7220b Fugang Duan 2020-04-19  1217  #if defined(PCIE9098) || defin=
ed(PCIE9097)
688b67b2c7220b Fugang Duan 2020-04-19  1218  	adma_dual_desc_buf *padma_bd_=
buf;
688b67b2c7220b Fugang Duan 2020-04-19  1219  #endif
688b67b2c7220b Fugang Duan 2020-04-19  1220  =

688b67b2c7220b Fugang Duan 2020-04-19  1221  	ENTER();
688b67b2c7220b Fugang Duan 2020-04-19  1222  	for (i =3D 0; i < MLAN_MAX_EV=
T_BD; i++) {
688b67b2c7220b Fugang Duan 2020-04-19  1223  		if (pmadapter->pcard_pcie->e=
vt_buf_list[i]) {
688b67b2c7220b Fugang Duan 2020-04-19  1224  			pmbuf =3D pmadapter->pcard_=
pcie->evt_buf_list[i];
688b67b2c7220b Fugang Duan 2020-04-19  1225  			pcb->moal_unmap_memory(pmad=
apter->pmoal_handle,
688b67b2c7220b Fugang Duan 2020-04-19  1226  					       pmbuf->pbuf + pmbu=
f->data_offset,
6b4a83a75fc1dc Fugang Duan 2020-05-28  1227  					       pmbuf->buf_pa, MAX=
_EVENT_SIZE,
688b67b2c7220b Fugang Duan 2020-04-19  1228  					       PCI_DMA_FROMDEVICE=
);
688b67b2c7220b Fugang Duan 2020-04-19  1229  			wlan_free_mlan_buffer(pmada=
pter, pmbuf);
688b67b2c7220b Fugang Duan 2020-04-19  1230  		}
688b67b2c7220b Fugang Duan 2020-04-19  1231  =

688b67b2c7220b Fugang Duan 2020-04-19  1232  		pmadapter->pcard_pcie->evt_b=
uf_list[i] =3D MNULL;
688b67b2c7220b Fugang Duan 2020-04-19  1233  #if defined(PCIE8997) || defin=
ed(PCIE8897)
688b67b2c7220b Fugang Duan 2020-04-19  1234  		if (!pmadapter->pcard_pcie->=
reg->use_adma) {
688b67b2c7220b Fugang Duan 2020-04-19  1235  			pevtbd_buf =3D
6b4a83a75fc1dc Fugang Duan 2020-05-28  1236  				(mlan_pcie_evt_buf *)
6b4a83a75fc1dc Fugang Duan 2020-05-28  1237  					pmadapter->pcard_pcie->ev=
tbd_ring[i];
688b67b2c7220b Fugang Duan 2020-04-19  1238  =

688b67b2c7220b Fugang Duan 2020-04-19  1239  			if (pevtbd_buf) {
688b67b2c7220b Fugang Duan 2020-04-19  1240  				pevtbd_buf->paddr =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19  1241  				pevtbd_buf->len =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19  1242  				pevtbd_buf->flags =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19  1243  			}
688b67b2c7220b Fugang Duan 2020-04-19  1244  		}
688b67b2c7220b Fugang Duan 2020-04-19  1245  #endif
688b67b2c7220b Fugang Duan 2020-04-19  1246  =

688b67b2c7220b Fugang Duan 2020-04-19  1247  #if defined(PCIE9098) || defin=
ed(PCIE9097)
688b67b2c7220b Fugang Duan 2020-04-19  1248  		if (pmadapter->pcard_pcie->r=
eg->use_adma) {
688b67b2c7220b Fugang Duan 2020-04-19  1249  			padma_bd_buf =3D
6b4a83a75fc1dc Fugang Duan 2020-05-28  1250  				(adma_dual_desc_buf *)
6b4a83a75fc1dc Fugang Duan 2020-05-28  1251  					pmadapter->pcard_pcie->ev=
tbd_ring[i];
688b67b2c7220b Fugang Duan 2020-04-19  1252  =

688b67b2c7220b Fugang Duan 2020-04-19  1253  			if (padma_bd_buf) {
688b67b2c7220b Fugang Duan 2020-04-19  1254  				padma_bd_buf->paddr =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19  1255  				padma_bd_buf->len =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19  1256  				padma_bd_buf->flags =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19  1257  				padma_bd_buf->pkt_size =3D=
 0;
688b67b2c7220b Fugang Duan 2020-04-19  1258  				padma_bd_buf->reserved =3D=
 0;
688b67b2c7220b Fugang Duan 2020-04-19  1259  			}
688b67b2c7220b Fugang Duan 2020-04-19  1260  		}
688b67b2c7220b Fugang Duan 2020-04-19  1261  #endif
688b67b2c7220b Fugang Duan 2020-04-19  1262  		pmadapter->pcard_pcie->evtbd=
_ring[i] =3D MNULL;
688b67b2c7220b Fugang Duan 2020-04-19  1263  	}
688b67b2c7220b Fugang Duan 2020-04-19  1264  =

688b67b2c7220b Fugang Duan 2020-04-19  1265  	if (pmadapter->pcard_pcie->ev=
tbd_ring_vbase)
6b4a83a75fc1dc Fugang Duan 2020-05-28  1266  		pmadapter->callbacks.moal_mf=
ree_consistent(
6b4a83a75fc1dc Fugang Duan 2020-05-28  1267  			pmadapter->pmoal_handle,
6b4a83a75fc1dc Fugang Duan 2020-05-28  1268  			pmadapter->pcard_pcie->evtb=
d_ring_size,
6b4a83a75fc1dc Fugang Duan 2020-05-28  1269  			pmadapter->pcard_pcie->evtb=
d_ring_vbase,
6b4a83a75fc1dc Fugang Duan 2020-05-28  1270  			pmadapter->pcard_pcie->evtb=
d_ring_pbase);
688b67b2c7220b Fugang Duan 2020-04-19  1271  =

688b67b2c7220b Fugang Duan 2020-04-19  1272  	pmadapter->pcard_pcie->evtbd_=
rdptr =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19  1273  	pmadapter->pcard_pcie->evtbd_=
wrptr =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19  1274  	pmadapter->pcard_pcie->evtbd_=
ring_size =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19 @1275  	pmadapter->pcard_pcie->evtbd_=
ring_vbase =3D MNULL;
688b67b2c7220b Fugang Duan 2020-04-19  1276  	pmadapter->pcard_pcie->evtbd_=
ring_pbase =3D 0;
688b67b2c7220b Fugang Duan 2020-04-19  1277  =

688b67b2c7220b Fugang Duan 2020-04-19  1278  	LEAVE();
688b67b2c7220b Fugang Duan 2020-04-19  1279  	return MLAN_STATUS_SUCCESS;
688b67b2c7220b Fugang Duan 2020-04-19  1280  }
688b67b2c7220b Fugang Duan 2020-04-19  1281  =


:::::: The code at line 1213 was first introduced by commit
:::::: 688b67b2c7220b01521ffe560da7eee33042c7bd MLK-23806-01 net: wireless:=
 nxp: mxm_wifiex: add initial MxM wifi driver

:::::: TO: Fugang Duan <fugang.duan@nxp.com>
:::::: CC: Fugang Duan <fugang.duan@nxp.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8568539171169689375==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8568539171169689375==--

