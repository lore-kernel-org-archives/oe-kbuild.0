Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9D013FE0
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Jul 2023 13:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689774607; x=1721310607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dYkWkun8UeDQKVNI4ZSmEHGQGXfVpGCBSoGcHVSoThg=;
  b=jlFbEk6lXL23yZF2ZpVDWSwNoe5Pdrubz3hmP1Jdly0bEYzGcNKYey+V
   emgqevY6KhMjl1Pc9x/1UapMATBsw1DQD2wmRnIXAw/j04M96DCC6WFOO
   KSU5gA73ZLXj9/3gU3xutGbkzpZ40RYqMxF2/ILSeLXbJ3rRV/c4FUdhD
   gZ1uHjMOlV82qeaExLO78wPFYJ5STtQgFZ03kbE4krBtPxkIhWLSZnrI2
   fj/pE0sOJUkkmWyuecApcqFG+NUDClxP9D4ocN8SXNc6j8XNC79FezPe1
   GhVyvFHtPWbLuaIMftih56bkaFgyFrnsEqhCBT0lZHFSp7V9ukm992Fkh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="363928618"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="363928618"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 06:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867475452"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2023 06:48:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qM7Xh-0004y8-2s;
	Wed, 19 Jul 2023 13:48:37 +0000
Date: Wed, 19 Jul 2023 21:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [joelgranados:jag/sysctl_remove_empty_elem 38/65]
 drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202307192154.Ti6lpJ4N-lkp@intel.com>
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

tree:   https://github.com/Joelgranados/linux.git jag/sysctl_remove_empty_elem
head:   a304fafc8514647e95ddf6cae2bdf2f7cd185ac1
commit: 03ff367f259166790e8982a17498c296193db2e5 [38/65] parport: rm sentinel element from ctl_table array
:::::: branch date: 22 hours ago
:::::: commit date: 23 hours ago
config: microblaze-randconfig-r062-20230717 (https://download.01.org/0day-ci/archive/20230719/202307192154.Ti6lpJ4N-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307192154.Ti6lpJ4N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307192154.Ti6lpJ4N-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
   drivers/parport/procfs.c:364:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +267 drivers/parport/procfs.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  257  
^1da177e4c3f41 Linus Torvalds 2005-04-16  258  
^1da177e4c3f41 Linus Torvalds 2005-04-16  259  struct parport_sysctl_table {
37e9981e33e4d3 Joel Granados  2023-06-16  260  	struct ctl_table_header *port_header;
37e9981e33e4d3 Joel Granados  2023-06-16  261  	struct ctl_table_header *devices_header;
03ff367f259166 Joel Granados  2023-06-27  262  #ifdef CONFIG_PARPORT_1284
03ff367f259166 Joel Granados  2023-06-27  263  	struct ctl_table vars[10];
03ff367f259166 Joel Granados  2023-06-27  264  #else
03ff367f259166 Joel Granados  2023-06-27  265  	struct ctl_table vars[5];
03ff367f259166 Joel Granados  2023-06-27  266  #endif /* IEEE 1284 support */
03ff367f259166 Joel Granados  2023-06-27 @267  	struct ctl_table device_dir[1];
^1da177e4c3f41 Linus Torvalds 2005-04-16  268  };
^1da177e4c3f41 Linus Torvalds 2005-04-16  269  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
