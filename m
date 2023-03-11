Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A963F7E5
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Mar 2023 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678576506; x=1710112506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ENVDCvHAusf3A/DaUPMkNhu2PlfiWWppgCYncyiZ/Ws=;
  b=C3mlD/bmn8z3qkMnR9oXQYn636kfGBEej4Nc9YlbRBvruJsAnNY9AfUA
   BA+wQYJR38m/ocx24WfGS7YC1A8Zzhxz4OhSubpKTFEr9rhUvAgb1N0Jo
   pJzmZsvoio6ylm5ph/nCUaLPWoIa58ZeUjiYydsRlvvSEeZfnRTTA8XFx
   Alpm2q81yNK7JmrvvGKeXygzFIJfwWIwx/yJ27ty8YO8WAHSaXH4g08YK
   e8VJyzxyNmK/pjrBRSyx+LN6acjW1JUp3s6R9vSw1M5qX/ukYHRNBRMP3
   F/OZcOmCiX98yUjIMfUE+5540dcjOxuETW0G3H3w4haJM2i8or8LJfddh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="334420917"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="334420917"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 15:15:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="788461892"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="788461892"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2023 15:15:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb8Qa-0004qf-0q;
	Sat, 11 Mar 2023 23:15:04 +0000
Date: Sun, 12 Mar 2023 07:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1161/2655] drivers/soc/mediatek/mtk-svs.c:1740
 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'
Message-ID: <202303120758.x4oFgtr4-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Roger Lu <roger.lu@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   24469a0e5052ba01a35a15f104717a82b7a4798b
commit: 9f195f3a1e696b6576988c1e58fa7389beae3351 [1161/2655] soc: mediatek: mtk-svs: use svs get efuse common function
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: s390-randconfig-m031-20230310 (https://download.01.org/0day-ci/archive/20230312/202303120758.x4oFgtr4-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303120758.x4oFgtr4-lkp@intel.com/

New smatch warnings:
drivers/soc/mediatek/mtk-svs.c:1740 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/soc/mediatek/mtk-svs.c:1742 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1740 drivers/soc/mediatek/mtk-svs.c

681a02e9500073 Roger Lu                   2022-05-16  1731  
9f195f3a1e696b Roger Lu                   2023-02-02  1732  static int svs_get_efuse_data(struct svs_platform *svsp,
9f195f3a1e696b Roger Lu                   2023-02-02  1733  			      const char *nvmem_cell_name,
9f195f3a1e696b Roger Lu                   2023-02-02  1734  			      u32 **svsp_efuse, size_t *svsp_efuse_max)
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1735  {
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1736  	struct nvmem_cell *cell;
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1737  
9f195f3a1e696b Roger Lu                   2023-02-02  1738  	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1739  	if (IS_ERR_OR_NULL(cell)) {
9f195f3a1e696b Roger Lu                   2023-02-02 @1740  		dev_err(svsp->dev, "no \"%s\"? %ld\n",
9f195f3a1e696b Roger Lu                   2023-02-02  1741  			nvmem_cell_name, PTR_ERR(cell));
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1742  		return PTR_ERR(cell);
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1743  	}
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1744  
9f195f3a1e696b Roger Lu                   2023-02-02  1745  	*svsp_efuse = nvmem_cell_read(cell, svsp_efuse_max);
9f195f3a1e696b Roger Lu                   2023-02-02  1746  	if (IS_ERR(*svsp_efuse)) {
9f195f3a1e696b Roger Lu                   2023-02-02  1747  		dev_err(svsp->dev, "cannot read \"%s\" efuse: %ld\n",
9f195f3a1e696b Roger Lu                   2023-02-02  1748  			nvmem_cell_name, PTR_ERR(*svsp_efuse));
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1749  		nvmem_cell_put(cell);
9f195f3a1e696b Roger Lu                   2023-02-02  1750  		return PTR_ERR(*svsp_efuse);
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1751  	}
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1752  
9f195f3a1e696b Roger Lu                   2023-02-02  1753  	*svsp_efuse_max /= sizeof(u32);
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1754  	nvmem_cell_put(cell);
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1755  
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1756  	return 0;
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1757  }
43819e38533066 AngeloGioacchino Del Regno 2022-08-25  1758  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
