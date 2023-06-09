Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC57C747F
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jun 2023 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686319578; x=1717855578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jdIbzAP40eigoXKRBRsxCnIPf5QFycmUbGE8yZm+u1M=;
  b=BIWyHTByVaT8zU5CVT015B/PjzkzG3yjNEwZMHfCC0WK3Eehy7wdz82R
   p23qgF4KNE9j3N/5Je7in0DmFSkxSVw1xXJmRG/SmbxZd0hTvWwV5mxhL
   ca81fL6yQEOOOG79Ult2W2B5LtoHU2OowG8hzx8b9+iCnS/Skp8kDOiDU
   oBKOLUItM8YoxhtYYeFHnvnTrN68Xexm0P61vSoVq4Yrmv4Rgzpo+KbWW
   ZOl4UkjEt5lyHzdlluHv0sAh4bNcAn+0BDex1qkVaTT9lBqIMOqSkF/C0
   4eFBbCuYD8ce7G+Pzb40vdhpKBBddXC7hdqGn8Vg2m/kzygl6nOlG2rLE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="443971916"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="443971916"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 07:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="1040497132"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; 
   d="scan'208";a="1040497132"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jun 2023 07:06:17 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7ckq-00095Y-1w;
	Fri, 09 Jun 2023 14:06:16 +0000
Date: Fri, 9 Jun 2023 22:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/9] regulator: mt6358: Add output voltage fine tuning to
 fixed regulators
Message-ID: <202306092132.nxtJGJhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230609083009.2822259-8-wenst@chromium.org>
References: <20230609083009.2822259-8-wenst@chromium.org>
TO: "Chen-Yu Tsai" <wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on next-20230609]
[cannot apply to robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/regulator-dt-bindings-mt6358-Merge-ldo_vcn33_-regulators/20230609-163555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20230609083009.2822259-8-wenst%40chromium.org
patch subject: [PATCH 7/9] regulator: mt6358: Add output voltage fine tuning to fixed regulators
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230609/202306092132.nxtJGJhx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add broonie-regulator https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
        git fetch broonie-regulator for-next
        git checkout broonie-regulator/for-next
        b4 shazam https://lore.kernel.org/r/20230609083009.2822259-8-wenst@chromium.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306092132.nxtJGJhx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/mt6358-regulator.c:127:29: error: 'MT6358_VFE28_ANA_CON0' undeclared here (not in a function); did you mean 'MT6358_VIO28_ANA_CON0'?
     127 |                 .vsel_reg = MT6358_##vreg##_ANA_CON0,   \
         |                             ^~~~~~~
   drivers/regulator/mt6358-regulator.c:525:9: note: in expansion of macro 'MT6358_REG_FIXED'
     525 |         MT6358_REG_FIXED("ldo_vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:127:29: error: 'MT6358_VCN28_ANA_CON0' undeclared here (not in a function); did you mean 'MT6358_VCN18_ANA_CON0'?
     127 |                 .vsel_reg = MT6358_##vreg##_ANA_CON0,   \
         |                             ^~~~~~~
   drivers/regulator/mt6358-regulator.c:526:9: note: in expansion of macro 'MT6358_REG_FIXED'
     526 |         MT6358_REG_FIXED("ldo_vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:127:29: error: 'MT6358_VXO22_ANA_CON0' undeclared here (not in a function); did you mean 'MT6358_VIO28_ANA_CON0'?
     127 |                 .vsel_reg = MT6358_##vreg##_ANA_CON0,   \
         |                             ^~~~~~~
   drivers/regulator/mt6358-regulator.c:527:9: note: in expansion of macro 'MT6358_REG_FIXED'
     527 |         MT6358_REG_FIXED("ldo_vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:127:29: error: 'MT6358_VAUX18_ANA_CON0' undeclared here (not in a function); did you mean 'MT6358_VRF18_ANA_CON0'?
     127 |                 .vsel_reg = MT6358_##vreg##_ANA_CON0,   \
         |                             ^~~~~~~
   drivers/regulator/mt6358-regulator.c:528:9: note: in expansion of macro 'MT6358_REG_FIXED'
     528 |         MT6358_REG_FIXED("ldo_vaux18", VAUX18,
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:127:29: error: 'MT6358_VBIF28_ANA_CON0' undeclared here (not in a function); did you mean 'MT6358_VIO28_ANA_CON0'?
     127 |                 .vsel_reg = MT6358_##vreg##_ANA_CON0,   \
         |                             ^~~~~~~
   drivers/regulator/mt6358-regulator.c:530:9: note: in expansion of macro 'MT6358_REG_FIXED'
     530 |         MT6358_REG_FIXED("ldo_vbif28", VBIF28,
         |         ^~~~~~~~~~~~~~~~
>> drivers/regulator/mt6358-regulator.c:127:29: error: 'MT6358_VAUD28_ANA_CON0' undeclared here (not in a function); did you mean 'MT6358_VA12_ANA_CON0'?
     127 |                 .vsel_reg = MT6358_##vreg##_ANA_CON0,   \
         |                             ^~~~~~~
   drivers/regulator/mt6358-regulator.c:535:9: note: in expansion of macro 'MT6358_REG_FIXED'
     535 |         MT6358_REG_FIXED("ldo_vaud28", VAUD28,
         |         ^~~~~~~~~~~~~~~~


vim +127 drivers/regulator/mt6358-regulator.c

f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  115  
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  116  #define MT6358_REG_FIXED(match, vreg,	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  117  	enreg, enbit, volt)	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  118  [MT6358_ID_##vreg] = {	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  119  	.desc = {	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  120  		.name = #vreg,	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  121  		.of_match = of_match_ptr(match),	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  122  		.ops = &mt6358_volt_fixed_ops,	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  123  		.type = REGULATOR_VOLTAGE,	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  124  		.id = MT6358_ID_##vreg,	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  125  		.owner = THIS_MODULE,	\
e32aae69f8a27f Chen-Yu Tsai     2023-06-09  126  		.n_voltages = 11,	\
e32aae69f8a27f Chen-Yu Tsai     2023-06-09 @127  		.vsel_reg = MT6358_##vreg##_ANA_CON0,	\
e32aae69f8a27f Chen-Yu Tsai     2023-06-09  128  		.vsel_mask = GENMASK(3, 0),	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  129  		.enable_reg = enreg,	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  130  		.enable_mask = BIT(enbit),	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  131  		.min_uV = volt,	\
e32aae69f8a27f Chen-Yu Tsai     2023-06-09  132  		.uV_step = 10000, \
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  133  	},	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  134  	.status_reg = MT6358_LDO_##vreg##_CON1,	\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  135  	.qi = BIT(15),							\
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  136  }
f67ff1bd58f0c1 Hsin-Hsiung Wang 2019-08-23  137  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
