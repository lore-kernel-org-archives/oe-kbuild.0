Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E062A3B
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Mar 2023 05:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677646987; x=1709182987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ntD34ENgU1DweAHVYA/Kvgmk9Uh+w5pbwqToZCZAdcE=;
  b=ZH+UQsV5icbFhHUzYRuLeoFgbEh9wpx7/yE+qV1eoMTNzZKhz7QnRqVL
   sfcwptlka02xU7zP55B/YArpAf9BtXX0GzmccjS1eVIHh439ctUikd6/N
   X14yotAllzeChT+RHK67YBqk3Z47pAADcBaxL0WZ1kNskLV+swtTJfzYQ
   MtpJhrapM3xmJxyI9UVVcya+8nWZ7rd4tE4n1dVHY4wa1eaORYmUZZaig
   5nf7PThswRbUDz462MRsSbf3+XTKdJkrCJS3HmiqY4CMu/zOlfGCFo+Tj
   I0q6DtjQXeyzw0jCDW87S99IJBubbziAzd/0TTh2w6z+FR1n0zv2Tq+tS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="318122561"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="318122561"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 21:03:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="624343618"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="624343618"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Feb 2023 21:03:05 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXEcL-0005tn-07;
	Wed, 01 Mar 2023 05:03:05 +0000
Date: Wed, 1 Mar 2023 13:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/platform/renesas/sh_vou.c:483:23: warning: The right
 operand of '|' is a garbage value due to array index out of bounds
 [clang-analyzer-core.UndefinedBinaryOperatorResult]
