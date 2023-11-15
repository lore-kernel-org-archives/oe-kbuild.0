Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C557381CD
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="glNZgJLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700061894; x=1731597894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l9G1WoZgHyeu+WHyhvpIeo+v3rW+LCLJuv34OwpzYCg=;
  b=glNZgJLJssi9pjg0nj+P+/7SaLOV6lBLGba61rxe/OzqJKgkhMVy41Kg
   xxARxNFQsw4dRihFrdIg7TFAnVZCN3WR9p3KJoRAyj7KT/+xOPGMeXXjQ
   lkJIuRtFhWMHmYPogZAEkO44a/0TLh7S/IwxrSc5hIcGQpcOFCIOTerNq
   eYsX5skBrS3XBJBvHUPFnEBzcZfg+QTe77TYE8PXgPFhhUPwjUTIca/tg
   dyuxpRluYwRhYR1qH00djHJAK8/rqHcrzi0oyN0nPc1qSSb/lEyfajVjM
   esyMSKPb1Z0hS6iMA1CAp4aBLgllFQL+FzcMBimNHB82uBEZM14vok1lW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="394814366"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="394814366"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 07:24:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="741466050"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="741466050"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Nov 2023 07:24:52 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Hl0-0000Se-2w;
	Wed, 15 Nov 2023 15:24:48 +0000
Date: Wed, 15 Nov 2023 23:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/md/dm-target.c:139:32: sparse: sparse: self-comparison
 always evaluates to false
Message-ID: <202311152321.KfEFHcxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/md/dm-target.c:139:32: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Damien Le Moal <dlemoal@kernel.org>
CC: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: a951104333bd25bb6e5d0f5bee9cbf155b66fac1 dm error: Add support for zoned block devices
date:   2 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-061-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152321.KfEFHcxn-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152321.KfEFHcxn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311152321.KfEFHcxn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/dm-target.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>> drivers/md/dm-target.c:139:32: sparse: sparse: self-comparison always evaluates to false

vim +139 drivers/md/dm-target.c

a951104333bd25 Damien Le Moal 2023-10-26  123  
a951104333bd25 Damien Le Moal 2023-10-26  124  static int io_err_get_args(struct dm_target *tt, unsigned int argc, char **args)
a951104333bd25 Damien Le Moal 2023-10-26  125  {
a951104333bd25 Damien Le Moal 2023-10-26  126  	unsigned long long start;
a951104333bd25 Damien Le Moal 2023-10-26  127  	struct io_err_c *ioec;
a951104333bd25 Damien Le Moal 2023-10-26  128  	char dummy;
a951104333bd25 Damien Le Moal 2023-10-26  129  	int ret;
a951104333bd25 Damien Le Moal 2023-10-26  130  
a951104333bd25 Damien Le Moal 2023-10-26  131  	ioec = kmalloc(sizeof(*ioec), GFP_KERNEL);
a951104333bd25 Damien Le Moal 2023-10-26  132  	if (!ioec) {
a951104333bd25 Damien Le Moal 2023-10-26  133  		tt->error = "Cannot allocate io_err context";
a951104333bd25 Damien Le Moal 2023-10-26  134  		return -ENOMEM;
a951104333bd25 Damien Le Moal 2023-10-26  135  	}
a951104333bd25 Damien Le Moal 2023-10-26  136  
a951104333bd25 Damien Le Moal 2023-10-26  137  	ret = -EINVAL;
a951104333bd25 Damien Le Moal 2023-10-26  138  	if (sscanf(args[1], "%llu%c", &start, &dummy) != 1 ||
a951104333bd25 Damien Le Moal 2023-10-26 @139  	    start != (sector_t)start) {
a951104333bd25 Damien Le Moal 2023-10-26  140  		tt->error = "Invalid device sector";
a951104333bd25 Damien Le Moal 2023-10-26  141  		goto bad;
a951104333bd25 Damien Le Moal 2023-10-26  142  	}
a951104333bd25 Damien Le Moal 2023-10-26  143  	ioec->start = start;
a951104333bd25 Damien Le Moal 2023-10-26  144  
a951104333bd25 Damien Le Moal 2023-10-26  145  	ret = dm_get_device(tt, args[0], dm_table_get_mode(tt->table), &ioec->dev);
a951104333bd25 Damien Le Moal 2023-10-26  146  	if (ret) {
a951104333bd25 Damien Le Moal 2023-10-26  147  		tt->error = "Device lookup failed";
a951104333bd25 Damien Le Moal 2023-10-26  148  		goto bad;
a951104333bd25 Damien Le Moal 2023-10-26  149  	}
a951104333bd25 Damien Le Moal 2023-10-26  150  
a951104333bd25 Damien Le Moal 2023-10-26  151  	tt->private = ioec;
a951104333bd25 Damien Le Moal 2023-10-26  152  
a951104333bd25 Damien Le Moal 2023-10-26  153  	return 0;
a951104333bd25 Damien Le Moal 2023-10-26  154  
a951104333bd25 Damien Le Moal 2023-10-26  155  bad:
a951104333bd25 Damien Le Moal 2023-10-26  156  	kfree(ioec);
a951104333bd25 Damien Le Moal 2023-10-26  157  
a951104333bd25 Damien Le Moal 2023-10-26  158  	return ret;
a951104333bd25 Damien Le Moal 2023-10-26  159  }
a951104333bd25 Damien Le Moal 2023-10-26  160  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
