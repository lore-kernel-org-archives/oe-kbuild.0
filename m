Content-Type: multipart/mixed; boundary="===============4145913838823708555=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 271/3632] drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:205:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 26 Nov 2021 09:45:03 +0800
Message-ID: <202111260949.8O2BD0Ga-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4145913838823708555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
CC: Sam Ravnborg <sam@ravnborg.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f81e94e91878bded599cc60f2881cfd50991aeb9
commit: a19125a281128c836faae249c1001eb8d7a18b48 [271/3632] drm/panel: Add =
BOE BF060Y8M-AJ0 5.99" AMOLED panel driver
:::::: branch date: 21 hours ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20211119 (https://download.01.org/0day-ci/archi=
ve/20211126/202111260949.8O2BD0Ga-lkp(a)intel.com/config)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Da19125a281128c836faae249c1001eb8d7a18b48
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a19125a281128c836faae249c1001eb8d7a18b48
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/pinctrl/pinctrl-single.c:1830:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/pinctrl/pinctrl-single.c:1830:2: note: Taking false branch
           if (ret) {
           ^
   drivers/pinctrl/pinctrl-single.c:1837:6: note: Assuming 'res' is non-null
           if (!res) {
               ^~~~
   drivers/pinctrl/pinctrl-single.c:1837:2: note: Taking false branch
           if (!res) {
           ^
   drivers/pinctrl/pinctrl-single.c:1844:6: note: Assuming field 'res' is n=
on-null
           if (!pcs->res) {
               ^~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1844:2: note: Taking false branch
           if (!pcs->res) {
           ^
   drivers/pinctrl/pinctrl-single.c:1851:6: note: Assuming field 'base' is =
non-null
           if (!pcs->base) {
               ^~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1851:2: note: Taking false branch
           if (!pcs->base) {
           ^
   drivers/pinctrl/pinctrl-single.c:1856:2: note: Calling 'platform_set_drv=
data'
           platform_set_drvdata(pdev, pcs);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:243:2: note: Calling 'dev_set_drvdata'
           dev_set_drvdata(&pdev->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:692:1: note: Returning without writing to 'data->=
bits_per_mux', which participates in a condition later
   }
   ^
   include/linux/device.h:692:1: note: Returning without writing to 'data->=
bits_per_pin'
   include/linux/platform_device.h:243:2: note: Returning from 'dev_set_drv=
data'
           dev_set_drvdata(&pdev->dev, data);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/platform_device.h:244:1: note: Returning without writing t=
o 'data->bits_per_mux', which participates in a condition later
   }
   ^
   include/linux/platform_device.h:244:1: note: Returning without writing t=
o 'data->bits_per_pin'
   drivers/pinctrl/pinctrl-single.c:1856:2: note: Returning from 'platform_=
set_drvdata'
           platform_set_drvdata(pdev, pcs);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1858:2: note: Control jumps to the 'def=
ault' case at line 1871
           switch (pcs->width) {
           ^
   drivers/pinctrl/pinctrl-single.c:1872:3: note:  Execution continues on l=
ine 1875
                   break;
                   ^
   drivers/pinctrl/pinctrl-single.c:1878:6: note: Assuming the condition is=
 false
           if (PCS_HAS_PINCONF)
               ^
   drivers/pinctrl/pinctrl-single.c:212:27: note: expanded from macro 'PCS_=
HAS_PINCONF'
   #define PCS_HAS_PINCONF         (pcs->flags & PCS_FEAT_PINCONF)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1878:2: note: Taking false branch
           if (PCS_HAS_PINCONF)
           ^
   drivers/pinctrl/pinctrl-single.c:1882:8: note: Calling 'pcs_allocate_pin=
_table'
           ret =3D pcs_allocate_pin_table(pcs);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:730:11: note: Field 'bits_per_mux' is t=
rue
           if (pcs->bits_per_mux) {
                    ^
   drivers/pinctrl/pinctrl-single.c:730:2: note: Taking true branch
           if (pcs->bits_per_mux) {
           ^
   drivers/pinctrl/pinctrl-single.c:731:23: note: Calling 'fls'
                   pcs->bits_per_pin =3D fls(pcs->fmask);
                                       ^~~~~~~~~~~~~~~
   include/asm-generic/bitops/builtin-fls.h:14:9: note: Assuming 'x' is 0
           return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
                  ^
   include/asm-generic/bitops/builtin-fls.h:14:9: note: '?' condition is fa=
lse
   include/asm-generic/bitops/builtin-fls.h:14:2: note: Returning zero
           return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:731:23: note: Returning from 'fls'
                   pcs->bits_per_pin =3D fls(pcs->fmask);
                                       ^~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:731:3: note: The value 0 is assigned to=
 field 'bits_per_pin'
                   pcs->bits_per_pin =3D fls(pcs->fmask);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:732:41: note: Division by zero
                   nr_pins =3D (pcs->size * BITS_PER_BYTE) / pcs->bits_per_=
pin;
                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1417:3: warning: Value stored to 'mask'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   mask =3D pcs->read(pcswi->reg);
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-single.c:1417:3: note: Value stored to 'mask' is=
 never read
                   mask =3D pcs->read(pcswi->reg);
                   ^      ~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:205:2: warning: Value sto=
red to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regulator_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vreg=
s);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c:205:2: note: Value stored=
 to 'ret' is never read
           ret =3D regulator_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vreg=
s);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:65:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:65:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
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
   3 warnings generated.
   include/linux/dcache.h:526:9: warning: Access to field 'd_inode' results=
 in a dereference of a null pointer (loaded from variable 'dentry') [clang-=
analyzer-core.NullDereference]
           return dentry->d_inode;
                  ^
   fs/overlayfs/inode.c:1099:28: note: Assuming 'upperdentry' is null
           struct inode *realinode =3D upperdentry ? d_inode(upperdentry) :=
 NULL;
                                     ^~~~~~~~~~~
   fs/overlayfs/inode.c:1099:28: note: '?' condition is false
   fs/overlayfs/inode.c:1101:31: note: Assuming 'lowerpath' is null
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
                                        ^~~~~~~~~
   fs/overlayfs/inode.c:1101:31: note: '?' condition is false
   fs/overlayfs/inode.c:1101:2: note: 'lowerdentry' initialized to a null p=
ointer value
           struct dentry *lowerdentry =3D lowerpath ? lowerpath->dentry : N=
ULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/overlayfs/inode.c:1104:13: note: 'bylower' is false
           int fsid =3D bylower ? lowerpath->layer->fsid : 0;
                      ^~~~~~~
   fs/overlayfs/inode.c:1104:13: note: '?' condition is false
   fs/overlayfs/inode.c:1107:12: note: Assuming field 'newinode' is null
           int err =3D oip->newinode ? -EEXIST : -ENOMEM;
                     ^~~~~~~~~~~~~
   fs/overlayfs/inode.c:1107:12: note: '?' condition is false
   fs/overlayfs/inode.c:1109:7: note: 'realinode' is null
           if (!realinode)
                ^~~~~~~~~
   fs/overlayfs/inode.c:1109:2: note: Taking true branch
           if (!realinode)
           ^
   fs/overlayfs/inode.c:1110:23: note: Passing null pointer value via 1st p=
arameter 'dentry'
                   realinode =3D d_inode(lowerdentry);
                                       ^~~~~~~~~~~
   fs/overlayfs/inode.c:1110:15: note: Calling 'd_inode'
                   realinode =3D d_inode(lowerdentry);
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/dcache.h:526:9: note: Access to field 'd_inode' results in=
 a dereference of a null pointer (loaded from variable 'dentry')
           return dentry->d_inode;
                  ^~~~~~
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
   4 warnings generated.
   fs/overlayfs/export.c:498:17: warning: Value stored to 'ancestor' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct dentry *ancestor =3D ERR_PTR(-EIO);
                          ^~~~~~~~   ~~~~~~~~~~~~~
   fs/overlayfs/export.c:498:17: note: Value stored to 'ancestor' during it=
s initialization is never read
           struct dentry *ancestor =3D ERR_PTR(-EIO);
                          ^~~~~~~~   ~~~~~~~~~~~~~
   include/linux/dcache.h:395:9: warning: Access to field 'd_flags' results=
 in a dereference of a null pointer (loaded from variable 'dentry') [clang-=
analyzer-core.NullDereference]

vim +/ret +205 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  190  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  191  static int boe_b=
f060y8m_aj0_unprepare(struct drm_panel *panel)
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  192  {
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  193  	struct boe_bf06=
0y8m_aj0 *boe =3D to_boe_bf060y8m_aj0(panel);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  194  	struct device *=
dev =3D &boe->dsi->dev;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  195  	int ret;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  196  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  197  	if (!boe->prepa=
red)
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  198  		return 0;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  199  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  200  	ret =3D boe_bf0=
60y8m_aj0_off(boe);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  201  	if (ret < 0)
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  202  		dev_err(dev, "=
Failed to un-initialize panel: %d\n", ret);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  203  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  204  	gpiod_set_value=
_cansleep(boe->reset_gpio, 1);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01 @205  	ret =3D regulat=
or_bulk_disable(ARRAY_SIZE(boe->vregs), boe->vregs);
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  206  =

a19125a281128c AngeloGioacchino Del Regno 2021-09-01  207  	boe->prepared =
=3D false;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  208  	return 0;
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  209  }
a19125a281128c AngeloGioacchino Del Regno 2021-09-01  210  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4145913838823708555==--

