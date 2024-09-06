Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827FB1CB123
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Sep 2024 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725619548; cv=none; b=mNMfZ6ENcHSwLKWpc3q65+cc3flmZdCTBlXm48yj8t/z/jp/ToTxnaiPFRnY+FYRNNj9F3hhAHf9pqu1kEb942iLI0AWWkc29jbXSpYZNJORWBIixaNpXk/oquektIX+ju1Pg/3xKMlP4Q/Ndakj3Nh/Q/ED3Vcqp2qNcR4x+cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725619548; c=relaxed/simple;
	bh=7srzSrEWFG9mkRhT6ajbdOiXn1wJbSOarFstCnJ9/qA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSyIusEPyic7O++DLGK0IloVpbe/FfSnI1waY9KH3LdEsTD9lGGlOVQb+c2tHc80cdPbXbT7PqzxEKavax1ruztxCAGXvQzmlkyxGmxP4WChMTWNicdGC5g7jmaLKCgv35fXDWuvO3bWWqNCdapYfnRudXN8/g7Cbz+5sxBeA6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZN/U1qq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZN/U1qq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725619547; x=1757155547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7srzSrEWFG9mkRhT6ajbdOiXn1wJbSOarFstCnJ9/qA=;
  b=cZN/U1qqq98dSI0mURzH2LzjIY4ZySg4cJLhVgL0b1HqJpQiV7YztNh1
   JOtCPDqqCZlmL4LqGzYJGygwCoVKSxFQ4lSJlFeq6wtjYyjLuA5IEzec7
   5MJhd6cxL7IdLMebZHUG62BEjhlIzz9917AiLJbnsaEAsDhrM31+rKLZc
   SNAX7wwYYvS0kiOabzc+qI2nhtJdTTi5qw2TSi7sa1bSHya2E8Hk99fz4
   96mhpFw+Z08zeUF7wLZGzRGdhGSg4JTmHVOQZ3N05sw8ToUbsaZqMksKW
   GkJLUOJAiik6+HczzP2YE7qQIiKE4EvkfE6fu2yR7k7iMiTpipDqXWpgn
   w==;
X-CSE-ConnectionGUID: TqT8OrQsR7iEkLJabhPwZQ==
X-CSE-MsgGUID: 3wPa8kZkR/64oUnmSWwMfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24484171"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24484171"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 03:45:45 -0700
X-CSE-ConnectionGUID: unRQyHrgQhOW7el+Ol+oHA==
X-CSE-MsgGUID: 0Ov/yxqXT9aLvBHvu9o7gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65569865"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Sep 2024 03:45:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smWTF-000B31-1B;
	Fri, 06 Sep 2024 10:45:41 +0000
Date: Fri, 6 Sep 2024 18:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/vmalloc.c:1078:3-9: preceding lock on line 1074
Message-ID: <202409061842.q4VMWiA6-lkp@intel.com>
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
head:   b831f83e40a24f07c8dcba5be408d93beedc820f
commit: fc2c22693c608125bbce174c1952eb4db2f8d07f mm: vmalloc: fix lockdep warning
date:   5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-052-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061842.q4VMWiA6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409061842.q4VMWiA6-lkp@intel.com/

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
