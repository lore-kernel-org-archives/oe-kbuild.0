Content-Type: multipart/mixed; boundary="===============3661115459034506135=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ath/ath11k/qmi.c:2031:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Sun, 05 Dec 2021 17:52:12 +0800
Message-ID: <202112051707.dviVEz4z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3661115459034506135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Anilkumar Kolli <akolli@codeaurora.org>
CC: Kalle Valo <kvalo@codeaurora.org>
CC: Jouni Malinen <jouni@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79a72162048e42a677bc7336a9f5d86fc3ff9558
commit: 336e7b53c82fc74d261024773a0fab43623a94fb ath11k: clean up BDF downl=
oad functions
date:   10 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-c001-20211015 (https://download.01.org/0day-ci/arch=
ive/20211205/202112051707.dviVEz4z-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6069a6=
a5049497a32a50a49661c2f4169078bdba)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D336e7b53c82fc74d261024773a0fab43623a94fb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 336e7b53c82fc74d261024773a0fab43623a94fb
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:252:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:253:34: warning: Value store=
d to 'c' during its initialization is never read [clang-analyzer-deadcode.D=
eadStores]
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:253:34: note: Value stored t=
o 'c' during its initialization is never read
           struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
                                           ^   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:270:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:270:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:297:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:297:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:323:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:323:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:413:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:413:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:425:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:425:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:439:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:439:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:455:21: warning: Value store=
d to 'client' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cxd2820r_core.c:455:21: note: Value stored t=
o 'client' during its initialization is never read
           struct i2c_client *client =3D priv->client[0];
                              ^~~~~~   ~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/pci/ad1889.c:608:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, chip->card->shortname);
           ^~~~~~
   sound/pci/ad1889.c:608:2: note: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119
           strcpy(pcm->name, chip->card->shortname);
           ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/pci/atiixp.c:1588:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->driver, spdif_aclink ? "ATIIXP" : "ATIIXP-SPDMA");
           ^~~~~~
   sound/pci/atiixp.c:1588:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(card->driver, spdif_aclink ? "ATIIXP" : "ATIIXP-SPDMA");
           ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/pci/bt87x.c:675:2: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, name);
           ^~~~~~
   sound/pci/bt87x.c:675:2: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
           strcpy(pcm->name, name);
           ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/net/wireless/ath/ath11k/qmi.c:2031:2: warning: Undefined or garb=
