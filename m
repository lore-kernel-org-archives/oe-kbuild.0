Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C287B290F
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Mar 2023 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678180740; x=1709716740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJ8h/ZsUuEA4V+Rc00MpwyjAxDpeGPjK+SwjNPep3zo=;
  b=dvgWJjFq/vK/Vz63BqD6ETnhKzIgLX63gV4fTvcLUQdTWy4BLlRayXCD
   gOjchdYUe8EubcIOzq+QtUkE8xEXzlQz9TmekzdlRkcfp0JufE78e+kte
   uOsZnDzs/ZW6WUE7dtujNhDcmw20jsZooO5Xw9AUbPLWpSZqu+HSp53o5
   uu34gd99Yi0vASwhUQJxPlp/yI21NOPM7r04gfczgI+X9rUqCjzPFV9Yw
   lZlJsvBgkRfRncH+NkevtfG05qznq7f/OiSpGjR81MW2SQJVBjsfkdSmJ
   nl+OROx9gWYq83+nB6VyX/HrLgI00oSrNoZZkr+1q8mtztaj3ehjp0HS6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337323951"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="337323951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 01:19:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653920720"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; 
   d="scan'208";a="653920720"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Mar 2023 01:18:58 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZTTG-0001A9-0D;
	Tue, 07 Mar 2023 09:18:58 +0000
Date: Tue, 7 Mar 2023 17:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/can/dev/calc_bittiming.c:172:33: warning: Division by
 zero [clang-analyzer-core.DivideZero]
Message-ID: <202303071716.Nzlugdck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/can/dev/calc_bittiming.c:172:33: warning: Division by zero [clang-analyzer-core.DivideZero]"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ca09d5fa3549d142c2080a72a4c70ce389163cd
commit: 816cd1688331e0ffa1927889c15e7ed56650a183 Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
date:   8 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20230307/202303071716.Nzlugdck-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=816cd1688331e0ffa1927889c15e7ed56650a183
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 816cd1688331e0ffa1927889c15e7ed56650a183
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=i386 clang-analyzer 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303071716.Nzlugdck-lkp@intel.com/

