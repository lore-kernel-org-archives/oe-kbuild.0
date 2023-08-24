Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE5BDDA9
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Aug 2023 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692869208; x=1724405208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/ihOsK0nVkbc5FgnQR3gDYmNqJH2N6u9Fyeb0/N4j4=;
  b=hcP2eNVXxr9YVmqGm1TFoxgI4eZP9D7oslM/Fq8boeLFGY3pZzA8NkOR
   bq3iSBgH7WWTw5WoK4ZEOcBiKWCpNt3qIVNvxU7CJm53h4k3cNO3E44Xi
   WmrU7E2ayqw9ga771nOY9vv8897HJBU8TkrDraS+zPgYMJXiWymgXitX1
   6pVbO4JWkS+aZStT92fnxyXJSM2eAfg5jPOMzykFsnv/4yIeipug5b0Nl
   zRdefZCkT/T8GhsLZ1DQgeMtm4loGhy0HFply/8GANnFYOcrT0tpN9CUa
   AhjTuCSAhn0B688Eyp2wMdm5t3kFMNJwDuVhc9H8fM8EkrdoLzjUonP03
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="377119959"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377119959"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="686803601"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="686803601"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Aug 2023 02:26:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ6bg-0001uU-36;
	Thu, 24 Aug 2023 09:26:31 +0000
Date: Thu, 24 Aug 2023 17:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC] scmi: pinctrl: support i.MX9
Message-ID: <202308241754.4zFwbyxp-lkp@intel.com>
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
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308241754.4zFwbyxp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241754.4zFwbyxp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308241754.4zFwbyxp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/pinctrl.c: In function 'scmi_pinctrl_config_get':
>> drivers/firmware/arm_scmi/pinctrl.c:308:13: warning: unused variable 'attributes' [-Wunused-variable]
     308 |         u32 attributes;
         |             ^~~~~~~~~~
--
>> drivers/pinctrl/freescale/pinctrl-imx.c:83:5: warning: no previous prototype for 'imx_scmi_dt_node_to_map' [-Wmissing-prototypes]
      83 | int imx_scmi_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/attributes +308 drivers/firmware/arm_scmi/pinctrl.c

3a61c44f60d18a Oleksii Moisieiev 2023-08-08  301  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  302  static int scmi_pinctrl_config_get(const struct scmi_protocol_handle *ph,
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  303  				   u32 selector,
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  304  				   enum scmi_pinctrl_selector_type type,
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  305  				   u8 config_type, unsigned long *config_value)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  306  {
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  307  	int ret;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08 @308  	u32 attributes;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  309  	struct scmi_xfer *t;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  310  	struct scmi_msg_conf_get *tx;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  311  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  312  	if (!config_value || type == FUNCTION_TYPE)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  313  		return -EINVAL;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  314  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  315  	ret = scmi_pinctrl_validate_id(ph, selector, type);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  316  	if (ret)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  317  		return ret;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  318  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  319  	ret = ph->xops->xfer_get_init(ph, PINCTRL_CONFIG_GET, sizeof(*tx), sizeof(__le32), &t);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  320  	if (ret)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  321  		return ret;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  322  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  323  	tx = t->tx.buf;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  324  	tx->identifier = cpu_to_le32(selector);
1d613cbfa881b8 Peng Fan          2023-08-24  325  	/*
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  326  	attributes = FIELD_PREP(REG_TYPE_BITS, type) |
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  327  		FIELD_PREP(REG_CONFIG, config_type);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  328  	tx->attributes = cpu_to_le32(attributes);
1d613cbfa881b8 Peng Fan          2023-08-24  329  	*/
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  330  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  331  	ret = ph->xops->do_xfer(ph, t);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  332  	if (!ret)
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  333  		*config_value = get_unaligned_le32(t->rx.buf);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  334  
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  335  	ph->xops->xfer_put(ph, t);
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  336  	return ret;
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  337  }
3a61c44f60d18a Oleksii Moisieiev 2023-08-08  338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
