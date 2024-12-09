Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F7415573D
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719482; cv=none; b=V+H7UFNWGhXSpLok27FRfbZwQfpFzqy4Uw1NcuDp51z0zLUZIe5n0QZTKUQPpPyP4SgwxQHJlCAwYxyHCrtOKPGmaKXouwjtqQuNJeaVOrz2xhAkROQzWET3p5xZzka9VlYHZflAeEsG20Grha3b0H+pne89EaHLfLQTqxLXsLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719482; c=relaxed/simple;
	bh=b9ANR0IeI8IioAcns4MgEJYV+6QZlZkbCyCNxrhi2FI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rX1NNTd9SdIvIqMHS0xyrGKIPMYrsMcGG6JZuDPSJgnS3sJgg4yQFJ6ypb6PfrE5oi76BP+Tn+5Lj3bybmIeb5tGA7H4RcPJFePlw6JFuxyauHki60cGu/v27dmcKyLBgKi2MpguwgpemPhQan3sPFyG4Z7CWTzZF7gvAqSnkfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FaLh8aaq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FaLh8aaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719481; x=1765255481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9ANR0IeI8IioAcns4MgEJYV+6QZlZkbCyCNxrhi2FI=;
  b=FaLh8aaqnanEg/pnzVHCUyFXNNaJf6O+jFTDlbihgbjjiUaupF+0iKOj
   vceITUovH3gU8+hJ5Rw12EGddgmdx3koqbFms5PnIWZZapkx36o4BCnd2
   WtzZkRyy+HJrKVp9No8zg7dHTrtDKS7NNG7+WdMLm7TuTnfXe8s11AYv0
   J/gG1hothDFk6+jeQtUojyJ7bW2/wC+chxsZPOwRTuQgfGxcAJFBhQ3Kn
   6mNA2Q+CvTGrOA5e0E0RFVOMjTQ+SanfT8BI0YF/eYN+e5/4teev/FPrw
   C6CAHro541FDRoPxfHXc0FPYN4ubpbLVhcg1cLge5pJ901mbl86Kx8Euk
   Q==;
X-CSE-ConnectionGUID: 2g1nSv0JTUSyCU5GCQlamw==
X-CSE-MsgGUID: dKkmviz+Rfir6x0jYkETEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="45015205"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="45015205"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:44:40 -0800
X-CSE-ConnectionGUID: 6Mb/4jvHQmqkAdOOqjgFew==
X-CSE-MsgGUID: 00wV1M6TQmicLlEW958dFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94760107"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2024 20:44:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVdM-0003uN-1g;
	Mon, 09 Dec 2024 04:44:36 +0000
Date: Mon, 9 Dec 2024 12:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: mm/vmalloc.c:1078:3-9: preceding lock on line 1074
Message-ID: <202412081436.skXm8EhI-lkp@intel.com>
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
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: fc2c22693c608125bbce174c1952eb4db2f8d07f mm: vmalloc: fix lockdep warning
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-051-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081436.skXm8EhI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412081436.skXm8EhI-lkp@intel.com/

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
