Content-Type: multipart/mixed; boundary="===============4578127829159088304=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11483/14268] drivers/pcmcia/soc_common.c:696:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or pr...
Date: Thu, 24 Mar 2022 18:48:09 +0800
Message-ID: <202203241801.n3JU0br3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4578127829159088304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   b61581ae229d8eb9f21f8753be3f4011f7692384
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 [11483/14268] Kbuild: move=
 to -std=3Dgnu11
:::::: branch date: 27 hours ago
:::::: commit date: 11 days ago
config: arm-randconfig-c002-20220323 (https://download.01.org/0day-ci/archi=
ve/20220324/202203241801.n3JU0br3-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 902f47=
08fe1d03b0de7e5315ef875006a6adc319)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~
   fs/jfs/jfs_dmap.c:4011:15: warning: The result of the left shift is unde=
fined due to shifting by '64', which is greater or equal to the width of ty=
pe 's64' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           sz =3D (s64) 1 << l2sz;
                        ^
   fs/jfs/jfs_dmap.c:3392:2: note: Loop condition is false.  Exiting loop
           jfs_info("dbExtendFS: blkno:%Ld nblocks:%Ld newsize:%Ld",
           ^
   fs/jfs/jfs_debug.h:84:31: note: expanded from macro 'jfs_info'
   #define jfs_info(fmt, arg...) do {} while (0)
                                 ^
   fs/jfs/jfs_dmap.c:3404:21: note: Assuming the condition is true
           bmp->db_maxlevel =3D BMAPSZTOLEV(bmp->db_mapsize);
                              ^
   fs/jfs/jfs_dmap.h:117:4: note: expanded from macro 'BMAPSZTOLEV'
           (((size) <=3D MAXL0SIZE) ? 0 : ((size) <=3D MAXL1SIZE) ? 1 : 2)
             ^~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:3404:21: note: '?' condition is true
           bmp->db_maxlevel =3D BMAPSZTOLEV(bmp->db_mapsize);
                              ^
   fs/jfs/jfs_dmap.h:117:3: note: expanded from macro 'BMAPSZTOLEV'
           (((size) <=3D MAXL0SIZE) ? 0 : ((size) <=3D MAXL1SIZE) ? 1 : 2)
            ^
   fs/jfs/jfs_dmap.c:3407:13: note: Calling 'dbGetL2AGSize'
           l2agsize =3D dbGetL2AGSize(newsize);
                      ^~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:4001:6: note: Assuming the condition is false
           if (nblocks < BPERDMAP * MAXAG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_dmap.c:4001:2: note: Taking false branch
           if (nblocks < BPERDMAP * MAXAG)
           ^
   fs/jfs/jfs_dmap.c:4006:7: note: The value 64 is assigned to 'l2sz'
           for (l2sz =3D 64; l2sz >=3D 0; l2sz--, m >>=3D 1) {
                ^~~~~~~~~
   fs/jfs/jfs_dmap.c:4006:2: note: Loop condition is true.  Entering loop b=
ody
           for (l2sz =3D 64; l2sz >=3D 0; l2sz--, m >>=3D 1) {
           ^
   fs/jfs/jfs_dmap.c:4007:7: note: Assuming the condition is true
                   if (m & nblocks)
                       ^~~~~~~~~~~
   fs/jfs/jfs_dmap.c:4007:3: note: Taking true branch
                   if (m & nblocks)
                   ^
   fs/jfs/jfs_dmap.c:4008:4: note:  Execution continues on line 4011
                           break;
                           ^
   fs/jfs/jfs_dmap.c:4011:15: note: The result of the left shift is undefin=
ed due to shifting by '64', which is greater or equal to the width of type =
's64'
           sz =3D (s64) 1 << l2sz;
                        ^  ~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   fs/ocfs2/dlm/dlmconvert.c:196:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(res->lvb, lock->lksb->lvb, DLM_LVB_LEN);
                   ^~~~~~
   fs/ocfs2/dlm/dlmconvert.c:196:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(res->lvb, lock->lksb->lvb, DLM_LVB_LEN);
                   ^~~~~~
   fs/ocfs2/dlm/dlmconvert.c:366:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&convert, 0, sizeof(struct dlm_convert_lock));
           ^~~~~~
   fs/ocfs2/dlm/dlmconvert.c:366:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&convert, 0, sizeof(struct dlm_convert_lock));
           ^~~~~~
   fs/ocfs2/dlm/dlmconvert.c:372:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(convert.name, res->lockname.name, convert.namelen);
           ^~~~~~
   fs/ocfs2/dlm/dlmconvert.c:372:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(convert.name, res->lockname.name, convert.namelen);
           ^~~~~~
   fs/ocfs2/dlm/dlmconvert.c:508:3: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&lksb->lvb[0], &cnv->lvb[0], DLM_LVB_LEN);
                   ^~~~~~
   fs/ocfs2/dlm/dlmconvert.c:508:3: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&lksb->lvb[0], &cnv->lvb[0], DLM_LVB_LEN);
                   ^~~~~~
   Suppressed 71 warnings (71 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   64 warnings generated.
   drivers/pcmcia/pcmcia_cis.c:358:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(*get->buf, tuple->TupleData, tuple->TupleDataLen);
                   ^~~~~~
   drivers/pcmcia/pcmcia_cis.c:358:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(*get->buf, tuple->TupleData, tuple->TupleDataLen);
                   ^~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/pcmcia/soc_common.c:288:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&state, 0, sizeof(struct pcmcia_state));
           ^~~~~~
   drivers/pcmcia/soc_common.c:288:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&state, 0, sizeof(struct pcmcia_state));
           ^~~~~~
   drivers/pcmcia/soc_common.c:693:7: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           b +=3D sprintf(b, "%-9s:", prefix);
                ^~~~~~~
   drivers/pcmcia/soc_common.c:693:7: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           b +=3D sprintf(b, "%-9s:", prefix);
                ^~~~~~~
