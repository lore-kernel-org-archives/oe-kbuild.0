Content-Type: multipart/mixed; boundary="===============2383774140975048223=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3882/5845] drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:851:8: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Tue, 26 Apr 2022 11:24:57 +0800
Message-ID: <202204261138.XWdwXRmw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2383774140975048223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jiri Pirko <jiri@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e7d6987e09a328d4a949701db40ef63fbb970670
commit: b217127e5e4ee0ecfce7c5f84cfe082238123bda [3882/5845] mlxsw: core_li=
necards: Add line card objects and implement provisioning
:::::: branch date: 4 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-c006-20220424 (https://download.01.org/0day-ci/arc=
hive/20220426/202204261138.XWdwXRmw-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db217127e5e4ee0ecfce7c5f84cfe082238123bda
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b217127e5e4ee0ecfce7c5f84cfe082238123bda
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/net/wireless/ti/wlcore/main.c:6305:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&wl->bands[NL80211_BAND_2GHZ], &wl1271_band_2ghz,
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6305:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&wl->bands[NL80211_BAND_2GHZ], &wl1271_band_2ghz,
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6307:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&wl->bands[NL80211_BAND_2GHZ].ht_cap,
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6307:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&wl->bands[NL80211_BAND_2GHZ].ht_cap,
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6310:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&wl->bands[NL80211_BAND_5GHZ], &wl1271_band_5ghz,
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6310:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&wl->bands[NL80211_BAND_5GHZ], &wl1271_band_5ghz,
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6312:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&wl->bands[NL80211_BAND_5GHZ].ht_cap,
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6312:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&wl->bands[NL80211_BAND_5GHZ].ht_cap,
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6373:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(wl, 0, sizeof(*wl));
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6373:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(wl, 0, sizeof(*wl));
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6431:2: warning: Call to function =
'memset' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memset_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(wl->tx_frames_map, 0, sizeof(wl->tx_frames_map));
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6431:2: note: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11
           memset(wl->tx_frames_map, 0, sizeof(wl->tx_frames_map));
           ^~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6573:13: warning: Access to field =
'nvs_name' results in a dereference of a null pointer (loaded from field 'f=
amily') [clang-analyzer-core.NullDereference]
           } else if (pdev_data->family->nvs_name) {
                      ^
   drivers/net/wireless/ti/wlcore/main.c:6778:6: note: Assuming field 'ops'=
 is non-null
           if (!wl->ops || !wl->ptable || !pdev_data)
               ^~~~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6778:6: note: Left side of '||' is=
 false
   drivers/net/wireless/ti/wlcore/main.c:6778:18: note: Assuming field 'pta=
ble' is non-null
           if (!wl->ops || !wl->ptable || !pdev_data)
                           ^~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6778:6: note: Left side of '||' is=
 false
           if (!wl->ops || !wl->ptable || !pdev_data)
               ^
   drivers/net/wireless/ti/wlcore/main.c:6778:33: note: Assuming 'pdev_data=
' is non-null
           if (!wl->ops || !wl->ptable || !pdev_data)
                                          ^~~~~~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6778:2: note: Taking false branch
           if (!wl->ops || !wl->ptable || !pdev_data)
           ^
   drivers/net/wireless/ti/wlcore/main.c:6785:6: note: Assuming field 'fami=
ly' is null
           if (pdev_data->family && pdev_data->family->nvs_name) {
               ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6785:24: note: Left side of '&&' i=
s false
           if (pdev_data->family && pdev_data->family->nvs_name) {
                                 ^
   drivers/net/wireless/ti/wlcore/main.c:6796:3: note: Calling 'wlcore_nvs_=
cb'
                   wlcore_nvs_cb(NULL, wl);
                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/main.c:6566:6: note: 'fw' is null
           if (fw) {
               ^~
   drivers/net/wireless/ti/wlcore/main.c:6566:2: note: Taking false branch
           if (fw) {
           ^
   drivers/net/wireless/ti/wlcore/main.c:6573:13: note: Access to field 'nv=
s_name' results in a dereference of a null pointer (loaded from field 'fami=
ly')
           } else if (pdev_data->family->nvs_name) {
                      ^          ~~~~~~
   Suppressed 69 warnings (69 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   228 warnings generated.
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:571:2: warning: Cal=
l to function 'memcpy' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'memcpy_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(event->mddq_pl, mddq_pl, sizeof(event->mddq_pl));
           ^~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:571:2: note: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11
           memcpy(event->mddq_pl, mddq_pl, sizeof(event->mddq_pl));
           ^~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:604:2: warning: Cal=
l to function 'memcpy' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'memcpy_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(event->mbct_pl, mbct_pl, sizeof(event->mbct_pl));
           ^~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:604:2: note: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11
           memcpy(event->mbct_pl, mbct_pl, sizeof(event->mbct_pl));
           ^~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:789:8: warning: Cal=
l to function 'snprintf' is insecure as it does not provide security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'snprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           err =3D snprintf(filename, sizeof(filename),
                 ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:789:8: note: Call t=
o function 'snprintf' is insecure as it does not provide security checks in=
troduced in the C11 standard. Replace with analogous functions that support=
 length arguments or provides boundary checks such as 'snprintf_s' in case =
of C11
           err =3D snprintf(filename, sizeof(filename),
                 ^~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:816:2: warning: Cal=
l to function 'memcpy' is insecure as it does not provide security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'memcpy_s' in case o=
f C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(types_info->data, firmware->data, types_info->data_size);
           ^~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:816:2: note: Call t=
o function 'memcpy' is insecure as it does not provide security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'memcpy_s' in case of C=
11
           memcpy(types_info->data, firmware->data, types_info->data_size);
           ^~~~~~
>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:851:8: warning: Use=
 of memory after it is freed [clang-analyzer-unix.Malloc]
           kfree(types_info->ini_files);
                 ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:867:6: note: Assumi=
ng 'err' is 0
           if (err)
               ^~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:867:2: note: Taking=
 false branch
           if (err)
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:872:6: note: Assumi=
ng 'slot_count' is not equal to 0
           if (!slot_count)
               ^~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:872:2: note: Taking=
 false branch
           if (!slot_count)
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:876:6: note: Assumi=
ng 'linecards' is non-null
           if (!linecards)
               ^~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:876:2: note: Taking=
 false branch
           if (!linecards)
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:882:8: note: Callin=
g 'mlxsw_linecard_types_init'
           err =3D mlxsw_linecard_types_init(mlxsw_core, linecards);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:792:10: note: Assum=
ing the condition is false
           WARN_ON(err >=3D sizeof(filename));
                   ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:796:6: note: Assumi=
ng 'err' is 0
           if (err) {
               ^~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:796:2: note: Taking=
 false branch
           if (err) {
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:803:6: note: Assumi=
ng 'types_info' is non-null
           if (!types_info) {
               ^~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:803:2: note: Taking=
 false branch
           if (!types_info) {
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:811:6: note: Assumi=
ng field 'data' is non-null
           if (!types_info->data) {
               ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:811:2: note: Taking=
 false branch
           if (!types_info->data) {
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:820:6: note: 'err' =
is -22
           if (err) {
               ^~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:820:2: note: Taking=
 true branch
           if (err) {
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:822:3: note: Contro=
l jumps to line 839
                   goto err_type_file_file_validate;
                   ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:841:2: note: Memory=
 is released
           kfree(types_info);
           ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:882:8: note: Return=
ing; memory was released
           err =3D mlxsw_linecard_types_init(mlxsw_core, linecards);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:883:6: note: 'err' =
is 0
           if (err)
               ^~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:883:2: note: Taking=
 false branch
           if (err)
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:889:6: note: Assumi=
ng 'err' is not equal to 0
           if (err)
               ^~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:889:2: note: Taking=
 true branch
           if (err)
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:890:3: note: Contro=
l jumps to line 909
                   goto err_traps_register;
                   ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:909:2: note: Callin=
g 'mlxsw_linecard_types_fini'
           mlxsw_linecard_types_fini(linecards);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:849:7: note: 'types=
_info' is non-null
           if (!types_info)
                ^~~~~~~~~~
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:849:2: note: Taking=
 false branch
           if (!types_info)
           ^
   drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:851:8: note: Use of=
 memory after it is freed
           kfree(types_info->ini_files);
                 ^~~~~~~~~~~~~~~~~~~~~
   Suppressed 223 warnings (223 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   89 warnings generated.
   Suppressed 89 warnings (89 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   drivers/vdpa/mlx5/core/mr.c:508:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(mr, 0, sizeof(*mr));
           ^~~~~~
   drivers/vdpa/mlx5/core/mr.c:508:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(mr, 0, sizeof(*mr));

vim +851 drivers/net/ethernet/mellanox/mlxsw/core_linecards.c

b217127e5e4ee0ec Jiri Pirko 2022-04-18  844  =

b217127e5e4ee0ec Jiri Pirko 2022-04-18  845  static void mlxsw_linecard_typ=
es_fini(struct mlxsw_linecards *linecards)
b217127e5e4ee0ec Jiri Pirko 2022-04-18  846  {
b217127e5e4ee0ec Jiri Pirko 2022-04-18  847  	struct mlxsw_linecard_types_i=
nfo *types_info =3D linecards->types_info;
b217127e5e4ee0ec Jiri Pirko 2022-04-18  848  =

b217127e5e4ee0ec Jiri Pirko 2022-04-18  849  	if (!types_info)
b217127e5e4ee0ec Jiri Pirko 2022-04-18  850  		return;
b217127e5e4ee0ec Jiri Pirko 2022-04-18 @851  	kfree(types_info->ini_files);
b217127e5e4ee0ec Jiri Pirko 2022-04-18  852  	vfree(types_info->data);
b217127e5e4ee0ec Jiri Pirko 2022-04-18  853  	kfree(types_info);
b217127e5e4ee0ec Jiri Pirko 2022-04-18  854  }
b217127e5e4ee0ec Jiri Pirko 2022-04-18  855  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2383774140975048223==--

