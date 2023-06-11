Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4058C17C6
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jun 2023 04:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686457670; x=1717993670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RuwH3/HlfemTUQXRgBE2kjMkSAD0GGQYwnix5lqk4fo=;
  b=Bjvsee9May9laW4CWggDU3gfCA3DgLPJ7glUksfWgZMVtmNTWgUXGdFV
   t0TxTmomS4HOydyTSZhDN7rYK2seH2gHVQt0NFi6/w34qgEAzdbBpmCzZ
   aqlegQn0z2tLNZp/vNBfsmWNVu7oX4MrFah7r/v7icAv58cPD8pJsZLOj
   yXNGVWUHtutuVaA1pO38CdHYsF+wP5mVCA1FQpD43WJp1FWKkge1GY5CS
   gXH3Eg1NsfsX1A0LgygPSxLRBuFWr7ehdluS46vag+mddZcRKl5iY9YZx
   Qej+K1Tm3atqleONS+R5uJ4eSaPfn/xbbGjFddAXhKJAFYkQiBwknNyJ1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="357824536"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="357824536"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 21:27:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="710800395"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="710800395"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2023 21:27:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8Cg7-000Ad1-0V;
	Sun, 11 Jun 2023 04:27:47 +0000
Date: Sun, 11 Jun 2023 12:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 4/6] drm/mediatek: mt8188: Modify display driver for
 VDOSYS1
Message-ID: <202306111219.xaQyPjpU-lkp@intel.com>
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
In-Reply-To: <20230607061121.6732-5-shawn.sung@mediatek.com>
References: <20230607061121.6732-5-shawn.sung@mediatek.com>
TO: Hsiao Chien Sung <shawn.sung@mediatek.com>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: Project_Global_Chrome_Upstream_Group@mediatek.com
CC: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: Singo Chang <singo.chang@mediatek.com>
CC: Nancy Lin <nancy.lin@mediatek.com>
CC: "Jason-JH Lin" <jason-jh.lin@mediatek.com>
CC: Hsiao Chein Sung <shawn.sung@mediatek.com>
CC: Fei Shao <fshao@google.com>

