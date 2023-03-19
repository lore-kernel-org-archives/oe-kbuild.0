Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0742A52
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 05:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679202723; x=1710738723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6m9y0/ksSshxoyVDaWpI/9Vm/sV1iREQeNEilnYc8vo=;
  b=lPwEVpGrJ77x7abiRJlySwAryaGHW4VrytFptcaOZZfTn4f86T1yOCCo
   CeVi2BEKMe/J95KNrsjRT2NUgd6DZISTZ7Y8mcKAwchCUD4+NoF0JXDR7
   5b9lTeXkcz39bmAx4txM2wJSUJJwXzNRU97F0mO/574OKZUTck20W6otF
   FKfU+iSWBJ3hhDM0R3L8d223BV//L+zJLacG/d+2NbEiXWfZqkLjNxLqr
   k4bChkiLeCHYLiVZc4akx5PEWTMprgcAcffUoS7WjE3mpBVVwi7yjmcD4
   WvL7oT3xnL8KTTVWLT+q1LUDR/rG6tzxcqPp6Iw+gpQuuWIRIC6miKhpU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318136330"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="318136330"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 22:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="683104876"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="683104876"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Mar 2023 22:12:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdlKr-000APO-0x;
	Sun, 19 Mar 2023 05:12:01 +0000
Date: Sun, 19 Mar 2023 13:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sailus-media-tree:master 6/69]
 drivers/media/v4l2-core/v4l2-subdev.c:1712:8: warning: Array access (from
 variable 'remote_pads') results in a null pointer dereference
 [clang-analyzer-core.NullDereference]
