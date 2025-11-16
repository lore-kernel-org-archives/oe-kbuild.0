Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD7818EAB
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Nov 2025 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763287238; cv=none; b=OeIc4Vjcmgf9lp++4ePZ8pYGzJ8rcs/ZR3JZaoX78lMz/8b8GBHiNW77MUWiFKF256PFw1UV4G6hsE/NpOSDAzIJliFH/sn0Ahvsoj34dMrFXZjjfa0VtimVIPdcipr6eO0JdcP0ekZ88p8/sQ2l2/MCeZNoZrZIeOfVcbuMPvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763287238; c=relaxed/simple;
	bh=3zWrZvUve/z56O9U9wGjG2UXPK+Qa9eys7hp2gstTD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtB/+QYL2vyFa9TSsoatktKaMeqU1pW5/3R+1eqlsGHdP/DM78gESe3iduRY8IrzxvmsNnCr4Q3gv4+Lkvwpf1/JWVhNq6X146gw0hvL5KX7Mm2gXwhTKc2fsCHr6ETvJBs3rh3FS9SKioinFa+hv5rKau0jvZGepmkvYQF6sPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVHz0WP5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVHz0WP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763287236; x=1794823236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zWrZvUve/z56O9U9wGjG2UXPK+Qa9eys7hp2gstTD0=;
  b=iVHz0WP5t8R4cuXcXsvpCZQr2Q6qbgjsDfI84J1kbd7QSOwn2WZ3QBzH
   7ZW4VqQjioTHZ4ip4jX/94jExQBx8pd6FBLfF4fqufNHIdy6/LyAlBsZO
   uUEPjzV3k9xlNLdpQgpqBxpG0cuN1Mtw74QnYbzem8xFnMTMZyIl8+Ru7
   jO3uDQC+hUrxbZHQxFNnOvZZ8RkdN9ObrU/wEhMORTVSnSzIAnjYsgSzY
   6LZcnirJ76eWV+IsI7ncO6aEbNMLTxOnOZKaP7F8wUcaS1rnChgSKFqxQ
   T46Zam9y56cBQLBVvjrn7QtCcsW5LQ5SUuQjWwLgxh/qHRntI9RTqmxIy
   Q==;
X-CSE-ConnectionGUID: S6Fx7/L1RGqG2YadwU45Ew==
X-CSE-MsgGUID: acyMuSEhQZ2b3lMhFOOYsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="69160416"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="69160416"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 02:00:36 -0800
X-CSE-ConnectionGUID: GIwZcl0MRs21p42YbJR+9w==
X-CSE-MsgGUID: M3HG9yyhS0+ISkUE5a1RjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="190220874"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Nov 2025 02:00:35 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKZYe-0008gJ-2D;
	Sun, 16 Nov 2025 10:00:32 +0000
Date: Sun, 16 Nov 2025 18:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific
 Purpose Memory Nodes