Hi Hsiao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next pza/reset/next linus/master v6.4-rc5 next-20230609]
[cannot apply to pza/imx-drm/next mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hsiao-Chien-Sung/dt-bindings-display-mediatek-mt8188-Add-documentations-for-VDOSYS1/20230607-141310
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230607061121.6732-5-shawn.sung%40mediatek.com
patch subject: [PATCH v1 4/6] drm/mediatek: mt8188: Modify display driver for VDOSYS1
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230611/202306111219.xaQyPjpU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306111219.xaQyPjpU-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c:221 mtk_ovl_adaptor_clk_enable() error: uninitialized symbol 'ret'.

vim +/ret +221 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c

453c3364632a1f Nancy.Lin        2023-03-21  186  
453c3364632a1f Nancy.Lin        2023-03-21  187  int mtk_ovl_adaptor_clk_enable(struct device *dev)
453c3364632a1f Nancy.Lin        2023-03-21  188  {
453c3364632a1f Nancy.Lin        2023-03-21  189  	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
453c3364632a1f Nancy.Lin        2023-03-21  190  	struct device *comp;
453c3364632a1f Nancy.Lin        2023-03-21  191  	int ret;
453c3364632a1f Nancy.Lin        2023-03-21  192  	int i;
453c3364632a1f Nancy.Lin        2023-03-21  193  
453c3364632a1f Nancy.Lin        2023-03-21  194  	for (i = 0; i < OVL_ADAPTOR_MERGE0; i++) {
453c3364632a1f Nancy.Lin        2023-03-21  195  		comp = ovl_adaptor->ovl_adaptor_comp[i];
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  196  		if (!comp)
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  197  			continue;
453c3364632a1f Nancy.Lin        2023-03-21  198  		ret = pm_runtime_get_sync(comp);
453c3364632a1f Nancy.Lin        2023-03-21  199  		if (ret < 0) {
453c3364632a1f Nancy.Lin        2023-03-21  200  			dev_err(dev, "Failed to enable power domain %d, err %d\n", i, ret);
453c3364632a1f Nancy.Lin        2023-03-21  201  			goto pwr_err;
453c3364632a1f Nancy.Lin        2023-03-21  202  		}
453c3364632a1f Nancy.Lin        2023-03-21  203  	}
453c3364632a1f Nancy.Lin        2023-03-21  204  
453c3364632a1f Nancy.Lin        2023-03-21  205  	for (i = 0; i < OVL_ADAPTOR_ID_MAX; i++) {
453c3364632a1f Nancy.Lin        2023-03-21  206  		comp = ovl_adaptor->ovl_adaptor_comp[i];
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  207  		if (!comp)
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  208  			continue;
453c3364632a1f Nancy.Lin        2023-03-21  209  		if (i < OVL_ADAPTOR_MERGE0)
453c3364632a1f Nancy.Lin        2023-03-21  210  			ret = mtk_mdp_rdma_clk_enable(comp);
453c3364632a1f Nancy.Lin        2023-03-21  211  		else if (i < OVL_ADAPTOR_ETHDR0)
453c3364632a1f Nancy.Lin        2023-03-21  212  			ret = mtk_merge_clk_enable(comp);
453c3364632a1f Nancy.Lin        2023-03-21  213  		else
453c3364632a1f Nancy.Lin        2023-03-21  214  			ret = mtk_ethdr_clk_enable(comp);
453c3364632a1f Nancy.Lin        2023-03-21  215  		if (ret) {
453c3364632a1f Nancy.Lin        2023-03-21  216  			dev_err(dev, "Failed to enable clock %d, err %d\n", i, ret);
453c3364632a1f Nancy.Lin        2023-03-21  217  			goto clk_err;
453c3364632a1f Nancy.Lin        2023-03-21  218  		}
453c3364632a1f Nancy.Lin        2023-03-21  219  	}
453c3364632a1f Nancy.Lin        2023-03-21  220  
453c3364632a1f Nancy.Lin        2023-03-21 @221  	return ret;
453c3364632a1f Nancy.Lin        2023-03-21  222  
453c3364632a1f Nancy.Lin        2023-03-21  223  clk_err:
453c3364632a1f Nancy.Lin        2023-03-21  224  	while (--i >= 0) {
453c3364632a1f Nancy.Lin        2023-03-21  225  		comp = ovl_adaptor->ovl_adaptor_comp[i];
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  226  		if (!comp)
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  227  			continue;
453c3364632a1f Nancy.Lin        2023-03-21  228  		if (i < OVL_ADAPTOR_MERGE0)
453c3364632a1f Nancy.Lin        2023-03-21  229  			mtk_mdp_rdma_clk_disable(comp);
453c3364632a1f Nancy.Lin        2023-03-21  230  		else if (i < OVL_ADAPTOR_ETHDR0)
453c3364632a1f Nancy.Lin        2023-03-21  231  			mtk_merge_clk_disable(comp);
453c3364632a1f Nancy.Lin        2023-03-21  232  		else
453c3364632a1f Nancy.Lin        2023-03-21  233  			mtk_ethdr_clk_disable(comp);
453c3364632a1f Nancy.Lin        2023-03-21  234  	}
453c3364632a1f Nancy.Lin        2023-03-21  235  	i = OVL_ADAPTOR_MERGE0;
453c3364632a1f Nancy.Lin        2023-03-21  236  
453c3364632a1f Nancy.Lin        2023-03-21  237  pwr_err:
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  238  	while (--i >= 0) {
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  239  		comp = ovl_adaptor->ovl_adaptor_comp[i];
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  240  		if (!comp)
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  241  			continue;
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  242  		pm_runtime_put(comp);
d7c6ad1b0a9ec1 Hsiao Chien Sung 2023-06-07  243  	}
453c3364632a1f Nancy.Lin        2023-03-21  244  
453c3364632a1f Nancy.Lin        2023-03-21  245  	return ret;
453c3364632a1f Nancy.Lin        2023-03-21  246  }
453c3364632a1f Nancy.Lin        2023-03-21  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
