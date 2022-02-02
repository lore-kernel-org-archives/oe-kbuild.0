Content-Type: multipart/mixed; boundary="===============1398786540648466900=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/smc/af_smc.c:523:2: warning: Null pointer passed as 2nd argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Wed, 02 Feb 2022 15:33:39 +0800
Message-ID: <202202021513.brUoKj8S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1398786540648466900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Karsten Graul <kgraul@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f7fb8de5d9bac17b6392a14af40baf555d9129b
commit: e5c4744cfb598f98672f8d21d59ef2c1fa9c9b5f net/smc: add SMC-Rv2 conne=
ction establishment
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220201 (https://download.01.org/0day-ci/archi=
ve/20220202/202202021513.brUoKj8S-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e84=
4b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De5c4744cfb598f98672f8d21d59ef2c1fa9c9b5f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e5c4744cfb598f98672f8d21d59ef2c1fa9c9b5f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/mpls/af_mpls.c:2553:3: note: Left side of '||' is false
                   RCU_INIT_POINTER(labels[MPLS_LABEL_IPV6NULL], rt2);
                   ^
   include/linux/rcupdate.h:853:3: note: expanded from macro 'RCU_INIT_POIN=
TER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   net/mpls/af_mpls.c:2553:3: note: Left side of '||' is true
                   RCU_INIT_POINTER(labels[MPLS_LABEL_IPV6NULL], rt2);
                   ^
   include/linux/rcupdate.h:853:3: note: expanded from macro 'RCU_INIT_POIN=
TER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   net/mpls/af_mpls.c:2553:3: note: Taking false branch
                   RCU_INIT_POINTER(labels[MPLS_LABEL_IPV6NULL], rt2);
                   ^
   include/linux/rcupdate.h:853:3: note: expanded from macro 'RCU_INIT_POIN=
TER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   net/mpls/af_mpls.c:2553:3: note: Loop condition is false.  Exiting loop
                   RCU_INIT_POINTER(labels[MPLS_LABEL_IPV6NULL], rt2);
                   ^
   include/linux/rcupdate.h:853:3: note: expanded from macro 'RCU_INIT_POIN=
TER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
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
   net/mpls/af_mpls.c:2553:3: note: Dereference of null pointer
                   RCU_INIT_POINTER(labels[MPLS_LABEL_IPV6NULL], rt2);
                   ^
   include/linux/rcupdate.h:853:3: note: expanded from macro 'RCU_INIT_POIN=
TER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> net/smc/af_smc.c:523:2: warning: Null pointer passed as 2nd argument to =
memory copy function [clang-analyzer-unix.cstring.NullArg]
           memcpy(link->peer_gid, ini->peer_gid, SMC_GID_SIZE);
           ^
   net/smc/af_smc.c:1850:29: note: Left side of '&&' is false
           struct smc_sock *new_smc =3D container_of(work, struct smc_sock,
                                      ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   net/smc/af_smc.c:1850:29: note: Taking false branch
           struct smc_sock *new_smc =3D container_of(work, struct smc_sock,
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
   net/smc/af_smc.c:1850:29: note: Loop condition is false.  Exiting loop
           struct smc_sock *new_smc =3D container_of(work, struct smc_sock,
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
   net/smc/af_smc.c:1852:15: note: Assuming the condition is false
           u8 version =3D smc_ism_is_v2_capable() ? SMC_V2 : SMC_V1;
                        ^~~~~~~~~~~~~~~~~~~~~~~
   net/smc/af_smc.c:1852:15: note: '?' condition is false
   net/smc/af_smc.c:1860:6: note: Assuming field 'skc_state' is equal to SM=
C_LISTEN
           if (new_smc->listen_smc->sk.sk_state !=3D SMC_LISTEN)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/smc/af_smc.c:1860:2: note: Taking false branch
           if (new_smc->listen_smc->sk.sk_state !=3D SMC_LISTEN)
           ^
   net/smc/af_smc.c:1863:6: note: Assuming field 'use_fallback' is false
           if (new_smc->use_fallback) {
               ^~~~~~~~~~~~~~~~~~~~~
   net/smc/af_smc.c:1863:2: note: Taking false branch
           if (new_smc->use_fallback) {
           ^
   net/smc/af_smc.c:1869:6: note: Assuming field 'syn_smc' is true
           if (!tcp_sk(newclcsock->sk)->syn_smc) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/smc/af_smc.c:1869:2: note: Taking false branch
           if (!tcp_sk(newclcsock->sk)->syn_smc) {
           ^
   net/smc/af_smc.c:1879:6: note: Assuming 'buf' is non-null
           if (!buf) {
               ^~~~
   net/smc/af_smc.c:1879:2: note: Taking false branch
           if (!buf) {
           ^
   net/smc/af_smc.c:1886:6: note: Assuming 'rc' is 0
           if (rc)
               ^~
   net/smc/af_smc.c:1886:2: note: Taking false branch
           if (rc)
           ^
   net/smc/af_smc.c:1888:12: note: Assuming field 'version' is not equal to=
 SMC_V1
           version =3D pclc->hdr.version =3D=3D SMC_V1 ? SMC_V1 : version;
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/smc/af_smc.c:1888:12: note: '?' condition is false
   net/smc/af_smc.c:1891:2: note: Taking false branch
           if (using_ipsec(new_smc)) {
           ^
   net/smc/af_smc.c:1897:6: note: Assuming 'ini' is non-null
           if (!ini) {
               ^~~~
   net/smc/af_smc.c:1897:2: note: Taking false branch
           if (!ini) {
           ^
   net/smc/af_smc.c:1904:6: note: 'rc' is 0
           if (rc)
               ^~
   net/smc/af_smc.c:1904:2: note: Taking false branch
           if (rc)
           ^
   net/smc/af_smc.c:1914:6: note: 'rc' is 0
           if (rc)
               ^~

vim +523 net/smc/af_smc.c

413498440e30bfe Hans Wippel   2018-06-28  517  =

0cfdd8f92cac01a Ursula Braun  2017-01-09  518  static void smc_link_save_pe=
er_info(struct smc_link *link,
e5c4744cfb598f9 Karsten Graul 2021-10-16  519  				    struct smc_clc_msg_a=
ccept_confirm *clc,
e5c4744cfb598f9 Karsten Graul 2021-10-16  520  				    struct smc_init_info=
 *ini)
0cfdd8f92cac01a Ursula Braun  2017-01-09  521  {
3d9725a6a1330be Ursula Braun  2020-09-10  522  	link->peer_qpn =3D ntoh24(c=
lc->r0.qpn);
e5c4744cfb598f9 Karsten Graul 2021-10-16 @523  	memcpy(link->peer_gid, ini-=
>peer_gid, SMC_GID_SIZE);
e5c4744cfb598f9 Karsten Graul 2021-10-16  524  	memcpy(link->peer_mac, ini-=
>peer_mac, sizeof(link->peer_mac));
3d9725a6a1330be Ursula Braun  2020-09-10  525  	link->peer_psn =3D ntoh24(c=
lc->r0.psn);
3d9725a6a1330be Ursula Braun  2020-09-10  526  	link->peer_mtu =3D clc->r0.=
qp_mtu;
0cfdd8f92cac01a Ursula Braun  2017-01-09  527  }
0cfdd8f92cac01a Ursula Braun  2017-01-09  528  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1398786540648466900==--

