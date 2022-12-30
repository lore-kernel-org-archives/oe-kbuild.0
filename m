Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F65C2F55
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Dec 2022 23:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672443312; x=1703979312;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OnrcHN5RPX3b+kj40EV0IFr99FUzP0O2lToaof6bBTw=;
  b=LKWWyxh6wRgchJQYugA9B1X8C96wsqEBCsYayU5NzadjUW7khwU1YKPd
   bB2aO4LqgcmMUm6rr29uOzrh6a4BpYMEKQ4gUefjpPCWxAUU0KbTLzgTQ
   yHYWp3NRQ0b+xx5bqbakDazNTps5LxGDSlpxXGnDOYh9IdqaVO1MUFJrM
   DmO600rNPefapE0Qt9P4C5W6Bfn+v2eSx27DA/sG88FP/WOalZeuL6lr5
   7dUR58NWF2NeekpZ/aXBeJgzNO/np7h5EA1sxn0Vz+zHQv9va26Hv9zAt
   vMN5N9wJ7WZzLv1e0j8OdP2zB6XNFZuxTYAuOc65K8m9rJ7V6rhgrReo0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="301638607"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="301638607"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 15:35:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="796339164"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="796339164"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2022 15:35:10 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBOu5-000Lp1-2U;
	Fri, 30 Dec 2022 23:35:09 +0000
Date: Sat, 31 Dec 2022 07:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpio/gpiolib-of.c:510:0: warning: Uninitialized variable:
 of_flags [uninitvar]
Message-ID: <202212310731.NwrL6FcA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpio/gpiolib-of.c:510:0: warning: Uninitialized variable: of_flags [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c8451c141e07a8d05693f6c8d0e418fbb4b68bb7
commit: a2b5e207cade33b4d2dfd920f783f13b1f173e78 gpiolib: rework quirk handling in of_find_gpio()
date:   4 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a2b5e207cade33b4d2dfd920f783f13b1f173e78
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

cppcheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_bridge.c:1111:7: warning: Local variable 'ret' shadows outer variable [shadowVariable]
     int ret;
         ^
   drivers/gpu/drm/drm_bridge.c:1099:6: note: Shadowed declaration
    int ret;
        ^
   drivers/gpu/drm/drm_bridge.c:1111:7: note: Shadow variable
     int ret;
         ^
>> drivers/gpu/drm/logicvc/logicvc_drm.c:233:26: warning: Local variable 'clocks' shadows outer variable [shadowVariable]
     clk_disable_unprepare(*clocks[i]);
                            ^
   drivers/gpu/drm/logicvc/logicvc_drm.c:221:15: note: Shadowed declaration
    struct clk **clocks[] = {
                 ^
   drivers/gpu/drm/logicvc/logicvc_drm.c:233:26: note: Shadow variable
     clk_disable_unprepare(*clocks[i]);
                            ^
--
>> drivers/gpu/drm/drm_modes.c:1858:16: warning: Local variable 'len' shadows outer variable [shadowVariable]
     unsigned int len = strlen(mode_option);
                  ^
   drivers/gpu/drm/drm_modes.c:1794:9: note: Shadowed declaration
    int i, len, ret;
           ^
   drivers/gpu/drm/drm_modes.c:1858:16: note: Shadow variable
     unsigned int len = strlen(mode_option);
                  ^
--
>> drivers/gpu/drm/radeon/radeon_device.c:1578:22: warning: Local variable 'robj' shadows outer variable [shadowVariable]
      struct radeon_bo *robj = gem_to_radeon_bo(radeon_crtc->cursor_bo);
                        ^
   drivers/gpu/drm/radeon/radeon_device.c:1575:21: note: Shadowed declaration
     struct radeon_bo *robj;
                       ^
   drivers/gpu/drm/radeon/radeon_device.c:1578:22: note: Shadow variable
      struct radeon_bo *robj = gem_to_radeon_bo(radeon_crtc->cursor_bo);
                        ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpio/gpiolib-of.c:510:0: warning: Uninitialized variable: of_flags [uninitvar]
    const of_find_gpio_quirk *q;
   ^
   drivers/gpio/gpiolib-of.c:711:28: warning: Parameter 'hog' can be declared as pointer to const [constParameter]
          struct device_node *hog)
                              ^
>> drivers/gpu/drm/bridge/tc358768.c:862:8: warning: Signed integer overflow for expression '6<<29'. [integerOverflow]
    val = TC358768_DSI_CONFW_MODE_CLR | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
          ^
   drivers/gpu/drm/bridge/tc358768.c:867:8: warning: Signed integer overflow for expression '5<<29'. [integerOverflow]
    val = TC358768_DSI_CONFW_MODE_SET | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
          ^
   drivers/gpu/drm/bridge/tc358768.c:881:8: warning: Signed integer overflow for expression '6<<29'. [integerOverflow]
    val = TC358768_DSI_CONFW_MODE_CLR | TC358768_DSI_CONFW_ADDR_DSI_CONTROL;
          ^
--
>> drivers/gpu/drm/ttm/ttm_bo.c:1097:28: warning: Local variable 'ctx' shadows outer argument [shadowArgument]
     struct ttm_operation_ctx ctx = { false, false };
                              ^
   drivers/gpu/drm/ttm/ttm_bo.c:1057:76: note: Shadowed declaration
   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
                                                                              ^
   drivers/gpu/drm/ttm/ttm_bo.c:1097:28: note: Shadow variable
     struct ttm_operation_ctx ctx = { false, false };
                              ^
--
>> drivers/gpu/drm/bridge/tc358767.c:932:18: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     dp0_syncval |= SYNCVAL_VS_POL_ACTIVE_LOW;
                    ^
>> drivers/gpu/drm/bridge/tc358767.c:932:18: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
     dp0_syncval |= SYNCVAL_VS_POL_ACTIVE_LOW;
                    ^
   drivers/gpu/drm/bridge/tc358767.c:1109:11: warning: Signed integer overflow for expression '15<<28'. [integerOverflow]
         (15 << 28) | /* Defer Iteration Count */
             ^
--
>> drivers/gpu/drm/drm_bridge.c:1303:59: warning: Parameter 'np' can be declared as pointer to const [constParameter]
   struct drm_bridge *of_drm_find_bridge(struct device_node *np)
                                                             ^
--
>> drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:155:6: warning: The if condition is the same as the previous if condition [duplicateCondition]
    if (enable)
        ^
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:144:6: note: First condition
    if (enable) {
        ^
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:155:6: note: Second condition
    if (enable)
        ^
>> drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:263:16: warning: Uninitialized variable: config.csc_coefficents [uninitvar]
           config.csc_coefficents,
                  ^
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:218:6: note: Assuming condition is true
    if (rgb) {
        ^
   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:263:16: note: Uninitialized variable: config.csc_coefficents
           config.csc_coefficents,
                  ^
>> drivers/gpu/drm/solomon/ssd130x.c:414:68: warning: Parameter 'buf' can be declared as pointer to const [constParameter]
   static int ssd130x_update_rect(struct ssd130x_device *ssd130x, u8 *buf,
                                                                      ^
--
>> drivers/gpu/drm/tidss/tidss_dispc.c:2299:11: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      v |= 1 << 31;
             ^
>> drivers/gpu/drm/tidss/tidss_dispc.c:2299:11: warning: Signed integer overflow for expression '1<<31'. [integerOverflow]
      v |= 1 << 31;
             ^
>> drivers/gpu/drm/radeon/radeon_pm.c:157:11: warning: Uninitialized variable: bo->tbo [uninitvar]
     if (bo->tbo.resource->mem_type == TTM_PL_VRAM)
             ^
   drivers/gpu/drm/radeon/radeon_pm.c:153:16: note: Assuming condition is false
    if (list_empty(&rdev->gem.objects))
                  ^
   drivers/gpu/drm/radeon/radeon_pm.c:157:11: note: Uninitialized variable: bo->tbo
     if (bo->tbo.resource->mem_type == TTM_PL_VRAM)
             ^
--
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:5116:34: warning: Parameter 'branch' can be declared as pointer to const [constParameter]
          struct drm_dp_mst_branch *branch)
                                    ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:797:27: warning: Parameter 'pos' can be declared as pointer to const [constParameter]
        size_t size, loff_t *pos)
                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:878:27: warning: Parameter 'pos' can be declared as pointer to const [constParameter]
        size_t size, loff_t *pos)
                             ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:970:27: warning: Parameter 'pos' can be declared as pointer to const [constParameter]
        size_t size, loff_t *pos)
                             ^
