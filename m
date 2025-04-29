Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3DC213E67
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951998; cv=none; b=qxXWtB+OXnZgtm+yGGp6e7NJFemUe62tJjR5Qswsam4O5wyrz+/CIZDBINmaQLZx7rc2qe6PT9LGUTjzqjBxqkqZ6js9d21efvt/QbbDyGoS5aVAtcAa1vp+SptnECTPAa8hxHvwYKEHINqgdvcq1ZMXywio+ifLfQ6bzFx6lrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951998; c=relaxed/simple;
	bh=yWSiD8vXCFAPQzlGrQv/XoCNdL1SDhlj1XOsBxs5jGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sy7oYhMNuaL5O2a4PiwCKsmkAsjN20/e3gtnrIsuYEy/M+AcTbKaKkE+frDCRgo1JVLppgWcKml4+1BCiinO4Z6jnEvEHATtyjD85+yG3EQCR9o9kai77DM0qolw5Aytcrxi0VclEgljFZD66nOVfc9SraX4ixJoM+nDxQ5VvhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwfBA/4S; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwfBA/4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745951995; x=1777487995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yWSiD8vXCFAPQzlGrQv/XoCNdL1SDhlj1XOsBxs5jGA=;
  b=SwfBA/4SMg/5ZEutwy0ryzUjN/N4kWltQA417Y5UoqtyOH8EZ2taA1JI
   dko30Eps/+vv+V2ZZqjXQaIS+wYFd3p0NPqnlJBEpcAOlc8GNPKm0aySX
   F5QOxL1w9XVxX5pc8aR5JJe5JIBm3qBdpcyURkY0uKKrfAIIyW8nI/pea
   U8oMcNAq1NP0d0d86feLjgTDMj5eWgNUCwJJmWEOf5uOb4YX1a2cGBie6
   9Ix7fhWsQBxv5pHpldGMkp4pVR0VKU6OCdZ9Omp5H0dj5jjozkLtk0ULX
   KQlsY6PuMnaQ24SQxoaFv/FqsqhbhS8GM+2FfEcf6InEjDh1QCR6RmNUd
   Q==;
X-CSE-ConnectionGUID: TUgSQ/PNSb6ELvOE3uRYKw==
X-CSE-MsgGUID: WD3LEhLrSzyovYnvAmXgvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47501332"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47501332"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 11:39:45 -0700
X-CSE-ConnectionGUID: NAUT/EKjQImWAIQmUfE+QA==
X-CSE-MsgGUID: Hz4tT/N2RXmMn1tleFXgMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="134227561"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2025 11:39:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9prq-0002qb-2z;
	Tue, 29 Apr 2025 18:39:42 +0000
Date: Wed, 30 Apr 2025 02:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.10 0/1] include/linux/export.h:
 linux/compiler.h is included more than once.
Message-ID: <202504300244.L4Cg1wSl-lkp@intel.com>
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
head:   f2b154db6f931fdc2e65c1b0eeaf67f5a74f78be
commit: e135c46cdf990c7874f53df6ad6685259409105e [0/1] ANDROID: export: cfi: fix ksymtab addresses
:::::: branch date: 3 days ago
:::::: commit date: 4 years, 3 months ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504300244.L4Cg1wSl-lkp@intel.com/

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
