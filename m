Content-Type: multipart/mixed; boundary="===============7755876817847189571=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:dyndbg-next 2/5] drivers/mtd/spi-nor/core.c:1512:2: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 18 Mar 2022 19:59:24 +0800
Message-ID: <202203181934.bzTThIv4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7755876817847189571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dyndbg-next
head:   efb1c5c6c6910cdbb26ec10edc918c2251365ed3
commit: b9ddd9a4550d0bf0fe5a34749cf85ad34bb6f499 [2/5] dyndbg: add class_id=
 field and query support
:::::: branch date: 6 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-c002-20220316 (https://download.01.org/0day-ci/archi=
ve/20220318/202203181934.bzTThIv4-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/jimc/linux/commit/b9ddd9a4550d0bf0fe5a34749cf8=
5ad34bb6f499
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dyndbg-next
        git checkout b9ddd9a4550d0bf0fe5a34749cf85ad34bb6f499
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           etr_buf->ops->sync(etr_buf, rrp, rwp);
           ^~~~~~~~~~~~~~~~~~
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
   2 warnings generated.
   drivers/i2c/busses/i2c-xlp9xx.c:207:4: warning: Value stored to 'rlen' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           rlen =3D 0;       /*abort transfer */
                           ^      ~
   drivers/i2c/busses/i2c-xlp9xx.c:207:4: note: Value stored to 'rlen' is n=
ever read
                           rlen =3D 0;       /*abort transfer */
                           ^      ~
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/gpu/drm/drm_framebuffer.c:855:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(fb->comm, current->comm);
           ^~~~~~
   drivers/gpu/drm/drm_framebuffer.c:855:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(fb->comm, current->comm);
           ^~~~~~
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
   2 warnings generated.
   3 warnings generated.
   4 warnings generated.
   5 warnings generated.
   6 warnings generated.
   7 warnings generated.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   2 warnings generated.
   3 warnings generated.
   4 warnings generated.
   5 warnings generated.
   6 warnings generated.
   7 warnings generated.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/mtd/spi-nor/core.c:1512:2: warning: Use of memory after it is fr=
eed [clang-analyzer-unix.Malloc]
           list_for_each_entry_safe(cmd, next, erase_list, list) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^
   drivers/mtd/spi-nor/core.c:1651:2: note: Taking false branch
           dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->add=
r,
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:194:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:173:2: note: expanded from macro '_dynamic=
_func_call'
           _dynamic_func_call_cls(_DPRINTK_SITE_UNCLASSED, fmt, func, ##__V=
A_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/mtd/spi-nor/core.c:1651:2: note: Loop condition is false.  Exiti=
ng loop
           dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->add=
r,
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:194:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:173:2: note: expanded from macro '_dynamic=
_func_call'
           _dynamic_func_call_cls(_DPRINTK_SITE_UNCLASSED, fmt, func, ##__V=
A_ARGS__)
           ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/mtd/spi-nor/core.c:1651:2: note: Taking false branch
           dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->add=
r,
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:194:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:173:2: note: expanded from macro '_dynamic=
_func_call'
           _dynamic_func_call_cls(_DPRINTK_SITE_UNCLASSED, fmt, func, ##__V=
A_ARGS__)
           ^
   include/linux/dynamic_debug.h:171:2: note: expanded from macro '_dynamic=
_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##_=
_VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:144:2: note: expanded from macro '__dynami=
c_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
           ^
   drivers/mtd/spi-nor/core.c:1651:2: note: Loop condition is false.  Exiti=
ng loop
           dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->add=
r,
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:194:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:173:2: note: expanded from macro '_dynamic=
_func_call'
           _dynamic_func_call_cls(_DPRINTK_SITE_UNCLASSED, fmt, func, ##__V=
A_ARGS__)
           ^
   include/linux/dynamic_debug.h:171:2: note: expanded from macro '_dynamic=
_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##_=
_VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:142:58: note: expanded from macro '__dynam=
ic_func_call_cls'
   #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {   \
                                                            ^
   drivers/mtd/spi-nor/core.c:1654:2: note: Taking true branch
           if (spi_nor_has_uniform_erase(nor)) {
           ^
   drivers/mtd/spi-nor/core.c:1656:7: note: Assuming 'rem' is 0
                   if (rem)
                       ^~~

vim +1512 drivers/mtd/spi-nor/core.c

5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1503=
  =

5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1504=
  /**
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1505=
   * spi_nor_destroy_erase_cmd_list() - destroy erase command list
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1506=
   * @erase_list:	list of erase commands
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1507=
   */
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1508=
  static void spi_nor_destroy_erase_cmd_list(struct list_head *erase_list)
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1509=
  {
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1510=
  	struct spi_nor_erase_command *cmd, *next;
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1511=
  =

5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11 @1512=
  	list_for_each_entry_safe(cmd, next, erase_list, list) {
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1513=
  		list_del(&cmd->list);
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1514=
  		kfree(cmd);
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1515=
  	}
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1516=
  }
5390a8df769ec9 drivers/mtd/spi-nor/spi-nor.c Tudor Ambarus 2018-09-11  1517=
  =


:::::: The code at line 1512 was first introduced by commit
:::::: 5390a8df769ec9ba9c995191bb0867430f602ebb mtd: spi-nor: add support t=
o non-uniform SFDP SPI NOR flash memories

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Boris Brezillon <boris.brezillon@bootlin.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7755876817847189571==--

