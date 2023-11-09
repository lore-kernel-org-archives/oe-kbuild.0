Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2F347B0
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Nov 2023 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cd7gFBhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699558284; x=1731094284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jb37dePhdFRqt3fiIz5kcMTqGKWaYJ1bAu3lLoMwFyg=;
  b=Cd7gFBhb4biNZGuonbbMpDEbJDoHP3fxxk/+DgCBqWlLtKkHtBXu+kIa
   3W749P5zmqvrRv6dOQOTFZWwTadd/tDWhhoRpLi4FpBnGvcyMV+0HT9LA
   b+dz4tQQuuRw21w1Kr+cwxgPl5MgcDcsAfODJfs5mH0204VYfS/a01Ip0
   I1MG+cA8dVtczvp4nPkQAm1bjz0xoybW4VIC4KjUBOKU8kg+xdVwwO8wb
   9l+ba6aclod5lI007n7NoZImFfp0pDPgO7gSfXLoVz24Kro9ObM+Kr7ok
   BAvXdReaB8yJgiA7aDiYGAb12G4/3a8HquO3VZXR0eVZkTDPNzZC0iv4V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="392935568"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="392935568"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 11:31:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887122283"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="887122283"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 11:31:21 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1AkJ-00095Y-2L;
	Thu, 09 Nov 2023 19:31:19 +0000
Date: Fri, 10 Nov 2023 03:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/aw88399.c:1700 aw88399_request_firmware_file()
 warn: '&cont' from request_firmware() not released on lines: 1681,1690,1700.
Message-ID: <202311100355.TAxEyTmH-lkp@intel.com>
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
TO: Weidong Wang <wangweidong.a@awinic.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bc986ab839c844e78a2333a02e55f02c9e57935
commit: 8ade6cc7e26175529474690fdbc1965901ec2024 ASoC: codecs: Add aw88399 amplifier driver
date:   2 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20231108 (https://download.01.org/0day-ci/archive/20231110/202311100355.TAxEyTmH-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231110/202311100355.TAxEyTmH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311100355.TAxEyTmH-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/aw88399.c:1700 aw88399_request_firmware_file() warn: '&cont' from request_firmware() not released on lines: 1681,1690,1700.

Old smatch warnings:
sound/soc/codecs/aw88399.c:441 aw_dev_set_vcalb() error: uninitialized symbol 'vsense_select'.
sound/soc/codecs/aw88399.c:963 aw_dev_check_sram() error: uninitialized symbol 'reg_val'.

vim +1700 sound/soc/codecs/aw88399.c

8ade6cc7e26175 Weidong Wang 2023-10-25  1660  
8ade6cc7e26175 Weidong Wang 2023-10-25  1661  static int aw88399_request_firmware_file(struct aw88399 *aw88399)
8ade6cc7e26175 Weidong Wang 2023-10-25  1662  {
8ade6cc7e26175 Weidong Wang 2023-10-25  1663  	const struct firmware *cont = NULL;
8ade6cc7e26175 Weidong Wang 2023-10-25  1664  	int ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  1665  
8ade6cc7e26175 Weidong Wang 2023-10-25  1666  	aw88399->aw_pa->fw_status = AW88399_DEV_FW_FAILED;
8ade6cc7e26175 Weidong Wang 2023-10-25  1667  
8ade6cc7e26175 Weidong Wang 2023-10-25  1668  	ret = request_firmware(&cont, AW88399_ACF_FILE, aw88399->aw_pa->dev);
8ade6cc7e26175 Weidong Wang 2023-10-25  1669  	if (ret) {
8ade6cc7e26175 Weidong Wang 2023-10-25  1670  		dev_err(aw88399->aw_pa->dev, "request [%s] failed!", AW88399_ACF_FILE);
8ade6cc7e26175 Weidong Wang 2023-10-25  1671  		return ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  1672  	}
8ade6cc7e26175 Weidong Wang 2023-10-25  1673  
8ade6cc7e26175 Weidong Wang 2023-10-25  1674  	dev_dbg(aw88399->aw_pa->dev, "loaded %s - size: %zu\n",
8ade6cc7e26175 Weidong Wang 2023-10-25  1675  			AW88399_ACF_FILE, cont ? cont->size : 0);
8ade6cc7e26175 Weidong Wang 2023-10-25  1676  
8ade6cc7e26175 Weidong Wang 2023-10-25  1677  	aw88399->aw_cfg = devm_kzalloc(aw88399->aw_pa->dev,
8ade6cc7e26175 Weidong Wang 2023-10-25  1678  			struct_size(aw88399->aw_cfg, data, cont->size), GFP_KERNEL);
8ade6cc7e26175 Weidong Wang 2023-10-25  1679  	if (!aw88399->aw_cfg) {
8ade6cc7e26175 Weidong Wang 2023-10-25  1680  		release_firmware(cont);
8ade6cc7e26175 Weidong Wang 2023-10-25  1681  		return -ENOMEM;
8ade6cc7e26175 Weidong Wang 2023-10-25  1682  	}
8ade6cc7e26175 Weidong Wang 2023-10-25  1683  	aw88399->aw_cfg->len = (int)cont->size;
8ade6cc7e26175 Weidong Wang 2023-10-25  1684  	memcpy(aw88399->aw_cfg->data, cont->data, cont->size);
8ade6cc7e26175 Weidong Wang 2023-10-25  1685  	release_firmware(cont);
8ade6cc7e26175 Weidong Wang 2023-10-25  1686  
8ade6cc7e26175 Weidong Wang 2023-10-25  1687  	ret = aw88395_dev_load_acf_check(aw88399->aw_pa, aw88399->aw_cfg);
8ade6cc7e26175 Weidong Wang 2023-10-25  1688  	if (ret) {
8ade6cc7e26175 Weidong Wang 2023-10-25  1689  		dev_err(aw88399->aw_pa->dev, "load [%s] failed!", AW88399_ACF_FILE);
8ade6cc7e26175 Weidong Wang 2023-10-25  1690  		return ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  1691  	}
8ade6cc7e26175 Weidong Wang 2023-10-25  1692  
8ade6cc7e26175 Weidong Wang 2023-10-25  1693  	mutex_lock(&aw88399->lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  1694  	/* aw device init */
8ade6cc7e26175 Weidong Wang 2023-10-25  1695  	ret = aw88399_dev_init(aw88399, aw88399->aw_cfg);
8ade6cc7e26175 Weidong Wang 2023-10-25  1696  	if (ret)
8ade6cc7e26175 Weidong Wang 2023-10-25  1697  		dev_err(aw88399->aw_pa->dev, "dev init failed");
8ade6cc7e26175 Weidong Wang 2023-10-25  1698  	mutex_unlock(&aw88399->lock);
8ade6cc7e26175 Weidong Wang 2023-10-25  1699  
8ade6cc7e26175 Weidong Wang 2023-10-25 @1700  	return ret;
8ade6cc7e26175 Weidong Wang 2023-10-25  1701  }
8ade6cc7e26175 Weidong Wang 2023-10-25  1702  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
