Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B602171C0
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jun 2023 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687271481; x=1718807481;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JaewBelpYdta1zzOLDZ2boR2ZD9DeaR0lHuX26238wc=;
  b=Elt12yT0i3+SPMvYGF61Z0nqGs4OKOBuBMixFiZ/VQz7ONtri44zeP26
   b0N/iSLgwKfqo9mstSHlJBnbZat89cSBIJGN4DnKmcX4TgMbroSTkLoBc
   /GyI8sJN42LgFNDvOOEYikGFeflXfyD7r6QzY+hqqvcw3km7qxnaGOVpT
   xfGu6lNx+xRUUZw06cM6au7sTBZw3m2mkeUj/oK0GZIRCV5dseN5jwjMR
   cImzw2KdXQo8xFHx5OuyP+A0+Ay/A+NPRb1jCc08044Wb0TI+EMmYnprq
   3emhYZ/2vUvzvHE6q2teM1/VcfZOmTDyvBs+YjU6K2MrYH4Tz21P06YqO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="446247386"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="446247386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 07:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="691448026"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="691448026"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jun 2023 07:31:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBcO5-0005wS-1V;
	Tue, 20 Jun 2023 14:31:17 +0000
Date: Tue, 20 Jun 2023 22:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-gfx] [NOT_FOR_REVIEW PATCH] drm/i915/display/dp: On AUX
 xfer timeout restart freshly
Message-ID: <202306202254.gDsAIwsn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230620052350.991394-1-arun.r.murthy@intel.com>
References: <20230620052350.991394-1-arun.r.murthy@intel.com>
TO: Arun R Murthy <arun.r.murthy@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: jani.nikula@intel.com

