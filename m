Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82A10F0
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786199648; cv=none; b=KKks/wmVuy3Bvow08frPEpAqYYdZaCHtI/cFhSGl4FE6gR1vBN/0wd6mZoURWtJKrF/nzzUeOY7rnfYHLXY6e7xE9UY3VlIMUiGpS8Enanx/OSjVfB0UKGNJQMq+ezUF+CAuR+lbvPFFQAassvFeseEiX8Z1f9cJLlFlCS9GIw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786199648; c=relaxed/simple;
	bh=N1ctxLhwW6GyIeL/ijO8ncERCyxRoDo/cFmn+hmRF/s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t2vMAxRTyq/mXRJKsl/CvHQqaBdplrM0X5VFTNISUwvXY8xmscSxbCFa2YRsLShCRcYBc/yrfrb7keLBvxfBVahQAUYk4jzeL9WeOZJ7yo/qKTT3AhI7haDTQNvVxwXBYiproAByfSQaoIpPVkNlmNQV7g7TClBj85S67jjBytM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sn7rrs9U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sn7rrs9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786199646; x=1817735646;
  h=date:from:to:cc:subject:message-id;
  bh=N1ctxLhwW6GyIeL/ijO8ncERCyxRoDo/cFmn+hmRF/s=;
  b=Sn7rrs9UajqqjWFL3ZMxGW6/jIDjf+JJ8hYoDOgZPzjjl7lp0PzqmC/o
   CU9NE4eRMcLAwhECpxeNiMdec8Mx32GHzmJuuBkoyjWw8LHFw5yCh0vdH
   cbKqyYmEYVoDqMDUpPVMvr7eiWOKa+ZBgfpo8p5wVKbcrd4W4kGeOuOrT
   Wk077DUKOUmG8oML4PI+oXrz+DFxdRcLH44HN348/meA1P+cinWE2Ztf8
   EE26T+LN0sePmt+COyv+2T+E+be6v3+aJfjyuUyM2MYIpqDgICLpNWiUA
   tYbFTJxI9Gd9Moz3WuqpyX64s4qkhExjgh025taZAWHpMQNFmgWEXwO8V
   w==;
X-CSE-ConnectionGUID: MC9KqvHzQm+QJOa5rpupqw==
X-CSE-MsgGUID: Sp89xwH3STillrHUdFMlNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="104316272"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="104316272"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 07:34:05 -0700
X-CSE-ConnectionGUID: M6nR70upRyaMkTKNUBPKEw==
X-CSE-MsgGUID: D7W5xK1sSQuxMKYKVu3zuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="267807195"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Aug 2026 07:34:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsi7e-00000000KGf-3MQP;
	Sat, 08 Aug 2026 14:34:02 +0000
Date: Sat, 08 Aug 2026 22:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 0/1] mm/slub.c:775:31:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202608082211.XpNvDSlE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/slub.c:775:31: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Harry,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   749a6f9d41aa0bad1b1893ebae8598ca7875d09e
commit: b6e5cef4d6df31f7e61f2e2713b3358a0b48f7e7 [0/1] mm/slab: use unsigned long for orig_size to ensure proper metadata align
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-122-20260808 (https://download.01.org/0day-ci/archive/20260808/202608082211.XpNvDSlE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608082211.XpNvDSlE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608082211.XpNvDSlE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/slub.c:775:31: sparse: sparse: unsigned value that used to be signed checked against zero?
   mm/slub.c:1616:34: sparse: signed value source
   mm/slub.c:3179:55: sparse: sparse: context imbalance in '__put_partials' - unexpected unlock
   mm/slub.c:4475:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock

vim +775 mm/slub.c

b789ef518b2a72 Christoph Lameter 2011-06-01  752  
59090e479ac78a Peng Fan          2024-08-29  753  /*
59090e479ac78a Peng Fan          2024-08-29  754   * kmalloc caches has fixed sizes (mostly power of 2), and kmalloc() API
59090e479ac78a Peng Fan          2024-08-29  755   * family will round up the real request size to these fixed ones, so
59090e479ac78a Peng Fan          2024-08-29  756   * there could be an extra area than what is requested. Save the original
59090e479ac78a Peng Fan          2024-08-29  757   * request size in the meta data area, for better debug and sanity check.
59090e479ac78a Peng Fan          2024-08-29  758   */
59090e479ac78a Peng Fan          2024-08-29  759  static inline void set_orig_size(struct kmem_cache *s,
b6e5cef4d6df31 Harry Yoo         2026-01-13  760  				void *object, unsigned long orig_size)
59090e479ac78a Peng Fan          2024-08-29  761  {
59090e479ac78a Peng Fan          2024-08-29  762  	void *p = kasan_reset_tag(object);
59090e479ac78a Peng Fan          2024-08-29  763  	unsigned int kasan_meta_size;
59090e479ac78a Peng Fan          2024-08-29  764  
59090e479ac78a Peng Fan          2024-08-29  765  	if (!slub_debug_orig_size(s))
59090e479ac78a Peng Fan          2024-08-29  766  		return;
59090e479ac78a Peng Fan          2024-08-29  767  
59090e479ac78a Peng Fan          2024-08-29  768  	/*
59090e479ac78a Peng Fan          2024-08-29  769  	 * KASAN can save its free meta data inside of the object at offset 0.
59090e479ac78a Peng Fan          2024-08-29  770  	 * If this meta data size is larger than 'orig_size', it will overlap
59090e479ac78a Peng Fan          2024-08-29  771  	 * the data redzone in [orig_size+1, object_size]. Thus, we adjust
59090e479ac78a Peng Fan          2024-08-29  772  	 * 'orig_size' to be as at least as big as KASAN's meta data.
59090e479ac78a Peng Fan          2024-08-29  773  	 */
59090e479ac78a Peng Fan          2024-08-29  774  	kasan_meta_size = kasan_metadata_size(s, true);
59090e479ac78a Peng Fan          2024-08-29 @775  	if (kasan_meta_size > orig_size)
59090e479ac78a Peng Fan          2024-08-29  776  		orig_size = kasan_meta_size;
59090e479ac78a Peng Fan          2024-08-29  777  
59090e479ac78a Peng Fan          2024-08-29  778  	p += get_info_end(s);
59090e479ac78a Peng Fan          2024-08-29  779  	p += sizeof(struct track) * 2;
59090e479ac78a Peng Fan          2024-08-29  780  
b6e5cef4d6df31 Harry Yoo         2026-01-13  781  	*(unsigned long *)p = orig_size;
59090e479ac78a Peng Fan          2024-08-29  782  }
59090e479ac78a Peng Fan          2024-08-29  783  

:::::: The code at line 775 was first introduced by commit
:::::: 59090e479ac78ae18facd4c58eb332562a23020e mm, slub: avoid zeroing kmalloc redzone

:::::: TO: Peng Fan <peng.fan@nxp.com>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
