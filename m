Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C328E18DF6D
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726988327; cv=none; b=lOetzc4VBKbsI4tSYBSLlT68XoAP+4sYSalZskEhfjM4eqoPOUR1Hz17ORpHaIz3w6vOE3Nqh0dxgarPdWvKkjXaeqK+swEBrJFwDPty1g7SjdiQhOeqqQwtWemlcf6+PLa4iTprvtncFBOlBhbUk6X1hRf+BwbD/DCI6zb/axE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726988327; c=relaxed/simple;
	bh=u0jkxnxO2BT9rk6vH9MayTuLSotlz/InN2bTcCJzHpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hZL+RdMEicT34qtczycK5Vbn3sGaUXlCvPtpzsM0KMiUBqA3l0oODwflgN6n8rXPevUMn5gP74XLM4EExVfmEZXQagefIBmBCJViFbTT1pSHbSqhm/msuNMO+L6+12hEZKyB6Pu2usTi5ermORAHt7DSw07B04rzW4qJOIk3BJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGmedGJ8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGmedGJ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726988326; x=1758524326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0jkxnxO2BT9rk6vH9MayTuLSotlz/InN2bTcCJzHpQ=;
  b=nGmedGJ8qklV1STMeG9WwO5Kvxjs1PGrz4TR5yQtFw4vZe/nK9HCEZeW
   6/qiK2wtbnabiWPNIj4eeFYygQcSVUAxobl5Npve/LQzi3uxDZO8dcP/p
   9koQZappujsADnosIotGouDOPBFWjF3m/uxhwSjZ57qWzN58lA1tYNYmo
   /tdyLj1jwRF+zT+1mYbrFJTefN/iKn/l6aMMB+U9G6roaFeYjMHUVrgQi
   Xz7Li7x3y75BpCX+9uQVKSnHe9nfrvIBwkRe2ez2gC2h41fqbcEE9vR8/
   NntGohQYx1fK5U+x4oSqPeWZeEZMkREs85EUl/G+3yM06LWH1Zc/XwSxp
   Q==;
X-CSE-ConnectionGUID: kmtqKjXxSmaQoO/4+1xjTA==
X-CSE-MsgGUID: 5Zx+PvSSS5uAd1ZgS5/3EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25776408"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="25776408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 23:58:43 -0700
X-CSE-ConnectionGUID: twLT7m+yTmypbe6e00xcRw==
X-CSE-MsgGUID: w+slo5V6TkSekeimAt9V7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="108175018"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Sep 2024 23:58:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssGYJ-000G6c-1L;
	Sun, 22 Sep 2024 06:58:39 +0000
Date: Sun, 22 Sep 2024 14:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/intel/qat/qat_common/adf_sysfs.c:25:9-35: opportunity
 for str_up_down(adf_dev_started ( accel_dev ))
Message-ID: <202409221449.6N37xqbo-lkp@intel.com>
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
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 6 months ago
config: csky-randconfig-r051-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221449.6N37xqbo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409221449.6N37xqbo-lkp@intel.com/

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
