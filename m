Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252083;
	b=mY4IUybeG9AqWRQmAoCWElIPLy3V4h1ZvD9FQgQxrUrLzzMrVd478L4W+ndHK0sx10Ks
	 tft4OuL8Ugqtzm93Lw9MEXuQdvpWvB4IaoiqvdReTyyLhAerXAIpoaJI4MgsZxU5ZPnQc
	 T01G5qZpz1luUDHBDRFKWaVHkgPp0VGKGucCLiyeiNco1H2d2cadXGEVsNXISq1Qdqd2R
	 wVx/JlHzqN2CUnnnEAZOPeXYeN30BXtD3YV/MyF/qdDdtnjDg9bhoUJax2zS2+yS3zYnI
	 XGwN8X8367CAukSpLgEgvWpd8UlvA9wRhNfdxGR6OSWt97lu/mVGegelitEvEl0qauA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZO3iJ8Vye65KfCKVGfSvbLLZ5vIKvLRfhLN37/00TO0=;
	b=nCZYWVDnbyZDayT6PUz35prNXejqweB2u1f1kiR2zVOYeSx7QP8QsPwYrjSI0+8BcUAa
	 EtgdIK76dCVIED6NLgEfmHCl6LHvab8lBkn5pnWnPZaO8oqCVtlr4Ykc0QjDLfT4xcXIR
	 ShY9rA1zAZyLqPcyguGqoaVAXadnr2QSf+NllBvtWlHFusypGRsgEE4NB+4cy7NLKxotE
	 B+iYclFQUWYUBG4iI+tk1RtFaHfHIO5RpHHvwaX8TVgD8964gWT3iYXgw3ikSvKTqZUMe
	 1q+FSXFYJR0FJq06QFaFx7K6Vo8nTu/cg/tkoKD1wGRNU5BH9XROxd37snIz0B4VE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VfYKoOyz;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793BF606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 09:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VfYKoOyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795252083; x=1826788083;
  h=date:from:to:cc:subject:message-id;
  bh=TJVLgl4kS7d5ey2vmXjHy58p+lsiYgE+OKNYhP/3Cho=;
  b=VfYKoOyzqcfyXbLgqiKwIHiFqyopCtTMIgfQumOLIItCbgCiS7iRY4aC
   YOxLXNKDNVjXwA6UDfvRcrGkaoLhS44tRD5KuIrqoCHFtRq2JaiBxTH9Q
   y9e9MjXtao6fzJdlniuHVZ1ciWja6xVecWhcqCiHSd/mfhtdhnTDdw/a9
   obrx8knIzBaHSxcSzK/BERqzcc2uMlAojtBcvaIB42qK3ijPI5ft//im+
   AKnu2ySnmtQJVkHLCvMzQLN9vQLbFJ8HmabfapHXsNla9Qbrw9m3l665t
   Ory5VzfsduTJxXAcii3U7AAQU8C0RKxYNuxhGXdG9PwJHsjJrcTCsrond
   w==;
X-CSE-ConnectionGUID: 2/TAiPgTTQyNTdUqt+MPsA==
X-CSE-MsgGUID: qgUAj4E1Si6rl4qFaRdXww==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4121601"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4121601"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 01:08:02 -0800
X-CSE-ConnectionGUID: lE2q+XMtQSqodtSbMh0Opw==
X-CSE-MsgGUID: c34qqQdeRY2NkEODbb0nJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10869593"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2026 01:08:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUh4f-000000004Hp-09du;
	Sat, 21 Nov 2026 09:07:57 +0000
Date: Sat, 21 Nov 2026 10:07:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1277/10560]
 include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_519' declared with attribute error: min(count,
 (sizeof(pins) / sizeof((pins)[0]) + ((int)sizeof(struct
 {_Static_assert(!(!(!__builtin_types_compatible_p(typeof((pins)),
 typeof(&(p...
Message-ID: <20261121100138.atXffQPe-lkp@intel.com>
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
TO: Kurt Borja <kuurtb@gmail.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: David Lechner <dlechner@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   909ef7a9a30fa139e69e555e3606680f5cca7726
commit: b0b43a26dfc946ea2f1478dbe8512478527d1271 [1277/10560] iio: adc: ti-ads1262: support excitation currents
:::::: branch date: 16 hours ago
:::::: commit date: 3 weeks ago
config: xtensa-randconfig-r2301-20261121 (https://download.01.org/0day-ci/archive/20261121/20261121100138.atXffQPe-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121100138.atXffQPe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121100138.atXffQPe-lkp@intel.com/

Note: the linux-next/master HEAD 909ef7a9a30fa139e69e555e3606680f5cca7726 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iio/adc/ti-ads1262.c: In function 'ads1262_parse_channel_node.constprop':
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_519' declared with attribute error: min(count, (sizeof(pins) / sizeof((pins)[0]) + ((int)sizeof(struct {_Static_assert(!(!(!__builtin_types_compatible_p(typeof((pins)), typeof(&(pins)[0])))), "must be array");})))) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   drivers/iio/adc/ti-ads1262.c:1384:18: note: in expansion of macro 'min'
               pins, min(count, ARRAY_SIZE(pins)));
                     ^~~


vim +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
