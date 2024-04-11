Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3713BAEA
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712807588; cv=none; b=C9plwLDIY6XquhrBNuUKjNrEF8hLQc+kSdvVUfUKmFicjaFtM1ZT5n3H+Oko6/R6lvTjctMGb6qmf/GqpG08+dH6jBxJxZHtkPmt0YWqL+c5NyXDuA2pxwLxHDE2jlCZOiiqXO42z8k3xlQhKzuvuYeaEI9KRoEXflC1IaMhXLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712807588; c=relaxed/simple;
	bh=MA5o5eLmB5mTrfp9NINLbrXMXTIkhtQ6PsRumneM1to=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QTodXeK3eqG7czp/IPzbTyNry/s32Yvy6JR8jIDJlG2giN31qivVVmhxg7N6SE4QLRz8LltWmhSQfjHQsN/v24WY9WW1bTzNcuf/Yk+09cfXov3ynFvvN6LF/lWQTIuzdBZTwfxxf5xn8IERq43z0fZG6jsoxatw2gQZ1HaKKeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QwqQRANb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QwqQRANb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712807586; x=1744343586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MA5o5eLmB5mTrfp9NINLbrXMXTIkhtQ6PsRumneM1to=;
  b=QwqQRANbhKgUB0nt9UVBnM8CcK11SXtM4D6QHewSXXdsHP8OAFWO/HwW
   b7dg8LJ2nvgG652MrEeDppn7s16EtVIK7+6tASfluYxsItj/2PRCTQpIw
   GVQ1zlSfly27YpVhzLj45GBV64aH4ge/npbZw9nxZ0Rtzoa+FKy1dUjqy
   VnR7zbG5l3FxivMekS1I6X4uW9l8UvWSUL4SXFO5MMdWD37pl7Zreg5VI
   UgZKd0oetTmB3idFOnD1jGK9X6IdP6i6Y7drUjDT+apJt0cVy+ykDJlDu
   Oo+71eY7p5CFVN3cMbuG3tZ1sTJdKLUVJdQiQLwQZDxv3/pjQtW13uVKM
   A==;
X-CSE-ConnectionGUID: NB8D8rn9SNqkfABYJGyUng==
X-CSE-MsgGUID: PVgU+gP1T/CfnvmGX3m+xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33599878"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="33599878"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 20:53:05 -0700
X-CSE-ConnectionGUID: jRWHRBGuRiGLvFUKxkWaUw==
X-CSE-MsgGUID: Fl7CJzZVTk+xdGzWo4fEpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="21270486"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2024 20:53:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rulUj-0008Bo-26;
	Thu, 11 Apr 2024 03:53:01 +0000
Date: Thu, 11 Apr 2024 11:52:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [mcgrof:20240408-lbs-scsi-kludge 14/23]
 drivers/nvme/host/core.c:2013:23-24: WARNING this kind of initialization is
 deprecated
