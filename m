Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C11F59B64
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Mar 2024 15:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479255; cv=none; b=EDcKL90Gi1z8W2x8eB7sRz6M4n9Uxw6h5hiLrScCmQPlYbsWMk8o/blFPjPqNw8wyYPFvEhGolIcQE7prRg1gaBCj6sh8Youfmq6yXZRN1cey1az5rwruBlGIfRyzz/ZZWH6K3xfYqSG7mJ+Z5YfX+h1FUCDNYA7hMx2WYXZKHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479255; c=relaxed/simple;
	bh=ddshzvr73SL1VGGjoSAZZ/0UvmyOdq3eNoo5xsxrAaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ak/Uxjy6VxxZgedcbrH/ua2I6eKW1qX1Uo4KLNrdjcWwBVaTwMF7r77qjXe4fkC5OZJNhiPI1J48lAsx9ZqwffBbbi/iXeCLci3xy8AtOPD3wagtWwiCB2VTQzMxlbnGkBChrhvzBzIuyl7uBbNdb7qtYa1Rr0MV/41SuwZLuBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpDg6ZBw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpDg6ZBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709479254; x=1741015254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ddshzvr73SL1VGGjoSAZZ/0UvmyOdq3eNoo5xsxrAaE=;
  b=cpDg6ZBwo5KLa5D5Dgvh6xg7K9zlqhadNW8IBhbU5hhD1j0ra7jnEqrr
   3B4tazq5BdHUGAPzrKO9aWKIXyp3Oji7PO97sR/iNEo1B7q1ps9Cybypm
   vLVgkrmHVJHDLLhleiUAJ8G/DySQ46NmscN5qH1mvYe5KOZ1oHgJ8SnRZ
   EYb0AoEj7mqtHNNxy9XASk2IMiYE3bo0EN7qvYVmk5tTtQA2eqH4F9o29
   x2wuVEGLfvHz83YXT0FRynOrASUQPKJxriXFKhtZzXqF6SQXEhZuVbHW7
   UfPxMOClkYrRS2r65lEmfi8Uw9jx6Z7v+8QJrYfCxHDeOnnFja8GCjipr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="21424930"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="21424930"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 07:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9295381"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Mar 2024 07:20:51 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgndw-0001qk-1p;
	Sun, 03 Mar 2024 15:20:48 +0000
Date: Sun, 3 Mar 2024 23:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-block:drbd-blk-limits 5/16] drivers/md/raid0.c:396 raid0_run()
 error: uninitialized symbol 'conf'.
