Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D95171C2
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 00:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725927554; cv=none; b=WCkPAm4ew7dISd1oRc4NWVhn5+IJCAFlMPSsZWn80ClzSWAjEhzEa3RZQiyRJBjGG6A67IkQddyPMId8gc2+mH7rzt+jp4ckXhYTcOvEbUfFYNpSr/+NdpkAe02isY+fsLM/VWOoR0FAB51lquMbScXEXTP7A/5FZ42im0Rmsy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725927554; c=relaxed/simple;
	bh=Mk+UPDbano5SX+8urFcYogQeH7S14xobcy2n/G16oxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVGlPW8Y+PZQLBQ2S/dSR7KU0kEtK4JuQuHm5DhY0oWKREaUs3qAvxoc6xMIlHD0lDuRk/FUZICTGdDQcYEqzCxWVK1yJ4YiFG42tkMycehCK0EPiAKLjLlFDO5RTo9yx17q4qtnOXCbX6O+rfgwQGuBjKd3BOUAOAHiHX3576c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jddRiX4A; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jddRiX4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725927551; x=1757463551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mk+UPDbano5SX+8urFcYogQeH7S14xobcy2n/G16oxY=;
  b=jddRiX4A4VZWsVLz4Mzb4Gs0q2XwJKqXV9R1mbJwwt/rIUwoMUXWTHRa
   Q4m6SMF44dKZg7qa3iRCAnM9grHnmf43pLpmo7N4e05MtLXEcTchlJ1iS
   kKJf9x/sTkk6rNSM9X3o5R4ZY5b0cExOjoRjwiV3uTSRJ/kc4/15+EZc8
   Pg/kIGA9qlbqcZiy/PhwJwgSlFJRPQD6NRE9e76LWQac8O/rBaa3WaFT7
   Ip91r1qaRadnN9FH6a4B5HApO7GsfFkoKrDWSlPNYPsJF+5ZRBeGLdOxv
   hSnKpmnjeB1/pVNFX+rfWUP9r7XLShJbaduEqlymHSR+jCg6zMzscjUAu
   w==;
X-CSE-ConnectionGUID: shSjBo/uRx+220FDDK9z+w==
X-CSE-MsgGUID: g3oMghqKRu6oJP65hnA6lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24762660"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24762660"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 17:19:11 -0700
X-CSE-ConnectionGUID: CMCiZoR9R2mVffpJQSaIXQ==
X-CSE-MsgGUID: 48CYU3d5R1esjkgjF0YmCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67131186"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Sep 2024 17:19:10 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snob5-000FNY-2Q;
	Tue, 10 Sep 2024 00:19:07 +0000
Date: Tue, 10 Sep 2024 08:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9883/10516] drivers/mtd/nand/spi/core.c:672
 spinand_mtd_regular_page_read() error: uninitialized symbol 'ret'.
Message-ID: <202409100842.ww8hDGNr-lkp@intel.com>
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
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   100cc857359b5d731407d1038f7e76cd0e871d94
commit: 79da17072e22a802a321ca44c9082ee2e855e72b [9883/10516] mtd: spi-nand: Isolate the MTD read logic in a helper
:::::: branch date: 14 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100842.ww8hDGNr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409100842.ww8hDGNr-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/spi/core.c:672 spinand_mtd_regular_page_read() error: uninitialized symbol 'ret'.

vim +/ret +672 drivers/mtd/nand/spi/core.c

7529df4652482c Peter Pan     2018-06-22  632  
79da17072e22a8 Miquel Raynal 2024-08-26  633  static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
79da17072e22a8 Miquel Raynal 2024-08-26  634  					 struct mtd_oob_ops *ops,
79da17072e22a8 Miquel Raynal 2024-08-26  635  					 unsigned int *max_bitflips)
7529df4652482c Peter Pan     2018-06-22  636  {
7529df4652482c Peter Pan     2018-06-22  637  	struct spinand_device *spinand = mtd_to_spinand(mtd);
7529df4652482c Peter Pan     2018-06-22  638  	struct nand_device *nand = mtd_to_nanddev(mtd);
7529df4652482c Peter Pan     2018-06-22  639  	struct nand_io_iter iter;
3d1f08b032dc4e Miquel Raynal 2020-10-01  640  	bool disable_ecc = false;
7529df4652482c Peter Pan     2018-06-22  641  	bool ecc_failed = false;
79da17072e22a8 Miquel Raynal 2024-08-26  642  	int ret;
7529df4652482c Peter Pan     2018-06-22  643  
79da17072e22a8 Miquel Raynal 2024-08-26  644  	if (ops->mode == MTD_OPS_RAW || !mtd->ooblayout)
3d1f08b032dc4e Miquel Raynal 2020-10-01  645  		disable_ecc = true;
7529df4652482c Peter Pan     2018-06-22  646  
701981cab01696 Miquel Raynal 2020-08-27  647  	nanddev_io_for_each_page(nand, NAND_PAGE_READ, from, ops, &iter) {
3d1f08b032dc4e Miquel Raynal 2020-10-01  648  		if (disable_ecc)
3d1f08b032dc4e Miquel Raynal 2020-10-01  649  			iter.req.mode = MTD_OPS_RAW;
7529df4652482c Peter Pan     2018-06-22  650  
3d1f08b032dc4e Miquel Raynal 2020-10-01  651  		ret = spinand_select_target(spinand, iter.req.pos.target);
7529df4652482c Peter Pan     2018-06-22  652  		if (ret)
7529df4652482c Peter Pan     2018-06-22  653  			break;
7529df4652482c Peter Pan     2018-06-22  654  
3d1f08b032dc4e Miquel Raynal 2020-10-01  655  		ret = spinand_read_page(spinand, &iter.req);
7529df4652482c Peter Pan     2018-06-22  656  		if (ret < 0 && ret != -EBADMSG)
7529df4652482c Peter Pan     2018-06-22  657  			break;
7529df4652482c Peter Pan     2018-06-22  658  
c93081b265735d Miquel Raynal 2021-05-27  659  		if (ret == -EBADMSG)
7529df4652482c Peter Pan     2018-06-22  660  			ecc_failed = true;
c93081b265735d Miquel Raynal 2021-05-27  661  		else
79da17072e22a8 Miquel Raynal 2024-08-26  662  			*max_bitflips = max_t(unsigned int, *max_bitflips, ret);
7529df4652482c Peter Pan     2018-06-22  663  
b83408b580eccf WeiXiong Liao 2019-06-28  664  		ret = 0;
7529df4652482c Peter Pan     2018-06-22  665  		ops->retlen += iter.req.datalen;
7529df4652482c Peter Pan     2018-06-22  666  		ops->oobretlen += iter.req.ooblen;
7529df4652482c Peter Pan     2018-06-22  667  	}
7529df4652482c Peter Pan     2018-06-22  668  
79da17072e22a8 Miquel Raynal 2024-08-26  669  	if (ecc_failed && !ret)
79da17072e22a8 Miquel Raynal 2024-08-26  670  		ret = -EBADMSG;
79da17072e22a8 Miquel Raynal 2024-08-26  671  
79da17072e22a8 Miquel Raynal 2024-08-26 @672  	return ret;
79da17072e22a8 Miquel Raynal 2024-08-26  673  }
79da17072e22a8 Miquel Raynal 2024-08-26  674  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
