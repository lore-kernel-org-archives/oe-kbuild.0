Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712BD3207
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 00:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676505732; x=1708041732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MjVHfKS2ha18jhDmAkHInPE0mte+6qXYVZizuUXfRV4=;
  b=IxpvMnE2w3NhyfRi5qGWW4ZjeEJtObDyBLr6TLwZHNH3Xv34reVfHQw2
   IGkVF3HoqvQAuWfK8X+jLoZN9/3XSlvtll7KK9r4UbLfb5gQuvx8Hxnfc
   c3aPooU5EinoZ/yYZ5uYdchFkNxNPdSX4LZKxeuv/XRvp/BKIh+anvctq
   JAJdXFiHfIfVMAq3hDJGXorfil8wYNMyY+jXj4rDPJk1QxEmAwRpYQ6BF
   9okuVK9Bi3ZxIhDL73jYcdONd1PnTFtNUNopE7QxiEhMU+qg8Isb6JVUy
   LS31NQWgNFJDoI3ZuD2cThTKIJkhn37mBUPzXZ7+3Y/Zuke+snoR04KUC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="396213040"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="396213040"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 16:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="843924707"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="843924707"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Feb 2023 16:02:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSRiz-0009tD-3D;
	Thu, 16 Feb 2023 00:02:10 +0000
Date: Thu, 16 Feb 2023 08:01:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [matthias-bgg:v6.3-tmp/soc 42/48]
 drivers/soc/mediatek/mtk-svs.c:1740 svs_get_efuse_data() warn: passing zero
 to 'PTR_ERR'
Message-ID: <202302160720.N64SWT4l-lkp@intel.com>
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
TO: Roger Lu <roger.lu@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.3-tmp/soc
head:   d19b23050ea976b42a6527a623cdd5774c290b8b
commit: 6c7174fd90a4690e2154a6a77ad2ffa119166217 [42/48] soc: mediatek: mtk-svs: use svs get efuse common function
:::::: branch date: 34 hours ago
:::::: commit date: 13 days ago
config: microblaze-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230216/202302160720.N64SWT4l-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302160720.N64SWT4l-lkp@intel.com/

New smatch warnings:
drivers/soc/mediatek/mtk-svs.c:1740 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/soc/mediatek/mtk-svs.c:1742 svs_get_efuse_data() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1740 drivers/soc/mediatek/mtk-svs.c

681a02e9500073c Roger Lu                   2022-05-16  1731  
6c7174fd90a4690 Roger Lu                   2023-02-02  1732  static int svs_get_efuse_data(struct svs_platform *svsp,
6c7174fd90a4690 Roger Lu                   2023-02-02  1733  			      const char *nvmem_cell_name,
6c7174fd90a4690 Roger Lu                   2023-02-02  1734  			      u32 **svsp_efuse, size_t *svsp_efuse_max)
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1735  {
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1736  	struct nvmem_cell *cell;
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1737  
6c7174fd90a4690 Roger Lu                   2023-02-02  1738  	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1739  	if (IS_ERR_OR_NULL(cell)) {
6c7174fd90a4690 Roger Lu                   2023-02-02 @1740  		dev_err(svsp->dev, "no \"%s\"? %ld\n",
6c7174fd90a4690 Roger Lu                   2023-02-02  1741  			nvmem_cell_name, PTR_ERR(cell));
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1742  		return PTR_ERR(cell);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1743  	}
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1744  
6c7174fd90a4690 Roger Lu                   2023-02-02  1745  	*svsp_efuse = nvmem_cell_read(cell, svsp_efuse_max);
6c7174fd90a4690 Roger Lu                   2023-02-02  1746  	if (IS_ERR(*svsp_efuse)) {
6c7174fd90a4690 Roger Lu                   2023-02-02  1747  		dev_err(svsp->dev, "cannot read \"%s\" efuse: %ld\n",
6c7174fd90a4690 Roger Lu                   2023-02-02  1748  			nvmem_cell_name, PTR_ERR(*svsp_efuse));
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1749  		nvmem_cell_put(cell);
6c7174fd90a4690 Roger Lu                   2023-02-02  1750  		return PTR_ERR(*svsp_efuse);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1751  	}
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1752  
6c7174fd90a4690 Roger Lu                   2023-02-02  1753  	*svsp_efuse_max /= sizeof(u32);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1754  	nvmem_cell_put(cell);
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1755  
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1756  	return 0;
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1757  }
43819e385330662 AngeloGioacchino Del Regno 2022-08-25  1758  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
