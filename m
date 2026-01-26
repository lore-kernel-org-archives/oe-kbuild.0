Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219AA13A244
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 00:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769388849; cv=none; b=MZVsRt/fVdqJ4aLhqCxA04ZZ3Anc1jMTWw29OptAiHKTfHXRoQFkb6iky1EMLaiI7PRpamiuDTyYbLtZYGj8xvFbWS8KhMxFvF598Fn5ibfHp8T9kxFzVZ6X7VakGTgv6LKZ1mn7iQO49uP+sN6OQ/K+AZT95x+JW46aRSkOQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769388849; c=relaxed/simple;
	bh=qeb8sM4P9QvQ7+uk7avVKusV5BFYz0akJczj5Yv2JyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MYe8TUGT+wSvkVHYd+AueWJz9Fa8ijKEWmFT8xjV4fTiPczisj/i6nShZ8stFlK5BsnwI8Kdlx7E3kRVUhDIhyfvg4IwsLLZcC+vqKDT40ZmefDdBpmS41GeHTtl11iArBZUzEgR1ZGcZSuQioopy5nXkk3cVvP4UAM4Bopgj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbpWk/Lo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbpWk/Lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769388848; x=1800924848;
  h=date:from:to:cc:subject:message-id;
  bh=qeb8sM4P9QvQ7+uk7avVKusV5BFYz0akJczj5Yv2JyY=;
  b=EbpWk/Lok4x/E20TzTC4FbzC2biYn+NPIe1NwvuQp1NI4zdEbdMq9wbP
   wTFOwOVIskIhBGHZ42sgsje2aUA4T1oiyqRC8PXKXa+Pn9UVmXxVgKJqT
   XPTJ4BtkkPvimzrsXa+7px1LnRsvaKiluCLTsV5q1aEYesHNeVrZjOpM+
   0kJsSm27zul1hjQTlg+aDtoOu+VroWakX9oIBQ4dqQ0eN3o5oKBE/0RI9
   0SGEsQ32aH98FA4oKWV3Ggerub3zFwWzxsTGDLTxph372ANEpU2LxG6o/
   JhghuVqPWc1f8a4xifGnWv1KK/jLjcYN/IFhkfHx2GFhsKlq+/VTKGXN3
   A==;
X-CSE-ConnectionGUID: dGnRGMq7QBKjUwhDr/c2Bg==
X-CSE-MsgGUID: y/xJrvT8QOG3PhmEtDjetA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81940451"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="81940451"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 16:54:07 -0800
X-CSE-ConnectionGUID: xUJV2CMxTVWnNKokJ5Fcgw==
X-CSE-MsgGUID: D//lxr8LRyeQROpWQ93Aaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="212416808"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jan 2026 16:54:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkArk-00000000Wly-11HB;
	Mon, 26 Jan 2026 00:54:04 +0000
Date: Mon, 26 Jan 2026 08:53:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-kiwi-6.1 95/95]
 drivers/base/cacheinfo.c:259:5-11: WARNING: Unsigned expression compared with
 zero: leaves > 0
Message-ID: <202601260810.WCHpkdOG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   f32d30ba0d3898356d1a193eea42a9cbdeb348ba
commit: 100309b45cc4d18815f68c97db012ab9714e25e2 [95/95] cacheinfo: Check 'cache-unified' property to count cache leaves
:::::: branch date: 16 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-r054-20260126 (https://download.01.org/0day-ci/archive/20260126/202601260810.WCHpkdOG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202601260810.WCHpkdOG-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/base/cacheinfo.c:259:5-11: WARNING: Unsigned expression compared with zero: leaves > 0

vim +259 drivers/base/cacheinfo.c

100309b45cc4d1 Pierre Gondois 2025-10-21  250  
100309b45cc4d1 Pierre Gondois 2025-10-21  251  int init_of_cache_level(unsigned int cpu)
100309b45cc4d1 Pierre Gondois 2025-10-21  252  {
100309b45cc4d1 Pierre Gondois 2025-10-21  253  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
100309b45cc4d1 Pierre Gondois 2025-10-21  254  	struct device_node *np = of_cpu_device_node_get(cpu);
100309b45cc4d1 Pierre Gondois 2025-10-21  255  	struct device_node *prev = NULL;
100309b45cc4d1 Pierre Gondois 2025-10-21  256  	unsigned int levels = 0, leaves, level;
100309b45cc4d1 Pierre Gondois 2025-10-21  257  
100309b45cc4d1 Pierre Gondois 2025-10-21  258  	leaves = of_count_cache_leaves(np);
a6d0510f295d99 Pierre Gondois 2025-10-21 @259  	if (leaves > 0)
a6d0510f295d99 Pierre Gondois 2025-10-21  260  		levels = 1;
a6d0510f295d99 Pierre Gondois 2025-10-21  261  
a6d0510f295d99 Pierre Gondois 2025-10-21  262  	prev = np;
a6d0510f295d99 Pierre Gondois 2025-10-21  263  	while ((np = of_find_next_cache_node(np))) {
a6d0510f295d99 Pierre Gondois 2025-10-21  264  		of_node_put(prev);
a6d0510f295d99 Pierre Gondois 2025-10-21  265  		prev = np;
a6d0510f295d99 Pierre Gondois 2025-10-21  266  		if (!of_device_is_compatible(np, "cache"))
52a43345ec152e Pierre Gondois 2025-10-21  267  			goto err_out;
a6d0510f295d99 Pierre Gondois 2025-10-21  268  		if (of_property_read_u32(np, "cache-level", &level))
52a43345ec152e Pierre Gondois 2025-10-21  269  			goto err_out;
a6d0510f295d99 Pierre Gondois 2025-10-21  270  		if (level <= levels)
52a43345ec152e Pierre Gondois 2025-10-21  271  			goto err_out;
100309b45cc4d1 Pierre Gondois 2025-10-21  272  
100309b45cc4d1 Pierre Gondois 2025-10-21  273  		leaves += of_count_cache_leaves(np);
a6d0510f295d99 Pierre Gondois 2025-10-21  274  		levels = level;
a6d0510f295d99 Pierre Gondois 2025-10-21  275  	}
a6d0510f295d99 Pierre Gondois 2025-10-21  276  
a6d0510f295d99 Pierre Gondois 2025-10-21  277  	of_node_put(np);
a6d0510f295d99 Pierre Gondois 2025-10-21  278  	this_cpu_ci->num_levels = levels;
a6d0510f295d99 Pierre Gondois 2025-10-21  279  	this_cpu_ci->num_leaves = leaves;
a6d0510f295d99 Pierre Gondois 2025-10-21  280  
a6d0510f295d99 Pierre Gondois 2025-10-21  281  	return 0;
52a43345ec152e Pierre Gondois 2025-10-21  282  
52a43345ec152e Pierre Gondois 2025-10-21  283  err_out:
52a43345ec152e Pierre Gondois 2025-10-21  284  	of_node_put(np);
52a43345ec152e Pierre Gondois 2025-10-21  285  	return -EINVAL;
a6d0510f295d99 Pierre Gondois 2025-10-21  286  }
a6d0510f295d99 Pierre Gondois 2025-10-21  287  

:::::: The code at line 259 was first introduced by commit
:::::: a6d0510f295d99739abe16349a9c5d7a7f0ee55d cacheinfo: Use RISC-V's init_cache_level() as generic OF implementation

:::::: TO: Pierre Gondois <pierre.gondois@arm.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
