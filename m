Content-Type: multipart/mixed; boundary="===============6957801619065426429=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/hamradio/baycom_epp.c:304:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments...
Date: Mon, 08 Aug 2022 03:58:04 +0800
Message-ID: <202208080339.KIBRJwhx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6957801619065426429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/net/hamradio/baycom_epp.c:304:2: warning: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220801 (https://download.01.org/0day-ci/archi=
ve/20220808/202208080339.KIBRJwhx-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/md/bcache/btree.c:764:2: note: Loop condition is true.  Entering=
 loop body
           while (!list_empty(&c->btree_cache_freed)) {
           ^
   drivers/md/bcache/btree.c:769:3: note: Memory is released
                   kfree(b);
                   ^~~~~~~~
   drivers/md/bcache/btree.c:764:2: note: Loop condition is true.  Entering=
 loop body
           while (!list_empty(&c->btree_cache_freed)) {
           ^
   drivers/md/bcache/btree.c:767:3: note: Calling 'list_del'
                   list_del(&b->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   drivers/md/bcache/btree.c:734:6: note: Assuming field 'next' is null
           if (c->shrink.list.next)
               ^~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/btree.c:734:2: note: Taking false branch
           if (c->shrink.list.next)
           ^
   drivers/md/bcache/btree.c:740:6: note: Assuming field 'verify_data' is n=
ull
           if (c->verify_data)
               ^~~~~~~~~~~~~~
   drivers/md/bcache/btree.c:740:2: note: Taking false branch
           if (c->verify_data)
           ^
   drivers/md/bcache/btree.c:743:47: note: '?' condition is false
           free_pages((unsigned long) c->verify_ondisk, ilog2(meta_bucket_p=
ages(&c->cache->sb)));
                                                        ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/md/bcache/btree.c:743:47: note: '?' condition is true
           free_pages((unsigned long) c->verify_ondisk, ilog2(meta_bucket_p=
ages(&c->cache->sb)));
                                                        ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/md/bcache/btree.c:749:2: note: Loop condition is false. Executio=
n continues on line 764
           while (!list_empty(&c->btree_cache)) {
           ^
   drivers/md/bcache/btree.c:764:2: note: Loop condition is true.  Entering=
 loop body
           while (!list_empty(&c->btree_cache_freed)) {
           ^
   drivers/md/bcache/btree.c:769:3: note: Memory is released
                   kfree(b);
                   ^~~~~~~~
   drivers/md/bcache/btree.c:764:2: note: Loop condition is true.  Entering=
 loop body
           while (!list_empty(&c->btree_cache_freed)) {
           ^
   drivers/md/bcache/btree.c:767:3: note: Calling 'list_del'
                   list_del(&b->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   drivers/net/hamradio/baycom_par.c:319:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&bc->modem, 0, sizeof(bc->modem));
           ^~~~~~
   drivers/net/hamradio/baycom_par.c:319:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&bc->modem, 0, sizeof(bc->modem));
           ^~~~~~
   drivers/net/hamradio/baycom_par.c:321:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&par_cb, 0, sizeof(par_cb));
           ^~~~~~
   drivers/net/hamradio/baycom_par.c:321:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&par_cb, 0, sizeof(par_cb));
           ^~~~~~
   drivers/net/hamradio/baycom_par.c:430:3: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
                   strcpy(hi->data.modename, bc->options ? "par96" : "picpa=
r");
                   ^~~~~~
   drivers/net/hamradio/baycom_par.c:430:3: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
                   strcpy(hi->data.modename, bc->options ? "par96" : "picpa=
r");
                   ^~~~~~
   drivers/net/hamradio/baycom_par.c:528:3: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(ifname, "bcp%d", i);
                   ^~~~~~~
   drivers/net/hamradio/baycom_par.c:528:3: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(ifname, "bcp%d", i);
                   ^~~~~~~
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   82 warnings generated.
>> drivers/net/hamradio/baycom_epp.c:304:2: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           sprintf(modearg, "%sclk,%smodem,fclk=3D%d,bps=3D%d,divider=3D%d%=
s,extstat",
           ^~~~~~~
   drivers/net/hamradio/baycom_epp.c:304:2: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           sprintf(modearg, "%sclk,%smodem,fclk=3D%d,bps=3D%d,divider=3D%d%=
s,extstat",
           ^~~~~~~
   drivers/net/hamradio/baycom_epp.c:309:2: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(portarg, "%ld", bc->pdev->port->base);
           ^~~~~~~
   drivers/net/hamradio/baycom_epp.c:309:2: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(portarg, "%ld", bc->pdev->port->base);
           ^~~~~~~
   drivers/net/hamradio/baycom_epp.c:458:4: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(tmp, 0x7e, sizeof(tmp));
                           ^~~~~~
   drivers/net/hamradio/baycom_epp.c:458:4: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
                           memset(tmp, 0x7e, sizeof(tmp));
                           ^~~~~~
   drivers/net/hamradio/baycom_epp.c:494:5: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(tmp, 0x7e, sizeof(tmp));
                                   ^~~~~~
   drivers/net/hamradio/baycom_epp.c:494:5: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
                                   memset(tmp, 0x7e, sizeof(tmp));
                                   ^~~~~~
   drivers/net/hamradio/baycom_epp.c:511:4: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(tmp, 0, sizeof(tmp));
                           ^~~~~~
   drivers/net/hamradio/baycom_epp.c:511:4: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
                           memset(tmp, 0, sizeof(tmp));
                           ^~~~~~
   drivers/net/hamradio/baycom_epp.c:545:2: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cp, bc->hdlcrx.buf, pktlen - 1);
           ^~~~~~
   drivers/net/hamradio/baycom_epp.c:545:2: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(cp, bc->hdlcrx.buf, pktlen - 1);
           ^~~~~~
   drivers/net/hamradio/baycom_epp.c:603:34: warning: The result of the lef=
t shift is undefined because the left operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
                                           bitbuf =3D (bitbuf & ((~0xff) <<=
 j)) | ((bitbuf & ~((~0xff) << j)) << 1);
                                                                       ^
   drivers/net/hamradio/baycom_epp.c:649:6: note: Assuming field 'work_runn=
ing' is not equal to 0
           if (!bc->work_running)
               ^~~~~~~~~~~~~~~~~
   drivers/net/hamradio/baycom_epp.c:649:2: note: Taking false branch
           if (!bc->work_running)
           ^
   drivers/net/hamradio/baycom_epp.c:654:6: note: Assuming the condition is=
 false
           if (pp->ops->epp_read_addr(pp, &stat, 1, 0) !=3D 1)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/hamradio/baycom_epp.c:654:2: note: Taking false branch
           if (pp->ops->epp_read_addr(pp, &stat, 1, 0) !=3D 1)
           ^
   drivers/net/hamradio/baycom_epp.c:659:6: note: Assuming field 'modem' is=
 not equal to EPP_FPGAEXTSTATUS
           if (bc->modem =3D=3D EPP_FPGAEXTSTATUS) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/hamradio/baycom_epp.c:659:2: note: Taking false branch
           if (bc->modem =3D=3D EPP_FPGAEXTSTATUS) {
           ^
   drivers/net/hamradio/baycom_epp.c:690:3: note: Control jumps to the 'def=
ault' case at line 703
                   switch (stat & (EPP_NTAEF|EPP_NTHF)) {
                   ^
   drivers/net/hamradio/baycom_epp.c:705:4: note:  Execution continues on l=
ine 707
                           break;
                           ^
   drivers/net/hamradio/baycom_epp.c:707:3: note: Taking false branch
                   if (transmit(bc, cnt, stat))
                   ^
   drivers/net/hamradio/baycom_epp.c:711:10: note: Assuming the condition i=
s true
                   while ((stat & (EPP_NRAEF|EPP_NRHF)) !=3D EPP_NRHF) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/hamradio/baycom_epp.c:711:3: note: Loop condition is true.  =
Entering loop body
                   while ((stat & (EPP_NRAEF|EPP_NRHF)) !=3D EPP_NRHF) {
                   ^
   drivers/net/hamradio/baycom_epp.c:712:4: note: Control jumps to the 'def=
ault' case at line 721
                           switch (stat & (EPP_NRAEF|EPP_NRHF)) {
                           ^
   drivers/net/hamradio/baycom_epp.c:723:5: note:  Execution continues on l=
ine 725
                                   break;
                                   ^
   drivers/net/hamradio/baycom_epp.c:725:8: note: Calling 'receive'
                           if (receive(dev, cnt))
                               ^~~~~~~~~~~~~~~~~
   drivers/net/hamradio/baycom_epp.c:565:2: note: Loop condition is true.  =
Entering loop body
           while (cnt > 0) {
           ^
   drivers/net/hamradio/baycom_epp.c:566:10: note: '?' condition is true
                   cnt2 =3D (cnt > sizeof(tmp)) ? sizeof(tmp) : cnt;
                          ^
   drivers/net/hamradio/baycom_epp.c:568:7: note: Assuming the condition is=
 false
                   if (cnt2 !=3D pp->ops->epp_read_data(pp, tmp, cnt2, 0)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/hamradio/baycom_epp.c:568:3: note: Taking false branch
                   if (cnt2 !=3D pp->ops->epp_read_data(pp, tmp, cnt2, 0)) {
                   ^
   drivers/net/hamradio/baycom_epp.c:573:3: note: Loop condition is true.  =
Entering loop body
                   for (; cnt2 > 0; cnt2--, cp++) {
                   ^
   drivers/net/hamradio/baycom_epp.c:580:4: note: Loop condition is true.  =
Entering loop body
                           for (j =3D 0; j < 8; j++) {
                           ^
   drivers/net/hamradio/baycom_epp.c:583:25: note: Assuming the condition i=
s false
                                   if (unlikely(!(notbitstream & (0x0fc << =
j)))) {

vim +304 drivers/net/hamradio/baycom_epp.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  290  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  291  /* eppconfig: called du=
ring ifconfig up to configure the modem */
^1da177e4c3f41 Linus Torvalds      2005-04-16  292  static int eppconfig(st=
ruct baycom_state *bc)
^1da177e4c3f41 Linus Torvalds      2005-04-16  293  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  294  	char modearg[256];
^1da177e4c3f41 Linus Torvalds      2005-04-16  295  	char portarg[16];
377e7a27c049d6 Greg Kroah-Hartman  2016-12-11  296          char *argv[] =
=3D {
377e7a27c049d6 Greg Kroah-Hartman  2016-12-11  297  		(char *)eppconfig_pat=
h,
377e7a27c049d6 Greg Kroah-Hartman  2016-12-11  298  		"-s",
377e7a27c049d6 Greg Kroah-Hartman  2016-12-11  299  		"-p", portarg,
377e7a27c049d6 Greg Kroah-Hartman  2016-12-11  300  		"-m", modearg,
^1da177e4c3f41 Linus Torvalds      2005-04-16  301  		NULL };
^1da177e4c3f41 Linus Torvalds      2005-04-16  302  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  303  	/* set up arguments */
^1da177e4c3f41 Linus Torvalds      2005-04-16 @304  	sprintf(modearg, "%scl=
k,%smodem,fclk=3D%d,bps=3D%d,divider=3D%d%s,extstat",
^1da177e4c3f41 Linus Torvalds      2005-04-16  305  		bc->cfg.intclk ? "int=
" : "ext",
^1da177e4c3f41 Linus Torvalds      2005-04-16  306  		bc->cfg.extmodem ? "e=
xt" : "int", bc->cfg.fclk, bc->cfg.bps,
^1da177e4c3f41 Linus Torvalds      2005-04-16  307  		(bc->cfg.fclk + 8 * b=
c->cfg.bps) / (16 * bc->cfg.bps),
^1da177e4c3f41 Linus Torvalds      2005-04-16  308  		bc->cfg.loopback ? ",=
loopback" : "");
^1da177e4c3f41 Linus Torvalds      2005-04-16  309  	sprintf(portarg, "%ld"=
, bc->pdev->port->base);
^1da177e4c3f41 Linus Torvalds      2005-04-16  310  	printk(KERN_DEBUG "%s:=
 %s -s -p %s -m %s\n", bc_drvname, eppconfig_path, portarg, modearg);
^1da177e4c3f41 Linus Torvalds      2005-04-16  311  =

86313c488a6848 Jeremy Fitzhardinge 2007-07-17  312  	return call_usermodehe=
lper(eppconfig_path, argv, envp, UMH_WAIT_PROC);
^1da177e4c3f41 Linus Torvalds      2005-04-16  313  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  314  =


:::::: The code at line 304 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6957801619065426429==--

