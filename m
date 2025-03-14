Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D201953A9
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 22:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741991391; cv=none; b=fQq6Wkb6C7sD8R8R09LVle5nMW+Kt+LECNDUwww78DuOoBu74ku3pT73Wqs5C+nO2Zd4zjMi0wt/0Wh7AJ2GRbtMNjdx0Ny/Xdb1sPZApJgGP3AW61y2ifPeiI8uYqRyBgq6hJv3ZXhuYY8NCrvIGJ6VRHczFzVvWDzM8WeAW58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741991391; c=relaxed/simple;
	bh=zQvDGlTxbfASsNqH0b7/piTbZHd8Z/n3K4ywHPEYoLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NhBPfyjmuEIkUBIfgTWy/UvnqjzQSIEBmiNfNFG+sM/Oa/3iurR/1uuM5XhlNNEOVb3yY5wm/qUAQocHlYNiX+gbDzOTj0RAPRxCKWF8wcp2c5E1QoC/PORFfHCtc7N0ahpPHUSn6Q8l3aPkWjV6vBCt0TMOEjEwrSC+U/+KnCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBcpjp4c; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBcpjp4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741991390; x=1773527390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQvDGlTxbfASsNqH0b7/piTbZHd8Z/n3K4ywHPEYoLs=;
  b=OBcpjp4c8he9XsJy3CQaJeuWPo4Fc5TFOFzZTIJWf/LTF4ndL7uGZ5lS
   uD8ExZC+KRfhGCtAQXnwWuCJIuF9BKMDD3oYMt4nO0278mvvvnWqnMUCZ
   qBW9BvzfSuGRCjw/JsNOsMl2knFv+SHXV26cc/uyeLdPQn1hPZi1zFGtA
   PdikhZdNz9vPsPh9/LPxR1/Mb2L29bbYnuib07EbkrPxzoiHcZjvCf+pO
   l59GGE7UhE821ykxzlXHGvUqNehlhp9JxAb3i4KkVwBFCtfXQCSwht9sM
   e/F8HSByagdM1nxWzabmWDWe1oob/ECAE/IVRt6titqffyB0QnzsAS27I
   g==;
X-CSE-ConnectionGUID: H1j86HUeST+XtILvCWpDng==
X-CSE-MsgGUID: 9EyRV0gWTZm2Rz0Iokdr3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43045752"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43045752"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 15:29:49 -0700
X-CSE-ConnectionGUID: eWK1vVC1SCaz+AfvPZHKRQ==
X-CSE-MsgGUID: jE/qEySnR7Sl5o8wIpI7Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126266640"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 15:29:48 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttDXF-000Asm-2P;
	Fri, 14 Mar 2025 22:29:45 +0000
Date: Sat, 15 Mar 2025 06:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/pci/intel/ipu-bridge.c:552
 ipu_bridge_instantiate_vcm_work() warn: passing positive error code '(-19)'
 to 'PTR_ERR'
Message-ID: <202503150601.brcfclpJ-lkp@intel.com>
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
TO: Ricardo Ribalda <ribalda@chromium.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