clang_analyzer warnings: (new ones prefixed by >>)
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   fs/ntfs3/frecord.c:1268:6: note: 'err' is >= 0
           if (err < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^~~~
   fs/ntfs3/frecord.c:1268:2: note: '?' condition is false
           if (err < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   fs/ntfs3/frecord.c:1268:2: note: Taking false branch
           if (err < 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs3/frecord.c:1274:6: note: Assuming the condition is false
           if (plen < evcn + 1 - svcn) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   fs/ntfs3/frecord.c:1274:2: note: '?' condition is false
           if (plen < evcn + 1 - svcn) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   fs/ntfs3/frecord.c:1274:2: note: '?' condition is false
           if (plen < evcn + 1 - svcn) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   fs/ntfs3/frecord.c:1274:2: note: Taking false branch
           if (plen < evcn + 1 - svcn) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ntfs3/frecord.c:1283:29: note: Passing null pointer value via 2nd parameter 'mi'
           attr = ni_ins_new_attr(ni, mi_min, NULL, ATTR_DATA, NULL, 0,
                                      ^~~~~~
   fs/ntfs3/frecord.c:1283:9: note: Calling 'ni_ins_new_attr'
           attr = ni_ins_new_attr(ni, mi_min, NULL, ATTR_DATA, NULL, 0,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/frecord.c:464:13: note: Passing null pointer value via 1st parameter 'mi'
           mi_get_ref(mi, &ref);
                      ^~
   fs/ntfs3/frecord.c:464:2: note: Calling 'mi_get_ref'
           mi_get_ref(mi, &ref);
           ^~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/ntfs_fs.h:768:13: note: Access to field 'rno' results in a dereference of a null pointer (loaded from variable 'mi')
           ref->low = cpu_to_le32(mi->rno);
                      ^
   include/linux/byteorder/generic.h:88:21: note: expanded from macro 'cpu_to_le32'
   #define cpu_to_le32 __cpu_to_le32
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from macro '__cpu_to_le32'
   #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
                                                    ^~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   62 warnings generated.
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   68 warnings generated.
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
   69 warnings generated.
>> drivers/net/can/dev/calc_bittiming.c:172:33: warning: Division by zero [clang-analyzer-core.DivideZero]
           bt->bitrate = priv->clock.freq /
                         ~~~~~~~~~~~~~~~~~^
   drivers/net/can/dev/calc_bittiming.c:76:2: note: 'best_brp' initialized to 0
           unsigned int best_brp = 0;              /* current best value for brp */
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/calc_bittiming.c:81:2: note: Assuming field 'sample_point' is 0
           if (bt->sample_point) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/net/can/dev/calc_bittiming.c:81:2: note: '?' condition is false
           if (bt->sample_point) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/net/can/dev/calc_bittiming.c:81:10: note: Field 'sample_point' is 0
           if (bt->sample_point) {
                   ^
   drivers/net/can/dev/calc_bittiming.c:81:2: note: '?' condition is false
           if (bt->sample_point) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   drivers/net/can/dev/calc_bittiming.c:81:2: note: Taking false branch
           if (bt->sample_point) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/can/dev/calc_bittiming.c:84:7: note: Assuming the condition is true
                   if (bt->bitrate > 800 * KILO /* BPS */)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/net/can/dev/calc_bittiming.c:84:3: note: '?' condition is false
                   if (bt->bitrate > 800 * KILO /* BPS */)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                 ^
   drivers/net/can/dev/calc_bittiming.c:84:3: note: '?' condition is true
                   if (bt->bitrate > 800 * KILO /* BPS */)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
           ^
   drivers/net/can/dev/calc_bittiming.c:84:3: note: Taking true branch
                   if (bt->bitrate > 800 * KILO /* BPS */)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/net/can/dev/calc_bittiming.c:94:7: note: Assuming the condition is true
                tseg >= (btc->tseg1_min + btc->tseg2_min) * 2; tseg--) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/dev/calc_bittiming.c:93:2: note: Loop condition is true.  Entering loop body
           for (tseg = (btc->tseg1_max + btc->tseg2_max) * 2 + 1;
           ^
   drivers/net/can/dev/calc_bittiming.c:102:7: note: Assuming 'brp' is < field 'brp_min'
                   if (brp < btc->brp_min || brp > btc->brp_max)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   drivers/net/can/dev/calc_bittiming.c:102:26: note: Left side of '||' is true
                   if (brp < btc->brp_min || brp > btc->brp_max)
                                          ^
   drivers/net/can/dev/calc_bittiming.c:102:3: note: '?' condition is false
                   if (brp < btc->brp_min || brp > btc->brp_max)

vim +172 drivers/net/can/dev/calc_bittiming.c

0c7e115138830a Vincent Mailhol 2022-06-10   64  
0c7e115138830a Vincent Mailhol 2022-06-10   65  int can_calc_bittiming(const struct net_device *dev, struct can_bittiming *bt,
0c7e115138830a Vincent Mailhol 2022-06-10   66  		       const struct can_bittiming_const *btc)
0c7e115138830a Vincent Mailhol 2022-06-10   67  {
0c7e115138830a Vincent Mailhol 2022-06-10   68  	struct can_priv *priv = netdev_priv(dev);
0c7e115138830a Vincent Mailhol 2022-06-10   69  	unsigned int bitrate;			/* current bitrate */
0c7e115138830a Vincent Mailhol 2022-06-10   70  	unsigned int bitrate_error;		/* difference between current and nominal value */
0c7e115138830a Vincent Mailhol 2022-06-10   71  	unsigned int best_bitrate_error = UINT_MAX;
0c7e115138830a Vincent Mailhol 2022-06-10   72  	unsigned int sample_point_error;	/* difference between current and nominal value */
0c7e115138830a Vincent Mailhol 2022-06-10   73  	unsigned int best_sample_point_error = UINT_MAX;
0c7e115138830a Vincent Mailhol 2022-06-10   74  	unsigned int sample_point_nominal;	/* nominal sample point */
0c7e115138830a Vincent Mailhol 2022-06-10   75  	unsigned int best_tseg = 0;		/* current best value for tseg */
0c7e115138830a Vincent Mailhol 2022-06-10   76  	unsigned int best_brp = 0;		/* current best value for brp */
0c7e115138830a Vincent Mailhol 2022-06-10   77  	unsigned int brp, tsegall, tseg, tseg1 = 0, tseg2 = 0;
0c7e115138830a Vincent Mailhol 2022-06-10   78  	u64 v64;
0c7e115138830a Vincent Mailhol 2022-06-10   79  
0c7e115138830a Vincent Mailhol 2022-06-10   80  	/* Use CiA recommended sample points */
0c7e115138830a Vincent Mailhol 2022-06-10   81  	if (bt->sample_point) {
0c7e115138830a Vincent Mailhol 2022-06-10   82  		sample_point_nominal = bt->sample_point;
0c7e115138830a Vincent Mailhol 2022-06-10   83  	} else {
0c7e115138830a Vincent Mailhol 2022-06-10   84  		if (bt->bitrate > 800 * KILO /* BPS */)
0c7e115138830a Vincent Mailhol 2022-06-10   85  			sample_point_nominal = 750;
0c7e115138830a Vincent Mailhol 2022-06-10   86  		else if (bt->bitrate > 500 * KILO /* BPS */)
0c7e115138830a Vincent Mailhol 2022-06-10   87  			sample_point_nominal = 800;
0c7e115138830a Vincent Mailhol 2022-06-10   88  		else
0c7e115138830a Vincent Mailhol 2022-06-10   89  			sample_point_nominal = 875;
0c7e115138830a Vincent Mailhol 2022-06-10   90  	}
0c7e115138830a Vincent Mailhol 2022-06-10   91  
0c7e115138830a Vincent Mailhol 2022-06-10   92  	/* tseg even = round down, odd = round up */
0c7e115138830a Vincent Mailhol 2022-06-10   93  	for (tseg = (btc->tseg1_max + btc->tseg2_max) * 2 + 1;
0c7e115138830a Vincent Mailhol 2022-06-10   94  	     tseg >= (btc->tseg1_min + btc->tseg2_min) * 2; tseg--) {
0c7e115138830a Vincent Mailhol 2022-06-10   95  		tsegall = CAN_SYNC_SEG + tseg / 2;
0c7e115138830a Vincent Mailhol 2022-06-10   96  
0c7e115138830a Vincent Mailhol 2022-06-10   97  		/* Compute all possible tseg choices (tseg=tseg1+tseg2) */
0c7e115138830a Vincent Mailhol 2022-06-10   98  		brp = priv->clock.freq / (tsegall * bt->bitrate) + tseg % 2;
0c7e115138830a Vincent Mailhol 2022-06-10   99  
0c7e115138830a Vincent Mailhol 2022-06-10  100  		/* choose brp step which is possible in system */
0c7e115138830a Vincent Mailhol 2022-06-10  101  		brp = (brp / btc->brp_inc) * btc->brp_inc;
0c7e115138830a Vincent Mailhol 2022-06-10  102  		if (brp < btc->brp_min || brp > btc->brp_max)
0c7e115138830a Vincent Mailhol 2022-06-10  103  			continue;
0c7e115138830a Vincent Mailhol 2022-06-10  104  
0c7e115138830a Vincent Mailhol 2022-06-10  105  		bitrate = priv->clock.freq / (brp * tsegall);
0c7e115138830a Vincent Mailhol 2022-06-10  106  		bitrate_error = abs(bt->bitrate - bitrate);
0c7e115138830a Vincent Mailhol 2022-06-10  107  
0c7e115138830a Vincent Mailhol 2022-06-10  108  		/* tseg brp biterror */
0c7e115138830a Vincent Mailhol 2022-06-10  109  		if (bitrate_error > best_bitrate_error)
0c7e115138830a Vincent Mailhol 2022-06-10  110  			continue;
0c7e115138830a Vincent Mailhol 2022-06-10  111  
0c7e115138830a Vincent Mailhol 2022-06-10  112  		/* reset sample point error if we have a better bitrate */
0c7e115138830a Vincent Mailhol 2022-06-10  113  		if (bitrate_error < best_bitrate_error)
0c7e115138830a Vincent Mailhol 2022-06-10  114  			best_sample_point_error = UINT_MAX;
0c7e115138830a Vincent Mailhol 2022-06-10  115  
0c7e115138830a Vincent Mailhol 2022-06-10  116  		can_update_sample_point(btc, sample_point_nominal, tseg / 2,
0c7e115138830a Vincent Mailhol 2022-06-10  117  					&tseg1, &tseg2, &sample_point_error);
0c7e115138830a Vincent Mailhol 2022-06-10  118  		if (sample_point_error >= best_sample_point_error)
0c7e115138830a Vincent Mailhol 2022-06-10  119  			continue;
0c7e115138830a Vincent Mailhol 2022-06-10  120  
0c7e115138830a Vincent Mailhol 2022-06-10  121  		best_sample_point_error = sample_point_error;
0c7e115138830a Vincent Mailhol 2022-06-10  122  		best_bitrate_error = bitrate_error;
0c7e115138830a Vincent Mailhol 2022-06-10  123  		best_tseg = tseg / 2;
0c7e115138830a Vincent Mailhol 2022-06-10  124  		best_brp = brp;
0c7e115138830a Vincent Mailhol 2022-06-10  125  
0c7e115138830a Vincent Mailhol 2022-06-10  126  		if (bitrate_error == 0 && sample_point_error == 0)
0c7e115138830a Vincent Mailhol 2022-06-10  127  			break;
0c7e115138830a Vincent Mailhol 2022-06-10  128  	}
0c7e115138830a Vincent Mailhol 2022-06-10  129  
0c7e115138830a Vincent Mailhol 2022-06-10  130  	if (best_bitrate_error) {
0c7e115138830a Vincent Mailhol 2022-06-10  131  		/* Error in one-tenth of a percent */
0c7e115138830a Vincent Mailhol 2022-06-10  132  		v64 = (u64)best_bitrate_error * 1000;
0c7e115138830a Vincent Mailhol 2022-06-10  133  		do_div(v64, bt->bitrate);
0c7e115138830a Vincent Mailhol 2022-06-10  134  		bitrate_error = (u32)v64;
0c7e115138830a Vincent Mailhol 2022-06-10  135  		if (bitrate_error > CAN_CALC_MAX_ERROR) {
0c7e115138830a Vincent Mailhol 2022-06-10  136  			netdev_err(dev,
0c7e115138830a Vincent Mailhol 2022-06-10  137  				   "bitrate error %d.%d%% too high\n",
0c7e115138830a Vincent Mailhol 2022-06-10  138  				   bitrate_error / 10, bitrate_error % 10);
0c7e115138830a Vincent Mailhol 2022-06-10  139  			return -EDOM;
0c7e115138830a Vincent Mailhol 2022-06-10  140  		}
0c7e115138830a Vincent Mailhol 2022-06-10  141  		netdev_warn(dev, "bitrate error %d.%d%%\n",
0c7e115138830a Vincent Mailhol 2022-06-10  142  			    bitrate_error / 10, bitrate_error % 10);
0c7e115138830a Vincent Mailhol 2022-06-10  143  	}
0c7e115138830a Vincent Mailhol 2022-06-10  144  
0c7e115138830a Vincent Mailhol 2022-06-10  145  	/* real sample point */
0c7e115138830a Vincent Mailhol 2022-06-10  146  	bt->sample_point = can_update_sample_point(btc, sample_point_nominal,
0c7e115138830a Vincent Mailhol 2022-06-10  147  						   best_tseg, &tseg1, &tseg2,
0c7e115138830a Vincent Mailhol 2022-06-10  148  						   NULL);
0c7e115138830a Vincent Mailhol 2022-06-10  149  
0c7e115138830a Vincent Mailhol 2022-06-10  150  	v64 = (u64)best_brp * 1000 * 1000 * 1000;
0c7e115138830a Vincent Mailhol 2022-06-10  151  	do_div(v64, priv->clock.freq);
0c7e115138830a Vincent Mailhol 2022-06-10  152  	bt->tq = (u32)v64;
0c7e115138830a Vincent Mailhol 2022-06-10  153  	bt->prop_seg = tseg1 / 2;
0c7e115138830a Vincent Mailhol 2022-06-10  154  	bt->phase_seg1 = tseg1 - bt->prop_seg;
0c7e115138830a Vincent Mailhol 2022-06-10  155  	bt->phase_seg2 = tseg2;
0c7e115138830a Vincent Mailhol 2022-06-10  156  
0c7e115138830a Vincent Mailhol 2022-06-10  157  	/* check for sjw user settings */
0c7e115138830a Vincent Mailhol 2022-06-10  158  	if (!bt->sjw || !btc->sjw_max) {
0c7e115138830a Vincent Mailhol 2022-06-10  159  		bt->sjw = 1;
0c7e115138830a Vincent Mailhol 2022-06-10  160  	} else {
0c7e115138830a Vincent Mailhol 2022-06-10  161  		/* bt->sjw is at least 1 -> sanitize upper bound to sjw_max */
0c7e115138830a Vincent Mailhol 2022-06-10  162  		if (bt->sjw > btc->sjw_max)
0c7e115138830a Vincent Mailhol 2022-06-10  163  			bt->sjw = btc->sjw_max;
0c7e115138830a Vincent Mailhol 2022-06-10  164  		/* bt->sjw must not be higher than tseg2 */
0c7e115138830a Vincent Mailhol 2022-06-10  165  		if (tseg2 < bt->sjw)
0c7e115138830a Vincent Mailhol 2022-06-10  166  			bt->sjw = tseg2;
0c7e115138830a Vincent Mailhol 2022-06-10  167  	}
0c7e115138830a Vincent Mailhol 2022-06-10  168  
0c7e115138830a Vincent Mailhol 2022-06-10  169  	bt->brp = best_brp;
0c7e115138830a Vincent Mailhol 2022-06-10  170  
0c7e115138830a Vincent Mailhol 2022-06-10  171  	/* real bitrate */
0c7e115138830a Vincent Mailhol 2022-06-10 @172  	bt->bitrate = priv->clock.freq /
0c7e115138830a Vincent Mailhol 2022-06-10  173  		(bt->brp * (CAN_SYNC_SEG + tseg1 + tseg2));
0c7e115138830a Vincent Mailhol 2022-06-10  174  
0c7e115138830a Vincent Mailhol 2022-06-10  175  	return 0;
0c7e115138830a Vincent Mailhol 2022-06-10  176  }
0c7e115138830a Vincent Mailhol 2022-06-10  177  

:::::: The code at line 172 was first introduced by commit
:::::: 0c7e115138830af77d480ee9185bbdc23c6e73a4 can: bittiming: move bittiming calculation functions to calc_bittiming.c

:::::: TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
:::::: CC: Marc Kleine-Budde <mkl@pengutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
