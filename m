Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8D51F03E7
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334270; cv=none; b=ZQxSkapxX5atvRfoI71WeGQjQR4Iwj/XGCb9Km5trvGGQUVfEUx/KoUvn39P5bgCOHQ1PEIQhGH1fUj5LhNnpfIJqzhHAdMqAY1QVI2cHU45CxOmEllN7zNnb2cIBZD7FB1AMr+EfsleLYyVp2m1o7LY9vBIzVHzAKzJ5zRH8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334270; c=relaxed/simple;
	bh=DpPDCwm6LUxe5PVzhjrWdp5Dj81BriN47GXK3/vtDxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uGH6qun/rjexgELG8WXARnLitTgXKaBZq2W46tL+xC04NqA+aLdNZJB+TFR+vUF6SeqLao/1oIK1KQCoYuseTMKTdOA4FuRF4wwhqzURV5oAOvwGUI77T7yC9L7mW28Lk78jnwjCAutM00WbNBhQH0CN0ZOwQ1ltSxTE7z+YzVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNKvbwm2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNKvbwm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733334268; x=1764870268;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DpPDCwm6LUxe5PVzhjrWdp5Dj81BriN47GXK3/vtDxw=;
  b=VNKvbwm2dfMb5H3K49bnInYvYxKH/q48JB35JuzNuwHJcwBpC/aijLF1
   D2WqhlqjqQARLZGoYkXZUJxMNJocmSJFx0AsPMljGZ+Zk7hIUYItiEP9z
   d4TJudhV95jvLbeywZQIUUSUWv70hLWPO3E/mqbsFVyLX37fHxiIqJCIZ
   nTPC+s6Z/jlzuJzbdzEOMWet5X6rOJlZavibRW9A8f7HZ1iFZuZfp9o1y
   v6V/fLd0YBDocnjlnNxpQfRBJZuQT5e/7hZ/UMgKdxWD7NcjuIyCsanBl
   S5G3g6EilnUdr2ctnIwbk/JZ226o/qW0x+c8Y3Jgs1OMtxzLDFUuSX/5E
   w==;
X-CSE-ConnectionGUID: YNFxJn4hRsC4by9ADV0J4A==
X-CSE-MsgGUID: bK0z9gdZTeiHByu0uJkh6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51032700"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="51032700"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 09:44:26 -0800
X-CSE-ConnectionGUID: apyFDperRH6ODIWVctMlmg==
X-CSE-MsgGUID: WmUYm9fbRqCYIDeHfecjCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="117083527"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2024 09:44:25 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tItQE-0003Lh-1y;
	Wed, 04 Dec 2024 17:44:22 +0000
Date: Thu, 5 Dec 2024 01:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH 4/7] drm/dp_mst: Fix down request message timeout handling
Message-ID: <202412050138.abkJCtMV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241203160223.2926014-5-imre.deak@intel.com>
References: <20241203160223.2926014-5-imre.deak@intel.com>
TO: Imre Deak <imre.deak@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: Lyude Paul <lyude@redhat.com>

