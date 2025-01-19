Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98318C31
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 23:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737329713; cv=none; b=aVHLZfElbMRUYKdn5Dp5NEH1d7mkr/wb8JsjPh9umx7zM5YPzuy+yGtvx+vonnUb4cmo7f2HL7qH7nPuzxxLLBwOkBU5NhNI4yVfEFXF1qwPUy+3MLWeoAVjDIw+vEmPdH9b9lMVNBl0w6slrc8vbtp3r+8S7uVthYps7RznPj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737329713; c=relaxed/simple;
	bh=ke3XAWMN3LoYcUR3dWlcgFc+yNxMsr/A/hYinFSwjLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NbjLNogbmgPSOhNZS+JIJ0Uqh7TSW1kZ5Re0eJTnNXaHvC2lhN6dU1Tij+2QkErNidZDDmqI/PK/OQybB7pbWCE80L2Qdh1h0ocj6BQRVpLBBsF02bivz5dJNjATeFNZvtB34J1Co4J0DM5iAlduZRz7jzWdF1hs8wxQM+5vLwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvasmLF+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvasmLF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737329711; x=1768865711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ke3XAWMN3LoYcUR3dWlcgFc+yNxMsr/A/hYinFSwjLM=;
  b=GvasmLF+mcq/b8deR8/91w08bKCdOc9wj3LhxaNStXKvPgFdEJaY7xQ+
   89nbdCac3lkgpYuREEXaeTq88QUJjik2hJDLI73tf8JGTWqjJ70sCtyDO
   bHSgX6SRniLOXfUj1mKEUgXKvlHzSj2R+LP9Ge5Qrilr1LJ6tcaMnEpiT
   1xbhEjL63Plh1bbAoulB+evk4FTKhtgeteIC77yUiUnxAFNLTKhM38byr
   nO9NKmCKCO7Tu1BsgnQJDxzTfZNcTRIWq2i4G7KNnO61q2kBU8/KXj3SJ
   tvLnRyEv6ptp4O+cEkUGcKTrjQLDLxhOOy1NAtgK/pG8Jbi05kWKjDuTT
   g==;
X-CSE-ConnectionGUID: VNDqQ+hZQ9CymOqWt61JMw==
X-CSE-MsgGUID: N9oaJDZdSKOlbEXw0m7T1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37705848"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="37705848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 15:35:10 -0800
X-CSE-ConnectionGUID: wjdOYWdZRly28n4a4eug8g==
X-CSE-MsgGUID: eilJNVzaSyWbrw/l3ljbzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="106123267"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jan 2025 15:35:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZeot-000VwZ-0j;
	Sun, 19 Jan 2025 23:35:07 +0000
Date: Mon, 20 Jan 2025 07:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.10 1/1] include/linux/export.h:
 linux/compiler.h is included more than once.
Message-ID: <202501200758.GykTFnhk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   cbc1671ddfcc68474cdc36ec0522cdea9e64af55
commit: e135c46cdf990c7874f53df6ad6685259409105e [1/1] ANDROID: export: cfi: fix ksymtab addresses
:::::: branch date: 4 days ago
:::::: commit date: 4 years ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501200758.GykTFnhk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/export.h: linux/compiler.h is included more than once.

vim +43 include/linux/export.h

    41	
    42	#ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
  > 43	#include <linux/compiler.h>
    44	/*
    45	 * Emit the ksymtab entry as a pair of relative references: this reduces
    46	 * the size by half on 64-bit architectures, and eliminates the need for
    47	 * absolute relocations that require runtime processing on relocatable
    48	 * kernels.
    49	 */
    50	#define __KSYMTAB_ENTRY(sym, sec)					\
    51		__ADDRESSABLE(sym)						\
    52		asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
    53		    "	.balign	4					\n"	\
    54		    "__ksymtab_" #sym ":				\n"	\
    55		    "	.long	" #sym "- .				\n"	\
    56		    "	.long	__kstrtab_" #sym "- .			\n"	\
    57		    "	.long	__kstrtabns_" #sym "- .			\n"	\
    58		    "	.previous					\n")
    59	
    60	struct kernel_symbol {
    61		int value_offset;
    62		int name_offset;
    63		int namespace_offset;
    64	};
    65	#else
    66	#ifdef CONFIG_CFI_CLANG
  > 67	#include <linux/compiler.h>
    68	/*
    69	 * With -fno-sanitize-cfi-canonical-jump-tables, the compiler replaces
    70	 * references to functions with jump table addresses. Use inline assembly
    71	 * to emit ksymtab entries that point to the actual function instead.
    72	 */
    73	#define ___KSYMTAB_ENTRY(sym, sec, size)				\
    74		__ADDRESSABLE(sym)						\
    75		asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
    76		    "	.balign " #size "				\n"	\
    77		    "__ksymtab_" #sym ":				\n"	\
    78		    "	." #size "byte	" #sym "			\n"	\
    79		    "	." #size "byte	__kstrtab_" #sym "		\n"	\
    80		    "	." #size "byte	__kstrtabns_" #sym "		\n"	\
    81		    "	.previous					\n")
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
