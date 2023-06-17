Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D31111C
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jun 2023 06:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686983302; x=1718519302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nnVnwB4pxvNVnI4IMBW5EVPr3/CZCWyRlr2N9ZeZFXA=;
  b=bKjLqUNZML7R89pmHI0OEC0WaPmkVCNx7PsxGDt7Y6xbngdWiKnrWzi8
   281Xn1o3DBSpWlCzSkEwA2W2DLYu45ogrfbx0kzGySg+e4+Q01k5A9zB/
   7pp/qmH1rQIKoGsQXzrG029y+IbFftqVXOhRDjA4xmKmI+gWoUQs0KDZN
   bXy/bMZ0+g4LLnI5hEuh+/sKvOhzez+8CqAJxObI2cR3qOVeM/x/XYD2F
   phNBZKOkdo2Cucl3pNZ9gxiKUe0H+84J+cjbSI3VX24Lb/NUiuAnNFdaG
   iv/m6bxPKKESsMhuBRORugw1CDuMM9NPM9ax4WOWhfX/JLhKfi9uY0VfH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="423021973"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="423021973"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 23:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="959868917"
X-IronPort-AV: E=Sophos;i="6.00,249,1681196400"; 
   d="scan'208";a="959868917"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Jun 2023 23:28:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAPQ3-0002Nr-06;
	Sat, 17 Jun 2023 06:28:19 +0000
Date: Sat, 17 Jun 2023 14:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 09/25] iommu: Allow an IDENTITY domain as the
 default_domain in ARM32
Message-ID: <202306171458.LfWLILeK-lkp@intel.com>
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
In-Reply-To: <9-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: <9-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
TO: Jason Gunthorpe <jgg@nvidia.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fe420865bd74f5917ff0d8d38a46fbbbe5dd1ea6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/iommu-Add-iommu_ops-identity_domain/20230617-032631
base:   fe420865bd74f5917ff0d8d38a46fbbbe5dd1ea6
patch link:    https://lore.kernel.org/r/9-v4-874277bde66e%2B1a9f6-iommu_all_defdom_jgg%40nvidia.com
patch subject: [PATCH v4 09/25] iommu: Allow an IDENTITY domain as the default_domain in ARM32
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm-randconfig-m031-20230611 (https://download.01.org/0day-ci/archive/20230617/202306171458.LfWLILeK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171458.LfWLILeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306171458.LfWLILeK-lkp@intel.com/

smatch warnings:
drivers/iommu/iommu.c:1800 iommu_get_default_domain_type() error: potentially dereferencing uninitialized 'gdev'.

vim +/gdev +1800 drivers/iommu/iommu.c

d72e31c9374627 Alex Williamson 2012-05-30  1746  
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1747  /* A target_type of 0 will select the best domain type and cannot fail */
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1748  static int iommu_get_default_domain_type(struct iommu_group *group,
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1749  					 int target_type)
deac0b3bed26bb Joerg Roedel    2020-04-29  1750  {
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1751  	const struct iommu_ops *ops = dev_iommu_ops(
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1752  		list_first_entry(&group->devices, struct group_device, list)
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1753  			->dev);
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1754  	int best_type = target_type;
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1755  	struct group_device *gdev;
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1756  	struct device *last_dev;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1757  	int type;
deac0b3bed26bb Joerg Roedel    2020-04-29  1758  
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1759  	lockdep_assert_held(&group->mutex);
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1760  
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1761  	/*
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1762  	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1763  	 * identity_domain and it will automatically become their default
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1764  	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1765  	 * Override the selection to IDENTITY if we are sure the driver supports
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1766  	 * it.
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1767  	 */
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1768  	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1769  		type = IOMMU_DOMAIN_IDENTITY;
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1770  		if (best_type && type && best_type != type)
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1771  			goto err;
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1772  		best_type = target_type = IOMMU_DOMAIN_IDENTITY;
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1773  	}
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1774  
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1775  	for_each_group_device(group, gdev) {
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1776  		type = best_type;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1777  		if (ops->def_domain_type) {
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1778  			type = ops->def_domain_type(gdev->dev);
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1779  			if (best_type && type && best_type != type) {
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1780  				/* Stick with the last driver override we saw */
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1781  				best_type = type;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1782  				goto err;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1783  			}
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1784  		}
deac0b3bed26bb Joerg Roedel    2020-04-29  1785  
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1786  		/* No ARM32 using systems will set untrusted, it cannot work. */
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1787  		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted &&
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1788  		    !WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))) {
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1789  			type = IOMMU_DOMAIN_DMA;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1790  			if (best_type && type && best_type != type)
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1791  				goto err;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1792  		}
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1793  		best_type = type;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1794  		last_dev = gdev->dev;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1795  	}
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1796  	return best_type;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1797  
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1798  err:
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1799  	if (target_type) {
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11 @1800  		dev_err_ratelimited(
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1801  			gdev->dev,
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1802  			"Device cannot be in %s domain - it is forcing %s\n",
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1803  			iommu_domain_type_str(target_type),
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1804  			iommu_domain_type_str(type));
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1805  		return -1;
deac0b3bed26bb Joerg Roedel    2020-04-29  1806  	}
deac0b3bed26bb Joerg Roedel    2020-04-29  1807  
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1808  	dev_warn(
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1809  		gdev->dev,
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1810  		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1811  		iommu_domain_type_str(type), dev_name(last_dev),
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1812  		iommu_domain_type_str(best_type));
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1813  	return best_type;
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1814  }
deac0b3bed26bb Joerg Roedel    2020-04-29  1815  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
