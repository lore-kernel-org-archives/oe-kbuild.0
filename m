Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5141425A63C
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737206536; cv=none; b=VGvEG8dSGxjJlBynwZZLdJSqaoyLzNRMerlleBnqPyjqFvqvr2s+pLQYQplryYrjzaap+R2X3UNVZG5Qut9su4TBa7TfvOBYz9yHCTWnFUfaUzp2InVMUV/qAJC64NueZH0GO6JKorwl+VwdgOb2iXq1k8DOj+voZpWz0dytqRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737206536; c=relaxed/simple;
	bh=oZrSK+CommWefL+gscT8GSEi7AfzsXjxmUkkb75rHHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQymOLOGFhFKLoai3ezlARDVGU9GFPS89GDV7vbs+iERfvi5vb2PDFyj5ZY8pOPlbc5FyD5rx39pOAlEzpED146j5t4xaDYVjvSIKB6046M6bDIfasOHQx8+K6fuZTPey1kOQ4IHgYoDpml9ZaSZeyC75pKvJbefnPpfKgBHhcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhRDdVRf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhRDdVRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737206534; x=1768742534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oZrSK+CommWefL+gscT8GSEi7AfzsXjxmUkkb75rHHM=;
  b=LhRDdVRfTQFOTeA5+Qjk5UqswRGYQ7SqaCxSWANNA+bXs58Ica5BINoR
   GisfSkgqYG2JdllDzfoCMog/MgmuDD7H3l0wCFXx7FOqVS4OCLp8lEym4
   r9OkimPty7GbWge87S+YurncIDORx/SZzZWijdwn7PvksHQYStOupeIab
   M2CkKtyEN8dLoGds1T6X++6jmEuEufExJXmHuIn2YZ85WNIvfKYyvFBym
   qD1N2CMdFSzIGXVO1eMnuxNvhNolKuTvXmFEDn1sJR5FbLtQ40vT4FaJ8
   dFw5bvR2ZTUYKHVhCWmoz3qRPmqmn3rsPHK8ELADzPTCX6mhXwFf+UFeF
   A==;
X-CSE-ConnectionGUID: BOu+KzgsR9+egBm2xpIx/A==
X-CSE-MsgGUID: pH5cw1DDQaS4lsKu02ivAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="25229047"
X-IronPort-AV: E=Sophos;i="6.13,215,1732608000"; 
   d="scan'208";a="25229047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 05:22:14 -0800
X-CSE-ConnectionGUID: /bvRSfO/SP6fRBEgUXfV+g==
X-CSE-MsgGUID: XZ3sAfaNQj6QmkbhySsUHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111167537"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jan 2025 05:22:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ8m9-000UT1-2a;
	Sat, 18 Jan 2025 13:22:09 +0000
Date: Sat, 18 Jan 2025 21:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8229/9563] drivers/acpi/numa/srat.c:136
 fix_pxm_node_maps() warn: for statement not indented
