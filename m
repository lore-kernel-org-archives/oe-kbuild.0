Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BFF3EB80B
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354812; cv=none; b=UfPRHM+TLsN6LJQfsxYmePsYc1XljH93TfRWY6gXQdXKOdfzEFrMa6bphVjXF+2ZRdRl/+WaZOCZEiwe6FHZ/FF8Jd98CAKADmRzhoferqPSRAx4UD84L1o2nYtvMw+74SdIoRz5uYi0W6IkgirwJHqjb6rwhLmoFoBkufl2pDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354812; c=relaxed/simple;
	bh=p1dEz2sQpER7O3EJcy0Za9bKoZNONbbNd7qlzad0HsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MYLL4/4XosHtVfZvGChVvmL8CKZaTP3x5hhdtV/7LwSgRxmMTobgVmCZugFWPgfXFScvnAGdqtJgMsve7ixPMo0zzRGY2zl+b9n5E3CyFAqoHZDIpMr/UUVjfRlZPI8kw8xntCsSnS0mBWTh3h0kL8MkZFn2NcsXksOftfQtxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdSx49fy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdSx49fy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774354810; x=1805890810;
  h=date:from:to:cc:subject:message-id;
  bh=p1dEz2sQpER7O3EJcy0Za9bKoZNONbbNd7qlzad0HsA=;
  b=EdSx49fyzHCe7nYpeE4RTW3WDjERylOSvn3HjCC6CTLoxVJ2w5E+fH2g
   Z2NXq+t2B8ZhShaYzgHXesYETTzOeYomERQcPuTiwslxJ9JN73/TdUEJn
   OfeLi8PvrRrb5Z8iVXmhNu4NKd/tNfvsaYQB+2uH+a99yKC+yJ20/cYqK
   wIYqNfB4Z/uBsDRMpwmVfelvtyOWfpfdmEkN5qG9h/mQWfRaPTAxkIz3P
   7rxTKQcFGzTgvnNZ5AaBj/XK2KU+SphYHK81GN2NyACJ4Q8rMz4vpEEHs
   T1QycuXXT7aQwv6TQtET97hvv3nW65MNcT/4FtEYSzzC7X/1HMBeN1AE6
   g==;
X-CSE-ConnectionGUID: Rjg5Bc8rQiuYlO3zXVCzOg==
X-CSE-MsgGUID: Gx5pqVGbSU62ppBRJrgnyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="74390524"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="74390524"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 05:20:08 -0700
X-CSE-ConnectionGUID: rVtHaNeVSZuySD4iKhyW6g==
X-CSE-MsgGUID: HyjswhshShyOfj9xnD82iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="225982222"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Mar 2026 05:20:07 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w50jt-000000004X3-0n42;
	Tue, 24 Mar 2026 12:20:05 +0000
Date: Tue, 24 Mar 2026 20:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 72/139]
 lib/raid/xor/arm64/xor-neon.c:189:9: sparse: sparse: Trying to use reserved
 word 'return' as identifier
Message-ID: <202603242019.TNDDV3Xj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/xor/arm64/xor-neon.c:189:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   5d52decfc868efa2049fafb60878067b6588739d
commit: 66f92b2415cc4cf34d1387aa253eec7ce6c7d5a0 [72/139] arm64: move the XOR code to lib/raid/
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-r122-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242019.TNDDV3Xj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242019.TNDDV3Xj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603242019.TNDDV3Xj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35788:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35790:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35790:1: sparse: sparse: got __o
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35790:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35790:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35790:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35790:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35790:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35790:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35791:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35793:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35793:1: sparse: sparse: got __o
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35793:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35793:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35793:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35793:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35793:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35793:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35807:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35807:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35814:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35814:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35821:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35821:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35829:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35829:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35837:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35837:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35845:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35845:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35852:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35852:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35860:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35860:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35868:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35868:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35876:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35876:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35885:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35885:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35892:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35892:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35899:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35899:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35908:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35908:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35915:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35915:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35922:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35922:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35929:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35929:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35936:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35936:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35943:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35943:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35950:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:35950:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:18:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:18:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:47:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:47:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:85:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:85:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:132:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:132:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:182:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:182:26: sparse: sparse: got eor3
>> lib/raid/xor/arm64/xor-neon.c:189:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/xor/arm64/xor-neon.c:189:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:189:16: sparse: sparse: got res
   lib/raid/xor/arm64/xor-neon.c:190:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:190:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:201:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:201:29: sparse: sparse: got v0
