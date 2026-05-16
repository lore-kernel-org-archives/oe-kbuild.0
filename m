Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415F73E2765
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946948; cv=none; b=GQXoSOPhCn6kJfC8hbZVGg0/iIvRivAlq/XCQZzKKDBX5HSQGsr1mxDYKLVkxOnU2xV+D3De0D/haP8VjOsTskrflKJc6qy4FKF0Px/1fYfRB9Sxk4l7ufiPxUuv1TK/v14BZRy0GMFlGRhVNpH7GukQOlGXW/DLT7hN8oq5/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946948; c=relaxed/simple;
	bh=gb5fZKcTi1kdPJCHr4r3XKK3QoTynvK/yMapSJxO6Sg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a1rEBdA4SncjX1gibYwJGvu/bTvZzXFWLgx4/KOquvQ/9k/MuMAKIXU8D28ldMf5xZcwRIB1OFz5OVXqtqK1BPazzmH3D7l++gCYtqTZpimTTPWCeWBKMYSFK+WJ89RswWyYGj0X14Q+1/NKWTu7v89uEJAGivTr261PfwKmkJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8P6OeWY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8P6OeWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778946948; x=1810482948;
  h=date:from:to:cc:subject:message-id;
  bh=gb5fZKcTi1kdPJCHr4r3XKK3QoTynvK/yMapSJxO6Sg=;
  b=m8P6OeWYja4cfab52M3ypwBQoes1gzCtCyxWyG5DvYjOV1bqgkwF9Tbg
   NySraM0c7qFVelq96DUnZ0Kl/9wJ80Al6lePCBJaLIBARapPnBnxl61Zh
   9I4VodymYXGf5W7okTLsjBPaBB2HMBfjoV3UoMCqUaYa9OZshOY3MZv8U
   a5Os9ZtIB1vA4hbgWCC7CEpx8jstkiRUtE2mydEwY+DekQWynyrgBMF7o
   mSRBbFfx6DXqpYoLE015/OSI1mxVyRAj8WMCDSQQpDAFqBTDk0JiDgZNF
   jeI+c1QLhrZFhBK8o/+3tQwgnjmbbphYW/fBRZ9SyBXMztesxBlGXnsxv
   w==;
X-CSE-ConnectionGUID: hrpR1aK4T6iR2MjSbG7fRg==
X-CSE-MsgGUID: liPkQ8F5Qia8fn3W2kycLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79850409"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79850409"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 08:55:47 -0700
X-CSE-ConnectionGUID: bH3nkjStSm+oaUl5YjcBCA==
X-CSE-MsgGUID: vP9GFy8zRtG/+V7ySZVRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="234748071"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 May 2026 08:55:45 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOHMd-000000000vq-2l6i;
	Sat, 16 May 2026 15:55:43 +0000
Date: Sat, 16 May 2026 23:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/iio/types.h:44:15: error: unknown type name
 's64'
Message-ID: <202605162303.IVByooO1-lkp@intel.com>
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
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-r071-20260516 (https://download.01.org/0day-ci/archive/20260516/202605162303.IVByooO1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605162303.IVByooO1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605162303.IVByooO1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iio/adc/xilinx-xadc-events.c:9:
   In file included from include/linux/iio/events.h:9:
>> include/linux/iio/types.h:44:15: error: unknown type name 's64'
      44 | static inline s64 iio_val_s64_compose(int val0, int val1)
         |               ^
>> include/linux/iio/types.h:46:10: error: use of undeclared identifier 's64'
      46 |         return (s64)(((u64)val1 << 32) | (u32)val0);
         |                 ^
>> include/linux/iio/types.h:46:17: error: use of undeclared identifier 'u64'
      46 |         return (s64)(((u64)val1 << 32) | (u32)val0);
         |                        ^
>> include/linux/iio/types.h:46:36: error: use of undeclared identifier 'u32'
      46 |         return (s64)(((u64)val1 << 32) | (u32)val0);
         |                                           ^
   include/linux/iio/types.h:49:15: error: unknown type name 's64'
      49 | static inline s64 iio_val_s64_from_array(const int *vals)
         |               ^
   include/linux/iio/types.h:54:42: error: unknown type name 's64'
      54 | static inline void iio_val_s64_decompose(s64 dec64, int *val0, int *val1)
         |                                          ^
   include/linux/iio/types.h:56:10: error: use of undeclared identifier 'u32'
      56 |         *val0 = lower_32_bits(dec64);
         |                 ^
   include/linux/wordpart.h:20:28: note: expanded from macro 'lower_32_bits'
      20 | #define lower_32_bits(n) ((u32)((n) & 0xffffffff))
         |                            ^
   In file included from drivers/iio/adc/xilinx-xadc-events.c:9:
   In file included from include/linux/iio/events.h:9:
   include/linux/iio/types.h:57:10: error: use of undeclared identifier 'u32'
      57 |         *val1 = upper_32_bits(dec64);
         |                 ^
   include/linux/wordpart.h:14:28: note: expanded from macro 'upper_32_bits'
      14 | #define upper_32_bits(n) ((u32)(((n) >> 16) >> 16))
         |                            ^
   In file included from drivers/iio/adc/xilinx-xadc-events.c:9:
   In file included from include/linux/iio/events.h:9:
   include/linux/iio/types.h:60:47: error: unknown type name 's64'
      60 | static inline void iio_val_s64_array_populate(s64 dec64, int *vals)
         |                                               ^
   9 errors generated.


vim +/s64 +44 include/linux/iio/types.h

1ecae55efb140a3 Rodrigo Alencar 2026-05-06  43  
1ecae55efb140a3 Rodrigo Alencar 2026-05-06 @44  static inline s64 iio_val_s64_compose(int val0, int val1)
1ecae55efb140a3 Rodrigo Alencar 2026-05-06  45  {
1ecae55efb140a3 Rodrigo Alencar 2026-05-06 @46  	return (s64)(((u64)val1 << 32) | (u32)val0);
1ecae55efb140a3 Rodrigo Alencar 2026-05-06  47  }
1ecae55efb140a3 Rodrigo Alencar 2026-05-06  48  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
