Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FBC384
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Jul 2023 02:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690682417; x=1722218417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZhUmYAHa1sTWxbpOe9QjzEcFDiyL9hGVqVAQA9zQT0k=;
  b=IxqgzrIWQJ63p103JV1HtKkMA1tO6LeIEWBnFOTnSlK2Q4QkbXe7G4hD
   oPnmuHRUhXXy7KmMA2XnybPH3l3sZ+n2z8LK4dizRNLhFa6y5nlKGP18k
   VgBZRUtsdSXoEjPunKuNdkTtMJ/PVT/cs3O023sZSiThSrL15Vy6+R0oX
   Qjx1jhSiYmtC/P5aIxmQTu3St2/EtNTLR3Y9Bcog9NAlqYdkD3oKGT4nZ
   FK+92ImWa8QjK3x/hqZUvCK9nAjBmBAr7aVBRBvaGe0sgJ/QjfAp+oLhE
   TauCqxjXStFqqrNNCYLu2Pu0wSq5DaZsH7aqfJoBYRVo5bEyT8mEa74JV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="368814738"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="368814738"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 19:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="757551921"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="757551921"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Jul 2023 19:00:15 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPvjC-0004NX-0R;
	Sun, 30 Jul 2023 02:00:14 +0000
Date: Sun, 30 Jul 2023 09:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tnguy-next-queue:dev-queue 20/51]
 drivers/net/ethernet/intel/ice/ice_ptp_hw.c:2181
 ice_read_phy_and_phc_time_e822() warn: if statement not indented
