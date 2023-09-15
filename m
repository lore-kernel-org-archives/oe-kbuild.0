Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418C6D50C
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694766117; x=1726302117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kXF1aU9154kZJBGZxwICXUG3XUGStnKFHjZbb+WY+t4=;
  b=RyTk13EC54TaHlaqwmfuPxoVIX0p6U4bhsERmiP2Z/Oy/cjfLW4POe1t
   Sl2OaEFtV4PaXciVWY/WjQZQQcNf/JsAn7KRh5T/fE97NZ6hwsi+/78wB
   mZ2sGv9vY24QtWh7bsU0ywttuYMNcm9+ydDJVcZBhdGzXqGUDzgC/uMBf
   OMnwdYcjIpt0uPWETl846+C6LsHlNTMF2e8gsEinhlm3i5Av3GS/CGuLR
   V4hxVJoFZFVSLthoYr9sJQ6Ya3wDKBG9KWER1O5P75vXFdmLccV6v1VWW
   j73qT0XrooHnMbse3PrXamvgBjl3tcclcwjb9yIgQPpeArf51rWEfQU9W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445652490"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="445652490"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 01:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991770642"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="991770642"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2023 01:21:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh45I-0002gj-2i;
	Fri, 15 Sep 2023 08:21:52 +0000
Date: Fri, 15 Sep 2023 16:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: samples/vfio-mdev/mbochs.c:1359 mbochs_show_description() warn: can
 'type' even be NULL?
Message-ID: <202309151653.Krs0HrG4-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Kirti Wankhede <kwankhede@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9fdfb15a3dbf818e06be514f4abbfc071004cbe7
commit: 685a1537f4c603cfcaf4b9be56ff6a571f7ddd08 vfio/mdev: consolidate all the description sysfs into the core code
date:   12 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151653.Krs0HrG4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309151653.Krs0HrG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309151653.Krs0HrG4-lkp@intel.com/

smatch warnings:
samples/vfio-mdev/mbochs.c:1359 mbochs_show_description() warn: can 'type' even be NULL?

vim +/type +1359 samples/vfio-mdev/mbochs.c

a5e6e6505f38f7 Gerd Hoffmann     2018-05-11  1352  
685a1537f4c603 Christoph Hellwig 2022-09-23  1353  static ssize_t mbochs_show_description(struct mdev_type *mtype, char *buf)
a5e6e6505f38f7 Gerd Hoffmann     2018-05-11  1354  {
da44c340c4fe9d Christoph Hellwig 2022-09-23  1355  	struct mbochs_type *type =
da44c340c4fe9d Christoph Hellwig 2022-09-23  1356  		container_of(mtype, struct mbochs_type, type);
a5e6e6505f38f7 Gerd Hoffmann     2018-05-11  1357  
a5e6e6505f38f7 Gerd Hoffmann     2018-05-11  1358  	return sprintf(buf, "virtual display, %d MB video memory\n",
a5e6e6505f38f7 Gerd Hoffmann     2018-05-11 @1359  		       type ? type->mbytes  : 0);
a5e6e6505f38f7 Gerd Hoffmann     2018-05-11  1360  }
a5e6e6505f38f7 Gerd Hoffmann     2018-05-11  1361  

:::::: The code at line 1359 was first introduced by commit
:::::: a5e6e6505f38f7bce1d3576503a2bffff3fa888c sample: vfio bochs vbe display (host device for bochs-drm)

:::::: TO: Gerd Hoffmann <kraxel@redhat.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
