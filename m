Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B153F9CC
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Sep 2023 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695990428; x=1727526428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjAHwUU025dGvux2CZ/w5V6XCPsEvDWUDSyATo/yGOo=;
  b=UiUs9MNvN8Gp+Xqze3vKXL5m6IdiaA3Ii8hgtqVzSdRkp477cqQy7ZBq
   ihNoor4Wk3awVirg5RdFgctppuj8uFUNFey6tE1zECeLr7t0aHYcvHSrT
   qHJVHbct8uEXvwteAE3Bc9THIDjF9fMCyJY9mVpneIaBgHSA78ew0+P65
   T8fl4jDql9KZXAQ9jmL50Q4xELkbsvaTY8Jtfyfy6OJxlpP4S4QrVYUf8
   S0xsGr+HRNrS3EK0y+uFngB3CGMkl6pypDiDZQoAmzjJt8cL4JHXKzlb3
   tbTf7m23kF01rONVh5PfL8U7VF/Y0wtCEOzvicKjNdKmkCdgFm/qMD39Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446443998"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="446443998"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 05:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="726577443"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="726577443"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Sep 2023 05:27:06 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmCaF-0002qz-2w;
	Fri, 29 Sep 2023 12:27:03 +0000
Date: Fri, 29 Sep 2023 20:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 209/1370]
 drivers/ptp/ptp_xilinx.c:251:24: sparse: sparse: shift too big (47) for type
 unsigned long
