Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A35E554
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Dec 2023 21:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kp8to+sL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703453056; x=1734989056;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o7zJmQ3ydcl3TIGbvwu/Jar89PkaJ4wwa+URUABz2o0=;
  b=Kp8to+sL2GDO6A43R4iYWR4eziiF4qo6fPLaLL75lmtzwNSTIjSlLUyx
   hBU+Y245l8qnumxEenCN6Q0g/qpaZFX35CpcFjTdQ3llDQkYvsqJ4Z3pt
   VcWAFicp0ZOuMBiBnF7TmL9Y1YSY5WnErret4pMDpMZIcpuLGP3h2zLCW
   EKX35OJeLuo0zjvNgzXzPXUruVZNkHtE8T564prPKHkSFMqaNc7VZRqG2
   JqZ0IlQLzvadNCA4u2TX/8KAjEh/lJul6Aybh6YZOwZvOqCdJoLNKG0hA
   ndzwp8sOOxtmEf3yqK0NZAJ2hjKhVQbRfdw50coKBnrLcjWMLFL6NtnES
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="376388656"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="376388656"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 13:24:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="781113109"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="781113109"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 24 Dec 2023 13:24:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHVxB-000Cf3-2B;
	Sun, 24 Dec 2023 21:24:10 +0000
Date: Mon, 25 Dec 2023 05:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/mtd/mtdcore.c:577:1-23: WARNING: Function
 "for_each_child_of_node" should have of_node_put() before break around line
 594.
