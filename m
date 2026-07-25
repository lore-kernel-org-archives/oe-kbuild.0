Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F288221739
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785010881; cv=none; b=OPiY0OxcBNAY7tIm5PWnRAXYa5pfhFaVdUwDO/yC3u+E6ERd9EHSbsLfbWbSvL2/5sN2htNV5rY7vTh+Y/mHMvpyQeIt5eaSipCNlwbVKbuF7dl1m3fcuU4QHpULCuJwjalEQCnysl5ZUCplli8G2yFQd7IcrkSV9YSVcpNEDJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785010881; c=relaxed/simple;
	bh=ZYlIvySy04CLk5efDzbiw7x9S6Czuf1O+urOxolZ/34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p6VKWdCM56GhYJl6S+mnd47eZ2ZaLgHCc7uH1LvpzKgCmyLmqPLyHmrfKbSrUkgoQ1xVrvv/1bPP0Hm7/R/E4+1BtsT9VDMdhDEXmjL5LwJBfXvKoxMlxen7lVIOeVamutkRe+cUPX1I+TSWnIBOIzAdTiQ1YsoRuDK6wEWzOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoS6ZU2/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoS6ZU2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785010878; x=1816546878;
  h=date:from:to:cc:subject:message-id;
  bh=ZYlIvySy04CLk5efDzbiw7x9S6Czuf1O+urOxolZ/34=;
  b=WoS6ZU2/jKsGJhSDF/UXXI9cwhJ4vkxuqKNiyi/7UHifoLu5rKJ2Mrqw
   lnnpAQvReUzagC2ag5z3COSj3CFt6JQPlgvBzoZ0wdZUooh/XnfMDNmBU
   FxPVyUgvvxRNQ3n2FV2a7FzqSYKt4qBNp7ouGwifch7F0HpYGXiBhxRQ2
   /16SoF2LarZ71FY3QY0VnMyQd1YZRtAoqNJimNa3yAdX2pcWM1B9Jwi8H
   hzAg8ZspdOzqSZL/wAyzqtCY1X0IsgrJvAOy1OJQOcZyCWrbuolzQAdda
   UVKY8jt8Ij99GSrzb8aakKt4CkkoV2CV0U63+XKSzwUo7e3rtpw1korTG
   A==;
X-CSE-ConnectionGUID: QfpyrIDWRC2FaSCNY9BHvQ==
X-CSE-MsgGUID: AlFlWwDFS2uEkMDVGxYaKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="73179601"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="73179601"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 13:21:17 -0700
X-CSE-ConnectionGUID: j+ozCGxqQTGOMb50kD5Sfw==
X-CSE-MsgGUID: tXVI9TG2QYGAVxiGbDdTGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="297249589"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Jul 2026 13:21:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnirw-00000000c3y-33Ju;
	Sat, 25 Jul 2026 20:21:13 +0000
Date: Sun, 26 Jul 2026 04:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-misc:lazy-bounce 15/23] include/linux/iomap.h:433
 iomap_ioend_flags() warn: bitwise AND condition is false here
Message-ID: <202607260343.sWmOglrO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git lazy-bounce
head:   50dcf0b97beec0605157d1bb4b7c5d776498d7a4
commit: b5be06d0686d2a68d7076ff8a4c6c40ae7fa8c33 [15/23] iomap: add a IOMAP_IOEND_INTEGRITY flag
:::::: branch date: 32 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260725 (https://download.01.org/0day-ci/archive/20260726/202607260343.sWmOglrO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607260343.sWmOglrO-lkp@intel.com/

New smatch warnings:
include/linux/iomap.h:433 iomap_ioend_flags() warn: bitwise AND condition is false here
include/linux/iomap.h:433 iomap_ioend_flags() warn: bitwise AND condition is false here

Old smatch warnings:
fs/xfs/xfs_aops.c:676 xfs_zoned_writeback_submit() warn: bitwise AND condition is false here

vim +433 include/linux/iomap.h

71027333066324 Christoph Hellwig 2025-02-06  415  
71027333066324 Christoph Hellwig 2025-02-06  416  /*
71027333066324 Christoph Hellwig 2025-02-06  417   * Flags that if set on either ioend prevent the merge of two ioends.
71027333066324 Christoph Hellwig 2025-02-06  418   * (IOMAP_IOEND_BOUNDARY also prevents merges, but only one-way)
71027333066324 Christoph Hellwig 2025-02-06  419   */
71027333066324 Christoph Hellwig 2025-02-06  420  #define IOMAP_IOEND_NOMERGE_FLAGS \
34ecde3c56066b Jens Axboe        2025-05-27  421  	(IOMAP_IOEND_SHARED | IOMAP_IOEND_UNWRITTEN | IOMAP_IOEND_DIRECT | \
b5be06d0686d2a Christoph Hellwig 2026-07-07  422  	 IOMAP_IOEND_DONTCACHE | IOMAP_IOEND_INTEGRITY)
71027333066324 Christoph Hellwig 2025-02-06  423  
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  424  /* ioend flags directly implied by iomap flags */
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  425  static inline u16 iomap_ioend_flags(const struct iomap *iomap)
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  426  {
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  427  	unsigned int flags = 0;
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  428  
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  429  	if (iomap->type == IOMAP_UNWRITTEN)
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  430  		flags |= IOMAP_IOEND_UNWRITTEN;
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  431  	if (iomap->flags & IOMAP_F_SHARED)
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  432  		flags |= IOMAP_IOEND_SHARED;
b5be06d0686d2a Christoph Hellwig 2026-07-07 @433  	if (iomap->flags & IOMAP_F_INTEGRITY)
b5be06d0686d2a Christoph Hellwig 2026-07-07  434  		flags |= IOMAP_IOEND_INTEGRITY;
b5be06d0686d2a Christoph Hellwig 2026-07-07  435  
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  436  	return flags;
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  437  }
9fbcaa255d9aa7 Christoph Hellwig 2026-07-19  438  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
