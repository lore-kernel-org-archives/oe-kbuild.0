Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1712036D4E8
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763830601; cv=none; b=byfMh53NxCNbdtziWXtr3/E3WDjg8SEPXlAopjW1Ybz7FTksfxlNyxNzp+R0j3OaF2n5m8HcKSPddqMukPT2Ma9wBKHtnUlG/6P3kyeNJwt5FJn0VAWlomziXPnvDO6EMsh9m9yO/d5C+HSP3WA020ZGkW086QBUcg5hjRTBbag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763830601; c=relaxed/simple;
	bh=2EMk7oYr+VYRNdVGwSB9vpaXw3bb6+NF0Yn7HkHSOs8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MDZULYB5XTQ8Eo93nNOWJpAYb0YAyqeIfa3jkq58vx+3JW5yOGG/ZLzSEashnjO683fG4cHY6rm2bMeMIYGVBaHaUrjtKUWoWtI7VUwBBAGvaZEKBQy4a8MMEI7ZmRhvcMKkF6CL2ra5XGas7nNf/lSUZx8X83xg3aAQDlwsHy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzEFlmwh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzEFlmwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763830599; x=1795366599;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2EMk7oYr+VYRNdVGwSB9vpaXw3bb6+NF0Yn7HkHSOs8=;
  b=HzEFlmwhjJ0l9U1HhezwTLQEgJLZ+av0wOTsqo9vgywQ1W7qUELTCfq/
   4Kf9w9haRwVhiyRmgMDzQjuOX21TkjPaj4UdhAbbzGHQrNS8CZ8sFZJG0
   +QwLCkSKeKt11npRHsaSRjN3KC5WmeTRrhBJGw0EfABjcmgHIsDVH9cjA
   FlAYZkEJncwYfaEna9XQGvj5JdUVw2aKsyf046+f+pdUaaDo5sfPUAYLW
   ckuUmuNmJJ4nH7Ib899RmhRQnU2M/nFHamC2J60vEzKI89uIams0iThjF
   p1K7fpAq24X5w/9F56a58060b9159XtqqCdIrWQ4CPtde3REK+q7lYdeL
   w==;
X-CSE-ConnectionGUID: /JqPC8W3SyKMWilP2Av5Pw==
X-CSE-MsgGUID: EZ5XSsM3S7KcVCM+OtBVqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69515334"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="69515334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 08:56:38 -0800
X-CSE-ConnectionGUID: vOuPv2pKTl2LDMNvgblNbQ==
X-CSE-MsgGUID: MVTxL4idRNW0ztG/+ifxpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192727965"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 08:56:37 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMquZ-000000002CR-1J3h;
	Sat, 22 Nov 2025 16:56:35 +0000
Date: Sat, 22 Nov 2025 17:56:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:must-be-lval 546/16507] arm64/arch_timer_edge_cases.c:1041:10:
 warning: comparison of distinct pointer types ('typeof (width) *' (aka
 'unsigned long *') and 'typeof (56) *' (aka 'int *'))
Message-ID: <202511221704.N7A7zwVw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "Łukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git must-be-lval
head:   ddd6ff4d1945e2040067848741c3e94855fd43c7
commit: fad4cf944839da7f5c3376243aa353295c88f588 [546/16507] KVM: arm64: selftests: Determine effective counter width in arch_timer_edge_cases
:::::: branch date: 3 weeks ago
:::::: commit date: 6 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221704.N7A7zwVw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 20c323aa0e5dea6f3d340c721c5cee30801db850)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221704.N7A7zwVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221704.N7A7zwVw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arm64/arch_timer_edge_cases.c:1041:10: warning: comparison of distinct pointer types ('typeof (width) *' (aka 'unsigned long *') and 'typeof (56) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
    1041 |         width = clamp(width, 56, 64);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:47:45: note: expanded from macro 'clamp'
      47 | #define clamp(val, lo, hi)      min((typeof(val))max(val, lo), hi)
         |                                                  ^~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:33:17: note: expanded from macro 'max'
      33 |         (void) (&_max1 == &_max2);              \
         |                 ~~~~~~ ^  ~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:39:9: note: expanded from macro 'min'
      39 |         typeof(x) _min1 = (x);                  \
         |                ^
>> arm64/arch_timer_edge_cases.c:1041:10: warning: comparison of distinct pointer types ('typeof (width) *' (aka 'unsigned long *') and 'typeof (56) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
    1041 |         width = clamp(width, 56, 64);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:47:45: note: expanded from macro 'clamp'
      47 | #define clamp(val, lo, hi)      min((typeof(val))max(val, lo), hi)
         |                                                  ^~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:33:17: note: expanded from macro 'max'
      33 |         (void) (&_max1 == &_max2);              \
         |                 ~~~~~~ ^  ~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:39:21: note: expanded from macro 'min'
      39 |         typeof(x) _min1 = (x);                  \
         |                            ^
>> arm64/arch_timer_edge_cases.c:1041:10: warning: comparison of distinct pointer types ('typeof ((typeof (width))({
       typeof (width) _max1 = (width);
       typeof (56) _max2 = (56);
       (void)(&_max1 == &_max2);
       _max1 > _max2 ? _max1 : _max2;
   })) *' (aka 'unsigned long *') and 'typeof (64) *' (aka 'int *')) [-Wcompare-distinct-pointer-types]
    1041 |         width = clamp(width, 56, 64);
         |                 ^~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:47:28: note: expanded from macro 'clamp'
      47 | #define clamp(val, lo, hi)      min((typeof(val))max(val, lo), hi)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/kernel.h:41:17: note: expanded from macro 'min'
      41 |         (void) (&_min1 == &_min2);              \
         |                 ~~~~~~ ^  ~~~~~~
   3 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