Message-ID: <202309292036.dG0XP3IK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/ptp/ptp_xilinx.c:251:24: sparse: sparse: shift too big (47) for type unsigned long"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Harini Katakam <harini.katakam@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: b8dc3b1039ae479b6fe43682bbe923d43ba4d578 [209/1370] ptp: Add Xilinx PTP timer driver
:::::: branch date: 7 days ago
:::::: commit date: 9 months ago
config: i386-randconfig-061-20230929 (https://download.01.org/0day-ci/archive/20230929/202309292036.dG0XP3IK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309292036.dG0XP3IK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309292036.dG0XP3IK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ptp/ptp_xilinx.c:251:24: sparse: sparse: shift too big (47) for type unsigned long
>> drivers/ptp/ptp_xilinx.c:114:51: sparse: sparse: shift count is negative (-16)
   drivers/ptp/ptp_xilinx.c:388:50: sparse: sparse: shift count is negative (-16)

vim +251 drivers/ptp/ptp_xilinx.c

b8dc3b1039ae47 Harini Katakam 2020-09-24   96  
b8dc3b1039ae47 Harini Katakam 2020-09-24   97  /*
b8dc3b1039ae47 Harini Katakam 2020-09-24   98   * Inline timer helpers
b8dc3b1039ae47 Harini Katakam 2020-09-24   99   */
b8dc3b1039ae47 Harini Katakam 2020-09-24  100  static inline void xlnx_tod_read(struct xlnx_ptp_timer *timer,
b8dc3b1039ae47 Harini Katakam 2020-09-24  101  				 struct timespec64 *ts)
b8dc3b1039ae47 Harini Katakam 2020-09-24  102  {
b8dc3b1039ae47 Harini Katakam 2020-09-24  103  	u32 sech, secl, nsec;
b8dc3b1039ae47 Harini Katakam 2020-09-24  104  
b8dc3b1039ae47 Harini Katakam 2020-09-24  105  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_SNAPSHOT_OFFSET,
b8dc3b1039ae47 Harini Katakam 2020-09-24  106  		     XPTPTIMER_SNAPSHOT_MASK);
b8dc3b1039ae47 Harini Katakam 2020-09-24  107  
b8dc3b1039ae47 Harini Katakam 2020-09-24  108  	/* use TX port here */
b8dc3b1039ae47 Harini Katakam 2020-09-24  109  	nsec = xlnx_ptp_ior(timer, XPTPTIMER_PORT_TX_NS_SNAP_OFFSET);
b8dc3b1039ae47 Harini Katakam 2020-09-24  110  	secl = xlnx_ptp_ior(timer, XPTPTIMER_PORT_TX_SEC_0_SNAP_OFFSET);
b8dc3b1039ae47 Harini Katakam 2020-09-24  111  	sech = xlnx_ptp_ior(timer, XPTPTIMER_PORT_TX_SEC_1_SNAP_OFFSET);
b8dc3b1039ae47 Harini Katakam 2020-09-24  112  
b8dc3b1039ae47 Harini Katakam 2020-09-24  113  	ts->tv_nsec = nsec;
b8dc3b1039ae47 Harini Katakam 2020-09-24 @114  	ts->tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
b8dc3b1039ae47 Harini Katakam 2020-09-24  115  }
b8dc3b1039ae47 Harini Katakam 2020-09-24  116  
b8dc3b1039ae47 Harini Katakam 2020-09-24  117  static inline void xlnx_port_offset_write(struct xlnx_ptp_timer *timer,
b8dc3b1039ae47 Harini Katakam 2020-09-24  118  					  const struct timespec64 *ts)
b8dc3b1039ae47 Harini Katakam 2020-09-24  119  {
b8dc3b1039ae47 Harini Katakam 2020-09-24  120  	int i;
b8dc3b1039ae47 Harini Katakam 2020-09-24  121  
b8dc3b1039ae47 Harini Katakam 2020-09-24  122  	xlnx_ptp_iow(timer, PORT0_SEC_OFFSET_0,
b8dc3b1039ae47 Harini Katakam 2020-09-24  123  		     lower_32_bits(ts->tv_sec));
b8dc3b1039ae47 Harini Katakam 2020-09-24  124  	xlnx_ptp_iow(timer, PORT0_SEC_OFFSET_1,
b8dc3b1039ae47 Harini Katakam 2020-09-24  125  		     upper_32_bits(ts->tv_sec));
b8dc3b1039ae47 Harini Katakam 2020-09-24  126  	/*
b8dc3b1039ae47 Harini Katakam 2020-09-24  127  	 * Two writes are done to PORT0_NS_OFFSET_0 due to IP behavior which
b8dc3b1039ae47 Harini Katakam 2020-09-24  128  	 * uses the same as trigger to accept the whole offset value.
b8dc3b1039ae47 Harini Katakam 2020-09-24  129  	 */
b8dc3b1039ae47 Harini Katakam 2020-09-24  130  	for (i = 0; i < 2; i++) {
b8dc3b1039ae47 Harini Katakam 2020-09-24  131  		xlnx_ptp_iow(timer, PORT0_NS_OFFSET_0,
b8dc3b1039ae47 Harini Katakam 2020-09-24  132  			     (u32)(ts->tv_nsec));
b8dc3b1039ae47 Harini Katakam 2020-09-24  133  	}
b8dc3b1039ae47 Harini Katakam 2020-09-24  134  }
b8dc3b1039ae47 Harini Katakam 2020-09-24  135  
b8dc3b1039ae47 Harini Katakam 2020-09-24  136  static inline void xlnx_tod_offset_write(struct xlnx_ptp_timer *timer,
b8dc3b1039ae47 Harini Katakam 2020-09-24  137  					 const struct timespec64 *ts)
b8dc3b1039ae47 Harini Katakam 2020-09-24  138  {
b8dc3b1039ae47 Harini Katakam 2020-09-24  139  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_SEC_SYS_OFST_1_OFFSET,
b8dc3b1039ae47 Harini Katakam 2020-09-24  140  		     upper_32_bits(ts->tv_sec));
b8dc3b1039ae47 Harini Katakam 2020-09-24  141  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_SEC_SYS_OFST_0_OFFSET,
b8dc3b1039ae47 Harini Katakam 2020-09-24  142  		     lower_32_bits(ts->tv_sec));
b8dc3b1039ae47 Harini Katakam 2020-09-24  143  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_NS_SYS_OFST_OFFSET,
b8dc3b1039ae47 Harini Katakam 2020-09-24  144  		     (u32)(ts->tv_nsec));
b8dc3b1039ae47 Harini Katakam 2020-09-24  145  
b8dc3b1039ae47 Harini Katakam 2020-09-24  146  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_LOAD_OFFSET,
b8dc3b1039ae47 Harini Katakam 2020-09-24  147  		     XPTPTIMER_LOAD_OFFSET_MASK);
b8dc3b1039ae47 Harini Katakam 2020-09-24  148  }
b8dc3b1039ae47 Harini Katakam 2020-09-24  149  
b8dc3b1039ae47 Harini Katakam 2020-09-24  150  static inline void xlnx_tod_load_write(struct xlnx_ptp_timer *timer,
b8dc3b1039ae47 Harini Katakam 2020-09-24  151  				       const struct timespec64 *ts)
b8dc3b1039ae47 Harini Katakam 2020-09-24  152  {
b8dc3b1039ae47 Harini Katakam 2020-09-24  153  	struct timespec64 offset;
b8dc3b1039ae47 Harini Katakam 2020-09-24  154  
b8dc3b1039ae47 Harini Katakam 2020-09-24  155  	offset.tv_sec = 0;
b8dc3b1039ae47 Harini Katakam 2020-09-24  156  	offset.tv_nsec = 0;
b8dc3b1039ae47 Harini Katakam 2020-09-24  157  
b8dc3b1039ae47 Harini Katakam 2020-09-24  158  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_SEC_1_OFFSET,
b8dc3b1039ae47 Harini Katakam 2020-09-24  159  		     upper_32_bits(ts->tv_sec));
b8dc3b1039ae47 Harini Katakam 2020-09-24  160  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_SEC_0_OFFSET,
b8dc3b1039ae47 Harini Katakam 2020-09-24  161  		     lower_32_bits(ts->tv_sec));
b8dc3b1039ae47 Harini Katakam 2020-09-24  162  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_NS_OFFSET, ts->tv_nsec);
b8dc3b1039ae47 Harini Katakam 2020-09-24  163  
b8dc3b1039ae47 Harini Katakam 2020-09-24  164  	/* Make sure offset registers are cleared */
b8dc3b1039ae47 Harini Katakam 2020-09-24  165  	xlnx_tod_offset_write(timer, &offset);
b8dc3b1039ae47 Harini Katakam 2020-09-24  166  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_LOAD_OFFSET,
b8dc3b1039ae47 Harini Katakam 2020-09-24  167  		     XPTPTIMER_LOAD_OFFSET_MASK);
b8dc3b1039ae47 Harini Katakam 2020-09-24  168  
b8dc3b1039ae47 Harini Katakam 2020-09-24  169  	xlnx_ptp_iow(timer, XPTPTIMER_TOD_SW_LOAD_OFFSET,
b8dc3b1039ae47 Harini Katakam 2020-09-24  170  		     XPTPTIMER_LOAD_TOD_MASK);
b8dc3b1039ae47 Harini Katakam 2020-09-24  171  	xlnx_port_offset_write(timer, &offset);
b8dc3b1039ae47 Harini Katakam 2020-09-24  172  	timer->timeoffset = 0;
b8dc3b1039ae47 Harini Katakam 2020-09-24  173  }
b8dc3b1039ae47 Harini Katakam 2020-09-24  174  
b8dc3b1039ae47 Harini Katakam 2020-09-24  175  static inline void xlnx_tod_period_write(struct xlnx_ptp_timer *timer, u64 adj)
b8dc3b1039ae47 Harini Katakam 2020-09-24  176  {
b8dc3b1039ae47 Harini Katakam 2020-09-24  177  	u32 adjhigh = upper_32_bits(adj);
b8dc3b1039ae47 Harini Katakam 2020-09-24  178  
b8dc3b1039ae47 Harini Katakam 2020-09-24  179  	xlnx_ptp_iow(timer, TOD_SYS_PERIOD_0, (u32)(adj));
b8dc3b1039ae47 Harini Katakam 2020-09-24  180  	xlnx_ptp_iow(timer, TOD_SYS_PERIOD_1, adjhigh);
b8dc3b1039ae47 Harini Katakam 2020-09-24  181  }
b8dc3b1039ae47 Harini Katakam 2020-09-24  182  
b8dc3b1039ae47 Harini Katakam 2020-09-24  183  static inline void xlnx_port_period_write(struct xlnx_ptp_timer *timer, u64 adj)
b8dc3b1039ae47 Harini Katakam 2020-09-24  184  {
b8dc3b1039ae47 Harini Katakam 2020-09-24  185  	u32 adjhigh = upper_32_bits(adj);
b8dc3b1039ae47 Harini Katakam 2020-09-24  186  
b8dc3b1039ae47 Harini Katakam 2020-09-24  187  	xlnx_ptp_iow(timer, XPTPTIMER_PORT_TX_PERIOD_0_OFFSET, (u32)(adj));
b8dc3b1039ae47 Harini Katakam 2020-09-24  188  	xlnx_ptp_iow(timer, XPTPTIMER_PORT_RX_PERIOD_0_OFFSET, (u32)(adj));
b8dc3b1039ae47 Harini Katakam 2020-09-24  189  	spin_lock(&timer->reg_lock);
b8dc3b1039ae47 Harini Katakam 2020-09-24  190  	xlnx_ptp_iow(timer, XPTPTIMER_PORT_TX_PERIOD_1_OFFSET, adjhigh);
b8dc3b1039ae47 Harini Katakam 2020-09-24  191  	xlnx_ptp_iow(timer, XPTPTIMER_PORT_RX_PERIOD_1_OFFSET, adjhigh);
b8dc3b1039ae47 Harini Katakam 2020-09-24  192  
b8dc3b1039ae47 Harini Katakam 2020-09-24  193  	spin_unlock(&timer->reg_lock);
b8dc3b1039ae47 Harini Katakam 2020-09-24  194  }
b8dc3b1039ae47 Harini Katakam 2020-09-24  195  
b8dc3b1039ae47 Harini Katakam 2020-09-24  196  /*
b8dc3b1039ae47 Harini Katakam 2020-09-24  197   * PTP clock operations
b8dc3b1039ae47 Harini Katakam 2020-09-24  198   */
b8dc3b1039ae47 Harini Katakam 2020-09-24  199  /**
b8dc3b1039ae47 Harini Katakam 2020-09-24  200   * xlnx_ptp_adjfine - Fine adjustment of the frequency on the hardware clock
b8dc3b1039ae47 Harini Katakam 2020-09-24  201   * @ptp: ptp clock structure
b8dc3b1039ae47 Harini Katakam 2020-09-24  202   * @scaled_ppm: signed scaled parts per million for frequency adjustment.
b8dc3b1039ae47 Harini Katakam 2020-09-24  203   * Return: 0 on success
b8dc3b1039ae47 Harini Katakam 2020-09-24  204   * TX and RX port periods are reloaded with the adjusted value.
b8dc3b1039ae47 Harini Katakam 2020-09-24  205   *
b8dc3b1039ae47 Harini Katakam 2020-09-24  206   */
b8dc3b1039ae47 Harini Katakam 2020-09-24  207  static int xlnx_ptp_adjfine(struct ptp_clock_info *ptp, long scaled_ppm)
b8dc3b1039ae47 Harini Katakam 2020-09-24  208  {
b8dc3b1039ae47 Harini Katakam 2020-09-24  209  	struct xlnx_ptp_timer *timer = container_of(ptp, struct xlnx_ptp_timer,
b8dc3b1039ae47 Harini Katakam 2020-09-24  210  					ptp_clock_info);
b8dc3b1039ae47 Harini Katakam 2020-09-24  211  	bool neg_adj = false;
b8dc3b1039ae47 Harini Katakam 2020-09-24  212  	u64 adj;
b8dc3b1039ae47 Harini Katakam 2020-09-24  213  
b8dc3b1039ae47 Harini Katakam 2020-09-24  214  	if (scaled_ppm < 0) {
b8dc3b1039ae47 Harini Katakam 2020-09-24  215  		neg_adj = true;
b8dc3b1039ae47 Harini Katakam 2020-09-24  216  		scaled_ppm = -scaled_ppm;
b8dc3b1039ae47 Harini Katakam 2020-09-24  217  	}
b8dc3b1039ae47 Harini Katakam 2020-09-24  218  
b8dc3b1039ae47 Harini Katakam 2020-09-24  219  	adj = mul_u64_u32_div(timer->incr, scaled_ppm, USEC_PER_SEC);
b8dc3b1039ae47 Harini Katakam 2020-09-24  220  	adj >>= PPM_FRACTION; /* remove fractions */
b8dc3b1039ae47 Harini Katakam 2020-09-24  221  	adj = neg_adj ? (timer->incr - adj) : (timer->incr + adj);
b8dc3b1039ae47 Harini Katakam 2020-09-24  222  
b8dc3b1039ae47 Harini Katakam 2020-09-24  223  	xlnx_port_period_write(timer, adj);
b8dc3b1039ae47 Harini Katakam 2020-09-24  224  
b8dc3b1039ae47 Harini Katakam 2020-09-24  225  	return 0;
b8dc3b1039ae47 Harini Katakam 2020-09-24  226  }
b8dc3b1039ae47 Harini Katakam 2020-09-24  227  
b8dc3b1039ae47 Harini Katakam 2020-09-24  228  /**
b8dc3b1039ae47 Harini Katakam 2020-09-24  229   * xlnx_ptp_adjtime - Adjust the current time on the hardware clock
b8dc3b1039ae47 Harini Katakam 2020-09-24  230   * @ptp: ptp clock structure
b8dc3b1039ae47 Harini Katakam 2020-09-24  231   * @delta: signed time in ns to be adjusted.
b8dc3b1039ae47 Harini Katakam 2020-09-24  232   * Return: 0 on success
b8dc3b1039ae47 Harini Katakam 2020-09-24  233   * System, TX and RX ports are reloaded with the adjusted time.
b8dc3b1039ae47 Harini Katakam 2020-09-24  234   *
b8dc3b1039ae47 Harini Katakam 2020-09-24  235   */
b8dc3b1039ae47 Harini Katakam 2020-09-24  236  static int xlnx_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
b8dc3b1039ae47 Harini Katakam 2020-09-24  237  {
b8dc3b1039ae47 Harini Katakam 2020-09-24  238  	struct xlnx_ptp_timer *timer = container_of(ptp, struct xlnx_ptp_timer,
b8dc3b1039ae47 Harini Katakam 2020-09-24  239  						ptp_clock_info);
b8dc3b1039ae47 Harini Katakam 2020-09-24  240  	struct timespec64 offset;
b8dc3b1039ae47 Harini Katakam 2020-09-24  241  	u64 sign = 0;
b8dc3b1039ae47 Harini Katakam 2020-09-24  242  	s64 cumulative_delta = timer->timeoffset;
b8dc3b1039ae47 Harini Katakam 2020-09-24  243  
b8dc3b1039ae47 Harini Katakam 2020-09-24  244  	spin_lock(&timer->reg_lock);
b8dc3b1039ae47 Harini Katakam 2020-09-24  245  
b8dc3b1039ae47 Harini Katakam 2020-09-24  246  	/* Fixed offset between system and port timer */
b8dc3b1039ae47 Harini Katakam 2020-09-24  247  	delta += timer->static_delay;
b8dc3b1039ae47 Harini Katakam 2020-09-24  248  	cumulative_delta += delta;
b8dc3b1039ae47 Harini Katakam 2020-09-24  249  	timer->timeoffset = cumulative_delta;
b8dc3b1039ae47 Harini Katakam 2020-09-24  250  	if (cumulative_delta < 0) {
b8dc3b1039ae47 Harini Katakam 2020-09-24 @251  		sign = XPTPTIMER_TOD_OFFSET_NEG;
b8dc3b1039ae47 Harini Katakam 2020-09-24  252  		cumulative_delta = -cumulative_delta;
b8dc3b1039ae47 Harini Katakam 2020-09-24  253  	}
b8dc3b1039ae47 Harini Katakam 2020-09-24  254  	offset = ns_to_timespec64(cumulative_delta);
b8dc3b1039ae47 Harini Katakam 2020-09-24  255  	offset.tv_sec |= sign;
b8dc3b1039ae47 Harini Katakam 2020-09-24  256  
b8dc3b1039ae47 Harini Katakam 2020-09-24  257  	xlnx_port_offset_write(timer, (const struct timespec64 *)&offset);
b8dc3b1039ae47 Harini Katakam 2020-09-24  258  
b8dc3b1039ae47 Harini Katakam 2020-09-24  259  	spin_unlock(&timer->reg_lock);
b8dc3b1039ae47 Harini Katakam 2020-09-24  260  
b8dc3b1039ae47 Harini Katakam 2020-09-24  261  	return 0;
b8dc3b1039ae47 Harini Katakam 2020-09-24  262  }
b8dc3b1039ae47 Harini Katakam 2020-09-24  263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
