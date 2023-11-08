Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638DF38F94
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 19:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEC+mN31"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699470589; x=1731006589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lXvrYvSnXDc3ms8eW/PFrfB1Bxt442nkfofjJxT7/Mo=;
  b=gEC+mN31C+KWqGfPthJhpnCb2kSl+RnHKDCtoXu/gRLv6hyUKPhMAuPk
   El/Rq9epKIuuGtME4Rceb8BVguXs1DQuGXujug3JcUrvwBBAz5pXMaJ8H
   C6sEobiCHauTXsuLuwcv8U+TYovWgbQRJADUBkuy4FV4wh/+M8bKtza9K
   Gs8JCX0aANJxqj7/XPUBiUTvHqaBPcq6yacRKaS+9c0z4ekADagmTSILF
   W+nH4hDJ81bIS0l4j2gRoTTg/ZnYWF7KvQGdgaj57vxYU51swbVAH7k7q
   nyaaqsIwanGnDZDUg+8tjqNBjV806CA6kVL0aQmCRddGHZ9+CDHzTtFFM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="420939436"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="420939436"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 11:09:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="833577296"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="833577296"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Nov 2023 11:09:47 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0nvt-00088K-0z;
	Wed, 08 Nov 2023 19:09:45 +0000
Date: Thu, 9 Nov 2023 03:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/aw88399.c:1700 aw88399_request_firmware_file()
 warn: '&cont' from request_firmware() not released on lines: 1681,1690,1700.
Message-ID: <202311090211.W4fxFXHT-lkp@intel.com>
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
head:   90450a06162e6c71ab813ea22a83196fe7cff4bc
commit: 8ade6cc7e26175529474690fdbc1965901ec2024 ASoC: codecs: Add aw88399 amplifier driver
date:   2 weeks ago
:::::: branch date: 71 minutes ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20231108 (https://download.01.org/0day-ci/archive/20231109/202311090211.W4fxFXHT-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311090211.W4fxFXHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311090211.W4fxFXHT-lkp@intel.com/

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