Message-ID: <202303191319.o4NOVRhs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/v4l2-core/v4l2-subdev.c:1712:8: warning: Array access (from variable 'remote_pads') results in a null pointer dereference [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   bcec1cd9a7913a41ef09262500cd354486c4a032
commit: cca699f209795312f25251cadecb732b08ac1470 [6/69] media: subdev: Split V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20230312 (https://download.01.org/0day-ci/archive/20230319/202303191319.o4NOVRhs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
        git fetch --no-tags sailus-media-tree master
        git checkout cca699f209795312f25251cadecb732b08ac1470
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303191319.o4NOVRhs-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                                               ^~~~~~~~~~~~~~~~
   drivers/iio/adc/vf610_adc.c:195:28: note: The result of the left shift is undefined due to shifting by '32', which is greater or equal to the width of type 'int'
                   adc_feature->clk_div = 1 << fls(divisor + 1);
                                            ^  ~~~~~~~~~~~~~~~~
   Suppressed 21 warnings (8 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   22 warnings generated.
   Suppressed 22 warnings (9 in non-user code, 13 with check filters).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   29 warnings generated.
   drivers/media/v4l2-core/v4l2-subdev.c:1414:32: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   new_configs.configs[idx].pad = route->sink_pad;
                                                ^
   drivers/media/v4l2-core/v4l2-subdev.c:1520:8: note: Calling 'v4l2_subdev_set_routing'
           ret = v4l2_subdev_set_routing(sd, state, routing);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1463:2: note: Taking false branch
           if (unlikely(check_mul_overflow((size_t)src->num_routes,
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1467:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(state->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:313:15: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:122:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1467:2: note: Left side of '&&' is false
           lockdep_assert_held(state->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:27: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/media/v4l2-core/v4l2-subdev.c:1467:2: note: Taking false branch
           lockdep_assert_held(state->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   include/asm-generic/bug.h:123:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1467:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(state->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1469:6: note: Assuming field 'num_routes' is <= 0
           if (src->num_routes > 0) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1469:2: note: Taking false branch
           if (src->num_routes > 0) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1477:6: note: Calling 'v4l2_subdev_init_stream_configs'
           r = v4l2_subdev_init_stream_configs(&state->stream_configs,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1386:2: note: 'new_configs.configs' initialized to a null pointer value
           struct v4l2_subdev_stream_configs new_configs = { 0 };
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1391:2: note: Loop condition is false. Execution continues on line 1398
           for_each_active_route(routing, route) {
           ^
   include/media/v4l2-subdev.h:1517:2: note: expanded from macro 'for_each_active_route'
           for ((route) = NULL;                  \
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1398:18: note: Field 'num_configs' is 0
           if (new_configs.num_configs) {
                           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1398:2: note: Taking false branch
           if (new_configs.num_configs) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1413:2: note: Loop condition is true.  Entering loop body
           for_each_active_route(routing, route) {
           ^
   include/media/v4l2-subdev.h:1517:2: note: expanded from macro 'for_each_active_route'
           for ((route) = NULL;                  \
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1414:32: note: Dereference of null pointer
                   new_configs.configs[idx].pad = route->sink_pad;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:1712:8: warning: Array access (from variable 'remote_pads') results in a null pointer dereference [clang-analyzer-core.NullDereference]
                           if (remote_pads[route->sink_pad] != U32_MAX &&
                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1675:2: note: 'remote_pads' initialized to a null pointer value
           u32 *remote_pads = NULL;
           ^~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1679:6: note: Assuming the condition is false
           if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1679:2: note: Taking false branch
           if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1689:14: note: Assuming 'i' is < field 'num_routes'
           for (i = 0; i < routing->num_routes; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1689:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < routing->num_routes; ++i) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1693:7: note: Assuming field 'sink_pad' is < field 'num_pads'
                   if (route->sink_pad >= sd->entity.num_pads ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1693:7: note: Left side of '||' is false
   drivers/media/v4l2-core/v4l2-subdev.c:1694:7: note: Assuming the condition is false
                       !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1693:3: note: Taking false branch
                   if (route->sink_pad >= sd->entity.num_pads ||
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1700:7: note: Assuming field 'source_pad' is < field 'num_pads'
                   if (route->source_pad >= sd->entity.num_pads ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1700:7: note: Left side of '||' is false
   drivers/media/v4l2-core/v4l2-subdev.c:1701:7: note: Assuming the condition is false
                       !(sd->entity.pads[route->source_pad].flags & MEDIA_PAD_FL_SOURCE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1700:3: note: Taking false branch
                   if (route->source_pad >= sd->entity.num_pads ||
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1711:7: note: Assuming the condition is true
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1711:3: note: Taking true branch
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1712:8: note: Array access (from variable 'remote_pads') results in a null pointer dereference
                           if (remote_pads[route->sink_pad] != U32_MAX &&
                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1728:8: warning: Array access (from variable 'remote_pads') results in a null pointer dereference [clang-analyzer-core.NullDereference]
                           if (remote_pads[route->source_pad] != U32_MAX &&
                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1675:2: note: 'remote_pads' initialized to a null pointer value
           u32 *remote_pads = NULL;
           ^~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1679:6: note: Assuming the condition is false
           if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1679:2: note: Taking false branch
           if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1689:14: note: Assuming 'i' is < field 'num_routes'
           for (i = 0; i < routing->num_routes; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1689:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < routing->num_routes; ++i) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1693:7: note: Assuming field 'sink_pad' is < field 'num_pads'
                   if (route->sink_pad >= sd->entity.num_pads ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1693:7: note: Left side of '||' is false
   drivers/media/v4l2-core/v4l2-subdev.c:1694:7: note: Assuming the condition is false
                       !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1693:3: note: Taking false branch
                   if (route->sink_pad >= sd->entity.num_pads ||
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1700:7: note: Assuming field 'source_pad' is < field 'num_pads'
                   if (route->source_pad >= sd->entity.num_pads ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1700:7: note: Left side of '||' is false
   drivers/media/v4l2-core/v4l2-subdev.c:1701:7: note: Assuming the condition is false
                       !(sd->entity.pads[route->source_pad].flags & MEDIA_PAD_FL_SOURCE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1700:3: note: Taking false branch
                   if (route->source_pad >= sd->entity.num_pads ||
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1711:7: note: Assuming the condition is false
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1711:3: note: Taking false branch
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1727:7: note: Assuming the condition is true
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1727:3: note: Taking true branch
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1728:8: note: Array access (from variable 'remote_pads') results in a null pointer dereference
                           if (remote_pads[route->source_pad] != U32_MAX &&
                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1783:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]

vim +/remote_pads +1712 drivers/media/v4l2-core/v4l2-subdev.c

c4a73f316d0459 Laurent Pinchart 2022-01-18  1670  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1671  int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1672  				 const struct v4l2_subdev_krouting *routing,
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1673  				 enum v4l2_subdev_routing_restriction disallow)
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1674  {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1675  	u32 *remote_pads = NULL;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1676  	unsigned int i, j;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1677  	int ret = -EINVAL;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1678  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1679  	if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1680  		remote_pads = kcalloc(sd->entity.num_pads, sizeof(*remote_pads),
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1681  				      GFP_KERNEL);
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1682  		if (!remote_pads)
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1683  			return -ENOMEM;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1684  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1685  		for (i = 0; i < sd->entity.num_pads; ++i)
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1686  			remote_pads[i] = U32_MAX;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1687  	}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1688  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1689  	for (i = 0; i < routing->num_routes; ++i) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1690  		const struct v4l2_subdev_route *route = &routing->routes[i];
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1691  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1692  		/* Validate the sink and source pad numbers. */
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1693  		if (route->sink_pad >= sd->entity.num_pads ||
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1694  		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1695  			dev_dbg(sd->dev, "route %u sink (%u) is not a sink pad\n",
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1696  				i, route->sink_pad);
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1697  			goto out;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1698  		}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1699  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1700  		if (route->source_pad >= sd->entity.num_pads ||
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1701  		    !(sd->entity.pads[route->source_pad].flags & MEDIA_PAD_FL_SOURCE)) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1702  			dev_dbg(sd->dev, "route %u source (%u) is not a source pad\n",
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1703  				i, route->source_pad);
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1704  			goto out;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1705  		}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1706  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1707  		/*
cca699f2097953 Tomi Valkeinen   2023-03-02  1708  		 * V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX: all streams from a
cca699f2097953 Tomi Valkeinen   2023-03-02  1709  		 * sink pad must be routed to a single source pad.
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1710  		 */
cca699f2097953 Tomi Valkeinen   2023-03-02  1711  		if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21 @1712  			if (remote_pads[route->sink_pad] != U32_MAX &&
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1713  			    remote_pads[route->sink_pad] != route->source_pad) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1714  				dev_dbg(sd->dev,
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1715  					"route %u attempts to mix %s streams\n",
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1716  					i, "sink");
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1717  				goto out;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1718  			}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1719  
cca699f2097953 Tomi Valkeinen   2023-03-02  1720  			remote_pads[route->sink_pad] = route->source_pad;
cca699f2097953 Tomi Valkeinen   2023-03-02  1721  		}
cca699f2097953 Tomi Valkeinen   2023-03-02  1722  
cca699f2097953 Tomi Valkeinen   2023-03-02  1723  		/*
cca699f2097953 Tomi Valkeinen   2023-03-02  1724  		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX: all streams on a
cca699f2097953 Tomi Valkeinen   2023-03-02  1725  		 * source pad must originate from a single sink pad.
cca699f2097953 Tomi Valkeinen   2023-03-02  1726  		 */
cca699f2097953 Tomi Valkeinen   2023-03-02  1727  		if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1728  			if (remote_pads[route->source_pad] != U32_MAX &&
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1729  			    remote_pads[route->source_pad] != route->sink_pad) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1730  				dev_dbg(sd->dev,
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1731  					"route %u attempts to mix %s streams\n",
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1732  					i, "source");
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1733  				goto out;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1734  			}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1735  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1736  			remote_pads[route->source_pad] = route->sink_pad;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1737  		}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1738  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1739  		for (j = i + 1; j < routing->num_routes; ++j) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1740  			const struct v4l2_subdev_route *r = &routing->routes[j];
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1741  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1742  			/*
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1743  			 * V4L2_SUBDEV_ROUTING_NO_1_TO_N: No two routes can
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1744  			 * originate from the same (sink) stream.
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1745  			 */
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1746  			if ((disallow & V4L2_SUBDEV_ROUTING_NO_1_TO_N) &&
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1747  			    route->sink_pad == r->sink_pad &&
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1748  			    route->sink_stream == r->sink_stream) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1749  				dev_dbg(sd->dev,
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1750  					"routes %u and %u originate from same sink (%u/%u)\n",
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1751  					i, j, route->sink_pad,
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1752  					route->sink_stream);
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1753  				goto out;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1754  			}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1755  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1756  			/*
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1757  			 * V4L2_SUBDEV_ROUTING_NO_N_TO_1: No two routes can end
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1758  			 * at the same (source) stream.
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1759  			 */
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1760  			if ((disallow & V4L2_SUBDEV_ROUTING_NO_N_TO_1) &&
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1761  			    route->source_pad == r->source_pad &&
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1762  			    route->source_stream == r->source_stream) {
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1763  				dev_dbg(sd->dev,
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1764  					"routes %u and %u end at same source (%u/%u)\n",
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1765  					i, j, route->source_pad,
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1766  					route->source_stream);
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1767  				goto out;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1768  			}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1769  		}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1770  	}
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1771  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1772  	ret = 0;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1773  
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1774  out:
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1775  	kfree(remote_pads);
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1776  	return ret;
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1777  }
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1778  EXPORT_SYMBOL_GPL(v4l2_subdev_routing_validate);
69c0fe7ae78b9e Laurent Pinchart 2021-12-21  1779  

:::::: The code at line 1712 was first introduced by commit
:::::: 69c0fe7ae78b9ed696b5a5d8eaae7ca622c6f7ca media: subdev: add v4l2_subdev_routing_validate() helper

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
