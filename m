Content-Type: multipart/mixed; boundary="===============7186700826931185374=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/ast/ast_mode.c:1232:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 14 Jan 2022 14:12:05 +0800
Message-ID: <202201141416.VfNXpsi5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7186700826931185374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Maxime Ripard <maxime@cerno.tech>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fb3b0673b7d5b477ed104949450cd511337ba3c6
commit: 55dc449a7c60d3df5a8f0b71bbae9d5173c864f5 drm/ast: Handle failed I2C=
 initialization gracefully
date:   4 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 weeks ago
config: riscv-randconfig-c006-20220113 (https://download.01.org/0day-ci/arc=
hive/20220114/202201141416.VfNXpsi5-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d10219=
78b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D55dc449a7c60d3df5a8f0b71bbae9d5173c864f5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 55dc449a7c60d3df5a8f0b71bbae9d5173c864f5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/overlayfs/export.c:654:34: note: '?' condition is false
   fs/overlayfs/export.c:655:24: note: '?' condition is false
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                 ^
   fs/overlayfs/export.c:655:34: note: '?' condition is false
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
                                           ^
   fs/overlayfs/export.c:655:2: note: 'real' initialized to a null pointer =
value
           struct dentry *real =3D upper ?: (index ?: lowerpath->dentry);
           ^~~~~~~~~~~~~~~~~~~
   fs/overlayfs/export.c:661:16: note: Passing null pointer value via 1st p=
arameter 'dentry'
           if (!d_is_dir(real))
                         ^~~~
   fs/overlayfs/export.c:661:7: note: Calling 'd_is_dir'
           if (!d_is_dir(real))
                ^~~~~~~~~~~~~~
   include/linux/dcache.h:420:22: note: Passing null pointer value via 1st =
parameter 'dentry'
           return d_can_lookup(dentry) || d_is_autodir(dentry);
                               ^~~~~~
   include/linux/dcache.h:420:9: note: Calling 'd_can_lookup'
           return d_can_lookup(dentry) || d_is_autodir(dentry);
                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:410:24: note: Passing null pointer value via 1st =
parameter 'dentry'
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                                 ^~~~~~
   include/linux/dcache.h:410:9: note: Calling '__d_entry_type'
           return __d_entry_type(dentry) =3D=3D DCACHE_DIRECTORY_TYPE;
                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:395:9: note: Access to field 'd_flags' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_flags & DCACHE_ENTRY_TYPE;
                  ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
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
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/gpu/drm/ast/ast_dp501.c:227:20: warning: Access to field 'data' =
results in a dereference of a null pointer (loaded from field 'dp501_fw') [=
clang-analyzer-core.NullDereference]
                           fw_addr =3D (u8 *)ast->dp501_fw->data;
                                           ^
   drivers/gpu/drm/ast/ast_dp501.c:498:6: note: Assuming field 'chip' is eq=
ual to AST2300
           if (ast->chip =3D=3D AST2300 || ast->chip =3D=3D AST2400) {
               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_dp501.c:498:27: note: Left side of '||' is true
           if (ast->chip =3D=3D AST2300 || ast->chip =3D=3D AST2400) {
                                    ^
   drivers/gpu/drm/ast/ast_dp501.c:500:3: note: Control jumps to 'case 8:' =
 at line 504
                   switch (jreg & 0x0e) {
                   ^
   drivers/gpu/drm/ast/ast_dp501.c:505:4: note: Calling 'ast_launch_m68k'
                           ast_launch_m68k(dev);
                           ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_dp501.c:213:6: note: Assuming field 'config_mode=
' is equal to ast_use_p2a
           if (ast->config_mode !=3D ast_use_p2a)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_dp501.c:213:2: note: Taking false branch
           if (ast->config_mode !=3D ast_use_p2a)
           ^
   drivers/gpu/drm/ast/ast_dp501.c:217:6: note: Assuming 'data' is 0
           if (!data) {
               ^~~~~
   drivers/gpu/drm/ast/ast_dp501.c:217:2: note: Taking true branch
           if (!data) {
           ^
   drivers/gpu/drm/ast/ast_dp501.c:219:7: note: Assuming field 'dp501_fw_ad=
dr' is null
                   if (ast->dp501_fw_addr) {
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_dp501.c:219:3: note: Taking false branch
                   if (ast->dp501_fw_addr) {
                   ^
   drivers/gpu/drm/ast/ast_dp501.c:223:8: note: Assuming field 'dp501_fw' i=
s null
                           if (!ast->dp501_fw &&
                               ^~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_dp501.c:223:8: note: Left side of '&&' is true
   drivers/gpu/drm/ast/ast_dp501.c:224:8: note: Calling 'ast_load_dp501_mic=
rocode'
                               ast_load_dp501_microcode(dev) < 0)
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/ast/ast_dp501.c:25:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/gpu/drm/ast/ast_dp501.c:25:2: note: Taking false branch
           if (ret)
           ^
   drivers/gpu/drm/ast/ast_dp501.c:28:9: note: Calling 'devm_add_action_or_=
reset'
           return devm_add_action_or_reset(dev->dev, ast_release_firmware, =
ast);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/device.h:254:6: note: Assuming 'ret' is not equal to 0

vim +1232 drivers/gpu/drm/ast/ast_mode.c

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
55dc449a7c60d3 Thomas Zimmermann 2021-12-06  1213  	struct edid *edid =3D N=
ULL;
83c6620bae3f14 Dave Airlie       2014-03-28  1214  	bool flags =3D false;
55dc449a7c60d3 Thomas Zimmermann 2021-12-06  1215  	int ret;
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
55dc449a7c60d3 Thomas Zimmermann 2021-12-06  1229  	if (!flags && ast_conne=
ctor->i2c)
312fec1405dd54 Dave Airlie       2012-02-29  1230  		edid =3D drm_get_edid(=
connector, &ast_connector->i2c->adapter);
312fec1405dd54 Dave Airlie       2012-02-29  1231  	if (edid) {
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


:::::: The code at line 1232 was first introduced by commit
:::::: c555f02371c338b06752577aebf738dbdb6907bd drm: drop _mode_ from updat=
e_edit_property()

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7186700826931185374==--

