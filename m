Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C6530FA5
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Woho4hun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700558118; x=1732094118;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZB3rLirHj7KqqmHovAgeg93o/ihwzChUpZIeuhXyTTo=;
  b=Woho4hunAA8qnOkURd89/csmLAXQqSZ88sny5IhXTggRHdi7czeP49hs
   RYqgK5Y/VA76dLOfc9e1PAX0HaHKVzh8s7quuhtUtVlmApbEKwM69g22d
   pVxmn56F3v++fsZ5ffxdebRlL/VZ2313litPmRWQ1EzK2CL4p9j7uI4Az
   y090QBARSlpxMyTVoBSIpjIAyUD4BmNB/qZ8FpONuAAmgdzylUeiLcdnN
   /MwBXTy9WmIEQMr3ScOzGCbFTiwbIdJOsZ0TMBsesa+s2ivXN2FtcOYZA
   Vp6eUlh/EjYBWkp1O8I0KlSCJ5JkSHNBGVufcnQYMHjGVuSZyCiu/Mr33
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422897971"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422897971"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 01:15:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="766581284"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="766581284"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 21 Nov 2023 01:15:13 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5MqO-0007de-1E;
	Tue, 21 Nov 2023 09:15:05 +0000
Date: Tue, 21 Nov 2023 17:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] usb: typec: tcpm: Parse Accessory Mode information
Message-ID: <202311211657.1TnRaESc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231120231757.2309482-3-dmitry.baryshkov@linaro.org>
References: <20231120231757.2309482-3-dmitry.baryshkov@linaro.org>
TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Hans de Goede <hdegoede@redhat.com>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
TO: Mark Gross <markgross@kernel.org>
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: platform-driver-x86@vger.kernel.org
CC: linux-usb@vger.kernel.org

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7-rc2]
[also build test WARNING on linus/master next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/dt-bindings-connector-usb-add-accessory-mode-description/20231121-072028
base:   v6.7-rc2
patch link:    https://lore.kernel.org/r/20231120231757.2309482-3-dmitry.baryshkov%40linaro.org
patch subject: [PATCH 2/2] usb: typec: tcpm: Parse Accessory Mode information
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-001-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211657.1TnRaESc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211657.1TnRaESc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311211657.1TnRaESc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tcpm/tcpm.c:6142:30: warning: variable 'mode' is uninitialized when used here [-Wuninitialized]
                   port->typec_caps.accessory[mode++] = TYPEC_ACCESSORY_AUDIO;
                                              ^~~~
   drivers/usb/typec/tcpm/tcpm.c:6122:10: note: initialize the variable 'mode' to silence this warning
           int mode;
                   ^
                    = 0
   1 warning generated.


vim +/mode +6142 drivers/usb/typec/tcpm/tcpm.c

8203d26905eee0 drivers/usb/typec/tcpm/tcpm.c Heikki Krogerus        2022-05-02  6116  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6117  static int tcpm_fw_get_caps(struct tcpm_port *port,
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6118  			    struct fwnode_handle *fwnode)
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6119  {
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6120  	const char *opmode_str;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6121  	int ret;
4ea5a7a3cc4709 drivers/usb/typec/tcpm/tcpm.c Dmitry Baryshkov       2023-11-21  6122  	int mode;
8dc4bd073663fa drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2020-10-07  6123  	u32 mw, frs_current;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6124  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6125  	if (!fwnode)
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6126  		return -EINVAL;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6127  
28ec344bb8911b drivers/usb/typec/tcpm/tcpm.c Saravana Kannan        2021-05-05  6128  	/*
28ec344bb8911b drivers/usb/typec/tcpm/tcpm.c Saravana Kannan        2021-05-05  6129  	 * This fwnode has a "compatible" property, but is never populated as a
28ec344bb8911b drivers/usb/typec/tcpm/tcpm.c Saravana Kannan        2021-05-05  6130  	 * struct device. Instead we simply parse it to read the properties.
28ec344bb8911b drivers/usb/typec/tcpm/tcpm.c Saravana Kannan        2021-05-05  6131  	 * This it breaks fw_devlink=on. To maintain backward compatibility
28ec344bb8911b drivers/usb/typec/tcpm/tcpm.c Saravana Kannan        2021-05-05  6132  	 * with existing DT files, we work around this by deleting any
28ec344bb8911b drivers/usb/typec/tcpm/tcpm.c Saravana Kannan        2021-05-05  6133  	 * fwnode_links to/from this fwnode.
28ec344bb8911b drivers/usb/typec/tcpm/tcpm.c Saravana Kannan        2021-05-05  6134  	 */
28ec344bb8911b drivers/usb/typec/tcpm/tcpm.c Saravana Kannan        2021-05-05  6135  	fw_devlink_purge_absent_suppliers(fwnode);
28ec344bb8911b drivers/usb/typec/tcpm/tcpm.c Saravana Kannan        2021-05-05  6136  
2e7dfb0e9cacad drivers/usb/typec/tcpm/tcpm.c Samuel Holland         2022-02-13  6137  	ret = typec_get_fw_cap(&port->typec_caps, fwnode);
7101949f36fc77 drivers/usb/typec/tcpm/tcpm.c Dan Carpenter          2019-10-01  6138  	if (ret < 0)
7101949f36fc77 drivers/usb/typec/tcpm/tcpm.c Dan Carpenter          2019-10-01  6139  		return ret;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6140  
4ea5a7a3cc4709 drivers/usb/typec/tcpm/tcpm.c Dmitry Baryshkov       2023-11-21  6141  	if (fwnode_property_read_bool(fwnode, "accessory-mode-audio"))
4ea5a7a3cc4709 drivers/usb/typec/tcpm/tcpm.c Dmitry Baryshkov       2023-11-21 @6142  		port->typec_caps.accessory[mode++] = TYPEC_ACCESSORY_AUDIO;
4ea5a7a3cc4709 drivers/usb/typec/tcpm/tcpm.c Dmitry Baryshkov       2023-11-21  6143  
4ea5a7a3cc4709 drivers/usb/typec/tcpm/tcpm.c Dmitry Baryshkov       2023-11-21  6144  	if (fwnode_property_read_bool(fwnode, "accessory-mode-debug"))
4ea5a7a3cc4709 drivers/usb/typec/tcpm/tcpm.c Dmitry Baryshkov       2023-11-21  6145  		port->typec_caps.accessory[mode++] = TYPEC_ACCESSORY_DEBUG;
4ea5a7a3cc4709 drivers/usb/typec/tcpm/tcpm.c Dmitry Baryshkov       2023-11-21  6146  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6147  	port->port_type = port->typec_caps.type;
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6148  	port->pd_supported = !fwnode_property_read_bool(fwnode, "pd-disable");
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6149  
1373fefc6243cc drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2021-04-13  6150  	port->slow_charger_loop = fwnode_property_read_bool(fwnode, "slow-charger-loop");
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6151  	if (port->port_type == TYPEC_PORT_SNK)
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6152  		goto sink;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6153  
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6154  	/* Get Source PDOs for the PD port or Source Rp value for the non-PD port */
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6155  	if (port->pd_supported) {
bc7514925cf50b drivers/usb/typec/tcpm/tcpm.c Andy Shevchenko        2019-07-23  6156  		ret = fwnode_property_count_u32(fwnode, "source-pdos");
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6157  		if (ret == 0)
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6158  			return -EINVAL;
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6159  		else if (ret < 0)
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6160  			return ret;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6161  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6162  		port->nr_src_pdo = min(ret, PDO_MAX_OBJECTS);
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6163  		ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6164  						     port->src_pdo, port->nr_src_pdo);
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6165  		if (ret)
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6166  			return ret;
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6167  		ret = tcpm_validate_caps(port, port->src_pdo, port->nr_src_pdo);
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6168  		if (ret)
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6169  			return ret;
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6170  	} else {
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6171  		ret = fwnode_property_read_string(fwnode, "typec-power-opmode", &opmode_str);
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6172  		if (ret)
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6173  			return ret;
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6174  		ret = typec_find_pwr_opmode(opmode_str);
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6175  		if (ret < 0)
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6176  			return ret;
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6177  		port->src_rp = tcpm_pwr_opmode_to_rp(ret);
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6178  	}
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6179  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6180  	if (port->port_type == TYPEC_PORT_SRC)
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6181  		return 0;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6182  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6183  sink:
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6184  	port->self_powered = fwnode_property_read_bool(fwnode, "self-powered");
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6185  
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6186  	if (!port->pd_supported)
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6187  		return 0;
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6188  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6189  	/* Get sink pdos */
bc7514925cf50b drivers/usb/typec/tcpm/tcpm.c Andy Shevchenko        2019-07-23  6190  	ret = fwnode_property_count_u32(fwnode, "sink-pdos");
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6191  	if (ret <= 0)
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6192  		return -EINVAL;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6193  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6194  	port->nr_snk_pdo = min(ret, PDO_MAX_OBJECTS);
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6195  	ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6196  					     port->snk_pdo, port->nr_snk_pdo);
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6197  	if ((ret < 0) || tcpm_validate_caps(port, port->snk_pdo,
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6198  					    port->nr_snk_pdo))
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6199  		return -EINVAL;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6200  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6201  	if (fwnode_property_read_u32(fwnode, "op-sink-microwatt", &mw) < 0)
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6202  		return -EINVAL;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6203  	port->operating_snk_mw = mw / 1000;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6204  
e9e6e164ed8f6d drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-08-04  6205  	/* FRS can only be supported by DRP ports */
8dc4bd073663fa drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2020-10-07  6206  	if (port->port_type == TYPEC_PORT_DRP) {
8115240c4fbd1c drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2020-10-28  6207  		ret = fwnode_property_read_u32(fwnode, "new-source-frs-typec-current",
8115240c4fbd1c drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2020-10-28  6208  					       &frs_current);
8dc4bd073663fa drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2020-10-07  6209  		if (ret >= 0 && frs_current <= FRS_5V_3A)
8115240c4fbd1c drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2020-10-28  6210  			port->new_source_frs_current = frs_current;
8dc4bd073663fa drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2020-10-07  6211  	}
8dc4bd073663fa drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2020-10-07  6212  
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6213  	/* sink-vdos is optional */
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6214  	ret = fwnode_property_count_u32(fwnode, "sink-vdos");
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6215  	if (ret < 0)
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6216  		ret = 0;
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6217  
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6218  	port->nr_snk_vdo = min(ret, VDO_MAX_OBJECTS);
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6219  	if (port->nr_snk_vdo) {
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6220  		ret = fwnode_property_read_u32_array(fwnode, "sink-vdos",
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6221  						     port->snk_vdo,
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6222  						     port->nr_snk_vdo);
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6223  		if (ret < 0)
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6224  			return ret;
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6225  	}
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6226  
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6227  	/* If sink-vdos is found, sink-vdos-v1 is expected for backward compatibility. */
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6228  	if (port->nr_snk_vdo) {
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6229  		ret = fwnode_property_count_u32(fwnode, "sink-vdos-v1");
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6230  		if (ret < 0)
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6231  			return ret;
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6232  		else if (ret == 0)
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6233  			return -ENODATA;
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6234  
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6235  		port->nr_snk_vdo_v1 = min(ret, VDO_MAX_OBJECTS);
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6236  		ret = fwnode_property_read_u32_array(fwnode, "sink-vdos-v1",
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6237  						     port->snk_vdo_v1,
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6238  						     port->nr_snk_vdo_v1);
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6239  		if (ret < 0)
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6240  			return ret;
7ac50510357254 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-06-01  6241  	}
f5d1d63e7359c6 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-02-05  6242  
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6243  	return 0;
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6244  }
96232cbc6c994c drivers/usb/typec/tcpm.c      Li Jun                 2018-06-27  6245  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
