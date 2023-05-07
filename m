Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5119D
	for <oe-kbuild@lists.linux.dev>; Sun,  7 May 2023 02:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683426808; x=1714962808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5F7KqxJTlihlicUXrjgCuMeRJpLmSYiGXo5iTLDYOOQ=;
  b=N6YFle5P4I388VO3eDAMkFsX0zk81F919oS75kMpR3XwbEKUxqt2M+SL
   R9Ax35T/xt5Ub7TQgOVEldvutSb1WK6mrziYLFe35O4VVBKx3sV/i/b0b
   zOEB1Y837GTXtHEBpxha+19SfvSGG7u/FvofWXozC98jt8W6bDiORKlFi
   HWkLqxIKbWMutwvD9kqQa54Na/3i+iYOIsyKxj/N4y8UkLQDPPhuBZZ9b
   Eq91D3dgbVbM9ROUQjEgT3da9Zc9z2ZeTFnahJ7oHgLHDOqDQyuMsyIfw
   IrrTaRBJIH8rQYchKDel0rASmzCP6L5UN/kX3dTtKHdDdZKR5ft7fLRb1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="338657961"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="338657961"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 19:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="787660971"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="787660971"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 May 2023 19:33:26 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvUDF-0000Zh-2H;
	Sun, 07 May 2023 02:33:25 +0000
Date: Sun, 7 May 2023 10:32:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 09/11] drm/mediatek: gamma: Add support for 12-bit LUT
 and MT8195
