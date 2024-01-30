Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A939760ED9
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jan 2024 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706627486; cv=none; b=XcDRSBcMBztkYjEbzqtypqo+h86LbXpolWuxzEPFGyWQuwLDbUZF3tPDWuLeHy4bD9ZHPimU0A3lqqRv//TaGXugoOfUgQAKgm91nGplr1Kh4fFLFpcMUbuU0AwDAMv7BY1f0+i/TevJ6fjUV434QHh74ddxlIGTLi49q/hHHQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706627486; c=relaxed/simple;
	bh=2nyv1JatogQhaU34Zb/xBKrtg6HZSV8Mexn9XcTlja0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ByHB1MhXzcSC1JE8nkQ0sb6Y0CatAqU31SHm1q/3TRMWDCV9vgbGcFgDGKyW2UwzizK67Eui1gDwmQS5QnvYalrVh4RTWDNRn7Ir8qtvFY4c+82jgMbRVlC/AyoHL6ax8gdKSoBC/uJOVe9C+Y6KuwaVyJwTXLN3I1YC6M1D/TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CLFfilvC; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CLFfilvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706627483; x=1738163483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2nyv1JatogQhaU34Zb/xBKrtg6HZSV8Mexn9XcTlja0=;
  b=CLFfilvCJp+vCguDOHbK4G5LoBoGbAq1q3MLbCwHGRIYlaHMs7S6X+iI
   Mmc851pXGEshzpxxBgeDPMzpRxsQB+OLBtJH8W0qFrf3vjJK/ordg+Y8E
   33HF41LF9Zid1TA1pVsqdJvCK1u+YXodC4/MIi0wdAQxdlGmlJrzb6GIr
   vGtwlERZukWKk3kEVm/bTudhScW9b94KSh2Eg4PRDQPSFmz3vOVI+ZM8K
   F8OCkEUuavsAay9kPR/fK5v6SxBVVeUSePiLPIL7aZ6dyHMnuuLz2z/tV
   hm2s/b3ECLYioG9w4gGGx8fUywZ2+K185ySMSIeSOOKCJpJi8oMmEPSgX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393738615"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="393738615"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 07:05:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="961308837"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="961308837"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Jan 2024 07:05:35 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUpeP-0000QA-0D;
	Tue, 30 Jan 2024 15:04:42 +0000
Date: Tue, 30 Jan 2024 23:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Report taprio offload status
Message-ID: <202401302206.gC7tl5EJ-lkp@intel.com>
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
In-Reply-To: <20240127040443.24835-4-rohan.g.thomas@intel.com>
References: <20240127040443.24835-4-rohan.g.thomas@intel.com>
TO: Rohan G Thomas <rohan.g.thomas@intel.com>
TO: "David S . Miller" <davem@davemloft.net>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Jose Abreu <joabreu@synopsys.com>
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Giuseppe Cavallaro <peppe.cavallaro@st.com>
TO: Richard Cochran <richardcochran@gmail.com>
TO: Russell King <linux@armlinux.org.uk>
TO: Alexei Starovoitov <ast@kernel.org>
TO: Daniel Borkmann <daniel@iogearbox.net>
TO: Jesper Dangaard Brouer <hawk@kernel.org>
TO: John Fastabend <john.fastabend@gmail.com>
TO: Serge Semin <fancer.lancer@gmail.com>
CC: netdev@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: bpf@vger.kernel.org
CC: Rohan G Thomas <rohan.g.thomas@intel.com>

