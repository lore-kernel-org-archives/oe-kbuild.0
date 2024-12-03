Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF724C60B
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 01:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733187784; cv=none; b=TB4czBqNdb+Lf97LOjvAMztyai2m/g7yBh9hY10YPG+U/jqzAhidTIi1dq2g2s22uZ9USRJClGfdai4zGrXDLNOX7e032F7P3OQCQz6gmSqesvG1TOA6BQWRaEvecvP/9UpfGg9yNvGSF3+Pi6uem37bI3DxPC68XvyEGLX7dLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733187784; c=relaxed/simple;
	bh=6H3yGzuaUiFrYI0UVUBpjLL0YyRUKtAC1C/e11Txo4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eRS/9m7ep3chgf2bbUaj1OybXRDKQNB4uP7kPGraBmksVWbKZ1yjbLUEMEWNUU+1epeLgSkBWir6OMIEgxKJqu/I3XMNtrUIYlBqv0iy/jnZMMzbUOhby0FsOiU/fWG/cDh0YrlRHBocFofR8c2wCAXp/ABpEb3Z6xF/wlsUE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQ1Kvyt1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQ1Kvyt1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733187783; x=1764723783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6H3yGzuaUiFrYI0UVUBpjLL0YyRUKtAC1C/e11Txo4A=;
  b=bQ1Kvyt123wHCVFMLYJuY5Q7EkzSj4yL+I31eMV5hKSpqgQPex1w/txr
   +7smKuP7KSRzPNJ7ucazuIqjR76ppfQTHzq/81Wp+vDPBZTys8GXqb1GX
   EOc4MZFCEhjrgJt29zoNufzTmT5KiDATTxNTWhiCel4wiOusLBsvve3PW
   v0naFdT10QtEyRS2ehArJn+dPT8JKDmMuQAYZ7bUVLOLSWaJ0Fep2V/go
   frWiBTR8/6XI53HyDrNhBX8/TprPnIBZweLsorXBS7Kfi2PxzScUaOSHR
   ezVMv0OxIrrGPUsDmP2e9hQt9lXrNNhDn6RP0UTDl2BjL8UyWiUlJr82V
   Q==;
X-CSE-ConnectionGUID: QcyY6uzJRv6urAPh/jXD4w==
X-CSE-MsgGUID: yootI/ywTkmh10M4IC9hFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33512480"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="33512480"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 17:02:59 -0800
X-CSE-ConnectionGUID: ZDKv8xiFQ9mG0kr0OEAjcw==
X-CSE-MsgGUID: Uros274mT4q5j3ST/EfwZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93599360"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Dec 2024 17:02:52 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIHJR-00036B-1U;
	Tue, 03 Dec 2024 01:02:49 +0000
Date: Tue, 3 Dec 2024 09:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/intel/catpt/loader.c:654 catpt_first_boot_firmware() warn:
 consider using resource_size() here
Message-ID: <202412030801.p9QRPA6v-lkp@intel.com>
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
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: 6cbfa11d2694b8a1e46d6834fb9705d5589e3ef1 ASoC: Intel: Select catpt and deprecate haswell
date:   4 years, 2 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 years, 2 months ago
config: i386-randconfig-141-20241112 (https://download.01.org/0day-ci/archive/20241203/202412030801.p9QRPA6v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412030801.p9QRPA6v-lkp@intel.com/

smatch warnings:
sound/soc/intel/catpt/loader.c:654 catpt_first_boot_firmware() warn: consider using resource_size() here

vim +654 sound/soc/intel/catpt/loader.c

a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  637  
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  638  int catpt_first_boot_firmware(struct catpt_dev *cdev)
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  639  {
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  640  	struct resource *res;
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  641  	int ret;
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  642  
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  643  	ret = catpt_boot_firmware(cdev, false);
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  644  	if (ret) {
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  645  		dev_err(cdev->dev, "basefw boot failed: %d\n", ret);
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  646  		return ret;
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  647  	}
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  648  
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  649  	/* restrict FW Core dump area */
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  650  	__request_region(&cdev->dram, 0, 0x200, NULL, 0);
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  651  	/* restrict entire area following BASE_FW - highest offset in DRAM */
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  652  	for (res = cdev->dram.child; res->sibling; res = res->sibling)
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29  653  		;
a9aa6fb3eb6c7e Cezary Rojewski 2020-09-29 @654  	__request_region(&cdev->dram, res->end + 1,

:::::: The code at line 654 was first introduced by commit
:::::: a9aa6fb3eb6c7e0e7e117b3f2dfafef8c45b9ea6 ASoC: Intel: catpt: Firmware loading and context restore

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
