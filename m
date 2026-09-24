Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCED30AAD8
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231617; cv=none; b=mJuXn6Rlj2dNEOz9YLiKOOhTO1Q/zaV4wH28YQ88I2hRX6oPPi7oI87IQe7iY72m2yJ+WA4O3/Lf+1m0aiVWUWmmB3drECt9tiiXY7kbJ4zSYs74uGSmaEVjA6ZpmkLUZrfbRwbcuMoMuXcxQSKfe65aOmgm1JqQRG1IGK1BFC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231617; c=relaxed/simple;
	bh=RzqzbjcCPvuUlgqkf99bZMdRmIYkarfeAwb4obumokY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gfeZf0TFvdysg4y2xIO6zkulMpA/ghDUKNYN/XjT72bexCR1o77OcoGKKOLvMF41xvO6fRbA+QonKIp/UQ31gW1OfDMBFSh8+eIeCCODn7kMvgPhckr82j2rchnqowSjSWinPRCkBk6zV7OQRM6ivXj31KgWb5TqBvpRZBg1GPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGwyqOST; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGwyqOST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790231615; x=1821767615;
  h=date:from:to:cc:subject:message-id;
  bh=RzqzbjcCPvuUlgqkf99bZMdRmIYkarfeAwb4obumokY=;
  b=UGwyqOSTrC7GWwsj5xlBnsKFEnYRJcYubBMAmvTQ9SNrhgNAchibsza9
   O7F510NDscnxMzlp5BMzWyOWDIJTkcFDszrphnY5JoW4yYGvTWbwHWscF
   z8n597TB3g6JKq68OC96hdnhI+yW60XPlwLGulRsA5ZtrvvhHrOqT54TG
   SfO1TveYjN1tH7dA14C2PNDV6nvyPPDY31ARWmJM4dwHlz57Vb462zPjZ
   bltdiXDMsdvVmXAB4AI+MCeNH0KdW+P1aS4wP6BvudvbWKzOpizFsWII3
   GwqrGsqQoPvelwibblMVs7tf/1G/5lctJ7HCm6bvOWTgSaO5zETSIDKR4
   Q==;
X-CSE-ConnectionGUID: 8ipRmAYWRNqbhBEOryW0fA==
X-CSE-MsgGUID: Z4RhqwM9S3OGo/Fmp1hF7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89854448"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89854448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 23:33:34 -0700
X-CSE-ConnectionGUID: Ip8cR354RkmLlR0yixfDVg==
X-CSE-MsgGUID: pZGl3fMzSQCOGlqGqjaTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="270425765"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 23:33:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9d1P-00000000IIq-1H66;
	Thu, 24 Sep 2026 06:33:31 +0000
Date: Thu, 24 Sep 2026 14:33:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/include/asm/cmpxchg.h:88:58: warning: pointer
 type mismatch in conditional expression
Message-ID: <202609241434.P2ykgBuJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Bradley-Morgan/lib-Add-two-byte-cmpxchg-emulation-function/20260922-173350, commit: 1eef3d8b352da80a750e9fbfdb7a33b8a0109492"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bradley Morgan <brads@mainlining.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bradley-Morgan/lib-Add-two-byte-cmpxchg-emulation-function/20260922-173350
head:   1eef3d8b352da80a750e9fbfdb7a33b8a0109492
commit: 1eef3d8b352da80a750e9fbfdb7a33b8a0109492 xtensa: Emulate two-byte cmpxchg
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r1300-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241434.P2ykgBuJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241434.P2ykgBuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609241434.P2ykgBuJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/xtensa/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/xtensa/include/asm/bitops.h:192,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/xtensa/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/fscrypt.h:16,
                    from fs/crypto/fscrypt_private.h:15,
                    from fs/crypto/hooks.c:10:
   fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>> arch/xtensa/include/asm/cmpxchg.h:88:58: warning: pointer type mismatch in conditional expression
      88 |         unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));              \
         |                                                          ^
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported Xtensa ABI
   kernel/events/core.c:1586:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1586:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1586:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1599:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1599:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1599:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3784:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3784:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3784:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3788:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3788:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3788:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3789:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3789:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3789:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3842:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3842:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3842:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3843:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3843:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3843:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4261:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4261:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4261:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4669:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4669:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4669:15: sparse:    struct perf_event_context *
   kernel/events/core.c:5155:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5155:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:5155:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6931:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6931:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6931:9: sparse:    struct perf_buffer *
>> kernel/events/core.c:5431:21: sparse: sparse: incompatible types in conditional expression (different address spaces):
   kernel/events/core.c:5431:21: sparse:    struct perf_ctx_data [noderef] __rcu *
   kernel/events/core.c:5431:21: sparse:    struct perf_ctx_data *
   kernel/events/core.c:5431:21: sparse: sparse: cast from unknown type
   kernel/events/core.c:6682:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6682:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6682:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6806:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6806:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6806:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6839:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6839:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6839:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6952:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6952:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6952:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6968:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6968:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6968:14: sparse:    struct perf_buffer *
   kernel/events/core.c:9054:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9054:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9054:15: sparse:    struct perf_event_context *
   kernel/events/core.c:9142:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9142:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:9142:13: sparse:    struct perf_buffer *
   kernel/events/core.c:9984:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9984:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9984:15: sparse:    struct perf_event_context *
   kernel/events/core.c:11209:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11209:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11209:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:11248:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11248:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11248:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11528:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11528:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:11528:23: sparse:    struct perf_event_context *
   kernel/events/core.c:14667:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14667:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:14667:9: sparse:    struct perf_event_context *
   kernel/events/core.c:15205:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:15205:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:15205:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11062:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11062:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11062:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11082:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11082:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11082:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11198:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11198:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11198:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:11198:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11198:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11198:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:11198:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11198:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:11198:16: sparse:    struct swevent_hlist *

vim +88 arch/xtensa/include/asm/cmpxchg.h

f9aa7e1882f3cee David Howells  2012-03-28  85  
b9b12978a8e9a4b Mark Rutland   2021-05-25  86  #define arch_cmpxchg(ptr,o,n)						      \
1eef3d8b352da80 Bradley Morgan 2026-09-22  87  	({ unsigned long _old_ = (unsigned long)(0 ? *(ptr) : (o));	      \
1eef3d8b352da80 Bradley Morgan 2026-09-22 @88  	unsigned long _new_ = (unsigned long)(0 ? *(ptr) : (n));	      \
1eef3d8b352da80 Bradley Morgan 2026-09-22  89  	(__typeof__(*(ptr))) __cmpxchg((ptr), _old_,		      \
1eef3d8b352da80 Bradley Morgan 2026-09-22  90  				_new_, sizeof (*(ptr))); \
f9aa7e1882f3cee David Howells  2012-03-28  91  	})
f9aa7e1882f3cee David Howells  2012-03-28  92  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