Message-ID: <202501182145.pZnZ051s-lkp@intel.com>
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
TO: Bruno Faccini <bfaccini@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: ca19a5ab8756ef78c34d02d2b8c266a9cc7bf57d [8229/9563] mm/fake-numa: allow later numa node hotplug
:::::: branch date: 31 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20250117 (https://download.01.org/0day-ci/archive/20250118/202501182145.pZnZ051s-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501182145.pZnZ051s-lkp@intel.com/

smatch warnings:
drivers/acpi/numa/srat.c:136 fix_pxm_node_maps() warn: for statement not indented

vim +136 drivers/acpi/numa/srat.c

762834e8bf46bf4 drivers/acpi/numa.c      Yasunori Goto 2006-06-23   83  
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   84  #ifdef CONFIG_NUMA_EMU
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   85  /*
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   86   * Take max_nid - 1 fake-numa nodes into account in both
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   87   * pxm_to_node_map()/node_to_pxm_map[] tables.
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   88   */
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   89  int __init fix_pxm_node_maps(int max_nid)
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   90  {
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   91  	static int pxm_to_node_map_copy[MAX_PXM_DOMAINS] __initdata
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   92  			= { [0 ... MAX_PXM_DOMAINS - 1] = NUMA_NO_NODE };
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   93  	static int node_to_pxm_map_copy[MAX_NUMNODES] __initdata
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   94  			= { [0 ... MAX_NUMNODES - 1] = PXM_INVAL };
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   95  	int i, j, index = -1, count = 0;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   96  	nodemask_t nodes_to_enable;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   97  
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   98  	if (numa_off || srat_disabled())
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06   99  		return -1;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  100  
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  101  	/* find fake nodes PXM mapping */
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  102  	for (i = 0; i < MAX_NUMNODES; i++) {
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  103  		if (node_to_pxm_map[i] != PXM_INVAL) {
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  104  			for (j = 0; j <= max_nid; j++) {
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  105  				if ((emu_nid_to_phys[j] == i) &&
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  106  				    WARN(node_to_pxm_map_copy[j] != PXM_INVAL,
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  107  					 "Node %d is already binded to PXM %d\n",
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  108  					 j, node_to_pxm_map_copy[j]))
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  109  					return -1;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  110  				if (emu_nid_to_phys[j] == i) {
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  111  					node_to_pxm_map_copy[j] =
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  112  						node_to_pxm_map[i];
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  113  					if (j > index)
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  114  						index = j;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  115  					count++;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  116  				}
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  117  			}
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  118  		}
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  119  	}
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  120  	if (WARN(index != max_nid, "%d max nid  when expected %d\n",
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  121  		      index, max_nid))
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  122  		return -1;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  123  
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  124  	nodes_clear(nodes_to_enable);
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  125  
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  126  	/* map phys nodes not used for fake nodes */
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  127  	for (i = 0; i < MAX_NUMNODES; i++) {
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  128  		if (node_to_pxm_map[i] != PXM_INVAL) {
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  129  			for (j = 0; j <= max_nid; j++)
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  130  				if (emu_nid_to_phys[j] == i)
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  131  					break;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  132  			/* fake nodes PXM mapping has been done */
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  133  			if (j <= max_nid)
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  134  				continue;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  135  			/* find first hole */
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06 @136  			for (j = 0;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  137  			     j < MAX_NUMNODES &&
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  138  				 node_to_pxm_map_copy[j] != PXM_INVAL;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  139  			     j++)
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  140  			;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  141  			if (WARN(j == MAX_NUMNODES,
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  142  			    "Number of nodes exceeds MAX_NUMNODES\n"))
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  143  				return -1;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  144  			node_to_pxm_map_copy[j] = node_to_pxm_map[i];
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  145  			node_set(j, nodes_to_enable);
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  146  			count++;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  147  		}
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  148  	}
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  149  
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  150  	/* creating reverse mapping in pxm_to_node_map[] */
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  151  	for (i = 0; i < MAX_NUMNODES; i++)
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  152  		if (node_to_pxm_map_copy[i] != PXM_INVAL &&
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  153  		    pxm_to_node_map_copy[node_to_pxm_map_copy[i]] == NUMA_NO_NODE)
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  154  			pxm_to_node_map_copy[node_to_pxm_map_copy[i]] = i;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  155  
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  156  	/* overwrite with new mapping */
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  157  	for (i = 0; i < MAX_NUMNODES; i++) {
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  158  		node_to_pxm_map[i] = node_to_pxm_map_copy[i];
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  159  		pxm_to_node_map[i] = pxm_to_node_map_copy[i];
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  160  	}
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  161  
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  162  	/* enable other nodes found in PXM for hotplug */
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  163  	nodes_or(numa_nodes_parsed, nodes_to_enable, numa_nodes_parsed);
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  164  
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  165  	pr_debug("found %d total number of nodes\n", count);
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  166  	return 0;
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  167  }
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  168  #endif
ca19a5ab8756ef7 drivers/acpi/numa/srat.c Bruno Faccini 2025-01-06  169  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
