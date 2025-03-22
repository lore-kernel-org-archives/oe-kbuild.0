Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2841EB184
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742653459; cv=none; b=EM3IGPqI7DEH87e+jFgZIBKlpHnE16EJFHVWq72x8A0R9SFNs0PPC85qymkEN71q8TEFlceYm7gD9R1nHykGjjT6akGBxfIehlpDOyhkXf5a1CKOaXdwqrCpSLAySX3yHwEpK0ukAjBG+l/ecBd21RTltyYHxnLO4KSzfBYGocA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742653459; c=relaxed/simple;
	bh=P7yNCgGGWQapCr9GvxWsFargWfuPlwk4HGGuTNwJnEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZXpVJaT6NLYlkiufQqhKZEohBL/MjfmKNFP2mXwgUdBnAhWER0JUaOgXM+lf0Qy74+2NNFFMdr+dMFw7j59D72rhK93vojSVs+UYGJofMO4Wtfnkg8FyyLQqizTDt5rm1bttyzbEXjspuZCruAGQhEbrdnrAx1ij7E2c4xBbdQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfMnybzA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfMnybzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742653457; x=1774189457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7yNCgGGWQapCr9GvxWsFargWfuPlwk4HGGuTNwJnEc=;
  b=OfMnybzAb1yPVb8iwqyGJjbU+VQfoMaw1GP+CauCLTp+EZ6IDuyEvbVC
   ec9QDy+rSv6wuNKijnijvHGVyOHcPFr4Kma3nXhUbyQ+PWzLD/WysGAw1
   3qUVbUh4RRJZolixBfCDUJGAIqS+E1IT1LHHEr36m3eOVA6HKO1k4otDe
   3J2H/JCaerhD3V+fqap+Zdg6/SOREUVBAXsWIz9oIe0WDFaexZG7qGRd0
   m/kaeWG5gRyAgs9WrzqTJ5Ina+DZDgh5yJHVVWFjqRVDwPmWKqTCixVfS
   xBs/fa8ednwK6B8ETp/gczFHB7LTU0ET3MkCb8pXqdCa98nOXATXIfpRP
   g==;
X-CSE-ConnectionGUID: DxDgXpavTuKm0gjZDq4apQ==
X-CSE-MsgGUID: yzIlYlqYRialhz+RB1uFdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="43072865"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="43072865"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 07:24:14 -0700
X-CSE-ConnectionGUID: csdW9hOQRrC3XtNsVDcvsg==
X-CSE-MsgGUID: YmswRr5BQu6i8cZKCemRnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="124598520"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Mar 2025 07:24:13 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvzli-0002BR-0x;
	Sat, 22 Mar 2025 14:24:10 +0000
Date: Sat, 22 Mar 2025 22:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/vmalloc.c:1078:3-9: preceding lock on line 1074
Message-ID: <202503222250.NcdogNZ7-lkp@intel.com>
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
TO: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88d324e69ea9f3ae1c1905ea75d717c08bdb8e15
commit: fc2c22693c608125bbce174c1952eb4db2f8d07f mm: vmalloc: fix lockdep warning
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r064-20250322 (https://download.01.org/0day-ci/archive/20250322/202503222250.NcdogNZ7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503222250.NcdogNZ7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/vmalloc.c:1078:3-9: preceding lock on line 1074

vim +1078 mm/vmalloc.c

f181234a5a21fd Chen Wandun             2021-09-02  1038  
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1039) /*
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1040)  * Returns a node where a first VA, that satisfies addr < va_end, resides.
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1041)  * If success, a node is locked. A user is responsible to unlock it when a
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1042)  * VA is no longer needed to be accessed.
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1043)  *
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1044)  * Returns NULL if nothing found.
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1045)  */
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1046) static struct vmap_node *
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1047) find_vmap_area_exceed_addr_lock(unsigned long addr, struct vmap_area **va)
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1048) {
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1049) 	unsigned long va_start_lowest;
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1050) 	struct vmap_node *vn;
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1051) 	int i;
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1052) 
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1053) repeat:
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1054) 	for (i = 0, va_start_lowest = 0; i < nr_vmap_nodes; i++) {
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1055) 		vn = &vmap_nodes[i];
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1056) 
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1057) 		spin_lock(&vn->busy.lock);
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1058) 		*va = __find_vmap_area_exceed_addr(addr, &vn->busy.root);
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1059) 
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1060) 		if (*va)
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1061) 			if (!va_start_lowest || (*va)->va_start < va_start_lowest)
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1062) 				va_start_lowest = (*va)->va_start;
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1063) 		spin_unlock(&vn->busy.lock);
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1064) 	}
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1065) 
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1066) 	/*
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1067) 	 * Check if found VA exists, it might have gone away.  In this case we
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1068) 	 * repeat the search because a VA has been removed concurrently and we
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1069) 	 * need to proceed to the next one, which is a rare case.
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1070) 	 */
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1071) 	if (va_start_lowest) {
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1072) 		vn = addr_to_node(va_start_lowest);
db64fe02258f15 Nicholas Piggin         2008-10-18  1073  
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28 @1074) 		spin_lock(&vn->busy.lock);
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1075) 		*va = __find_vmap_area(va_start_lowest, &vn->busy.root);
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  1076  
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1077) 		if (*va)
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28 @1078) 			return vn;
db64fe02258f15 Nicholas Piggin         2008-10-18  1079  
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1080) 		spin_unlock(&vn->busy.lock);
fc2c22693c6081 Uladzislau Rezki (Sony  2024-03-28  1081) 		goto repeat;
db64fe02258f15 Nicholas Piggin         2008-10-18  1082  	}
db64fe02258f15 Nicholas Piggin         2008-10-18  1083  
db64fe02258f15 Nicholas Piggin         2008-10-18  1084  	return NULL;
db64fe02258f15 Nicholas Piggin         2008-10-18  1085  }
db64fe02258f15 Nicholas Piggin         2008-10-18  1086  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