Hi Imre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip drm-misc/drm-misc-next v6.13-rc1 next-20241204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Imre-Deak/drm-dp_mst-Fix-resetting-msg-rx-state-after-topology-removal/20241204-154110
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241203160223.2926014-5-imre.deak%40intel.com
patch subject: [PATCH 4/7] drm/dp_mst: Fix down request message timeout handling
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: loongarch-randconfig-r053-20241204 (https://download.01.org/0day-ci/archive/20241205/202412050138.abkJCtMV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412050138.abkJCtMV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:4029:1-7: preceding lock on line 3983

vim +4029 drivers/gpu/drm/display/drm_dp_mst_topology.c

379d09d98603332 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  3968  
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  3969  static int drm_dp_mst_handle_down_rep(struct drm_dp_mst_topology_mgr *mgr)
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  3970  {
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  3971  	struct drm_dp_sideband_msg_tx *txmsg;
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  3972  	struct drm_dp_mst_branch *mstb = NULL;
d308a881a5917bd drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2020-04-24  3973  	struct drm_dp_sideband_msg_rx *msg = &mgr->down_rep_recv;
8b1e589d138c8ad drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2019-09-03  3974  
d308a881a5917bd drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2020-04-24  3975  	if (!drm_dp_get_one_sb_msg(mgr, false, &mstb))
1241aedb6b5c7a5 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2022-12-14  3976  		goto out_clear_reply;
8b1e589d138c8ad drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2019-09-03  3977  
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  3978  	/* Multi-packet message transmission, don't clear the reply */
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  3979  	if (!msg->have_eomt)
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  3980  		goto out;
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  3981  
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  3982  	/* find the message */
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05 @3983  	mutex_lock(&mgr->qlock);
44f9b5beb0ac16f drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  3984  
d308a881a5917bd drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2020-04-24  3985  	txmsg = list_first_entry_or_null(&mgr->tx_msg_downq,
d308a881a5917bd drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2020-04-24  3986  					 struct drm_dp_sideband_msg_tx, next);
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  3987  
d308a881a5917bd drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2020-04-24  3988  	/* Were we actually expecting a response, and from this mstb? */
d308a881a5917bd drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2020-04-24  3989  	if (!txmsg || txmsg->dst != mstb) {
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  3990  		struct drm_dp_sideband_msg_hdr *hdr;
948de84233d32be drivers/gpu/drm/drm_dp_mst_topology.c         Suraj Upadhyay 2020-07-02  3991  
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  3992  		hdr = &msg->initial_hdr;
3a08f53dcf17e7c drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2021-04-23  3993  		drm_dbg_kms(mgr->dev, "Got MST reply with no msg %p %d %d %02x %02x\n",
3a08f53dcf17e7c drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2021-04-23  3994  			    mstb, hdr->seqno, hdr->lct, hdr->rad[0], msg->msg[0]);
44f9b5beb0ac16f drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  3995  
44f9b5beb0ac16f drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  3996  		mutex_unlock(&mgr->qlock);
44f9b5beb0ac16f drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  3997  
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  3998  		goto out_clear_reply;
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  3999  	}
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  4000  
379d09d98603332 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  4001  	if (!verify_rx_request_type(mgr, txmsg, msg))
379d09d98603332 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  4002  		goto out_clear_reply;
379d09d98603332 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  4003  
3a08f53dcf17e7c drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2021-04-23  4004  	drm_dp_sideband_parse_reply(mgr, msg, &txmsg->reply);
45bbda1e35f4943 drivers/gpu/drm/drm_dp_mst_topology.c         Ville Syrjälä  2019-01-22  4005  
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  4006  	if (txmsg->reply.reply_type == DP_SIDEBAND_REPLY_NAK) {
3a08f53dcf17e7c drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2021-04-23  4007  		drm_dbg_kms(mgr->dev,
3a08f53dcf17e7c drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2021-04-23  4008  			    "Got NAK reply: req 0x%02x (%s), reason 0x%02x (%s), nak data 0x%02x\n",
3dadbd2957eb8da drivers/gpu/drm/drm_dp_mst_topology.c         Ville Syrjälä  2019-01-22  4009  			    txmsg->reply.req_type,
3dadbd2957eb8da drivers/gpu/drm/drm_dp_mst_topology.c         Ville Syrjälä  2019-01-22  4010  			    drm_dp_mst_req_type_str(txmsg->reply.req_type),
3dadbd2957eb8da drivers/gpu/drm/drm_dp_mst_topology.c         Ville Syrjälä  2019-01-22  4011  			    txmsg->reply.u.nak.reason,
3dadbd2957eb8da drivers/gpu/drm/drm_dp_mst_topology.c         Ville Syrjälä  2019-01-22  4012  			    drm_dp_mst_nak_reason_str(txmsg->reply.u.nak.reason),
3dadbd2957eb8da drivers/gpu/drm/drm_dp_mst_topology.c         Ville Syrjälä  2019-01-22  4013  			    txmsg->reply.u.nak.nak_data);
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  4014  	}
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  4015  
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  4016  	txmsg->state = DRM_DP_SIDEBAND_TX_RX;
d308a881a5917bd drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2020-04-24  4017  	list_del(&txmsg->next);
44f9b5beb0ac16f drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  4018  
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  4019  	mutex_unlock(&mgr->qlock);
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  4020  
68e989dc044346a drivers/gpu/drm/drm_dp_mst_topology.c         Chris Wilson   2017-05-13  4021  	wake_up_all(&mgr->tx_waitq);
8b1e589d138c8ad drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2019-09-03  4022  
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  4023  out_clear_reply:
e7984b743523aa6 drivers/gpu/drm/display/drm_dp_mst_topology.c Imre Deak      2024-12-03  4024  	reset_msg_rx_state(msg);
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  4025  out:
fbc821c4a506a96 drivers/gpu/drm/drm_dp_mst_topology.c         Sean Paul      2020-02-13  4026  	if (mstb)
8b1e589d138c8ad drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2019-09-03  4027  		drm_dp_mst_topology_put_mstb(mstb);
8b1e589d138c8ad drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2019-09-03  4028  
8b1e589d138c8ad drivers/gpu/drm/drm_dp_mst_topology.c         Lyude Paul     2019-09-03 @4029  	return 0;
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  4030  }
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c         Dave Airlie    2014-06-05  4031  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
