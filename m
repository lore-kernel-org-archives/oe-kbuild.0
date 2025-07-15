Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA107261D
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752605487; cv=none; b=tWo9jB+mQx4pspJ2/A4UBi/NkTiSiAnnO/Xt5dGuBEXjsTqSs8to8VrdlUfa7vEcW6qCKyt3NRFKo2y0/PqyvHk4ASCuJUe3OxNXEmFY7jPLcDKcSZfA2m9uwdirKzaXpcab2m5H0iS+D6Z36PsM9eG3B5CdTzYvfyObJOBDdCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752605487; c=relaxed/simple;
	bh=+mXbjyg6W84rF52UckLkz2mH0fbiDQCE0BJnBAZ3SwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FvvlaE9D3Yw3ztz33UgnEEdPZicuKAkrp7d6xJR3FUFoCv5h5D51KNgrDUG2lUo7F5P4U/ve/Q3lolqB8R+q+0feSfqJuXhGhE4h4XPouFaqk6SMT/3Uw7WYThoV4x33TGfgiBZT/2L0mFC2W0BEs7IHu+vhg30zfxRcO5odHbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fA8CgNy7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fA8CgNy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752605485; x=1784141485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+mXbjyg6W84rF52UckLkz2mH0fbiDQCE0BJnBAZ3SwE=;
  b=fA8CgNy7b1yLqlUG7PMsbiYNStox42c7ieZzje8NRfS+9OETBVy7h+tB
   wXNW66knMVLLqahP6bXaHNAlpFRAORdgSohkRWrkOohadGlCc9ls3JW1W
   BRyv+rTr7mGDVhbTiJQGfvdlED7c+yZ+dcu58dVnRFO+vAiWa9X8ZGY3p
   PJBYc3dJj1k95lVtXncvyfvTagw8XnrMud7H+smmoGvf2QKsHN1vhvRQX
   +VT6rw9hlfPCq+Iz4KaU7/SiufcyN6MFRHHepVQT6wjhMRjx/sCVg4gVf
   aWcicKZzZ4fh6RHfxdqLU1sDz/FuQl6cVNe0hkE+vrbP/vk0bdz+ytu52
   w==;
X-CSE-ConnectionGUID: nk0lBRiGSNyKqgr4JoezMg==
X-CSE-MsgGUID: k0LB2vnyS8WTk4T0oQsWcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="53950500"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="53950500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 11:51:25 -0700
X-CSE-ConnectionGUID: jCFc9humSY+XSV8A3oZ8cQ==
X-CSE-MsgGUID: d2D/BfZcTRiPJiTYAsaeqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="161321645"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jul 2025 11:51:24 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubkkL-000BS7-2O;
	Tue, 15 Jul 2025 18:51:21 +0000
Date: Wed, 16 Jul 2025 02:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] vfio/pci: Do vf_token checks for
 VFIO_DEVICE_BIND_IOMMUFD
