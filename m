Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B211B2877E3
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804611; cv=none; b=mu/ssJiP8YoIHN0i1WqIoLj9yy3J88z957ZwDod1VCKE/BNosim12hFNBuJCNjH49f1nYEpq9L76oPYURI10ge6kK2JTGIoe4Wee4+CNtNKkMOCudwMLJw0H/46cfPZgmKT5CsF9WT7+eFhe4OaH5mD7y9HlueMy0ftHsbeFgs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804611; c=relaxed/simple;
	bh=HSLVJj00weXTcHdew3jQVUfKObD7kynSEJ7gw0kKztY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SPXOU1yNrV4Gz1j6fIrnvb7HWCPN3c71wsf1TGGjMZ9/WY0HdJbD7r901YjUfYNZcgwlYCrbpgGWZhUtxv9xWNQGIVh7rAYmR+zP5DsDzszhJI4edQuEd9QwCT7E/7hggX9gVb/TIk/+GK9v7c3Blds2nX77KALcx7y6CXVq5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4QBMucH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4QBMucH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765804609; x=1797340609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HSLVJj00weXTcHdew3jQVUfKObD7kynSEJ7gw0kKztY=;
  b=k4QBMucHfjQGvm0UbWrBu2x3qUt7R/MI5ocGwid/IPwnZw80d7gAnw64
   tf2KP71AmZ3WiKWUBtXpBKWY901afAci5Vjj6D4UqMi01RbyTglFBRo89
   egxTYL0vNpTU5LBQ91AC2Pv8Zx5Gf6ya4gAVQmjznEAYKLzl4qkjcbb1i
   On/IDowxmYEbPKH+P+DhLXAgMIfd3q27wrT9C9IOFlFeBXvt6eBI2V3mb
   YOzIz+ulqZ7lZFltpqRdvZUs5Mf6CxWVOgYPwW0EvzHpNBvVXYMSXYCQ/
   rmbE5m7/iTosvsnu6nraOBbigNQl8ZSwqAO+jnAeYxYn+DvhF8SXm6BeP
   A==;
X-CSE-ConnectionGUID: 0H/R1vbeRpao/v1Lg3q7dQ==
X-CSE-MsgGUID: 35AgjgV/SKCOm21FeVRpaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93178669"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="93178669"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 05:16:49 -0800
X-CSE-ConnectionGUID: thphyO48T7eqCq3Z97n0pQ==
X-CSE-MsgGUID: HcaTUqdSTtqZSOsUrQ9i4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="235113888"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2025 05:16:48 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV8RR-000000000KM-1XX7;
	Mon, 15 Dec 2025 13:16:45 +0000
Date: Mon, 15 Dec 2025 21:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/acpi/numa/srat.c:136 fix_pxm_node_maps() warn: for statement
 not indented
Message-ID: <202512152102.X36abkUi-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Bruno Faccini <bfaccini@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 63db8170bf34ce9e0763f87d993cf9b4c9002b09 mm/fake-numa: allow later numa node hotplug
date:   11 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251215/202512152102.X36abkUi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512152102.X36abkUi-lkp@intel.com/

smatch warnings:
drivers/acpi/numa/srat.c:136 fix_pxm_node_maps() warn: for statement not indented

vim +136 drivers/acpi/numa/srat.c

762834e8bf46bf drivers/acpi/numa.c      Yasunori Goto 2006-06-23   83  
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   84  #ifdef CONFIG_NUMA_EMU
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   85  /*
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   86   * Take max_nid - 1 fake-numa nodes into account in both
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   87   * pxm_to_node_map()/node_to_pxm_map[] tables.
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   88   */
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   89  int __init fix_pxm_node_maps(int max_nid)
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   90  {
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   91  	static int pxm_to_node_map_copy[MAX_PXM_DOMAINS] __initdata
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   92  			= { [0 ... MAX_PXM_DOMAINS - 1] = NUMA_NO_NODE };
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   93  	static int node_to_pxm_map_copy[MAX_NUMNODES] __initdata
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   94  			= { [0 ... MAX_NUMNODES - 1] = PXM_INVAL };
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   95  	int i, j, index = -1, count = 0;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   96  	nodemask_t nodes_to_enable;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   97  
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   98  	if (numa_off || srat_disabled())
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   99  		return -1;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  100  
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  101  	/* find fake nodes PXM mapping */
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  102  	for (i = 0; i < MAX_NUMNODES; i++) {
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  103  		if (node_to_pxm_map[i] != PXM_INVAL) {
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  104  			for (j = 0; j <= max_nid; j++) {
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  105  				if ((emu_nid_to_phys[j] == i) &&
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  106  				    WARN(node_to_pxm_map_copy[j] != PXM_INVAL,
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  107  					 "Node %d is already binded to PXM %d\n",
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  108  					 j, node_to_pxm_map_copy[j]))
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  109  					return -1;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  110  				if (emu_nid_to_phys[j] == i) {
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  111  					node_to_pxm_map_copy[j] =
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  112  						node_to_pxm_map[i];
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  113  					if (j > index)
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  114  						index = j;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  115  					count++;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  116  				}
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  117  			}
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  118  		}
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  119  	}
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  120  	if (WARN(index != max_nid, "%d max nid  when expected %d\n",
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  121  		      index, max_nid))
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  122  		return -1;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  123  
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  124  	nodes_clear(nodes_to_enable);
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  125  
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  126  	/* map phys nodes not used for fake nodes */
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  127  	for (i = 0; i < MAX_NUMNODES; i++) {
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  128  		if (node_to_pxm_map[i] != PXM_INVAL) {
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  129  			for (j = 0; j <= max_nid; j++)
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  130  				if (emu_nid_to_phys[j] == i)
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  131  					break;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  132  			/* fake nodes PXM mapping has been done */
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  133  			if (j <= max_nid)
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  134  				continue;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  135  			/* find first hole */
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06 @136  			for (j = 0;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  137  			     j < MAX_NUMNODES &&
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  138  				 node_to_pxm_map_copy[j] != PXM_INVAL;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  139  			     j++)
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  140  			;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  141  			if (WARN(j == MAX_NUMNODES,
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  142  			    "Number of nodes exceeds MAX_NUMNODES\n"))
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  143  				return -1;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  144  			node_to_pxm_map_copy[j] = node_to_pxm_map[i];
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  145  			node_set(j, nodes_to_enable);
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  146  			count++;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  147  		}
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  148  	}
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  149  
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  150  	/* creating reverse mapping in pxm_to_node_map[] */
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  151  	for (i = 0; i < MAX_NUMNODES; i++)
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  152  		if (node_to_pxm_map_copy[i] != PXM_INVAL &&
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  153  		    pxm_to_node_map_copy[node_to_pxm_map_copy[i]] == NUMA_NO_NODE)
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  154  			pxm_to_node_map_copy[node_to_pxm_map_copy[i]] = i;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  155  
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  156  	/* overwrite with new mapping */
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  157  	for (i = 0; i < MAX_NUMNODES; i++) {
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  158  		node_to_pxm_map[i] = node_to_pxm_map_copy[i];
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  159  		pxm_to_node_map[i] = pxm_to_node_map_copy[i];
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  160  	}
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  161  
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  162  	/* enable other nodes found in PXM for hotplug */
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  163  	nodes_or(numa_nodes_parsed, nodes_to_enable, numa_nodes_parsed);
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  164  
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  165  	pr_debug("found %d total number of nodes\n", count);
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  166  	return 0;
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  167  }
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  168  #endif
63db8170bf34ce drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
