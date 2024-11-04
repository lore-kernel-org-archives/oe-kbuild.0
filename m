Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D6188703
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 23:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730763895; cv=none; b=iR09p79Ab/NSeEvVn1IHiLz/Yb+TCUTSL2kZY2iJIcp9MQayTFPqF+mSNVsPemI6cbJFYEc+a+FOKI2MycJwcly5Ghbq5IbI0A98jZI/ywz8h2Gk8KRl1TuttRjzTyZSZkCw9+dfHnqSoWJ/F4hS1yQAjs0RsVk8KB535X6d9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730763895; c=relaxed/simple;
	bh=m/EbW4BMoVFZoKi0MNS6BWa+Ejs5n2yNqYAc0LN3MM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WTyMVtD3oh84ZLY4d8LxbzTPiOMquCoKy1dIju6cAwyu7ITwvnDGM1Bs5sr+FyORunSAp2UVrK6II9MV6nWCZSyRCBqvt7WOXUPrkt+SUBEGPX9G2G+KWGGRlNSrncR4073kGu5/D9XpbACNv7IPXNE9Co2bA9j4DKMVmOyBeVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsRp87gY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsRp87gY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730763894; x=1762299894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m/EbW4BMoVFZoKi0MNS6BWa+Ejs5n2yNqYAc0LN3MM0=;
  b=TsRp87gYzDw8iHiE++04e93AnDAS6Zd2YGVCP7h8pdUhPBimQLvYv59X
   USFgii1E9WTuDp2APDlMbFaX9ww8z7WO/+hahX+aQ3Z3yyszoainN+R5O
   YiEdmcDUVzFgSg6flzXpp3mt9JCN6LlujyYKBx61AvMjoBOglGXdHQm9h
   QB6G2j3cg4dPLGZjbRjAZHeeolymhcUJ6lbl++dQFuaeK6NqwwR2R2Dy9
   3Qx0N25kY5iumKvGaTPvDeYDKZGfIJrh02c2to0j7BOn4EUe8LkSxaZIM
   OP+TMmYQkhmFLA5ohXX75QprmCD2CLgGkEVjzBCHhFoTrYbBrJ8AqVe8K
   g==;
X-CSE-ConnectionGUID: h68yJucgTYiiVLMk1ehsIw==
X-CSE-MsgGUID: JpBA8CUKTVSTZfLHBjVaFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41856873"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="41856873"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 15:44:53 -0800
X-CSE-ConnectionGUID: L1ce4dO/QWeFEM1kdC3hFg==
X-CSE-MsgGUID: KCpQSrqeRcSzRm1L9ndYZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="83479838"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2024 15:44:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t86kb-000lOz-15;
	Mon, 04 Nov 2024 23:44:49 +0000
Date: Tue, 5 Nov 2024 07:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 11/12] soundwire: generic_bandwidth_allocation: select
 data lane
Message-ID: <202411050730.gbXOnbB1-lkp@intel.com>
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
In-Reply-To: <20241104032358.669705-12-yung-chuan.liao@linux.intel.com>
References: <20241104032358.669705-12-yung-chuan.liao@linux.intel.com>
TO: Bard Liao <yung-chuan.liao@linux.intel.com>