>> lib/raid/xor/arm64/xor-neon.c:204:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:204:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:204:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:216:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:216:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:217:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:217:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:218:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:218:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:219:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:219:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:221:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:221:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:222:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:222:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:223:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:223:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:224:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:224:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:225:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:225:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:238:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:238:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:241:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:241:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:241:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:259:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:259:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:260:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:260:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:261:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:261:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:262:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:262:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:264:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:264:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:265:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:265:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:266:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:266:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:267:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:267:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:268:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:268:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:269:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:269:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:284:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:284:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:287:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:287:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:287:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:305:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:305:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:306:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:306:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:307:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:307:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:308:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:308:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:310:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:310:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:311:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:312:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:312:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:313:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:313:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:314:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:314:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:315:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:315:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:316:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:316:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:322:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:322:37: sparse: sparse: got .
   lib/raid/xor/arm64/xor-neon.c:323:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:323:37: sparse: sparse: got .
   lib/raid/xor/arm64/xor-neon.c:324:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:324:9: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3164:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3164:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3171:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3171:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3178:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3178:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3185:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3185:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3192:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3192:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3199:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3199:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3206:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3206:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3213:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3213:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3220:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3220:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3227:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3227:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3234:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3234:10: sparse: sparse: bad constant expression type

vim +/return +189 lib/raid/xor/arm64/xor-neon.c

cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  181  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  182  static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  183  {
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  184  	uint64x2_t res;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  185  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  186  	asm(ARM64_ASM_PREAMBLE ".arch_extension sha3\n"
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  187  	    "eor3 %0.16b, %1.16b, %2.16b, %3.16b"
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  188  	    : "=w"(res) : "w"(p), "w"(q), "w"(r));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13 @189  	return res;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  190  }
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  191  
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  192  static void xor_arm64_eor3_3(unsigned long bytes,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  193  	unsigned long * __restrict p1,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  194  	const unsigned long * __restrict p2,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  195  	const unsigned long * __restrict p3)
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  196  {
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  197  	uint64_t *dp1 = (uint64_t *)p1;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  198  	uint64_t *dp2 = (uint64_t *)p2;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  199  	uint64_t *dp3 = (uint64_t *)p3;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  200  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  201  	register uint64x2_t v0, v1, v2, v3;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  202  	long lines = bytes / (sizeof(uint64x2_t) * 4);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  203  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13 @204  	do {
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  205  		/* p1 ^= p2 ^ p3 */
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  206  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  207  			  vld1q_u64(dp3 + 0));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  208  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  209  			  vld1q_u64(dp3 + 2));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  210  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  211  			  vld1q_u64(dp3 + 4));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  212  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  213  			  vld1q_u64(dp3 + 6));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  214  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  215  		/* store */
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  216  		vst1q_u64(dp1 + 0, v0);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  217  		vst1q_u64(dp1 + 2, v1);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  218  		vst1q_u64(dp1 + 4, v2);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  219  		vst1q_u64(dp1 + 6, v3);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  220  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  221  		dp1 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  222  		dp2 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  223  		dp3 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  224  	} while (--lines > 0);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  225  }
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  226  

:::::: The code at line 189 was first introduced by commit
:::::: 2c54b423cf85baed5ad9f9546f6c8ea741774a06 arm64/xor: use EOR3 instructions when available

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