Message-ID: <202305071035.FctXyfAm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/mediatek/mtk_disp_gamma.c:129:21: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230506123549.101727-10-angelogioacchino.delregno@collabora.com>
References: <20230506123549.101727-10-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: chunkuang.hu@kernel.org
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
[also build test WARNING on pza/reset/next linus/master v6.3 next-20230505]
[cannot apply to pza/imx-drm/next mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230506-203713
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230506123549.101727-10-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v3 09/11] drm/mediatek: gamma: Add support for 12-bit LUT and MT8195
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-s033-20230507 (https://download.01.org/0day-ci/archive/20230507/202305071035.FctXyfAm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/031e227047d3314b1c10edfd79a3a4204cdc6cb7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230506-203713
        git checkout 031e227047d3314b1c10edfd79a3a4204cdc6cb7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305071035.FctXyfAm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:129:21: sparse: sparse: dubious: x & !y
   drivers/gpu/drm/mediatek/mtk_disp_gamma.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le32 [usertype]

vim +129 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

5bf9eeb70be98e AngeloGioacchino Del Regno 2023-05-06   90  
1742ba6ffde5bf Jason-JH.Lin               2023-05-06   91  void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
69a4237ab1d13a Yongqiang Niu              2021-01-29   92  {
1742ba6ffde5bf Jason-JH.Lin               2023-05-06   93  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06   94  	void __iomem *lut0_base = regs + DISP_GAMMA_LUT;
031e227047d331 AngeloGioacchino Del Regno 2023-05-06   95  	void __iomem *lut1_base = regs + DISP_GAMMA_LUT1;
031e227047d331 AngeloGioacchino Del Regno 2023-05-06   96  	u32 cfg_val, data_mode, lbank_val, word[2];
031e227047d331 AngeloGioacchino Del Regno 2023-05-06   97  	int cur_bank, num_lut_banks;
031e227047d331 AngeloGioacchino Del Regno 2023-05-06   98  	u16 lut_bank_size, lut_size;
69a4237ab1d13a Yongqiang Niu              2021-01-29   99  	struct drm_color_lut *lut;
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  100  	unsigned int i;
1742ba6ffde5bf Jason-JH.Lin               2023-05-06  101  	bool lut_diff;
65317f18a92ae2 AngeloGioacchino Del Regno 2023-05-06  102  	u8 lut_bits;
69a4237ab1d13a Yongqiang Niu              2021-01-29  103  
84e76624781487 AngeloGioacchino Del Regno 2023-05-06  104  	/* If there's no gamma lut there's nothing to do here. */
84e76624781487 AngeloGioacchino Del Regno 2023-05-06  105  	if (!state->gamma_lut)
84e76624781487 AngeloGioacchino Del Regno 2023-05-06  106  		return;
84e76624781487 AngeloGioacchino Del Regno 2023-05-06  107  
5bf9eeb70be98e AngeloGioacchino Del Regno 2023-05-06  108  	if (gamma && gamma->data) {
1742ba6ffde5bf Jason-JH.Lin               2023-05-06  109  		lut_diff = gamma->data->lut_diff;
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  110  		lut_bank_size = gamma->data->lut_bank_size;
65317f18a92ae2 AngeloGioacchino Del Regno 2023-05-06  111  		lut_bits = gamma->data->lut_bits;
5bf9eeb70be98e AngeloGioacchino Del Regno 2023-05-06  112  		lut_size = gamma->data->lut_size;
5bf9eeb70be98e AngeloGioacchino Del Regno 2023-05-06  113  	} else {
1742ba6ffde5bf Jason-JH.Lin               2023-05-06  114  		lut_diff = false;
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  115  		lut_bank_size = LUT_SIZE_DEFAULT;
65317f18a92ae2 AngeloGioacchino Del Regno 2023-05-06  116  		lut_bits = LUT_BITS_DEFAULT;
5bf9eeb70be98e AngeloGioacchino Del Regno 2023-05-06  117  		lut_size = LUT_SIZE_DEFAULT;
5bf9eeb70be98e AngeloGioacchino Del Regno 2023-05-06  118  	}
1742ba6ffde5bf Jason-JH.Lin               2023-05-06  119  
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  120  	if (lut_bank_size)
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  121  		num_lut_banks = lut_size / lut_bank_size;
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  122  	else
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  123  		num_lut_banks = 1;
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  124  
2938a8e41766c8 AngeloGioacchino Del Regno 2023-05-06  125  	cfg_val = readl(regs + DISP_GAMMA_CFG);
69a4237ab1d13a Yongqiang Niu              2021-01-29  126  	lut = (struct drm_color_lut *)state->gamma_lut->data;
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  127  
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  128  	/* Switch to 12 bits data mode if supported */
031e227047d331 AngeloGioacchino Del Regno 2023-05-06 @129  	data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(lut_bits == 12));
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  130  
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  131  	for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  132  
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  133  		/* Switch gamma bank and set data mode before writing LUT */
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  134  		if (num_lut_banks > 1) {
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  135  			lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  136  			lbank_val |= data_mode;
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  137  			writel(lbank_val, regs + DISP_GAMMA_BANK);
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  138  		}
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  139  
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  140  		for (i = 0; i < lut_bank_size; i++) {
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  141  			int n = (cur_bank * lut_bank_size) + i;
a933258d0ee5c4 AngeloGioacchino Del Regno 2023-05-06  142  			struct drm_color_lut diff, hwlut;
a933258d0ee5c4 AngeloGioacchino Del Regno 2023-05-06  143  
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  144  			hwlut.red = drm_color_lut_extract(lut[n].red, lut_bits);
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  145  			hwlut.green = drm_color_lut_extract(lut[n].green, lut_bits);
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  146  			hwlut.blue = drm_color_lut_extract(lut[n].blue, lut_bits);
a933258d0ee5c4 AngeloGioacchino Del Regno 2023-05-06  147  
ba99d08da6adec Yongqiang Niu              2022-04-28  148  			if (!lut_diff || (i % 2 == 0)) {
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  149  				if (lut_bits == 12) {
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  150  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, hwlut.red);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  151  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, hwlut.green);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  152  					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, hwlut.blue);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  153  				} else {
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  154  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  155  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  156  					word[1] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  157  				}
ba99d08da6adec Yongqiang Niu              2022-04-28  158  			} else {
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  159  				diff.red = lut[n].red - lut[n - 1].red;
65317f18a92ae2 AngeloGioacchino Del Regno 2023-05-06  160  				diff.red = drm_color_lut_extract(diff.red, lut_bits);
a933258d0ee5c4 AngeloGioacchino Del Regno 2023-05-06  161  
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  162  				diff.green = lut[n].green - lut[n - 1].green;
65317f18a92ae2 AngeloGioacchino Del Regno 2023-05-06  163  				diff.green = drm_color_lut_extract(diff.green, lut_bits);
a933258d0ee5c4 AngeloGioacchino Del Regno 2023-05-06  164  
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  165  				diff.blue = lut[n].blue - lut[n - 1].blue;
65317f18a92ae2 AngeloGioacchino Del Regno 2023-05-06  166  				diff.blue = drm_color_lut_extract(diff.blue, lut_bits);
ba99d08da6adec Yongqiang Niu              2022-04-28  167  
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  168  				if (lut_bits == 12) {
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  169  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, diff.red);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  170  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, diff.green);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  171  					word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, diff.blue);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  172  				} else {
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  173  					word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  174  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  175  					word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  176  				}
ba99d08da6adec Yongqiang Niu              2022-04-28  177  			}
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  178  			writel(word[0], (lut0_base + i * 4));
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  179  			if (lut_bits == 12)
031e227047d331 AngeloGioacchino Del Regno 2023-05-06  180  				writel(word[1], (lut1_base + i * 4));
69a4237ab1d13a Yongqiang Niu              2021-01-29  181  		}
506ce2462507c6 AngeloGioacchino Del Regno 2023-05-06  182  	}
2938a8e41766c8 AngeloGioacchino Del Regno 2023-05-06  183  
2938a8e41766c8 AngeloGioacchino Del Regno 2023-05-06  184  	/* Enable the gamma table */
0189c7cdfeb1a7 AngeloGioacchino Del Regno 2023-05-06  185  	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
2938a8e41766c8 AngeloGioacchino Del Regno 2023-05-06  186  
2938a8e41766c8 AngeloGioacchino Del Regno 2023-05-06  187  	writel(cfg_val, regs + DISP_GAMMA_CFG);
69a4237ab1d13a Yongqiang Niu              2021-01-29  188  }
69a4237ab1d13a Yongqiang Niu              2021-01-29  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