Hi Rohan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohan-G-Thomas/net-stmmac-Offload-queueMaxSDU-from-tc-taprio/20240127-121335
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240127040443.24835-4-rohan.g.thomas%40intel.com
patch subject: [PATCH net-next 3/3] net: stmmac: Report taprio offload status
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240129 (https://download.01.org/0day-ci/archive/20240130/202401302206.gC7tl5EJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401302206.gC7tl5EJ-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:992 tc_taprio_configure() warn: missing error code 'ret'

vim +/ret +992 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c

0abb4337860498 Rohan G Thomas       2024-01-27   939  
288189aa7250b4 Rohan G Thomas       2024-01-27   940  static int tc_taprio_configure(struct stmmac_priv *priv,
b60189e0392fa0 Jose Abreu           2019-12-18   941  			       struct tc_taprio_qopt_offload *qopt)
b60189e0392fa0 Jose Abreu           2019-12-18   942  {
b60189e0392fa0 Jose Abreu           2019-12-18   943  	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
b60189e0392fa0 Jose Abreu           2019-12-18   944  	struct plat_stmmacenet_data *plat = priv->plat;
e9e3720002f61c Xiaoliang Yang       2021-07-05   945  	struct timespec64 time, current_time, qopt_time;
fe28c53ed71d46 Yannick Vignon       2021-01-13   946  	ktime_t current_time_ns;
1ac14241543c01 Jose Abreu           2019-12-18   947  	bool fpe = false;
b60189e0392fa0 Jose Abreu           2019-12-18   948  	int i, ret = 0;
a1ec57c020201b Jose Abreu           2019-12-18   949  	u64 ctr;
b60189e0392fa0 Jose Abreu           2019-12-18   950  
6d534ee057b62c Michael Sit Wei Hong 2022-12-08   951  	if (qopt->base_time < 0)
6d534ee057b62c Michael Sit Wei Hong 2022-12-08   952  		return -ERANGE;
6d534ee057b62c Michael Sit Wei Hong 2022-12-08   953  
b60189e0392fa0 Jose Abreu           2019-12-18   954  	if (!priv->dma_cap.estsel)
b60189e0392fa0 Jose Abreu           2019-12-18   955  		return -EOPNOTSUPP;
b60189e0392fa0 Jose Abreu           2019-12-18   956  
b60189e0392fa0 Jose Abreu           2019-12-18   957  	switch (wid) {
b60189e0392fa0 Jose Abreu           2019-12-18   958  	case 0x1:
b60189e0392fa0 Jose Abreu           2019-12-18   959  		wid = 16;
b60189e0392fa0 Jose Abreu           2019-12-18   960  		break;
b60189e0392fa0 Jose Abreu           2019-12-18   961  	case 0x2:
b60189e0392fa0 Jose Abreu           2019-12-18   962  		wid = 20;
b60189e0392fa0 Jose Abreu           2019-12-18   963  		break;
b60189e0392fa0 Jose Abreu           2019-12-18   964  	case 0x3:
b60189e0392fa0 Jose Abreu           2019-12-18   965  		wid = 24;
b60189e0392fa0 Jose Abreu           2019-12-18   966  		break;
b60189e0392fa0 Jose Abreu           2019-12-18   967  	default:
b60189e0392fa0 Jose Abreu           2019-12-18   968  		return -EOPNOTSUPP;
b60189e0392fa0 Jose Abreu           2019-12-18   969  	}
b60189e0392fa0 Jose Abreu           2019-12-18   970  
b60189e0392fa0 Jose Abreu           2019-12-18   971  	switch (dep) {
b60189e0392fa0 Jose Abreu           2019-12-18   972  	case 0x1:
b60189e0392fa0 Jose Abreu           2019-12-18   973  		dep = 64;
b60189e0392fa0 Jose Abreu           2019-12-18   974  		break;
b60189e0392fa0 Jose Abreu           2019-12-18   975  	case 0x2:
b60189e0392fa0 Jose Abreu           2019-12-18   976  		dep = 128;
b60189e0392fa0 Jose Abreu           2019-12-18   977  		break;
b60189e0392fa0 Jose Abreu           2019-12-18   978  	case 0x3:
b60189e0392fa0 Jose Abreu           2019-12-18   979  		dep = 256;
b60189e0392fa0 Jose Abreu           2019-12-18   980  		break;
b60189e0392fa0 Jose Abreu           2019-12-18   981  	case 0x4:
b60189e0392fa0 Jose Abreu           2019-12-18   982  		dep = 512;
b60189e0392fa0 Jose Abreu           2019-12-18   983  		break;
b60189e0392fa0 Jose Abreu           2019-12-18   984  	case 0x5:
b60189e0392fa0 Jose Abreu           2019-12-18   985  		dep = 1024;
b60189e0392fa0 Jose Abreu           2019-12-18   986  		break;
b60189e0392fa0 Jose Abreu           2019-12-18   987  	default:
b60189e0392fa0 Jose Abreu           2019-12-18   988  		return -EOPNOTSUPP;
b60189e0392fa0 Jose Abreu           2019-12-18   989  	}
b60189e0392fa0 Jose Abreu           2019-12-18   990  
2d800bc500fb3f Vladimir Oltean      2023-05-30   991  	if (qopt->cmd == TAPRIO_CMD_DESTROY)
b60189e0392fa0 Jose Abreu           2019-12-18  @992  		goto disable;
2d800bc500fb3f Vladimir Oltean      2023-05-30   993  
b60189e0392fa0 Jose Abreu           2019-12-18   994  	if (qopt->num_entries >= dep)
b60189e0392fa0 Jose Abreu           2019-12-18   995  		return -EINVAL;
b60189e0392fa0 Jose Abreu           2019-12-18   996  	if (!qopt->cycle_time)
b60189e0392fa0 Jose Abreu           2019-12-18   997  		return -ERANGE;
9e95505fecb6b5 Rohan G Thomas       2023-12-01   998  	if (qopt->cycle_time_extension >= BIT(wid + 7))
9e95505fecb6b5 Rohan G Thomas       2023-12-01   999  		return -ERANGE;
b60189e0392fa0 Jose Abreu           2019-12-18  1000  
b60189e0392fa0 Jose Abreu           2019-12-18  1001  	if (!plat->est) {
b60189e0392fa0 Jose Abreu           2019-12-18  1002  		plat->est = devm_kzalloc(priv->device, sizeof(*plat->est),
b60189e0392fa0 Jose Abreu           2019-12-18  1003  					 GFP_KERNEL);
b60189e0392fa0 Jose Abreu           2019-12-18  1004  		if (!plat->est)
b60189e0392fa0 Jose Abreu           2019-12-18  1005  			return -ENOMEM;
b2aae654a4794e Xiaoliang Yang       2021-07-05  1006  
b2aae654a4794e Xiaoliang Yang       2021-07-05  1007  		mutex_init(&priv->plat->est->lock);
b60189e0392fa0 Jose Abreu           2019-12-18  1008  	} else {
b60189e0392fa0 Jose Abreu           2019-12-18  1009  		memset(plat->est, 0, sizeof(*plat->est));
b60189e0392fa0 Jose Abreu           2019-12-18  1010  	}
b60189e0392fa0 Jose Abreu           2019-12-18  1011  
b60189e0392fa0 Jose Abreu           2019-12-18  1012  	size = qopt->num_entries;
b60189e0392fa0 Jose Abreu           2019-12-18  1013  
b2aae654a4794e Xiaoliang Yang       2021-07-05  1014  	mutex_lock(&priv->plat->est->lock);
b60189e0392fa0 Jose Abreu           2019-12-18  1015  	priv->plat->est->gcl_size = size;
2d800bc500fb3f Vladimir Oltean      2023-05-30  1016  	priv->plat->est->enable = qopt->cmd == TAPRIO_CMD_REPLACE;
b2aae654a4794e Xiaoliang Yang       2021-07-05  1017  	mutex_unlock(&priv->plat->est->lock);
b60189e0392fa0 Jose Abreu           2019-12-18  1018  
b60189e0392fa0 Jose Abreu           2019-12-18  1019  	for (i = 0; i < size; i++) {
b60189e0392fa0 Jose Abreu           2019-12-18  1020  		s64 delta_ns = qopt->entries[i].interval;
b60189e0392fa0 Jose Abreu           2019-12-18  1021  		u32 gates = qopt->entries[i].gate_mask;
b60189e0392fa0 Jose Abreu           2019-12-18  1022  
b60189e0392fa0 Jose Abreu           2019-12-18  1023  		if (delta_ns > GENMASK(wid, 0))
b60189e0392fa0 Jose Abreu           2019-12-18  1024  			return -ERANGE;
b60189e0392fa0 Jose Abreu           2019-12-18  1025  		if (gates > GENMASK(31 - wid, 0))
b60189e0392fa0 Jose Abreu           2019-12-18  1026  			return -ERANGE;
1ac14241543c01 Jose Abreu           2019-12-18  1027  
1ac14241543c01 Jose Abreu           2019-12-18  1028  		switch (qopt->entries[i].command) {
1ac14241543c01 Jose Abreu           2019-12-18  1029  		case TC_TAPRIO_CMD_SET_GATES:
1ac14241543c01 Jose Abreu           2019-12-18  1030  			if (fpe)
1ac14241543c01 Jose Abreu           2019-12-18  1031  				return -EINVAL;
1ac14241543c01 Jose Abreu           2019-12-18  1032  			break;
1ac14241543c01 Jose Abreu           2019-12-18  1033  		case TC_TAPRIO_CMD_SET_AND_HOLD:
1ac14241543c01 Jose Abreu           2019-12-18  1034  			gates |= BIT(0);
1ac14241543c01 Jose Abreu           2019-12-18  1035  			fpe = true;
1ac14241543c01 Jose Abreu           2019-12-18  1036  			break;
1ac14241543c01 Jose Abreu           2019-12-18  1037  		case TC_TAPRIO_CMD_SET_AND_RELEASE:
1ac14241543c01 Jose Abreu           2019-12-18  1038  			gates &= ~BIT(0);
1ac14241543c01 Jose Abreu           2019-12-18  1039  			fpe = true;
1ac14241543c01 Jose Abreu           2019-12-18  1040  			break;
1ac14241543c01 Jose Abreu           2019-12-18  1041  		default:
b60189e0392fa0 Jose Abreu           2019-12-18  1042  			return -EOPNOTSUPP;
1ac14241543c01 Jose Abreu           2019-12-18  1043  		}
b60189e0392fa0 Jose Abreu           2019-12-18  1044  
b60189e0392fa0 Jose Abreu           2019-12-18  1045  		priv->plat->est->gcl[i] = delta_ns | (gates << wid);
b60189e0392fa0 Jose Abreu           2019-12-18  1046  	}
b60189e0392fa0 Jose Abreu           2019-12-18  1047  
b2aae654a4794e Xiaoliang Yang       2021-07-05  1048  	mutex_lock(&priv->plat->est->lock);
b60189e0392fa0 Jose Abreu           2019-12-18  1049  	/* Adjust for real system time */
fe28c53ed71d46 Yannick Vignon       2021-01-13  1050  	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
fe28c53ed71d46 Yannick Vignon       2021-01-13  1051  	current_time_ns = timespec64_to_ktime(current_time);
81c52c42afd92b Xiaoliang Yang       2021-07-05  1052  	time = stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
fe28c53ed71d46 Yannick Vignon       2021-01-13  1053  					qopt->cycle_time);
fe28c53ed71d46 Yannick Vignon       2021-01-13  1054  
b60189e0392fa0 Jose Abreu           2019-12-18  1055  	priv->plat->est->btr[0] = (u32)time.tv_nsec;
b60189e0392fa0 Jose Abreu           2019-12-18  1056  	priv->plat->est->btr[1] = (u32)time.tv_sec;
b60189e0392fa0 Jose Abreu           2019-12-18  1057  
e9e3720002f61c Xiaoliang Yang       2021-07-05  1058  	qopt_time = ktime_to_timespec64(qopt->base_time);
e9e3720002f61c Xiaoliang Yang       2021-07-05  1059  	priv->plat->est->btr_reserve[0] = (u32)qopt_time.tv_nsec;
e9e3720002f61c Xiaoliang Yang       2021-07-05  1060  	priv->plat->est->btr_reserve[1] = (u32)qopt_time.tv_sec;
e9e3720002f61c Xiaoliang Yang       2021-07-05  1061  
a1ec57c020201b Jose Abreu           2019-12-18  1062  	ctr = qopt->cycle_time;
a1ec57c020201b Jose Abreu           2019-12-18  1063  	priv->plat->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
a1ec57c020201b Jose Abreu           2019-12-18  1064  	priv->plat->est->ctr[1] = (u32)ctr;
b60189e0392fa0 Jose Abreu           2019-12-18  1065  
9e95505fecb6b5 Rohan G Thomas       2023-12-01  1066  	priv->plat->est->ter = qopt->cycle_time_extension;
9e95505fecb6b5 Rohan G Thomas       2023-12-01  1067  
0abb4337860498 Rohan G Thomas       2024-01-27  1068  	tc_taprio_map_maxsdu_txq(priv, qopt);
0abb4337860498 Rohan G Thomas       2024-01-27  1069  
b2aae654a4794e Xiaoliang Yang       2021-07-05  1070  	if (fpe && !priv->dma_cap.fpesel) {
b2aae654a4794e Xiaoliang Yang       2021-07-05  1071  		mutex_unlock(&priv->plat->est->lock);
1ac14241543c01 Jose Abreu           2019-12-18  1072  		return -EOPNOTSUPP;
b2aae654a4794e Xiaoliang Yang       2021-07-05  1073  	}
1ac14241543c01 Jose Abreu           2019-12-18  1074  
5a5586112b9295 Ong Boon Leong       2021-03-24  1075  	/* Actual FPE register configuration will be done after FPE handshake
5a5586112b9295 Ong Boon Leong       2021-03-24  1076  	 * is success.
5a5586112b9295 Ong Boon Leong       2021-03-24  1077  	 */
5a5586112b9295 Ong Boon Leong       2021-03-24  1078  	priv->plat->fpe_cfg->enable = fpe;
1ac14241543c01 Jose Abreu           2019-12-18  1079  
c3f3b97238f6fd Rohan G Thomas       2023-12-01  1080  	ret = stmmac_est_configure(priv, priv, priv->plat->est,
b60189e0392fa0 Jose Abreu           2019-12-18  1081  				   priv->plat->clk_ptp_rate);
b2aae654a4794e Xiaoliang Yang       2021-07-05  1082  	mutex_unlock(&priv->plat->est->lock);
b60189e0392fa0 Jose Abreu           2019-12-18  1083  	if (ret) {
b60189e0392fa0 Jose Abreu           2019-12-18  1084  		netdev_err(priv->dev, "failed to configure EST\n");
b60189e0392fa0 Jose Abreu           2019-12-18  1085  		goto disable;
b60189e0392fa0 Jose Abreu           2019-12-18  1086  	}
b60189e0392fa0 Jose Abreu           2019-12-18  1087  
b60189e0392fa0 Jose Abreu           2019-12-18  1088  	netdev_info(priv->dev, "configured EST\n");
5a5586112b9295 Ong Boon Leong       2021-03-24  1089  
5a5586112b9295 Ong Boon Leong       2021-03-24  1090  	if (fpe) {
5a5586112b9295 Ong Boon Leong       2021-03-24  1091  		stmmac_fpe_handshake(priv, true);
5a5586112b9295 Ong Boon Leong       2021-03-24  1092  		netdev_info(priv->dev, "start FPE handshake\n");
5a5586112b9295 Ong Boon Leong       2021-03-24  1093  	}
5a5586112b9295 Ong Boon Leong       2021-03-24  1094  
b60189e0392fa0 Jose Abreu           2019-12-18  1095  	return 0;
b60189e0392fa0 Jose Abreu           2019-12-18  1096  
b60189e0392fa0 Jose Abreu           2019-12-18  1097  disable:
82a44ae113b7b3 Wong Vee Khee        2021-08-20  1098  	if (priv->plat->est) {
b2aae654a4794e Xiaoliang Yang       2021-07-05  1099  		mutex_lock(&priv->plat->est->lock);
b60189e0392fa0 Jose Abreu           2019-12-18  1100  		priv->plat->est->enable = false;
c3f3b97238f6fd Rohan G Thomas       2023-12-01  1101  		stmmac_est_configure(priv, priv, priv->plat->est,
b60189e0392fa0 Jose Abreu           2019-12-18  1102  				     priv->plat->clk_ptp_rate);
288189aa7250b4 Rohan G Thomas       2024-01-27  1103  		/* Reset taprio status */
288189aa7250b4 Rohan G Thomas       2024-01-27  1104  		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
288189aa7250b4 Rohan G Thomas       2024-01-27  1105  			priv->xstats.max_sdu_txq_drop[i] = 0;
288189aa7250b4 Rohan G Thomas       2024-01-27  1106  			priv->xstats.mtl_est_txq_hlbf[i] = 0;
288189aa7250b4 Rohan G Thomas       2024-01-27  1107  		}
b2aae654a4794e Xiaoliang Yang       2021-07-05  1108  		mutex_unlock(&priv->plat->est->lock);
82a44ae113b7b3 Wong Vee Khee        2021-08-20  1109  	}
5a5586112b9295 Ong Boon Leong       2021-03-24  1110  
5a5586112b9295 Ong Boon Leong       2021-03-24  1111  	priv->plat->fpe_cfg->enable = false;
5a5586112b9295 Ong Boon Leong       2021-03-24  1112  	stmmac_fpe_configure(priv, priv->ioaddr,
37e4b8df27bc68 Jianheng Zhang       2023-12-01  1113  			     priv->plat->fpe_cfg,
5a5586112b9295 Ong Boon Leong       2021-03-24  1114  			     priv->plat->tx_queues_to_use,
5a5586112b9295 Ong Boon Leong       2021-03-24  1115  			     priv->plat->rx_queues_to_use,
5a5586112b9295 Ong Boon Leong       2021-03-24  1116  			     false);
5a5586112b9295 Ong Boon Leong       2021-03-24  1117  	netdev_info(priv->dev, "disabled FPE\n");
5a5586112b9295 Ong Boon Leong       2021-03-24  1118  
5a5586112b9295 Ong Boon Leong       2021-03-24  1119  	stmmac_fpe_handshake(priv, false);
5a5586112b9295 Ong Boon Leong       2021-03-24  1120  	netdev_info(priv->dev, "stop FPE handshake\n");
5a5586112b9295 Ong Boon Leong       2021-03-24  1121  
b60189e0392fa0 Jose Abreu           2019-12-18  1122  	return ret;
b60189e0392fa0 Jose Abreu           2019-12-18  1123  }
b60189e0392fa0 Jose Abreu           2019-12-18  1124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
