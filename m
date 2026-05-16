Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7A1DE4F1
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941365; cv=none; b=M7TqhktsdtzKLdCPr47hY0iPw1Jrciqub3VUEAhVfqHvJ//+/vXWaxgrinsNx/j4fC67nc1jOJ0RWpNTUT4tuc5CcqzpAd6EVHk2aJEJe5GqVjAkHqm2XMrgqvhMmQj9iZLeuqkIFUrUMbYXCqr65rorpd1KPcToJRRE+9ROZ+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941365; c=relaxed/simple;
	bh=x85jSdDjJ29xIIrtDzZ9+RxzwnApf4qGDuQkcq0R2pw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j+4ENoCQ6QZWkhuYI8Ll54PyryrG3g8oekn+3KDuvfrYbSci7Ivrq23ARqIPZFjk2wD3VEV6EGIfy9XJVXkBATtKnbpwc2SLC5SpilRagOmkHuUWHNV8nu/u/9T7Rc89POHGjGvolz8KjmB8fc/GqE7Oi3lGxwI3NqPx7Ru6GYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOKW8QBS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOKW8QBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778941364; x=1810477364;
  h=date:from:to:cc:subject:message-id;
  bh=x85jSdDjJ29xIIrtDzZ9+RxzwnApf4qGDuQkcq0R2pw=;
  b=hOKW8QBSPi4TZvzfbYWvz0qONYGGcDjpSJEjG9Q+np0/kE0fY6rY0N3O
   TajlVz0OCZlmeFuzk2SPRaEvamO4qmdtv0XuKSq7ce+Mv+SHZkxIjK2Mv
   9SzPPtLvwmBWfxBBmTCFH5sL+lecbxxE41gVX796nCToUO9ihZarg5JeR
   qXBNPt7dBpjsn6wop/nuR/RuRLg7muwbAtHS1ysJ2BmU6gF9wjvoj14mx
   jww0MkIA6tnK2l3eGFCe+UxVmMa7OiU5up6g85NY1sfXWZRiNDOcjaDC4
   qVktYKN0MEGbMD+oegZDhdjHE1HHv6UFl8KvYXdZuuPmLe7L1+ENgihkS
   A==;
X-CSE-ConnectionGUID: UfDg7lIMR56cpri1SKr5Jw==
X-CSE-MsgGUID: h7uHcHneTneL+STKM6vXIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83738692"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="83738692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 07:22:44 -0700
X-CSE-ConnectionGUID: iG0gSyNITLuB+8Ads6oLYg==
X-CSE-MsgGUID: CIZePRGWT9uoSr7pfsHBAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="234527346"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2026 07:22:42 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOFua-000000000sW-1qoL;
	Sat, 16 May 2026 14:22:40 +0000
Date: Sat, 16 May 2026 22:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/iio/types.h:46:17: error: 's64' undeclared
Message-ID: <202605162255.m9u1gJuM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Rodrigo-Alencar-via-B4-Relay/dt-bindings-iio-frequency-add-adf41513/20260515-113444, commit: 1ecae55efb140a38ecd4ec97b4fe8e711a81f184"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rodrigo Alencar <rodrigo.alencar@analog.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Alencar-via-B4-Relay/dt-bindings-iio-frequency-add-adf41513/20260515-113444
head:   f191c064850b44fc99db5ed9856f51b9fc02cef9
commit: 1ecae55efb140a38ecd4ec97b4fe8e711a81f184 iio: core: add decimal value formatting into 64-bit value
date:   35 hours ago
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605162255.m9u1gJuM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605162255.m9u1gJuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605162255.m9u1gJuM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/iio/events.h:9,
                    from drivers/iio/adc/xilinx-xadc-events.c:9:
   include/linux/iio/types.h:44:15: error: unknown type name 's64'
      44 | static inline s64 iio_val_s64_compose(int val0, int val1)
         |               ^~~
   include/linux/iio/types.h: In function 'iio_val_s64_compose':
>> include/linux/iio/types.h:46:17: error: 's64' undeclared (first use in this function)
      46 |         return (s64)(((u64)val1 << 32) | (u32)val0);
         |                 ^~~
   include/linux/iio/types.h:46:17: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/iio/types.h:46:24: error: 'u64' undeclared (first use in this function)
      46 |         return (s64)(((u64)val1 << 32) | (u32)val0);
         |                        ^~~
>> include/linux/iio/types.h:46:28: error: expected ')' before 'val1'
      46 |         return (s64)(((u64)val1 << 32) | (u32)val0);
         |                      ~     ^~~~
         |                            )
>> include/linux/iio/types.h:46:43: error: 'u32' undeclared (first use in this function)
      46 |         return (s64)(((u64)val1 << 32) | (u32)val0);
         |                                           ^~~
>> include/linux/iio/types.h:46:47: error: expected ')' before 'val0'
      46 |         return (s64)(((u64)val1 << 32) | (u32)val0);
         |                     ~                         ^~~~
         |                                               )
   include/linux/iio/types.h: At top level:
   include/linux/iio/types.h:49:15: error: unknown type name 's64'
      49 | static inline s64 iio_val_s64_from_array(const int *vals)
         |               ^~~
   include/linux/iio/types.h:54:42: error: unknown type name 's64'
      54 | static inline void iio_val_s64_decompose(s64 dec64, int *val0, int *val1)
         |                                          ^~~
   include/linux/iio/types.h:60:47: error: unknown type name 's64'
      60 | static inline void iio_val_s64_array_populate(s64 dec64, int *vals)
         |                                               ^~~


vim +/s64 +46 include/linux/iio/types.h

1ecae55efb140a3 Rodrigo Alencar 2026-05-06  43  
1ecae55efb140a3 Rodrigo Alencar 2026-05-06 @44  static inline s64 iio_val_s64_compose(int val0, int val1)
1ecae55efb140a3 Rodrigo Alencar 2026-05-06  45  {
1ecae55efb140a3 Rodrigo Alencar 2026-05-06 @46  	return (s64)(((u64)val1 << 32) | (u32)val0);
1ecae55efb140a3 Rodrigo Alencar 2026-05-06  47  }
1ecae55efb140a3 Rodrigo Alencar 2026-05-06  48  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
