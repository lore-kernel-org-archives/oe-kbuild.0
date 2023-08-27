Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA362F
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Aug 2023 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693133222; x=1724669222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xKVkG4sIVd89M5sWWKI3Pk/z7aMHkDaruP9+RZQDBvE=;
  b=bvu87JbDgfgiTiVuhLmTXBAinRJadbiB7r2ZPG6JGYAdFC+zyUKoI6ui
   6RLSM5EQDe0IduqPpj2GB4uKrYMUYfuobJkPQo1C1ZuE6azic85XJ7u/u
   8Vpjjva8G9bydd6A9iEjksIBCWORiCZcMzDpujaYKqsQa8hytJGOdw0co
   lKmwvDAQ9j0qoPS1+fbitAb+Ftqd6M2s1zKUlX74cFS0frncggesvAFBd
   TgHrd0zIstmyCilMHufLi6zUeSwbkME8pgGbHtuCPxwyuZXP+Dg5S/3I2
   biGNGpCbJVlYyocFCM6f5GRFXNFwtjgj8Q2my8dpVaQj76Dumxoc0eECq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="461300541"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="461300541"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 03:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="861528983"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="861528983"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Aug 2023 03:46:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaDID-0005hN-2g;
	Sun, 27 Aug 2023 10:46:55 +0000
Date: Sun, 27 Aug 2023 18:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0825 3/95]
 drivers/iommu/iommufd/main.c:259 iommufd_get_hw_info() warn: maybe return
 -EFAULT instead of the bytes remaining?
Message-ID: <202308271835.k7tRDU2P-lkp@intel.com>
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
TO: Yi Liu <yi.l.liu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0825
head:   98c119bc01ddf99ad4ac7c3e93980e3d835c0901
commit: 69055cc0284095e68fd61f1705ef518ad731d120 [3/95] iommufd: Add IOMMU_GET_HW_INFO
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20230826 (https://download.01.org/0day-ci/archive/20230827/202308271835.k7tRDU2P-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271835.k7tRDU2P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308271835.k7tRDU2P-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/main.c:259 iommufd_get_hw_info() warn: maybe return -EFAULT instead of the bytes remaining?

vim +259 drivers/iommu/iommufd/main.c

69055cc0284095e Yi Liu 2023-01-12  219  
69055cc0284095e Yi Liu 2023-01-12  220  static int iommufd_get_hw_info(struct iommufd_ucmd *ucmd)
69055cc0284095e Yi Liu 2023-01-12  221  {
69055cc0284095e Yi Liu 2023-01-12  222  	struct iommu_hw_info *cmd = ucmd->cmd;
69055cc0284095e Yi Liu 2023-01-12  223  	unsigned int length = cmd->data_len;
69055cc0284095e Yi Liu 2023-01-12  224  	struct iommufd_device *idev;
69055cc0284095e Yi Liu 2023-01-12  225  	void __user *user_ptr;
69055cc0284095e Yi Liu 2023-01-12  226  	u32 hw_info_type;
69055cc0284095e Yi Liu 2023-01-12  227  	int rc = 0;
69055cc0284095e Yi Liu 2023-01-12  228  
69055cc0284095e Yi Liu 2023-01-12  229  	if (cmd->flags || cmd->__reserved || !cmd->data_len)
69055cc0284095e Yi Liu 2023-01-12  230  		return -EOPNOTSUPP;
69055cc0284095e Yi Liu 2023-01-12  231  
69055cc0284095e Yi Liu 2023-01-12  232  	idev = iommufd_get_device(ucmd, cmd->dev_id);
69055cc0284095e Yi Liu 2023-01-12  233  	if (IS_ERR(idev))
69055cc0284095e Yi Liu 2023-01-12  234  		return PTR_ERR(idev);
69055cc0284095e Yi Liu 2023-01-12  235  
69055cc0284095e Yi Liu 2023-01-12  236  	user_ptr = u64_to_user_ptr(cmd->data_ptr);
69055cc0284095e Yi Liu 2023-01-12  237  
69055cc0284095e Yi Liu 2023-01-12  238  	rc = iommufd_fill_hw_info(idev->dev, user_ptr,
69055cc0284095e Yi Liu 2023-01-12  239  				  &length, &hw_info_type);
69055cc0284095e Yi Liu 2023-01-12  240  	if (rc)
69055cc0284095e Yi Liu 2023-01-12  241  		goto err_put;
69055cc0284095e Yi Liu 2023-01-12  242  
69055cc0284095e Yi Liu 2023-01-12  243  	/*
69055cc0284095e Yi Liu 2023-01-12  244  	 * Zero the trailing bytes if the user buffer is bigger than the
69055cc0284095e Yi Liu 2023-01-12  245  	 * data size kernel actually has.
69055cc0284095e Yi Liu 2023-01-12  246  	 */
69055cc0284095e Yi Liu 2023-01-12  247  	if (length < cmd->data_len) {
69055cc0284095e Yi Liu 2023-01-12  248  		rc = clear_user(user_ptr + length, cmd->data_len - length);
69055cc0284095e Yi Liu 2023-01-12  249  		if (rc)
69055cc0284095e Yi Liu 2023-01-12  250  			goto err_put;
69055cc0284095e Yi Liu 2023-01-12  251  	}
69055cc0284095e Yi Liu 2023-01-12  252  
69055cc0284095e Yi Liu 2023-01-12  253  	cmd->data_len = length;
69055cc0284095e Yi Liu 2023-01-12  254  	cmd->out_data_type = hw_info_type;
69055cc0284095e Yi Liu 2023-01-12  255  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
69055cc0284095e Yi Liu 2023-01-12  256  
69055cc0284095e Yi Liu 2023-01-12  257  err_put:
69055cc0284095e Yi Liu 2023-01-12  258  	iommufd_put_object(&idev->obj);
69055cc0284095e Yi Liu 2023-01-12 @259  	return rc;
69055cc0284095e Yi Liu 2023-01-12  260  }
69055cc0284095e Yi Liu 2023-01-12  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
