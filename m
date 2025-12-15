Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60A742AB7
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800882; cv=none; b=Wu3Jqroio8nB2qxtdReg+wJ1Rh+ZgxYzPrlTZYsDoQuqo3xiABNRoGp/i7ZQJPYviyIaKMNpTq7Zu3Dxjs419W1dKcEIYrQj4LjZiuk5LPiZ2CAq0NgP9db7/ufOcaZJBik/pLoQQPMGGgjdRjbSgf7eNR0IPkUtUoiKhFePcTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800882; c=relaxed/simple;
	bh=Xkb229g9ZG8qyInWCCd7iSYsvvnILe6+XYivF6W1E0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfVdeCo8EMxBK3rTVXrRfiEKuwQwnNXY0t98Ce9Ud1YgwGlqfv0pgTAaHTtoPs9vHDzKlydrRIr0KoCONK/ukTrEup1ho+05Xnlj3/PEqRPCEBJgsSsbc9tNs3lNbw9Q7zkOvSyJfdl7mrTYJHcwUDKuEMFGvHbqiWfkbmao77Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEBcfdVI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEBcfdVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765800880; x=1797336880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xkb229g9ZG8qyInWCCd7iSYsvvnILe6+XYivF6W1E0g=;
  b=FEBcfdVIJSDD4W1ocxTaCjKeIGxks+hw2JhAdGvG12lU06+97rdsf1Dy
   zmxCW4/YiuLCQzsJ8GhHugxgSbABnneVF8rIX3y7Bicb+i0JExJLHe2tI
   BZGtdHojEoagtwf7TkujwW7Sf7UmPLsB2euhBVPNRe1Et5teyZnM0lBha
   dq3FhPQxCzUA9kpB3Vt+nSZ8YBV7AABdwqhNecWJOYlVFTaLx7AovCuW5
   8z3X+0HWuAMHy7Hoq4znWkjeGu8K8leIfkQPgzI+ZHuY15dsrZXxrAun4
   kN/2rCWVRDN+8s+tvf5b8i2ZTGHRlXW7UqGR4IT5I6Ms5OklaKuPTq2/2
   w==;
X-CSE-ConnectionGUID: oR5p1GOoR92MODpwjJYQ2g==
X-CSE-MsgGUID: TNc63M/2RG2bMHP4HjkZig==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66883095"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="66883095"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 04:14:40 -0800
X-CSE-ConnectionGUID: CXcHdjJRSASDo0gGS7LZRA==
X-CSE-MsgGUID: Mo1/zUrcSxusC4xpF8Vr/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="202122801"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Dec 2025 04:14:39 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV7T0-000000000Gp-0Lye;
	Mon, 15 Dec 2025 12:14:24 +0000
Date: Mon, 15 Dec 2025 20:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/soundwire/generic_bandwidth_allocation.c:495:29-33: ERROR:
 invalid reference to the index variable of the iterator on line 462
