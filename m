Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B845059E42
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 16:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUsr78fO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701794947; x=1733330947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DaZpxxYu70Jkl523paT8tcy5yvXImhtz4B65xetTxYE=;
  b=VUsr78fOm2QOC3drvVLsQ8VO/PYXfd7dBiU9cJBaPeyqwRyDbDCQZStu
   R7uXfqGLSI6ZrBWp1+LNpdrOhncIi5Wh3zd1QgtnAnlwAoL5Mxf1T6CSd
   8wRurVvLP22X6KBZ7wlP1QLCokN5DfDNCG8XbeTavOV+uWbDQfen8t1l5
   7UpXyZlYWnzWO2tBTXg4w/YUvG8nICMuEtP8yvTeiouvRcY3zIAN2InHS
   rYMzzkRcTi6DydM56Tvo//KJYXgjVDsMeAbKNU13RHt8OKxINkWHqbwFs
   ujLkQEpiQ/QBtogccFjA0ZXCIkJmi+WfeEHXDqr8yYLtq+b8cMwCEw9JV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396714321"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="396714321"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 08:49:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="944328450"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="944328450"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 05 Dec 2023 08:49:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAYbU-0009O5-0r;
	Tue, 05 Dec 2023 16:49:00 +0000
Date: Wed, 6 Dec 2023 00:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [plbossart-sound:sdw/start-BRA-support 35/64]
 drivers/soundwire/stream.c:522 sdw_prep_deprep_slave_ports() error:
 uninitialized symbol 'ch_prep_timeout'.
Message-ID: <202312060016.3RIkqEGT-lkp@intel.com>
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
TO: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   397fa61fc8605656143d539ebd1b1fa11c274ed4
commit: 4448bc1363fb6d297861797a35ea916b5f69ed2f [35/64] soundwire: stream: reuse existing code for BPT stream
:::::: branch date: 4 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060016.3RIkqEGT-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312060016.3RIkqEGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312060016.3RIkqEGT-lkp@intel.com/

New smatch warnings:
drivers/soundwire/stream.c:522 sdw_prep_deprep_slave_ports() error: uninitialized symbol 'ch_prep_timeout'.

Old smatch warnings:
drivers/soundwire/stream.c:1467 _sdw_prepare_stream() error: uninitialized symbol 'bus'.

vim +/ch_prep_timeout +522 drivers/soundwire/stream.c

