Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB71A8F6E
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733336802; cv=none; b=nVCY5x+VwL8CX9LHtF6qgVvZHnfP4XFFo7mWlNvYArmgSiZV93q3E1WzmBeLIP+bHKR8N4XeI/P17MmK20oiRjtrKQfYT0fLtP0DrSi5jdnBywNFIHpco48QCg+iCuN/op9wa1wxuH+pocaCsyUsi8dC9gHUrCFzDAPmP7wvBFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733336802; c=relaxed/simple;
	bh=BATGnafWmfBFzoHJr4jGvVUH/7Z98cO9up0gIr3jOL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p80P23+yQH8E3Pm+NLi0e2B7u6iWqvYAabsoXuSG4Imd0sNUE0ycTRlXoRlANoyG4cHQ5fiFqtZS5o8NigTzW5xaZP34ooaaplUURP5+tTVS8sI+D9sZN2YZU1ZkKIrWeNxwf7g9jPz1+n01FMeVh3cB4W+CQV9qLpDtfePN9OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Me4oohNR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Me4oohNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733336800; x=1764872800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BATGnafWmfBFzoHJr4jGvVUH/7Z98cO9up0gIr3jOL4=;
  b=Me4oohNRj/g7e/Rgs3oXV9MfLz0aXqYbcOYaYhYno2DfA1A1zCRoUkgH
   P5OHsIwdyXL89Lwz5VHh8eJ55XF3QnPbVVd0qDa6NPeHjyqrM4oJCDkGf
   lGbUFpJeSa01UIL13E4KpSaGvvk6/BgG4+bMEoKwiJw/+Y6KKdNHEsyvb
   Wcu4Mu3/pZtdcPdNo60pWAVb8qYPr9E8Mx9fCtTZSFn/9/tnWdDwCY6Yp
   cepYEgu7CCKEqDujEj9GEoRVuVlqfU2r9JoUK+nHzscSaEaLVwPpy0PP7
   QrhowLl/P65xIl0RXr7vljzlbxYoK3Zc1wN6w6Dr7qkrx/CwnSX2snI2q
   Q==;
X-CSE-ConnectionGUID: he6AGxQnSFSxtPjJJjnoxQ==
X-CSE-MsgGUID: /97xmxkdQjWlFhZCOUZlAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33768732"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33768732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 10:26:39 -0800
X-CSE-ConnectionGUID: afxP8Kb4RvKdCZxrtfQttA==
X-CSE-MsgGUID: c1nV1RSvQ9OP3lJiazoHgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="98920827"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Dec 2024 10:26:38 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIu55-0003Nf-35;
	Wed, 04 Dec 2024 18:26:35 +0000
Date: Thu, 5 Dec 2024 02:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [thesofproject:topic/sof-dev-rebase 32/77]
 drivers/soundwire/generic_bandwidth_allocation.c:495:29-33: ERROR: invalid
 reference to the index variable of the iterator on line 462
