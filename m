Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8182B816
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Mar 2023 00:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680222619; x=1711758619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+xZ7dUdK8i07V2ZYd+8CMPUycC4R7JByAI6P9VkrSwU=;
  b=du5DTGRIQ+ypZx/+oARKEOC3CGxxkyFMwDWqW2C5Hp1+KK4wkvvxSmKO
   EssE1qZ6Nt/pZmNtCnk2pztJOlr9oE7IuyrSrI8rukR7FeiF9IYj/SakO
   qEbUtHShUWclhijL81oAZsFIlS6FW35DdQUPTxVJe2ykLUdler6vgv+Es
   EQedWVI/TYklTQVhJGdpk19GFe+wbadYKMUKamLPlbbSuhcnLPtkYl3fn
   AIHuigXJQeqcTmmo6zaSE5sRYTCOy7sR50naqpgnjS0CF4PrMSPmaJul4
   SgLTiDkJ/INu/0AuXTT7g7gTiygRb7xCjcSTKcKcV+xJHgO7YH4Q1H08Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329844005"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="329844005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 17:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="715219704"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="715219704"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Mar 2023 17:30:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi2em-000LLe-2n;
	Fri, 31 Mar 2023 00:30:16 +0000
Date: Fri, 31 Mar 2023 08:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1028/7844] drivers/soc/mediatek/mtk-svs.c:1740
 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'
Message-ID: <202303310846.H0Ti6K3K-lkp@intel.com>
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
head:   a6d9e3034536ba4b68ac34490c02267e6eec9c05
commit: 9f195f3a1e696b6576988c1e58fa7389beae3351 [1028/7844] soc: mediatek: mtk-svs: use svs get efuse common function
:::::: branch date: 21 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-m031-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310846.H0Ti6K3K-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303310846.H0Ti6K3K-lkp@intel.com/

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
