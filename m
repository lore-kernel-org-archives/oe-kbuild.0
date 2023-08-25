Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92184621
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Aug 2023 01:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692926821; x=1724462821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kxZM77m0xVCLcUWZUDnpiVL08VnOqVELqCdxZecyU1Q=;
  b=ZvT65k5pi+grC5RUNnvcejNWDwD7KMea1z4EjsdtoiAO7+Vu+MG/QtP6
   nNQT3qLFaJH8UoHR1s0IOYfSnijbBm8+T8X7sjGVuasvLDnFgwvBwWVVo
   aJ0EXbQOmiMU9H/342fggmuoS1nu2sFCrWf7f9JIG7WWT/u8VD6t0Wqwh
   lv1JmZ/K9/TPQAvUJzlsRhefh7YKQPPxDWPuxfrdS75yOllBJRDQJSgs6
   qIazVqYHKoD5wnyX401NckING8uBlT7mbuhtc8wPkNCOU0Sq2hh8DhjvH
   Sb7V+v5qSs5HI/ItDOVTUUxuGWftJyONBmGdzk1nS5Ut1fAlPExHRs1Cn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359600424"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359600424"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="1068053778"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1068053778"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2023 18:26:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZLbE-00036D-0v;
	Fri, 25 Aug 2023 01:26:56 +0000
Date: Fri, 25 Aug 2023 09:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC] scmi: pinctrl: support i.MX9
Message-ID: <202308250912.eGNoOKED-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230824070611.3335107-1-peng.fan@oss.nxp.com>
References: <20230824070611.3335107-1-peng.fan@oss.nxp.com>
TO: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>

Hi Peng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linusw-pinctrl/devel]
[also build test WARNING on linusw-pinctrl/for-next]
[cannot apply to linus/master v6.5-rc7 next-20230824]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/scmi-pinctrl-support-i-MX9/20230824-150323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230824070611.3335107-1-peng.fan%40oss.nxp.com
patch subject: [RFC] scmi: pinctrl: support i.MX9
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm-randconfig-001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250912.eGNoOKED-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250912.eGNoOKED-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308250912.eGNoOKED-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/freescale/pinctrl-imx.c:83:5: warning: no previous prototype for function 'imx_scmi_dt_node_to_map' [-Wmissing-prototypes]
      83 | int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
         |     ^
   drivers/pinctrl/freescale/pinctrl-imx.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      83 | int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
         | ^
         | static 
   1 warning generated.


vim +/imx_scmi_dt_node_to_map +83 drivers/pinctrl/freescale/pinctrl-imx.c

ae75ff81453840 drivers/pinctrl/pinctrl-imx.c           Dong Aisheng 2012-04-27   81  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   82  #define IMX_SCMI_NUM_CFG 4
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  @83  int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   84  			    struct pinctrl_map **map, unsigned *num_maps)
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   85  {
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   86  	struct pinctrl_map *new_map;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   87  	const __be32 *list;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   88  	unsigned long *configs = NULL;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   89  	unsigned long cfg[IMX_SCMI_NUM_CFG];
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   90  	int map_num, size, pin_size, pin_id, num_pins;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   91  	int mux_reg, conf_reg, input_reg, mux_val, conf_val, input_val;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   92  	int i, j;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   93  	uint32_t ncfg;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   94  	static uint32_t daisy_off;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   95  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   96  	if (!daisy_off) {
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   97  		if (of_machine_is_compatible("fsl,imx93"))
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   98  			daisy_off = 0x360;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24   99  		else if (of_machine_is_compatible("fsl,imx95"))
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  100  			daisy_off = 0x408;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  101  		else
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  102  			dev_err(pctldev->dev, "platform not support scmi pinctrl\n");
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  103  	}
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  104  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  105  	list = of_get_property(np, "fsl,pins", &size);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  106  	if (!list) {
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  107  		dev_err(pctldev->dev, "no fsl,pins property in node %pOF\n", np);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  108  		return -EINVAL;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  109  	}
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  110  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  111  	pin_size = FSL_PIN_SIZE;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  112  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  113  	if (!size || size % pin_size) {
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  114  		dev_err(pctldev->dev, "Invalid fsl,pins or pins property in node %pOF\n", np);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  115  		return -EINVAL;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  116  	}
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  117  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  118  	num_pins = size / pin_size;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  119  	map_num = num_pins;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  120  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  121  	new_map = kmalloc_array(map_num, sizeof(struct pinctrl_map),
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  122  				GFP_KERNEL);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  123  	if (!new_map)
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  124  		return -ENOMEM;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  125  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  126  	*map = new_map;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  127  	*num_maps = map_num;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  128  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  129  	/* create config map */
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  130  	for (i = 0; i < num_pins; i++) {
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  131  		j = 0;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  132  		ncfg = IMX_SCMI_NUM_CFG;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  133  		mux_reg = be32_to_cpu(*list++);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  134  		conf_reg = be32_to_cpu(*list++);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  135  		input_reg = be32_to_cpu(*list++);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  136  		mux_val = be32_to_cpu(*list++);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  137  		input_val = be32_to_cpu(*list++);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  138  		conf_val = be32_to_cpu(*list++);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  139  		if (conf_val & IMX_PAD_SION)
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  140  			mux_val |= IOMUXC_CONFIG_SION;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  141  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  142  		pin_id = mux_reg / 4;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  143  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  144  		cfg[j++] = pinconf_to_config_packed(IMX_PIN_TYPE_MUX, mux_val);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  145  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  146  		if (!conf_reg || (conf_val & IMX_NO_PAD_CTL)) {
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  147  			ncfg--;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  148  		} else {
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  149  			cfg[j++] = pinconf_to_config_packed(IMX_PIN_TYPE_CONFIG, conf_val);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  150  		}
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  151  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  152  		if (!input_reg) {
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  153  			ncfg -= 2;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  154  		} else {
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  155  			cfg[j++] = pinconf_to_config_packed(IMX_PIN_TYPE_DAISY_ID,
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  156  							    (input_reg - daisy_off) / 4);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  157  			cfg[j++] = pinconf_to_config_packed(IMX_PIN_TYPE_DAISY_CFG, input_val);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  158  		}
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  159  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  160  		configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  161  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  162  		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  163  		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, pin_id);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  164  		new_map[i].data.configs.configs = configs;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  165  		new_map[i].data.configs.num_configs = ncfg;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  166  	}
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  167  
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  168  	return 0;
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  169  }
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  170  EXPORT_SYMBOL_GPL(imx_scmi_dt_node_to_map);
1d613cbfa881b8 drivers/pinctrl/freescale/pinctrl-imx.c Peng Fan     2023-08-24  171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
