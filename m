Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5F838DCB
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nl/Vfuga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700258003; x=1731794003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lpPb7wx2na0q+KWzhXzWMN0FO5Nt4c13dsbOlFs67CU=;
  b=Nl/VfugaYVMCOk602dFdQEUE0kri+3KfPGnLXFV+ZfTAU9BH5+nQ5oSI
   1Mq/8ibJgmLhJPi+yUmKuIN9Vuyo16crABAxdq6b8sMn88e2sk8nSbJ3Y
   QMnbv6ZHKVuqPx7X3RZTkuC1faiCIsUR6gfNxvP4P0M0Ro0HPUW0mxwxt
   xvNMzu6P9wSJm9cOjw6CT1ZvVS7Y4hauWRlREyJcIYIrRTaX9BBQ2UTfc
   toboa7rSmT4XS8T1LZwK5oqb8LzSll7wBBL5i0O7vuWFggZeIcZGz5m1T
   n4yNeZF4WXoea3sZxBHfD3pzCe7fQLb2/pnQRhm4BTvTCUqyI92zEB8TT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="390233833"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="390233833"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 13:53:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="794939790"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="794939790"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Nov 2023 13:53:18 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r46m4-0003Bi-1R;
	Fri, 17 Nov 2023 21:53:16 +0000
Date: Sat, 18 Nov 2023 05:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/platform/goldfish/goldfish_pipe.c:654:36: warning:
 'goldfish_pipe_acpi_match' defined but not used
Message-ID: <202311180552.VfE9385s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Hu <jia-cheng.hu@intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Jin Qian <jinqian@android.com>
CC: Alan Cox <alan@linux.intel.com>

Hi Jason,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc40e44f1ddef16a787f3501b97f1fff909177c
commit: d62f324b0ac80c3923ebbf897735c7c24ba887b8 goldfish: Enable ACPI-based enumeration for android pipe
date:   8 years ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 years ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231118/202311180552.VfE9385s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180552.VfE9385s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311180552.VfE9385s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/module.h:17,
                    from drivers/platform/goldfish/goldfish_pipe.c:49:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:517:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     517 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:434:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     434 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/platform/goldfish/goldfish_pipe.c: At top level:
   drivers/platform/goldfish/goldfish_pipe.c:655:9: warning: missing initializer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-initializers]
     655 |         { "GFSH0003", 0 },
         |         ^
   In file included from include/linux/platform_device.h:15,
                    from drivers/platform/goldfish/goldfish_pipe.c:54:
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
>> drivers/platform/goldfish/goldfish_pipe.c:654:36: warning: 'goldfish_pipe_acpi_match' defined but not used [-Wunused-const-variable=]
     654 | static const struct acpi_device_id goldfish_pipe_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/goldfish_pipe_acpi_match +654 drivers/platform/goldfish/goldfish_pipe.c

c89f2750e9845aa David 'Digit' Turner 2013-01-21  653  
d62f324b0ac80c3 Jason Hu             2016-01-06 @654  static const struct acpi_device_id goldfish_pipe_acpi_match[] = {
d62f324b0ac80c3 Jason Hu             2016-01-06 @655  	{ "GFSH0003", 0 },
d62f324b0ac80c3 Jason Hu             2016-01-06  656  	{ },
d62f324b0ac80c3 Jason Hu             2016-01-06  657  };
d62f324b0ac80c3 Jason Hu             2016-01-06  658  MODULE_DEVICE_TABLE(acpi, goldfish_pipe_acpi_match);
d62f324b0ac80c3 Jason Hu             2016-01-06  659  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