Message-ID: <202303011204.qGrT4psP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/platform/renesas/sh_vou.c:483:23: warning: The right operand of '|' is a garbage value due to array index out of bounds [clang-analyzer-core.UndefinedBinaryOperatorResult]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0927a7a5391f7d8e593e5e50ead7505a23cadf9
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Renesas drivers on a separate dir
date:   12 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20230226 (https://download.01.org/0day-ci/archive/20230301/202303011204.qGrT4psP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ee4a77a32b39064fdab0aa2b36bbd35ebf57e077
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303011204.qGrT4psP-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/kernel.h:180:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   include/linux/pagemap.h:790:21: note: Passing null pointer value via 1st parameter 'page'
           folio = page_folio(page);
                              ^
   include/linux/page-flags.h:219:49: note: expanded from macro 'page_folio'
           struct page *:          (struct folio *)_compound_head(p)))
                                                                  ^
   include/linux/pagemap.h:790:10: note: Calling '_compound_head'
           folio = page_folio(page);
                   ^
   include/linux/page-flags.h:219:34: note: expanded from macro 'page_folio'
           struct page *:          (struct folio *)_compound_head(p)))
                                                   ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:195:23: note: Left side of '||' is false
           unsigned long head = READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   include/linux/page-flags.h:195:23: note: Left side of '||' is false
           unsigned long head = READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__native_word'
           (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
            ^
   include/linux/page-flags.h:195:23: note: Left side of '||' is true
           unsigned long head = READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__native_word'
            sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
                                     ^
   include/linux/page-flags.h:195:23: note: Taking false branch
           unsigned long head = READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/page-flags.h:195:23: note: Loop condition is false.  Exiting loop
           unsigned long head = READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compiletime_assert'
           do {                                                            \
           ^
   include/linux/page-flags.h:195:23: note: Dereference of null pointer
           unsigned long head = READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ONCE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> drivers/media/platform/renesas/sh_vou.c:483:23: warning: The right operand of '|' is a garbage value due to array index out of bounds [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   vouvcr |= (1 << 14) | vou_scale_v_fld[h_idx - 1];
                                       ^
   drivers/media/platform/renesas/sh_vou.c:1234:6: note: Assuming 'vou_pdata' is non-null
           if (!vou_pdata || !reg_res || irq <= 0) {
               ^~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1234:6: note: Left side of '||' is false
   drivers/media/platform/renesas/sh_vou.c:1234:20: note: Assuming 'reg_res' is non-null
           if (!vou_pdata || !reg_res || irq <= 0) {
                             ^~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1234:6: note: Left side of '||' is false
           if (!vou_pdata || !reg_res || irq <= 0) {
               ^
   drivers/media/platform/renesas/sh_vou.c:1234:32: note: Assuming 'irq' is > 0
           if (!vou_pdata || !reg_res || irq <= 0) {
                                         ^~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1234:2: note: Taking false branch
           if (!vou_pdata || !reg_res || irq <= 0) {
           ^
   drivers/media/platform/renesas/sh_vou.c:1240:6: note: Assuming 'vou_dev' is non-null
           if (!vou_dev)
               ^~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1240:2: note: Taking false branch
           if (!vou_dev)
           ^
   drivers/media/platform/renesas/sh_vou.c:1244:2: note: Loop condition is false.  Exiting loop
           spin_lock_init(&vou_dev->lock);
           ^
   include/linux/spinlock.h:339:34: note: expanded from macro 'spin_lock_init'
   # define spin_lock_init(_lock)                  \
                                                   ^
   drivers/media/platform/renesas/sh_vou.c:1245:2: note: Loop condition is false.  Exiting loop
           mutex_init(&vou_dev->fop_lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/media/platform/renesas/sh_vou.c:1268:2: note: Taking false branch
           if (IS_ERR(vou_dev->base))
           ^
   drivers/media/platform/renesas/sh_vou.c:1272:6: note: Assuming 'ret' is >= 0
           if (ret < 0)
               ^~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1272:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/media/platform/renesas/sh_vou.c:1276:6: note: Assuming 'ret' is >= 0
           if (ret < 0) {
               ^~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1276:2: note: Taking false branch
           if (ret < 0) {
           ^
   drivers/media/platform/renesas/sh_vou.c:1283:6: note: Assuming field 'bus_fmt' is not equal to SH_VOU_BUS_8BIT
           if (vou_pdata->bus_fmt == SH_VOU_BUS_8BIT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1283:2: note: Taking false branch
           if (vou_pdata->bus_fmt == SH_VOU_BUS_8BIT)
           ^
   drivers/media/platform/renesas/sh_vou.c:1304:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/media/platform/renesas/sh_vou.c:1304:2: note: Taking false branch
           if (ret)
           ^
   drivers/media/platform/renesas/sh_vou.c:1314:6: note: Assuming 'i2c_adap' is non-null
           if (!i2c_adap) {
               ^~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1314:2: note: Taking false branch
           if (!i2c_adap) {
           ^
   drivers/media/platform/renesas/sh_vou.c:1319:8: note: Calling 'sh_vou_hw_init'
           ret = sh_vou_hw_init(vou_dev);
                 ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/renesas/sh_vou.c:1095:9: note: Left side of '&&' is true
           while (--i && (sh_vou_reg_a_read(vou_dev, VOUSRR) & 0x101))
                  ^
   drivers/media/platform/renesas/sh_vou.c:1095:2: note: Loop condition is false. Execution continues on line 1098
           while (--i && (sh_vou_reg_a_read(vou_dev, VOUSRR) & 0x101))
           ^
   drivers/media/platform/renesas/sh_vou.c:1098:7: note: 'i' is 99
           if (!i)
                ^
   drivers/media/platform/renesas/sh_vou.c:1098:2: note: Taking false branch
           if (!i)
           ^
   drivers/media/platform/renesas/sh_vou.c:1101:2: note: Taking false branch
           dev_dbg(vou_dev->v4l2_dev.dev, "Reset took %dus\n", 100 - i);
           ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynamic_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   drivers/media/platform/renesas/sh_vou.c:1101:2: note: Loop condition is false.  Exiting loop

vim +483 drivers/media/platform/renesas/sh_vou.c

a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  416  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  417  static void sh_vou_configure_geometry(struct sh_vou_device *vou_dev,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  418  				      int pix_idx, int w_idx, int h_idx)
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  419  {
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  420  	struct sh_vou_fmt *fmt = vou_fmt + pix_idx;
a622cc51879f70 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2014-01-13  421  	unsigned int black_left, black_top, width_max,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  422  		frame_in_height, frame_out_height, frame_out_top;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  423  	struct v4l2_rect *rect = &vou_dev->rect;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  424  	struct v4l2_pix_format *pix = &vou_dev->pix;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  425  	u32 vouvcr = 0, dsr_h, dsr_v;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  426  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  427  	if (vou_dev->std & V4L2_STD_525_60) {
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  428  		width_max = 858;
a622cc51879f70 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2014-01-13  429  		/* height_max = 262; */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  430  	} else {
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  431  		width_max = 864;
a622cc51879f70 drivers/media/platform/sh_vou.c Mauro Carvalho Chehab 2014-01-13  432  		/* height_max = 312; */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  433  	}
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  434  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  435  	frame_in_height = pix->height / 2;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  436  	frame_out_height = rect->height / 2;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  437  	frame_out_top = rect->top / 2;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  438  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  439  	/*
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  440  	 * Cropping scheme: max useful image is 720x480, and the total video
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  441  	 * area is 858x525 (NTSC) or 864x625 (PAL). AK8813 / 8814 starts
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  442  	 * sampling data beginning with fixed 276th (NTSC) / 288th (PAL) clock,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  443  	 * of which the first 33 / 25 clocks HSYNC must be held active. This
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  444  	 * has to be configured in CR[HW]. 1 pixel equals 2 clock periods.
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  445  	 * This gives CR[HW] = 16 / 12, VPR[HVP] = 138 / 144, which gives
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  446  	 * exactly 858 - 138 = 864 - 144 = 720! We call the out-of-display area,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  447  	 * beyond DSR, specified on the left and top by the VPR register "black
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  448  	 * pixels" and out-of-image area (DPR) "background pixels." We fix VPR
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  449  	 * at 138 / 144 : 20, because that's the HSYNC timing, that our first
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  450  	 * client requires, and that's exactly what leaves us 720 pixels for the
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  451  	 * image; we leave VPR[VVP] at default 20 for now, because the client
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  452  	 * doesn't seem to have any special requirements for it. Otherwise we
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  453  	 * could also set it to max - 240 = 22 / 72. Thus VPR depends only on
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  454  	 * the selected standard, and DPR and DSR are selected according to
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  455  	 * cropping. Q: how does the client detect the first valid line? Does
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  456  	 * HSYNC stay inactive during invalid (black) lines?
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  457  	 */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  458  	black_left = width_max - VOU_MAX_IMAGE_WIDTH;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  459  	black_top = 20;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  460  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  461  	dsr_h = rect->width + rect->left;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  462  	dsr_v = frame_out_height + frame_out_top;
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  463  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  464  	dev_dbg(vou_dev->v4l2_dev.dev,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  465  		"image %ux%u, black %u:%u, offset %u:%u, display %ux%u\n",
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  466  		pix->width, frame_in_height, black_left, black_top,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  467  		rect->left, frame_out_top, dsr_h, dsr_v);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  468  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  469  	/* VOUISR height - half of a frame height in frame mode */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  470  	sh_vou_reg_ab_write(vou_dev, VOUISR, (pix->width << 16) | frame_in_height);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  471  	sh_vou_reg_ab_write(vou_dev, VOUVPR, (black_left << 16) | black_top);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  472  	sh_vou_reg_ab_write(vou_dev, VOUDPR, (rect->left << 16) | frame_out_top);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  473  	sh_vou_reg_ab_write(vou_dev, VOUDSR, (dsr_h << 16) | dsr_v);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  474  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  475  	/*
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  476  	 * if necessary, we could set VOUHIR to
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  477  	 * max(black_left + dsr_h, width_max) here
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  478  	 */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  479  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  480  	if (w_idx)
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  481  		vouvcr |= (1 << 15) | (vou_scale_h_fld[w_idx - 1] << 4);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  482  	if (h_idx)
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17 @483  		vouvcr |= (1 << 14) | vou_scale_v_fld[h_idx - 1];
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  484  
59fe916c84f891 drivers/media/platform/sh_vou.c Hans Verkuil          2019-06-11  485  	dev_dbg(vou_dev->v4l2_dev.dev, "0x%08x: scaling 0x%x\n",
59fe916c84f891 drivers/media/platform/sh_vou.c Hans Verkuil          2019-06-11  486  		fmt->pfmt, vouvcr);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  487  
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  488  	/* To produce a colour bar for testing set bit 23 of VOUVCR */
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  489  	sh_vou_reg_ab_write(vou_dev, VOUVCR, vouvcr);
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  490  	sh_vou_reg_ab_write(vou_dev, VOUDFR,
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  491  			    fmt->pkf | (fmt->yf << 8) | (fmt->rgb << 16));
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  492  }
a81fb9b223508f drivers/media/video/sh_vou.c    Guennadi Liakhovetski 2010-03-17  493  

:::::: The code at line 483 was first introduced by commit
:::::: a81fb9b223508f5773d8d7e226b1574d1b068642 V4L/DVB: V4L: SuperH Video Output Unit (VOU) driver

:::::: TO: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
