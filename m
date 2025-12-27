Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C618E1F
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766863377; cv=none; b=jKME4tBX8deKD6YTc2aH9BdkoVHpXP7AmgKeyl11Zm2LO6AZ2fTsu5lpsGBwNsa6LdkKTOGYvivOQBPsTrIvO6ZyFbjI+l8t5sGBI5ynY0UVEe8LhrCTH+ziDtCHDlTBbqEcqG7Tluhg1/SqXJq8Auv5UVG77PVfB9vIDDeuJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766863377; c=relaxed/simple;
	bh=KIZEX8gxYAs6K0PzYQZ8iBUzD3IolUXeBU0F3/phPGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W22+UFS/6w2lALhOepDTnqc/xJs+EnIQfw1MdOVdZxoE+EZG/DK93BsTYlaY/anhN0Xr1Bzwum/PsvAteVzZ94cfLGtO2vQwGzPJFViHC0+LuRlXkUPL6ll6f61a8hwjA9pOsrMnVG5FC4am/2gfTizd9nLj2k9i6CrVfiG2n1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEcbhsQL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEcbhsQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766863375; x=1798399375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KIZEX8gxYAs6K0PzYQZ8iBUzD3IolUXeBU0F3/phPGo=;
  b=hEcbhsQLdNmeVlvVnHspkkK61cSR6WFUbZoh9LTPyelyMBQj8pIG9QC1
   MsRaUq3kOZJP/joyXxsOaZ4R6ITkIc3RUqQkvQG7YcLZWqikCj8/q9Rus
   gu0QLIxn1c46o5V00DEMUdmVzuqsVHbHZMSb5sHGE9FcZVtJMQ4yT3F1H
   fNxYm6D4qIcDSwZVw3j2x5qkaM9EGAawYbgXBLWj+DwTsjOJ8SIksUxHN
   bO6Q3gK+47DMzHjm0hjlR22wc8lF0yhlkuhboKSeOphRaOt4I1X99En8g
   akknEAaDvu9kAreafrkvFw7D6dlXPXy6UN54nMLaabty4BCkt6+tXZ0Bp
   w==;
X-CSE-ConnectionGUID: CNB6CJ66T1eYnP38gJkR2A==
X-CSE-MsgGUID: bCx3i0CRRcaBrbKsjN2WJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="85971768"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="85971768"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 11:22:54 -0800
X-CSE-ConnectionGUID: VEKfdFKUTJCK2e4UZXohsg==
X-CSE-MsgGUID: hSaC1A5FRrOfqG4ZTaeetg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="200327186"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Dec 2025 11:22:53 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZZsI-0000000062P-3s0o;
	Sat, 27 Dec 2025 19:22:50 +0000
Date: Sun, 28 Dec 2025 03:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] mm/vmscan: fix demotion targets checks in
 reclaim/demotion
Message-ID: <202512280348.PQDhLdXM-lkp@intel.com>
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
In-Reply-To: <20251223212032.665731-1-bingjiao@google.com>
References: <20251223212032.665731-1-bingjiao@google.com>
TO: Bing Jiao <bingjiao@google.com>
TO: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: akpm@linux-foundation.org
CC: gourry@gourry.net
CC: longman@redhat.com
CC: hannes@cmpxchg.org
CC: mhocko@kernel.org
CC: roman.gushchin@linux.dev
CC: shakeel.butt@linux.dev
CC: muchun.song@linux.dev
CC: tj@kernel.org
CC: mkoutny@suse.com
CC: david@kernel.org
CC: zhengqi.arch@bytedance.com
CC: lorenzo.stoakes@oracle.com
CC: axelrasmussen@google.com
CC: chenridong@huaweicloud.com
CC: yuanchu@google.com
CC: weixugc@google.com
CC: cgroups@vger.kernel.org

