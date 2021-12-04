Content-Type: multipart/mixed; boundary="===============7985482143001274610=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] drm/ast: Handle failed I2C initialization gracefully
Date: Sat, 04 Dec 2021 22:06:37 +0800
Message-ID: <202112042208.O5p0dLkU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7985482143001274610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211201153100.403-2-tzimmermann@suse.de>
References: <20211201153100.403-2-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: airlied(a)redhat.com
TO: daniel(a)ffwll.ch
TO: sam(a)ravnborg.org
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: dri-devel(a)lists.freedesktop.org

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 6a8f90ec433e2f5de5fc16d7a4839771b7027cc0]

url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/ast-Fix-=
I2C-corner-cases-wrt-init-cleanup/20211201-233308
base:   6a8f90ec433e2f5de5fc16d7a4839771b7027cc0
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001-20211203 (https://download.01.org/0day-ci/arch=
ive/20211204/202112042208.O5p0dLkU-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d18=
54eb1450d352663ee732235893c5782237)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/75bd8f71712a8abb6c51caf5b=
003e836e60c53bc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/ast-Fix-I2C-corn=
er-cases-wrt-init-cleanup/20211201-233308
        git checkout 75bd8f71712a8abb6c51caf5b003e836e60c53bc
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/io_uring.c:4322:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&buf->list)) {
           ^
   fs/io_uring.c:4327:3: note: Memory is released
                   kfree(nxt);
                   ^~~~~~~~~~
   fs/io_uring.c:4328:3: note: Taking false branch
                   if (++i =3D=3D nbufs)
                   ^
   fs/io_uring.c:4322:2: note: Loop condition is true.  Entering loop body
           while (!list_empty(&buf->list)) {
           ^
   fs/io_uring.c:4326:3: note: Calling 'list_del'
                   list_del(&nxt->list);
                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   include/linux/skbuff.h:2085:2: warning: 2nd function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           __skb_insert(newsk, next->prev, next, list);
           ^
   fs/io_uring.c:8150:2: note: Calling '__skb_queue_head_init'
           __skb_queue_head_init(&list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:8150:2: note: Returning from '__skb_queue_head_init'
           __skb_queue_head_init(&list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/io_uring.c:8157:2: note: Loop condition is true.  Entering loop body
           while (skb) {
           ^
   fs/io_uring.c:8161:15: note: Assuming 'i' is >=3D field 'count'
                   for (i =3D 0; i < fp->count; i++) {
                               ^~~~~~~~~~~~~
   fs/io_uring.c:8161:3: note: Loop condition is false. Execution continues=
 on line 8185
                   for (i =3D 0; i < fp->count; i++) {
                   ^
   fs/io_uring.c:8185:7: note: Assuming 'file' is non-null
                   if (!file)
                       ^~~~~
   fs/io_uring.c:8185:3: note: Taking false branch
                   if (!file)
                   ^
   fs/io_uring.c:8188:3: note: Calling '__skb_queue_tail'
                   __skb_queue_tail(&list, skb);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2118:2: note: Calling '__skb_queue_before'
           __skb_queue_before(list, (struct sk_buff *)list, newsk);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/skbuff.h:2085:2: note: 2nd function call argument is an un=
initialized value
           __skb_insert(newsk, next->prev, next, list);
           ^                   ~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/gpu/drm/ast/ast_mode.c:291:2: warning: Value stored to 'jreg' is=
 never read [clang-analyzer-deadcode.DeadStores]
           jreg =3D ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:291:2: note: Value stored to 'jreg' is ne=
ver read
           jreg =3D ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:300:2: warning: Value stored to 'jreg' is=
 never read [clang-analyzer-deadcode.DeadStores]
           jreg =3D ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:300:2: note: Value stored to 'jreg' is ne=
ver read
           jreg =3D ast_io_read8(ast, AST_IO_INPUT_STATUS1_READ);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/ast/ast_mode.c:1231:6: warning: Branch condition evaluat=
es to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (edid) {
               ^~~~
   drivers/gpu/drm/ast/ast_mode.c:1213:2: note: 'edid' declared without an =
initial value
           struct edid *edid;
           ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:1217:6: note: Assuming field 'tx_chip_typ=
e' is not equal to AST_TX_DP501
           if (ast->tx_chip_type =3D=3D AST_TX_DP501) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:1217:2: note: Taking false branch
           if (ast->tx_chip_type =3D=3D AST_TX_DP501) {
           ^
   drivers/gpu/drm/ast/ast_mode.c:1229:7: note: 'flags' is false
           if (!flags && ast_connector->i2c)
                ^~~~~
   drivers/gpu/drm/ast/ast_mode.c:1229:6: note: Left side of '&&' is true
           if (!flags && ast_connector->i2c)
               ^
   drivers/gpu/drm/ast/ast_mode.c:1229:16: note: Assuming field 'i2c' is nu=
ll
           if (!flags && ast_connector->i2c)
                         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:1229:2: note: Taking false branch
           if (!flags && ast_connector->i2c)
           ^
   drivers/gpu/drm/ast/ast_mode.c:1231:6: note: Branch condition evaluates =
to a garbage value
           if (edid) {
               ^~~~
>> drivers/gpu/drm/ast/ast_mode.c:1232:3: warning: Use of memory after it i=
s freed [clang-analyzer-unix.Malloc]
                   drm_connector_update_edid_property(&ast_connector->base,=
 edid);
                   ^                                                       =
 ~~~~
   drivers/gpu/drm/ast/ast_mode.c:1217:6: note: Assuming field 'tx_chip_typ=
e' is equal to AST_TX_DP501
           if (ast->tx_chip_type =3D=3D AST_TX_DP501) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:1217:2: note: Taking true branch
           if (ast->tx_chip_type =3D=3D AST_TX_DP501) {
           ^
   drivers/gpu/drm/ast/ast_mode.c:1220:7: note: Assuming 'edid' is non-null
                   if (!edid)
                       ^~~~~
   drivers/gpu/drm/ast/ast_mode.c:1220:3: note: Taking false branch
                   if (!edid)
                   ^
   drivers/gpu/drm/ast/ast_mode.c:1224:7: note: Assuming 'flags' is false
                   if (flags)
                       ^~~~~
   drivers/gpu/drm/ast/ast_mode.c:1224:3: note: Taking false branch
                   if (flags)
                   ^
   drivers/gpu/drm/ast/ast_mode.c:1227:4: note: Memory is released
                           kfree(edid);
                           ^~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:1229:7: note: 'flags' is false
           if (!flags && ast_connector->i2c)
                ^~~~~
   drivers/gpu/drm/ast/ast_mode.c:1229:6: note: Left side of '&&' is true
           if (!flags && ast_connector->i2c)
               ^
   drivers/gpu/drm/ast/ast_mode.c:1229:16: note: Assuming field 'i2c' is nu=
ll
           if (!flags && ast_connector->i2c)
                         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_mode.c:1229:2: note: Taking false branch
           if (!flags && ast_connector->i2c)
           ^
   drivers/gpu/drm/ast/ast_mode.c:1231:6: note: 'edid' is non-null
           if (edid) {
               ^~~~
   drivers/gpu/drm/ast/ast_mode.c:1231:2: note: Taking true branch
           if (edid) {
           ^
   drivers/gpu/drm/ast/ast_mode.c:1232:3: note: Use of memory after it is f=
reed
                   drm_connector_update_edid_property(&ast_connector->base,=
 edid);
                   ^                                                       =
 ~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpio/gpio-pcf857x.c:237:23: warning: Value stored to 'np' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device_node              *np =3D client->dev.of_node;
                                            ^~   ~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-pcf857x.c:237:23: note: Value stored to 'np' during it=
s initialization is never read
           struct device_node              *np =3D client->dev.of_node;
                                            ^~   ~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/drm_dp_mst_topology.c:2584:30: warning: The left operand=
 of '>>' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
                   int port_num =3D (rad[i / 2] >> shift) & 0xf;
                                              ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4201:6: note: Assuming 'sc' is equ=
al to field 'sink_count'
           if (sc !=3D mgr->sink_count) {
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:4201:2: note: Taking false branch
           if (sc !=3D mgr->sink_count) {
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:4206:6: note: Assuming the conditi=
on is true
           if (esi[1] & DP_DOWN_REP_MSG_RDY) {

vim +1231 drivers/gpu/drm/ast/ast_mode.c

312fec1405dd54 Dave Airlie       2012-02-29  1204  =

4961eb60f14553 Thomas Zimmermann 2019-11-07  1205  /*
4961eb60f14553 Thomas Zimmermann 2019-11-07  1206   * Connector
4961eb60f14553 Thomas Zimmermann 2019-11-07  1207   */
4961eb60f14553 Thomas Zimmermann 2019-11-07  1208  =

312fec1405dd54 Dave Airlie       2012-02-29  1209  static int ast_get_modes=
(struct drm_connector *connector)
312fec1405dd54 Dave Airlie       2012-02-29  1210  {
312fec1405dd54 Dave Airlie       2012-02-29  1211  	struct ast_connector *a=
st_connector =3D to_ast_connector(connector);
fa7dbd7688849d Thomas Zimmermann 2020-06-17  1212  	struct ast_private *ast=
 =3D to_ast_private(connector->dev);
312fec1405dd54 Dave Airlie       2012-02-29  1213  	struct edid *edid;
312fec1405dd54 Dave Airlie       2012-02-29  1214  	int ret;
83c6620bae3f14 Dave Airlie       2014-03-28  1215  	bool flags =3D false;
6c9bd4432b2527 Gregory Williams  2021-07-30  1216  =

83c6620bae3f14 Dave Airlie       2014-03-28  1217  	if (ast->tx_chip_type =
=3D=3D AST_TX_DP501) {
83c6620bae3f14 Dave Airlie       2014-03-28  1218  		ast->dp501_maxclk =3D =
0xff;
83c6620bae3f14 Dave Airlie       2014-03-28  1219  		edid =3D kmalloc(128, =
GFP_KERNEL);
83c6620bae3f14 Dave Airlie       2014-03-28  1220  		if (!edid)
83c6620bae3f14 Dave Airlie       2014-03-28  1221  			return -ENOMEM;
312fec1405dd54 Dave Airlie       2012-02-29  1222  =

83c6620bae3f14 Dave Airlie       2014-03-28  1223  		flags =3D ast_dp501_re=
ad_edid(connector->dev, (u8 *)edid);
83c6620bae3f14 Dave Airlie       2014-03-28  1224  		if (flags)
83c6620bae3f14 Dave Airlie       2014-03-28  1225  			ast->dp501_maxclk =3D=
 ast_get_dp501_max_clk(connector->dev);
83c6620bae3f14 Dave Airlie       2014-03-28  1226  		else
83c6620bae3f14 Dave Airlie       2014-03-28  1227  			kfree(edid);
83c6620bae3f14 Dave Airlie       2014-03-28  1228  	}
75bd8f71712a8a Thomas Zimmermann 2021-12-01  1229  	if (!flags && ast_conne=
ctor->i2c)
312fec1405dd54 Dave Airlie       2012-02-29  1230  		edid =3D drm_get_edid(=
connector, &ast_connector->i2c->adapter);
312fec1405dd54 Dave Airlie       2012-02-29 @1231  	if (edid) {
c555f02371c338 Daniel Vetter     2018-07-09 @1232  		drm_connector_update_e=
did_property(&ast_connector->base, edid);
312fec1405dd54 Dave Airlie       2012-02-29  1233  		ret =3D drm_add_edid_m=
odes(connector, edid);
993dcb05e47e35 Jani Nikula       2012-08-15  1234  		kfree(edid);
312fec1405dd54 Dave Airlie       2012-02-29  1235  		return ret;
6c9bd4432b2527 Gregory Williams  2021-07-30  1236  	}
c555f02371c338 Daniel Vetter     2018-07-09  1237  	drm_connector_update_ed=
id_property(&ast_connector->base, NULL);
312fec1405dd54 Dave Airlie       2012-02-29  1238  	return 0;
312fec1405dd54 Dave Airlie       2012-02-29  1239  }
312fec1405dd54 Dave Airlie       2012-02-29  1240  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7985482143001274610==--