Message-ID: <202412050201.N6mhK0ja-lkp@intel.com>
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
TO: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   6fe6ddbc4ea3af536e2b22e189f0a0a9be4723cf
commit: 06a48b44f17f10a43b672f8c85d266f350c27110 [32/77] soundwire: generic_bandwidth_allocation: select data lane
:::::: branch date: 32 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-r061-20241204 (https://download.01.org/0day-ci/archive/20241205/202412050201.N6mhK0ja-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412050201.N6mhK0ja-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soundwire/generic_bandwidth_allocation.c:495:29-33: ERROR: invalid reference to the index variable of the iterator on line 462

vim +495 drivers/soundwire/generic_bandwidth_allocation.c

06a48b44f17f10 Bard Liao            2024-09-13  414  
9026118f20e28f Bard Liao            2020-09-08  415  /**
9026118f20e28f Bard Liao            2020-09-08  416   * sdw_compute_bus_params: Compute bus parameters
9026118f20e28f Bard Liao            2020-09-08  417   *
9026118f20e28f Bard Liao            2020-09-08  418   * @bus: SDW Bus instance
9026118f20e28f Bard Liao            2020-09-08  419   */
9026118f20e28f Bard Liao            2020-09-08  420  static int sdw_compute_bus_params(struct sdw_bus *bus)
9026118f20e28f Bard Liao            2020-09-08  421  {
5ec3215e56af8f Dan Carpenter        2020-09-23  422  	struct sdw_master_prop *mstr_prop = &bus->prop;
06a48b44f17f10 Bard Liao            2024-09-13  423  	struct sdw_slave_prop *slave_prop;
06a48b44f17f10 Bard Liao            2024-09-13  424  	struct sdw_port_runtime *m_p_rt;
06a48b44f17f10 Bard Liao            2024-09-13  425  	struct sdw_port_runtime *s_p_rt;
06a48b44f17f10 Bard Liao            2024-09-13  426  	struct sdw_master_runtime *m_rt;
06a48b44f17f10 Bard Liao            2024-09-13  427  	struct sdw_slave_runtime *s_rt;
06a48b44f17f10 Bard Liao            2024-09-13  428  	unsigned int curr_dr_freq = 0;
06a48b44f17f10 Bard Liao            2024-09-13  429  	int i, l, clk_values, ret;
9026118f20e28f Bard Liao            2020-09-08  430  	bool is_gear = false;
06a48b44f17f10 Bard Liao            2024-09-13  431  	int m_lane = 0;
9026118f20e28f Bard Liao            2020-09-08  432  	u32 *clk_buf;
9026118f20e28f Bard Liao            2020-09-08  433  
9026118f20e28f Bard Liao            2020-09-08  434  	if (mstr_prop->num_clk_gears) {
9026118f20e28f Bard Liao            2020-09-08  435  		clk_values = mstr_prop->num_clk_gears;
9026118f20e28f Bard Liao            2020-09-08  436  		clk_buf = mstr_prop->clk_gears;
9026118f20e28f Bard Liao            2020-09-08  437  		is_gear = true;
9026118f20e28f Bard Liao            2020-09-08  438  	} else if (mstr_prop->num_clk_freq) {
9026118f20e28f Bard Liao            2020-09-08  439  		clk_values = mstr_prop->num_clk_freq;
9026118f20e28f Bard Liao            2020-09-08  440  		clk_buf = mstr_prop->clk_freq;
9026118f20e28f Bard Liao            2020-09-08  441  	} else {
9026118f20e28f Bard Liao            2020-09-08  442  		clk_values = 1;
9026118f20e28f Bard Liao            2020-09-08  443  		clk_buf = NULL;
9026118f20e28f Bard Liao            2020-09-08  444  	}
9026118f20e28f Bard Liao            2020-09-08  445  
1170bae09dc541 Bard Liao            2024-08-28  446  	/* If dynamic scaling is not supported, don't try higher freq */
1170bae09dc541 Bard Liao            2024-08-28  447  	if (!is_clock_scaling_supported(bus))
1170bae09dc541 Bard Liao            2024-08-28  448  		clk_values = 1;
1170bae09dc541 Bard Liao            2024-08-28  449  
9026118f20e28f Bard Liao            2020-09-08  450  	for (i = 0; i < clk_values; i++) {
9026118f20e28f Bard Liao            2020-09-08  451  		if (!clk_buf)
55d50ace6b88eb Bard Liao            2023-11-27  452  			curr_dr_freq = bus->params.max_dr_freq;
9026118f20e28f Bard Liao            2020-09-08  453  		else
9026118f20e28f Bard Liao            2020-09-08  454  			curr_dr_freq = (is_gear) ?
55d50ace6b88eb Bard Liao            2023-11-27  455  				(bus->params.max_dr_freq >>  clk_buf[i]) :
9026118f20e28f Bard Liao            2020-09-08  456  				clk_buf[i] * SDW_DOUBLE_RATE_FACTOR;
9026118f20e28f Bard Liao            2020-09-08  457  
06a48b44f17f10 Bard Liao            2024-09-13  458  		if (curr_dr_freq * (mstr_prop->default_col - 1) >=
0a5b8ec03cde2e Bard Liao            2024-09-10  459  		    bus->params.bandwidth * mstr_prop->default_col)
9026118f20e28f Bard Liao            2020-09-08  460  			break;
9026118f20e28f Bard Liao            2020-09-08  461  
06a48b44f17f10 Bard Liao            2024-09-13 @462  		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
06a48b44f17f10 Bard Liao            2024-09-13  463  			/*
06a48b44f17f10 Bard Liao            2024-09-13  464  			 * Get the first s_rt that will be used to find the available lane that
06a48b44f17f10 Bard Liao            2024-09-13  465  			 * can be used. No need to check all Peripherals because we can't use
06a48b44f17f10 Bard Liao            2024-09-13  466  			 * multi-lane if we can't find any available lane for the first Peripheral.
06a48b44f17f10 Bard Liao            2024-09-13  467  			 */
06a48b44f17f10 Bard Liao            2024-09-13  468  			s_rt = list_first_entry(&m_rt->slave_rt_list,
06a48b44f17f10 Bard Liao            2024-09-13  469  						struct sdw_slave_runtime, m_rt_node);
06a48b44f17f10 Bard Liao            2024-09-13  470  
06a48b44f17f10 Bard Liao            2024-09-13  471  			/*
06a48b44f17f10 Bard Liao            2024-09-13  472  			 * Find the available Manager lane that connected to the first Peripheral.
06a48b44f17f10 Bard Liao            2024-09-13  473  			 */
06a48b44f17f10 Bard Liao            2024-09-13  474  			m_lane = get_manager_lane(bus, m_rt, s_rt, curr_dr_freq);
06a48b44f17f10 Bard Liao            2024-09-13  475  			if (m_lane > 0)
06a48b44f17f10 Bard Liao            2024-09-13  476  				goto out;
06a48b44f17f10 Bard Liao            2024-09-13  477  		}
06a48b44f17f10 Bard Liao            2024-09-13  478  
9026118f20e28f Bard Liao            2020-09-08  479  		/*
9026118f20e28f Bard Liao            2020-09-08  480  		 * TODO: Check all the Slave(s) port(s) audio modes and find
9026118f20e28f Bard Liao            2020-09-08  481  		 * whether given clock rate is supported with glitchless
9026118f20e28f Bard Liao            2020-09-08  482  		 * transition.
9026118f20e28f Bard Liao            2020-09-08  483  		 */
9026118f20e28f Bard Liao            2020-09-08  484  	}
9026118f20e28f Bard Liao            2020-09-08  485  
0531e6b60569c7 Pierre-Louis Bossart 2021-05-11  486  	if (i == clk_values) {
0531e6b60569c7 Pierre-Louis Bossart 2021-05-11  487  		dev_err(bus->dev, "%s: could not find clock value for bandwidth %d\n",
0531e6b60569c7 Pierre-Louis Bossart 2021-05-11  488  			__func__, bus->params.bandwidth);
9026118f20e28f Bard Liao            2020-09-08  489  		return -EINVAL;
0531e6b60569c7 Pierre-Louis Bossart 2021-05-11  490  	}
06a48b44f17f10 Bard Liao            2024-09-13  491  out:
06a48b44f17f10 Bard Liao            2024-09-13  492  	/* multilane can be used */
06a48b44f17f10 Bard Liao            2024-09-13  493  	if (m_lane > 0) {
06a48b44f17f10 Bard Liao            2024-09-13  494  		/* Set Peripheral lanes */
06a48b44f17f10 Bard Liao            2024-09-13 @495  		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
06a48b44f17f10 Bard Liao            2024-09-13  496  			slave_prop = &s_rt->slave->prop;
06a48b44f17f10 Bard Liao            2024-09-13  497  			for (l = 1; l < SDW_MAX_LANES; l++) {
06a48b44f17f10 Bard Liao            2024-09-13  498  				if (slave_prop->lane_maps[l] == m_lane) {
06a48b44f17f10 Bard Liao            2024-09-13  499  					list_for_each_entry(s_p_rt, &s_rt->port_list, port_node) {
06a48b44f17f10 Bard Liao            2024-09-13  500  						s_p_rt->lane = l;
06a48b44f17f10 Bard Liao            2024-09-13  501  						dev_dbg(&s_rt->slave->dev,
06a48b44f17f10 Bard Liao            2024-09-13  502  							"Set P lane %d for port %d\n",
06a48b44f17f10 Bard Liao            2024-09-13  503  							l, s_p_rt->num);
06a48b44f17f10 Bard Liao            2024-09-13  504  					}
06a48b44f17f10 Bard Liao            2024-09-13  505  					break;
06a48b44f17f10 Bard Liao            2024-09-13  506  				}
06a48b44f17f10 Bard Liao            2024-09-13  507  			}
06a48b44f17f10 Bard Liao            2024-09-13  508  		}
06a48b44f17f10 Bard Liao            2024-09-13  509  		/*
06a48b44f17f10 Bard Liao            2024-09-13  510  		 * Set Manager lanes. Configure the last m_rt in bus->m_rt_list only since
06a48b44f17f10 Bard Liao            2024-09-13  511  		 * we don't want to touch other m_rts that are already working.
06a48b44f17f10 Bard Liao            2024-09-13  512  		 */
06a48b44f17f10 Bard Liao            2024-09-13  513  		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
06a48b44f17f10 Bard Liao            2024-09-13  514  			m_p_rt->lane = m_lane;
06a48b44f17f10 Bard Liao            2024-09-13  515  		}
06a48b44f17f10 Bard Liao            2024-09-13  516  	}
9026118f20e28f Bard Liao            2020-09-08  517  
1170bae09dc541 Bard Liao            2024-08-28  518  	if (!mstr_prop->default_frame_rate || !mstr_prop->default_row)
1170bae09dc541 Bard Liao            2024-08-28  519  		return -EINVAL;
1170bae09dc541 Bard Liao            2024-08-28  520  
1170bae09dc541 Bard Liao            2024-08-28  521  	mstr_prop->default_col = curr_dr_freq / mstr_prop->default_frame_rate /
1170bae09dc541 Bard Liao            2024-08-28  522  				 mstr_prop->default_row;
1170bae09dc541 Bard Liao            2024-08-28  523  
9026118f20e28f Bard Liao            2020-09-08  524  	ret = sdw_select_row_col(bus, curr_dr_freq);
0531e6b60569c7 Pierre-Louis Bossart 2021-05-11  525  	if (ret < 0) {
0531e6b60569c7 Pierre-Louis Bossart 2021-05-11  526  		dev_err(bus->dev, "%s: could not find frame configuration for bus dr_freq %d\n",
0531e6b60569c7 Pierre-Louis Bossart 2021-05-11  527  			__func__, curr_dr_freq);
9026118f20e28f Bard Liao            2020-09-08  528  		return -EINVAL;
0531e6b60569c7 Pierre-Louis Bossart 2021-05-11  529  	}
9026118f20e28f Bard Liao            2020-09-08  530  
9026118f20e28f Bard Liao            2020-09-08  531  	bus->params.curr_dr_freq = curr_dr_freq;
9026118f20e28f Bard Liao            2020-09-08  532  	return 0;
9026118f20e28f Bard Liao            2020-09-08  533  }
9026118f20e28f Bard Liao            2020-09-08  534  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
