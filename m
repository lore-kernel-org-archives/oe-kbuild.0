Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AAA63BB
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jun 2023 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687123844; x=1718659844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/H20xges0uZnz7x3/ug7R9aEPc3WHBDe/KYIqON3Xw=;
  b=V9RgYZV6FjBqHeE7Xx5CkhsrPC2LsTVAvCAuN69ZuevkO51b7/IcYbqD
   8DrR3watniNRe98OaPmiZDP0zwfdYcHc4Xcwh1iogdpeJJ0NmPq9+AB6G
   IQYBBdLwVHvNFGES5m6XV05nq1Or1bCXolfn3wwjQDKtLUPT5VLEukY1h
   J6MgK6b/lK1CwovsuAeEI2CAGc81D3oW3veKtYPdBAZQukT463K3wI76y
   s7sSlcFFBnjcYOiGG5Z1QeEUSioiXRk70J8wDD5sHOJnEn7+F3IRwjwex
   u/tcuP+Apw0hG22qhc00HzkDiWe149WK+p0ownortds6Y95m9cMkBaK9u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="423169904"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="423169904"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 14:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="663774212"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="663774212"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jun 2023 14:30:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAzyr-00043R-0n;
	Sun, 18 Jun 2023 21:30:41 +0000
Date: Mon, 19 Jun 2023 05:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [joelgranados:jag/sysctl-testing-for-0day 17/17]
 drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202306190533.yZhS3sXC-lkp@intel.com>
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
TO: Joel Granados <j.granados@samsung.com>

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   cbba378db4b97256c72560da5762aaed778957c0
commit: cbba378db4b97256c72560da5762aaed778957c0 [17/17] sysctl: Remove the end element in sysctl table arrays
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: sparc64-randconfig-c034-20230618 (https://download.01.org/0day-ci/archive/20230619/202306190533.yZhS3sXC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190533.yZhS3sXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306190533.yZhS3sXC-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
   drivers/parport/procfs.c:364:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +267 drivers/parport/procfs.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  257  
^1da177e4c3f41 Linus Torvalds 2005-04-16  258  
^1da177e4c3f41 Linus Torvalds 2005-04-16  259  struct parport_sysctl_table {
0f95d0ec20343b Joel Granados  2023-06-01  260  	struct ctl_table_header *port_header;
0f95d0ec20343b Joel Granados  2023-06-01  261  	struct ctl_table_header *devices_header;
cbba378db4b972 Joel Granados  2023-06-16  262  #ifdef CONFIG_PARPORT_1284
cbba378db4b972 Joel Granados  2023-06-16  263  	struct ctl_table vars[10];
cbba378db4b972 Joel Granados  2023-06-16  264  #else
cbba378db4b972 Joel Granados  2023-06-16  265  	struct ctl_table vars[5];
cbba378db4b972 Joel Granados  2023-06-16  266  #endif /* IEEE 1284 support */
cbba378db4b972 Joel Granados  2023-06-16 @267  	struct ctl_table device_dir[1];
^1da177e4c3f41 Linus Torvalds 2005-04-16  268  };
^1da177e4c3f41 Linus Torvalds 2005-04-16  269  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
