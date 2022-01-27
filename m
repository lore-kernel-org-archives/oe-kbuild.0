Content-Type: multipart/mixed; boundary="===============8542353889538064431=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/spi-nor/core.c:1512:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Thu, 27 Jan 2022 18:05:03 +0800
Message-ID: <202201271838.7mI26faO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8542353889538064431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Down <chris@chrisdown.name>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: ad7d61f159db73974f1b0352f21afe04b0bbd920 printk: index: Add indexin=
g support to dev_printk
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220123 (https://download.01.org/0day-ci/archi=
ve/20220127/202201271838.7mI26faO-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dad7d61f159db73974f1b0352f21afe04b0bbd920
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ad7d61f159db73974f1b0352f21afe04b0bbd920
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           dev_dbg(dai->dev, "Mute:%d, Direction:%s\n", mute,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/staging/greybus/audio_codec.c:577:6: note: Assuming 'params' is =
non-null
           if (!params) {
               ^~~~~~~
   drivers/staging/greybus/audio_codec.c:577:2: note: Taking false branch
           if (!params) {
           ^
   drivers/staging/greybus/audio_codec.c:583:6: note: Assuming the conditio=
n is false
           if (list_empty(&codec->module_list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.c:583:2: note: Taking false branch
           if (list_empty(&codec->module_list)) {
           ^
   drivers/staging/greybus/audio_codec.c:595:2: note: Left side of '&&' is =
false
           list_for_each_entry(module, &codec->module_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
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
   drivers/staging/greybus/audio_codec.c:595:2: note: Taking false branch
           list_for_each_entry(module, &codec->module_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/staging/greybus/audio_codec.c:595:2: note: Loop condition is fal=
se.  Exiting loop
           list_for_each_entry(module, &codec->module_list, list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/staging/greybus/audio_codec.c:595:2: note: Loop condition is fal=
se. Execution continues on line 601
           list_for_each_entry(module, &codec->module_list, list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/staging/greybus/audio_codec.c:601:6: note: Branch condition eval=
uates to a garbage value
           if (!data) {
               ^~~~~
   drivers/staging/greybus/audio_codec.c:884:2: warning: Value stored to 'r=
et' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D gb_audio_apbridgea_unregister_cport(data->connection,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.c:884:2: note: Value stored to 'ret'=
 is never read
           ret =3D gb_audio_apbridgea_unregister_cport(data->connection,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.c:905:2: warning: Value stored to 'r=
et' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D gb_audio_apbridgea_unregister_cport(data->connection,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.c:905:2: note: Value stored to 'ret'=
 is never read
           ret =3D gb_audio_apbridgea_unregister_cport(data->connection,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/mtd/spi-nor/core.c:1512:2: warning: Use of memory after it is fr=
eed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(cmd, next, erase_list, list) {
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:494:25: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/mtd/spi-nor/core.c:1651:2: note: Taking false branch
           dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->add=
r,
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/mtd/spi-nor/core.c:1654:2: note: Taking true branch
           if (spi_nor_has_uniform_erase(nor)) {
           ^
   drivers/mtd/spi-nor/core.c:1656:7: note: Assuming 'rem' is 0
                   if (rem)
                       ^~~
   drivers/mtd/spi-nor/core.c:1656:3: note: Taking false branch
                   if (rem)
                   ^
   drivers/mtd/spi-nor/core.c:1664:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/spi-nor/core.c:1664:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/spi-nor/core.c:1668:6: note: Assuming 'len' is not equal to =
field 'size'
           if (len =3D=3D mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERA=
SE)) {
               ^~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1668:23: note: Left side of '&&' is false
           if (len =3D=3D mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERA=
SE)) {
                                ^
   drivers/mtd/spi-nor/core.c:1698:9: note: Taking false branch
           } else if (spi_nor_has_uniform_erase(nor)) {
                  ^
   drivers/mtd/spi-nor/core.c:1718:9: note: Calling 'spi_nor_erase_multi_se=
ctors'
                   ret =3D spi_nor_erase_multi_sectors(nor, addr, len);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/core.c:1605:6: note: 'ret' is 0
           if (ret)
               ^~~
   drivers/mtd/spi-nor/core.c:1605:2: note: Taking false branch
           if (ret)
           ^
   drivers/mtd/spi-nor/core.c:1608:2: note: Left side of '&&' is false
           list_for_each_entry_safe(cmd, next, &erase_list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
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
   drivers/mtd/spi-nor/core.c:1608:2: note: Taking false branch
           list_for_each_entry_safe(cmd, next, &erase_list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/mtd/spi-nor/core.c:1608:2: note: Loop condition is false.  Exiti=
ng loop
           list_for_each_entry_safe(cmd, next, &erase_list, list) {
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'

vim +1512 drivers/mtd/spi-nor/core.c

5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  150=
3  =

5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  150=
4  /**
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  150=
5   * spi_nor_destroy_erase_cmd_list() - destroy erase command list
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  150=
6   * @erase_list:	list of erase commands
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  150=
7   */
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  150=
8  static void spi_nor_destroy_erase_cmd_list(struct list_head *erase_list)
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  150=
9  {
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  151=
0  	struct spi_nor_erase_command *cmd, *next;
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  151=
1  =

5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11 @151=
2  	list_for_each_entry_safe(cmd, next, erase_list, list) {
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  151=
3  		list_del(&cmd->list);
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  151=
4  		kfree(cmd);
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  151=
5  	}
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  151=
6  }
5390a8df769ec9b drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  151=
7  =


:::::: The code at line 1512 was first introduced by commit
:::::: 5390a8df769ec9ba9c995191bb0867430f602ebb mtd: spi-nor: add support t=
o non-uniform SFDP SPI NOR flash memories

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Boris Brezillon <boris.brezillon@bootlin.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8542353889538064431==--

