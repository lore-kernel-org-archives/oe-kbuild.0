Content-Type: multipart/mixed; boundary="===============8865032061089391085=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 108/7915] arch/arm/kernel/traps.c:67:16: warning: Value stored to 'end' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 25 Feb 2022 03:10:20 +0800
Message-ID: <202202250254.Ngf13gz2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8865032061089391085==
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
head:   d4a0ae62a277377de396850ed4b709b6bd9b7326
commit: 4ab6827081c63b83011a18d8e27f621ed34b1194 [108/7915] ARM: unwind: du=
mp exception stack from calling frame
:::::: branch date: 17 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220223 (https://download.01.org/0day-ci/archi=
ve/20220225/202202250254.Ngf13gz2-lkp(a)intel.com/config)
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
           while (workspace->strm.total_in < len) {
           ^
   fs/btrfs/zlib.c:227:13: note: The left operand of '!=3D' is a garbage va=
lue
           while (ret !=3D Z_STREAM_END) {
                  ~~~ ^
   1 warning generated.
   fs/verity/open.c:217:2: warning: Attempt to free released memory [clang-=
analyzer-unix.Malloc]
           kfree(vi->tree_params.hashstate);
           ^
   fs/verity/open.c:347:6: note: Assuming the condition is false
           if (!IS_VERITY(inode))
               ^~~~~~~~~~~~~~~~~
   fs/verity/open.c:347:2: note: Taking false branch
           if (!IS_VERITY(inode))
           ^
   fs/verity/open.c:350:6: note: Assuming the condition is false
           if (filp->f_mode & FMODE_WRITE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:350:2: note: Taking false branch
           if (filp->f_mode & FMODE_WRITE) {
           ^
   fs/verity/open.c:356:9: note: Calling 'ensure_verity_info'
           return ensure_verity_info(inode);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:312:6: note: Assuming 'vi' is null
           if (vi)
               ^~
   fs/verity/open.c:312:2: note: Taking false branch
           if (vi)
           ^
   fs/verity/open.c:316:6: note: 'err' is 0
           if (err)
               ^~~
   fs/verity/open.c:316:2: note: Taking false branch
           if (err)
           ^
   fs/verity/open.c:319:7: note: Calling 'fsverity_create_info'
           vi =3D fsverity_create_info(inode, desc, desc_size);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:157:6: note: Assuming 'vi' is non-null
           if (!vi)
               ^~~
   fs/verity/open.c:157:2: note: Taking false branch
           if (!vi)
           ^
   fs/verity/open.c:161:8: note: Calling 'fsverity_init_merkle_tree_params'
           err =3D fsverity_init_merkle_tree_params(&vi->tree_params, inode,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:43:2: note: Taking false branch
           if (IS_ERR(hash_alg))
           ^
   fs/verity/open.c:50:2: note: Taking false branch
           if (IS_ERR(params->hashstate)) {
           ^
   fs/verity/open.c:57:6: note: Assuming 'log_blocksize' is not equal to PA=
GE_SHIFT
           if (log_blocksize !=3D PAGE_SHIFT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:57:2: note: Taking true branch
           if (log_blocksize !=3D PAGE_SHIFT) {
           ^
   fs/verity/open.c:61:3: note: Control jumps to line 121
                   goto out_err;
                   ^
   fs/verity/open.c:121:2: note: Memory is released
           kfree(params->hashstate);
           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:161:8: note: Returning; memory was released
           err =3D fsverity_init_merkle_tree_params(&vi->tree_params, inode,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:165:6: note: 'err' is -22
           if (err) {
               ^~~
   fs/verity/open.c:165:2: note: Taking true branch
           if (err) {
           ^
   fs/verity/open.c:169:3: note: Control jumps to line 187
                   goto out;
                   ^
   fs/verity/open.c:187:6: note: 'err' is -22
           if (err) {
               ^~~
   fs/verity/open.c:187:2: note: Taking true branch
           if (err) {
           ^
   fs/verity/open.c:188:3: note: Calling 'fsverity_free_info'
                   fsverity_free_info(vi);
                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:215:7: note: 'vi' is non-null
           if (!vi)
                ^~
   fs/verity/open.c:215:2: note: Taking false branch
           if (!vi)
           ^
   fs/verity/open.c:217:2: note: Attempt to free released memory
           kfree(vi->tree_params.hashstate);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   Suppressed 3 warnings (3 with check filters).
   1 warning generated.
   arch/arm/kernel/devtree.c:232:6: warning: Access to field 'dt_fixup' res=
ults in a dereference of a null pointer (loaded from variable 'mdesc') [cla=
ng-analyzer-core.NullDereference]
           if (mdesc->dt_fixup)
               ^~~~~
   arch/arm/kernel/devtree.c:206:6: note: Assuming 'dt_virt' is non-null
           if (!dt_virt || !early_init_dt_verify(dt_virt))
               ^~~~~~~~
   arch/arm/kernel/devtree.c:206:6: note: Left side of '||' is false
   arch/arm/kernel/devtree.c:206:18: note: Assuming the condition is false
           if (!dt_virt || !early_init_dt_verify(dt_virt))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:206:2: note: Taking false branch
           if (!dt_virt || !early_init_dt_verify(dt_virt))
           ^
   arch/arm/kernel/devtree.c:209:2: note: Value assigned to 'mdesc'
           mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mac=
h);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:211:6: note: Assuming 'mdesc' is null
           if (!mdesc) {
               ^~~~~~
   arch/arm/kernel/devtree.c:211:2: note: Taking true branch
           if (!mdesc) {
           ^
   arch/arm/kernel/devtree.c:221:10: note: Assuming 'size' is <=3D 0
                   while (size > 0) {
                          ^~~~~~~~
   arch/arm/kernel/devtree.c:221:3: note: Loop condition is false. Executio=
n continues on line 226
                   while (size > 0) {
                   ^
   arch/arm/kernel/devtree.c:232:6: note: Access to field 'dt_fixup' result=
s in a dereference of a null pointer (loaded from variable 'mdesc')
           if (mdesc->dt_fixup)
               ^~~~~
   3 warnings generated.
   fs/btrfs/ref-verify.c:494:2: warning: Undefined or garbage value returne=
d to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return ret;
           ^
   fs/btrfs/ref-verify.c:981:6: note: Assuming the condition is false
           if (!btrfs_test_opt(fs_info, REF_VERIFY))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ref-verify.c:981:2: note: Taking false branch
           if (!btrfs_test_opt(fs_info, REF_VERIFY))
           ^
   fs/btrfs/ref-verify.c:985:6: note: Assuming 'path' is non-null
           if (!path)
               ^~~~~
   fs/btrfs/ref-verify.c:985:2: note: Taking false branch
           if (!path)
           ^
   fs/btrfs/ref-verify.c:994:2: note: Loop condition is true.  Entering loo=
p body
           while (1) {
           ^
   fs/btrfs/ref-verify.c:1001:9: note: Calling 'walk_down_tree'
                   ret =3D walk_down_tree(fs_info->extent_root, path, level,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ref-verify.c:559:9: note: 'level' is >=3D 0
           while (level >=3D 0) {
                  ^~~~~
   fs/btrfs/ref-verify.c:559:2: note: Loop condition is true.  Entering loo=
p body
           while (level >=3D 0) {
           ^
   fs/btrfs/ref-verify.c:560:7: note: Assuming 'level' is 0
                   if (level) {
                       ^~~~~
   fs/btrfs/ref-verify.c:560:3: note: Taking false branch
                   if (level) {
                   ^
   fs/btrfs/ref-verify.c:570:10: note: Calling 'process_leaf'
                           ret =3D process_leaf(root, path, bytenr, num_byt=
es,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/ref-verify.c:510:14: note: Assuming 'i' is < 'nritems'
           for (i =3D 0; i < nritems; i++) {
                       ^~~~~~~~~~~
   fs/btrfs/ref-verify.c:510:2: note: Loop condition is true.  Entering loo=
p body
           for (i =3D 0; i < nritems; i++) {
           ^
   fs/btrfs/ref-verify.c:512:3: note: Control jumps to 'case 169:'  at line=
 516
                   switch (key.type) {

vim +/end +67 arch/arm/kernel/traps.c

^1da177e4c3f415 Linus Torvalds     2005-04-16  63  =

5489ab50c22771d Dmitry Safonov     2020-06-08  64  void dump_backtrace_entr=
y(unsigned long where, unsigned long from,
5489ab50c22771d Dmitry Safonov     2020-06-08  65  			  unsigned long frame=
, const char *loglvl)
^1da177e4c3f415 Linus Torvalds     2005-04-16  66  {
40ff1ddb5570284 Vincent Whitchurch 2019-12-16 @67  	unsigned long end =3D f=
rame + 4 + sizeof(struct pt_regs);
40ff1ddb5570284 Vincent Whitchurch 2019-12-16  68  =


:::::: The code@line 67 was first introduced by commit
:::::: 40ff1ddb5570284e039e0ff14d7a859a73dc3673 ARM: 8948/1: Prevent OOB ac=
cess in stacktrace

:::::: TO: Vincent Whitchurch <vincent.whitchurch@axis.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8865032061089391085==--