age value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2651:27: note: Left side of '&&' i=
s false
           struct ath11k_qmi *qmi =3D container_of(work, struct ath11k_qmi,
                                    ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/wireless/ath/ath11k/qmi.c:2651:27: note: Taking false branch
           struct ath11k_qmi *qmi =3D container_of(work, struct ath11k_qmi,
                                    ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/wireless/ath/ath11k/qmi.c:2651:27: note: Loop condition is f=
alse.  Exiting loop
           struct ath11k_qmi *qmi =3D container_of(work, struct ath11k_qmi,
                                    ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2658:2: note: Loop condition is tr=
ue.  Entering loop body
           while (!list_empty(&qmi->event_list)) {
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2659:11: note: Left side of '&&' i=
s false
                   event =3D list_first_entry(&qmi->event_list,
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/wireless/ath/ath11k/qmi.c:2659:11: note: Taking false branch
                   event =3D list_first_entry(&qmi->event_list,
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/wireless/ath/ath11k/qmi.c:2659:11: note: Loop condition is f=
alse.  Exiting loop
                   event =3D list_first_entry(&qmi->event_list,
                           ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
--
                                 ^
   drivers/net/wireless/ath/ath11k/qmi.c:2054:2: note: Assuming the conditi=
on is false
           ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf_type %d\n", bdf_type);
           ^
   drivers/net/wireless/ath/ath11k/debug.h:63:6: note: expanded from macro =
'ath11k_dbg'
           if (ath11k_debug_mask & dbg_mask)                       \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2054:2: note: Taking false branch
           ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf_type %d\n", bdf_type);
           ^
   drivers/net/wireless/ath/ath11k/debug.h:63:2: note: expanded from macro =
'ath11k_dbg'
           if (ath11k_debug_mask & dbg_mask)                       \
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2054:2: note: Loop condition is fa=
lse.  Exiting loop
           ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi bdf_type %d\n", bdf_type);
           ^
   drivers/net/wireless/ath/ath11k/debug.h:61:46: note: expanded from macro=
 'ath11k_dbg'
   #define ath11k_dbg(ar, dbg_mask, fmt, ...)                      \
                                                                   ^
   drivers/net/wireless/ath/ath11k/qmi.c:2057:12: note: Assuming '__UNIQUE_=
ID___x499' is >=3D '__UNIQUE_ID___y500'
           fw_size =3D min_t(u32, ab->hw_params.fw.board_size, bd.len);
                     ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2057:12: note: '?' condition is fa=
lse
           fw_size =3D min_t(u32, ab->hw_params.fw.board_size, bd.len);
                     ^
   include/linux/minmax.h:104:27: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                   ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/net/wireless/ath/ath11k/qmi.c:2059:8: note: Calling 'ath11k_qmi_=
load_file_target_mem'
           ret =3D ath11k_qmi_load_file_target_mem(ab, bd.data, fw_size, bd=
f_type);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:1928:2: note: 'ret' declared witho=
ut an initial value
           int ret;
           ^~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:1931:8: note: Calling 'kzalloc'
           req =3D kzalloc(sizeof(*req), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:1931:8: note: Returning from 'kzal=
loc'
           req =3D kzalloc(sizeof(*req), GFP_KERNEL);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:1932:6: note: Assuming 'req' is no=
n-null
           if (!req)
               ^~~~
   drivers/net/wireless/ath/ath11k/qmi.c:1932:2: note: Taking false branch
           if (!req)
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:1937:6: note: Assuming field 'fixe=
d_bdf_addr' is false
           if (ab->bus_params.fixed_bdf_addr) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:1937:2: note: Taking false branch
           if (ab->bus_params.fixed_bdf_addr) {
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:1946:2: note: Loop condition is fa=
lse. Execution continues on line 2025
           while (remaining) {
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2025:21: note: Field 'fixed_bdf_ad=
dr' is false
           if (ab->bus_params.fixed_bdf_addr)
                              ^
   drivers/net/wireless/ath/ath11k/qmi.c:2025:2: note: Taking false branch
           if (ab->bus_params.fixed_bdf_addr)
           ^
   drivers/net/wireless/ath/ath11k/qmi.c:2031:2: note: Undefined or garbage=
 value returned to caller
           return ret;
           ^      ~~~
>> drivers/net/wireless/ath/ath11k/qmi.c:2056:2: warning: Value stored to '=
fw_size' is never read [clang-analyzer-deadcode.DeadStores]
           fw_size =3D bd.len;
           ^         ~~~~~~
   drivers/net/wireless/ath/ath11k/qmi.c:2056:2: note: Value stored to 'fw_=
size' is never read
           fw_size =3D bd.len;
           ^         ~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   net/ipv4/ip_tunnel.c:249:3: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, ops->kind);
                   ^~~~~~
   net/ipv4/ip_tunnel.c:249:3: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
                   strcpy(name, ops->kind);
                   ^~~~~~
   net/ipv4/ip_tunnel.c:250:3: warning: Call to function 'strcat' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(name, "%d");
                   ^~~~~~
   net/ipv4/ip_tunnel.c:250:3: note: Call to function 'strcat' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcat'. CWE-119
                   strcat(name, "%d");
                   ^~~~~~
   net/ipv4/ip_tunnel.c:1247:2: warning: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(tunnel->parms.name, dev->name);
           ^~~~~~
   net/ipv4/ip_tunnel.c:1247:2: note: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119
           strcpy(tunnel->parms.name, dev->name);
           ^~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   net/ipv4/sysctl_net_ipv4.c:325:10: warning: 4th function call argument i=
s an uninitialized value [clang-analyzer-core.CallAndMessage]
                   off +=3D snprintf(tbl.data + off, tbl.maxlen - off,
                          ^
   net/ipv4/sysctl_net_ipv4.c:298:20: note: Left side of '&&' is true
           struct net *net =3D container_of(table->data, struct net,
                             ^
   include/linux/kernel.h:495:19: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                            ^
   net/ipv4/sysctl_net_ipv4.c:298:20: note: Taking false branch
           struct net *net =3D container_of(table->data, struct net,
                             ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   net/ipv4/sysctl_net_ipv4.c:298:20: note: Loop condition is false.  Exiti=
ng loop
           struct net *net =3D container_of(table->data, struct net,
                             ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/ipv4/sysctl_net_ipv4.c:311:13: note: Calling 'kmalloc'
           tbl.data =3D kmalloc(tbl.maxlen, GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:311:13: note: Returning from 'kmalloc'
           tbl.data =3D kmalloc(tbl.maxlen, GFP_KERNEL);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:312:6: note: Assuming field 'data' is non-null
           if (!tbl.data)
               ^~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c:312:2: note: Taking false branch
           if (!tbl.data)
           ^
   net/ipv4/sysctl_net_ipv4.c:316:6: note: Assuming 'n_keys' is not equal t=
o 0
           if (!n_keys) {
               ^~~~~~~
   net/ipv4/sysctl_net_ipv4.c:316:2: note: Taking false branch
           if (!n_keys) {

vim +2031 drivers/net/wireless/ath/ath11k/qmi.c

d5c65159f28953 Kalle Valo      2019-11-23  1919  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1920  static int ath11k_qmi_load=
_file_target_mem(struct ath11k_base *ab,
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1921  					   const u8 *data, u3=
2 len, u8 type)
d5c65159f28953 Kalle Valo      2019-11-23  1922  {
d5c65159f28953 Kalle Valo      2019-11-23  1923  	struct qmi_wlanfw_bdf_dow=
nload_req_msg_v01 *req;
d5c65159f28953 Kalle Valo      2019-11-23  1924  	struct qmi_wlanfw_bdf_dow=
nload_resp_msg_v01 resp;
d5c65159f28953 Kalle Valo      2019-11-23  1925  	struct qmi_txn txn =3D {};
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1926  	const u8 *temp =3D data;
d5c65159f28953 Kalle Valo      2019-11-23  1927  	void __iomem *bdf_addr =
=3D NULL;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1928  	int ret;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1929  	u32 remaining =3D len;
d5c65159f28953 Kalle Valo      2019-11-23  1930  =

d5c65159f28953 Kalle Valo      2019-11-23  1931  	req =3D kzalloc(sizeof(*r=
eq), GFP_KERNEL);
d5c65159f28953 Kalle Valo      2019-11-23  1932  	if (!req)
d5c65159f28953 Kalle Valo      2019-11-23  1933  		return -ENOMEM;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1934  =

d5c65159f28953 Kalle Valo      2019-11-23  1935  	memset(&resp, 0, sizeof(r=
esp));
d5c65159f28953 Kalle Valo      2019-11-23  1936  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1937  	if (ab->bus_params.fixed_=
bdf_addr) {
c72aa32d6d1c04 Anilkumar Kolli 2021-09-28  1938  		bdf_addr =3D ioremap(ab-=
>hw_params.bdf_addr, ab->hw_params.fw.board_size);
d5c65159f28953 Kalle Valo      2019-11-23  1939  		if (!bdf_addr) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1940  			ath11k_warn(ab, "qmi io=
remap error for bdf_addr\n");
d5c65159f28953 Kalle Valo      2019-11-23  1941  			ret =3D -EIO;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1942  			goto err_free_req;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1943  		}
d5c65159f28953 Kalle Valo      2019-11-23  1944  	}
d5c65159f28953 Kalle Valo      2019-11-23  1945  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1946  	while (remaining) {
d5c65159f28953 Kalle Valo      2019-11-23  1947  		req->valid =3D 1;
d5c65159f28953 Kalle Valo      2019-11-23  1948  		req->file_id_valid =3D 1;
d5c65159f28953 Kalle Valo      2019-11-23  1949  		req->file_id =3D ab->qmi=
.target.board_id;
d5c65159f28953 Kalle Valo      2019-11-23  1950  		req->total_size_valid =
=3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1951  		req->total_size =3D rema=
ining;
d5c65159f28953 Kalle Valo      2019-11-23  1952  		req->seg_id_valid =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1953  		req->data_valid =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1954  		req->bdf_type =3D type;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1955  		req->bdf_type_valid =3D =
1;
d5c65159f28953 Kalle Valo      2019-11-23  1956  		req->end_valid =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1957  		req->end =3D 0;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1958  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1959  		if (remaining > QMI_WLAN=
FW_MAX_DATA_SIZE_V01) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1960  			req->data_len =3D QMI_W=
LANFW_MAX_DATA_SIZE_V01;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1961  		} else {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1962  			req->data_len =3D remai=
ning;
d5c65159f28953 Kalle Valo      2019-11-23  1963  			req->end =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1964  		}
d5c65159f28953 Kalle Valo      2019-11-23  1965  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1966  		if (ab->bus_params.fixed=
_bdf_addr) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1967  			req->data_valid =3D 0;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1968  			req->end =3D 1;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1969  			req->data_len =3D ATH11=
K_QMI_MAX_BDF_FILE_NAME_SIZE;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1970  		} else {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1971  			memcpy(req->data, temp,=
 req->data_len);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1972  		}
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1973  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1974  		if (ab->bus_params.fixed=
_bdf_addr) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1975  			if (type =3D=3D ATH11K_=
QMI_FILE_TYPE_CALDATA)
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1976  				bdf_addr +=3D ab->hw_p=
arams.fw.cal_offset;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1977  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1978  			memcpy_toio(bdf_addr, t=
emp, len);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1979  		}
d5c65159f28953 Kalle Valo      2019-11-23  1980  =

d5c65159f28953 Kalle Valo      2019-11-23  1981  		ret =3D qmi_txn_init(&ab=
->qmi.handle, &txn,
d5c65159f28953 Kalle Valo      2019-11-23  1982  				   qmi_wlanfw_bdf_down=
load_resp_msg_v01_ei,
d5c65159f28953 Kalle Valo      2019-11-23  1983  				   &resp);
d5c65159f28953 Kalle Valo      2019-11-23  1984  		if (ret < 0)
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1985  			goto err_iounmap;
d5c65159f28953 Kalle Valo      2019-11-23  1986  =

bf458d79cfc46f Kalle Valo      2021-02-22  1987  		ath11k_dbg(ab, ATH11K_DB=
G_QMI, "qmi bdf download req fixed addr type %d\n",
bf458d79cfc46f Kalle Valo      2021-02-22  1988  			   type);
bf458d79cfc46f Kalle Valo      2021-02-22  1989  =

d5c65159f28953 Kalle Valo      2019-11-23  1990  		ret =3D qmi_send_request=
(&ab->qmi.handle, NULL, &txn,
d5c65159f28953 Kalle Valo      2019-11-23  1991  				       QMI_WLANFW_BDF_=
DOWNLOAD_REQ_V01,
d5c65159f28953 Kalle Valo      2019-11-23  1992  				       QMI_WLANFW_BDF_=
DOWNLOAD_REQ_MSG_V01_MAX_LEN,
d5c65159f28953 Kalle Valo      2019-11-23  1993  				       qmi_wlanfw_bdf_=
download_req_msg_v01_ei, req);
d5c65159f28953 Kalle Valo      2019-11-23  1994  		if (ret < 0) {
d5c65159f28953 Kalle Valo      2019-11-23  1995  			qmi_txn_cancel(&txn);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  1996  			goto err_iounmap;
d5c65159f28953 Kalle Valo      2019-11-23  1997  		}
d5c65159f28953 Kalle Valo      2019-11-23  1998  =

d5c65159f28953 Kalle Valo      2019-11-23  1999  		ret =3D qmi_txn_wait(&tx=
n, msecs_to_jiffies(ATH11K_QMI_WLANFW_TIMEOUT_MS));
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2000  		if (ret < 0) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2001  			ath11k_warn(ab, "failed=
 to wait board file download request: %d\n",
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2002  				    ret);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2003  			goto err_iounmap;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2004  		}
d5c65159f28953 Kalle Valo      2019-11-23  2005  =

d5c65159f28953 Kalle Valo      2019-11-23  2006  		if (resp.resp.result !=
=3D QMI_RESULT_SUCCESS_V01) {
097e9f0714555e Kalle Valo      2021-02-22  2007  			ath11k_warn(ab, "board =
file download request failed: %d %d\n",
d5c65159f28953 Kalle Valo      2019-11-23  2008  				    resp.resp.result, =
resp.resp.error);
d5c65159f28953 Kalle Valo      2019-11-23  2009  			ret =3D -EINVAL;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2010  			goto err_iounmap;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2011  		}
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2012  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2013  		if (ab->bus_params.fixed=
_bdf_addr) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2014  			remaining =3D 0;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2015  		} else {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2016  			remaining -=3D req->dat=
a_len;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2017  			temp +=3D req->data_len;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2018  			req->seg_id++;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2019  			ath11k_dbg(ab, ATH11K_D=
BG_QMI, "qmi bdf download request remaining %i\n",
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2020  				   remaining);
d5c65159f28953 Kalle Valo      2019-11-23  2021  		}
d5c65159f28953 Kalle Valo      2019-11-23  2022  	}
d5c65159f28953 Kalle Valo      2019-11-23  2023  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2024  err_iounmap:
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2025  	if (ab->bus_params.fixed_=
bdf_addr)
d5c65159f28953 Kalle Valo      2019-11-23  2026  		iounmap(bdf_addr);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2027  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2028  err_free_req:
d5c65159f28953 Kalle Valo      2019-11-23  2029  	kfree(req);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2030  =

d5c65159f28953 Kalle Valo      2019-11-23 @2031  	return ret;
d5c65159f28953 Kalle Valo      2019-11-23  2032  }
d5c65159f28953 Kalle Valo      2019-11-23  2033  =

6eb6ea51382873 Govind Singh    2020-08-14  2034  static int ath11k_qmi_load=
_bdf_qmi(struct ath11k_base *ab)
6eb6ea51382873 Govind Singh    2020-08-14  2035  {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2036  	char filename[ATH11K_QMI_=
MAX_BDF_FILE_NAME_SIZE];
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2037  	const struct firmware *fw=
_entry;
6eb6ea51382873 Govind Singh    2020-08-14  2038  	struct ath11k_board_data =
bd;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2039  	u32 fw_size, file_type;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2040  	int ret =3D 0, bdf_type;
6eb6ea51382873 Govind Singh    2020-08-14  2041  =

6eb6ea51382873 Govind Singh    2020-08-14  2042  	memset(&bd, 0, sizeof(bd)=
);
6eb6ea51382873 Govind Singh    2020-08-14  2043  	ret =3D ath11k_core_fetch=
_bdf(ab, &bd);
6eb6ea51382873 Govind Singh    2020-08-14  2044  	if (ret) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2045  		ath11k_warn(ab, "qmi fai=
led to fetch board file: %d\n", ret);
6eb6ea51382873 Govind Singh    2020-08-14  2046  		goto out;
6eb6ea51382873 Govind Singh    2020-08-14  2047  	}
6eb6ea51382873 Govind Singh    2020-08-14  2048  =

616c16a4b26a9f Ben Greear      2020-09-29  2049  	if (bd.len >=3D SELFMAG &=
& memcmp(bd.data, ELFMAG, SELFMAG) =3D=3D 0)
616c16a4b26a9f Ben Greear      2020-09-29  2050  		bdf_type =3D ATH11K_QMI_=
BDF_TYPE_ELF;
616c16a4b26a9f Ben Greear      2020-09-29  2051  	else
616c16a4b26a9f Ben Greear      2020-09-29  2052  		bdf_type =3D ATH11K_QMI_=
BDF_TYPE_BIN;
616c16a4b26a9f Ben Greear      2020-09-29  2053  =

616c16a4b26a9f Ben Greear      2020-09-29  2054  	ath11k_dbg(ab, ATH11K_DBG=
_QMI, "qmi bdf_type %d\n", bdf_type);
616c16a4b26a9f Ben Greear      2020-09-29  2055  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28 @2056  	fw_size =3D bd.len;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2057  	fw_size =3D min_t(u32, ab=
->hw_params.fw.board_size, bd.len);
6eb6ea51382873 Govind Singh    2020-08-14  2058  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2059  	ret =3D ath11k_qmi_load_f=
ile_target_mem(ab, bd.data, fw_size, bdf_type);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2060  	if (ret < 0) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2061  		ath11k_warn(ab, "qmi fai=
led to load bdf file\n");
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2062  		goto out;
6eb6ea51382873 Govind Singh    2020-08-14  2063  	}
6eb6ea51382873 Govind Singh    2020-08-14  2064  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2065  	/* QCA6390 does not suppo=
rt cal data file, skip it */
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2066  	if (bdf_type =3D=3D ATH11=
K_QMI_BDF_TYPE_ELF)
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2067  		goto out;
6eb6ea51382873 Govind Singh    2020-08-14  2068  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2069  	file_type =3D ATH11K_QMI_=
FILE_TYPE_CALDATA;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2070  	fw_entry =3D ath11k_core_=
firmware_request(ab, ATH11K_DEFAULT_CAL_FILE);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2071  	if (IS_ERR(fw_entry)) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2072  		ret =3D PTR_ERR(fw_entry=
);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2073  		ath11k_warn(ab,
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2074  			    "qmi failed to load=
 CAL data file:%s\n",
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2075  			    filename);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2076  		goto out;
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2077  	}
bf458d79cfc46f Kalle Valo      2021-02-22  2078  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2079  	fw_size =3D min_t(u32, ab=
->hw_params.fw.board_size, fw_entry->size);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2080  	ret =3D ath11k_qmi_load_f=
ile_target_mem(ab, fw_entry->data, fw_size, file_type);
6eb6ea51382873 Govind Singh    2020-08-14  2081  	if (ret < 0) {
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2082  		ath11k_warn(ab, "qmi fai=
led to load caldata\n");
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2083  		goto out_qmi_cal;
6eb6ea51382873 Govind Singh    2020-08-14  2084  	}
6eb6ea51382873 Govind Singh    2020-08-14  2085  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2086  	ath11k_dbg(ab, ATH11K_DBG=
_QMI, "qmi caldata downloaded: type: %u\n",
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2087  		   file_type);
6eb6ea51382873 Govind Singh    2020-08-14  2088  =

336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2089  out_qmi_cal:
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2090  	release_firmware(fw_entry=
);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2091  out:
6eb6ea51382873 Govind Singh    2020-08-14  2092  	ath11k_core_free_bdf(ab, =
&bd);
336e7b53c82fc7 Anilkumar Kolli 2021-09-28  2093  	ath11k_dbg(ab, ATH11K_DBG=
_QMI, "qmi BDF download sequence completed\n");
6eb6ea51382873 Govind Singh    2020-08-14  2094  =

6eb6ea51382873 Govind Singh    2020-08-14  2095  	return ret;
6eb6ea51382873 Govind Singh    2020-08-14  2096  }
6eb6ea51382873 Govind Singh    2020-08-14  2097  =


:::::: The code@line 2031 was first introduced by commit
:::::: d5c65159f2895379e11ca13f62feabe93278985d ath11k: driver for Qualcomm=
 IEEE 802.11ax devices

:::::: TO: Kalle Valo <kvalo@codeaurora.org>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3661115459034506135==--

