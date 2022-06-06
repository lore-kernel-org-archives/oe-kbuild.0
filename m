Content-Type: multipart/mixed; boundary="===============5802442193902082290=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stored to 'isc_clk' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 06 Jun 2022 10:41:21 +0800
Message-ID: <202206060942.zOb08XEA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5802442193902082290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stored to 'isc_c=
lk' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Eugen Hristev <eugen.hristev@microchip.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Jacopo Mondi <jacopo+renesas@jmondi.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d717180e7f9775d468f415c10a4a474640146001
commit: 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0 media: atmel: atmel-isc: s=
plit the clock code into separate source file
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220605 (https://download.01.org/0day-ci/archi=
ve/20220606/202206060942.zOb08XEA-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 118bf76a35bc2ed061cd1454fe5e57d1c7bcd8d0
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (WARN_ON(!sysdev->dma_mask))
                        ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/usb/host/xhci-plat.c:200:6: note: Assuming the condition is false
           if (usb_disabled())
               ^~~~~~~~~~~~~~
   drivers/usb/host/xhci-plat.c:200:2: note: Taking false branch
           if (usb_disabled())
           ^
   drivers/usb/host/xhci-plat.c:206:6: note: Assuming 'irq' is >=3D 0
           if (irq < 0)
               ^~~~~~~
   drivers/usb/host/xhci-plat.c:206:2: note: Taking false branch
           if (irq < 0)
           ^
   drivers/usb/host/xhci-plat.c:216:28: note: Assuming pointer value is null
           for (sysdev =3D &pdev->dev; sysdev; sysdev =3D sysdev->parent) {
                                     ^~~~~~
   drivers/usb/host/xhci-plat.c:216:2: note: Loop condition is false. Execu=
tion continues on line 226
           for (sysdev =3D &pdev->dev; sysdev; sysdev =3D sysdev->parent) {
           ^
   drivers/usb/host/xhci-plat.c:226:7: note: 'sysdev' is null
           if (!sysdev)
                ^~~~~~
   drivers/usb/host/xhci-plat.c:226:2: note: Taking true branch
           if (!sysdev)
           ^
   drivers/usb/host/xhci-plat.c:227:3: note: Null pointer value stored to '=
sysdev'
                   sysdev =3D &pdev->dev;
                   ^~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-plat.c:230:15: note: Access to field 'dma_mask' re=
sults in a dereference of a null pointer (loaded from variable 'sysdev')
           if (WARN_ON(!sysdev->dma_mask))
                        ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:479:2: warning: Valu=
e stored to 'cif_id' is never read [clang-analyzer-deadcode.DeadStores]
           cif_id =3D rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:479:2: note: Value s=
tored to 'cif_id' is never read
           cif_id =3D rkisp1_read(rkisp1, RKISP1_CIF_VI_ID);
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:910:24: warning: Val=
ue stored to 'rkisp1' during its initialization is never read [clang-analyz=
er-deadcode.DeadStores]
           struct rkisp1_device *rkisp1 =3D
                                 ^~~~~~
   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c:910:24: note: Value =
stored to 'rkisp1' during its initialization is never read
           struct rkisp1_device *rkisp1 =3D
                                 ^~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/platform/atmel/atmel-isc-clk.c:125:18: warning: Value stor=
ed to 'isc_clk' during its initialization is never read [clang-analyzer-dea=
dcode.DeadStores]
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   drivers/media/platform/atmel/atmel-isc-clk.c:125:18: note: Value stored =
to 'isc_clk' during its initialization is never read
           struct isc_clk *isc_clk =3D to_isc_clk(hw);
                           ^~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   sound/core/device.c:237:2: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:773:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:572:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   sound/core/device.c:226:17: note: Assuming 'card' is non-null
           if (snd_BUG_ON(!card))
                          ^
   include/sound/core.h:401:35: note: expanded from macro 'snd_BUG_ON'
   #define snd_BUG_ON(cond)        WARN_ON((cond))
                                            ^~~~
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   sound/core/device.c:226:2: note: Taking false branch
           if (snd_BUG_ON(!card))
           ^
   sound/core/device.c:228:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:772:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:230:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_CONTROL
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:7: note: Left side of '||' is false
   sound/core/device.c:231:7: note: Assuming field 'type' is not equal to S=
NDRV_DEV_LOWLEVEL
                       dev->type =3D=3D SNDRV_DEV_LOWLEVEL)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:230:3: note: Taking false branch
                   if (dev->type =3D=3D SNDRV_DEV_CONTROL ||
                   ^
   sound/core/device.c:233:3: note: Calling '__snd_device_free'
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:6: note: Assuming field 'dev_free' is null
           if (dev->ops->dev_free) {
               ^~~~~~~~~~~~~~~~~~
   sound/core/device.c:75:2: note: Taking false branch
           if (dev->ops->dev_free) {
           ^
   sound/core/device.c:79:2: note: Memory is released
           kfree(dev);
           ^~~~~~~~~~
   sound/core/device.c:233:3: note: Returning; memory was released via 1st =
parameter
                   __snd_device_free(dev);
                   ^~~~~~~~~~~~~~~~~~~~~~
   sound/core/device.c:228:2: note: Loop condition is false. Execution cont=
inues on line 237
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list=
) {
           ^
   include/linux/list.h:772:2: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
           for (pos =3D list_last_entry(head, typeof(*pos), member),       =
  \
           ^
   sound/core/device.c:237:2: note: Use of memory after it is freed
           list_for_each_entry_safe_reverse(dev, next, &card->devices, list)
           ^
   include/linux/list.h:773:7: note: expanded from macro 'list_for_each_ent=
ry_safe_reverse'
                   n =3D list_prev_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:572:2: note: expanded from macro 'list_prev_entry'
           list_entry((pos)->member.prev, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:25: note: expanded from macro 'container=
_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
                                  ^~~~~
   4 warnings generated.
   drivers/gpu/drm/bridge/tc358767.c:678:2: warning: Value stored to 'revis=
ion' is never read [clang-analyzer-deadcode.DeadStores]
           revision =3D tc->link.dpcd[DP_DPCD_REV];
           ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/tc358767.c:678:2: note: Value stored to 'revision=
' is never read
           revision =3D tc->link.dpcd[DP_DPCD_REV];

vim +/isc_clk +125 drivers/media/platform/atmel/atmel-isc-clk.c

118bf76a35bc2e Eugen Hristev 2021-12-13  121  =

118bf76a35bc2e Eugen Hristev 2021-12-13  122  static int isc_clk_determine_=
rate(struct clk_hw *hw,
118bf76a35bc2e Eugen Hristev 2021-12-13  123  				  struct clk_rate_request=
 *req)
118bf76a35bc2e Eugen Hristev 2021-12-13  124  {
118bf76a35bc2e Eugen Hristev 2021-12-13 @125  	struct isc_clk *isc_clk =3D =
to_isc_clk(hw);
118bf76a35bc2e Eugen Hristev 2021-12-13  126  	long best_rate =3D -EINVAL;
118bf76a35bc2e Eugen Hristev 2021-12-13  127  	int best_diff =3D -1;
118bf76a35bc2e Eugen Hristev 2021-12-13  128  	unsigned int i, div;
118bf76a35bc2e Eugen Hristev 2021-12-13  129  =

118bf76a35bc2e Eugen Hristev 2021-12-13  130  	for (i =3D 0; i < clk_hw_get=
_num_parents(hw); i++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  131  		struct clk_hw *parent;
118bf76a35bc2e Eugen Hristev 2021-12-13  132  		unsigned long parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  133  =

118bf76a35bc2e Eugen Hristev 2021-12-13  134  		parent =3D clk_hw_get_paren=
t_by_index(hw, i);
118bf76a35bc2e Eugen Hristev 2021-12-13  135  		if (!parent)
118bf76a35bc2e Eugen Hristev 2021-12-13  136  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  137  =

118bf76a35bc2e Eugen Hristev 2021-12-13  138  		parent_rate =3D clk_hw_get_=
rate(parent);
118bf76a35bc2e Eugen Hristev 2021-12-13  139  		if (!parent_rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  140  			continue;
118bf76a35bc2e Eugen Hristev 2021-12-13  141  =

118bf76a35bc2e Eugen Hristev 2021-12-13  142  		for (div =3D 1; div < ISC_C=
LK_MAX_DIV + 2; div++) {
118bf76a35bc2e Eugen Hristev 2021-12-13  143  			unsigned long rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  144  			int diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  145  =

118bf76a35bc2e Eugen Hristev 2021-12-13  146  			rate =3D DIV_ROUND_CLOSEST=
(parent_rate, div);
118bf76a35bc2e Eugen Hristev 2021-12-13  147  			diff =3D abs(req->rate - r=
ate);
118bf76a35bc2e Eugen Hristev 2021-12-13  148  =

118bf76a35bc2e Eugen Hristev 2021-12-13  149  			if (best_diff < 0 || best_=
diff > diff) {
118bf76a35bc2e Eugen Hristev 2021-12-13  150  				best_rate =3D rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  151  				best_diff =3D diff;
118bf76a35bc2e Eugen Hristev 2021-12-13  152  				req->best_parent_rate =3D=
 parent_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  153  				req->best_parent_hw =3D p=
arent;
118bf76a35bc2e Eugen Hristev 2021-12-13  154  			}
118bf76a35bc2e Eugen Hristev 2021-12-13  155  =

118bf76a35bc2e Eugen Hristev 2021-12-13  156  			if (!best_diff || rate < r=
eq->rate)
118bf76a35bc2e Eugen Hristev 2021-12-13  157  				break;
118bf76a35bc2e Eugen Hristev 2021-12-13  158  		}
118bf76a35bc2e Eugen Hristev 2021-12-13  159  =

118bf76a35bc2e Eugen Hristev 2021-12-13  160  		if (!best_diff)
118bf76a35bc2e Eugen Hristev 2021-12-13  161  			break;
118bf76a35bc2e Eugen Hristev 2021-12-13  162  	}
118bf76a35bc2e Eugen Hristev 2021-12-13  163  =

118bf76a35bc2e Eugen Hristev 2021-12-13  164  	dev_dbg(isc_clk->dev,
118bf76a35bc2e Eugen Hristev 2021-12-13  165  		"ISC CLK: %s, best_rate =3D=
 %ld, parent clk: %s @ %ld\n",
118bf76a35bc2e Eugen Hristev 2021-12-13  166  		__func__, best_rate,
118bf76a35bc2e Eugen Hristev 2021-12-13  167  		__clk_get_name((req->best_p=
arent_hw)->clk),
118bf76a35bc2e Eugen Hristev 2021-12-13  168  		req->best_parent_rate);
118bf76a35bc2e Eugen Hristev 2021-12-13  169  =

118bf76a35bc2e Eugen Hristev 2021-12-13  170  	if (best_rate < 0)
118bf76a35bc2e Eugen Hristev 2021-12-13  171  		return best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  172  =

118bf76a35bc2e Eugen Hristev 2021-12-13  173  	req->rate =3D best_rate;
118bf76a35bc2e Eugen Hristev 2021-12-13  174  =

118bf76a35bc2e Eugen Hristev 2021-12-13  175  	return 0;
118bf76a35bc2e Eugen Hristev 2021-12-13  176  }
118bf76a35bc2e Eugen Hristev 2021-12-13  177  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5802442193902082290==--

