Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB032F0C7A
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780884; cv=none; b=W7Rs7ZEBrnvVBvNBzrAuKv+nnu7gFLT7NEskxi6oVFkzgblfa0z0V82XkSnGrPwPTjm08BALi2Bwk1UN/miDrvXZqqtLmltLobyrpU2hQQBkCQ6OfGSSbLhLzLQTTVyrHWs+PYg522EfJnLYj48vkMrkQPbcn6IePi73oyBGY5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780884; c=relaxed/simple;
	bh=N0tWdi4zGde5eJlXR7scTuAwkJUmjQv9GE88yMBtqaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8GgxMboCmtm9P7c1kdqwSA/X0TwIH7k8Vobj4pnLzfvTmf56AnOtFWqAV3bYIlz7cYHxjhXzdx0PGKWxkxTn52M55d7M5/fN+w7xnhlHGZm36PCY/n5xeENdJZnBqvn7/6WGweKS7N+C5fzDRmVjCaMRQAmVeo+bFIOx0wu9Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msHC3MSs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msHC3MSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765780882; x=1797316882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N0tWdi4zGde5eJlXR7scTuAwkJUmjQv9GE88yMBtqaM=;
  b=msHC3MSsT+CiIhMCBdCdlMNkhMD8fkFEnNM53FoLac9I7YdsFFUN3F2i
   AdjoK6qAaCQP83VR40LG65bIzsKRL9fnhf+gV+bSaJ7vZtat0uWTcJwkB
   GQn5/6xWnojioA+y7ym9QyOpOXIMU53cNvL2VEvKqg6ULSio+vaymlExq
   erXkNg77EOn0oHV5reLMKf+n7l4JEOOLZUtT2C3E1yCJhrmR+PqdVtz4E
   ZrM3qT5kW51EUzbSVKti1XyO1jx/SQIST4ykZv6s2u4PcS3de/vdKI12B
   HZnxDvx1HH/8wEz3gXL6Zl0wjymzSuCDlTQ0ccYwSzy2VWLE3q9vhvU18
   w==;
X-CSE-ConnectionGUID: TKVWt2XKQtOFUnPyA/g+QQ==
X-CSE-MsgGUID: XKy6s6IZQ8O8peGRxDWfXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78315088"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78315088"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 22:41:22 -0800
X-CSE-ConnectionGUID: dGICYausTBats42REkP+sQ==
X-CSE-MsgGUID: 08V6OQ+MQE2kH7358s7HBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="235032208"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2025 22:41:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV2Gk-000000009t7-1ByI;
	Mon, 15 Dec 2025 06:41:18 +0000
Date: Mon, 15 Dec 2025 14:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/acpi/numa/srat.c:136 fix_pxm_node_maps() warn: for statement
 not indented
Message-ID: <202512151458.zA76EkP9-lkp@intel.com>
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
:::::: branch date: 27 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251215/202512151458.zA76EkP9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512151458.zA76EkP9-lkp@intel.com/

smatch warnings:
drivers/acpi/numa/srat.c:136 fix_pxm_node_maps() warn: for statement not indented

vim +136 drivers/acpi/numa/srat.c

762834e8bf46bf4 drivers/acpi/numa.c      Yasunori Goto 2006-06-23   83  
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   84  #ifdef CONFIG_NUMA_EMU
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   85  /*
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   86   * Take max_nid - 1 fake-numa nodes into account in both
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   87   * pxm_to_node_map()/node_to_pxm_map[] tables.
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   88   */
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   89  int __init fix_pxm_node_maps(int max_nid)
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   90  {
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   91  	static int pxm_to_node_map_copy[MAX_PXM_DOMAINS] __initdata
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   92  			= { [0 ... MAX_PXM_DOMAINS - 1] = NUMA_NO_NODE };
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   93  	static int node_to_pxm_map_copy[MAX_NUMNODES] __initdata
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   94  			= { [0 ... MAX_NUMNODES - 1] = PXM_INVAL };
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   95  	int i, j, index = -1, count = 0;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   96  	nodemask_t nodes_to_enable;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   97  
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   98  	if (numa_off || srat_disabled())
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   99  		return -1;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  100  
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  101  	/* find fake nodes PXM mapping */
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  102  	for (i = 0; i < MAX_NUMNODES; i++) {
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  103  		if (node_to_pxm_map[i] != PXM_INVAL) {
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  104  			for (j = 0; j <= max_nid; j++) {
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  105  				if ((emu_nid_to_phys[j] == i) &&
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  106  				    WARN(node_to_pxm_map_copy[j] != PXM_INVAL,
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  107  					 "Node %d is already binded to PXM %d\n",
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  108  					 j, node_to_pxm_map_copy[j]))
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  109  					return -1;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  110  				if (emu_nid_to_phys[j] == i) {
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  111  					node_to_pxm_map_copy[j] =
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  112  						node_to_pxm_map[i];
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  113  					if (j > index)
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  114  						index = j;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  115  					count++;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  116  				}
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  117  			}
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  118  		}
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  119  	}
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  120  	if (WARN(index != max_nid, "%d max nid  when expected %d\n",
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  121  		      index, max_nid))
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  122  		return -1;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  123  
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  124  	nodes_clear(nodes_to_enable);
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  125  
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  126  	/* map phys nodes not used for fake nodes */
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  127  	for (i = 0; i < MAX_NUMNODES; i++) {
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  128  		if (node_to_pxm_map[i] != PXM_INVAL) {
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  129  			for (j = 0; j <= max_nid; j++)
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  130  				if (emu_nid_to_phys[j] == i)
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  131  					break;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  132  			/* fake nodes PXM mapping has been done */
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  133  			if (j <= max_nid)
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  134  				continue;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  135  			/* find first hole */
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06 @136  			for (j = 0;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  137  			     j < MAX_NUMNODES &&
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  138  				 node_to_pxm_map_copy[j] != PXM_INVAL;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  139  			     j++)
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  140  			;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  141  			if (WARN(j == MAX_NUMNODES,
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  142  			    "Number of nodes exceeds MAX_NUMNODES\n"))
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  143  				return -1;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  144  			node_to_pxm_map_copy[j] = node_to_pxm_map[i];
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  145  			node_set(j, nodes_to_enable);
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  146  			count++;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  147  		}
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  148  	}
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  149  
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  150  	/* creating reverse mapping in pxm_to_node_map[] */
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  151  	for (i = 0; i < MAX_NUMNODES; i++)
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  152  		if (node_to_pxm_map_copy[i] != PXM_INVAL &&
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  153  		    pxm_to_node_map_copy[node_to_pxm_map_copy[i]] == NUMA_NO_NODE)
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  154  			pxm_to_node_map_copy[node_to_pxm_map_copy[i]] = i;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  155  
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  156  	/* overwrite with new mapping */
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  157  	for (i = 0; i < MAX_NUMNODES; i++) {
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  158  		node_to_pxm_map[i] = node_to_pxm_map_copy[i];
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  159  		pxm_to_node_map[i] = pxm_to_node_map_copy[i];
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  160  	}
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  161  
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  162  	/* enable other nodes found in PXM for hotplug */
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  163  	nodes_or(numa_nodes_parsed, nodes_to_enable, numa_nodes_parsed);
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  164  
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  165  	pr_debug("found %d total number of nodes\n", count);
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  166  	return 0;
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  167  }
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  168  #endif
63db8170bf34ce9 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
