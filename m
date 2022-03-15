Content-Type: multipart/mixed; boundary="===============6317733027177129304=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ata/pata_bk3710.c:179:4: warning: Value stored to 'mode' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 15 Mar 2022 21:56:10 +0800
Message-ID: <202203152104.IXpB2wHf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6317733027177129304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Hannes Reinecke <hare@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: a3d11c275b647b5b56b907011b432e00f7ddb683 ata: pata_bk3710: add comp=
ile test support
date:   9 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20220312 (https://download.01.org/0day-ci/archi=
ve/20220315/202203152104.IXpB2wHf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da3d11c275b647b5b56b907011b432e00f7ddb683
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a3d11c275b647b5b56b907011b432e00f7ddb683
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/crypto/hifn_795x.c:598:8: warning: Excessive padding in 'struct =
hifn_crypto_alg' (52 padding bytes, where 20 is optimal). =

   Optimal fields order: =

   alg, =

   dev, =

   entry, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct hifn_crypto_alg {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/crypto/hifn_795x.c:598:8: note: Excessive padding in 'struct hif=
n_crypto_alg' (52 padding bytes, where 20 is optimal). Optimal fields order=
: alg, dev, entry, consider reordering the fields or adding explicit paddin=
g members
   struct hifn_crypto_alg {
   ~~~~~~~^~~~~~~~~~~~~~~~~
   drivers/crypto/hifn_795x.c:1103:3: warning: Null pointer passed as 2nd a=
rgument to memory copy function [clang-analyzer-unix.cstring.NullArg]
                   memcpy(buf_pos, iv, ivsize);
                   ^
   drivers/crypto/hifn_795x.c:1125:2: note: Control jumps to 'case 1:'  at =
line 1129
           switch (rctx->op) {
           ^
   drivers/crypto/hifn_795x.c:1131:3: note:  Execution continues on line 11=
39
                   break;
                   ^
   drivers/crypto/hifn_795x.c:1142:12: note: Field 'op' is equal to ACRYPTO=
_OP_ENCRYPT
           if (rctx->op =3D=3D ACRYPTO_OP_ENCRYPT || rctx->op =3D=3D ACRYPT=
O_OP_DECRYPT) {
                     ^
   drivers/crypto/hifn_795x.c:1142:37: note: Left side of '||' is true
           if (rctx->op =3D=3D ACRYPTO_OP_ENCRYPT || rctx->op =3D=3D ACRYPT=
O_OP_DECRYPT) {
                                              ^
   drivers/crypto/hifn_795x.c:1145:7: note: Assuming field 'keysize' is not=
 equal to 0
                   if (ctx->keysize)
                       ^~~~~~~~~~~~
   drivers/crypto/hifn_795x.c:1145:3: note: Taking true branch
                   if (ctx->keysize)
                   ^
   drivers/crypto/hifn_795x.c:1147:7: note: Assuming field 'iv' is null
                   if (rctx->iv && rctx->mode !=3D ACRYPTO_MODE_ECB)
                       ^~~~~~~~
   drivers/crypto/hifn_795x.c:1147:16: note: Left side of '&&' is false
                   if (rctx->iv && rctx->mode !=3D ACRYPTO_MODE_ECB)
                                ^
   drivers/crypto/hifn_795x.c:1150:3: note: Control jumps to 'case 3:'  at =
line 1160
                   switch (rctx->mode) {
                   ^
   drivers/crypto/hifn_795x.c:1162:4: note:  Execution continues on line 11=
67
                           break;
                           ^
   drivers/crypto/hifn_795x.c:1167:3: note: Control jumps to 'case 4:'  at =
line 1191
                   switch (rctx->type) {
                   ^
   drivers/crypto/hifn_795x.c:1192:8: note: Assuming field 'keysize' is equ=
al to 8
                           if (ctx->keysize !=3D 8)
                               ^~~~~~~~~~~~~~~~~
   drivers/crypto/hifn_795x.c:1192:4: note: Taking false branch
                           if (ctx->keysize !=3D 8)
                           ^
   drivers/crypto/hifn_795x.c:1195:4: note:  Execution continues on line 12=
00
                           break;
                           ^
   drivers/crypto/hifn_795x.c:1202:5: note: Passing null pointer value via =
7th parameter 'iv'
                                   rctx->iv, rctx->ivsize, md);
                                   ^~~~~~~~
   drivers/crypto/hifn_795x.c:1200:14: note: Calling 'hifn_setup_crypto_com=
mand'
                   buf_pos +=3D hifn_setup_crypto_command(dev, buf_pos,
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/hifn_795x.c:1093:6: note: Assuming field 'cmdu' is <=3D 1
           if (dma->cmdu > 1) {
               ^~~~~~~~~~~~~
   drivers/crypto/hifn_795x.c:1093:2: note: Taking false branch
           if (dma->cmdu > 1) {
           ^
   drivers/crypto/hifn_795x.c:1098:6: note: 'keylen' is 8
           if (keylen) {
               ^~~~~~
   drivers/crypto/hifn_795x.c:1098:2: note: Taking true branch
           if (keylen) {
           ^
   drivers/crypto/hifn_795x.c:1102:6: note: Assuming 'ivsize' is not equal =
to 0
           if (ivsize) {
               ^~~~~~
   drivers/crypto/hifn_795x.c:1102:2: note: Taking true branch
           if (ivsize) {
           ^
   drivers/crypto/hifn_795x.c:1103:3: note: Null pointer passed as 2nd argu=
ment to memory copy function
                   memcpy(buf_pos, iv, ivsize);
                   ^               ~~
   drivers/crypto/hifn_795x.c:1124:2: warning: Value stored to 'mask' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           mask =3D 0;
           ^      ~
   drivers/crypto/hifn_795x.c:1124:2: note: Value stored to 'mask' is never=
 read
           mask =3D 0;
           ^      ~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/ata/pata_bk3710.c:179:4: warning: Value stored to 'mode' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                           mode =3D mode2;
                           ^      ~~~~~
   drivers/ata/pata_bk3710.c:179:4: note: Value stored to 'mode' is never r=
ead
                           mode =3D mode2;
                           ^      ~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   net/socket.c:585:3: warning: Value stored to 'buffer' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   buffer +=3D len;
                   ^         ~~~
   net/socket.c:585:3: note: Value stored to 'buffer' is never read
                   buffer +=3D len;
                   ^         ~~~
   net/socket.c:644:6: warning: Access to field 'ops' results in a derefere=
nce of a null pointer (loaded from variable 'sock') [clang-analyzer-core.Nu=
llDereference]
           if (sock->ops) {
               ^
   net/socket.c:3419:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   net/socket.c:3419:2: note: Taking false branch
           if (err < 0)
           ^
   net/socket.c:3423:6: note: Assuming 'err' is < 0
           if (err < 0) {
               ^~~~~~~
   net/socket.c:3423:2: note: Taking true branch
           if (err < 0) {
           ^
   net/socket.c:3424:16: note: Passing null pointer value via 1st parameter=
 'sock'
                   sock_release(*newsock);
                                ^~~~~~~~
   net/socket.c:3424:3: note: Calling 'sock_release'
                   sock_release(*newsock);
                   ^~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:677:17: note: Passing null pointer value via 1st parameter =
'sock'
           __sock_release(sock, NULL);
                          ^~~~
   net/socket.c:677:2: note: Calling '__sock_release'
           __sock_release(sock, NULL);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:644:6: note: Access to field 'ops' results in a dereference=
 of a null pointer (loaded from variable 'sock')
           if (sock->ops) {
               ^~~~
   net/socket.c:1561:9: warning: 1st function call argument is an uninitial=
ized value [clang-analyzer-core.CallAndMessage]
           return sock_map_fd(sock, flags & (O_CLOEXEC | O_NONBLOCK));
                  ^
   net/socket.c:1564:1: note: Calling '__do_sys_socket'
   SYSCALL_DEFINE3(socket, int, family, int, type, int, protocol)
   ^
   include/linux/syscalls.h:219:36: note: expanded from macro 'SYSCALL_DEFI=
NE3'
   #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS=
__)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFIN=
Ex'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:249:14: note: expanded from macro '__SYSCALL_DE=
FINEx'
                   long ret =3D __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS_=
_));\
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: expanded from here
   net/socket.c:1566:9: note: Calling '__sys_socket'
           return __sys_socket(family, type, protocol);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/socket.c:1540:2: note: 'sock' declared without an initial value
           struct socket *sock;
           ^~~~~~~~~~~~~~~~~~~
   net/socket.c:1544:15: note: 524288 is equal to 524288
           BUILD_BUG_ON(SOCK_CLOEXEC !=3D O_CLOEXEC);
                        ^
   include/linux/net.h:77:22: note: expanded from macro 'SOCK_CLOEXEC'
   #define SOCK_CLOEXEC    O_CLOEXEC
                           ^~~~~~~~~
   include/uapi/asm-generic/fcntl.h:63:19: note: expanded from macro 'O_CLO=
EXEC'
   #define O_CLOEXEC       02000000        /* set close_on_exec */
                           ^~~~~~~~
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
                            ^~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:335:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:323:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:315:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   net/socket.c:1544:2: note: Taking false branch
           BUILD_BUG_ON(SOCK_CLOEXEC !=3D O_CLOEXEC);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^

vim +/mode +179 drivers/ata/pata_bk3710.c

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  148  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  149  static void pata=
_bk3710_setpiomode(void __iomem *base, struct ata_device *pair,
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  150  				   unsigned =
int dev, unsigned int cycletime,
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  151  				   unsigned =
int mode)
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  152  {
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  153  	const struct at=
a_timing *t;
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  154  	u32 val32;
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  155  	u8 t2, t2i, t0;
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  156  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  157  	t =3D ata_timin=
g_find_mode(XFER_PIO_0 + mode);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  158  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  159  	/* PIO Data Set=
up */
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  160  	t0 =3D DIV_ROUN=
D_UP(cycletime, ideclk_period);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  161  	t2 =3D DIV_ROUN=
D_UP(t->active, ideclk_period);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  162  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  163  	t2i =3D t0 - t2=
 - 1;
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  164  	t2--;
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  165  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  166  	val32 =3D iorea=
d32(base + BK3710_DATSTB) & (0xFF << (dev ? 0 : 8));
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  167  	val32 |=3D t2 <=
< (dev ? 8 : 0);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  168  	iowrite32(val32=
, base + BK3710_DATSTB);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  169  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  170  	val32 =3D iorea=
d32(base + BK3710_DATRCVR) & (0xFF << (dev ? 0 : 8));
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  171  	val32 |=3D t2i =
<< (dev ? 8 : 0);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  172  	iowrite32(val32=
, base + BK3710_DATRCVR);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  173  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  174  	/* FIXME: this =
is broken also in the old driver */
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  175  	if (pair) {
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  176  		u8 mode2 =3D p=
air->pio_mode - XFER_PIO_0;
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  177  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  178  		if (mode2 < mo=
de)
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22 @179  			mode =3D mode=
2;
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  180  	}
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  181  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  182  	/* TASKFILE Set=
up */
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  183  	t0 =3D DIV_ROUN=
D_UP(t->cyc8b, ideclk_period);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  184  	t2 =3D DIV_ROUN=
D_UP(t->act8b, ideclk_period);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  185  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  186  	t2i =3D t0 - t2=
 - 1;
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  187  	t2--;
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  188  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  189  	val32 =3D iorea=
d32(base + BK3710_REGSTB) & (0xFF << (dev ? 0 : 8));
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  190  	val32 |=3D t2 <=
< (dev ? 8 : 0);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  191  	iowrite32(val32=
, base + BK3710_REGSTB);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  192  =

76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  193  	val32 =3D iorea=
d32(base + BK3710_REGRCVR) & (0xFF << (dev ? 0 : 8));
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  194  	val32 |=3D t2i =
<< (dev ? 8 : 0);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  195  	iowrite32(val32=
, base + BK3710_REGRCVR);
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  196  }
76a40ca82f3498d Bartlomiej Zolnierkiewicz 2017-03-22  197  =


:::::: The code@line 179 was first introduced by commit
:::::: 76a40ca82f3498da2683b3d5efa9b24d5ffaeecc ata: add Palmchip BK3710 PA=
TA controller driver

:::::: TO: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
:::::: CC: Sekhar Nori <nsekhar@ti.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6317733027177129304==--

