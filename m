Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E412F5A
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jun 2023 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686379583; x=1717915583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxzkeUh87JXxlNHHAqU8qLxHyq/9PZJa3a0n8hXv0vg=;
  b=JqJnXF61CYoKonZpF6+NgUF/hPiAL4K1y4yG2gqXVv/SvjkxbGjsKjfB
   mATBL4zvxgMwlxnByDmkxbIG5pRIltVDO/y03Sn/dzFAo6Ra6DjCKboly
   +MX3a6ffwYwoQ3xpWlo1vGauVGKLs8XhYosdyuGYIW7HjSKa6n+v9bLBK
   ztmwUMvLSy7MVkvGOI6NbmXg3ZcGdsTSMoTz//A3yGNUAFZQJlytcYWrZ
   3hWvC/M99spY3Sc7iA2j7P6dkz9wrYhSZYDBqovE9C5kkyXcPRb+VOHkh
   WlMPt6C7z14PGhlwbWwz65TnE4BOznOan7U4YXR2I9fGbOVT5R4Scvea3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="386108508"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="386108508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 23:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="823308874"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="823308874"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2023 23:46:21 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7sMe-0009pk-1L;
	Sat, 10 Jun 2023 06:46:20 +0000
Date: Sat, 10 Jun 2023 14:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 11/11] drm/mediatek: gamma: Program gamma LUT type for
 descending or rising
Message-ID: <202306101458.lRXHEE0Z-lkp@intel.com>
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
In-Reply-To: <20230601121022.2401844-12-angelogioacchino.delregno@collabora.com>
References: <20230601121022.2401844-12-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: chunkuang.hu@kernel.org
CC: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>
CC: linux-kernel@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-mediatek@lists.infradead.org
CC: wenst@chromium.org
CC: matthias.bgg@gmail.com
CC: kernel@collabora.com
CC: linux-arm-kernel@lists.infradead.org
CC: angelogioacchino.delregno@collabora.com

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc5 next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230601-222357
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230601121022.2401844-12-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v5 11/11] drm/mediatek: gamma: Program gamma LUT type for descending or rising
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-m031-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101458.lRXHEE0Z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306101458.lRXHEE0Z-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/mediatek/mtk_disp_gamma.c:192 mtk_gamma_set_common() error: we previously assumed 'gamma->data' could be null (see line 120)