Message-ID: <202507160254.dAjYAz9h-lkp@intel.com>
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
In-Reply-To: <0-v3-bdd8716e85fe+3978a-vfio_token_jgg@nvidia.com>
References: <0-v3-bdd8716e85fe+3978a-vfio_token_jgg@nvidia.com>
TO: Jason Gunthorpe <jgg@nvidia.com>
TO: Alex Williamson <alex.williamson@redhat.com>
TO: Ankit Agrawal <ankita@nvidia.com>
TO: Brett Creeley <brett.creeley@amd.com>
TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
TO: Kevin Tian <kevin.tian@intel.com>
TO: kvm@vger.kernel.org
TO: Longfang Liu <liulongfang@huawei.com>
TO: qat-linux@intel.com
TO: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
TO: virtualization@lists.linux.dev
TO: Xin Zeng <xin.zeng@intel.com>
TO: Yishai Hadas <yishaih@nvidia.com>
CC: patches@lists.linux.dev

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 32b2d3a57e26804ca96d82a222667ac0fa226cb7]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/vfio-pci-Do-vf_token-checks-for-VFIO_DEVICE_BIND_IOMMUFD/20250715-001209
base:   32b2d3a57e26804ca96d82a222667ac0fa226cb7
patch link:    https://lore.kernel.org/r/0-v3-bdd8716e85fe%2B3978a-vfio_token_jgg%40nvidia.com
patch subject: [PATCH v3] vfio/pci: Do vf_token checks for VFIO_DEVICE_BIND_IOMMUFD
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: openrisc-randconfig-r071-20250715 (https://download.01.org/0day-ci/archive/20250716/202507160254.dAjYAz9h-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507160254.dAjYAz9h-lkp@intel.com/

smatch warnings:
drivers/vfio/device_cdev.c:126 vfio_df_ioctl_bind_iommufd() warn: missing unwind goto?
drivers/vfio/device_cdev.c:170 vfio_df_ioctl_bind_iommufd() warn: inconsistent returns '&device->dev_set->lock'.

vim +126 drivers/vfio/device_cdev.c

be2e70b96c3e54 Jason Gunthorpe 2025-07-14   82  
5fcc26969a164e Yi Liu          2023-07-18   83  long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
5fcc26969a164e Yi Liu          2023-07-18   84  				struct vfio_device_bind_iommufd __user *arg)
5fcc26969a164e Yi Liu          2023-07-18   85  {
be2e70b96c3e54 Jason Gunthorpe 2025-07-14   86  	const u32 VALID_FLAGS = VFIO_DEVICE_BIND_FLAG_TOKEN;
5fcc26969a164e Yi Liu          2023-07-18   87  	struct vfio_device *device = df->device;
5fcc26969a164e Yi Liu          2023-07-18   88  	struct vfio_device_bind_iommufd bind;
5fcc26969a164e Yi Liu          2023-07-18   89  	unsigned long minsz;
be2e70b96c3e54 Jason Gunthorpe 2025-07-14   90  	u32 user_size;
5fcc26969a164e Yi Liu          2023-07-18   91  	int ret;
5fcc26969a164e Yi Liu          2023-07-18   92  
5fcc26969a164e Yi Liu          2023-07-18   93  	static_assert(__same_type(arg->out_devid, df->devid));
5fcc26969a164e Yi Liu          2023-07-18   94  
5fcc26969a164e Yi Liu          2023-07-18   95  	minsz = offsetofend(struct vfio_device_bind_iommufd, out_devid);
5fcc26969a164e Yi Liu          2023-07-18   96  
be2e70b96c3e54 Jason Gunthorpe 2025-07-14   97  	ret = get_user(user_size, &arg->argsz);
be2e70b96c3e54 Jason Gunthorpe 2025-07-14   98  	if (ret)
be2e70b96c3e54 Jason Gunthorpe 2025-07-14   99  		return ret;
be2e70b96c3e54 Jason Gunthorpe 2025-07-14  100  	if (user_size < minsz)
be2e70b96c3e54 Jason Gunthorpe 2025-07-14  101  		return -EINVAL;
be2e70b96c3e54 Jason Gunthorpe 2025-07-14  102  	ret = copy_struct_from_user(&bind, minsz, arg, user_size);
be2e70b96c3e54 Jason Gunthorpe 2025-07-14  103  	if (ret)
be2e70b96c3e54 Jason Gunthorpe 2025-07-14  104  		return ret;
5fcc26969a164e Yi Liu          2023-07-18  105  
be2e70b96c3e54 Jason Gunthorpe 2025-07-14  106  	if (bind.iommufd < 0 || bind.flags & ~VALID_FLAGS)
5fcc26969a164e Yi Liu          2023-07-18  107  		return -EINVAL;
5fcc26969a164e Yi Liu          2023-07-18  108  
5fcc26969a164e Yi Liu          2023-07-18  109  	/* BIND_IOMMUFD only allowed for cdev fds */
5fcc26969a164e Yi Liu          2023-07-18  110  	if (df->group)
5fcc26969a164e Yi Liu          2023-07-18  111  		return -EINVAL;
5fcc26969a164e Yi Liu          2023-07-18  112  
5fcc26969a164e Yi Liu          2023-07-18  113  	ret = vfio_device_block_group(device);
5fcc26969a164e Yi Liu          2023-07-18  114  	if (ret)
5fcc26969a164e Yi Liu          2023-07-18  115  		return ret;
5fcc26969a164e Yi Liu          2023-07-18  116  
5fcc26969a164e Yi Liu          2023-07-18  117  	mutex_lock(&device->dev_set->lock);
5fcc26969a164e Yi Liu          2023-07-18  118  	/* one device cannot be bound twice */
5fcc26969a164e Yi Liu          2023-07-18  119  	if (df->access_granted) {
5fcc26969a164e Yi Liu          2023-07-18  120  		ret = -EINVAL;
5fcc26969a164e Yi Liu          2023-07-18  121  		goto out_unlock;
5fcc26969a164e Yi Liu          2023-07-18  122  	}
5fcc26969a164e Yi Liu          2023-07-18  123  
be2e70b96c3e54 Jason Gunthorpe 2025-07-14  124  	ret = vfio_df_check_token(device, &bind);
be2e70b96c3e54 Jason Gunthorpe 2025-07-14  125  	if (ret)
be2e70b96c3e54 Jason Gunthorpe 2025-07-14 @126  		return ret;
be2e70b96c3e54 Jason Gunthorpe 2025-07-14  127  
5fcc26969a164e Yi Liu          2023-07-18  128  	df->iommufd = iommufd_ctx_from_fd(bind.iommufd);
5fcc26969a164e Yi Liu          2023-07-18  129  	if (IS_ERR(df->iommufd)) {
5fcc26969a164e Yi Liu          2023-07-18  130  		ret = PTR_ERR(df->iommufd);
5fcc26969a164e Yi Liu          2023-07-18  131  		df->iommufd = NULL;
5fcc26969a164e Yi Liu          2023-07-18  132  		goto out_unlock;
5fcc26969a164e Yi Liu          2023-07-18  133  	}
5fcc26969a164e Yi Liu          2023-07-18  134  
5fcc26969a164e Yi Liu          2023-07-18  135  	/*
5fcc26969a164e Yi Liu          2023-07-18  136  	 * Before the device open, get the KVM pointer currently
5fcc26969a164e Yi Liu          2023-07-18  137  	 * associated with the device file (if there is) and obtain
5fcc26969a164e Yi Liu          2023-07-18  138  	 * a reference.  This reference is held until device closed.
5fcc26969a164e Yi Liu          2023-07-18  139  	 * Save the pointer in the device for use by drivers.
5fcc26969a164e Yi Liu          2023-07-18  140  	 */
5fcc26969a164e Yi Liu          2023-07-18  141  	vfio_df_get_kvm_safe(df);
5fcc26969a164e Yi Liu          2023-07-18  142  
5fcc26969a164e Yi Liu          2023-07-18  143  	ret = vfio_df_open(df);
5fcc26969a164e Yi Liu          2023-07-18  144  	if (ret)
5fcc26969a164e Yi Liu          2023-07-18  145  		goto out_put_kvm;
5fcc26969a164e Yi Liu          2023-07-18  146  
5fcc26969a164e Yi Liu          2023-07-18  147  	ret = copy_to_user(&arg->out_devid, &df->devid,
5fcc26969a164e Yi Liu          2023-07-18  148  			   sizeof(df->devid)) ? -EFAULT : 0;
5fcc26969a164e Yi Liu          2023-07-18  149  	if (ret)
5fcc26969a164e Yi Liu          2023-07-18  150  		goto out_close_device;
5fcc26969a164e Yi Liu          2023-07-18  151  
5fcc26969a164e Yi Liu          2023-07-18  152  	device->cdev_opened = true;
5fcc26969a164e Yi Liu          2023-07-18  153  	/*
5fcc26969a164e Yi Liu          2023-07-18  154  	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
5fcc26969a164e Yi Liu          2023-07-18  155  	 * read/write/mmap
5fcc26969a164e Yi Liu          2023-07-18  156  	 */
5fcc26969a164e Yi Liu          2023-07-18  157  	smp_store_release(&df->access_granted, true);
5fcc26969a164e Yi Liu          2023-07-18  158  	mutex_unlock(&device->dev_set->lock);
5fcc26969a164e Yi Liu          2023-07-18  159  	return 0;
5fcc26969a164e Yi Liu          2023-07-18  160  
5fcc26969a164e Yi Liu          2023-07-18  161  out_close_device:
5fcc26969a164e Yi Liu          2023-07-18  162  	vfio_df_close(df);
5fcc26969a164e Yi Liu          2023-07-18  163  out_put_kvm:
5fcc26969a164e Yi Liu          2023-07-18  164  	vfio_device_put_kvm(device);
5fcc26969a164e Yi Liu          2023-07-18  165  	iommufd_ctx_put(df->iommufd);
5fcc26969a164e Yi Liu          2023-07-18  166  	df->iommufd = NULL;
5fcc26969a164e Yi Liu          2023-07-18  167  out_unlock:
5fcc26969a164e Yi Liu          2023-07-18  168  	mutex_unlock(&device->dev_set->lock);
5fcc26969a164e Yi Liu          2023-07-18  169  	vfio_device_unblock_group(device);
5fcc26969a164e Yi Liu          2023-07-18 @170  	return ret;
5fcc26969a164e Yi Liu          2023-07-18  171  }
5fcc26969a164e Yi Liu          2023-07-18  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