Message-ID: <202312250546.ISzglvM2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rafał Miłecki" <rafal@milecki.pl>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   861deac3b092f37b2c5e6871732f3e11486f7082
commit: 2df11f00100d7278185a9dbefa20ba3f5d32401d mtd: core: try to find OF node for every MTD partition
date:   1 year, 2 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 1 year, 2 months ago
config: loongarch-randconfig-r062-20231222 (https://download.01.org/0day-ci/archive/20231225/202312250546.ISzglvM2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312250546.ISzglvM2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/mtdcore.c:577:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before break around line 594.

vim +/for_each_child_of_node +577 drivers/mtd/mtdcore.c

c4dfa25ab307a2 Alban Bedel       2018-11-13  548  
ad9b10d1eaada1 Christian Marangi 2022-06-22  549  static void mtd_check_of_node(struct mtd_info *mtd)
ad9b10d1eaada1 Christian Marangi 2022-06-22  550  {
ad9b10d1eaada1 Christian Marangi 2022-06-22  551  	struct device_node *partitions, *parent_dn, *mtd_dn = NULL;
ad9b10d1eaada1 Christian Marangi 2022-06-22  552  	const char *pname, *prefix = "partition-";
ad9b10d1eaada1 Christian Marangi 2022-06-22  553  	int plen, mtd_name_len, offset, prefix_len;
ad9b10d1eaada1 Christian Marangi 2022-06-22  554  
ad9b10d1eaada1 Christian Marangi 2022-06-22  555  	/* Check if MTD already has a device node */
c5f5d0cd40e3bc Rafał Miłecki     2022-10-04  556  	if (mtd_get_of_node(mtd))
ad9b10d1eaada1 Christian Marangi 2022-06-22  557  		return;
ad9b10d1eaada1 Christian Marangi 2022-06-22  558  
7ec4cdb321738d Tetsuo Handa      2022-07-25  559  	if (!mtd_is_partition(mtd))
7ec4cdb321738d Tetsuo Handa      2022-07-25  560  		return;
c5f5d0cd40e3bc Rafał Miłecki     2022-10-04  561  
c5f5d0cd40e3bc Rafał Miłecki     2022-10-04  562  	parent_dn = of_node_get(mtd_get_of_node(mtd->parent));
ad9b10d1eaada1 Christian Marangi 2022-06-22  563  	if (!parent_dn)
ad9b10d1eaada1 Christian Marangi 2022-06-22  564  		return;
ad9b10d1eaada1 Christian Marangi 2022-06-22  565  
2df11f00100d72 Rafał Miłecki     2022-10-04  566  	if (mtd_is_partition(mtd->parent))
2df11f00100d72 Rafał Miłecki     2022-10-04  567  		partitions = of_node_get(parent_dn);
2df11f00100d72 Rafał Miłecki     2022-10-04  568  	else
ad9b10d1eaada1 Christian Marangi 2022-06-22  569  		partitions = of_get_child_by_name(parent_dn, "partitions");
ad9b10d1eaada1 Christian Marangi 2022-06-22  570  	if (!partitions)
ad9b10d1eaada1 Christian Marangi 2022-06-22  571  		goto exit_parent;
ad9b10d1eaada1 Christian Marangi 2022-06-22  572  
ad9b10d1eaada1 Christian Marangi 2022-06-22  573  	prefix_len = strlen(prefix);
ad9b10d1eaada1 Christian Marangi 2022-06-22  574  	mtd_name_len = strlen(mtd->name);
ad9b10d1eaada1 Christian Marangi 2022-06-22  575  
ad9b10d1eaada1 Christian Marangi 2022-06-22  576  	/* Search if a partition is defined with the same name */
ad9b10d1eaada1 Christian Marangi 2022-06-22 @577  	for_each_child_of_node(partitions, mtd_dn) {
ad9b10d1eaada1 Christian Marangi 2022-06-22  578  		/* Skip partition with no/wrong prefix */
c5f5d0cd40e3bc Rafał Miłecki     2022-10-04  579  		if (!of_node_name_prefix(mtd_dn, prefix))
ad9b10d1eaada1 Christian Marangi 2022-06-22  580  			continue;
ad9b10d1eaada1 Christian Marangi 2022-06-22  581  
ad9b10d1eaada1 Christian Marangi 2022-06-22  582  		/* Label have priority. Check that first */
c5f5d0cd40e3bc Rafał Miłecki     2022-10-04  583  		if (!of_property_read_string(mtd_dn, "label", &pname)) {
c5f5d0cd40e3bc Rafał Miłecki     2022-10-04  584  			offset = 0;
c5f5d0cd40e3bc Rafał Miłecki     2022-10-04  585  		} else {
c5f5d0cd40e3bc Rafał Miłecki     2022-10-04  586  			pname = mtd_dn->name;
ad9b10d1eaada1 Christian Marangi 2022-06-22  587  			offset = prefix_len;
ad9b10d1eaada1 Christian Marangi 2022-06-22  588  		}
ad9b10d1eaada1 Christian Marangi 2022-06-22  589  
ad9b10d1eaada1 Christian Marangi 2022-06-22  590  		plen = strlen(pname) - offset;
ad9b10d1eaada1 Christian Marangi 2022-06-22  591  		if (plen == mtd_name_len &&
ad9b10d1eaada1 Christian Marangi 2022-06-22  592  		    !strncmp(mtd->name, pname + offset, plen)) {
2df11f00100d72 Rafał Miłecki     2022-10-04  593  			mtd_set_of_node(mtd, mtd_dn);
ad9b10d1eaada1 Christian Marangi 2022-06-22 @594  			break;
ad9b10d1eaada1 Christian Marangi 2022-06-22  595  		}
ad9b10d1eaada1 Christian Marangi 2022-06-22  596  	}
ad9b10d1eaada1 Christian Marangi 2022-06-22  597  
ad9b10d1eaada1 Christian Marangi 2022-06-22  598  	of_node_put(partitions);
ad9b10d1eaada1 Christian Marangi 2022-06-22  599  exit_parent:
ad9b10d1eaada1 Christian Marangi 2022-06-22  600  	of_node_put(parent_dn);
ad9b10d1eaada1 Christian Marangi 2022-06-22  601  }
ad9b10d1eaada1 Christian Marangi 2022-06-22  602  

:::::: The code at line 577 was first introduced by commit
:::::: ad9b10d1eaada169bd764abcab58f08538877e26 mtd: core: introduce of support for dynamic partitions

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
