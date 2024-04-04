Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9C55C89
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Apr 2024 01:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712194764; cv=none; b=HhztrB8srNYkm6XFtQ1n9NRJ3kiELv0aX0DQwSJOz+5u833nIDfMSA/PUvl0npHh2JZmCdi2sW05MZFKAfYKcrTPgzdQWLYupTMs3NLdccsn3r8XaY8WoopFd5chV0xoPO0/nMdgN6EfuWglfIjtcFyBa6uoHgKb8J+nLeQtDe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712194764; c=relaxed/simple;
	bh=/975y+I6aDoDil25yXIfLiOLiub01MD2pXzVO+6sxIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uS+EOyu9uTnKKbS6UIGt1Y4/9cu9UaKl2kdUQejH66yTeAlAlY5AqIgwA2ah+akI5AMgnXWJWKBmAMB73NmUvWX6IDRVsVbsmaie/hVr5uSYsi0bYLPElWGfwvs6k6QZv9/ZxD6FVMTYLyjTJGlhQH51fgnEI2ISNST7YSECZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zo0h/BsC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zo0h/BsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712194763; x=1743730763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/975y+I6aDoDil25yXIfLiOLiub01MD2pXzVO+6sxIg=;
  b=Zo0h/BsCii96TW7ALrxvSFA8+4yGQDFAXHxv7v+rpPCOLuEWaE7+kLTO
   ILpagx9gVrn4RbfNfQuQn67POg0SG0+6TIch2/cEPekSBUmpSQk31tDC8
   T2/XvSMyi/wLLxLSl6awgyxM3yFde7EXXAUD38WsvGYVkZluLFIocV2i3
   1AnDyVeT1nsj6d8idkj2UbgliQLZjJziKi8m0nQCQeeHOOPD7LzKUVhBd
   T9IdMSTR9E3UWM9ppK4X/7bopIlgwIZ7YfSdN5Oss10y7qGEa4yEggI9T
   HucyKY4z/3i6TGqmwovACuXuRU0sDkM6mDnVz6QzS++/IPb5+3+mZJFl+
   g==;
X-CSE-ConnectionGUID: xrqzDAo7QPSzr4/Uzcp0RQ==
X-CSE-MsgGUID: rHuOcIhzTHW+io7VzbedTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10426906"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="10426906"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 18:39:22 -0700
X-CSE-ConnectionGUID: JWg/qt/oQI292+ZAX7jKbA==
X-CSE-MsgGUID: HMuM2gNfSiWAHow7Xz6gDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="23380980"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2024 18:39:20 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsC4U-0000Rs-01;
	Thu, 04 Apr 2024 01:39:18 +0000
Date: Thu, 4 Apr 2024 09:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 02/10] PCI: Deprecate iomap-table functions
Message-ID: <202404040920.QIxhNeMu-lkp@intel.com>
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
In-Reply-To: <20240403080712.13986-5-pstanner@redhat.com>
References: <20240403080712.13986-5-pstanner@redhat.com>
TO: Philipp Stanner <pstanner@redhat.com>
TO: Hans de Goede <hdegoede@redhat.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: dakr@redhat.com
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: Philipp Stanner <pstanner@redhat.com>

