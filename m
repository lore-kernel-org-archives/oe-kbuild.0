Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DF663BA
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jul 2023 23:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688685166; x=1720221166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7dJcWLi92QqQTyI6OCIy/LH9F/E2VI7iRgAnBdcNgE=;
  b=ef8QcaMnA7NJ8hQgtOts2kl2Ufs531QtDYbSTGoYr+xIvVv5ht7ySg9i
   t6OGeAENp2iLdcjD3YNpkpHbVdvK6dVATv2JFFSHIqP8CM/E0vq3S2k0x
   bns33dZ9rSx5iwh3HLnuSShg8KcIQnVKeetAHi4MZC04S80ADJbUJGisB
   tGYhe+05Fp5lhczXaX8KACZyEZaXMYZUyC/OPhsSZ/8RIoupvkiCxGyWC
   85VM4nz+kjQnvkKtrhfw11KaGQM0+kfu0cIuTSaMRzJhLE3sd70QhSpAe
   jdgchyRrtWhkKTlL+LTQU1rp8q+4jpB771NMK5xOk2sYbgQA9OwPHFjTH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="343336500"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="343336500"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 16:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="789737780"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="789737780"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2023 16:12:44 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHY9U-0001bW-0Y;
	Thu, 06 Jul 2023 23:12:44 +0000
Date: Fri, 7 Jul 2023 07:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/cdx/main.c:95 vfio_cdx_ioctl_get_region_info() warn:
 potential spectre issue 'vdev->regions' [r] (local cap)
Message-ID: <202307070752.up2vbT9k-lkp@intel.com>
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
TO: Nipun Gupta <nipun.gupta@amd.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a452483508d7b70b0f6c69e249ec0b3ea2330b5c
commit: 234489ac561300ceed33e64c3bf3a810b9e2051d vfio/cdx: add support for CDX bus
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-m031-20230706 (https://download.01.org/0day-ci/archive/20230707/202307070752.up2vbT9k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070752.up2vbT9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307070752.up2vbT9k-lkp@intel.com/

smatch warnings:
drivers/vfio/cdx/main.c:95 vfio_cdx_ioctl_get_region_info() warn: potential spectre issue 'vdev->regions' [r] (local cap)

vim +95 drivers/vfio/cdx/main.c

234489ac561300 Nipun Gupta 2023-05-31   76  
234489ac561300 Nipun Gupta 2023-05-31   77  static int vfio_cdx_ioctl_get_region_info(struct vfio_cdx_device *vdev,
234489ac561300 Nipun Gupta 2023-05-31   78  					  struct vfio_region_info __user *arg)
234489ac561300 Nipun Gupta 2023-05-31   79  {
234489ac561300 Nipun Gupta 2023-05-31   80  	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
234489ac561300 Nipun Gupta 2023-05-31   81  	struct cdx_device *cdx_dev = to_cdx_device(vdev->vdev.dev);
234489ac561300 Nipun Gupta 2023-05-31   82  	struct vfio_region_info info;
234489ac561300 Nipun Gupta 2023-05-31   83  
234489ac561300 Nipun Gupta 2023-05-31   84  	if (copy_from_user(&info, arg, minsz))
234489ac561300 Nipun Gupta 2023-05-31   85  		return -EFAULT;
234489ac561300 Nipun Gupta 2023-05-31   86  
234489ac561300 Nipun Gupta 2023-05-31   87  	if (info.argsz < minsz)
234489ac561300 Nipun Gupta 2023-05-31   88  		return -EINVAL;
234489ac561300 Nipun Gupta 2023-05-31   89  
234489ac561300 Nipun Gupta 2023-05-31   90  	if (info.index >= cdx_dev->res_count)
234489ac561300 Nipun Gupta 2023-05-31   91  		return -EINVAL;
234489ac561300 Nipun Gupta 2023-05-31   92  
234489ac561300 Nipun Gupta 2023-05-31   93  	/* map offset to the physical address */
234489ac561300 Nipun Gupta 2023-05-31   94  	info.offset = vfio_cdx_index_to_offset(info.index);
234489ac561300 Nipun Gupta 2023-05-31  @95  	info.size = vdev->regions[info.index].size;
234489ac561300 Nipun Gupta 2023-05-31   96  	info.flags = vdev->regions[info.index].flags;
234489ac561300 Nipun Gupta 2023-05-31   97  
234489ac561300 Nipun Gupta 2023-05-31   98  	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
234489ac561300 Nipun Gupta 2023-05-31   99  }
234489ac561300 Nipun Gupta 2023-05-31  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