>> drivers/pcmcia/soc_common.c:696:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
                           b +=3D sprintf(b, " %s", bits[i].name);
                                ^~~~~~~
   drivers/pcmcia/soc_common.c:696:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
                           b +=3D sprintf(b, " %s", bits[i].name);
                                ^~~~~~~
   drivers/pcmcia/soc_common.c:713:7: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "slot     : %d\n", skt->nr);
                ^~~~~~~
   drivers/pcmcia/soc_common.c:713:7: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "slot     : %d\n", skt->nr);
                ^~~~~~~
   drivers/pcmcia/soc_common.c:722:7: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "Vcc      : %d\n", skt->cs_state.Vcc);
                ^~~~~~~
   drivers/pcmcia/soc_common.c:722:7: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "Vcc      : %d\n", skt->cs_state.Vcc);
                ^~~~~~~
   drivers/pcmcia/soc_common.c:723:7: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "Vpp      : %d\n", skt->cs_state.Vpp);
                ^~~~~~~
   drivers/pcmcia/soc_common.c:723:7: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "Vpp      : %d\n", skt->cs_state.Vpp);
                ^~~~~~~
   drivers/pcmcia/soc_common.c:724:7: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           p +=3D sprintf(p, "IRQ      : %d (%d)\n", skt->cs_state.io_irq,
                ^~~~~~~
   drivers/pcmcia/soc_common.c:724:7: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           p +=3D sprintf(p, "IRQ      : %d (%d)\n", skt->cs_state.io_irq,
                ^~~~~~~
   include/asm-generic/bitops/non-atomic.h:22:6: warning: The left expressi=
on of the compound assignment is an uninitialized value. The computed value=
 will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p  |=3D mask;
               ^
   drivers/pcmcia/soc_common.c:534:2: note: Loop condition is false.  Exiti=
ng loop
           debug(skt, 2, "mask: %s%s%s%s%s%s flags: %s%s%s%s%s%s Vcc %d Vpp=
 %d irq %d\n",
           ^
   drivers/pcmcia/soc_common.h:176:38: note: expanded from macro 'debug'
   #define debug(skt, lvl, fmt, arg...) do { } while (0)
                                        ^
   drivers/pcmcia/soc_common.c:549:9: note: Calling 'soc_common_pcmcia_conf=
ig_skt'
           return soc_common_pcmcia_config_skt(skt, state);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pcmcia/soc_common.c:344:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/pcmcia/soc_common.c:344:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/pcmcia/soc_common.c:352:6: note: Assuming 'ret' is equal to 0
           if (ret =3D=3D 0) {
               ^~~~~~~~
   drivers/pcmcia/soc_common.c:352:2: note: Taking true branch
           if (ret =3D=3D 0) {
           ^
   drivers/pcmcia/soc_common.c:357:7: note: Assuming field 'gpio_reset' is =
non-null
                   if (skt->gpio_reset) {
                       ^~~~~~~~~~~~~~~
   drivers/pcmcia/soc_common.c:357:3: note: Taking true branch
                   if (skt->gpio_reset) {
                   ^
   drivers/pcmcia/soc_common.c:359:4: note: Calling '__assign_bit'
                           __assign_bit(n++, values, state->flags & SS_RESE=
T);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   include/linux/bitops.h:217:6: note: Assuming 'value' is true
           if (value)
               ^~~~~
   include/linux/bitops.h:217:2: note: Taking true branch
           if (value)
           ^
   include/linux/bitops.h:218:3: note: Calling 'arch___set_bit'
                   __set_bit(nr, addr);
                   ^
   include/asm-generic/bitops/non-atomic.h:24:19: note: expanded from macro=
 '__set_bit'
   #define __set_bit arch___set_bit
                     ^
   include/asm-generic/bitops/non-atomic.h:22:6: note: The left expression =
of the compound assignment is an uninitialized value. The computed value wi=
ll also be garbage
           *p  |=3D mask;
           ~~  ^
   include/asm-generic/bitops/non-atomic.h:32:5: warning: The left expressi=
on of the compound assignment is an uninitialized value. The computed value=
 will also be garbage [clang-analyzer-core.uninitialized.Assign]
           *p &=3D ~mask;
              ^
   drivers/pcmcia/soc_common.c:534:2: note: Loop condition is false.  Exiti=
ng loop
           debug(skt, 2, "mask: %s%s%s%s%s%s flags: %s%s%s%s%s%s Vcc %d Vpp=
 %d irq %d\n",
           ^
   drivers/pcmcia/soc_common.h:176:38: note: expanded from macro 'debug'
   #define debug(skt, lvl, fmt, arg...) do { } while (0)
                                        ^
   drivers/pcmcia/soc_common.c:549:9: note: Calling 'soc_common_pcmcia_conf=
ig_skt'
           return soc_common_pcmcia_config_skt(skt, state);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pcmcia/soc_common.c:344:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0) {
               ^~~~~~~
   drivers/pcmcia/soc_common.c:344:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/pcmcia/soc_common.c:352:6: note: Assuming 'ret' is equal to 0
           if (ret =3D=3D 0) {
               ^~~~~~~~
   drivers/pcmcia/soc_common.c:352:2: note: Taking true branch
           if (ret =3D=3D 0) {
--
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-disk.c:228:2: warning: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smd->sm, &ops, sizeof(smd->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-disk.c:228:2: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smd->sm, &ops, sizeof(smd->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-disk.c:262:2: warning: Call to f=
unction 'memcpy' is insecure as it does not provide security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'memcpy_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smd->sm, &ops, sizeof(smd->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-disk.c:262:2: note: Call to func=
tion 'memcpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smd->sm, &ops, sizeof(smd->sm));
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   drivers/md/persistent-data/dm-space-map-metadata.c:150:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(result, bop, sizeof(*result));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:150:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(result, bop, sizeof(*result));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:514:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->old_ll, &smm->ll, sizeof(smm->old_ll));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:514:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->old_ll, &smm->ll, sizeof(smm->old_ll));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:552:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(where_le, &root_le, sizeof(root_le));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:552:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(where_le, &root_le, sizeof(root_le));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:725:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sm, &bootstrap_ops, sizeof(*sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:725:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sm, &bootstrap_ops, sizeof(*sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:761:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(sm, &ops, sizeof(*sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:761:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(sm, &ops, sizeof(*sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:775:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->sm, &ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:775:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->sm, &ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:794:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->sm, &bootstrap_ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:794:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->sm, &bootstrap_ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:802:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->sm, &ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:802:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->sm, &ops, sizeof(smm->sm));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:840:2: warning: Call =
to function 'memcpy' is insecure as it does not provide security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'memcpy_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&smm->old_ll, &smm->ll, sizeof(smm->old_ll));
           ^~~~~~
   drivers/md/persistent-data/dm-space-map-metadata.c:840:2: note: Call to =
function 'memcpy' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&smm->old_ll, &smm->ll, sizeof(smm->old_ll));
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/net/hamradio/baycom_ser_fdx.c:398:2: warning: Call to function '=
memset' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'memset_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&bc->modem, 0, sizeof(bc->modem));
           ^~~~~~
   drivers/net/hamradio/baycom_ser_fdx.c:398:2: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
           memset(&bc->modem, 0, sizeof(bc->modem));
           ^~~~~~
   drivers/net/hamradio/baycom_ser_fdx.c:519:3: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(hi->data.modename, "ser%u", bc->baud / 100);
                   ^~~~~~~
   drivers/net/hamradio/baycom_ser_fdx.c:519:3: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(hi->data.modename, "ser%u", bc->baud / 100);
                   ^~~~~~~
   drivers/net/hamradio/baycom_ser_fdx.c:521:4: warning: Call to function '=
strcat' is insecure as it does not provide bounding of the memory buffer. R=
eplace unbounded copy functions with analogous functions that support lengt=
h arguments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI=
.strcpy]
                           strcat(hi->data.modename, (!bc->opt_dcd) ? "*" :=
 "+");
                           ^~~~~~
   drivers/net/hamradio/baycom_ser_fdx.c:521:4: note: Call to function 'str=
cat' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcat'. CWE-119
                           strcat(hi->data.modename, (!bc->opt_dcd) ? "*" :=
 "+");
                           ^~~~~~
   drivers/net/hamradio/baycom_ser_fdx.c:603:3: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(ifname, "bcsf%d", i);
                   ^~~~~~~
   drivers/net/hamradio/baycom_ser_fdx.c:603:3: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(ifname, "bcsf%d", i);
                   ^~~~~~~
   Suppressed 61 warnings (61 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
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

vim +696 drivers/pcmcia/soc_common.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  686  =

17b38ebb6a3225 Marcelo Roberto Jimenez 2010-10-18  687  static void dump_bi=
ts(char **p, const char *prefix,
17b38ebb6a3225 Marcelo Roberto Jimenez 2010-10-18  688  	unsigned int val, =
struct bittbl *bits, int sz)
^1da177e4c3f41 Linus Torvalds          2005-04-16  689  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  690  	char *b =3D *p;
^1da177e4c3f41 Linus Torvalds          2005-04-16  691  	int i;
^1da177e4c3f41 Linus Torvalds          2005-04-16  692  =

^1da177e4c3f41 Linus Torvalds          2005-04-16  693  	b +=3D sprintf(b, =
"%-9s:", prefix);
^1da177e4c3f41 Linus Torvalds          2005-04-16  694  	for (i =3D 0; i < =
sz; i++)
^1da177e4c3f41 Linus Torvalds          2005-04-16  695  		if (val & bits[i]=
.mask)
^1da177e4c3f41 Linus Torvalds          2005-04-16 @696  			b +=3D sprintf(b=
, " %s", bits[i].name);
^1da177e4c3f41 Linus Torvalds          2005-04-16  697  	*b++ =3D '\n';
^1da177e4c3f41 Linus Torvalds          2005-04-16  698  	*p =3D b;
^1da177e4c3f41 Linus Torvalds          2005-04-16  699  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  700  =


:::::: The code@line 696 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4578127829159088304==--