Hi Philipp,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus drm-misc/drm-misc-next linus/master v6.9-rc2 next-20240403]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/PCI-Add-new-set-of-devres-functions/20240403-160932
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240403080712.13986-5-pstanner%40redhat.com
patch subject: [PATCH v5 02/10] PCI: Deprecate iomap-table functions
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20240404 (https://download.01.org/0day-ci/archive/20240404/202404040920.QIxhNeMu-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404040920.QIxhNeMu-lkp@intel.com/

smatch warnings:
drivers/pci/devres.c:897 pcim_iomap_regions_request_all() error: we previously assumed 'legacy_iomap_table' could be null (see line 894)

vim +/legacy_iomap_table +897 drivers/pci/devres.c

acc2364fe66106 Philipp Stanner 2024-01-31  848  
acc2364fe66106 Philipp Stanner 2024-01-31  849  /**
34e90b966504f3 Philipp Stanner 2024-04-03  850   * pcim_iomap_regions_request_all - Request all BARs and iomap specified ones (DEPRECATED)
acc2364fe66106 Philipp Stanner 2024-01-31  851   * @pdev: PCI device to map IO resources for
acc2364fe66106 Philipp Stanner 2024-01-31  852   * @mask: Mask of BARs to iomap
4a97db2d40b2a0 Philipp Stanner 2024-04-03  853   * @name: Name associated with the requests
acc2364fe66106 Philipp Stanner 2024-01-31  854   *
34e90b966504f3 Philipp Stanner 2024-04-03  855   * Returns: 0 on success, negative error code on failure.
34e90b966504f3 Philipp Stanner 2024-04-03  856   *
acc2364fe66106 Philipp Stanner 2024-01-31  857   * Request all PCI BARs and iomap regions specified by @mask.
34e90b966504f3 Philipp Stanner 2024-04-03  858   *
34e90b966504f3 Philipp Stanner 2024-04-03  859   * To release these resources manually, call pcim_release_region() for the
34e90b966504f3 Philipp Stanner 2024-04-03  860   * regions and pcim_iounmap() for the mappings.
34e90b966504f3 Philipp Stanner 2024-04-03  861   *
34e90b966504f3 Philipp Stanner 2024-04-03  862   * This function is DEPRECATED. Don't use it in new code.
34e90b966504f3 Philipp Stanner 2024-04-03  863   * Use pcim_request_all_regions() + pcim_iomap*() instead.
acc2364fe66106 Philipp Stanner 2024-01-31  864   */
acc2364fe66106 Philipp Stanner 2024-01-31  865  int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
acc2364fe66106 Philipp Stanner 2024-01-31  866  				   const char *name)
acc2364fe66106 Philipp Stanner 2024-01-31  867  {
34e90b966504f3 Philipp Stanner 2024-04-03  868  	short bar;
34e90b966504f3 Philipp Stanner 2024-04-03  869  	int ret;
34e90b966504f3 Philipp Stanner 2024-04-03  870  	void __iomem **legacy_iomap_table;
acc2364fe66106 Philipp Stanner 2024-01-31  871  
34e90b966504f3 Philipp Stanner 2024-04-03  872  	ret = pcim_request_all_regions(pdev, name);
34e90b966504f3 Philipp Stanner 2024-04-03  873  	if (ret != 0)
34e90b966504f3 Philipp Stanner 2024-04-03  874  		return ret;
acc2364fe66106 Philipp Stanner 2024-01-31  875  
34e90b966504f3 Philipp Stanner 2024-04-03  876  	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
34e90b966504f3 Philipp Stanner 2024-04-03  877  		if (!mask_contains_bar(mask, bar))
34e90b966504f3 Philipp Stanner 2024-04-03  878  			continue;
34e90b966504f3 Philipp Stanner 2024-04-03  879  		if (!pcim_iomap(pdev, bar, 0))
34e90b966504f3 Philipp Stanner 2024-04-03  880  			goto err;
34e90b966504f3 Philipp Stanner 2024-04-03  881  	}
34e90b966504f3 Philipp Stanner 2024-04-03  882  
34e90b966504f3 Philipp Stanner 2024-04-03  883  	return 0;
34e90b966504f3 Philipp Stanner 2024-04-03  884  
34e90b966504f3 Philipp Stanner 2024-04-03  885  err:
34e90b966504f3 Philipp Stanner 2024-04-03  886  	/*
34e90b966504f3 Philipp Stanner 2024-04-03  887  	 * Here it gets tricky: pcim_iomap() above has most likely
34e90b966504f3 Philipp Stanner 2024-04-03  888  	 * failed because it got an OOM when trying to create the
34e90b966504f3 Philipp Stanner 2024-04-03  889  	 * legacy-table.
34e90b966504f3 Philipp Stanner 2024-04-03  890  	 * We check here if that has happened. If not, pcim_iomap()
34e90b966504f3 Philipp Stanner 2024-04-03  891  	 * must have failed because of EINVAL.
34e90b966504f3 Philipp Stanner 2024-04-03  892  	 */
34e90b966504f3 Philipp Stanner 2024-04-03  893  	legacy_iomap_table = (void __iomem **)pcim_iomap_table(pdev);
34e90b966504f3 Philipp Stanner 2024-04-03 @894  	ret = legacy_iomap_table ? -EINVAL : -ENOMEM;
34e90b966504f3 Philipp Stanner 2024-04-03  895  
34e90b966504f3 Philipp Stanner 2024-04-03  896  	while (--bar >= 0)
34e90b966504f3 Philipp Stanner 2024-04-03 @897  		pcim_iounmap(pdev, legacy_iomap_table[bar]);
34e90b966504f3 Philipp Stanner 2024-04-03  898  
34e90b966504f3 Philipp Stanner 2024-04-03  899  	pcim_release_all_regions(pdev);
34e90b966504f3 Philipp Stanner 2024-04-03  900  
34e90b966504f3 Philipp Stanner 2024-04-03  901  	return ret;
acc2364fe66106 Philipp Stanner 2024-01-31  902  }
acc2364fe66106 Philipp Stanner 2024-01-31  903  EXPORT_SYMBOL(pcim_iomap_regions_request_all);
acc2364fe66106 Philipp Stanner 2024-01-31  904  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