Message-ID: <202511161706.ZqNHM1XU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251112192936.2574429-5-gourry@gourry.net>
References: <20251112192936.2574429-5-gourry@gourry.net>
TO: Gregory Price <gourry@gourry.net>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 24172e0d79900908cf5ebf366600616d29c9b417]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-constify-oom_control-scan_control-and-alloc_context-nodemask/20251113-033247
base:   24172e0d79900908cf5ebf366600616d29c9b417
patch link:    https://lore.kernel.org/r/20251112192936.2574429-5-gourry%40gourry.net
patch subject: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific Purpose Memory Nodes
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20251116 (https://download.01.org/0day-ci/archive/20251116/202511161706.ZqNHM1XU-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511161706.ZqNHM1XU-lkp@intel.com/

smatch warnings:
mm/memory-tiers.c:737 mt_set_node_type() error: uninitialized symbol 'err'.

vim +/err +737 mm/memory-tiers.c

a72a30af550c08 Ho-Ren (Jack  Chuang 2024-04-05  708) 
6fee6292300e00 Gregory Price        2025-11-12  709  /**
6fee6292300e00 Gregory Price        2025-11-12  710   * mt_set_node_type() - Set a NUMA Node's Memory type.
6fee6292300e00 Gregory Price        2025-11-12  711   * @node: The node type to set
6fee6292300e00 Gregory Price        2025-11-12  712   * @type: The type to set
6fee6292300e00 Gregory Price        2025-11-12  713   *
6fee6292300e00 Gregory Price        2025-11-12  714   * This is a one-way setting, once a type is assigned it cannot be cleared
6fee6292300e00 Gregory Price        2025-11-12  715   * without resetting the system.  This is to avoid race conditions associated
6fee6292300e00 Gregory Price        2025-11-12  716   * with moving nodes from one type to another during memory hotplug.
6fee6292300e00 Gregory Price        2025-11-12  717   *
6fee6292300e00 Gregory Price        2025-11-12  718   * Once a node is added as a SysRAM node, it will be used by default in
6fee6292300e00 Gregory Price        2025-11-12  719   * the page allocator as a valid target when the calling does not provide
6fee6292300e00 Gregory Price        2025-11-12  720   * a node or nodemask.  This is safe as the page allocator iterates through
6fee6292300e00 Gregory Price        2025-11-12  721   * zones and uses this nodemask to filter zones - if a node is present but
6fee6292300e00 Gregory Price        2025-11-12  722   * has no zones the node is ignored.
6fee6292300e00 Gregory Price        2025-11-12  723   *
6fee6292300e00 Gregory Price        2025-11-12  724   * Return: 0 if the node type is set successfully (or it's already set)
6fee6292300e00 Gregory Price        2025-11-12  725   *         -EBUSY if the node has a different type already
6fee6292300e00 Gregory Price        2025-11-12  726   *         -ENODEV if the type is invalid
6fee6292300e00 Gregory Price        2025-11-12  727   */
6fee6292300e00 Gregory Price        2025-11-12  728  int mt_set_node_type(int node, int type)
6fee6292300e00 Gregory Price        2025-11-12  729  {
6fee6292300e00 Gregory Price        2025-11-12  730  	int err;
6fee6292300e00 Gregory Price        2025-11-12  731  
6fee6292300e00 Gregory Price        2025-11-12  732  	mutex_lock(&memory_tier_lock);
6fee6292300e00 Gregory Price        2025-11-12  733  	if (type == MT_NODE_TYPE_SYSRAM)
6fee6292300e00 Gregory Price        2025-11-12  734  		err = node_isset(node, mt_spm_nodelist) ? -EBUSY : 0;
6fee6292300e00 Gregory Price        2025-11-12  735  	else if (type == MT_NODE_TYPE_SPM)
6fee6292300e00 Gregory Price        2025-11-12  736  		err = node_isset(node, mt_sysram_nodelist) ? -EBUSY : 0;
6fee6292300e00 Gregory Price        2025-11-12 @737  	if (err)
6fee6292300e00 Gregory Price        2025-11-12  738  		goto out;
6fee6292300e00 Gregory Price        2025-11-12  739  
6fee6292300e00 Gregory Price        2025-11-12  740  	if (type == MT_NODE_TYPE_SYSRAM)
6fee6292300e00 Gregory Price        2025-11-12  741  		node_set(node, mt_sysram_nodelist);
6fee6292300e00 Gregory Price        2025-11-12  742  	else if (type == MT_NODE_TYPE_SPM)
6fee6292300e00 Gregory Price        2025-11-12  743  		node_set(node, mt_spm_nodelist);
6fee6292300e00 Gregory Price        2025-11-12  744  	else
6fee6292300e00 Gregory Price        2025-11-12  745  		err = -ENODEV;
6fee6292300e00 Gregory Price        2025-11-12  746  out:
6fee6292300e00 Gregory Price        2025-11-12  747  	mutex_unlock(&memory_tier_lock);
6fee6292300e00 Gregory Price        2025-11-12  748  	return err;
6fee6292300e00 Gregory Price        2025-11-12  749  }
6fee6292300e00 Gregory Price        2025-11-12  750  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
