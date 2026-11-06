Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000527;
	b=dkn3xUxlUv6fiELSiQyTdmCqY/1n0hbofcat8YzzcJ95eZ6d2N3GKl6KkXaReJNDQ6/J
	 loh6LXDS3HoLCRrK4Ay2/R9yqGLKL+cXUIzb3Zh0O4Ik9r8GokLQcbm1ppReOiDN8yNBP
	 KbIxv6I2Gk+rarPJc9VsPTeAuaU5bfufECyscitsfnkLAOafMUbZCK/2hiIHvY9bFQo87
	 4NMqiq6jR8mLZDSBUe2jFAuJqMCJ4Y9V1ZHI/Rk8xcsmG9ymEmv9iPL0LXgyr9v0cDc06
	 DtO/+qnbMzyjhqNSzpktosa3d3lIPQfI7DHQI02nuhvGgpFCIWNd5RgtgPBrgbwL+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000527;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XkSwSxk/YP9Pvpob2a+uQCVfmHRlcCHuwRypVWOdugA=;
	b=b7uBZBUpvMPXRnb7SASBVLnfMNzDcjzQZ+ldDJu45VJ523lGrbq7uGO4IsWhzxm7eJh2
	 LG/jLGuEigZCDR4/Sub91yMUgQkl/hHA+8sk1lf3NetATdGZaCF7Ty3AbqteUvQOB7WqN
	 rczYiW14pUgD3NwrxGJzAwgk2M4xX7yGRCLfV7AoiG2zLxxbh+PTOf0CA2dNx8rxr/azL
	 AdndNIotPLZTtRlzt8ITCw88wQOyknkJU+q97gGUsASigfE61oKRR++j1r0eZ6M8SdbQF
	 79esjuRXfdtoe1Bii4ShqBC8NqOwtffp3o/vynC9XN5vVH/Z1QL7rHe+TLyg6UFJ/fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZbjEHJ4y;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ACB606A326
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 21:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79ACB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZbjEHJ4y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794000526; x=1825536526;
  h=date:from:to:cc:subject:message-id;
  bh=S6n62sgFG67f+M6hkq4qxx35tBRqkE7XNx71JU2BiqA=;
  b=ZbjEHJ4yJLNRh2EdHV3kJeW75417WzBvtj61tv3tQNg/Rx4KytCO91ZF
   YEgGNoFhiHOOcKST03MSAN9TZUra5CoIBl1wYz9cp0QygErXL52wxUAC4
   RAN8mz9t5ZbZArH0jP6Y2Y5cfOMWSXJtCwCLkpciMSy1B5k+6cLyVwf+p
   AB/LgB5EMHyAT/MivR6/WfAizjpj4407ro10JqGSgx7rgfzleYSqhPDQJ
   xNFeI0Ja66WzJ2pFe1JsPFq413Yvuay5A7IZbOSv3vUN9LE2LvNVoqxQc
   OyUD7g62d5EDEmcfYVunNptASiPM1U1ycRl4cdNxh/ZVm0rVj0mLqA/6+
   Q==;
X-CSE-ConnectionGUID: NqFJc9teQTGdurNIzRj3hQ==
X-CSE-MsgGUID: ZhpfbJMdT+WIzW+r8lubmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2689539"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2689539"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 13:28:45 -0800
X-CSE-ConnectionGUID: eKvoOqDnQ1yO4F1ee8fE1Q==
X-CSE-MsgGUID: m2Exx8DMRPG3K77IWScWXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7527323"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 06 Nov 2026 13:28:43 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPRUH-00000000AMp-32Nf;
	Fri, 06 Nov 2026 21:28:41 +0000
Date: Fri, 06 Nov 2026 22:27:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-unstable 225/232]
 include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
Message-ID: <202611062257.ftU96AH4-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Abhishek Bapat <abhishekbapat@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   a3d27154a205f6b32000e7e2734b2a6a4d22c65b
commit: cb335644ac2611749ab17d3eb6f29c8f77450fa6 [225/232] alloc_tag-introduce-ioctls-to-toggle-allocation-tracepoints-fix-fix
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arc-randconfig-r2306-20261106 (https://download.01.org/0day-ci/archive/20261106/202611062257.ftU96AH4-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611062257.ftU96AH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611062257.ftU96AH4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/tpm/tpm-buf.c: note: in included file (through include/linux/percpu.h, include/linux/radix-tree.h, include/linux/idr.h, include/linux/kernfs.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
   drivers/char/tpm/tpm-buf.c:256:16: sparse: sparse: cast to restricted __be16
   drivers/char/tpm/tpm-buf.c:256:16: sparse: sparse: cast to restricted __be16
   drivers/char/tpm/tpm-buf.c:256:16: sparse: sparse: cast to restricted __be16
   drivers/char/tpm/tpm-buf.c:256:16: sparse: sparse: cast to restricted __be16
   drivers/char/tpm/tpm-buf.c:273:16: sparse: sparse: cast to restricted __be32
   drivers/char/tpm/tpm-buf.c:273:16: sparse: sparse: cast to restricted __be32
   drivers/char/tpm/tpm-buf.c:273:16: sparse: sparse: cast to restricted __be32
   drivers/char/tpm/tpm-buf.c:273:16: sparse: sparse: cast to restricted __be32
   drivers/char/tpm/tpm-buf.c:273:16: sparse: sparse: cast to restricted __be32
   drivers/char/tpm/tpm-buf.c:273:16: sparse: sparse: cast to restricted __be32
--
   drivers/char/tpm/tpmrm-dev.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm2-sessions.c: note: in included file (through include/linux/percpu.h, include/linux/radix-tree.h, include/linux/idr.h, include/linux/kernfs.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm-dev.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/eventlog/of.c: note: in included file (through include/linux/percpu.h, include/linux/radix-tree.h, include/linux/idr.h, include/linux/kernfs.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/eventlog/tpm2.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/eventlog/common.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm-chip.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm_i2c_nuvoton.c: note: in included file (through include/linux/percpu.h, include/linux/radix-tree.h, include/linux/idr.h, include/linux/kernfs.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm-interface.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm_tis_i2c.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm-sysfs.c: note: in included file (through include/linux/percpu.h, include/linux/radix-tree.h, include/linux/idr.h, include/linux/kernfs.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm2-space.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm-dev-common.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm1-cmd.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/eventlog/tpm1.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm2-cmd.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/tpm_tis_core.c: note: in included file (through include/linux/percpu.h, include/linux/radix-tree.h, include/linux/idr.h, include/linux/kernfs.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/st33zp24/i2c.c: note: in included file (through include/linux/percpu.h, include/linux/radix-tree.h, include/linux/idr.h, include/linux/kernfs.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline
--
   drivers/char/tpm/st33zp24/st33zp24.c: note: in included file (through include/linux/workqueue.h, include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
>> include/linux/alloc_tag.h:159:24: sparse: sparse: duplicate inline

vim +159 include/linux/alloc_tag.h

de2b74665eaae2 Abhishek Bapat 2026-11-04  158  
cb335644ac2611 Andrew Morton  2026-11-06 @159  static __always_inline inline bool alloc_tag_is_traced(const struct alloc_tag *tag)
6d1be081119059 Abhishek Bapat 2026-11-04  160  {
de2b74665eaae2 Abhishek Bapat 2026-11-04  161  	return !!(atomic_read(&tag->ct.flags) & CODETAG_FLAG_TRACE_ON);
de2b74665eaae2 Abhishek Bapat 2026-11-04  162  }
de2b74665eaae2 Abhishek Bapat 2026-11-04  163  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