Hi Bing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Bing-Jiao/mm-vmscan-fix-demotion-targets-checks-in-reclaim-demotion/20251224-052216
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251223212032.665731-1-bingjiao%40google.com
patch subject: [PATCH v3] mm/vmscan: fix demotion targets checks in reclaim/demotion
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r071-20251224 (https://download.01.org/0day-ci/archive/20251228/202512280348.PQDhLdXM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512280348.PQDhLdXM-lkp@intel.com/

smatch warnings:
mm/vmscan.c:1075 demote_folio_list() error: uninitialized symbol 'nr_succeeded'.

vim +/nr_succeeded +1075 mm/vmscan.c

26aa2d199d6f2c Dave Hansen             2021-09-02  1032  
26aa2d199d6f2c Dave Hansen             2021-09-02  1033  /*
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1034)  * Take folios on @demote_folios and attempt to demote them to another node.
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1035)  * Folios which are not demoted are left on @demote_folios.
26aa2d199d6f2c Dave Hansen             2021-09-02  1036   */
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1037) static unsigned int demote_folio_list(struct list_head *demote_folios,
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1038  				      struct pglist_data *pgdat,
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1039  				      struct mem_cgroup *memcg)
26aa2d199d6f2c Dave Hansen             2021-09-02  1040  {
26aa2d199d6f2c Dave Hansen             2021-09-02  1041  	int target_nid = next_demotion_node(pgdat->node_id);
26aa2d199d6f2c Dave Hansen             2021-09-02  1042  	unsigned int nr_succeeded;
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1043  	nodemask_t allowed_mask, allowed_mems;
32008027289239 Jagdish Gediya          2022-08-18  1044  
32008027289239 Jagdish Gediya          2022-08-18  1045  	struct migration_target_control mtc = {
32008027289239 Jagdish Gediya          2022-08-18  1046  		/*
32008027289239 Jagdish Gediya          2022-08-18  1047  		 * Allocate from 'node', or fail quickly and quietly.
32008027289239 Jagdish Gediya          2022-08-18  1048  		 * When this happens, 'page' will likely just be discarded
32008027289239 Jagdish Gediya          2022-08-18  1049  		 * instead of migrated.
32008027289239 Jagdish Gediya          2022-08-18  1050  		 */
bd63d0fde2a2c3 Fushuai Wang            2025-10-06  1051  		.gfp_mask = (GFP_HIGHUSER_MOVABLE & ~__GFP_RECLAIM) |
32008027289239 Jagdish Gediya          2022-08-18  1052  			__GFP_NOMEMALLOC | GFP_NOWAIT,
e42dfe4e0a51b4 Baolin Wang             2024-03-06  1053  		.nmask = &allowed_mask,
e42dfe4e0a51b4 Baolin Wang             2024-03-06  1054  		.reason = MR_DEMOTION,
32008027289239 Jagdish Gediya          2022-08-18  1055  	};
26aa2d199d6f2c Dave Hansen             2021-09-02  1056  
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1057) 	if (list_empty(demote_folios))
26aa2d199d6f2c Dave Hansen             2021-09-02  1058  		return 0;
26aa2d199d6f2c Dave Hansen             2021-09-02  1059  
32008027289239 Jagdish Gediya          2022-08-18  1060  	node_get_allowed_targets(pgdat, &allowed_mask);
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1061  	allowed_mems = mem_cgroup_node_get_allowed(memcg);
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1062  	nodes_and(allowed_mask, allowed_mask, allowed_mems);
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1063  	if (nodes_empty(allowed_mask))
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1064  		return false;
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1065  
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1066  	if (target_nid == NUMA_NO_NODE || !node_isset(target_nid, allowed_mask))
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1067  		target_nid = node_random(&allowed_mask);
80ef4b3f9c7c95 Bing Jiao               2025-12-23  1068  	mtc.nid = target_nid;
32008027289239 Jagdish Gediya          2022-08-18  1069  
26aa2d199d6f2c Dave Hansen             2021-09-02  1070  	/* Demotion ignores all cpuset and mempolicy settings */
29ea04095b9697 SeongJae Park           2025-06-16  1071  	migrate_pages(demote_folios, alloc_demote_folio, NULL,
32008027289239 Jagdish Gediya          2022-08-18  1072  		      (unsigned long)&mtc, MIGRATE_ASYNC, MR_DEMOTION,
26aa2d199d6f2c Dave Hansen             2021-09-02  1073  		      &nr_succeeded);
26aa2d199d6f2c Dave Hansen             2021-09-02  1074  
26aa2d199d6f2c Dave Hansen             2021-09-02 @1075  	return nr_succeeded;
26aa2d199d6f2c Dave Hansen             2021-09-02  1076  }
26aa2d199d6f2c Dave Hansen             2021-09-02  1077  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
