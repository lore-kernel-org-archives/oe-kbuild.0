Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC603E5A3D
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 15:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782488193; cv=none; b=lwACNwgycVORw2J6f+m+0b3rLQYq8CERHXq2wuM8OjZXAOZrjEQ18qROM77lAMz+bWjpNEyUzKsbLCTxrHYP37RvCeX44t1bg9IYFk4fSA1OfIryiXtOTBHkBoXgdNIl1cs19UBhShHlLdaa5h3AdtN42ge3uS76vrJLS70Phgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782488193; c=relaxed/simple;
	bh=FhaVN9GHPE2ztNd0+foTZaU3bCKXVAXzMUwx1vqk5OU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gk9+/gMXyJpK4Qy0uNQf4Yeov+tsH3jAuUl04KiZ7SVdHTMmsl/rx5Hu59zwFVehF0GSpb11QchNbSXu5tOhdN/tH+J6ggQKQ8bwznJgwBuWyKCYWNiFWkX4cbNDeEUbdoMkiQzZnPIJB9LruBcJvfYkfatxRRbPplvX9Afk3sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J63zNvLc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J63zNvLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782488190; x=1814024190;
  h=date:from:to:cc:subject:message-id;
  bh=FhaVN9GHPE2ztNd0+foTZaU3bCKXVAXzMUwx1vqk5OU=;
  b=J63zNvLcortLOHFgCcv7n6p5wp1KuPQAJaBe0LgKYmJRREXax+iLiD0X
   680lO2jOczjlGa/eQYZ0BBQQSUXL3DBrU7SYJ3pZgH4xfVqFpyDGj7ojh
   jyMaAa+SwWMo9cZ+b+vYYguF37stLDECHebLICZpVct33Rv17hUhRTS8h
   TDlOGyCg48VEULce6AT7xA3+RaAM5+yicy0tiFiSxlCzU4sRmwh8z35fQ
   0Sblv1jPn+nVrZ2ecogca4vrbzcZdFYPKJ2NFejdCaQ6xuQFc9xFPo4d9
   Du2Ok8wlkHj6R6bXO01FPhBYo8V1unWtp/yNcQOfeNsrqw9I3F0XiUfhZ
   w==;
X-CSE-ConnectionGUID: j/xmify2T4ap6aGafGiPBg==
X-CSE-MsgGUID: JRU+09VgR7ykNNerC9augA==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="93635298"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="93635298"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 08:36:29 -0700
X-CSE-ConnectionGUID: Drt5eExOS2GeXlirI609LQ==
X-CSE-MsgGUID: d0gsmhtcTD+VlwQT82sr0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="250271812"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Jun 2026 08:36:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd8bS-000000005C9-02oS;
	Fri, 26 Jun 2026 15:36:26 +0000
Date: Fri, 26 Jun 2026 23:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.12/emt 2/2] mm/slub.c:775:31: sparse: sparse:
 unsigned value that used to be signed checked against zero?
Message-ID: <202606262356.YG6QBIpn-lkp@intel.com>
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

Hi Harry,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   efa0eceac635132225b11aaee467c1452a2b775c
commit: b6e5cef4d6df31f7e61f2e2713b3358a0b48f7e7 [2/2] mm/slab: use unsigned long for orig_size to ensure proper metadata align
:::::: branch date: 4 weeks ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r122-20260626 (https://download.01.org/0day-ci/archive/20260626/202606262356.YG6QBIpn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606262356.YG6QBIpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606262356.YG6QBIpn-lkp@intel.com/

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
