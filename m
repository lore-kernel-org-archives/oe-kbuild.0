Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D43C1350F9
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Apr 2024 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712261773; cv=none; b=s+tiWQh9QVvcJJtFdNVf1eduoynr0d9cgVZlG09qGd7RqLepltYjtPHJ/3v5mjxxRea18NSE3diwhJRe0omtQiM45UuEOAU45w8tFwLrO/do2+Xw0Pkt+GKvOFkKQY0abIt+ea55Aq5AjZ87Ik0Onv4nbOU++mP/i/bHk38jCR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712261773; c=relaxed/simple;
	bh=o/aLvGaFKj00SIaJWBBbbmeiiLOCgPX9wUv17/oFdwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lCHArz4yR3BaFb0kGEXB1TIpzRwrzA+8lPpkfcJJGR0p/c7UXvCQPC6YnCDu/sOW4r2ns68jyS6/FSmzmZc+B/ok5SUlRvvcOrI+2zUteA+l+l3LT90zvXlOipX73ceNguglg4fNCnxSgdUhYFiA3FOwrtZLI+4C+XEIyAuM0Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKdeysKG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKdeysKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712261771; x=1743797771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/aLvGaFKj00SIaJWBBbbmeiiLOCgPX9wUv17/oFdwQ=;
  b=QKdeysKGF5WZIt/vMuBNIfJ+S/EKIzrE+To8Ejlv+TplrS+z8Agy/STA
   qEbBK5M9T7heXROXyRAYmqw6gggKzhG8uPgekE1LEFZf2X9RNkmS+vUbx
   5rMG46OW4cDX7wYYn3bDUqABjWsitJ78IFJrHWvy/KybQCH7/00IgUaMn
   UogB/PYooxUQB8c/2ur2Wo68s0zaW2Ds3Er4EFBPMdzvvecGEMQGkEynk
   So+GflAEvPXgWX0bwl8f3EpyRdHZ5YjZYEnG9fM7uaixuDrXA79UN3N2X
   RmGnw1ZJSE74FBtfDitu9xymQ9OC4zoIn1VfpfSlk8aZyqWPOPALSqlT9
   w==;
X-CSE-ConnectionGUID: ChXIG3QZQteH5xqFh/x+9g==
X-CSE-MsgGUID: 0dFRQnwyQde1qVK+WkjIyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7810400"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7810400"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 13:16:09 -0700
X-CSE-ConnectionGUID: kA3ivlD1QwCpvxnuEGgXBQ==
X-CSE-MsgGUID: 7mPsTjnPQzWppMh43zeHsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18847560"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Apr 2024 13:16:08 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsTVF-0001TT-2T;
	Thu, 04 Apr 2024 20:16:05 +0000
Date: Fri, 5 Apr 2024 04:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2674/3921] mm/vmalloc.c:1079:3-9: preceding lock
 on line 1075
Message-ID: <202404050445.yVFqmYIK-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
commit: 936eedaeacdee6663fa552fc650df4cd4d75d3e4 [2674/3921] mm: vmalloc: fix lockdep warning
:::::: branch date: 17 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-104-20240405 (https://download.01.org/0day-ci/archive/20240405/202404050445.yVFqmYIK-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404050445.yVFqmYIK-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/vmalloc.c:1079:3-9: preceding lock on line 1075

vim +1079 mm/vmalloc.c

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
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1049) 	unsigned long va_start_lowest;
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1050) 	struct vmap_node *vn;
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1051) 	int i;
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1052) 
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1053) repeat:
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1054) 	for (i = 0, va_start_lowest = 0; i < nr_vmap_nodes; i++) {
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1055) 		vn = &vmap_nodes[i];
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1056) 
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1057) 		spin_lock(&vn->busy.lock);
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1058) 		*va = __find_vmap_area_exceed_addr(addr, &vn->busy.root);
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1059) 
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1060) 		if (*va)
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1061) 			if (!va_start_lowest || (*va)->va_start < va_start_lowest)
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1062) 				va_start_lowest = (*va)->va_start;
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1063) 		spin_unlock(&vn->busy.lock);
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1064) 	}
53becf32aec1c8 Uladzislau Rezki (Sony  2024-01-02  1065) 
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1066) 	/*
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1067) 	 * Check if found VA exists, it might it is gone away.
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1068) 	 * In this case we repeat the search because a VA has
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1069) 	 * been removed concurrently thus we need to proceed
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1070) 	 * with next one what is a rare case.
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1071) 	 */
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1072) 	if (va_start_lowest) {
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1073) 		vn = addr_to_node(va_start_lowest);
db64fe02258f15 Nicholas Piggin         2008-10-18  1074  
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28 @1075) 		spin_lock(&vn->busy.lock);
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1076) 		*va = __find_vmap_area(va_start_lowest, &vn->busy.root);
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  1077  
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1078) 		if (*va)
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28 @1079) 			return vn;
db64fe02258f15 Nicholas Piggin         2008-10-18  1080  
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1081) 		spin_unlock(&vn->busy.lock);
936eedaeacdee6 Uladzislau Rezki (Sony  2024-03-28  1082) 		goto repeat;
db64fe02258f15 Nicholas Piggin         2008-10-18  1083  	}
db64fe02258f15 Nicholas Piggin         2008-10-18  1084  
db64fe02258f15 Nicholas Piggin         2008-10-18  1085  	return NULL;
db64fe02258f15 Nicholas Piggin         2008-10-18  1086  }
db64fe02258f15 Nicholas Piggin         2008-10-18  1087  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
