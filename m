Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73182CA2
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677584012; x=1709120012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6wh645E+tJ/RgB2yg26TWcFQATbzJldXaEJvOcolNss=;
  b=MO0dJ3untACPYUn+9Oqvb+sPj7QZPSNbmBMVJUyVaGMQamXIjELJUttX
   Rb8bScvS03SSej3MLojY8s7WjPEOf+CKYyW7X1wu7pHwdYk08IWpVerJZ
   VFiDA9rvkUu5JsNxrce84LoPmGQgOlDKGZkDmzPut0fRFmecEPbseDVt+
   djIUTMLLXq2WoV10t4wvXsZfKvbrPg6KiqblJPKzSLtjrhdyYkOp9RxSv
   V6/iArZdDsGN+pjyFURG3ZvmkvEzysOxdvl0XbkojfXYlqsrTDn2XcTgC
   +HPT5o+tCkdXq/PhQIAmLU+mOsVVFoUnNth2+IUcv6Qc+KaATXd/u4Tsa
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332839204"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="332839204"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 03:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1003208660"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="1003208660"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2023 03:33:30 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWyEc-0005M7-0f;
	Tue, 28 Feb 2023 11:33:30 +0000
Date: Tue, 28 Feb 2023 19:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/platform/renesas/sh_vou.c:483:23: warning: The right
 operand of '|' is a garbage value due to array index out of bounds
 [clang-analyzer-core.UndefinedBinaryOperatorResult]
Message-ID: <202302281909.7Sj0ul1t-lkp@intel.com>
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
head:   ae3419fbac845b4d3f3a9fae4cc80c68d82cdf6e
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Renesas drivers on a separate dir
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20230226 (https://download.01.org/0day-ci/archive/20230228/202302281909.7Sj0ul1t-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202302281909.7Sj0ul1t-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
           for (i = 0; i < ocelot->num_flooding_pgids; i++)
           ^
   drivers/net/ethernet/mscc/ocelot.c:2751:17: note: Assuming 'port' is >= field 'num_phys_ports'
           for (port = 0; port < ocelot->num_phys_ports; port++) {
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mscc/ocelot.c:2751:2: note: Loop condition is false. Execution continues on line 2763
           for (port = 0; port < ocelot->num_phys_ports; port++) {
           ^
   drivers/net/ethernet/mscc/ocelot.c:2763:2: note: Loop condition is true.  Entering loop body
           for_each_nonreserved_multicast_dest_pgid(ocelot, i) {
           ^
   include/soc/mscc/ocelot.h:77:2: note: expanded from macro 'for_each_nonreserved_multicast_dest_pgid'
           for ((pgid) = (ocelot)->num_phys_ports + 1;             \
           ^
   drivers/net/ethernet/mscc/ocelot.c:2764:32: note: The result of the right shift is undefined due to shifting by '32', which is greater or equal to the width of type 'unsigned long'
                   u32 val = ANA_PGID_PGID_PGID(GENMASK(ocelot->num_phys_ports - 1, 0));
                                                ^
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^
   include/soc/mscc/ocelot_ana.h:99:61: note: expanded from macro 'ANA_PGID_PGID_PGID'
   #define ANA_PGID_PGID_PGID(x)                             ((x) & GENMASK(11, 0))
                                                               ^
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   drivers/phy/socionext/phy-uniphier-ahci.c:266:2: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val |= FIELD_PREP(TXCTRL1_DEEMPH_G1_MASK, 0x05);
           ^
   drivers/phy/socionext/phy-uniphier-ahci.c:266:2: note: Value stored to 'val' is never read
   drivers/phy/socionext/phy-uniphier-ahci.c:274:2: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
           val |= FIELD_PREP(RXCTRL_RX_EQ_MASK, 0x1);
           ^
   drivers/phy/socionext/phy-uniphier-ahci.c:274:2: note: Value stored to 'val' is never read
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   net/netfilter/nf_log.c:318:14: warning: Value stored to 'net' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct net *net = seq_file_net(seq);
                       ^~~   ~~~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:318:14: note: Value stored to 'net' during its initialization is never read
           struct net *net = seq_file_net(seq);
                       ^~~   ~~~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:330:14: warning: Value stored to 'net' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct net *net = seq_file_net(s);
                       ^~~   ~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:330:14: note: Value stored to 'net' during its initialization is never read
           struct net *net = seq_file_net(s);
                       ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   6 warnings generated.
   Suppressed 6 warnings (6 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/media/platform/s5p-jpeg/jpeg-core.c:1141:3: warning: Value stored to 'length' is never read [clang-analyzer-deadcode.DeadStores]
                   length = 0;
                   ^        ~
   drivers/media/platform/s5p-jpeg/jpeg-core.c:1141:3: note: Value stored to 'length' is never read
                   length = 0;
                   ^        ~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   6 warnings generated.
   net/rds/send.c:1246:2: warning: Value stored to 'total_payload_len' is never read [clang-analyzer-deadcode.DeadStores]
           total_payload_len += rdma_payload_len;
           ^                    ~~~~~~~~~~~~~~~~
   net/rds/send.c:1246:2: note: Value stored to 'total_payload_len' is never read
           total_payload_len += rdma_payload_len;
           ^                    ~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 with check filters).
   4 warnings generated.
   Suppressed 4 warnings (4 with check filters).
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
