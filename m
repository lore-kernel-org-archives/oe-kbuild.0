Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8630A8C11
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Mar 2023 16:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677775828; x=1709311828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORgbL4aGvlYhgoycE2nKr7deQ8xzUm6VryCkSh3F4ek=;
  b=lvAb+uKFK1WXta2Pu6qXSnCTQPMRetPjlkpnXpgcdei4LwhtFpzAZfYV
   6w0/cJ8GON0bAiOIpbW54oVdowoRc3VsLT9VJnU9SsK3ujPgYWKsT+9ZK
   DczTxpJvG6ZOxmJx5j8DpwA0RBq6MNyisZ2vJI4tdvYdK+yWaQtCQVsFx
   Iyapw8M3DHOKNKcRLM5Ql7BpRK+S0EnU2WR+AxYzWV8tXtTJ4NDDsFhpa
   nyPZXBNUSpSVMtm5nuuSKY99Hdg+lWw2aHC/P/GJAWO8gBqv3UVWY6s8g
   3og1ZGSFqE8UGpPsLxvojyUVzAwAA/yKd/2OusNtuQwVzd7hSiqRDstCq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="323071009"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="323071009"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 08:50:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="818112414"
X-IronPort-AV: E=Sophos;i="5.98,228,1673942400"; 
   d="scan'208";a="818112414"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2023 08:50:23 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXm8M-0000gQ-1P;
	Thu, 02 Mar 2023 16:50:22 +0000
Date: Fri, 3 Mar 2023 00:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/platform/renesas/sh_vou.c:483:23: warning: The right
 operand of '|' is a garbage value due to array index out of bounds
 [clang-analyzer-core.UndefinedBinaryOperatorResult]
Message-ID: <202303030007.lkjLclAD-lkp@intel.com>
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
head:   ee3f96b164688dae21e2466a57f2e806b64e8a37
commit: ee4a77a32b39064fdab0aa2b36bbd35ebf57e077 media: platform: place Renesas drivers on a separate dir
date:   12 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20230226 (https://download.01.org/0day-ci/archive/20230303/202303030007.lkjLclAD-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/r/202303030007.lkjLclAD-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                     ^
   drivers/block/rbd.c:6443:2: note: Taking false branch
           if (!pctx.spec)
           ^
   drivers/block/rbd.c:6447:18: note: Field 'pool_name' is non-null
           if (!pctx.spec->pool_name)
                           ^
   drivers/block/rbd.c:6447:2: note: Taking false branch
           if (!pctx.spec->pool_name)
           ^
   drivers/block/rbd.c:6449:6: note: Assuming the condition is false
           if (!*pctx.spec->pool_name) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/block/rbd.c:6449:2: note: Taking false branch
           if (!*pctx.spec->pool_name) {
           ^
   drivers/block/rbd.c:6455:18: note: Field 'image_name' is non-null
           if (!pctx.spec->image_name)
                           ^
   drivers/block/rbd.c:6455:2: note: Taking false branch
           if (!pctx.spec->image_name)
           ^
   drivers/block/rbd.c:6457:6: note: Assuming the condition is false
           if (!*pctx.spec->image_name) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/rbd.c:6457:2: note: Taking false branch
           if (!*pctx.spec->image_name) {
           ^
   drivers/block/rbd.c:6467:6: note: Assuming 'len' is not equal to 0
           if (!len) {
               ^~~~
   drivers/block/rbd.c:6467:2: note: Taking false branch
           if (!len) {
           ^
   drivers/block/rbd.c:6470:13: note: Assuming the condition is false
           } else if (len > RBD_MAX_SNAP_NAME_LEN) {
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/rbd.c:6470:9: note: Taking false branch
           } else if (len > RBD_MAX_SNAP_NAME_LEN) {
                  ^
   drivers/block/rbd.c:6475:6: note: Assuming 'snap_name' is non-null
           if (!snap_name)
               ^~~~~~~~~~
   drivers/block/rbd.c:6475:2: note: Taking false branch
           if (!snap_name)
           ^
   drivers/block/rbd.c:6481:6: note: Assuming field 'copts' is non-null
           if (!pctx.copts)
               ^~~~~~~~~~~
   drivers/block/rbd.c:6481:2: note: Taking false branch
           if (!pctx.copts)
           ^
   drivers/block/rbd.c:6487:6: note: Assuming field 'opts' is non-null
           if (!pctx.opts)
               ^~~~~~~~~~
   drivers/block/rbd.c:6487:2: note: Taking false branch
           if (!pctx.opts)
           ^
   drivers/block/rbd.c:6500:6: note: Assuming 'ret' is not equal to 0
           if (ret)
               ^~~
   drivers/block/rbd.c:6500:2: note: Taking true branch
           if (ret)
           ^
   drivers/block/rbd.c:6501:3: note: Control jumps to line 6516
                   goto out_err;
                   ^
   drivers/block/rbd.c:6520:2: note: Returning without writing to '*rbd_spec'
           return ret;
           ^
   drivers/block/rbd.c:6993:7: note: Returning from 'rbd_add_parse_args'
           rc = rbd_add_parse_args(buf, &ceph_opts, &rbd_opts, &spec);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/rbd.c:6994:6: note: Assuming 'rc' is >= 0
           if (rc < 0)
               ^~~~~~
   drivers/block/rbd.c:6994:2: note: Taking false branch
           if (rc < 0)
           ^
   drivers/block/rbd.c:6998:2: note: Taking false branch
           if (IS_ERR(rbdc)) {
           ^
   drivers/block/rbd.c:7004:57: note: Access to field 'pool_name' results in a dereference of a null pointer (loaded from variable 'spec')
           rc = ceph_pg_poolid_by_name(rbdc->client->osdc.osdmap, spec->pool_name);
                                                                  ^~~~
   6 warnings generated.
   Suppressed 6 warnings (6 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   6 warnings generated.
   Suppressed 6 warnings (6 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
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