Message-ID: <202404111102.1Baqm0i9-lkp@intel.com>
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
TO: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20240408-lbs-scsi-kludge
head:   4fa968dd0b213274f661a4ff005dd1190935617b
commit: 2542b8b1513ab1032021f14a9ff40708577c4ff8 [14/23] nvme: add nvme_core.debug_large_atomics to force high awun as phys_bs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-051-20240411 (https://download.01.org/0day-ci/archive/20240411/202404111102.1Baqm0i9-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404111102.1Baqm0i9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/host/core.c:2013:23-24: WARNING this kind of initialization is deprecated

vim +2013 drivers/nvme/host/core.c

1f7f4dce548cc1 Luis Chamberlain  2023-03-27  1948  
d386aedc94efe2 Daniel Wagner     2023-12-18  1949  static void nvme_update_disk_info(struct nvme_ctrl *ctrl, struct gendisk *disk,
d386aedc94efe2 Daniel Wagner     2023-12-18  1950  		struct nvme_ns_head *head, struct nvme_id_ns *id)
24b0b58c5b4a9f Christoph Hellwig 2017-11-02  1951  {
d386aedc94efe2 Daniel Wagner     2023-12-18  1952  	sector_t capacity = nvme_lba_to_sect(head, le64_to_cpu(id->nsze));
d386aedc94efe2 Daniel Wagner     2023-12-18  1953  	u32 bs = 1U << head->lba_shift;
68ab60ca2d6bd8 Damien Le Moal    2020-05-14  1954  	u32 atomic_bs, phys_bs, io_opt = 0;
98087a16e36c3f Luis Chamberlain  2023-06-07  1955  	u32 awun = 0, awun_bs = 0;
24b0b58c5b4a9f Christoph Hellwig 2017-11-02  1956  
13f0b26bbf0a86 Christoph Hellwig 2020-09-28  1957  	/*
13f0b26bbf0a86 Christoph Hellwig 2020-09-28  1958  	 * The block layer can't support LBA sizes larger than the page size
74fbc88e161424 Keith Busch       2023-11-28  1959  	 * or smaller than a sector size yet, so catch this early and don't
74fbc88e161424 Keith Busch       2023-11-28  1960  	 * allow block I/O.
13f0b26bbf0a86 Christoph Hellwig 2020-09-28  1961  	 */
1f7f4dce548cc1 Luis Chamberlain  2023-03-27  1962  	if (!nvme_lba_shift_supported(head, ctrl)) {
13f0b26bbf0a86 Christoph Hellwig 2020-09-28  1963  		capacity = 0;
01fa017484ad98 Sagi Grimberg     2019-03-11  1964  		bs = (1 << 9);
1f7f4dce548cc1 Luis Chamberlain  2023-03-27  1965  		dev_warn(ctrl->device, "I'm sorry dave, I'm afraid I can't do that\n");
01fa017484ad98 Sagi Grimberg     2019-03-11  1966  	}
f9d5f4579feafa Christoph Hellwig 2020-09-28  1967  
24b0b58c5b4a9f Christoph Hellwig 2017-11-02  1968  	blk_integrity_unregister(disk);
24b0b58c5b4a9f Christoph Hellwig 2017-11-02  1969  
68ab60ca2d6bd8 Damien Le Moal    2020-05-14  1970  	atomic_bs = phys_bs = bs;
81adb863349157 Bart Van Assche   2019-06-28  1971  	if (id->nabo == 0) {
81adb863349157 Bart Van Assche   2019-06-28  1972  		/*
81adb863349157 Bart Van Assche   2019-06-28  1973  		 * Bit 1 indicates whether NAWUPF is defined for this namespace
81adb863349157 Bart Van Assche   2019-06-28  1974  		 * and whether it should be used instead of AWUPF. If NAWUPF ==
81adb863349157 Bart Van Assche   2019-06-28  1975  		 * 0 then AWUPF must be used instead.
81adb863349157 Bart Van Assche   2019-06-28  1976  		 */
92decf118f1da4 Keith Busch       2020-04-03  1977  		if (id->nsfeat & NVME_NS_FEAT_ATOMICS && id->nawupf)
81adb863349157 Bart Van Assche   2019-06-28  1978  			atomic_bs = (1 + le16_to_cpu(id->nawupf)) * bs;
81adb863349157 Bart Van Assche   2019-06-28  1979  		else
d386aedc94efe2 Daniel Wagner     2023-12-18  1980  			atomic_bs = (1 + ctrl->subsys->awupf) * bs;
98087a16e36c3f Luis Chamberlain  2023-06-07  1981  		if (id->nsfeat & NVME_NS_FEAT_ATOMICS && id->nawun)
98087a16e36c3f Luis Chamberlain  2023-06-07  1982  			awun = (1 + le16_to_cpu(id->nawun));
98087a16e36c3f Luis Chamberlain  2023-06-07  1983  		else
98087a16e36c3f Luis Chamberlain  2023-06-07  1984  			awun = (1 + ctrl->subsys->awun);
98087a16e36c3f Luis Chamberlain  2023-06-07  1985  		/* Indicates MDTS can be used */
98087a16e36c3f Luis Chamberlain  2023-06-07  1986  		if (awun == 0xffff)
98087a16e36c3f Luis Chamberlain  2023-06-07  1987  			awun_bs = ctrl->max_hw_sectors << SECTOR_SHIFT;
98087a16e36c3f Luis Chamberlain  2023-06-07  1988  		else
98087a16e36c3f Luis Chamberlain  2023-06-07  1989  			awun_bs = awun * bs;
81adb863349157 Bart Van Assche   2019-06-28  1990  	}
31fdad7be18992 Keith Busch       2020-04-09  1991  
92decf118f1da4 Keith Busch       2020-04-03  1992  	if (id->nsfeat & NVME_NS_FEAT_IO_OPT) {
81adb863349157 Bart Van Assche   2019-06-28  1993  		/* NPWG = Namespace Preferred Write Granularity */
31fdad7be18992 Keith Busch       2020-04-09  1994  		phys_bs = bs * (1 + le16_to_cpu(id->npwg));
81adb863349157 Bart Van Assche   2019-06-28  1995  		/* NOWS = Namespace Optimal Write Size */
31fdad7be18992 Keith Busch       2020-04-09  1996  		io_opt = bs * (1 + le16_to_cpu(id->nows));
81adb863349157 Bart Van Assche   2019-06-28  1997  	}
81adb863349157 Bart Van Assche   2019-06-28  1998  
98087a16e36c3f Luis Chamberlain  2023-06-07  1999  	if (awun) {
98087a16e36c3f Luis Chamberlain  2023-06-07  2000  		phys_bs = min(awun_bs, phys_bs);
98087a16e36c3f Luis Chamberlain  2023-06-07  2001  
98087a16e36c3f Luis Chamberlain  2023-06-07  2002  		/*
98087a16e36c3f Luis Chamberlain  2023-06-07  2003  		 * npwg and nows could be > awun, in such cases users should
98087a16e36c3f Luis Chamberlain  2023-06-07  2004  		 * be aware of out of order reads/writes as npwg and nows
98087a16e36c3f Luis Chamberlain  2023-06-07  2005  		 * are purely performance optimizations.
98087a16e36c3f Luis Chamberlain  2023-06-07  2006  		 */
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2007  
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2008  		/*
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2009  		 * If you're not concerned about power failure, in theory,
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2010  		 * you should be able to experiment up to awun rather safely.
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2011  		 */
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2012  		if (debug_large_atomics) {
2542b8b1513ab1 Luis Chamberlain  2023-06-07 @2013  			debug_large_atomics = debug_large_atomics;
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2014  			phys_bs = atomic_bs = debug_large_atomics;
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2015  			dev_info(ctrl->device,
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2016  				 "Forcing large atomic: %u (awun_bs: %u awun: %u)\n",
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2017  				 debug_large_atomics, awun_bs, awun);
2542b8b1513ab1 Luis Chamberlain  2023-06-07  2018  		}
98087a16e36c3f Luis Chamberlain  2023-06-07  2019  	}
98087a16e36c3f Luis Chamberlain  2023-06-07  2020  
cee160fd34b459 Jeff Lien         2017-12-19  2021  	blk_queue_logical_block_size(disk->queue, bs);
81adb863349157 Bart Van Assche   2019-06-28  2022  	/*
81adb863349157 Bart Van Assche   2019-06-28  2023  	 * Linux filesystems assume writing a single physical block is
81adb863349157 Bart Van Assche   2019-06-28  2024  	 * an atomic operation. Hence limit the physical block size to the
81adb863349157 Bart Van Assche   2019-06-28  2025  	 * value of the Atomic Write Unit Power Fail parameter.
81adb863349157 Bart Van Assche   2019-06-28  2026  	 */
81adb863349157 Bart Van Assche   2019-06-28  2027  	blk_queue_physical_block_size(disk->queue, min(phys_bs, atomic_bs));
81adb863349157 Bart Van Assche   2019-06-28  2028  	blk_queue_io_min(disk->queue, phys_bs);
81adb863349157 Bart Van Assche   2019-06-28  2029  	blk_queue_io_opt(disk->queue, io_opt);
cee160fd34b459 Jeff Lien         2017-12-19  2030  
b29f84857a0f1c Max Gurtovoy      2020-05-19  2031  	/*
b29f84857a0f1c Max Gurtovoy      2020-05-19  2032  	 * Register a metadata profile for PI, or the plain non-integrity NVMe
b29f84857a0f1c Max Gurtovoy      2020-05-19  2033  	 * metadata masquerading as Type 0 if supported, otherwise reject block
b29f84857a0f1c Max Gurtovoy      2020-05-19  2034  	 * I/O to namespaces with metadata except when the namespace supports
b29f84857a0f1c Max Gurtovoy      2020-05-19  2035  	 * PI, as it can strip/insert in that case.
b29f84857a0f1c Max Gurtovoy      2020-05-19  2036  	 */
d386aedc94efe2 Daniel Wagner     2023-12-18  2037  	if (head->ms) {
b29f84857a0f1c Max Gurtovoy      2020-05-19  2038  		if (IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY) &&
d386aedc94efe2 Daniel Wagner     2023-12-18  2039  		    (head->features & NVME_NS_METADATA_SUPPORTED))
d386aedc94efe2 Daniel Wagner     2023-12-18  2040  			nvme_init_integrity(disk, head,
d386aedc94efe2 Daniel Wagner     2023-12-18  2041  					    ctrl->max_integrity_segments);
d386aedc94efe2 Daniel Wagner     2023-12-18  2042  		else if (!nvme_ns_has_pi(head))
24b0b58c5b4a9f Christoph Hellwig 2017-11-02  2043  			capacity = 0;
b29f84857a0f1c Max Gurtovoy      2020-05-19  2044  	}
24b0b58c5b4a9f Christoph Hellwig 2017-11-02  2045  
449f4ec9892ebc Christoph Hellwig 2020-11-16  2046  	set_capacity_and_notify(disk, capacity);
b1aafb35b45b1d Christoph Hellwig 2019-03-13  2047  
d386aedc94efe2 Daniel Wagner     2023-12-18  2048  	nvme_config_discard(ctrl, disk, head);
5befc7c26e5a98 Keith Busch       2021-03-24  2049  	blk_queue_max_write_zeroes_sectors(disk->queue,
d386aedc94efe2 Daniel Wagner     2023-12-18  2050  					   ctrl->max_zeroes_sectors);
24b0b58c5b4a9f Christoph Hellwig 2017-11-02  2051  }
24b0b58c5b4a9f Christoph Hellwig 2017-11-02  2052  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