Message-ID: <202307300951.kWJSF1tX-lkp@intel.com>
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
CC: Intel Wired LAN <intel-wired-lan@lists.osuosl.org>
TO: Sergey Temerkhanov <sergey.temerkhanov@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   79dc5308c824de000283d82a4496567bbedae5db
commit: a9c0311851c4ab40093e5c629881499f2639f229 [20/51] ice: prefix clock timer command enumeration values with ICE_PTP
:::::: branch date: 28 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021-20230728 (https://download.01.org/0day-ci/archive/20230730/202307300951.kWJSF1tX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307300951.kWJSF1tX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307300951.kWJSF1tX-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_ptp_hw.c:2181 ice_read_phy_and_phc_time_e822() warn: if statement not indented

vim +2181 drivers/net/ethernet/intel/ice/ice_ptp_hw.c

a69f1cb62aeced Jacob Keller       2021-10-13  2154  
3a7496234d179a Jacob Keller       2021-10-13  2155  /**
3a7496234d179a Jacob Keller       2021-10-13  2156   * ice_read_phy_and_phc_time_e822 - Simultaneously capture PHC and PHY time
3a7496234d179a Jacob Keller       2021-10-13  2157   * @hw: pointer to the HW struct
3a7496234d179a Jacob Keller       2021-10-13  2158   * @port: the PHY port to read
3a7496234d179a Jacob Keller       2021-10-13  2159   * @phy_time: on return, the 64bit PHY timer value
3a7496234d179a Jacob Keller       2021-10-13  2160   * @phc_time: on return, the lower 64bits of PHC time
3a7496234d179a Jacob Keller       2021-10-13  2161   *
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2162   * Issue a ICE_PTP_READ_TIME timer command to simultaneously capture the PHY
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2163   * and PHC timer values.
3a7496234d179a Jacob Keller       2021-10-13  2164   */
3a7496234d179a Jacob Keller       2021-10-13  2165  static int
3a7496234d179a Jacob Keller       2021-10-13  2166  ice_read_phy_and_phc_time_e822(struct ice_hw *hw, u8 port, u64 *phy_time,
3a7496234d179a Jacob Keller       2021-10-13  2167  			       u64 *phc_time)
3a7496234d179a Jacob Keller       2021-10-13  2168  {
3a7496234d179a Jacob Keller       2021-10-13  2169  	u64 tx_time, rx_time;
3a7496234d179a Jacob Keller       2021-10-13  2170  	u32 zo, lo;
3a7496234d179a Jacob Keller       2021-10-13  2171  	u8 tmr_idx;
3a7496234d179a Jacob Keller       2021-10-13  2172  	int err;
3a7496234d179a Jacob Keller       2021-10-13  2173  
3a7496234d179a Jacob Keller       2021-10-13  2174  	tmr_idx = ice_get_ptp_src_clock_index(hw);
3a7496234d179a Jacob Keller       2021-10-13  2175  
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2176  	/* Prepare the PHC timer for a ICE_PTP_READ_TIME capture command */
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2177  	ice_ptp_src_cmd(hw, ICE_PTP_READ_TIME);
3a7496234d179a Jacob Keller       2021-10-13  2178  
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2179  	/* Prepare the PHY timer for a ICE_PTP_READ_TIME capture command */
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2180  	err = ice_ptp_one_port_cmd(hw, port, ICE_PTP_READ_TIME);
3a7496234d179a Jacob Keller       2021-10-13 @2181  	if (err)
3a7496234d179a Jacob Keller       2021-10-13  2182  
a9c0311851c4ab Sergey Temerkhanov 2023-07-10  2183  	/* Issue the sync to start the ICE_PTP_READ_TIME capture */
3a7496234d179a Jacob Keller       2021-10-13  2184  	ice_ptp_exec_tmr_cmd(hw);
3a7496234d179a Jacob Keller       2021-10-13  2185  
3a7496234d179a Jacob Keller       2021-10-13  2186  	/* Read the captured PHC time from the shadow time registers */
3a7496234d179a Jacob Keller       2021-10-13  2187  	zo = rd32(hw, GLTSYN_SHTIME_0(tmr_idx));
3a7496234d179a Jacob Keller       2021-10-13  2188  	lo = rd32(hw, GLTSYN_SHTIME_L(tmr_idx));
3a7496234d179a Jacob Keller       2021-10-13  2189  	*phc_time = (u64)lo << 32 | zo;
3a7496234d179a Jacob Keller       2021-10-13  2190  
3a7496234d179a Jacob Keller       2021-10-13  2191  	/* Read the captured PHY time from the PHY shadow registers */
3a7496234d179a Jacob Keller       2021-10-13  2192  	err = ice_ptp_read_port_capture(hw, port, &tx_time, &rx_time);
3a7496234d179a Jacob Keller       2021-10-13  2193  	if (err)
3a7496234d179a Jacob Keller       2021-10-13  2194  		return err;
3a7496234d179a Jacob Keller       2021-10-13  2195  
3a7496234d179a Jacob Keller       2021-10-13  2196  	/* If the PHY Tx and Rx timers don't match, log a warning message.
3a7496234d179a Jacob Keller       2021-10-13  2197  	 * Note that this should not happen in normal circumstances since the
3a7496234d179a Jacob Keller       2021-10-13  2198  	 * driver always programs them together.
3a7496234d179a Jacob Keller       2021-10-13  2199  	 */
3a7496234d179a Jacob Keller       2021-10-13  2200  	if (tx_time != rx_time)
3a7496234d179a Jacob Keller       2021-10-13  2201  		dev_warn(ice_hw_to_dev(hw),
3a7496234d179a Jacob Keller       2021-10-13  2202  			 "PHY port %u Tx and Rx timers do not match, tx_time 0x%016llX, rx_time 0x%016llX\n",
3a7496234d179a Jacob Keller       2021-10-13  2203  			 port, (unsigned long long)tx_time,
3a7496234d179a Jacob Keller       2021-10-13  2204  			 (unsigned long long)rx_time);
3a7496234d179a Jacob Keller       2021-10-13  2205  
3a7496234d179a Jacob Keller       2021-10-13  2206  	*phy_time = tx_time;
3a7496234d179a Jacob Keller       2021-10-13  2207  
3a7496234d179a Jacob Keller       2021-10-13  2208  	return 0;
3a7496234d179a Jacob Keller       2021-10-13  2209  }
3a7496234d179a Jacob Keller       2021-10-13  2210  

:::::: The code at line 2181 was first introduced by commit
:::::: 3a7496234d179a7dd6a7bb152f62422c3f38e15a ice: implement basic E822 PTP support

:::::: TO: Jacob Keller <jacob.e.keller@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
