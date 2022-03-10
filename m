Content-Type: multipart/mixed; boundary="===============1097390151758160111=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7285/11713] drivers/gpu/drm/selftests/test-drm_buddy.c:393:7: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 10 Mar 2022 10:42:03 +0800
Message-ID: <202203101054.IXVKbVmV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1097390151758160111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Matthew Auld <matthew.auld@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4e7a74a6856f8613dab9794da4b5cfb8fd54fb8c
commit: e6ff5ef81170e11dc0f196b0391f708f04fa8c87 [7285/11713] drm/selftests=
: add drm buddy smoke testcase
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-c006-20220309 (https://download.01.org/0day-ci/arc=
hive/20220310/202203101054.IXVKbVmV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De6ff5ef81170e11dc0f196b0391f708f04fa8c87
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e6ff5ef81170e11dc0f196b0391f708f04fa8c87
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if ((lis3->whoami =3D=3D WAI_3DC) || (lis3->whoami =3D=3D WAI_3D=
LH)) {
                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:289:32: note: Left side of '||' is tr=
ue
           if ((lis3->whoami =3D=3D WAI_3DC) || (lis3->whoami =3D=3D WAI_3D=
LH)) {
                                         ^
   drivers/misc/lis3lv02d/lis3lv02d.c:303:6: note: 'ret' is -6
           if (ret)
               ^~~
   drivers/misc/lis3lv02d/lis3lv02d.c:303:2: note: Taking true branch
           if (ret)
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:304:3: note: Control jumps to line 356
                   goto fail;
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:357:2: note: Returning without writin=
g to '*results'
           return ret;
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:794:10: note: Returning from 'lis3lv0=
2d_selftest'
           switch (lis3lv02d_selftest(lis3, values)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/lis3lv02d/lis3lv02d.c:794:2: note: Control jumps to the 'de=
fault' case at line 802
           switch (lis3lv02d_selftest(lis3, values)) {
           ^
   drivers/misc/lis3lv02d/lis3lv02d.c:804:3: note:  Execution continues on =
line 806
                   break;
                   ^
   drivers/misc/lis3lv02d/lis3lv02d.c:806:9: note: 4th function call argume=
nt is an uninitialized value
           return sprintf(buf, "%s %d %d %d\n", res,
                  ^
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   drivers/gpu/drm/bridge/sii9234.c:764:2: warning: Value stored to 'intr1_=
en' is never read [clang-analyzer-deadcode.DeadStores]
           intr1_en =3D mhl_tx_readb(ctx, MHL_TX_INTR1_ENABLE_REG);
           ^
   drivers/gpu/drm/bridge/sii9234.c:764:2: note: Value stored to 'intr1_en'=
 is never read
   drivers/gpu/drm/bridge/sii9234.c:765:2: warning: Value stored to 'intr4_=
en' is never read [clang-analyzer-deadcode.DeadStores]
           intr4_en =3D mhl_tx_readb(ctx, MHL_TX_INTR4_ENABLE_REG);
           ^
   drivers/gpu/drm/bridge/sii9234.c:765:2: note: Value stored to 'intr4_en'=
 is never read
   Suppressed 15 warnings (7 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/gpu/drm/bridge/tc358767.c:678:2: warning: Value stored to 'revis=
ion' is never read [clang-analyzer-deadcode.DeadStores]
           revision =3D tc->link.dpcd[DP_DPCD_REV];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:678:2: note: Value stored to 'revision=
' is never read
           revision =3D tc->link.dpcd[DP_DPCD_REV];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:820:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:820:2: note: Value stored to 'ret' is =
never read
           ret =3D regmap_write(tc->regmap, DP0_VIDSYNCDELAY,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:946:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:946:2: note: Value stored to 'ret' is =
never read
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:949:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:949:2: note: Value stored to 'ret' is =
never read
           ret =3D regmap_write(tc->regmap, DP_PHY_CTRL, dp_phy_ctrl);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
>> drivers/gpu/drm/selftests/test-drm_buddy.c:393:7: warning: Value stored =
to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                                                   err =3D 0;
                                                   ^     ~
   drivers/gpu/drm/selftests/test-drm_buddy.c:393:7: note: Value stored to =
'err' is never read
                                                   err =3D 0;
                                                   ^     ~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/spi/spi-axi-spi-engine.c:324:4: warning: Array access (from vari=
able 'buf') results in a null pointer dereference [clang-analyzer-core.Null=
Dereference]
                           writel_relaxed(buf[i], addr);
                           ^
   arch/riscv/include/asm/mmio.h:120:45: note: expanded from macro 'writel_=
relaxed'
   #define writel_relaxed(v, c)    ({ __io_rbw(); writel_cpu((v), (c)); __i=
o_raw(); })
                                                  ^
   arch/riscv/include/asm/mmio.h:93:59: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                    ^
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_=
to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                    ^
   drivers/spi/spi-axi-spi-engine.c:425:2: note: Calling 'spi_engine_compil=
e_message'
           spi_engine_compile_message(spi_engine, msg, true, &p_dry);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:215:2: note: Loop condition is false. E=
xecution continues on line 238
           list_for_each_entry(xfer, &msg->transfers, transfer_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-axi-spi-engine.c:238:2: note: Returning without writing =
to 'spi_engine->tx_length', which participates in a condition later
           return 0;
           ^
   drivers/spi/spi-axi-spi-engine.c:238:2: note: Returning without writing =
to 'spi_engine->tx_buf'
   drivers/spi/spi-axi-spi-engine.c:425:2: note: Returning from 'spi_engine=
_compile_message'
           spi_engine_compile_message(spi_engine, msg, true, &p_dry);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:429:6: note: Assuming 'p' is non-null
           if (!p)
               ^~
   drivers/spi/spi-axi-spi-engine.c:429:2: note: Taking false branch
           if (!p)
           ^
   drivers/spi/spi-axi-spi-engine.c:431:2: note: Calling 'spi_engine_compil=
e_message'
           spi_engine_compile_message(spi_engine, msg, false, p);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:215:2: note: Loop condition is false. E=
xecution continues on line 238
           list_for_each_entry(xfer, &msg->transfers, transfer_list) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/spi/spi-axi-spi-engine.c:238:2: note: Returning without writing =
to 'spi_engine->tx_length', which participates in a condition later
           return 0;
           ^
   drivers/spi/spi-axi-spi-engine.c:238:2: note: Returning without writing =
to 'spi_engine->tx_buf'
   drivers/spi/spi-axi-spi-engine.c:431:2: note: Returning from 'spi_engine=
_compile_message'
           spi_engine_compile_message(spi_engine, msg, false, p);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:433:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&spi_engine->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/spi/spi-axi-spi-engine.c:433:2: note: Loop condition is false.  =
Exiting loop
           spin_lock_irqsave(&spi_engine->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/spi/spi-axi-spi-engine.c:443:6: note: Calling 'spi_engine_write_=
cmd_fifo'
           if (spi_engine_write_cmd_fifo(spi_engine))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/spi/spi-axi-spi-engine.c:299:6: note: Loop condition is false.  =
Exiting loop
           n =3D readl_relaxed(spi_engine->base + SPI_ENGINE_REG_CMD_FIFO_R=
OOM);
               ^
   arch/riscv/include/asm/mmio.h:116:38: note: expanded from macro 'readl_r=
elaxed'
   #define readl_relaxed(c)        ({ u32 __v; __io_rbr(); __v =3D readl_cp=
u(c); __io_rar(); __v; })
                                               ^
   arch/riscv/include/asm/mmio.h:109:21: note: expanded from macro '__io_rb=
r'
   #define __io_rbr()              do {} while (0)
                                   ^
   drivers/spi/spi-axi-spi-engine.c:299:6: note: Loop condition is false.  =
Exiting loop
           n =3D readl_relaxed(spi_engine->base + SPI_ENGINE_REG_CMD_FIFO_R=
OOM);
               ^

vim +/err +393 drivers/gpu/drm/selftests/test-drm_buddy.c

92937f170d3f49 Arunpravin 2022-02-22  340  =

e6ff5ef81170e1 Arunpravin 2022-02-22  341  static int igt_buddy_alloc_smoke=
(void *arg)
e6ff5ef81170e1 Arunpravin 2022-02-22  342  {
e6ff5ef81170e1 Arunpravin 2022-02-22  343  	u64 mm_size, min_page_size, chu=
nk_size, start =3D 0;
e6ff5ef81170e1 Arunpravin 2022-02-22  344  	unsigned long flags =3D 0;
e6ff5ef81170e1 Arunpravin 2022-02-22  345  	struct drm_buddy mm;
e6ff5ef81170e1 Arunpravin 2022-02-22  346  	int *order;
e6ff5ef81170e1 Arunpravin 2022-02-22  347  	int err, i;
e6ff5ef81170e1 Arunpravin 2022-02-22  348  =

e6ff5ef81170e1 Arunpravin 2022-02-22  349  	DRM_RND_STATE(prng, random_seed=
);
e6ff5ef81170e1 Arunpravin 2022-02-22  350  	IGT_TIMEOUT(end_time);
e6ff5ef81170e1 Arunpravin 2022-02-22  351  =

e6ff5ef81170e1 Arunpravin 2022-02-22  352  	igt_mm_config(&mm_size, &chunk_=
size);
e6ff5ef81170e1 Arunpravin 2022-02-22  353  =

e6ff5ef81170e1 Arunpravin 2022-02-22  354  	err =3D drm_buddy_init(&mm, mm_=
size, chunk_size);
e6ff5ef81170e1 Arunpravin 2022-02-22  355  	if (err) {
e6ff5ef81170e1 Arunpravin 2022-02-22  356  		pr_err("buddy_init failed(%d)\=
n", err);
e6ff5ef81170e1 Arunpravin 2022-02-22  357  		return err;
e6ff5ef81170e1 Arunpravin 2022-02-22  358  	}
e6ff5ef81170e1 Arunpravin 2022-02-22  359  =

e6ff5ef81170e1 Arunpravin 2022-02-22  360  	order =3D drm_random_order(mm.m=
ax_order + 1, &prng);
e6ff5ef81170e1 Arunpravin 2022-02-22  361  	if (!order)
e6ff5ef81170e1 Arunpravin 2022-02-22  362  		goto out_fini;
e6ff5ef81170e1 Arunpravin 2022-02-22  363  =

e6ff5ef81170e1 Arunpravin 2022-02-22  364  	for (i =3D 0; i <=3D mm.max_ord=
er; ++i) {
e6ff5ef81170e1 Arunpravin 2022-02-22  365  		struct drm_buddy_block *block;
e6ff5ef81170e1 Arunpravin 2022-02-22  366  		int max_order =3D order[i];
e6ff5ef81170e1 Arunpravin 2022-02-22  367  		bool timeout =3D false;
e6ff5ef81170e1 Arunpravin 2022-02-22  368  		LIST_HEAD(blocks);
e6ff5ef81170e1 Arunpravin 2022-02-22  369  		u64 total, size;
e6ff5ef81170e1 Arunpravin 2022-02-22  370  		LIST_HEAD(tmp);
e6ff5ef81170e1 Arunpravin 2022-02-22  371  		int order;
e6ff5ef81170e1 Arunpravin 2022-02-22  372  =

e6ff5ef81170e1 Arunpravin 2022-02-22  373  		err =3D igt_check_mm(&mm);
e6ff5ef81170e1 Arunpravin 2022-02-22  374  		if (err) {
e6ff5ef81170e1 Arunpravin 2022-02-22  375  			pr_err("pre-mm check failed, =
abort\n");
e6ff5ef81170e1 Arunpravin 2022-02-22  376  			break;
e6ff5ef81170e1 Arunpravin 2022-02-22  377  		}
e6ff5ef81170e1 Arunpravin 2022-02-22  378  =

e6ff5ef81170e1 Arunpravin 2022-02-22  379  		order =3D max_order;
e6ff5ef81170e1 Arunpravin 2022-02-22  380  		total =3D 0;
e6ff5ef81170e1 Arunpravin 2022-02-22  381  =

e6ff5ef81170e1 Arunpravin 2022-02-22  382  		do {
e6ff5ef81170e1 Arunpravin 2022-02-22  383  retry:
e6ff5ef81170e1 Arunpravin 2022-02-22  384  			size =3D min_page_size =3D ge=
t_size(order, chunk_size);
e6ff5ef81170e1 Arunpravin 2022-02-22  385  			err =3D drm_buddy_alloc_block=
s(&mm, start, mm_size, size,
e6ff5ef81170e1 Arunpravin 2022-02-22  386  						     min_page_size, &tmp, =
flags);
e6ff5ef81170e1 Arunpravin 2022-02-22  387  			if (err) {
e6ff5ef81170e1 Arunpravin 2022-02-22  388  				if (err =3D=3D -ENOMEM) {
e6ff5ef81170e1 Arunpravin 2022-02-22  389  					pr_info("buddy_alloc hit -E=
NOMEM with order=3D%d\n",
e6ff5ef81170e1 Arunpravin 2022-02-22  390  						order);
e6ff5ef81170e1 Arunpravin 2022-02-22  391  				} else {
e6ff5ef81170e1 Arunpravin 2022-02-22  392  					if (order--) {
e6ff5ef81170e1 Arunpravin 2022-02-22 @393  						err =3D 0;
e6ff5ef81170e1 Arunpravin 2022-02-22  394  						goto retry;
e6ff5ef81170e1 Arunpravin 2022-02-22  395  					}
e6ff5ef81170e1 Arunpravin 2022-02-22  396  =

e6ff5ef81170e1 Arunpravin 2022-02-22  397  					pr_err("buddy_alloc with or=
der=3D%d failed(%d)\n",
e6ff5ef81170e1 Arunpravin 2022-02-22  398  					       order, err);
e6ff5ef81170e1 Arunpravin 2022-02-22  399  				}
e6ff5ef81170e1 Arunpravin 2022-02-22  400  =

e6ff5ef81170e1 Arunpravin 2022-02-22  401  				break;
e6ff5ef81170e1 Arunpravin 2022-02-22  402  			}
e6ff5ef81170e1 Arunpravin 2022-02-22  403  =

e6ff5ef81170e1 Arunpravin 2022-02-22  404  			block =3D list_first_entry_or=
_null(&tmp,
e6ff5ef81170e1 Arunpravin 2022-02-22  405  							 struct drm_buddy_block,
e6ff5ef81170e1 Arunpravin 2022-02-22  406  							 link);
e6ff5ef81170e1 Arunpravin 2022-02-22  407  			if (!block) {
e6ff5ef81170e1 Arunpravin 2022-02-22  408  				pr_err("alloc_blocks has no =
blocks\n");
e6ff5ef81170e1 Arunpravin 2022-02-22  409  				err =3D -EINVAL;
e6ff5ef81170e1 Arunpravin 2022-02-22  410  				break;
e6ff5ef81170e1 Arunpravin 2022-02-22  411  			}
e6ff5ef81170e1 Arunpravin 2022-02-22  412  =

e6ff5ef81170e1 Arunpravin 2022-02-22  413  			list_move_tail(&block->link, =
&blocks);
e6ff5ef81170e1 Arunpravin 2022-02-22  414  =

e6ff5ef81170e1 Arunpravin 2022-02-22  415  			if (drm_buddy_block_order(blo=
ck) !=3D order) {
e6ff5ef81170e1 Arunpravin 2022-02-22  416  				pr_err("buddy_alloc order mi=
smatch\n");
e6ff5ef81170e1 Arunpravin 2022-02-22  417  				err =3D -EINVAL;
e6ff5ef81170e1 Arunpravin 2022-02-22  418  				break;
e6ff5ef81170e1 Arunpravin 2022-02-22  419  			}
e6ff5ef81170e1 Arunpravin 2022-02-22  420  =

e6ff5ef81170e1 Arunpravin 2022-02-22  421  			total +=3D drm_buddy_block_si=
ze(&mm, block);
e6ff5ef81170e1 Arunpravin 2022-02-22  422  =

e6ff5ef81170e1 Arunpravin 2022-02-22  423  			if (__igt_timeout(end_time, N=
ULL)) {
e6ff5ef81170e1 Arunpravin 2022-02-22  424  				timeout =3D true;
e6ff5ef81170e1 Arunpravin 2022-02-22  425  				break;
e6ff5ef81170e1 Arunpravin 2022-02-22  426  			}
e6ff5ef81170e1 Arunpravin 2022-02-22  427  		} while (total < mm.size);
e6ff5ef81170e1 Arunpravin 2022-02-22  428  =

e6ff5ef81170e1 Arunpravin 2022-02-22  429  		if (!err)
e6ff5ef81170e1 Arunpravin 2022-02-22  430  			err =3D igt_check_blocks(&mm,=
 &blocks, total, false);
e6ff5ef81170e1 Arunpravin 2022-02-22  431  =

e6ff5ef81170e1 Arunpravin 2022-02-22  432  		drm_buddy_free_list(&mm, &bloc=
ks);
e6ff5ef81170e1 Arunpravin 2022-02-22  433  =

e6ff5ef81170e1 Arunpravin 2022-02-22  434  		if (!err) {
e6ff5ef81170e1 Arunpravin 2022-02-22  435  			err =3D igt_check_mm(&mm);
e6ff5ef81170e1 Arunpravin 2022-02-22  436  			if (err)
e6ff5ef81170e1 Arunpravin 2022-02-22  437  				pr_err("post-mm check failed=
\n");
e6ff5ef81170e1 Arunpravin 2022-02-22  438  		}
e6ff5ef81170e1 Arunpravin 2022-02-22  439  =

e6ff5ef81170e1 Arunpravin 2022-02-22  440  		if (err || timeout)
e6ff5ef81170e1 Arunpravin 2022-02-22  441  			break;
e6ff5ef81170e1 Arunpravin 2022-02-22  442  =

e6ff5ef81170e1 Arunpravin 2022-02-22  443  		cond_resched();
e6ff5ef81170e1 Arunpravin 2022-02-22  444  	}
e6ff5ef81170e1 Arunpravin 2022-02-22  445  =

e6ff5ef81170e1 Arunpravin 2022-02-22  446  	if (err =3D=3D -ENOMEM)
e6ff5ef81170e1 Arunpravin 2022-02-22  447  		err =3D 0;
e6ff5ef81170e1 Arunpravin 2022-02-22  448  =

e6ff5ef81170e1 Arunpravin 2022-02-22  449  	kfree(order);
e6ff5ef81170e1 Arunpravin 2022-02-22  450  out_fini:
e6ff5ef81170e1 Arunpravin 2022-02-22  451  	drm_buddy_fini(&mm);
e6ff5ef81170e1 Arunpravin 2022-02-22  452  =

e6ff5ef81170e1 Arunpravin 2022-02-22  453  	return err;
e6ff5ef81170e1 Arunpravin 2022-02-22  454  }
e6ff5ef81170e1 Arunpravin 2022-02-22  455  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1097390151758160111==--