>> drivers/gpu/drm/nouveau/dispnv04/tvnv17.c:685:26: warning: Parameter 'property' can be declared as pointer to const [constParameter]
       struct drm_property *property,
                            ^
>> drivers/gpu/drm/nouveau/dispnv04/tvnv17.c:111:9: warning: Signed integer overflow for expression '0xa<<28'. [integerOverflow]
     & 0xa << 28;
           ^
--
>> drivers/gpu/drm/nouveau/nouveau_bo.c:920:20: warning: Uninitialized variables: vma.vmm, vma.refs, vma.head, vma.addr, vma.mem, vma.fence [uninitvar]
      nouveau_vma_map(vma, mem);
                      ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:912:18: note: Assuming condition is false
    if (bo->destroy != nouveau_bo_del_ttm)
                    ^
   drivers/gpu/drm/nouveau/nouveau_bo.c:920:20: note: Uninitialized variables: vma.vmm, vma.refs, vma.head, vma.addr, vma.mem, vma.fence
      nouveau_vma_map(vma, mem);
                      ^

vim +510 drivers/gpio/gpiolib-of.c

a2b5e207cade33 Dmitry Torokhov  2022-09-07  504  
ea713bc450054a Linus Walleij    2016-10-03  505  struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
fed7026adc7c3a Andy Shevchenko  2019-04-10  506  			       unsigned int idx, unsigned long *flags)
ea713bc450054a Linus Walleij    2016-10-03  507  {
ea713bc450054a Linus Walleij    2016-10-03  508  	char prop_name[32]; /* 32 is max size of property name */
ea713bc450054a Linus Walleij    2016-10-03  509  	enum of_gpio_flags of_flags;
a2b5e207cade33 Dmitry Torokhov  2022-09-07 @510  	const of_find_gpio_quirk *q;
ea713bc450054a Linus Walleij    2016-10-03  511  	struct gpio_desc *desc;
ea713bc450054a Linus Walleij    2016-10-03  512  	unsigned int i;
ea713bc450054a Linus Walleij    2016-10-03  513  
c85823390215e5 Linus Walleij    2017-12-27  514  	/* Try GPIO property "foo-gpios" and "foo-gpio" */
ea713bc450054a Linus Walleij    2016-10-03  515  	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
ea713bc450054a Linus Walleij    2016-10-03  516  		if (con_id)
ea713bc450054a Linus Walleij    2016-10-03  517  			snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
ea713bc450054a Linus Walleij    2016-10-03  518  				 gpio_suffixes[i]);
ea713bc450054a Linus Walleij    2016-10-03  519  		else
ea713bc450054a Linus Walleij    2016-10-03  520  			snprintf(prop_name, sizeof(prop_name), "%s",
ea713bc450054a Linus Walleij    2016-10-03  521  				 gpio_suffixes[i]);
ea713bc450054a Linus Walleij    2016-10-03  522  
ea713bc450054a Linus Walleij    2016-10-03  523  		desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
ea713bc450054a Linus Walleij    2016-10-03  524  						&of_flags);
6662ae6af82df1 Maxime Ripard    2018-02-21  525  
7b58696d9a8415 Andy Shevchenko  2020-10-21  526  		if (!gpiod_not_found(desc))
ea713bc450054a Linus Walleij    2016-10-03  527  			break;
ea713bc450054a Linus Walleij    2016-10-03  528  	}
ea713bc450054a Linus Walleij    2016-10-03  529  
a2b5e207cade33 Dmitry Torokhov  2022-09-07  530  	/* Properly named GPIO was not found, try workarounds */
a2b5e207cade33 Dmitry Torokhov  2022-09-07  531  	for (q = of_find_gpio_quirks; gpiod_not_found(desc) && *q; q++)
a2b5e207cade33 Dmitry Torokhov  2022-09-07  532  		desc = (*q)(dev->of_node, con_id, idx, &of_flags);
6e24826d2c51a0 Linus Walleij    2020-04-15  533  
ea713bc450054a Linus Walleij    2016-10-03  534  	if (IS_ERR(desc))
ea713bc450054a Linus Walleij    2016-10-03  535  		return desc;
ea713bc450054a Linus Walleij    2016-10-03  536  
ea713bc450054a Linus Walleij    2016-10-03  537  	if (of_flags & OF_GPIO_ACTIVE_LOW)
ea713bc450054a Linus Walleij    2016-10-03  538  		*flags |= GPIO_ACTIVE_LOW;
ea713bc450054a Linus Walleij    2016-10-03  539  
ea713bc450054a Linus Walleij    2016-10-03  540  	if (of_flags & OF_GPIO_SINGLE_ENDED) {
4c0facddb7d88c Laxman Dewangan  2017-04-06  541  		if (of_flags & OF_GPIO_OPEN_DRAIN)
ea713bc450054a Linus Walleij    2016-10-03  542  			*flags |= GPIO_OPEN_DRAIN;
ea713bc450054a Linus Walleij    2016-10-03  543  		else
ea713bc450054a Linus Walleij    2016-10-03  544  			*flags |= GPIO_OPEN_SOURCE;
ea713bc450054a Linus Walleij    2016-10-03  545  	}
ea713bc450054a Linus Walleij    2016-10-03  546  
e10f72bf4b3e88 Andrew Jeffery   2017-11-30  547  	if (of_flags & OF_GPIO_TRANSITORY)
e10f72bf4b3e88 Andrew Jeffery   2017-11-30  548  		*flags |= GPIO_TRANSITORY;
05f479bf7d239f Charles Keepax   2017-05-23  549  
d449991c4d1d06 Thomas Petazzoni 2019-02-07  550  	if (of_flags & OF_GPIO_PULL_UP)
d449991c4d1d06 Thomas Petazzoni 2019-02-07  551  		*flags |= GPIO_PULL_UP;
d449991c4d1d06 Thomas Petazzoni 2019-02-07  552  	if (of_flags & OF_GPIO_PULL_DOWN)
d449991c4d1d06 Thomas Petazzoni 2019-02-07  553  		*flags |= GPIO_PULL_DOWN;
31bea23119cda8 Nuno Sá          2022-07-13  554  	if (of_flags & OF_GPIO_PULL_DISABLE)
31bea23119cda8 Nuno Sá          2022-07-13  555  		*flags |= GPIO_PULL_DISABLE;
d449991c4d1d06 Thomas Petazzoni 2019-02-07  556  
ea713bc450054a Linus Walleij    2016-10-03  557  	return desc;
ea713bc450054a Linus Walleij    2016-10-03  558  }
ea713bc450054a Linus Walleij    2016-10-03  559  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
