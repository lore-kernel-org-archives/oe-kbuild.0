Content-Type: multipart/mixed; boundary="===============3781005344371464904=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/7] clk: mediatek: reset: Merge and revise reset register function
Date: Tue, 19 Apr 2022 13:55:59 +0800
Message-ID: <202204191359.GQ8twLel-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3781005344371464904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220418132154.7401-4-rex-bc.chen@mediatek.com>
References: <20220418132154.7401-4-rex-bc.chen@mediatek.com>
TO: "Rex-BC Chen" <rex-bc.chen@mediatek.com>
TO: mturquette(a)baylibre.com
TO: sboyd(a)kernel.org
CC: matthias.bgg(a)gmail.com
CC: p.zabel(a)pengutronix.de
CC: angelogioacchino.delregno(a)collabora.com
CC: chun-jie.chen(a)mediatek.com
CC: wenst(a)chromium.org
CC: yong.liang(a)mediatek.com
CC: runyang.chen(a)mediatek.com
CC: linux-kernel(a)vger.kernel.org
CC: allen-kh.cheng(a)mediatek.com
CC: linux-clk(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-mediatek(a)lists.infradead.org
CC: Project_Global_Chrome_Upstream_Group(a)mediatek.com
CC: "Rex-BC Chen" <rex-bc.chen@mediatek.com>

Hi Rex-BC,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.18-rc3 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Rex-BC-Chen/Cleanup-=
MediaTek-clk-reset-drivers/20220418-223139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm-randconfig-c002-20220417 (https://download.01.org/0day-ci/archi=
ve/20220419/202204191359.GQ8twLel-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cba=
c0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/52d97559ba77d8eb304=
19528d80d37d8f0dd09cf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rex-BC-Chen/Cleanup-MediaTek-clk-r=
eset-drivers/20220418-223139
        git checkout 52d97559ba77d8eb30419528d80d37d8f0dd09cf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   if ((s32)(waiter->thresh - sync) > 0)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:64:3: note: Taking false branch
                   if ((s32)(waiter->thresh - sync) > 0)
                   ^
   drivers/gpu/host1x/intr.c:67:3: note: Null pointer value stored to 'dest'
                   dest =3D completed + waiter->action;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:70:7: note: Assuming field 'action' is equal t=
o HOST1X_INTR_ACTION_SUBMIT_COMPLETE
                   if (waiter->action =3D=3D HOST1X_INTR_ACTION_SUBMIT_COMP=
LETE &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/host1x/intr.c:70:7: note: Left side of '&&' is true
   drivers/gpu/host1x/intr.c:71:19: note: Passing null pointer value via 1s=
t parameter 'head'
                       !list_empty(dest)) {
                                   ^~~~
   drivers/gpu/host1x/intr.c:71:8: note: Calling 'list_empty'
                       !list_empty(dest)) {
                        ^~~~~~~~~~~~~~~~
   include/linux/list.h:292:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:292:9: note: Left side of '||' is false
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/list.h:292:9: note: Left side of '||' is true
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   include/linux/list.h:292:9: note: Taking false branch
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
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
   include/linux/list.h:292:9: note: Loop condition is false.  Exiting loop
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
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
   include/linux/list.h:292:9: note: Dereference of null pointer
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   3 warnings generated.
>> drivers/clk/mediatek/clk-mt8135.c:564:2: warning: Value stored to 'r' is=
 never read [clang-analyzer-deadcode.DeadStores]
           r =3D mtk_clk_register_rst_ctrl(node, 2, 0x30, MTK_RST_V1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8135.c:564:2: note: Value stored to 'r' is ne=
ver read
           r =3D mtk_clk_register_rst_ctrl(node, 2, 0x30, MTK_RST_V1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8135.c:594:2: warning: Value stored to 'r' is=
 never read [clang-analyzer-deadcode.DeadStores]
           r =3D mtk_clk_register_rst_ctrl(node, 2, 0, MTK_RST_V1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8135.c:594:2: note: Value stored to 'r' is ne=
ver read
           r =3D mtk_clk_register_rst_ctrl(node, 2, 0, MTK_RST_V1);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/dma-buf/dma-resv.c:525:34: warning: Access to field 'shared_coun=
t' results in a dereference of a null pointer (loaded from variable 'list')=
 [clang-analyzer-core.NullDereference]
                           RCU_INIT_POINTER(list->shared[list->shared_count=
++], f);
                                                         ^
   include/linux/rcupdate.h:860:14: note: expanded from macro 'RCU_INIT_POI=
NTER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                              ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONC=
E'
           __WRITE_ONCE(x, val);                                           \
                        ^
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                    ^
   drivers/dma-buf/dma-resv.c:494:2: note: Loop condition is false.  Exitin=
g loop
           dma_resv_assert_held(dst);
           ^
   include/linux/dma-resv.h:271:35: note: expanded from macro 'dma_resv_ass=
ert_held'
   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
                                     ^
   include/linux/lockdep.h:411:34: note: expanded from macro 'lockdep_asser=
t_held'
   #define lockdep_assert_held(l)                  do { (void)(l); } while =
(0)
                                                   ^
   drivers/dma-buf/dma-resv.c:496:2: note: Null pointer value stored to 'li=
st'
           list =3D NULL;
           ^~~~~~~~~~~
   drivers/dma-buf/dma-resv.c:500:2: note: Loop condition is true.  Enterin=
g loop body
           dma_resv_for_each_fence_unlocked(&cursor, f) {
           ^
   include/linux/dma-resv.h:249:2: note: expanded from macro 'dma_resv_for_=
each_fence_unlocked'
           for (fence =3D dma_resv_iter_first_unlocked(cursor);            =
  \
           ^
   drivers/dma-buf/dma-resv.c:502:7: note: Assuming the condition is false
                   if (dma_resv_iter_is_restarted(&cursor)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-resv.c:502:3: note: Taking false branch
                   if (dma_resv_iter_is_restarted(&cursor)) {
                   ^
   drivers/dma-buf/dma-resv.c:522:3: note: Taking false branch
                   if (dma_resv_iter_is_exclusive(&cursor))
                   ^
   drivers/dma-buf/dma-resv.c:525:4: note: Left side of '||' is false
                           RCU_INIT_POINTER(list->shared[list->shared_count=
++], f);
                           ^
   include/linux/rcupdate.h:860:3: note: expanded from macro 'RCU_INIT_POIN=
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
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/dma-buf/dma-resv.c:525:4: note: Left side of '||' is false
                           RCU_INIT_POINTER(list->shared[list->shared_count=
++], f);
                           ^
   include/linux/rcupdate.h:860:3: note: expanded from macro 'RCU_INIT_POIN=
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
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   drivers/dma-buf/dma-resv.c:525:4: note: Left side of '||' is true
                           RCU_INIT_POINTER(list->shared[list->shared_count=
++], f);
                           ^
   include/linux/rcupdate.h:860:3: note: expanded from macro 'RCU_INIT_POIN=
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
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))

vim +/r +564 drivers/clk/mediatek/clk-mt8135.c

a8aede7948438f James Liao  2015-04-23  544  =

a8aede7948438f James Liao  2015-04-23  545  static void __init mtk_infrasys=
_init(struct device_node *node)
a8aede7948438f James Liao  2015-04-23  546  {
a8aede7948438f James Liao  2015-04-23  547  	struct clk_onecell_data *clk_d=
ata;
a8aede7948438f James Liao  2015-04-23  548  	int r;
a8aede7948438f James Liao  2015-04-23  549  =

a8aede7948438f James Liao  2015-04-23  550  	clk_data =3D mtk_alloc_clk_dat=
a(CLK_INFRA_NR_CLK);
a8aede7948438f James Liao  2015-04-23  551  =

a8aede7948438f James Liao  2015-04-23  552  	mtk_clk_register_gates(node, i=
nfra_clks, ARRAY_SIZE(infra_clks),
a8aede7948438f James Liao  2015-04-23  553  						clk_data);
a8aede7948438f James Liao  2015-04-23  554  =

a8aede7948438f James Liao  2015-04-23  555  	clk_prepare_enable(clk_data->c=
lks[CLK_INFRA_M4U]);
a8aede7948438f James Liao  2015-04-23  556  =

a8aede7948438f James Liao  2015-04-23  557  	r =3D of_clk_add_provider(node=
, of_clk_src_onecell_get, clk_data);
52d97559ba77d8 Rex-BC Chen 2022-04-18  558  	if (r) {
a8aede7948438f James Liao  2015-04-23  559  		pr_err("%s(): could not regis=
ter clock provider: %d\n",
a8aede7948438f James Liao  2015-04-23  560  			__func__, r);
52d97559ba77d8 Rex-BC Chen 2022-04-18  561  		return;
52d97559ba77d8 Rex-BC Chen 2022-04-18  562  	}
a8aede7948438f James Liao  2015-04-23  563  =

52d97559ba77d8 Rex-BC Chen 2022-04-18 @564  	r =3D mtk_clk_register_rst_ctr=
l(node, 2, 0x30, MTK_RST_V1);
a8aede7948438f James Liao  2015-04-23  565  }
a8aede7948438f James Liao  2015-04-23  566  CLK_OF_DECLARE(mtk_infrasys, "m=
ediatek,mt8135-infracfg", mtk_infrasys_init);
a8aede7948438f James Liao  2015-04-23  567  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3781005344371464904==--

