Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3E13A9DA2
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Feb 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772020090; cv=none; b=qxx4z6oNcxmyag2tzFYvLkrxjatewgfgBEbDA2rOO+LqNnBIRei4HLtmy64a5jqtXeH2PRWMxIivwvktnTL66KE28vAcK/+I6MacuJNlqaVMkcNw2rbK/N2nyUFY2QKJDmQBzH/i2rfmCPI+jAB9oYuFRFoKowl5i3py5LjtHFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772020090; c=relaxed/simple;
	bh=LzEP0s487kqJwjmNB55cmHqh8qSTUrbfhgxTOeHPcqk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X0VzsD7uuhNjP2P5MjnBFi+MYWYqkxi7OTABRJD5dvbC1HCoZZnyEKqVGeqQB2gEkvAK4dVoX3lDIOcRcFqANdyv+0QB+n1GTM8oX+VCRfn4hU/qgGWypf79CytyCKwijuLbs4NiU4JlDdqWY41oqtPXZNr1l+w2p+lEs2SygWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGhkdkiM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGhkdkiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772020089; x=1803556089;
  h=date:from:to:cc:subject:message-id;
  bh=LzEP0s487kqJwjmNB55cmHqh8qSTUrbfhgxTOeHPcqk=;
  b=QGhkdkiMNrVD/yWjYLBZJbCtFgZuWDpFQq1cWyKU62T2ZmzhVLrfOMxy
   ibmgCVTPqe/MLpza3fmDrez0hKtiW+P/Vy6C//JVzkmBYHArba+FqYeYm
   3XsbqmtBttaHzkLV//Y/bRX94OblZM7r95rm7OFB+9t2PjJDojVaN5jdT
   g8MMmvF9tC8iJ2/52IW6OoPi6xMW7keksMykZoIXrDEAs9bQWk4LtbzI/
   jBN2Fp6O6pJbRPXULJswh4PGACfDEVOtgd42KJC16sx4wUuXJkjhz4hiM
   vkknXNTEekWV4JmgIwIAheNdcjJ1FWBd+Ge1LTDm9P8SqppL1c0DqWaWI
   w==;
X-CSE-ConnectionGUID: HyHMGd1lS+2CVp+Y/rIiSg==
X-CSE-MsgGUID: NkgVWnQQRaar5kqQ/JmqLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76888745"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="76888745"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 03:48:09 -0800
X-CSE-ConnectionGUID: 3LLqs2YJQt2JwV5waQcZIA==
X-CSE-MsgGUID: BXneXCXISd2WLZRj0LxZfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="219625228"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Feb 2026 03:48:07 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvDN7-000000005UX-0knF;
	Wed, 25 Feb 2026 11:48:05 +0000
Date: Wed, 25 Feb 2026 19:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1 1/1]
 drivers/mtd/nand/raw/diskonchip.c:1555:33: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202602251907.vpkS66Mr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mtd/nand/raw/diskonchip.c:1555:33: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6bfa519732146afa9e20af2217316b23388a8491
commit: ad371d69a6785f886b7240bad2a7a993b7e34040 [1/1] mtd: diskonchip: work around ubsan link failure
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 10 months ago
config: arm64-randconfig-r134-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251907.vpkS66Mr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602251907.vpkS66Mr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602251907.vpkS66Mr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/diskonchip.c:1555:33: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/mtd/nand/raw/diskonchip.c:1555:29: sparse: signed value source

vim +1555 drivers/mtd/nand/raw/diskonchip.c

^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1543  
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1544  static int __init init_nanddoc(void)
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1545  {
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1546  	int i, ret = 0;
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1547  
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1548  	if (doc_config_location) {
63fa37f0c51248 drivers/mtd/nand/raw/diskonchip.c Shreeya Patel   2018-02-22  1549  		pr_info("Using configured DiskOnChip probe address 0x%lx\n",
63fa37f0c51248 drivers/mtd/nand/raw/diskonchip.c Shreeya Patel   2018-02-22  1550  			doc_config_location);
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1551  		ret = doc_probe(doc_config_location);
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1552  		if (ret < 0)
964dfce9c2b323 drivers/mtd/nand/raw/diskonchip.c Thomas Gleixner 2018-04-22  1553  			return ret;
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1554  	} else {
ad371d69a6785f drivers/mtd/nand/raw/diskonchip.c Arnd Bergmann   2024-04-05 @1555  		for (i = 0; i < ARRAY_SIZE(doc_locations); i++) {
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1556  			doc_probe(doc_locations[i]);
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1557  		}
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1558  	}
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1559  	/* No banner message any more. Print a message if no DiskOnChip
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1560  	   found, so the user knows we at least tried. */
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1561  	if (!doclist) {
63fa37f0c51248 drivers/mtd/nand/raw/diskonchip.c Shreeya Patel   2018-02-22  1562  		pr_info("No valid DiskOnChip devices found\n");
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1563  		ret = -ENODEV;
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1564  	}
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1565  	return ret;
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1566  }
^1da177e4c3f41 drivers/mtd/nand/diskonchip.c     Linus Torvalds  2005-04-16  1567  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
