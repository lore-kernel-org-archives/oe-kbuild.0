Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729AB1946C
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 23:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqzK4uzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699226962; x=1730762962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KThHrAPZZVdWtNtDof2k3/XgBkU6260FLjNSqlKPQe4=;
  b=AqzK4uzoaBkRkbOCOMaKTYT4BUsHoYd4cpBvpqQsRmSbBzxOiw0BHHMt
   SZ46NB+McDhmDPD9H4IjHi/uKonV9wZ9yRl2WqdaH3a5/G4aJelsYXoio
   KoX20XNe2UAFlqapYQFfTz+z2OaM+q0NsEmMOBppUXTBcLal94RMmKUPD
   8KAaGDhMTVU4MiYLEtBk9MZPFg/w0SOfK96hIZbiKMmTAZCYwbx+kIb5g
   qiD7hR4N1/qHqfMebGZqmdCR6PiuKVhJfTl6s3fwyFDvVOz0nWUGsvvNC
   fF1ej95zFHf15aGhaVvSQbHj++4oCAT6dcWzKxRlvcM6YGThLk5hopZrB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420299343"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="420299343"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 15:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="3280265"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Nov 2023 15:29:20 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzmYQ-0005sk-08;
	Sun, 05 Nov 2023 23:29:18 +0000
Date: Mon, 6 Nov 2023 07:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/platform/goldfish/goldfish_pipe.c:654:36: warning:
 'goldfish_pipe_acpi_match' defined but not used
Message-ID: <202311060705.NthRQ6Om-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: d62f324b0ac80c3923ebbf897735c7c24ba887b8 goldfish: Enable ACPI-based enumeration for android pipe
date:   8 years ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 years ago
config: x86_64-buildonly-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20231106/202311060705.NthRQ6Om-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060705.NthRQ6Om-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311060705.NthRQ6Om-lkp@intel.com/

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

c89f2750e9845a David 'Digit' Turner 2013-01-21  653  
d62f324b0ac80c Jason Hu             2016-01-06 @654  static const struct acpi_device_id goldfish_pipe_acpi_match[] = {
d62f324b0ac80c Jason Hu             2016-01-06  655  	{ "GFSH0003", 0 },
d62f324b0ac80c Jason Hu             2016-01-06  656  	{ },
d62f324b0ac80c Jason Hu             2016-01-06  657  };
d62f324b0ac80c Jason Hu             2016-01-06  658  MODULE_DEVICE_TABLE(acpi, goldfish_pipe_acpi_match);
d62f324b0ac80c Jason Hu             2016-01-06  659  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
