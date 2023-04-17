Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D110E3
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Apr 2023 03:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681700434; x=1713236434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7UF2ej9W/N6kpmyfX0IIsxbbrhjTY4b2vcTKoEvKjZQ=;
  b=NB+7ZHz5MD+1m6nhsVwvf3fUN0FSPmlWRHp0JoTQoDMYShmvw/Y1muGv
   PsrdtcAiryQ6nvh5PT98FkjeJ/FwNxR2JjaDxSNInTNidn7unh62XXD8A
   CuGBYnK3cZ1ka8pw9YiWcmayM1z9lCHamJGG0RFezEN+KmEEHOgyQqA7X
   cJ1G+lnEAlMr5boEqkhWtfhEkEFYZpyqr6Zn3JOStpODjdAkTgKtfUOZX
   YyITtB2D3xp88jkywca9oHtz3Vqn/39v7WeoXgYR67cP9PzCqFpyg/mxW
   b7aQQMSao89QfuuwYwSzGUEZoHruHuVdU3gF7AeXxwgoxgOnE8nRGlByx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="342283018"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="342283018"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 20:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="667958994"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="667958994"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Apr 2023 20:00:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poF6U-000c5f-1F;
	Mon, 17 Apr 2023 03:00:30 +0000
Date: Mon, 17 Apr 2023 11:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v14 07/15] phy: fsl: Add Lynx 10G SerDes driver
Message-ID: <202304171052.mZB65hpd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/freescale/phy-fsl-lynx-10g.c:723:17: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230413160607.4128315-8-sean.anderson@seco.com>
References: <20230413160607.4128315-8-sean.anderson@seco.com>
TO: Sean Anderson <sean.anderson@seco.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: linux-phy@lists.infradead.org
CC: Madalin Bucur <madalin.bucur@nxp.com>
CC: linux-arm-kernel@lists.infradead.org
CC: Camelia Alexandra Groza <camelia.groza@nxp.com>
CC: devicetree@vger.kernel.org
CC: Rob Herring <robh+dt@kernel.org>
CC: linuxppc-dev@lists.ozlabs.org
CC: Bagas Sanjaya <bagasdotme@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Ioana Ciornei <ioana.ciornei@nxp.com>
CC: Sean Anderson <sean.anderson@seco.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on lee-mfd/for-mfd-next brgl/gpio/for-next linus/master lee-mfd/for-mfd-fixes v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-phy-Add-2500BASE-X-and-10GBASE-R/20230414-001141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230413160607.4128315-8-sean.anderson%40seco.com
patch subject: [PATCH v14 07/15] phy: fsl: Add Lynx 10G SerDes driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: ia64-randconfig-s043-20230417 (https://download.01.org/0day-ci/archive/20230417/202304171052.mZB65hpd-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/4122719423b4ea24c7f919cbdd7e405d0a8c4dfb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Anderson/dt-bindings-phy-Add-2500BASE-X-and-10GBASE-R/20230414-001141
        git checkout 4122719423b4ea24c7f919cbdd7e405d0a8c4dfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/phy/freescale/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304171052.mZB65hpd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/freescale/phy-fsl-lynx-10g.c:723:17: sparse: sparse: dubious: x & !y
   drivers/phy/freescale/phy-fsl-lynx-10g.c:724:17: sparse: sparse: dubious: x & !y

vim +723 drivers/phy/freescale/phy-fsl-lynx-10g.c

4122719423b4ea Sean Anderson 2023-04-13  622  
4122719423b4ea Sean Anderson 2023-04-13  623  static int lynx_set_mode(struct phy *phy, enum phy_mode phy_mode, int submode)
4122719423b4ea Sean Anderson 2023-04-13  624  {
4122719423b4ea Sean Anderson 2023-04-13  625  	enum lynx_protocol proto;
4122719423b4ea Sean Anderson 2023-04-13  626  	const struct lynx_proto_params *params;
4122719423b4ea Sean Anderson 2023-04-13  627  	const struct lynx_mode *old_mode = NULL, *new_mode;
4122719423b4ea Sean Anderson 2023-04-13  628  	int i, pll, ret;
4122719423b4ea Sean Anderson 2023-04-13  629  	struct lynx_group *group = phy_get_drvdata(phy);
4122719423b4ea Sean Anderson 2023-04-13  630  	struct lynx_priv *serdes = group->serdes;
4122719423b4ea Sean Anderson 2023-04-13  631  	u32 tmp, teq;
4122719423b4ea Sean Anderson 2023-04-13  632  	u32 gcr0 = 0, gcr1 = 0, recr0 = 0, tecr0 = 0;
4122719423b4ea Sean Anderson 2023-04-13  633  	u32 gcr0_mask = 0, gcr1_mask = 0, recr0_mask = 0, tecr0_mask = 0;
4122719423b4ea Sean Anderson 2023-04-13  634  
4122719423b4ea Sean Anderson 2023-04-13  635  	proto = lynx_lookup_proto(phy_mode, submode);
4122719423b4ea Sean Anderson 2023-04-13  636  	if (proto == LYNX_PROTO_NONE) {
4122719423b4ea Sean Anderson 2023-04-13  637  		dev_dbg(&phy->dev, "unknown mode/submode %d/%d\n",
4122719423b4ea Sean Anderson 2023-04-13  638  			phy_mode, submode);
4122719423b4ea Sean Anderson 2023-04-13  639  		return -EINVAL;
4122719423b4ea Sean Anderson 2023-04-13  640  	}
4122719423b4ea Sean Anderson 2023-04-13  641  
4122719423b4ea Sean Anderson 2023-04-13  642  	/* Nothing to do */
4122719423b4ea Sean Anderson 2023-04-13  643  	if (proto == group->proto)
4122719423b4ea Sean Anderson 2023-04-13  644  		return 0;
4122719423b4ea Sean Anderson 2023-04-13  645  
4122719423b4ea Sean Anderson 2023-04-13  646  	new_mode = lynx_lookup_mode(group, proto);
4122719423b4ea Sean Anderson 2023-04-13  647  	if (!new_mode) {
4122719423b4ea Sean Anderson 2023-04-13  648  		dev_dbg(&phy->dev, "could not find mode for %s on lanes %u to %u\n",
4122719423b4ea Sean Anderson 2023-04-13  649  			lynx_proto_str[proto], group->first_lane,
4122719423b4ea Sean Anderson 2023-04-13  650  			group->last_lane);
4122719423b4ea Sean Anderson 2023-04-13  651  		return -EINVAL;
4122719423b4ea Sean Anderson 2023-04-13  652  	}
4122719423b4ea Sean Anderson 2023-04-13  653  
4122719423b4ea Sean Anderson 2023-04-13  654  	if (group->proto != LYNX_PROTO_NONE) {
4122719423b4ea Sean Anderson 2023-04-13  655  		old_mode = lynx_lookup_mode(group, group->proto);
4122719423b4ea Sean Anderson 2023-04-13  656  		if (!old_mode) {
4122719423b4ea Sean Anderson 2023-04-13  657  			dev_err(&phy->dev, "could not find mode for %s\n",
4122719423b4ea Sean Anderson 2023-04-13  658  				lynx_proto_str[group->proto]);
4122719423b4ea Sean Anderson 2023-04-13  659  			return -EBUSY;
4122719423b4ea Sean Anderson 2023-04-13  660  		}
4122719423b4ea Sean Anderson 2023-04-13  661  	}
4122719423b4ea Sean Anderson 2023-04-13  662  
4122719423b4ea Sean Anderson 2023-04-13  663  	mutex_lock(&serdes->lock);
4122719423b4ea Sean Anderson 2023-04-13  664  	if (serdes->cfg->mode_conflict(serdes, new_mode)) {
4122719423b4ea Sean Anderson 2023-04-13  665  		dev_dbg(&phy->dev, "%s%c already in use\n",
4122719423b4ea Sean Anderson 2023-04-13  666  			lynx_proto_str[__ffs(new_mode->protos)],
4122719423b4ea Sean Anderson 2023-04-13  667  			'A' + new_mode->idx);
4122719423b4ea Sean Anderson 2023-04-13  668  		ret = -EBUSY;
4122719423b4ea Sean Anderson 2023-04-13  669  		goto out;
4122719423b4ea Sean Anderson 2023-04-13  670  	}
4122719423b4ea Sean Anderson 2023-04-13  671  
4122719423b4ea Sean Anderson 2023-04-13  672  	clk_disable_unprepare(group->ex_dly);
4122719423b4ea Sean Anderson 2023-04-13  673  	group->ex_dly = NULL;
4122719423b4ea Sean Anderson 2023-04-13  674  
4122719423b4ea Sean Anderson 2023-04-13  675  	clk_disable_unprepare(group->pll);
4122719423b4ea Sean Anderson 2023-04-13  676  	clk_rate_exclusive_put(group->pll);
4122719423b4ea Sean Anderson 2023-04-13  677  	group->pll = NULL;
4122719423b4ea Sean Anderson 2023-04-13  678  
4122719423b4ea Sean Anderson 2023-04-13  679  	/* First, try to use a PLL which already has the correct rate */
4122719423b4ea Sean Anderson 2023-04-13  680  	params = &lynx_proto_params[proto];
4122719423b4ea Sean Anderson 2023-04-13  681  	for (pll = 0; pll < ARRAY_SIZE(serdes->plls); pll++) {
4122719423b4ea Sean Anderson 2023-04-13  682  		struct clk *clk = serdes->plls[pll];
4122719423b4ea Sean Anderson 2023-04-13  683  		unsigned long rate = clk_get_rate(clk);
4122719423b4ea Sean Anderson 2023-04-13  684  		unsigned long error = abs_diff(rate, params->frate_khz);
4122719423b4ea Sean Anderson 2023-04-13  685  
4122719423b4ea Sean Anderson 2023-04-13  686  		dev_dbg(&phy->dev, "pll%d has rate %lu (error=%lu)\n", pll,
4122719423b4ea Sean Anderson 2023-04-13  687  			rate, error);
4122719423b4ea Sean Anderson 2023-04-13  688  		/* Accept up to 100ppm deviation */
4122719423b4ea Sean Anderson 2023-04-13  689  		if (error && params->frate_khz / error < 10000)
4122719423b4ea Sean Anderson 2023-04-13  690  			continue;
4122719423b4ea Sean Anderson 2023-04-13  691  
4122719423b4ea Sean Anderson 2023-04-13  692  		if (!clk_set_rate_exclusive(clk, rate))
4122719423b4ea Sean Anderson 2023-04-13  693  			goto got_pll;
4122719423b4ea Sean Anderson 2023-04-13  694  		/*
4122719423b4ea Sean Anderson 2023-04-13  695  		 * Someone else got a different rate first (or there was some
4122719423b4ea Sean Anderson 2023-04-13  696  		 * other error)
4122719423b4ea Sean Anderson 2023-04-13  697  		 */
4122719423b4ea Sean Anderson 2023-04-13  698  	}
4122719423b4ea Sean Anderson 2023-04-13  699  
4122719423b4ea Sean Anderson 2023-04-13  700  	/* If neither PLL has the right rate, try setting it */
4122719423b4ea Sean Anderson 2023-04-13  701  	for (pll = 0; pll < 2; pll++) {
4122719423b4ea Sean Anderson 2023-04-13  702  		ret = clk_set_rate_exclusive(serdes->plls[pll],
4122719423b4ea Sean Anderson 2023-04-13  703  					     params->frate_khz);
4122719423b4ea Sean Anderson 2023-04-13  704  		if (!ret)
4122719423b4ea Sean Anderson 2023-04-13  705  			goto got_pll;
4122719423b4ea Sean Anderson 2023-04-13  706  	}
4122719423b4ea Sean Anderson 2023-04-13  707  
4122719423b4ea Sean Anderson 2023-04-13  708  	dev_dbg(&phy->dev, "could not get a pll at %ukHz\n",
4122719423b4ea Sean Anderson 2023-04-13  709  		params->frate_khz);
4122719423b4ea Sean Anderson 2023-04-13  710  	goto out;
4122719423b4ea Sean Anderson 2023-04-13  711  
4122719423b4ea Sean Anderson 2023-04-13  712  got_pll:
4122719423b4ea Sean Anderson 2023-04-13  713  	group->pll = serdes->plls[pll];
4122719423b4ea Sean Anderson 2023-04-13  714  	ret = clk_prepare_enable(group->pll);
4122719423b4ea Sean Anderson 2023-04-13  715  	if (ret)
4122719423b4ea Sean Anderson 2023-04-13  716  		goto out;
4122719423b4ea Sean Anderson 2023-04-13  717  
4122719423b4ea Sean Anderson 2023-04-13  718  	gcr0_mask |= LNmGCR0_RRAT_SEL | LNmGCR0_TRAT_SEL;
4122719423b4ea Sean Anderson 2023-04-13  719  	gcr0_mask |= LNmGCR0_RPLL_LES | LNmGCR0_TPLL_LES;
4122719423b4ea Sean Anderson 2023-04-13  720  	gcr0_mask |= LNmGCR0_RRST_B | LNmGCR0_TRST_B;
4122719423b4ea Sean Anderson 2023-04-13  721  	gcr0_mask |= LNmGCR0_RX_PD | LNmGCR0_TX_PD;
4122719423b4ea Sean Anderson 2023-04-13  722  	gcr0_mask |= LNmGCR0_IF20BIT_EN | LNmGCR0_PROTS;
4122719423b4ea Sean Anderson 2023-04-13 @723  	gcr0 |= FIELD_PREP(LNmGCR0_RPLL_LES, !pll);
4122719423b4ea Sean Anderson 2023-04-13  724  	gcr0 |= FIELD_PREP(LNmGCR0_TPLL_LES, !pll);
4122719423b4ea Sean Anderson 2023-04-13  725  	gcr0 |= FIELD_PREP(LNmGCR0_RRAT_SEL, params->rat_sel);
4122719423b4ea Sean Anderson 2023-04-13  726  	gcr0 |= FIELD_PREP(LNmGCR0_TRAT_SEL, params->rat_sel);
4122719423b4ea Sean Anderson 2023-04-13  727  	gcr0 |= FIELD_PREP(LNmGCR0_IF20BIT_EN, params->if20bit);
4122719423b4ea Sean Anderson 2023-04-13  728  	gcr0 |= FIELD_PREP(LNmGCR0_PROTS, params->prots);
4122719423b4ea Sean Anderson 2023-04-13  729  
4122719423b4ea Sean Anderson 2023-04-13  730  	gcr1_mask |= LNmGCR1_RDAT_INV | LNmGCR1_TDAT_INV;
4122719423b4ea Sean Anderson 2023-04-13  731  	gcr1_mask |= LNmGCR1_OPAD_CTL | LNmGCR1_REIDL_TH;
4122719423b4ea Sean Anderson 2023-04-13  732  	gcr1_mask |= LNmGCR1_REIDL_EX_SEL | LNmGCR1_REIDL_ET_SEL;
4122719423b4ea Sean Anderson 2023-04-13  733  	gcr1_mask |= LNmGCR1_REIDL_EX_MSB | LNmGCR1_REIDL_ET_MSB;
4122719423b4ea Sean Anderson 2023-04-13  734  	gcr1_mask |= LNmGCR1_REQ_CTL_SNP | LNmGCR1_REQ_CDR_SNP;
4122719423b4ea Sean Anderson 2023-04-13  735  	gcr1_mask |= LNmGCR1_TRSTDIR | LNmGCR1_REQ_BIN_SNP;
4122719423b4ea Sean Anderson 2023-04-13  736  	gcr1_mask |= LNmGCR1_ISLEW_RCTL | LNmGCR1_OSLEW_RCTL;
4122719423b4ea Sean Anderson 2023-04-13  737  	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_TH, params->reidl_th);
4122719423b4ea Sean Anderson 2023-04-13  738  	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_EX_SEL, params->reidl_ex & 3);
4122719423b4ea Sean Anderson 2023-04-13  739  	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_ET_SEL, params->reidl_et & 3);
4122719423b4ea Sean Anderson 2023-04-13  740  	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_EX_MSB, params->reidl_ex >> 2);
4122719423b4ea Sean Anderson 2023-04-13  741  	gcr1 |= FIELD_PREP(LNmGCR1_REIDL_ET_MSB, params->reidl_et >> 2);
4122719423b4ea Sean Anderson 2023-04-13  742  	gcr1 |= FIELD_PREP(LNmGCR1_TRSTDIR,
4122719423b4ea Sean Anderson 2023-04-13  743  			   group->first_lane > group->last_lane);
4122719423b4ea Sean Anderson 2023-04-13  744  	gcr1 |= FIELD_PREP(LNmGCR1_ISLEW_RCTL, params->slew);
4122719423b4ea Sean Anderson 2023-04-13  745  	gcr1 |= FIELD_PREP(LNmGCR1_OSLEW_RCTL, params->slew);
4122719423b4ea Sean Anderson 2023-04-13  746  
4122719423b4ea Sean Anderson 2023-04-13  747  	recr0_mask |= LNmRECR0_RXEQ_BST | LNmRECR0_BASE_WAND;
4122719423b4ea Sean Anderson 2023-04-13  748  	recr0_mask |= LNmRECR0_GK2OVD | LNmRECR0_GK3OVD;
4122719423b4ea Sean Anderson 2023-04-13  749  	recr0_mask |= LNmRECR0_GK2OVD_EN | LNmRECR0_GK3OVD_EN;
4122719423b4ea Sean Anderson 2023-04-13  750  	recr0_mask |= LNmRECR0_OSETOVD_EN | LNmRECR0_OSETOVD;
4122719423b4ea Sean Anderson 2023-04-13  751  	if (params->gain) {
4122719423b4ea Sean Anderson 2023-04-13  752  		recr0 |= FIELD_PREP(LNmRECR0_GK2OVD, params->gain);
4122719423b4ea Sean Anderson 2023-04-13  753  		recr0 |= FIELD_PREP(LNmRECR0_GK3OVD, params->gain);
4122719423b4ea Sean Anderson 2023-04-13  754  		recr0 |= LNmRECR0_GK2OVD_EN | LNmRECR0_GK3OVD_EN;
4122719423b4ea Sean Anderson 2023-04-13  755  	}
4122719423b4ea Sean Anderson 2023-04-13  756  	recr0 |= FIELD_PREP(LNmRECR0_BASE_WAND, params->baseline_wander);
4122719423b4ea Sean Anderson 2023-04-13  757  	recr0 |= FIELD_PREP(LNmRECR0_OSETOVD, params->offset_override);
4122719423b4ea Sean Anderson 2023-04-13  758  
4122719423b4ea Sean Anderson 2023-04-13  759  	tecr0_mask |= LNmTECR0_TEQ_TYPE;
4122719423b4ea Sean Anderson 2023-04-13  760  	tecr0_mask |= LNmTECR0_SGN_PREQ | LNmTECR0_RATIO_PREQ;
4122719423b4ea Sean Anderson 2023-04-13  761  	tecr0_mask |= LNmTECR0_SGN_POST1Q | LNmTECR0_RATIO_PST1Q;
4122719423b4ea Sean Anderson 2023-04-13  762  	tecr0_mask |= LNmTECR0_ADPT_EQ | LNmTECR0_AMP_RED;
4122719423b4ea Sean Anderson 2023-04-13  763  	teq = LNmTECR0_TEQ_TYPE_NONE;
4122719423b4ea Sean Anderson 2023-04-13  764  	if (params->postq_ratio) {
4122719423b4ea Sean Anderson 2023-04-13  765  		teq = LNmTECR0_TEQ_TYPE_POST;
4122719423b4ea Sean Anderson 2023-04-13  766  		tecr0 |= FIELD_PREP(LNmTECR0_SGN_POST1Q, 1);
4122719423b4ea Sean Anderson 2023-04-13  767  		tecr0 |= FIELD_PREP(LNmTECR0_RATIO_PST1Q, params->postq_ratio);
4122719423b4ea Sean Anderson 2023-04-13  768  	}
4122719423b4ea Sean Anderson 2023-04-13  769  	if (params->preq_ratio) {
4122719423b4ea Sean Anderson 2023-04-13  770  		teq = LNmTECR0_TEQ_TYPE_BOTH;
4122719423b4ea Sean Anderson 2023-04-13  771  		tecr0 |= FIELD_PREP(LNmTECR0_SGN_PREQ, 1);
4122719423b4ea Sean Anderson 2023-04-13  772  		tecr0 |= FIELD_PREP(LNmTECR0_RATIO_PREQ, params->preq_ratio);
4122719423b4ea Sean Anderson 2023-04-13  773  	}
4122719423b4ea Sean Anderson 2023-04-13  774  	tecr0 |= FIELD_PREP(LNmTECR0_TEQ_TYPE, teq);
4122719423b4ea Sean Anderson 2023-04-13  775  	tecr0 |= FIELD_PREP(LNmTECR0_ADPT_EQ, params->adpt_eq);
4122719423b4ea Sean Anderson 2023-04-13  776  	tecr0 |= FIELD_PREP(LNmTECR0_AMP_RED, params->amp_red);
4122719423b4ea Sean Anderson 2023-04-13  777  
4122719423b4ea Sean Anderson 2023-04-13  778  	for_each_lane(i, group) {
4122719423b4ea Sean Anderson 2023-04-13  779  		tmp = lynx_read(serdes, LNmGCR0(i));
4122719423b4ea Sean Anderson 2023-04-13  780  		tmp &= ~(LNmGCR0_RRST_B | LNmGCR0_TRST_B);
4122719423b4ea Sean Anderson 2023-04-13  781  		lynx_write(serdes, tmp, LNmGCR0(i));
4122719423b4ea Sean Anderson 2023-04-13  782  	}
4122719423b4ea Sean Anderson 2023-04-13  783  
4122719423b4ea Sean Anderson 2023-04-13  784  	ndelay(50);
4122719423b4ea Sean Anderson 2023-04-13  785  
4122719423b4ea Sean Anderson 2023-04-13  786  	/* Disable the old controller */
4122719423b4ea Sean Anderson 2023-04-13  787  	if (old_mode)
4122719423b4ea Sean Anderson 2023-04-13  788  		serdes->cfg->mode_apply(serdes, old_mode, LYNX_PROTO_NONE);
4122719423b4ea Sean Anderson 2023-04-13  789  
4122719423b4ea Sean Anderson 2023-04-13  790  	for_each_lane(i, group) {
4122719423b4ea Sean Anderson 2023-04-13  791  		tmp = lynx_read(serdes, LNmGCR0(i));
4122719423b4ea Sean Anderson 2023-04-13  792  		tmp &= ~gcr0_mask;
4122719423b4ea Sean Anderson 2023-04-13  793  		tmp |= gcr0;
4122719423b4ea Sean Anderson 2023-04-13  794  		tmp |= FIELD_PREP(LNmGCR0_FIRST_LANE, i == group->first_lane);
4122719423b4ea Sean Anderson 2023-04-13  795  		lynx_write(serdes, tmp, LNmGCR0(i));
4122719423b4ea Sean Anderson 2023-04-13  796  
4122719423b4ea Sean Anderson 2023-04-13  797  		tmp = lynx_read(serdes, LNmGCR1(i));
4122719423b4ea Sean Anderson 2023-04-13  798  		tmp &= ~gcr1_mask;
4122719423b4ea Sean Anderson 2023-04-13  799  		tmp |= gcr1;
4122719423b4ea Sean Anderson 2023-04-13  800  		lynx_write(serdes, tmp, LNmGCR1(i));
4122719423b4ea Sean Anderson 2023-04-13  801  
4122719423b4ea Sean Anderson 2023-04-13  802  		tmp = lynx_read(serdes, LNmRECR0(i));
4122719423b4ea Sean Anderson 2023-04-13  803  		tmp &= ~recr0_mask;
4122719423b4ea Sean Anderson 2023-04-13  804  		tmp |= recr0;
4122719423b4ea Sean Anderson 2023-04-13  805  		lynx_write(serdes, tmp, LNmRECR0(i));
4122719423b4ea Sean Anderson 2023-04-13  806  
4122719423b4ea Sean Anderson 2023-04-13  807  		tmp = lynx_read(serdes, LNmTECR0(i));
4122719423b4ea Sean Anderson 2023-04-13  808  		tmp &= ~tecr0_mask;
4122719423b4ea Sean Anderson 2023-04-13  809  		tmp |= tecr0;
4122719423b4ea Sean Anderson 2023-04-13  810  		lynx_write(serdes, tmp, LNmTECR0(i));
4122719423b4ea Sean Anderson 2023-04-13  811  
4122719423b4ea Sean Anderson 2023-04-13  812  		tmp = lynx_read(serdes, LNmTTLCR0(i));
4122719423b4ea Sean Anderson 2023-04-13  813  		tmp &= ~LNmTTLCR0_FLT_SEL;
4122719423b4ea Sean Anderson 2023-04-13  814  		tmp |= FIELD_PREP(LNmTTLCR0_FLT_SEL, params->flt_sel);
4122719423b4ea Sean Anderson 2023-04-13  815  		lynx_write(serdes, tmp, LNmTTLCR0(i));
4122719423b4ea Sean Anderson 2023-04-13  816  	}
4122719423b4ea Sean Anderson 2023-04-13  817  
4122719423b4ea Sean Anderson 2023-04-13  818  	ndelay(120);
4122719423b4ea Sean Anderson 2023-04-13  819  
4122719423b4ea Sean Anderson 2023-04-13  820  	for_each_lane_reverse(i, group) {
4122719423b4ea Sean Anderson 2023-04-13  821  		tmp = lynx_read(serdes, LNmGCR0(i));
4122719423b4ea Sean Anderson 2023-04-13  822  		tmp |= LNmGCR0_RRST_B | LNmGCR0_TRST_B;
4122719423b4ea Sean Anderson 2023-04-13  823  		lynx_write(serdes, tmp, LNmGCR0(i));
4122719423b4ea Sean Anderson 2023-04-13  824  	}
4122719423b4ea Sean Anderson 2023-04-13  825  
4122719423b4ea Sean Anderson 2023-04-13  826  	/* Enable the new controller */
4122719423b4ea Sean Anderson 2023-04-13  827  	serdes->cfg->mode_apply(serdes, new_mode, proto);
4122719423b4ea Sean Anderson 2023-04-13  828  	if (proto == LYNX_PROTO_1000BASEKX) {
4122719423b4ea Sean Anderson 2023-04-13  829  		group->ex_dly = serdes->ex_dlys[pll];
4122719423b4ea Sean Anderson 2023-04-13  830  		/* This should never fail since it's from our internal driver */
4122719423b4ea Sean Anderson 2023-04-13  831  		WARN_ON_ONCE(clk_prepare_enable(group->ex_dly));
4122719423b4ea Sean Anderson 2023-04-13  832  	}
4122719423b4ea Sean Anderson 2023-04-13  833  	group->proto = proto;
4122719423b4ea Sean Anderson 2023-04-13  834  
4122719423b4ea Sean Anderson 2023-04-13  835  	dev_dbg(&phy->dev, "set mode to %s on lanes %u to %u\n",
4122719423b4ea Sean Anderson 2023-04-13  836  		lynx_proto_str[proto], group->first_lane, group->last_lane);
4122719423b4ea Sean Anderson 2023-04-13  837  
4122719423b4ea Sean Anderson 2023-04-13  838  out:
4122719423b4ea Sean Anderson 2023-04-13  839  	mutex_unlock(&serdes->lock);
4122719423b4ea Sean Anderson 2023-04-13  840  	return ret;
4122719423b4ea Sean Anderson 2023-04-13  841  }
4122719423b4ea Sean Anderson 2023-04-13  842  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