Message-ID: <202512152026.RbMJV6C4-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 7a30292ffa2a048271755fdf9364e11343315271 soundwire: generic_bandwidth_allocation: select data lane
date:   12 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-051-20251215 (https://download.01.org/0day-ci/archive/20251215/202512152026.RbMJV6C4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512152026.RbMJV6C4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soundwire/generic_bandwidth_allocation.c:495:29-33: ERROR: invalid reference to the index variable of the iterator on line 462

vim +495 drivers/soundwire/generic_bandwidth_allocation.c

7a30292ffa2a04 Bard Liao            2024-12-18  414  
9026118f20e28f Bard Liao            2020-09-08  415  /**
9026118f20e28f Bard Liao            2020-09-08  416   * sdw_compute_bus_params: Compute bus parameters
9026118f20e28f Bard Liao            2020-09-08  417   *
9026118f20e28f Bard Liao            2020-09-08  418   * @bus: SDW Bus instance
9026118f20e28f Bard Liao            2020-09-08  419   */
9026118f20e28f Bard Liao            2020-09-08  420  static int sdw_compute_bus_params(struct sdw_bus *bus)
9026118f20e28f Bard Liao            2020-09-08  421  {
5ec3215e56af8f Dan Carpenter        2020-09-23  422  	struct sdw_master_prop *mstr_prop = &bus->prop;
7a30292ffa2a04 Bard Liao            2024-12-18  423  	struct sdw_slave_prop *slave_prop;
7a30292ffa2a04 Bard Liao            2024-12-18  424  	struct sdw_port_runtime *m_p_rt;
7a30292ffa2a04 Bard Liao            2024-12-18  425  	struct sdw_port_runtime *s_p_rt;
7a30292ffa2a04 Bard Liao            2024-12-18  426  	struct sdw_master_runtime *m_rt;
7a30292ffa2a04 Bard Liao            2024-12-18  427  	struct sdw_slave_runtime *s_rt;
7a30292ffa2a04 Bard Liao            2024-12-18  428  	unsigned int curr_dr_freq = 0;
7a30292ffa2a04 Bard Liao            2024-12-18  429  	int i, l, clk_values, ret;
9026118f20e28f Bard Liao            2020-09-08  430  	bool is_gear = false;
7a30292ffa2a04 Bard Liao            2024-12-18  431  	int m_lane = 0;
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
3ddd303f4725b6 Bard Liao            2024-12-18  446  	/* If dynamic scaling is not supported, don't try higher freq */
3ddd303f4725b6 Bard Liao            2024-12-18  447  	if (!is_clock_scaling_supported(bus))
3ddd303f4725b6 Bard Liao            2024-12-18  448  		clk_values = 1;
3ddd303f4725b6 Bard Liao            2024-12-18  449  
9026118f20e28f Bard Liao            2020-09-08  450  	for (i = 0; i < clk_values; i++) {
9026118f20e28f Bard Liao            2020-09-08  451  		if (!clk_buf)
55d50ace6b88eb Bard Liao            2023-11-27  452  			curr_dr_freq = bus->params.max_dr_freq;
9026118f20e28f Bard Liao            2020-09-08  453  		else
9026118f20e28f Bard Liao            2020-09-08  454  			curr_dr_freq = (is_gear) ?
55d50ace6b88eb Bard Liao            2023-11-27  455  				(bus->params.max_dr_freq >>  clk_buf[i]) :
9026118f20e28f Bard Liao            2020-09-08  456  				clk_buf[i] * SDW_DOUBLE_RATE_FACTOR;
9026118f20e28f Bard Liao            2020-09-08  457  
7a30292ffa2a04 Bard Liao            2024-12-18  458  		if (curr_dr_freq * (mstr_prop->default_col - 1) >=
4a7927d54d2c81 Bard Liao            2024-12-18  459  		    bus->params.bandwidth * mstr_prop->default_col)
9026118f20e28f Bard Liao            2020-09-08  460  			break;
9026118f20e28f Bard Liao            2020-09-08  461  
7a30292ffa2a04 Bard Liao            2024-12-18 @462  		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
7a30292ffa2a04 Bard Liao            2024-12-18  463  			/*
7a30292ffa2a04 Bard Liao            2024-12-18  464  			 * Get the first s_rt that will be used to find the available lane that
7a30292ffa2a04 Bard Liao            2024-12-18  465  			 * can be used. No need to check all Peripherals because we can't use
7a30292ffa2a04 Bard Liao            2024-12-18  466  			 * multi-lane if we can't find any available lane for the first Peripheral.
7a30292ffa2a04 Bard Liao            2024-12-18  467  			 */
7a30292ffa2a04 Bard Liao            2024-12-18  468  			s_rt = list_first_entry(&m_rt->slave_rt_list,
7a30292ffa2a04 Bard Liao            2024-12-18  469  						struct sdw_slave_runtime, m_rt_node);
7a30292ffa2a04 Bard Liao            2024-12-18  470  
7a30292ffa2a04 Bard Liao            2024-12-18  471  			/*
7a30292ffa2a04 Bard Liao            2024-12-18  472  			 * Find the available Manager lane that connected to the first Peripheral.
7a30292ffa2a04 Bard Liao            2024-12-18  473  			 */
7a30292ffa2a04 Bard Liao            2024-12-18  474  			m_lane = get_manager_lane(bus, m_rt, s_rt, curr_dr_freq);
7a30292ffa2a04 Bard Liao            2024-12-18  475  			if (m_lane > 0)
7a30292ffa2a04 Bard Liao            2024-12-18  476  				goto out;
7a30292ffa2a04 Bard Liao            2024-12-18  477  		}
7a30292ffa2a04 Bard Liao            2024-12-18  478  
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
7a30292ffa2a04 Bard Liao            2024-12-18  491  out:
7a30292ffa2a04 Bard Liao            2024-12-18  492  	/* multilane can be used */
7a30292ffa2a04 Bard Liao            2024-12-18  493  	if (m_lane > 0) {
7a30292ffa2a04 Bard Liao            2024-12-18  494  		/* Set Peripheral lanes */
7a30292ffa2a04 Bard Liao            2024-12-18 @495  		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
7a30292ffa2a04 Bard Liao            2024-12-18  496  			slave_prop = &s_rt->slave->prop;
7a30292ffa2a04 Bard Liao            2024-12-18  497  			for (l = 1; l < SDW_MAX_LANES; l++) {
7a30292ffa2a04 Bard Liao            2024-12-18  498  				if (slave_prop->lane_maps[l] == m_lane) {
7a30292ffa2a04 Bard Liao            2024-12-18  499  					list_for_each_entry(s_p_rt, &s_rt->port_list, port_node) {
7a30292ffa2a04 Bard Liao            2024-12-18  500  						s_p_rt->lane = l;
7a30292ffa2a04 Bard Liao            2024-12-18  501  						dev_dbg(&s_rt->slave->dev,
7a30292ffa2a04 Bard Liao            2024-12-18  502  							"Set P lane %d for port %d\n",
7a30292ffa2a04 Bard Liao            2024-12-18  503  							l, s_p_rt->num);
7a30292ffa2a04 Bard Liao            2024-12-18  504  					}
7a30292ffa2a04 Bard Liao            2024-12-18  505  					break;
7a30292ffa2a04 Bard Liao            2024-12-18  506  				}
7a30292ffa2a04 Bard Liao            2024-12-18  507  			}
7a30292ffa2a04 Bard Liao            2024-12-18  508  		}
7a30292ffa2a04 Bard Liao            2024-12-18  509  		/*
7a30292ffa2a04 Bard Liao            2024-12-18  510  		 * Set Manager lanes. Configure the last m_rt in bus->m_rt_list only since
7a30292ffa2a04 Bard Liao            2024-12-18  511  		 * we don't want to touch other m_rts that are already working.
7a30292ffa2a04 Bard Liao            2024-12-18  512  		 */
7a30292ffa2a04 Bard Liao            2024-12-18  513  		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node) {
7a30292ffa2a04 Bard Liao            2024-12-18  514  			m_p_rt->lane = m_lane;
7a30292ffa2a04 Bard Liao            2024-12-18  515  		}
7a30292ffa2a04 Bard Liao            2024-12-18  516  	}
9026118f20e28f Bard Liao            2020-09-08  517  
3ddd303f4725b6 Bard Liao            2024-12-18  518  	if (!mstr_prop->default_frame_rate || !mstr_prop->default_row)
3ddd303f4725b6 Bard Liao            2024-12-18  519  		return -EINVAL;
3ddd303f4725b6 Bard Liao            2024-12-18  520  
3ddd303f4725b6 Bard Liao            2024-12-18  521  	mstr_prop->default_col = curr_dr_freq / mstr_prop->default_frame_rate /
3ddd303f4725b6 Bard Liao            2024-12-18  522  				 mstr_prop->default_row;
3ddd303f4725b6 Bard Liao            2024-12-18  523  
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
