Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649ED15B4
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Feb 2023 02:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675563787; x=1707099787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=REOCyRYuytgCK/vsTEuCB0A76nmE23vIyTxGoNO3gtk=;
  b=L7c49S0yglwyyelvSq858rtjDcgWlKdQHIJ+ddzjDb1eF9nc7yDfFZrQ
   QSTCBwxn2fbuNXf+6e5Ipp6qEu685cxtHzNKN1b7y4gNy6BrmkNbJ4zwc
   QBp65ocbgBaBYudNdOhNZdio23zRewdY8QM+td/rznY12SfSvz6d8EqAA
   or/9aeS0dyfp0lvDfTR7P9QIjSl3V+mn0oRPixFNz8a3uKj3TlIc4sMrq
   96bzph87usCv8mBkSEAqFY2EFHEYPO8CNSeI+2Ab3AKaPisyS8lzrd+QF
   Aqoq3T8yLTlaZ8XbPI6gyLLDcFSBXE5iz7mPPfqkmtmNw455kJCaJc3yE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="331145499"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="331145499"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 18:23:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="659500702"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="659500702"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Feb 2023 18:23:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOUgK-0001fg-28;
	Sun, 05 Feb 2023 02:23:04 +0000
Date: Sun, 5 Feb 2023 10:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] media: subdev: Split V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
Message-ID: <202302051017.fOgn4jTT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/v4l2-core/v4l2-subdev.c:1686:8: warning: Array access (from variable 'remote_pads') results in a null pointer dereference [clang-analyzer-core.NullDereference]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230127101822.191933-1-tomi.valkeinen@ideasonboard.com>
References: <20230127101822.191933-1-tomi.valkeinen@ideasonboard.com>
TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: linux-media@vger.kernel.org
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi Tomi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on sailus-media-tree/streams]
[also build test WARNING on next-20230203]
[cannot apply to media-tree/master linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/media-subdev-Split-V4L2_SUBDEV_ROUTING_NO_STREAM_MIX/20230128-104025
base:   git://linuxtv.org/sailus/media_tree.git streams
patch link:    https://lore.kernel.org/r/20230127101822.191933-1-tomi.valkeinen%40ideasonboard.com
patch subject: [PATCH] media: subdev: Split V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: s390-randconfig-c005-20230123 (https://download.01.org/0day-ci/archive/20230205/202302051017.fOgn4jTT-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/bbce192e1e337f196fece3418a23dedc4cee93af
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Tomi-Valkeinen/media-subdev-Split-V4L2_SUBDEV_ROUTING_NO_STREAM_MIX/20230128-104025
        git checkout bbce192e1e337f196fece3418a23dedc4cee93af
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

clang_analyzer warnings: (new ones prefixed by >>)
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   30 warnings generated.
   drivers/media/v4l2-core/v4l2-subdev.c:1387:32: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
                   new_configs.configs[idx].pad = route->sink_pad;
                                                ^
   drivers/media/v4l2-core/v4l2-subdev.c:1493:8: note: Calling 'v4l2_subdev_set_routing'
           ret = v4l2_subdev_set_routing(sd, state, routing);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1436:2: note: Taking false branch
           if (unlikely(check_mul_overflow((size_t)src->num_routes,
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1440:2: note: Assuming 'debug_locks' is 0
           lockdep_assert_held(state->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:313:15: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(x);                      \
                                  ^
   drivers/media/v4l2-core/v4l2-subdev.c:1440:2: note: Left side of '&&' is false
           lockdep_assert_held(state->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:27: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/media/v4l2-core/v4l2-subdev.c:1440:2: note: Taking false branch
           lockdep_assert_held(state->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:55:2: note: expanded from macro 'WARN_ON'
           if (__builtin_constant_p(__ret_warn_on)) {      \
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1440:2: note: Taking false branch
           lockdep_assert_held(state->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^
   arch/s390/include/asm/bug.h:59:3: note: expanded from macro 'WARN_ON'
                   if (unlikely(__ret_warn_on))            \
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1440:2: note: Loop condition is false.  Exiting loop
           lockdep_assert_held(state->lock);
           ^
   include/linux/lockdep.h:319:2: note: expanded from macro 'lockdep_assert_held'
           lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:313:2: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1442:6: note: Assuming field 'num_routes' is <= 0
           if (src->num_routes > 0) {
               ^~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1442:2: note: Taking false branch
           if (src->num_routes > 0) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1450:6: note: Calling 'v4l2_subdev_init_stream_configs'
           r = v4l2_subdev_init_stream_configs(&state->stream_configs,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1359:2: note: 'new_configs.configs' initialized to a null pointer value
           struct v4l2_subdev_stream_configs new_configs = { 0 };
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1364:2: note: Loop condition is false. Execution continues on line 1371
           for_each_active_route(routing, route) {
           ^
   include/media/v4l2-subdev.h:1513:2: note: expanded from macro 'for_each_active_route'
           for ((route) = NULL;                  \
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1371:18: note: Field 'num_configs' is 0
           if (new_configs.num_configs) {
                           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1371:2: note: Taking false branch
           if (new_configs.num_configs) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1386:2: note: Loop condition is true.  Entering loop body
           for_each_active_route(routing, route) {
           ^
   include/media/v4l2-subdev.h:1513:2: note: expanded from macro 'for_each_active_route'
           for ((route) = NULL;                  \
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1387:32: note: Dereference of null pointer
                   new_configs.configs[idx].pad = route->sink_pad;
                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:1686:8: warning: Array access (from variable 'remote_pads') results in a null pointer dereference [clang-analyzer-core.NullDereference]
                           if (remote_pads[route->sink_pad] != U32_MAX &&
                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1648:2: note: 'remote_pads' initialized to a null pointer value
           u32 *remote_pads = NULL;
           ^~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1652:6: note: Assuming the condition is false
           if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1652:2: note: Taking false branch
           if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1662:14: note: Assuming 'i' is < field 'num_routes'
           for (i = 0; i < routing->num_routes; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1662:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < routing->num_routes; ++i) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1666:7: note: Assuming field 'sink_pad' is < field 'num_pads'
                   if (route->sink_pad >= sd->entity.num_pads ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1666:7: note: Left side of '||' is false
   drivers/media/v4l2-core/v4l2-subdev.c:1667:7: note: Assuming the condition is false
                       !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1666:3: note: Taking false branch
                   if (route->sink_pad >= sd->entity.num_pads ||
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1673:7: note: Assuming field 'source_pad' is < field 'num_pads'
                   if (route->source_pad >= sd->entity.num_pads ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1673:7: note: Left side of '||' is false
   drivers/media/v4l2-core/v4l2-subdev.c:1674:7: note: Assuming the condition is false
                       !(sd->entity.pads[route->source_pad].flags & MEDIA_PAD_FL_SOURCE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1673:3: note: Taking false branch
                   if (route->source_pad >= sd->entity.num_pads ||
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1685:7: note: Assuming the condition is true
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1685:3: note: Taking true branch
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1686:8: note: Array access (from variable 'remote_pads') results in a null pointer dereference
                           if (remote_pads[route->sink_pad] != U32_MAX &&
                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1703:8: warning: Array access (from variable 'remote_pads') results in a null pointer dereference [clang-analyzer-core.NullDereference]
                           if (remote_pads[route->source_pad] != U32_MAX &&
                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1648:2: note: 'remote_pads' initialized to a null pointer value
           u32 *remote_pads = NULL;
           ^~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1652:6: note: Assuming the condition is false
           if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1652:2: note: Taking false branch
           if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1662:14: note: Assuming 'i' is < field 'num_routes'
           for (i = 0; i < routing->num_routes; ++i) {
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1662:2: note: Loop condition is true.  Entering loop body
           for (i = 0; i < routing->num_routes; ++i) {
           ^
   drivers/media/v4l2-core/v4l2-subdev.c:1666:7: note: Assuming field 'sink_pad' is < field 'num_pads'
                   if (route->sink_pad >= sd->entity.num_pads ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1666:7: note: Left side of '||' is false
   drivers/media/v4l2-core/v4l2-subdev.c:1667:7: note: Assuming the condition is false
                       !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1666:3: note: Taking false branch
                   if (route->sink_pad >= sd->entity.num_pads ||
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1673:7: note: Assuming field 'source_pad' is < field 'num_pads'
                   if (route->source_pad >= sd->entity.num_pads ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1673:7: note: Left side of '||' is false
   drivers/media/v4l2-core/v4l2-subdev.c:1674:7: note: Assuming the condition is false
                       !(sd->entity.pads[route->source_pad].flags & MEDIA_PAD_FL_SOURCE)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1673:3: note: Taking false branch
                   if (route->source_pad >= sd->entity.num_pads ||
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1685:7: note: Assuming the condition is false
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1685:3: note: Taking false branch
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1702:7: note: Assuming the condition is true
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1702:3: note: Taking true branch
                   if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
                   ^
   drivers/media/v4l2-core/v4l2-subdev.c:1703:8: note: Array access (from variable 'remote_pads') results in a null pointer dereference
                           if (remote_pads[route->source_pad] != U32_MAX &&
                               ^~~~~~~~~~~
   drivers/media/v4l2-core/v4l2-subdev.c:1758:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]

vim +/remote_pads +1686 drivers/media/v4l2-core/v4l2-subdev.c

345bb14eff7276 Laurent Pinchart 2022-01-18  1643  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1644  int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
f32cde035f2d92 Laurent Pinchart 2021-12-21  1645  				 const struct v4l2_subdev_krouting *routing,
f32cde035f2d92 Laurent Pinchart 2021-12-21  1646  				 enum v4l2_subdev_routing_restriction disallow)
f32cde035f2d92 Laurent Pinchart 2021-12-21  1647  {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1648  	u32 *remote_pads = NULL;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1649  	unsigned int i, j;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1650  	int ret = -EINVAL;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1651  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1652  	if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1653  		remote_pads = kcalloc(sd->entity.num_pads, sizeof(*remote_pads),
f32cde035f2d92 Laurent Pinchart 2021-12-21  1654  				      GFP_KERNEL);
f32cde035f2d92 Laurent Pinchart 2021-12-21  1655  		if (!remote_pads)
f32cde035f2d92 Laurent Pinchart 2021-12-21  1656  			return -ENOMEM;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1657  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1658  		for (i = 0; i < sd->entity.num_pads; ++i)
f32cde035f2d92 Laurent Pinchart 2021-12-21  1659  			remote_pads[i] = U32_MAX;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1660  	}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1661  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1662  	for (i = 0; i < routing->num_routes; ++i) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1663  		const struct v4l2_subdev_route *route = &routing->routes[i];
f32cde035f2d92 Laurent Pinchart 2021-12-21  1664  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1665  		/* Validate the sink and source pad numbers. */
f32cde035f2d92 Laurent Pinchart 2021-12-21  1666  		if (route->sink_pad >= sd->entity.num_pads ||
f32cde035f2d92 Laurent Pinchart 2021-12-21  1667  		    !(sd->entity.pads[route->sink_pad].flags & MEDIA_PAD_FL_SINK)) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1668  			dev_dbg(sd->dev, "route %u sink (%u) is not a sink pad\n",
f32cde035f2d92 Laurent Pinchart 2021-12-21  1669  				i, route->sink_pad);
f32cde035f2d92 Laurent Pinchart 2021-12-21  1670  			goto out;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1671  		}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1672  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1673  		if (route->source_pad >= sd->entity.num_pads ||
f32cde035f2d92 Laurent Pinchart 2021-12-21  1674  		    !(sd->entity.pads[route->source_pad].flags & MEDIA_PAD_FL_SOURCE)) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1675  			dev_dbg(sd->dev, "route %u source (%u) is not a source pad\n",
f32cde035f2d92 Laurent Pinchart 2021-12-21  1676  				i, route->source_pad);
f32cde035f2d92 Laurent Pinchart 2021-12-21  1677  			goto out;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1678  		}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1679  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1680  		/*
bbce192e1e337f Tomi Valkeinen   2023-01-27  1681  		 * V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX: Streams on the same
bbce192e1e337f Tomi Valkeinen   2023-01-27  1682  		 * sink pad may not be routed to streams on different source
bbce192e1e337f Tomi Valkeinen   2023-01-27  1683  		 * pads.
f32cde035f2d92 Laurent Pinchart 2021-12-21  1684  		 */
bbce192e1e337f Tomi Valkeinen   2023-01-27  1685  		if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
f32cde035f2d92 Laurent Pinchart 2021-12-21 @1686  			if (remote_pads[route->sink_pad] != U32_MAX &&
f32cde035f2d92 Laurent Pinchart 2021-12-21  1687  			    remote_pads[route->sink_pad] != route->source_pad) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1688  				dev_dbg(sd->dev,
f32cde035f2d92 Laurent Pinchart 2021-12-21  1689  					"route %u attempts to mix %s streams\n",
f32cde035f2d92 Laurent Pinchart 2021-12-21  1690  					i, "sink");
f32cde035f2d92 Laurent Pinchart 2021-12-21  1691  				goto out;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1692  			}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1693  
bbce192e1e337f Tomi Valkeinen   2023-01-27  1694  			remote_pads[route->sink_pad] = route->source_pad;
bbce192e1e337f Tomi Valkeinen   2023-01-27  1695  		}
bbce192e1e337f Tomi Valkeinen   2023-01-27  1696  
bbce192e1e337f Tomi Valkeinen   2023-01-27  1697  		/*
bbce192e1e337f Tomi Valkeinen   2023-01-27  1698  		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX: Streams on the same
bbce192e1e337f Tomi Valkeinen   2023-01-27  1699  		 * source pad may not be routed to streams on different sink
bbce192e1e337f Tomi Valkeinen   2023-01-27  1700  		 * pads.
bbce192e1e337f Tomi Valkeinen   2023-01-27  1701  		 */
bbce192e1e337f Tomi Valkeinen   2023-01-27  1702  		if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1703  			if (remote_pads[route->source_pad] != U32_MAX &&
f32cde035f2d92 Laurent Pinchart 2021-12-21  1704  			    remote_pads[route->source_pad] != route->sink_pad) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1705  				dev_dbg(sd->dev,
f32cde035f2d92 Laurent Pinchart 2021-12-21  1706  					"route %u attempts to mix %s streams\n",
f32cde035f2d92 Laurent Pinchart 2021-12-21  1707  					i, "source");
f32cde035f2d92 Laurent Pinchart 2021-12-21  1708  				goto out;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1709  			}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1710  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1711  			remote_pads[route->source_pad] = route->sink_pad;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1712  		}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1713  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1714  		for (j = i + 1; j < routing->num_routes; ++j) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1715  			const struct v4l2_subdev_route *r = &routing->routes[j];
f32cde035f2d92 Laurent Pinchart 2021-12-21  1716  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1717  			/*
f32cde035f2d92 Laurent Pinchart 2021-12-21  1718  			 * V4L2_SUBDEV_ROUTING_NO_1_TO_N: No two routes can
f32cde035f2d92 Laurent Pinchart 2021-12-21  1719  			 * originate from the same (sink) stream.
f32cde035f2d92 Laurent Pinchart 2021-12-21  1720  			 */
f32cde035f2d92 Laurent Pinchart 2021-12-21  1721  			if ((disallow & V4L2_SUBDEV_ROUTING_NO_1_TO_N) &&
f32cde035f2d92 Laurent Pinchart 2021-12-21  1722  			    route->sink_pad == r->sink_pad &&
f32cde035f2d92 Laurent Pinchart 2021-12-21  1723  			    route->sink_stream == r->sink_stream) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1724  				dev_dbg(sd->dev,
f32cde035f2d92 Laurent Pinchart 2021-12-21  1725  					"routes %u and %u originate from same sink (%u/%u)\n",
f32cde035f2d92 Laurent Pinchart 2021-12-21  1726  					i, j, route->sink_pad,
f32cde035f2d92 Laurent Pinchart 2021-12-21  1727  					route->sink_stream);
f32cde035f2d92 Laurent Pinchart 2021-12-21  1728  				goto out;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1729  			}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1730  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1731  			/*
f32cde035f2d92 Laurent Pinchart 2021-12-21  1732  			 * V4L2_SUBDEV_ROUTING_NO_N_TO_1: No two routes can end
f32cde035f2d92 Laurent Pinchart 2021-12-21  1733  			 * at the same (source) stream.
f32cde035f2d92 Laurent Pinchart 2021-12-21  1734  			 */
f32cde035f2d92 Laurent Pinchart 2021-12-21  1735  			if ((disallow & V4L2_SUBDEV_ROUTING_NO_N_TO_1) &&
f32cde035f2d92 Laurent Pinchart 2021-12-21  1736  			    route->source_pad == r->source_pad &&
f32cde035f2d92 Laurent Pinchart 2021-12-21  1737  			    route->source_stream == r->source_stream) {
f32cde035f2d92 Laurent Pinchart 2021-12-21  1738  				dev_dbg(sd->dev,
f32cde035f2d92 Laurent Pinchart 2021-12-21  1739  					"routes %u and %u end at same source (%u/%u)\n",
f32cde035f2d92 Laurent Pinchart 2021-12-21  1740  					i, j, route->source_pad,
f32cde035f2d92 Laurent Pinchart 2021-12-21  1741  					route->source_stream);
f32cde035f2d92 Laurent Pinchart 2021-12-21  1742  				goto out;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1743  			}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1744  		}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1745  	}
f32cde035f2d92 Laurent Pinchart 2021-12-21  1746  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1747  	ret = 0;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1748  
f32cde035f2d92 Laurent Pinchart 2021-12-21  1749  out:
f32cde035f2d92 Laurent Pinchart 2021-12-21  1750  	kfree(remote_pads);
f32cde035f2d92 Laurent Pinchart 2021-12-21  1751  	return ret;
f32cde035f2d92 Laurent Pinchart 2021-12-21  1752  }
f32cde035f2d92 Laurent Pinchart 2021-12-21  1753  EXPORT_SYMBOL_GPL(v4l2_subdev_routing_validate);
f32cde035f2d92 Laurent Pinchart 2021-12-21  1754  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
