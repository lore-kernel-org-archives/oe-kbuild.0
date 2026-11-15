Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762022;
	b=WD0lRM006r4ueKqLoY6SwCSotWryDmgtnzMKgbQYgGPgDjQ6dDtseTZUbhkijs86WDGl
	 2cXTBkxU7Fse28XejdCyoZW3gMjqHcLM1zCnyL0gkh9fR2OhhncEQOW040RmGe1iw8mpg
	 HnA1nIw4eiHik0TNV0rs0Qd3J46MAowt/etwaiU5l3RmdqUiy+fg9dojq6Tf3UkHpKaF2
	 66P1eDS8TDRJegcoqf1rnTLVyYHeWIpHqzjuT+RKY5gxjfZeBo/9T8giaMIxGeFnh2GNA
	 SxttUjTRt8Zl83lGHSAErxmTz4Pz745U3/ZAu8DZzfv06AQEZcrasasoPu1t87g/COw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762022;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5K29Qfy/kYzRxqt0iQOVc4dIJ/h3So7YNW37kyAVais=;
	b=3rBx0GIqGVT80kJCL7V2q7aX2XRWY4XCClIDBlg1Jz5ywtiY9NxZPHyZKi2sYavlQrP1
	 MI+9KRYshdhGxSnFl9G55aI2fQ5VMzlhH08J/Fhu7T2/5Nm5saTbjWYfalKzhuYHAa+SF
	 jFNLhgUvKn6M7k6KEdhskTkMtxf8hN1h/pcrRP5dc9SJSwyuNpSiUF0qzXa0abwjokHMO
	 mmfmeiO7vOgfrZGNhlZF+0pUILVwkcC5xL6ZwylHjW3jAyOK/sf3zMOjyrLwVXi6N5Kkh
	 n0wzn+S1O3aLKJr2rzpHxqckwidWoUBSjfNpBSpoXzs9gEgXBYy3DYQRHIZlkCrrAZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gxub9rDl;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7966606A31D
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 17:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7966606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gxub9rDl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794762021; x=1826298021;
  h=date:from:to:cc:subject:message-id;
  bh=quxckGVGSTnTNR5dIdAfLyVbtNmnvlF5uxnLZ/w0pbI=;
  b=Gxub9rDlJ6bfliy9QhXu0zi/7cdZsmF0soxaG8JgjQMC96RC9KXI/vFs
   CT6djX5xV/5QnIzymcDy8GeW94CEhPKzHYVnV71PJXW2zP4uPaVwUT9QV
   GOM5C5euJXjWuOqHM4Yk5+AWwD98SnJ+zwxypeWS6ozYpFGlAxzs1u/Cf
   1ry9an24H+8ozg8w+KHqmsd3940hdRBrElKvqeNQs+F0+madr9y0EwYQZ
   NCCoGBgxOJtbabIrbqZdz3s97+xLIZrlAyfDuc3c8+wIyWa3VCBAaI+Le
   DOmYcXmuIG+HEvxK+vn8T3+tG1rL1BstPlMfzfdhx+vGAlKghjwWqEiBD
   A==;
X-CSE-ConnectionGUID: NnV0tX2XTc+gXHLA7uRdwA==
X-CSE-MsgGUID: Sk8KuN2aQViRdwA/rOpSwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3379883"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3379883"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 09:00:21 -0800
X-CSE-ConnectionGUID: O5d2769PSKynPp4MrXvfGg==
X-CSE-MsgGUID: 1Qc3c4/GSK620L0OuqugUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9706591"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 15 Nov 2026 09:00:20 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSdaU-000000002Kl-0wDC;
	Sun, 15 Nov 2026 17:00:18 +0000
Date: Sun, 15 Nov 2026 18:00:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/compiler.h:63:17: error: '__if_trace' is
 static but declared in inline function '__memset' which is not static
Message-ID: <202611151720.NYewcq3D-lkp@intel.com>
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
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/d1/d1ee975398a357be8f56836a87ae55c51770e4f0-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Magnus Lindholm <linmag7@gmail.com>
CC: Matt Turner <mattst88@gmail.com>

Hi Magnus,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: d1ee975398a357be8f56836a87ae55c51770e4f0 alpha: enable lockdep hardirq state tracking
date:   4 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 4 months ago
config: alpha-randconfig-r2310-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151720.NYewcq3D-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151720.NYewcq3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d1ee975398a3 ("alpha: enable lockdep hardirq state tracking")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151720.NYewcq3D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cleanup.h:5,
                    from lib/test_bitops.c:8:
>> include/linux/compiler.h:63:17: error: '__if_trace' is static but declared in inline function '__memset' which is not static [-Werror]
      63 |                 __if_trace = {                          \
         |                 ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:36:17: note: in expansion of macro 'if'
      36 |                 if (__builtin_constant_p(n)) {
         |                 ^~
>> include/linux/compiler.h:63:17: error: '__if_trace' is static but declared in inline function '__memset' which is not static [-Werror]
      63 |                 __if_trace = {                          \
         |                 ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/alpha/include/asm/string.h:35:9: note: in expansion of macro 'if'
      35 |         if (__builtin_constant_p(c)) {
         |         ^~
   cc1: all warnings being treated as errors


vim +63 include/linux/compiler.h

a15fd609ad53a6 Linus Torvalds 2019-03-20  58  
a15fd609ad53a6 Linus Torvalds 2019-03-20  59  #define __trace_if_value(cond) ({			\
2bcd521a684cc9 Steven Rostedt 2008-11-21  60  	static struct ftrace_branch_data		\
e04462fb82f8dd Miguel Ojeda   2018-09-03  61  		__aligned(4)				\
33def8498fdde1 Joe Perches    2020-10-21  62  		__section("_ftrace_branch")		\
a15fd609ad53a6 Linus Torvalds 2019-03-20 @63  		__if_trace = {				\
2bcd521a684cc9 Steven Rostedt 2008-11-21  64  			.func = __func__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  65  			.file = __FILE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  66  			.line = __LINE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  67  		};					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  68  	(cond) ?					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  69  		(__if_trace.miss_hit[1]++,1) :		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  70  		(__if_trace.miss_hit[0]++,0);		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  71  })
a15fd609ad53a6 Linus Torvalds 2019-03-20  72  

:::::: The code at line 63 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
