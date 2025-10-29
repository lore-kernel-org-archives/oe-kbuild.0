Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2B031E110
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761729788; cv=none; b=rMTa2dmYdSiQJdYkXBNeGCi5P4cAv2l0SjLrNuHWuNGQCucFGRmSWOHimQCy41eZQMdJQwWYsgjgomOVX86JXmBYUfIzK5ssQ8BouWaM2ikEImK52e4CamsBNjF/YDDPbIqI5YDdayvReOso3QeYc7gLU1sbu4R+Mkqc0NB5qkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761729788; c=relaxed/simple;
	bh=hPXEi5xbsj5yjG5CsARJiDb9uHLOVIqoSin8wuvnM7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XQ58zU1nF/qTFqIyjApMN7fIvS+iMUJ5wUtuvqyvK+1c5JNtbltQsmSclET785GNlU1q+hPpbzECSJCtTgXacGx6RLqR2A9gOc73tYWXhzlfCK//kbVzDB/RaJJyr3zQNHf+nr11JWuWKQz92tDQPH9CralInHuzLLyElQ4Jk4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5N+0euJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5N+0euJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761729786; x=1793265786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPXEi5xbsj5yjG5CsARJiDb9uHLOVIqoSin8wuvnM7I=;
  b=i5N+0euJXct59hZgl98XZS+LCK8EmmAnAgolYqsJExcRtUT/ZpIAGV4V
   0Ar/2s8+NwgqUzlNtFeG1X4tRi3X5vuBvbH9QEmp/kChqDHD763tKDRkf
   UOCKfcM8Z7DzjbJb60mKrEVOaTL6V2JvrEzLmSb3De4xwftuq7TwSWB6+
   qzhv6np+hcfp0MGYAik6gFIefx3cZE9FMvbtQ/WdG24NA+UUMDD2TZzkz
   0co63BhgEbaTq1akqLFb/+RLAIZF6lSC3CkkrWavaj4odWUyHmp6r291Y
   i0IWKsViAH1obNDAxnG9mqyyefqCvvQo4FMdZuCTUlKDj2BerAIS6bg3W
   g==;
X-CSE-ConnectionGUID: vAMy0cvDTaGVyBfJ3CDE/Q==
X-CSE-MsgGUID: IyktbjTRStShHLMceo6TAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67682557"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67682557"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 02:23:05 -0700
X-CSE-ConnectionGUID: lFRQFSt+SJ2KGBsKcMrFaA==
X-CSE-MsgGUID: QkQZ58tzTU6gbgkP1ZPS1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185302132"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2025 02:23:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE2OP-000KS3-2g;
	Wed, 29 Oct 2025 09:22:59 +0000
Date: Wed, 29 Oct 2025 17:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [frank-w-bpi-r2-4.14:6.18-rc 32/146]
 drivers/mtd/mtdrw/mtd-rw.c:62:43-50: WARNING: Consider using %pe to print
 PTR_ERR()
Message-ID: <202510291741.AZRRq6nb-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   2790bcbb80778e0899106b2eadaa7c685691fac1
commit: 24c52fc92a2a5c98418b78e171991bb6351a0dff [32/146] add mtd-rw driver
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: arc-randconfig-r051-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291741.AZRRq6nb-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510291741.AZRRq6nb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mtd/mtdrw/mtd-rw.c:62:43-50: WARNING: Consider using %pe to print PTR_ERR()

vim +62 drivers/mtd/mtdrw/mtd-rw.c

24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  54  
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  55  static int set_writeable(unsigned n, bool w)
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  56  {
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  57  	struct mtd_info *mtd = get_mtd_device(NULL, n);
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  58  	int err;
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  59  
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  60  	if (IS_ERR(mtd)) {
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  61  		if (PTR_ERR(mtd) != -ENODEV || !w) {
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06 @62  			printk(MOD_ERR "mtd%d: error %ld\n", n, PTR_ERR(mtd));
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  63  		}
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  64  		return PTR_ERR(mtd);
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  65  	}
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  66  
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  67  	err = -EEXIST;
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  68  
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  69  	if (w && !(mtd->flags & MTD_WRITEABLE)) {
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  70  		printk(MOD_INFO "mtd%d: setting writeable flag\n", n);
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  71  		mtd->flags |= MTD_WRITEABLE;
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  72  		err = 0;
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  73  	} else if (!w && (mtd->flags & MTD_WRITEABLE)) {
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  74  		printk(MOD_INFO "mtd%d: clearing writeable flag\n", n);
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  75  		mtd->flags &= ~MTD_WRITEABLE;
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  76  		err = 0;
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  77  	}
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  78  
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  79  	put_mtd_device(mtd);
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  80  	return err;
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  81  }
24c52fc92a2a5c9 Frank Wunderlich 2025-07-06  82  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