Hi Bard,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241101]
[cannot apply to linus/master v6.12-rc6 v6.12-rc5 v6.12-rc4 v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bard-Liao/soundwire-add-lane-field-in-sdw_port_runtime/20241104-112754
base:   next-20241101
patch link:    https://lore.kernel.org/r/20241104032358.669705-12-yung-chuan.liao%40linux.intel.com
patch subject: [PATCH 11/12] soundwire: generic_bandwidth_allocation: select data lane
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-104-20241105 (https://download.01.org/0day-ci/archive/20241105/202411050730.gbXOnbB1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411050730.gbXOnbB1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soundwire/generic_bandwidth_allocation.c:495:29-33: ERROR: invalid reference to the index variable of the iterator on line 462

vim +495 drivers/soundwire/generic_bandwidth_allocation.c

d4d16467ba4670 Bard Liao            2024-11-04  414  
9026118f20e28f Bard Liao            2020-09-08  415  /**
9026118f20e28f Bard Liao            2020-09-08  416   * sdw_compute_bus_params: Compute bus parameters
9026118f20e28f Bard Liao            2020-09-08  417   *
9026118f20e28f Bard Liao            2020-09-08  418   * @bus: SDW Bus instance
9026118f20e28f Bard Liao            2020-09-08  419   */
9026118f20e28f Bard Liao            2020-09-08  420  static int sdw_compute_bus_params(struct sdw_bus *bus)
9026118f20e28f Bard Liao            2020-09-08  421  {
5ec3215e56af8f Dan Carpenter        2020-09-23  422  	struct sdw_master_prop *mstr_prop = &bus->prop;
d4d16467ba4670 Bard Liao            2024-11-04  423  	struct sdw_slave_prop *slave_prop;
d4d16467ba4670 Bard Liao            2024-11-04  424  	struct sdw_port_runtime *m_p_rt;
d4d16467ba4670 Bard Liao            2024-11-04  425  	struct sdw_port_runtime *s_p_rt;
d4d16467ba4670 Bard Liao            2024-11-04  426  	struct sdw_master_runtime *m_rt;
d4d16467ba4670 Bard Liao            2024-11-04  427  	struct sdw_slave_runtime *s_rt;
d4d16467ba4670 Bard Liao            2024-11-04  428  	unsigned int curr_dr_freq = 0;
d4d16467ba4670 Bard Liao            2024-11-04  429  	int i, l, clk_values, ret;
9026118f20e28f Bard Liao            2020-09-08  430  	bool is_gear = false;
d4d16467ba4670 Bard Liao            2024-11-04  431  	int m_lane = 0;
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
a00a9429376118 Bard Liao            2024-11-04  446  	/* If dynamic scaling is not supported, don't try higher freq */
a00a9429376118 Bard Liao            2024-11-04  447  	if (!is_clock_scaling_supported(bus))
a00a9429376118 Bard Liao            2024-11-04  448  		clk_values = 1;
a00a9429376118 Bard Liao            2024-11-04  449  
9026118f20e28f Bard Liao            2020-09-08  450  	for (i = 0; i < clk_values; i++) {
9026118f20e28f Bard Liao            2020-09-08  451  		if (!clk_buf)
55d50ace6b88eb Bard Liao            2023-11-27  452  			curr_dr_freq = bus->params.max_dr_freq;
9026118f20e28f Bard Liao            2020-09-08  453  		else
9026118f20e28f Bard Liao            2020-09-08  454  			curr_dr_freq = (is_gear) ?
55d50ace6b88eb Bard Liao            2023-11-27  455  				(bus->params.max_dr_freq >>  clk_buf[i]) :
9026118f20e28f Bard Liao            2020-09-08  456  				clk_buf[i] * SDW_DOUBLE_RATE_FACTOR;
9026118f20e28f Bard Liao            2020-09-08  457  
d4d16467ba4670 Bard Liao            2024-11-04  458  		if (curr_dr_freq * (mstr_prop->default_col - 1) >=
581695fa1171ba Bard Liao            2024-11-04  459  		    bus->params.bandwidth * mstr_prop->default_col)
9026118f20e28f Bard Liao            2020-09-08  460  			break;
9026118f20e28f Bard Liao            2020-09-08  461  
d4d16467ba4670 Bard Liao            2024-11-04 @462  		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
d4d16467ba4670 Bard Liao            2024-11-04  463  			/*
d4d16467ba4670 Bard Liao            2024-11-04  464  			 * Get the first s_rt that will be used to find the available lane that
d4d16467ba4670 Bard Liao            2024-11-04  465  			 * can be used. No need to check all Peripherals because we can't use
d4d16467ba4670 Bard Liao            2024-11-04  466  			 * multi-lane if we can't find any available lane for the first Peripheral.
d4d16467ba4670 Bard Liao            2024-11-04  467  			 */
d4d16467ba4670 Bard Liao            2024-11-04  468  			s_rt = list_first_entry(&m_rt->slave_rt_list,
d4d16467ba4670 Bard Liao            2024-11-04  469  						struct sdw_slave_runtime, m_rt_node);
d4d16467ba4670 Bard Liao            2024-11-04  470  
d4d16467ba4670 Bard Liao            2024-11-04  471  			/*
d4d16467ba4670 Bard Liao            2024-11-04  472  			 * Find the available Manager lane that connected to the first Peripheral.
d4d16467ba4670 Bard Liao            2024-11-04  473  			 */
d4d16467ba4670 Bard Liao            2024-11-04  474  			m_lane = get_manager_lane(bus, m_rt, s_rt, curr_dr_freq);
d4d16467ba4670 Bard Liao            2024-11-04  475  			if (m_lane > 0)
d4d16467ba4670 Bard Liao            2024-11-04  476  				goto out;
d4d16467ba4670 Bard Liao            2024-11-04  477  		}
d4d16467ba4670 Bard Liao            2024-11-04  478  
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
d4d16467ba4670 Bard Liao            2024-11-04  491  out:
d4d16467ba4670 Bard Liao            2024-11-04  492  	/* multilane can be used */
d4d16467ba4670 Bard Liao            2024-11-04  493  	if (m_lane > 0) {
d4d16467ba4670 Bard Liao            2024-11-04  494  		/* Set Peripheral lanes */
d4d16467ba4670 Bard Liao            2024-11-04 @495  		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
d4d16467ba4670 Bard Liao            2024-11-04  496  			slave_prop = &s_rt->slave->prop;
d4d16467ba4670 Bard Liao            2024-11-04  497  			for (l = 1; l < SDW_MAX_LANES; l++) {
d4d16467ba4670 Bard Liao            2024-11-04  498  				if (slave_prop->lane_maps[l] == m_lane) {
d4d16467ba4670 Bard Liao            2024-11-04  499  					list_for_each_entry(s_p_rt, &s_rt->port_list, port_node) {
d4d16467ba4670 Bard Liao            2024-11-04  500  						s_p_rt->lane = l;
d4d16467ba4670 Bard Liao            2024-11-04  501  						dev_dbg(&s_rt->slave->dev,
d4d16467ba4670 Bard Liao            2024-11-04  502  							"Set P lane %d for port %d\n",
d4d16467ba4670 Bard Liao            2024-11-04  503  							l, s_p_rt->num);
d4d16467ba4670 Bard Liao            2024-11-04  504  					}
d4d16467ba4670 Bard Liao            2024-11-04  505  					break;
d4d16467ba4670 Bard Liao            2024-11-04  506  				}
d4d16467ba4670 Bard Liao            2024-11-04  507  			}
d4d16467ba4670 Bard Liao            2024-11-04  508  		}
d4d16467ba4670 Bard Liao            2024-11-04  509  		/*
d4d16467ba4670 Bard Liao            2024-11-04  510  		 * Set Manager lanes. Configure the last m_rt in bus->m_rt_list only since
d4d16467ba4670 Bard Liao            2024-11-04  511  		 * we don't want to touch other m_rts that are already working.
d4d16467ba4670 Bard Liao            2024-11-04  512  		 */
d4d16467ba4670 Bard Liao            2024-11-04  513  		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
d4d16467ba4670 Bard Liao            2024-11-04  514  			m_p_rt->lane = m_lane;
d4d16467ba4670 Bard Liao            2024-11-04  515  		}
d4d16467ba4670 Bard Liao            2024-11-04  516  	}
9026118f20e28f Bard Liao            2020-09-08  517  
a00a9429376118 Bard Liao            2024-11-04  518  	if (!mstr_prop->default_frame_rate || !mstr_prop->default_row)
a00a9429376118 Bard Liao            2024-11-04  519  		return -EINVAL;
a00a9429376118 Bard Liao            2024-11-04  520  
a00a9429376118 Bard Liao            2024-11-04  521  	mstr_prop->default_col = curr_dr_freq / mstr_prop->default_frame_rate /
a00a9429376118 Bard Liao            2024-11-04  522  				 mstr_prop->default_row;
a00a9429376118 Bard Liao            2024-11-04  523  
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
