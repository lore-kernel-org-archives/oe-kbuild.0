Content-Type: multipart/mixed; boundary="===============5324315314376415306=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 108/8646] arch/arm/kernel/traps.c:67:16: warning: Value stored to 'end' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 25 Feb 2022 21:38:56 +0800
Message-ID: <202202252112.e0LnKwS3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5324315314376415306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   44948bd49d878dad6c9707e34f4a06df73c3a800
commit: 4ab6827081c63b83011a18d8e27f621ed34b1194 [108/8646] ARM: unwind: du=
mp exception stack from calling frame
:::::: branch date: 11 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220223 (https://download.01.org/0day-ci/archi=
ve/20220225/202202252112.e0LnKwS3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D4ab6827081c63b83011a18d8e27f621ed34b1194
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4ab6827081c63b83011a18d8e27f621ed34b1194
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                               ^
   fs/xfs/libxfs/xfs_inode_fork.c:414:2: note: '?' condition is true
           ASSERT((ifp->if_broot !=3D NULL) && (ifp->if_broot_bytes > 0));
           ^
   fs/xfs/xfs_linux.h:207:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_inode_fork.c:417:9: note: Assuming 'new_max' is >=3D 0
           ASSERT(new_max >=3D 0);
                  ^
   fs/xfs/xfs_linux.h:207:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_inode_fork.c:417:2: note: '?' condition is true
           ASSERT(new_max >=3D 0);
           ^
   fs/xfs/xfs_linux.h:207:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_inode_fork.c:418:6: note: Assuming 'new_max' is > 0
           if (new_max > 0)
               ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_inode_fork.c:418:2: note: Taking true branch
           if (new_max > 0)
           ^
   fs/xfs/libxfs/xfs_inode_fork.c:419:14: note: Assuming the condition is f=
alse
                   new_size =3D XFS_BMAP_BROOT_SPACE_CALC(mp, new_max);
                              ^
   fs/xfs/libxfs/xfs_bmap_btree.h:68:8: note: expanded from macro 'XFS_BMAP=
_BROOT_SPACE_CALC'
           (int)(XFS_BMBT_BLOCK_LEN(mp) + \
                 ^~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_bmap_btree.h:19:3: note: expanded from macro 'XFS_BMBT=
_BLOCK_LEN'
           (xfs_has_crc(((mp))) ? \
            ^~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_inode_fork.c:419:14: note: '?' condition is false
                   new_size =3D XFS_BMAP_BROOT_SPACE_CALC(mp, new_max);
                              ^
   fs/xfs/libxfs/xfs_bmap_btree.h:68:8: note: expanded from macro 'XFS_BMAP=
_BROOT_SPACE_CALC'
           (int)(XFS_BMBT_BLOCK_LEN(mp) + \
                 ^
   fs/xfs/libxfs/xfs_bmap_btree.h:19:3: note: expanded from macro 'XFS_BMBT=
_BLOCK_LEN'
           (xfs_has_crc(((mp))) ? \
            ^
   fs/xfs/libxfs/xfs_inode_fork.c:422:6: note: Assuming 'new_size' is <=3D 0
           if (new_size > 0) {
               ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_inode_fork.c:422:2: note: Taking false branch
           if (new_size > 0) {
           ^
   fs/xfs/libxfs/xfs_inode_fork.c:430:3: note: Null pointer value stored to=
 'new_broot'
                   new_broot =3D NULL;
                   ^~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_inode_fork.c:436:6: note: 'new_max' is > 0
           if (new_max > 0) {
               ^~~~~~~
   fs/xfs/libxfs/xfs_inode_fork.c:436:2: note: Taking true branch
           if (new_max > 0) {
           ^
   fs/xfs/libxfs/xfs_inode_fork.c:440:16: note: '?' condition is false
                   op =3D (char *)XFS_BMBT_REC_ADDR(mp, ifp->if_broot, 1);
                                ^
   fs/xfs/libxfs/xfs_bmap_btree.h:25:4: note: expanded from macro 'XFS_BMBT=
_REC_ADDR'
                    XFS_BMBT_BLOCK_LEN(mp) + \
                    ^
   fs/xfs/libxfs/xfs_bmap_btree.h:19:3: note: expanded from macro 'XFS_BMBT=
_BLOCK_LEN'
           (xfs_has_crc(((mp))) ? \
            ^
   fs/xfs/libxfs/xfs_inode_fork.c:441:16: note: '?' condition is false
                   np =3D (char *)XFS_BMBT_REC_ADDR(mp, new_broot, 1);
                                ^
   fs/xfs/libxfs/xfs_bmap_btree.h:25:4: note: expanded from macro 'XFS_BMBT=
_REC_ADDR'
                    XFS_BMBT_BLOCK_LEN(mp) + \
                    ^
   fs/xfs/libxfs/xfs_bmap_btree.h:19:3: note: expanded from macro 'XFS_BMBT=
_BLOCK_LEN'
           (xfs_has_crc(((mp))) ? \
            ^
   fs/xfs/libxfs/xfs_inode_fork.c:441:3: note: Null pointer value stored to=
 'np'
                   np =3D (char *)XFS_BMBT_REC_ADDR(mp, new_broot, 1);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_inode_fork.c:442:3: note: Null pointer passed as 1st a=
rgument to memory copy function
                   memcpy(np, op, new_max * (uint)sizeof(xfs_bmbt_rec_t));
                   ^      ~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> arch/arm/kernel/traps.c:67:16: warning: Value stored to 'end' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned long end =3D frame + 4 + sizeof(struct pt_regs);
                         ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:67:16: note: Value stored to 'end' during its in=
itialization is never read
           unsigned long end =3D frame + 4 + sizeof(struct pt_regs);
                         ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:184:4: warning: Value stored to 'p' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/traps.c:184:4: note: Value stored to 'p' is never read
                           p +=3D sprintf(p, "bad PC value");
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 with check filters).
   1 warning generated.
   arch/arm/kernel/atags_compat.c:200:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(tag->u.cmdline.cmdline, params->commandline);
           ^~~~~~
   arch/arm/kernel/atags_compat.c:200:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(tag->u.cmdline.cmdline, params->commandline);
           ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   crypto/ecc.c:147:24: warning: The left operand of '&' is a garbage value=
 [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return (vli[bit / 64] & ((u64)1 << (bit % 64)));
                                 ^
   crypto/ecc.c:1618:6: note: Assuming 'private_key' is non-null
           if (!private_key || !public_key || !curve ||
               ^~~~~~~~~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
   crypto/ecc.c:1618:22: note: Assuming 'public_key' is non-null
           if (!private_key || !public_key || !curve ||
                               ^~~~~~~~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
           if (!private_key || !public_key || !curve ||
               ^
   crypto/ecc.c:1618:38: note: 'curve' is non-null
           if (!private_key || !public_key || !curve ||
                                               ^~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
           if (!private_key || !public_key || !curve ||
               ^
   crypto/ecc.c:1619:6: note: Assuming the condition is false
               ndigits > ARRAY_SIZE(priv) || ndigits > ARRAY_SIZE(rand_z)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1618:6: note: Left side of '||' is false
           if (!private_key || !public_key || !curve ||
               ^
   crypto/ecc.c:1618:2: note: Taking false branch
           if (!private_key || !public_key || !curve ||
           ^
   crypto/ecc.c:1629:7: note: 'pk' is non-null
           if (!pk) {
                ^~
   crypto/ecc.c:1629:2: note: Taking false branch
           if (!pk) {
           ^
   crypto/ecc.c:1636:8: note: Calling 'ecc_is_pubkey_valid_partial'
           ret =3D ecc_is_pubkey_valid_partial(curve, pk);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:1553:14: note: Assuming 'pk->ndigits' is equal to 'curve->g=
.ndigits'
           if (WARN_ON(pk->ndigits !=3D curve->g.ndigits))
                       ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/ecc.c:1553:6: note: Taking false branch
           if (WARN_ON(pk->ndigits !=3D curve->g.ndigits))
               ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   crypto/ecc.c:1553:2: note: Taking false branch
           if (WARN_ON(pk->ndigits !=3D curve->g.ndigits))
           ^
   crypto/ecc.c:1557:2: note: Taking false branch
           if (ecc_point_is_zero(pk))
           ^
   crypto/ecc.c:1561:2: note: Taking false branch
           if (vli_cmp(curve->p, pk->x, pk->ndigits) !=3D 1)
           ^
   crypto/ecc.c:1563:2: note: Taking false branch
           if (vli_cmp(curve->p, pk->y, pk->ndigits) !=3D 1)
           ^
   crypto/ecc.c:1567:2: note: Calling 'vli_mod_square_fast'
           vli_mod_square_fast(yy, pk->y, curve); /* y^2 */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:982:2: note: Calling 'vli_mmod_fast'
           vli_mmod_fast(result, product, curve);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/ecc.c:918:6: note: Assuming the condition is true

vim +/end +67 arch/arm/kernel/traps.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  63  =

5489ab50c22771 Dmitry Safonov     2020-06-08  64  void dump_backtrace_entry=
(unsigned long where, unsigned long from,
5489ab50c22771 Dmitry Safonov     2020-06-08  65  			  unsigned long frame,=
 const char *loglvl)
^1da177e4c3f41 Linus Torvalds     2005-04-16  66  {
40ff1ddb557028 Vincent Whitchurch 2019-12-16 @67  	unsigned long end =3D fr=
ame + 4 + sizeof(struct pt_regs);
40ff1ddb557028 Vincent Whitchurch 2019-12-16  68  =


:::::: The code at line 67 was first introduced by commit
:::::: 40ff1ddb5570284e039e0ff14d7a859a73dc3673 ARM: 8948/1: Prevent OOB ac=
cess in stacktrace

:::::: TO: Vincent Whitchurch <vincent.whitchurch@axis.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5324315314376415306==--

