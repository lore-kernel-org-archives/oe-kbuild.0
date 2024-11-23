Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3FEA95C
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732363183; cv=none; b=JmwZwxZhUCjhmujhCX9wN0mjzIswvJ7xrvar7FL8c6+XH5/8gBRkuVcVdvUiONSxS2DcOyEr4hUDilyHYd7f5p37EugCsHJbUfH6lHAqz0F60fFl6BDQ6QtF7SmJaUZVgWYUslQYHKVfZFPjpuBVLz/ItBQa2CyjW1dudLFXzaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732363183; c=relaxed/simple;
	bh=gC/Yh4ylDqeFOdqh5/j4vTPI8z5cq+4d7HR6FqFtP4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LEROSjze8V5tYxyiRylOkgAZ25u5oGpsC6P9kU8vh2qCLJ0AHoUL4GWM6ggbgvo9A6Zhe/HLRgDdfC8MBDcwEG41aQS2qleVjPrXyNrdE4y+jDUJE4qICCF83KP0EgkaoGEpI7wkrZ8uu4xzqLi3Si738eJitfh2+DB4QXp8gvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfLaXt23; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfLaXt23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732363181; x=1763899181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gC/Yh4ylDqeFOdqh5/j4vTPI8z5cq+4d7HR6FqFtP4w=;
  b=QfLaXt23ka0U6fvZHHlMMEhk72UUwuuAxRmzfGaiPOx8p68MAGOVrMHX
   7Of3jj9xC17Q0mx3tehUIafIOxTfa+fkHk8lIfUkGLtgiL51yJ8g/TPcD
   FhA8mGpDEDDQ4dU9ooxSLnlTzMQTBTGTgODAZzb4A4HxAv3ioUSoO6yOP
   RIQldhHfguZkOjDv15yDw+yBwXVEIiH0c/HmpVbKR7gEabVB11+Y3wji2
   mu04Fg9L4fE4oF2sDUUQOMIeLmLsObjkVp3CBlofNrL5EJrBS7OxNtHRk
   ntHrTu0YiR3sjxsmWSmQb37Zy8lvEP8nEicqVjFxwxijp3g7thAlcXeTD
   A==;
X-CSE-ConnectionGUID: m5Z5tD0RSVeg0bn521uK7g==
X-CSE-MsgGUID: wiW6ho9pTGOuVb/6tTcI4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31897443"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="31897443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 03:59:40 -0800
X-CSE-ConnectionGUID: jTAJJHdKQGWygzrucWQ/bA==
X-CSE-MsgGUID: uduwctL1SXy90aC/Ndp6jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="95590243"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Nov 2024 03:59:39 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEonZ-0004bj-0e;
	Sat, 23 Nov 2024 11:59:37 +0000
Date: Sat, 23 Nov 2024 19:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2466/2466] drivers/net/bonding/bond_sysctl.c:11
 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression :
 bond_broadcast_arp_or_nd_table[1]->procname
Message-ID: <202411231901.RiFcrQuA-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: "openeuler-sync-bot" <openeuler.syncbot@gmail.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   87bba796cf0405f8832bd4971fc5ffc6aed586c8
commit: 337eb92cdbafcc9ec159404e382d6254672948c2 [2466/2466] anolis: bond: broadcast ARP or ND messages to all slaves
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 4 months ago
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241123/202411231901.RiFcrQuA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411231901.RiFcrQuA-lkp@intel.com/

smatch warnings:
drivers/net/bonding/bond_sysctl.c:11 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : bond_broadcast_arp_or_nd_table[1]->procname
drivers/net/bonding/bond_sysctl.c:11 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : bond_broadcast_arp_or_nd_table[1]->proc_handler

vim +11 drivers/net/bonding/bond_sysctl.c

337eb92cdbafcc Tony Lu 2023-01-10  10  
337eb92cdbafcc Tony Lu 2023-01-10 @11  static struct ctl_table bond_broadcast_arp_or_nd_table[] = {
337eb92cdbafcc Tony Lu 2023-01-10  12  	{
337eb92cdbafcc Tony Lu 2023-01-10  13  		.procname	= "broadcast_arp_or_nd",
337eb92cdbafcc Tony Lu 2023-01-10  14  		.data		= &sysctl_bond_broadcast_arp_or_nd,
337eb92cdbafcc Tony Lu 2023-01-10  15  		.maxlen		= sizeof(int),
337eb92cdbafcc Tony Lu 2023-01-10  16  		.mode		= 0644,
337eb92cdbafcc Tony Lu 2023-01-10  17  		.proc_handler	= proc_dointvec,
337eb92cdbafcc Tony Lu 2023-01-10  18  	},
337eb92cdbafcc Tony Lu 2023-01-10  19  	{}
337eb92cdbafcc Tony Lu 2023-01-10  20  };
337eb92cdbafcc Tony Lu 2023-01-10  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
