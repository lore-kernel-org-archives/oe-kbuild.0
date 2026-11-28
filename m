Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795835895;
	b=H6fFp1ysRajeJZEYIbaqv5YVjPgTtVS+eA/KExzTBb/5QDEURD/f1cxpvK7HnB/isv99
	 ZoehYp423/JeE4home4bu0Cc8syWC9fc2drfh7kKXYKtJwZiOrNULLl6WITfpmdUVf1Qf
	 Z42s3mJ0ohzJtkBXxCL/QlKNVUR1vS743Ek20RX0EzSvFL35R21j4lqAL4cH16Y+BuKas
	 DTi4w/defLdeNrOiF+Ejwf9WiUBMZ71Ha905MyHo870SGMI0cnXxQaqbOAVPCXciGgMQy
	 GmtXYlrQG5u+0KJQ6SC49lNIf9KVQUOzAiE87vQeeOSc1xFH4sm6QzfPBa1UfM/6chA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795835895;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=A3Qe7fF/wUWXKzMUg1lU3aGAtNk7UpieC1FJ2aRFohs=;
	b=nDRkFS3a3bGFF7bLYqhoxPr6+9K5bybH60ygJQH0gw53xvV61cUoCB8Np6icOQhCszwv
	 udJpSdVQKrWerHrnP3s1uggdH/Lh7T2Kb5qgnhpyhqzc+MDqaw71KN4uLB1Wmz6mN2/CU
	 Hv7E5vG9NzFKhrYmP8SDJIfg/KH0rp9o/wdq6Gj7WueajrpNktOPLRj72V6tfqIW6RbL9
	 lmSYgBeHxahkjoTvh6gHgGmXpcZUaqq05HhO7Lik8pDVTT4IpsIvPJjcj+CbtH36tpnBg
	 iyisqQZHilEPGDMy78l1YAMUa3tIfx+csJyEloTDUBq2N/H0eicP7QLpOWxDU/GBCzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N8ubBWLK;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CF606A31C
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Nov 2026 03:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N8ubBWLK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795835894; x=1827371894;
  h=date:from:to:cc:subject:message-id;
  bh=aPOt3EsY6pJsAXg1PFVGMA/xoY6E2/BfMyPxh/EweMk=;
  b=N8ubBWLKS6McI02jw40CacEg+QZBByxKkCr9Z7FdL0ZghsBVnFrbXYH6
   0OF5nQXapfyowNA/KSiCK8bpTHGnh6CN8FrU+jpf1jLQ8qj5JHpyyz1di
   wGCzZ4IBW5pv9bTaIHdj9+gdziisLadMehhQbdNpPOuCiZ88gUnDQs0Y6
   RoV2Onz7MIWhaWqb6OhAMSkvqX5NCFJOchE/8nIQcFkAva62lG3C5iHHs
   oYrKcCP5S0wxGe4TR/M/yYWmJsyW7GiTNuJdDlllRyJPIsBZ4tH1K0ji3
   vyfffN9+r2dSUsSxO3mkh7zcaeqWK+tNnFl1T2Rjiqm5pxRjt8dxFtHKQ
   w==;
X-CSE-ConnectionGUID: rT/R054jSDKZICVXyrfCOQ==
X-CSE-MsgGUID: jeQ9ONyLTZuu+uQiKOFr6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4649400"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4649400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 19:18:14 -0800
X-CSE-ConnectionGUID: eHPkuhN9Q3iOuCpHed12Rg==
X-CSE-MsgGUID: OjG3nkPuQTm5P4zld3v0JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12633947"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2026 19:18:12 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX8x0-000000000Uk-0rZj;
	Sat, 28 Nov 2026 03:18:10 +0000
Date: Sat, 28 Nov 2026 04:17:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/compiler.h:63:3: error: '__if_trace' is static
 but declared in inline function '__memset' which is not static
Message-ID: <20261128041233.iURF1pbs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Magnus Lindholm <linmag7@gmail.com>
CC: Matt Turner <mattst88@gmail.com>

Hi Magnus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c639ac6b9cf100b860408a3cf8d7eab268866cd7
commit: d1ee975398a357be8f56836a87ae55c51770e4f0 alpha: enable lockdep hardirq state tracking
date:   4 months ago
:::::: branch date: 39 minutes ago
:::::: commit date: 4 months ago
config: alpha-randconfig-r2106-20261128 (https://download.01.org/0day-ci/archive/20261128/20261128041233.iURF1pbs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128041233.iURF1pbs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d1ee975398a3 ("alpha: enable lockdep hardirq state tracking")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261128041233.iURF1pbs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cleanup.h:5,
                    from lib/test_bitops.c:8:
>> include/linux/compiler.h:63:3: error: '__if_trace' is static but declared in inline function '__memset' which is not static [-Werror]
      63 |   __if_trace = {    \
         |   ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:36:3: note: in expansion of macro 'if'
      36 |   if (__builtin_constant_p(n)) {
         |   ^~
>> include/linux/compiler.h:63:3: error: '__if_trace' is static but declared in inline function '__memset' which is not static [-Werror]
      63 |   __if_trace = {    \
         |   ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:35:2: note: in expansion of macro 'if'
      35 |  if (__builtin_constant_p(c)) {
         |  ^~
   cc1: all warnings being treated as errors


vim +63 include/linux/compiler.h

a15fd609ad53a631 Linus Torvalds 2019-03-20  58  
a15fd609ad53a631 Linus Torvalds 2019-03-20  59  #define __trace_if_value(cond) ({			\
2bcd521a684cc94b Steven Rostedt 2008-11-21  60  	static struct ftrace_branch_data		\
e04462fb82f8dd98 Miguel Ojeda   2018-09-03  61  		__aligned(4)				\
33def8498fdde180 Joe Perches    2020-10-21  62  		__section("_ftrace_branch")		\
a15fd609ad53a631 Linus Torvalds 2019-03-20 @63  		__if_trace = {				\
2bcd521a684cc94b Steven Rostedt 2008-11-21  64  			.func = __func__,		\
2bcd521a684cc94b Steven Rostedt 2008-11-21  65  			.file = __FILE__,		\
2bcd521a684cc94b Steven Rostedt 2008-11-21  66  			.line = __LINE__,		\
2bcd521a684cc94b Steven Rostedt 2008-11-21  67  		};					\
a15fd609ad53a631 Linus Torvalds 2019-03-20  68  	(cond) ?					\
a15fd609ad53a631 Linus Torvalds 2019-03-20  69  		(__if_trace.miss_hit[1]++,1) :		\
a15fd609ad53a631 Linus Torvalds 2019-03-20  70  		(__if_trace.miss_hit[0]++,0);		\
a15fd609ad53a631 Linus Torvalds 2019-03-20  71  })
a15fd609ad53a631 Linus Torvalds 2019-03-20  72  

:::::: The code at line 63 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