Hi Arun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-i915-display-dp-On-AUX-xfer-timeout-restart-freshly/20230620-133304
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230620052350.991394-1-arun.r.murthy%40intel.com
patch subject: [Intel-gfx] [NOT_FOR_REVIEW PATCH] drm/i915/display/dp: On AUX xfer timeout restart freshly
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-m001-20230620 (https://download.01.org/0day-ci/archive/20230620/202306202254.gDsAIwsn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202254.gDsAIwsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306202254.gDsAIwsn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_dp_aux.c:345 intel_dp_aux_xfer() error: uninitialized symbol 'status'.

vim +/status +345 drivers/gpu/drm/i915/display/intel_dp_aux.c

aa850fb1c8793a Jani Nikula   2021-01-20  209  
aa850fb1c8793a Jani Nikula   2021-01-20  210  static int
aa850fb1c8793a Jani Nikula   2021-01-20  211  intel_dp_aux_xfer(struct intel_dp *intel_dp,
aa850fb1c8793a Jani Nikula   2021-01-20  212  		  const u8 *send, int send_bytes,
aa850fb1c8793a Jani Nikula   2021-01-20  213  		  u8 *recv, int recv_size,
aa850fb1c8793a Jani Nikula   2021-01-20  214  		  u32 aux_send_ctl_flags)
aa850fb1c8793a Jani Nikula   2021-01-20  215  {
aa850fb1c8793a Jani Nikula   2021-01-20  216  	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
aa850fb1c8793a Jani Nikula   2021-01-20  217  	struct drm_i915_private *i915 =
aa850fb1c8793a Jani Nikula   2021-01-20  218  			to_i915(dig_port->base.base.dev);
aa850fb1c8793a Jani Nikula   2021-01-20  219  	enum phy phy = intel_port_to_phy(i915, dig_port->base.port);
aa850fb1c8793a Jani Nikula   2021-01-20  220  	bool is_tc_port = intel_phy_is_tc(i915, phy);
aa850fb1c8793a Jani Nikula   2021-01-20  221  	i915_reg_t ch_ctl, ch_data[5];
aa850fb1c8793a Jani Nikula   2021-01-20  222  	u32 aux_clock_divider;
aa850fb1c8793a Jani Nikula   2021-01-20  223  	enum intel_display_power_domain aux_domain;
aa850fb1c8793a Jani Nikula   2021-01-20  224  	intel_wakeref_t aux_wakeref;
aa850fb1c8793a Jani Nikula   2021-01-20  225  	intel_wakeref_t pps_wakeref;
aa850fb1c8793a Jani Nikula   2021-01-20  226  	int i, ret, recv_bytes;
aa850fb1c8793a Jani Nikula   2021-01-20  227  	int try, clock = 0;
aa850fb1c8793a Jani Nikula   2021-01-20  228  	u32 status;
b29e02a545ba29 Arun R Murthy 2023-06-20  229  	u32 send_ctl;
aa850fb1c8793a Jani Nikula   2021-01-20  230  	bool vdd;
aa850fb1c8793a Jani Nikula   2021-01-20  231  
aa850fb1c8793a Jani Nikula   2021-01-20  232  	ch_ctl = intel_dp->aux_ch_ctl_reg(intel_dp);
aa850fb1c8793a Jani Nikula   2021-01-20  233  	for (i = 0; i < ARRAY_SIZE(ch_data); i++)
aa850fb1c8793a Jani Nikula   2021-01-20  234  		ch_data[i] = intel_dp->aux_ch_data_reg(intel_dp, i);
aa850fb1c8793a Jani Nikula   2021-01-20  235  
a972cd3f0eb50b Imre Deak     2023-03-16  236  	if (is_tc_port) {
aa850fb1c8793a Jani Nikula   2021-01-20  237  		intel_tc_port_lock(dig_port);
a972cd3f0eb50b Imre Deak     2023-03-16  238  		/*
a972cd3f0eb50b Imre Deak     2023-03-16  239  		 * Abort transfers on a disconnected port as required by
a972cd3f0eb50b Imre Deak     2023-03-16  240  		 * DP 1.4a link CTS 4.2.1.5, also avoiding the long AUX
a972cd3f0eb50b Imre Deak     2023-03-16  241  		 * timeouts that would otherwise happen.
a972cd3f0eb50b Imre Deak     2023-03-16  242  		 * TODO: abort the transfer on non-TC ports as well.
a972cd3f0eb50b Imre Deak     2023-03-16  243  		 */
a972cd3f0eb50b Imre Deak     2023-03-16  244  		if (!intel_tc_port_connected_locked(&dig_port->base)) {
a972cd3f0eb50b Imre Deak     2023-03-16  245  			ret = -ENXIO;
a972cd3f0eb50b Imre Deak     2023-03-16  246  			goto out_unlock;
a972cd3f0eb50b Imre Deak     2023-03-16  247  		}
a972cd3f0eb50b Imre Deak     2023-03-16  248  	}
aa850fb1c8793a Jani Nikula   2021-01-20  249  
aa850fb1c8793a Jani Nikula   2021-01-20  250  	aux_domain = intel_aux_power_domain(dig_port);
aa850fb1c8793a Jani Nikula   2021-01-20  251  
aa850fb1c8793a Jani Nikula   2021-01-20  252  	aux_wakeref = intel_display_power_get(i915, aux_domain);
aa850fb1c8793a Jani Nikula   2021-01-20  253  	pps_wakeref = intel_pps_lock(intel_dp);
aa850fb1c8793a Jani Nikula   2021-01-20  254  
aa850fb1c8793a Jani Nikula   2021-01-20  255  	/*
aa850fb1c8793a Jani Nikula   2021-01-20  256  	 * We will be called with VDD already enabled for dpcd/edid/oui reads.
aa850fb1c8793a Jani Nikula   2021-01-20  257  	 * In such cases we want to leave VDD enabled and it's up to upper layers
aa850fb1c8793a Jani Nikula   2021-01-20  258  	 * to turn it off. But for eg. i2c-dev access we need to turn it on/off
aa850fb1c8793a Jani Nikula   2021-01-20  259  	 * ourselves.
aa850fb1c8793a Jani Nikula   2021-01-20  260  	 */
aa850fb1c8793a Jani Nikula   2021-01-20  261  	vdd = intel_pps_vdd_on_unlocked(intel_dp);
aa850fb1c8793a Jani Nikula   2021-01-20  262  
aa850fb1c8793a Jani Nikula   2021-01-20  263  	/*
aa850fb1c8793a Jani Nikula   2021-01-20  264  	 * dp aux is extremely sensitive to irq latency, hence request the
aa850fb1c8793a Jani Nikula   2021-01-20  265  	 * lowest possible wakeup latency and so prevent the cpu from going into
aa850fb1c8793a Jani Nikula   2021-01-20  266  	 * deep sleep states.
aa850fb1c8793a Jani Nikula   2021-01-20  267  	 */
aa850fb1c8793a Jani Nikula   2021-01-20  268  	cpu_latency_qos_update_request(&intel_dp->pm_qos, 0);
aa850fb1c8793a Jani Nikula   2021-01-20  269  
aa850fb1c8793a Jani Nikula   2021-01-20  270  	intel_pps_check_power_unlocked(intel_dp);
aa850fb1c8793a Jani Nikula   2021-01-20  271  
da57e3d6ed433b Ville Syrjälä 2023-04-11  272  	/*
da57e3d6ed433b Ville Syrjälä 2023-04-11  273  	 * FIXME PSR should be disabled here to prevent
da57e3d6ed433b Ville Syrjälä 2023-04-11  274  	 * it using the same AUX CH simultaneously
da57e3d6ed433b Ville Syrjälä 2023-04-11  275  	 */
da57e3d6ed433b Ville Syrjälä 2023-04-11  276  
b29e02a545ba29 Arun R Murthy 2023-06-20  277  	/* Only 5 data registers! */
b29e02a545ba29 Arun R Murthy 2023-06-20  278  	if (drm_WARN_ON(&i915->drm, send_bytes > 20 || recv_size > 20)) {
b29e02a545ba29 Arun R Murthy 2023-06-20  279  		ret = -E2BIG;
b29e02a545ba29 Arun R Murthy 2023-06-20  280  		goto out;
aa850fb1c8793a Jani Nikula   2021-01-20  281  	}
b29e02a545ba29 Arun R Murthy 2023-06-20  282  
b29e02a545ba29 Arun R Murthy 2023-06-20  283  	while ((aux_clock_divider = intel_dp->get_aux_clock_divider(intel_dp, clock++))) {
b29e02a545ba29 Arun R Murthy 2023-06-20  284  		/* FIXME: Must try at least 3 times according to DP spec */
b29e02a545ba29 Arun R Murthy 2023-06-20  285  		for (try = 0; try < 5; try++) {
b29e02a545ba29 Arun R Murthy 2023-06-20  286  			send_ctl = intel_dp->get_aux_send_ctl(intel_dp,
b29e02a545ba29 Arun R Murthy 2023-06-20  287  							      send_bytes,
b29e02a545ba29 Arun R Murthy 2023-06-20  288  							      aux_clock_divider);
b29e02a545ba29 Arun R Murthy 2023-06-20  289  			send_ctl |= aux_send_ctl_flags;
b29e02a545ba29 Arun R Murthy 2023-06-20  290  
b29e02a545ba29 Arun R Murthy 2023-06-20  291  			/* Try to wait for any previous AUX channel activity */
b29e02a545ba29 Arun R Murthy 2023-06-20  292  			status = intel_dp_aux_wait_done(intel_dp);
aa850fb1c8793a Jani Nikula   2021-01-20  293  			/* just trace the final value */
aa850fb1c8793a Jani Nikula   2021-01-20  294  			trace_i915_reg_rw(false, ch_ctl, status, sizeof(status), true);
aa850fb1c8793a Jani Nikula   2021-01-20  295  
b29e02a545ba29 Arun R Murthy 2023-06-20  296  			if (status & DP_AUX_CH_CTL_SEND_BUSY) {
aa850fb1c8793a Jani Nikula   2021-01-20  297  				drm_WARN(&i915->drm, 1,
b29e02a545ba29 Arun R Murthy 2023-06-20  298  					 "%s: not started, previous Tx still in process (status 0x%08x)\n",
aa850fb1c8793a Jani Nikula   2021-01-20  299  					 intel_dp->aux.name, status);
aa850fb1c8793a Jani Nikula   2021-01-20  300  				intel_dp->aux_busy_last_status = status;
b29e02a545ba29 Arun R Murthy 2023-06-20  301  				if (try > 3) {
aa850fb1c8793a Jani Nikula   2021-01-20  302  					ret = -EBUSY;
aa850fb1c8793a Jani Nikula   2021-01-20  303  					goto out;
b29e02a545ba29 Arun R Murthy 2023-06-20  304  				} else {
b29e02a545ba29 Arun R Murthy 2023-06-20  305  					continue;
aa850fb1c8793a Jani Nikula   2021-01-20  306  				}
aa850fb1c8793a Jani Nikula   2021-01-20  307  			}
aa850fb1c8793a Jani Nikula   2021-01-20  308  
aa850fb1c8793a Jani Nikula   2021-01-20  309  			/* Load the send data into the aux channel data registers */
aa850fb1c8793a Jani Nikula   2021-01-20  310  			for (i = 0; i < send_bytes; i += 4)
ec2593e3075b13 Jani Nikula   2022-12-07  311  				intel_de_write(i915, ch_data[i >> 2],
2616be2eac4b1c Jani Nikula   2022-01-12  312  					       intel_dp_aux_pack(send + i,
aa850fb1c8793a Jani Nikula   2021-01-20  313  								 send_bytes - i));
aa850fb1c8793a Jani Nikula   2021-01-20  314  
aa850fb1c8793a Jani Nikula   2021-01-20  315  			/* Send the command and wait for it to complete */
ec2593e3075b13 Jani Nikula   2022-12-07  316  			intel_de_write(i915, ch_ctl, send_ctl);
aa850fb1c8793a Jani Nikula   2021-01-20  317  
b29e02a545ba29 Arun R Murthy 2023-06-20  318  			/* TODO: if typeC then 4.2ms else 800us. For DG2 add 1.5ms for both cases */
aa850fb1c8793a Jani Nikula   2021-01-20  319  			status = intel_dp_aux_wait_done(intel_dp);
aa850fb1c8793a Jani Nikula   2021-01-20  320  
aa850fb1c8793a Jani Nikula   2021-01-20  321  			/* Clear done status and any errors */
ec2593e3075b13 Jani Nikula   2022-12-07  322  			intel_de_write(i915, ch_ctl,
ec2593e3075b13 Jani Nikula   2022-12-07  323  				       status | DP_AUX_CH_CTL_DONE |
aa850fb1c8793a Jani Nikula   2021-01-20  324  				       DP_AUX_CH_CTL_TIME_OUT_ERROR |
aa850fb1c8793a Jani Nikula   2021-01-20  325  				       DP_AUX_CH_CTL_RECEIVE_ERROR);
aa850fb1c8793a Jani Nikula   2021-01-20  326  
aa850fb1c8793a Jani Nikula   2021-01-20  327  			/*
aa850fb1c8793a Jani Nikula   2021-01-20  328  			 * DP CTS 1.2 Core Rev 1.1, 4.2.1.1 & 4.2.1.2
aa850fb1c8793a Jani Nikula   2021-01-20  329  			 *   400us delay required for errors and timeouts
aa850fb1c8793a Jani Nikula   2021-01-20  330  			 *   Timeout errors from the HW already meet this
aa850fb1c8793a Jani Nikula   2021-01-20  331  			 *   requirement so skip to next iteration
aa850fb1c8793a Jani Nikula   2021-01-20  332  			 */
aa850fb1c8793a Jani Nikula   2021-01-20  333  			if (status & DP_AUX_CH_CTL_TIME_OUT_ERROR)
aa850fb1c8793a Jani Nikula   2021-01-20  334  				continue;
aa850fb1c8793a Jani Nikula   2021-01-20  335  
aa850fb1c8793a Jani Nikula   2021-01-20  336  			if (status & DP_AUX_CH_CTL_RECEIVE_ERROR) {
aa850fb1c8793a Jani Nikula   2021-01-20  337  				usleep_range(400, 500);
aa850fb1c8793a Jani Nikula   2021-01-20  338  				continue;
aa850fb1c8793a Jani Nikula   2021-01-20  339  			}
aa850fb1c8793a Jani Nikula   2021-01-20  340  			if (status & DP_AUX_CH_CTL_DONE)
aa850fb1c8793a Jani Nikula   2021-01-20  341  				goto done;
aa850fb1c8793a Jani Nikula   2021-01-20  342  		}
aa850fb1c8793a Jani Nikula   2021-01-20  343  	}
aa850fb1c8793a Jani Nikula   2021-01-20  344  
aa850fb1c8793a Jani Nikula   2021-01-20 @345  	if ((status & DP_AUX_CH_CTL_DONE) == 0) {
aa850fb1c8793a Jani Nikula   2021-01-20  346  		drm_err(&i915->drm, "%s: not done (status 0x%08x)\n",
aa850fb1c8793a Jani Nikula   2021-01-20  347  			intel_dp->aux.name, status);
aa850fb1c8793a Jani Nikula   2021-01-20  348  		ret = -EBUSY;
aa850fb1c8793a Jani Nikula   2021-01-20  349  		goto out;
aa850fb1c8793a Jani Nikula   2021-01-20  350  	}
aa850fb1c8793a Jani Nikula   2021-01-20  351  
aa850fb1c8793a Jani Nikula   2021-01-20  352  done:
aa850fb1c8793a Jani Nikula   2021-01-20  353  	/*
aa850fb1c8793a Jani Nikula   2021-01-20  354  	 * Check for timeout or receive error. Timeouts occur when the sink is
aa850fb1c8793a Jani Nikula   2021-01-20  355  	 * not connected.
aa850fb1c8793a Jani Nikula   2021-01-20  356  	 */
aa850fb1c8793a Jani Nikula   2021-01-20  357  	if (status & DP_AUX_CH_CTL_RECEIVE_ERROR) {
aa850fb1c8793a Jani Nikula   2021-01-20  358  		drm_err(&i915->drm, "%s: receive error (status 0x%08x)\n",
aa850fb1c8793a Jani Nikula   2021-01-20  359  			intel_dp->aux.name, status);
aa850fb1c8793a Jani Nikula   2021-01-20  360  		ret = -EIO;
aa850fb1c8793a Jani Nikula   2021-01-20  361  		goto out;
aa850fb1c8793a Jani Nikula   2021-01-20  362  	}
aa850fb1c8793a Jani Nikula   2021-01-20  363  
aa850fb1c8793a Jani Nikula   2021-01-20  364  	/*
aa850fb1c8793a Jani Nikula   2021-01-20  365  	 * Timeouts occur when the device isn't connected, so they're "normal"
aa850fb1c8793a Jani Nikula   2021-01-20  366  	 * -- don't fill the kernel log with these
aa850fb1c8793a Jani Nikula   2021-01-20  367  	 */
aa850fb1c8793a Jani Nikula   2021-01-20  368  	if (status & DP_AUX_CH_CTL_TIME_OUT_ERROR) {
aa850fb1c8793a Jani Nikula   2021-01-20  369  		drm_dbg_kms(&i915->drm, "%s: timeout (status 0x%08x)\n",
aa850fb1c8793a Jani Nikula   2021-01-20  370  			    intel_dp->aux.name, status);
aa850fb1c8793a Jani Nikula   2021-01-20  371  		ret = -ETIMEDOUT;
aa850fb1c8793a Jani Nikula   2021-01-20  372  		goto out;
aa850fb1c8793a Jani Nikula   2021-01-20  373  	}
aa850fb1c8793a Jani Nikula   2021-01-20  374  
aa850fb1c8793a Jani Nikula   2021-01-20  375  	/* Unload any bytes sent back from the other side */
0cad796a226997 Ville Syrjälä 2023-05-09  376  	recv_bytes = REG_FIELD_GET(DP_AUX_CH_CTL_MESSAGE_SIZE_MASK, status);
aa850fb1c8793a Jani Nikula   2021-01-20  377  
aa850fb1c8793a Jani Nikula   2021-01-20  378  	/*
aa850fb1c8793a Jani Nikula   2021-01-20  379  	 * By BSpec: "Message sizes of 0 or >20 are not allowed."
aa850fb1c8793a Jani Nikula   2021-01-20  380  	 * We have no idea of what happened so we return -EBUSY so
aa850fb1c8793a Jani Nikula   2021-01-20  381  	 * drm layer takes care for the necessary retries.
aa850fb1c8793a Jani Nikula   2021-01-20  382  	 */
aa850fb1c8793a Jani Nikula   2021-01-20  383  	if (recv_bytes == 0 || recv_bytes > 20) {
aa850fb1c8793a Jani Nikula   2021-01-20  384  		drm_dbg_kms(&i915->drm,
aa850fb1c8793a Jani Nikula   2021-01-20  385  			    "%s: Forbidden recv_bytes = %d on aux transaction\n",
aa850fb1c8793a Jani Nikula   2021-01-20  386  			    intel_dp->aux.name, recv_bytes);
aa850fb1c8793a Jani Nikula   2021-01-20  387  		ret = -EBUSY;
aa850fb1c8793a Jani Nikula   2021-01-20  388  		goto out;
aa850fb1c8793a Jani Nikula   2021-01-20  389  	}
aa850fb1c8793a Jani Nikula   2021-01-20  390  
aa850fb1c8793a Jani Nikula   2021-01-20  391  	if (recv_bytes > recv_size)
aa850fb1c8793a Jani Nikula   2021-01-20  392  		recv_bytes = recv_size;
aa850fb1c8793a Jani Nikula   2021-01-20  393  
aa850fb1c8793a Jani Nikula   2021-01-20  394  	for (i = 0; i < recv_bytes; i += 4)
ec2593e3075b13 Jani Nikula   2022-12-07  395  		intel_dp_aux_unpack(intel_de_read(i915, ch_data[i >> 2]),
aa850fb1c8793a Jani Nikula   2021-01-20  396  				    recv + i, recv_bytes - i);
aa850fb1c8793a Jani Nikula   2021-01-20  397  
aa850fb1c8793a Jani Nikula   2021-01-20  398  	ret = recv_bytes;
aa850fb1c8793a Jani Nikula   2021-01-20  399  out:
aa850fb1c8793a Jani Nikula   2021-01-20  400  	cpu_latency_qos_update_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
aa850fb1c8793a Jani Nikula   2021-01-20  401  
aa850fb1c8793a Jani Nikula   2021-01-20  402  	if (vdd)
aa850fb1c8793a Jani Nikula   2021-01-20  403  		intel_pps_vdd_off_unlocked(intel_dp, false);
aa850fb1c8793a Jani Nikula   2021-01-20  404  
aa850fb1c8793a Jani Nikula   2021-01-20  405  	intel_pps_unlock(intel_dp, pps_wakeref);
aa850fb1c8793a Jani Nikula   2021-01-20  406  	intel_display_power_put_async(i915, aux_domain, aux_wakeref);
a972cd3f0eb50b Imre Deak     2023-03-16  407  out_unlock:
aa850fb1c8793a Jani Nikula   2021-01-20  408  	if (is_tc_port)
aa850fb1c8793a Jani Nikula   2021-01-20  409  		intel_tc_port_unlock(dig_port);
aa850fb1c8793a Jani Nikula   2021-01-20  410  
aa850fb1c8793a Jani Nikula   2021-01-20  411  	return ret;
aa850fb1c8793a Jani Nikula   2021-01-20  412  }
aa850fb1c8793a Jani Nikula   2021-01-20  413  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
