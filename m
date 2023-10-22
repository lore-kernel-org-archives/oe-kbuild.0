Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD7107AC
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Oct 2023 20:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgB8qx8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698005410; x=1729541410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HrooETvrPBgEhmVss+cgkGPxjYTJoMyfP+ktVa/gXvc=;
  b=XgB8qx8+xEnHNu+w3BMihhKTXrOHfAXGgu9cRClfbXKc5iOGIFB8xXBZ
   6jILFtKAP7m+RX8lddXVrGnO4+WPAUBsh6GRAWxJiwP2tofSgqw1fT3el
   0io0wq3OKLNwR3+qY4bnaAWo2isLDtlLGCiXjKFRZVLzyGhwyW3KJpqeN
   h1W/L1F82AQCLion8PECbTzGYBggHq/mEvmodI1u+iKryvamRCABnTN02
   nrIUZDNDcseNXOOnGGgycXjofSvI8NZ9mk+GN9aoVjJPOxnXe7ngwqe/u
   uJG7GjKaX9zZNVjZLOpdiIDR6IhOgL6Vdx/YI+JAcKc3D0ZnpGeZ4w9cB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="386548789"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="386548789"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 13:10:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="787284011"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="787284011"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Oct 2023 13:10:08 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quely-0006Es-1A;
	Sun, 22 Oct 2023 20:10:06 +0000
Date: Mon, 23 Oct 2023 04:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 7851/13906] drivers/parport/procfs.c:267:18-28:
 WARNING use flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202310230448.N902UjX1-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Joel Granados <j.granados@samsung.com>
CC: Luis Chamberlain <mcgrof@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2030579113a1b1b5bfd7ff24c0852847836d8fd1
commit: 0829381e481ab2760086cc88090f70e761e4fcc2 [7851/13906] parport: Remove the now superfluous sentinel element from ctl_table array
:::::: branch date: 3 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-102-20231023 (https://download.01.org/0day-ci/archive/20231023/202310230448.N902UjX1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230448.N902UjX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310230448.N902UjX1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/parport/procfs.c:267:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
   drivers/parport/procfs.c:364:18-28: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +267 drivers/parport/procfs.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  257  
^1da177e4c3f41 Linus Torvalds 2005-04-16  258  
^1da177e4c3f41 Linus Torvalds 2005-04-16  259  struct parport_sysctl_table {
37e9981e33e4d3 Joel Granados  2023-06-16  260  	struct ctl_table_header *port_header;
37e9981e33e4d3 Joel Granados  2023-06-16  261  	struct ctl_table_header *devices_header;
0829381e481ab2 Joel Granados  2023-10-02  262  #ifdef CONFIG_PARPORT_1284
0829381e481ab2 Joel Granados  2023-10-02  263  	struct ctl_table vars[10];
0829381e481ab2 Joel Granados  2023-10-02  264  #else
0829381e481ab2 Joel Granados  2023-10-02  265  	struct ctl_table vars[5];
0829381e481ab2 Joel Granados  2023-10-02  266  #endif /* IEEE 1284 support */
0829381e481ab2 Joel Granados  2023-10-02 @267  	struct ctl_table device_dir[1];
^1da177e4c3f41 Linus Torvalds 2005-04-16  268  };
^1da177e4c3f41 Linus Torvalds 2005-04-16  269  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