vim +192 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  102  
4873468a82b553 Jason-JH.Lin               2023-06-01  103  void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
69a4237ab1d13a Yongqiang Niu              2021-01-29  104  {
4873468a82b553 Jason-JH.Lin               2023-06-01  105  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  106  	void __iomem *lut0_base = regs + DISP_GAMMA_LUT;
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  107  	void __iomem *lut1_base = regs + DISP_GAMMA_LUT1;
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  108  	u32 cfg_val, data_mode, lbank_val, word[2];
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  109  	int cur_bank, num_lut_banks;
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  110  	u16 lut_bank_size, lut_size;
69a4237ab1d13a Yongqiang Niu              2021-01-29  111  	struct drm_color_lut *lut;
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  112  	unsigned int i;
4873468a82b553 Jason-JH.Lin               2023-06-01  113  	bool lut_diff;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  114  	u8 lut_bits;
69a4237ab1d13a Yongqiang Niu              2021-01-29  115  
e824bd353592b5 AngeloGioacchino Del Regno 2023-06-01  116  	/* If there's no gamma lut there's nothing to do here. */
e824bd353592b5 AngeloGioacchino Del Regno 2023-06-01  117  	if (!state->gamma_lut)
e824bd353592b5 AngeloGioacchino Del Regno 2023-06-01  118  		return;
e824bd353592b5 AngeloGioacchino Del Regno 2023-06-01  119  
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01 @120  	if (gamma && gamma->data) {
4873468a82b553 Jason-JH.Lin               2023-06-01  121  		lut_diff = gamma->data->lut_diff;
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  122  		lut_bank_size = gamma->data->lut_bank_size;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  123  		lut_bits = gamma->data->lut_bits;
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01  124  		lut_size = gamma->data->lut_size;
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01  125  	} else {
4873468a82b553 Jason-JH.Lin               2023-06-01  126  		lut_diff = false;
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  127  		lut_bank_size = LUT_SIZE_DEFAULT;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  128  		lut_bits = LUT_BITS_DEFAULT;
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01  129  		lut_size = LUT_SIZE_DEFAULT;
ca340e013e3733 AngeloGioacchino Del Regno 2023-06-01  130  	}
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  131  	num_lut_banks = lut_size / lut_bank_size;
4873468a82b553 Jason-JH.Lin               2023-06-01  132  
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  133  	cfg_val = readl(regs + DISP_GAMMA_CFG);
69a4237ab1d13a Yongqiang Niu              2021-01-29  134  	lut = (struct drm_color_lut *)state->gamma_lut->data;
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  135  
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  136  	/* Switch to 12 bits data mode if supported */
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  137  	data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  138  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  139  	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  140  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  141  		/* Switch gamma bank and set data mode before writing LUT */
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  142  		if (num_lut_banks > 1) {
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  143  			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  144  			lbank_val |= data_mode;
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  145  			writel(lbank_val, regs + DISP_GAMMA_BANK);
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  146  		}
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  147  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  148  		for (i = 0; i < lut_bank_size; i++) {
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  149  			int n = (cur_bank * lut_bank_size) + i;
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  150  			struct drm_color_lut diff, hwlut;
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  151  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  152  			hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  153  			hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  154  			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  155  
ba99d08da6adec Yongqiang Niu              2022-04-28  156  			if (!lut_diff || (i % 2 == 0)) {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  157  				if (lut_bits == 12) {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  158  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, hwlut.red);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  159  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, hwlut.green);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  160  					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, hwlut.blue);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  161  				} else {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  162  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  163  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  164  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  165  				}
ba99d08da6adec Yongqiang Niu              2022-04-28  166  			} else {
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  167  				diff.red = lut[n].red - lut[n - 1].red;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  168  				diff.red = drm_color_lut_extract(diff.red, lut_bits);
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  169  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  170  				diff.green = lut[n].green - lut[n - 1].green;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  171  				diff.green = drm_color_lut_extract(diff.green, lut_bits);
77eb9fd1f1ff7c AngeloGioacchino Del Regno 2023-06-01  172  
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  173  				diff.blue = lut[n].blue - lut[n - 1].blue;
1829ae02cf6bb6 AngeloGioacchino Del Regno 2023-06-01  174  				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
ba99d08da6adec Yongqiang Niu              2022-04-28  175  
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  176  				if (lut_bits == 12) {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  177  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, diff.red);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  178  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, diff.green);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  179  					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, diff.blue);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  180  				} else {
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  181  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  182  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  183  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  184  				}
ba99d08da6adec Yongqiang Niu              2022-04-28  185  			}
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  186  			writel(word[0], (lut0_base + i * 4));
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  187  			if (lut_bits == 12)
b13cb453a8db5d AngeloGioacchino Del Regno 2023-06-01  188  				writel(word[1], (lut1_base + i * 4));
69a4237ab1d13a Yongqiang Niu              2021-01-29  189  		}
a26000d47a579c AngeloGioacchino Del Regno 2023-06-01  190  	}
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  191  
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01 @192  	if (gamma && !gamma->data->has_dither) {
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  193  		/* Descending or Rising LUT */
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  194  		if (mtk_gamma_lut_is_descending(lut, lut_size))
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  195  			cfg_val |= FIELD_PREP(GAMMA_LUT_TYPE, 1);
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  196  		else
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  197  			cfg_val &= ~GAMMA_LUT_TYPE;
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  198  	}
3d61ac6c44ce4d AngeloGioacchino Del Regno 2023-06-01  199  
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  200  	/* Enable the gamma table */
2979ceb320a4ed AngeloGioacchino Del Regno 2023-06-01  201  	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  202  
e21d98027e50c8 AngeloGioacchino Del Regno 2023-06-01  203  	/* Disable RELAY mode to pass the processed image */
e21d98027e50c8 AngeloGioacchino Del Regno 2023-06-01  204  	cfg_val &= ~GAMMA_RELAY_MODE;
e21d98027e50c8 AngeloGioacchino Del Regno 2023-06-01  205  
ee2cb37b9ac9e2 AngeloGioacchino Del Regno 2023-06-01  206  	writel(cfg_val, regs + DISP_GAMMA_CFG);
69a4237ab1d13a Yongqiang Niu              2021-01-29  207  }
69a4237ab1d13a Yongqiang Niu              2021-01-29  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