Message-ID: <202403032344.AfnsKzTf-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git drbd-blk-limits
head:   952f67c787298e616a8aa5acc3f881d267e6c7b5
commit: c3361ed114ad32d50e622fdf1e3f27d4a1dde8fb [5/16] md/raid0: use the atomic queue limit update APIs
:::::: branch date: 7 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-161-20240301 (https://download.01.org/0day-ci/archive/20240303/202403032344.AfnsKzTf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403032344.AfnsKzTf-lkp@intel.com/

smatch warnings:
drivers/md/raid0.c:396 raid0_run() error: uninitialized symbol 'conf'.

vim +/conf +396 drivers/md/raid0.c

0366ef847581d69 majianpeng        2012-04-02  381  
fd01b88c75a7180 NeilBrown         2011-10-11  382  static int raid0_run(struct mddev *mddev)
^1da177e4c3f415 Linus Torvalds    2005-04-16  383  {
c3361ed114ad32d Christoph Hellwig 2024-02-22  384  	struct queue_limits lim;
e373ab109172abc NeilBrown         2011-10-11  385  	struct r0conf *conf;
5568a6035d9fca2 Andre Noll        2009-06-16  386  	int ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  387  
9d8f0363623b3da Andre Noll        2009-06-18  388  	if (mddev->chunk_sectors == 0) {
766038846e87574 NeilBrown         2016-11-02  389  		pr_warn("md/raid0:%s: chunk size must be set.\n", mdname(mddev));
2604b703b6b3db8 NeilBrown         2006-01-06  390  		return -EINVAL;
2604b703b6b3db8 NeilBrown         2006-01-06  391  	}
0894cc3066aaa3e Andre Noll        2009-06-18  392  	if (md_check_no_bitmap(mddev))
0894cc3066aaa3e Andre Noll        2009-06-18  393  		return -EINVAL;
753f2856cda2a13 Heinz Mauelshagen 2015-02-13  394  
c3361ed114ad32d Christoph Hellwig 2024-02-22  395  	/* if conf is not null, we are here after takeover */
c3361ed114ad32d Christoph Hellwig 2024-02-22 @396  	if (!conf) {
9af204cf720cedf Trela, Maciej     2010-03-08  397  		ret = create_strip_zones(mddev, &conf);
5568a6035d9fca2 Andre Noll        2009-06-16  398  		if (ret < 0)
c567c86b90d4715 Yu Kuai           2023-06-22  399  			return ret;
9af204cf720cedf Trela, Maciej     2010-03-08  400  		mddev->private = conf;
9af204cf720cedf Trela, Maciej     2010-03-08  401  	}
199dc6ed5179251 NeilBrown         2015-08-03  402  
c3361ed114ad32d Christoph Hellwig 2024-02-22  403  	blk_set_stacking_limits(&lim);
c3361ed114ad32d Christoph Hellwig 2024-02-22  404  	lim.max_hw_sectors = mddev->chunk_sectors;
c3361ed114ad32d Christoph Hellwig 2024-02-22  405  	lim.max_write_zeroes_sectors = mddev->chunk_sectors;
c3361ed114ad32d Christoph Hellwig 2024-02-22  406  	lim.io_min = mddev->chunk_sectors << 9;
c3361ed114ad32d Christoph Hellwig 2024-02-22  407  	lim.io_opt = lim.io_min * mddev->raid_disks;
c3361ed114ad32d Christoph Hellwig 2024-02-22  408  	mddev_stack_rdev_limits(mddev, &lim);
c3361ed114ad32d Christoph Hellwig 2024-02-22  409  	ret = queue_limits_set(mddev->queue, &lim);
c3361ed114ad32d Christoph Hellwig 2024-02-22  410  	if (ret)
c3361ed114ad32d Christoph Hellwig 2024-02-22  411  		goto out_free_conf;
^1da177e4c3f415 Linus Torvalds    2005-04-16  412  
^1da177e4c3f415 Linus Torvalds    2005-04-16  413  	/* calculate array device size */
1f403624bde3c67 Dan Williams      2009-03-31  414  	md_set_array_sectors(mddev, raid0_size(mddev, 0, 0));
^1da177e4c3f415 Linus Torvalds    2005-04-16  415  
766038846e87574 NeilBrown         2016-11-02  416  	pr_debug("md/raid0:%s: md_size is %llu sectors.\n",
b5a20961f3479dd NeilBrown         2010-05-03  417  		 mdname(mddev),
ccacc7d2cf03114 Andre Noll        2009-01-09  418  		 (unsigned long long)mddev->array_sectors);
753f2856cda2a13 Heinz Mauelshagen 2015-02-13  419  
46994191ae8fdf1 raz ben yehuda    2009-06-16  420  	dump_zones(mddev);
0366ef847581d69 majianpeng        2012-04-02  421  
0366ef847581d69 majianpeng        2012-04-02  422  	ret = md_integrity_register(mddev);
0c031fd37f69deb Xiao Ni           2021-12-10  423  	if (ret)
c3361ed114ad32d Christoph Hellwig 2024-02-22  424  		goto out_free_conf;
c3361ed114ad32d Christoph Hellwig 2024-02-22  425  	return 0;
c3361ed114ad32d Christoph Hellwig 2024-02-22  426  out_free_conf:
0c031fd37f69deb Xiao Ni           2021-12-10  427  	free_conf(mddev, conf);
0c031fd37f69deb Xiao Ni           2021-12-10  428  	return ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  429  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  430  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