79df15b7d37c80 Sanyog Kale          2018-04-26  442  
79df15b7d37c80 Sanyog Kale          2018-04-26  443  static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
79df15b7d37c80 Sanyog Kale          2018-04-26  444  				       struct sdw_slave_runtime *s_rt,
1fe74a5e41d6e5 Pierre-Louis Bossart 2019-05-01  445  				       struct sdw_port_runtime *p_rt,
1fe74a5e41d6e5 Pierre-Louis Bossart 2019-05-01  446  				       bool prep)
79df15b7d37c80 Sanyog Kale          2018-04-26  447  {
3a0be1a65b5012 Pierre-Louis Bossart 2019-08-05  448  	struct completion *port_ready;
79df15b7d37c80 Sanyog Kale          2018-04-26  449  	struct sdw_dpn_prop *dpn_prop;
79df15b7d37c80 Sanyog Kale          2018-04-26  450  	struct sdw_prepare_ch prep_ch;
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  451  	u32 imp_def_interrupts;
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  452  	bool simple_ch_prep_sm;
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  453  	u32 ch_prep_timeout;
79df15b7d37c80 Sanyog Kale          2018-04-26  454  	bool intr = false;
79df15b7d37c80 Sanyog Kale          2018-04-26  455  	int ret = 0, val;
79df15b7d37c80 Sanyog Kale          2018-04-26  456  	u32 addr;
79df15b7d37c80 Sanyog Kale          2018-04-26  457  
79df15b7d37c80 Sanyog Kale          2018-04-26  458  	prep_ch.num = p_rt->num;
79df15b7d37c80 Sanyog Kale          2018-04-26  459  	prep_ch.ch_mask = p_rt->ch_mask;
79df15b7d37c80 Sanyog Kale          2018-04-26  460  
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  461  	if (p_rt->num) {
79df15b7d37c80 Sanyog Kale          2018-04-26  462  		dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
79df15b7d37c80 Sanyog Kale          2018-04-26  463  						  s_rt->direction,
79df15b7d37c80 Sanyog Kale          2018-04-26  464  						  prep_ch.num);
79df15b7d37c80 Sanyog Kale          2018-04-26  465  		if (!dpn_prop) {
79df15b7d37c80 Sanyog Kale          2018-04-26  466  			dev_err(bus->dev,
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  467  				"Slave Port:%d properties not found\n", prep_ch.num);
79df15b7d37c80 Sanyog Kale          2018-04-26  468  			return -EINVAL;
79df15b7d37c80 Sanyog Kale          2018-04-26  469  		}
79df15b7d37c80 Sanyog Kale          2018-04-26  470  
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  471  		imp_def_interrupts = dpn_prop->imp_def_interrupts;
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  472  		simple_ch_prep_sm = dpn_prop->simple_ch_prep_sm;
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  473  	} else {
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  474  		struct sdw_dp0_prop *dp0_prop = s_rt->slave->prop.dp0_prop;
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  475  
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  476  		imp_def_interrupts = dp0_prop->imp_def_interrupts;
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  477  		simple_ch_prep_sm =  dp0_prop->simple_ch_prep_sm;
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  478  		ch_prep_timeout = dp0_prop->ch_prep_timeout;
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  479  	}
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  480  
79df15b7d37c80 Sanyog Kale          2018-04-26  481  	prep_ch.prepare = prep;
79df15b7d37c80 Sanyog Kale          2018-04-26  482  
79df15b7d37c80 Sanyog Kale          2018-04-26  483  	prep_ch.bank = bus->params.next_bank;
79df15b7d37c80 Sanyog Kale          2018-04-26  484  
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  485  	if (imp_def_interrupts || !simple_ch_prep_sm ||
dd87a72ae968f7 Pierre-Louis Bossart 2020-09-21  486  	    bus->params.s_data_mode != SDW_PORT_DATA_MODE_NORMAL)
79df15b7d37c80 Sanyog Kale          2018-04-26  487  		intr = true;
79df15b7d37c80 Sanyog Kale          2018-04-26  488  
79df15b7d37c80 Sanyog Kale          2018-04-26  489  	/*
79df15b7d37c80 Sanyog Kale          2018-04-26  490  	 * Enable interrupt before Port prepare.
79df15b7d37c80 Sanyog Kale          2018-04-26  491  	 * For Port de-prepare, it is assumed that port
79df15b7d37c80 Sanyog Kale          2018-04-26  492  	 * was prepared earlier
79df15b7d37c80 Sanyog Kale          2018-04-26  493  	 */
79df15b7d37c80 Sanyog Kale          2018-04-26  494  	if (prep && intr) {
79df15b7d37c80 Sanyog Kale          2018-04-26  495  		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  496  					     imp_def_interrupts);
79df15b7d37c80 Sanyog Kale          2018-04-26  497  		if (ret < 0)
79df15b7d37c80 Sanyog Kale          2018-04-26  498  			return ret;
79df15b7d37c80 Sanyog Kale          2018-04-26  499  	}
79df15b7d37c80 Sanyog Kale          2018-04-26  500  
79df15b7d37c80 Sanyog Kale          2018-04-26  501  	/* Inform slave about the impending port prepare */
43f1a7f905fcc7 Stefan Binding       2023-01-27  502  	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_PRE_PREP : SDW_OPS_PORT_PRE_DEPREP);
79df15b7d37c80 Sanyog Kale          2018-04-26  503  
79df15b7d37c80 Sanyog Kale          2018-04-26  504  	/* Prepare Slave port implementing CP_SM */
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  505  	if (!simple_ch_prep_sm) {
79df15b7d37c80 Sanyog Kale          2018-04-26  506  		addr = SDW_DPN_PREPARECTRL(p_rt->num);
79df15b7d37c80 Sanyog Kale          2018-04-26  507  
79df15b7d37c80 Sanyog Kale          2018-04-26  508  		if (prep)
545c365185a476 Charles Keepax       2022-11-25  509  			ret = sdw_write_no_pm(s_rt->slave, addr, p_rt->ch_mask);
79df15b7d37c80 Sanyog Kale          2018-04-26  510  		else
545c365185a476 Charles Keepax       2022-11-25  511  			ret = sdw_write_no_pm(s_rt->slave, addr, 0x0);
79df15b7d37c80 Sanyog Kale          2018-04-26  512  
79df15b7d37c80 Sanyog Kale          2018-04-26  513  		if (ret < 0) {
79df15b7d37c80 Sanyog Kale          2018-04-26  514  			dev_err(&s_rt->slave->dev,
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  515  				"Slave prep_ctrl reg write failed\n");
79df15b7d37c80 Sanyog Kale          2018-04-26  516  			return ret;
79df15b7d37c80 Sanyog Kale          2018-04-26  517  		}
79df15b7d37c80 Sanyog Kale          2018-04-26  518  
79df15b7d37c80 Sanyog Kale          2018-04-26  519  		/* Wait for completion on port ready */
79df15b7d37c80 Sanyog Kale          2018-04-26  520  		port_ready = &s_rt->slave->port_ready[prep_ch.num];
3d3e88e3363388 Richard Fitzgerald   2021-06-18  521  		wait_for_completion_timeout(port_ready,
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06 @522  			msecs_to_jiffies(ch_prep_timeout));
79df15b7d37c80 Sanyog Kale          2018-04-26  523  
545c365185a476 Charles Keepax       2022-11-25  524  		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
3d3e88e3363388 Richard Fitzgerald   2021-06-18  525  		if ((val < 0) || (val & p_rt->ch_mask)) {
3d3e88e3363388 Richard Fitzgerald   2021-06-18  526  			ret = (val < 0) ? val : -ETIMEDOUT;
79df15b7d37c80 Sanyog Kale          2018-04-26  527  			dev_err(&s_rt->slave->dev,
3d3e88e3363388 Richard Fitzgerald   2021-06-18  528  				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
3d3e88e3363388 Richard Fitzgerald   2021-06-18  529  			return ret;
79df15b7d37c80 Sanyog Kale          2018-04-26  530  		}
79df15b7d37c80 Sanyog Kale          2018-04-26  531  	}
79df15b7d37c80 Sanyog Kale          2018-04-26  532  
79df15b7d37c80 Sanyog Kale          2018-04-26  533  	/* Inform slaves about ports prepared */
43f1a7f905fcc7 Stefan Binding       2023-01-27  534  	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_POST_PREP : SDW_OPS_PORT_POST_DEPREP);
79df15b7d37c80 Sanyog Kale          2018-04-26  535  
79df15b7d37c80 Sanyog Kale          2018-04-26  536  	/* Disable interrupt after Port de-prepare */
79df15b7d37c80 Sanyog Kale          2018-04-26  537  	if (!prep && intr)
79df15b7d37c80 Sanyog Kale          2018-04-26  538  		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
4448bc1363fb6d Pierre-Louis Bossart 2023-11-06  539  					     imp_def_interrupts);
79df15b7d37c80 Sanyog Kale          2018-04-26  540  
79df15b7d37c80 Sanyog Kale          2018-04-26  541  	return ret;
79df15b7d37c80 Sanyog Kale          2018-04-26  542  }
79df15b7d37c80 Sanyog Kale          2018-04-26  543  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
