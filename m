Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719F469D
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Feb 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771677130; cv=none; b=KSJ5bMHxQzezG7BWqW2JXJvt+Ou1KyIEOw8lZc/SumVGUWvuxBhnZSx2ywMOeuYTACxweYnffBoJH+WldaHaMkwk8SDq/qtVAGCM9nmCp0G6Vo4pahwP8/p1Fk6UyCc0Lzl0gI9Q7sUoMqNIISxyZ6ab9UeDSzOfd7+eHx+rnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771677130; c=relaxed/simple;
	bh=VxKSccP09HpsPgD1ruAcNi2tLoMIB0xcZ/4+kfuxXTY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RbxpqeYx0HHR46ODOieX/Rsh9bDk5m5ZwHkw4bYx5ZayMID1/jPD4fpLztXCdjbGLWcN90XrvvGLVk1EtvNfwj/F/Rz/AAZ65NtP65mhLVgbcCBaLgrN9noSRG53mcfYjbfnaXu0tABH0EwKwvXZkxYApnQ2NWdt6NfbUVh3qFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NStw85lV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NStw85lV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771677127; x=1803213127;
  h=date:from:to:cc:subject:message-id;
  bh=VxKSccP09HpsPgD1ruAcNi2tLoMIB0xcZ/4+kfuxXTY=;
  b=NStw85lVacDCFfyBAF/kqoAXt+1p/agnIczBhP8pkCE5dx7uo81pGGRu
   V+HcgqfgZ/CA0HfdBxZHqfdh4nPO7IaKGvDBVCe3w1W4kkR6ZV98tQteq
   ystHUeGf6QzDz1ba+XXxzMp9maDsX+ba87SsxfmjDixfZ3hzuLZKy8pH7
   N/fzRbrTQN5OWfvKwJjJ/y0q/hoHDvs4nTFC1XigUfa5JeyOw7mfaJn21
   eTAt8AyhdcHKYZ4BIP+fO0gu+gtusjFhoIOwAb1WG8xCsT+Rj4AFCeVuX
   M36TiQZpQIoQtGmw4G0jxHGsSdRniqp7h8gWzPoR4H89unEDgYa8esJJ+
   A==;
X-CSE-ConnectionGUID: 9cmncIDIRc6e6GdELpSrxw==
X-CSE-MsgGUID: /JZ3+7nLT4CUfHic5ijxTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90330531"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="90330531"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 04:32:06 -0800
X-CSE-ConnectionGUID: nVjk19grRCy1X4F/zcgyZA==
X-CSE-MsgGUID: uLeUyNKRSPSvbI4/6jtVvA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2026 04:32:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtm9T-000000014uQ-1nNl;
	Sat, 21 Feb 2026 12:32:03 +0000
Date: Sat, 21 Feb 2026 20:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bjackman:lkp/page_alloc-unmapped 11/20]
 include/linux/freetype.h:98 freetype_idx() warn: maybe use && instead of &
Message-ID: <202602212011.wzxGeqgq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Brendan Jackman <jackmanb@google.com>

tree:   https://github.com/bjackman/linux lkp/page_alloc-unmapped
head:   bde871371ec16d6d1168f9ed687e60ba2e49acd0
commit: 7abd65eac50331c933c3375751b3a8cebb633ed7 [11/20] mm: add definitions for allocating unmapped pages
:::::: branch date: 19 hours ago
:::::: commit date: 21 hours ago
config: m68k-randconfig-r072-20260221 (https://download.01.org/0day-ci/archive/20260221/202602212011.wzxGeqgq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602212011.wzxGeqgq-lkp@intel.com/

smatch warnings:
include/linux/freetype.h:98 freetype_idx() warn: maybe use && instead of &
include/linux/freetype.h:98 freetype_idx() warn: maybe use && instead of &

vim +98 include/linux/freetype.h

7abd65eac50331 Brendan Jackman 2025-11-13   90  
a3ecf22582e90c Brendan Jackman 2025-09-22   91  /*
a3ecf22582e90c Brendan Jackman 2025-09-22   92   * Return a dense linear index for freetypes that have lists in the free area.
a3ecf22582e90c Brendan Jackman 2025-09-22   93   * Return -1 for other freetypes.
a3ecf22582e90c Brendan Jackman 2025-09-22   94   */
a3ecf22582e90c Brendan Jackman 2025-09-22   95  static inline int freetype_idx(freetype_t freetype)
a3ecf22582e90c Brendan Jackman 2025-09-22   96  {
7abd65eac50331 Brendan Jackman 2025-11-13   97  	/* For FREETYPE_UNMAPPED, only MIGRATE_UNMOVABLE has an index. */
7abd65eac50331 Brendan Jackman 2025-11-13  @98  	if (freetype.flags & FREETYPE_UNMAPPED) {
7abd65eac50331 Brendan Jackman 2025-11-13   99  		VM_WARN_ON_ONCE(freetype.flags & ~FREETYPE_UNMAPPED);
7abd65eac50331 Brendan Jackman 2025-11-13  100  		if (!IS_ENABLED(CONFIG_PAGE_ALLOC_UNMAPPED))
7abd65eac50331 Brendan Jackman 2025-11-13  101  			return -1;
7abd65eac50331 Brendan Jackman 2025-11-13  102  		if (freetype.migratetype != MIGRATE_UNMOVABLE)
7abd65eac50331 Brendan Jackman 2025-11-13  103  			return -1;
7abd65eac50331 Brendan Jackman 2025-11-13  104  		return MIGRATE_TYPES;
7abd65eac50331 Brendan Jackman 2025-11-13  105  	}
7abd65eac50331 Brendan Jackman 2025-11-13  106  	/* No other flags are supported. */
7abd65eac50331 Brendan Jackman 2025-11-13  107  	VM_WARN_ON_ONCE(freetype.flags);
7abd65eac50331 Brendan Jackman 2025-11-13  108  
a3ecf22582e90c Brendan Jackman 2025-09-22  109  	return freetype.migratetype;
a3ecf22582e90c Brendan Jackman 2025-09-22  110  }
a3ecf22582e90c Brendan Jackman 2025-09-22  111  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
