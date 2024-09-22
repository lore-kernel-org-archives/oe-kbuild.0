Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EB02AF07
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727000091; cv=none; b=Ti+Q217A7tfvupoujgNj+hpE6oD50/Sur+BeX8xJSGK4mAeuhcCk9sXoiqyKoqTx4mc8nsSbK85To1zTyR59Jf8yU91AdNf1zLTIoQCuKSQtLLL+HlQxvEPuv5zAd6Zipx5A9BUa/VX2+/U9/1IV71+5EHG6rD5OC2iCGVcscLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727000091; c=relaxed/simple;
	bh=Q3wgzxXH6m6qY4sNMnryZzu1le0+Wvb7uxoEflB87Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r82oLxIHuvsBG3e7WGhL6Aj49xjHux15Fzd0CRt5HKFN0daT25yYS1WshcFiHxTDNcKbT2SmVZcqYP1315zEJ6+sEvq9QUmffVCBqnX18zV4ycM/q2+9sRF92350EkxQUJe6Z8sGRHkUMZy0Ozme5zc24DLRmUsxsOAu0RaBHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4kAYjrk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4kAYjrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727000089; x=1758536089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3wgzxXH6m6qY4sNMnryZzu1le0+Wvb7uxoEflB87Jc=;
  b=G4kAYjrku0oaWzXFos2ypLOBnUF7EJvQx4MeYw5ETfF17jJDSetRdTUJ
   dXZ7BbVVHkWrtTs86lR2Uq1i4obwmyR/qhE74XlJ62DfRXaPVjqiBIh9c
   BUuXcW14zx/wBvGri4R84B5h9mQXfSOoNX5JqPRbznYhCegjJjFKc4MMo
   i/Ohdk24wOYsWv5hFvp527t0oiGlMA+SNG8cOvqae38JPfPEAap5US7ml
   C+nnpCqE3PmSbYo5jNHHTAjghraplIXrPST65mr/oYeZIKU9LjF027ne9
   qbUtzRJYssbnLRY2owaJRj3ccy9/irqZClznd+x9zfVFy6cJHei2iGXOX
   Q==;
X-CSE-ConnectionGUID: 0C+KduCBTROAzOql+fWutA==
X-CSE-MsgGUID: M/0lgKSaTOiZ8Y+T9OEymg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36620439"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36620439"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 03:14:48 -0700
X-CSE-ConnectionGUID: NF8+Scf8QfGKRyL1QSWi1A==
X-CSE-MsgGUID: fBRozRLLTuKDD4dYES9BhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="70656051"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Sep 2024 03:14:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssJc4-000GCt-1t;
	Sun, 22 Sep 2024 10:14:44 +0000
Date: Sun, 22 Sep 2024 18:14:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/intel/qat/qat_common/adf_sysfs.c:25:9-35: opportunity
 for str_up_down(adf_dev_started ( accel_dev ))
Message-ID: <202409221848.0jTifKtq-lkp@intel.com>
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
TO: Tom Zanussi <tom.zanussi@linux.intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88264981f2082248e892a706b2c5004650faac54
commit: a4b16dad46576ce08ecb660fc923d0857dcae107 crypto: qat - Move driver to drivers/crypto/intel/qat
date:   1 year, 6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 6 months ago
config: csky-randconfig-r051-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221848.0jTifKtq-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409221848.0jTifKtq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/intel/qat/qat_common/adf_sysfs.c:25:9-35: opportunity for str_up_down(adf_dev_started ( accel_dev ))

vim +25 drivers/crypto/intel/qat/qat_common/adf_sysfs.c

5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  14  
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  15  static ssize_t state_show(struct device *dev, struct device_attribute *attr,
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  16  			  char *buf)
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  17  {
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  18  	struct adf_accel_dev *accel_dev;
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  19  	char *state;
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  20  
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  21  	accel_dev = adf_devmgr_pci_to_accel_dev(to_pci_dev(dev));
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  22  	if (!accel_dev)
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  23  		return -EINVAL;
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  24  
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27 @25  	state = adf_dev_started(accel_dev) ? "up" : "down";
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  26  	return sysfs_emit(buf, "%s\n", state);
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  27  }
5ee52118ac1481 drivers/crypto/qat/qat_common/adf_sysfs.c Giovanni Cabiddu 2022-06-27  28  

:::::: The code at line 25 was first introduced by commit
:::::: 5ee52118ac1481dd8a8f7e6a9bfe6ee05ac6ec92 crypto: qat - expose device state through sysfs for 4xxx

:::::: TO: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