Hi Ricardo,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   83158b21ae9a1a5c8285c3d542981bae914e26b6
commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
date:   11 months ago
:::::: branch date: 88 minutes ago
:::::: commit date: 11 months ago
config: openrisc-randconfig-r072-20250314 (https://download.01.org/0day-ci/archive/20250315/202503150601.brcfclpJ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503150601.brcfclpJ-lkp@intel.com/

New smatch warnings:
drivers/media/pci/intel/ipu-bridge.c:552 ipu_bridge_instantiate_vcm_work() warn: passing positive error code '(-19)' to 'PTR_ERR'

Old smatch warnings:
drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented

vim +552 drivers/media/pci/intel/ipu-bridge.c

8e3e916e23f5ab0 Hans de Goede 2023-07-05  523  
8e3e916e23f5ab0 Hans de Goede 2023-07-05  524  static void ipu_bridge_instantiate_vcm_work(struct work_struct *work)
8e3e916e23f5ab0 Hans de Goede 2023-07-05  525  {
8e3e916e23f5ab0 Hans de Goede 2023-07-05  526  	struct ipu_bridge_instantiate_vcm_work_data *data =
8e3e916e23f5ab0 Hans de Goede 2023-07-05  527  		container_of(work, struct ipu_bridge_instantiate_vcm_work_data,
8e3e916e23f5ab0 Hans de Goede 2023-07-05  528  			     work);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  529  	struct acpi_device *adev = ACPI_COMPANION(data->sensor);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  530  	struct i2c_client *vcm_client;
8e3e916e23f5ab0 Hans de Goede 2023-07-05  531  	bool put_fwnode = true;
8e3e916e23f5ab0 Hans de Goede 2023-07-05  532  	int ret;
8e3e916e23f5ab0 Hans de Goede 2023-07-05  533  
8e3e916e23f5ab0 Hans de Goede 2023-07-05  534  	/*
8e3e916e23f5ab0 Hans de Goede 2023-07-05  535  	 * The client may get probed before the device_link gets added below
8e3e916e23f5ab0 Hans de Goede 2023-07-05  536  	 * make sure the sensor is powered-up during probe.
8e3e916e23f5ab0 Hans de Goede 2023-07-05  537  	 */
8e3e916e23f5ab0 Hans de Goede 2023-07-05  538  	ret = pm_runtime_get_sync(data->sensor);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  539  	if (ret < 0) {
8e3e916e23f5ab0 Hans de Goede 2023-07-05  540  		dev_err(data->sensor, "Error %d runtime-resuming sensor, cannot instantiate VCM\n",
8e3e916e23f5ab0 Hans de Goede 2023-07-05  541  			ret);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  542  		goto out_pm_put;
8e3e916e23f5ab0 Hans de Goede 2023-07-05  543  	}
8e3e916e23f5ab0 Hans de Goede 2023-07-05  544  
8e3e916e23f5ab0 Hans de Goede 2023-07-05  545  	/*
8e3e916e23f5ab0 Hans de Goede 2023-07-05  546  	 * Note the client is created only once and then kept around
8e3e916e23f5ab0 Hans de Goede 2023-07-05  547  	 * even after a rmmod, just like the software-nodes.
8e3e916e23f5ab0 Hans de Goede 2023-07-05  548  	 */
8e3e916e23f5ab0 Hans de Goede 2023-07-05  549  	vcm_client = i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(adev),
8e3e916e23f5ab0 Hans de Goede 2023-07-05  550  						   1, &data->board_info);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  551  	if (IS_ERR(vcm_client)) {
8e3e916e23f5ab0 Hans de Goede 2023-07-05 @552  		dev_err(data->sensor, "Error instantiating VCM client: %ld\n",
8e3e916e23f5ab0 Hans de Goede 2023-07-05  553  			PTR_ERR(vcm_client));
8e3e916e23f5ab0 Hans de Goede 2023-07-05  554  		goto out_pm_put;
8e3e916e23f5ab0 Hans de Goede 2023-07-05  555  	}
8e3e916e23f5ab0 Hans de Goede 2023-07-05  556  
8e3e916e23f5ab0 Hans de Goede 2023-07-05  557  	device_link_add(&vcm_client->dev, data->sensor, DL_FLAG_PM_RUNTIME);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  558  
8e3e916e23f5ab0 Hans de Goede 2023-07-05  559  	dev_info(data->sensor, "Instantiated %s VCM\n", data->board_info.type);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  560  	put_fwnode = false; /* Ownership has passed to the i2c-client */
8e3e916e23f5ab0 Hans de Goede 2023-07-05  561  
8e3e916e23f5ab0 Hans de Goede 2023-07-05  562  out_pm_put:
8e3e916e23f5ab0 Hans de Goede 2023-07-05  563  	pm_runtime_put(data->sensor);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  564  	put_device(data->sensor);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  565  	if (put_fwnode)
8e3e916e23f5ab0 Hans de Goede 2023-07-05  566  		fwnode_handle_put(data->board_info.fwnode);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  567  	kfree(data);
8e3e916e23f5ab0 Hans de Goede 2023-07-05  568  }
8e3e916e23f5ab0 Hans de Goede 2023-07-05  569  

:::::: The code at line 552 was first introduced by commit
:::::: 8e3e916e23f5ab0ceb046d57f4d41d53159b8192 media: ipu-bridge: Add a runtime-pm device-link between VCM and sensor

:::::: TO: Hans de Goede <hdegoede@redhat.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
