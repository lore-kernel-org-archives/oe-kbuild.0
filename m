Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F072F29
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 01:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747531483; cv=none; b=Zm1FV/W2sntQpBPKNAOZNMuvDuoPnuWIi3oU/w81yV5CLFjg0Kxd7drb7RWelP/R0jBg5r6gM6AvEQEBrT6PUKD+vXW5fdVQwXtyP0kbzbQ2LtcixDDzAm/WLmA+0VPYnDEGHeL/bx5fWr9mqUsVrsTiN02Vt5dmmGeT7A1EWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747531483; c=relaxed/simple;
	bh=Hz97eAvGH1Oq8SclquTKOMTcYAMzQ/6C7VeOY2E+Xg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SFsPObnFv1co0hotPMrS70L8QbRVyFa8tBW2MnLyIzr2vPEBAmKI24JqISvj/RGe9g6jnmIDsZWDoogvHH0NqAcjH3gRawePFOJWdd/rHSwl70bpetRY55CQNXMjPqU1bI+9URbXEHXMSdmcl12NJCQKepQ7E+DYTYtukdmMwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knGx9TQv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knGx9TQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747531481; x=1779067481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hz97eAvGH1Oq8SclquTKOMTcYAMzQ/6C7VeOY2E+Xg4=;
  b=knGx9TQvQ2RSaptZ6NSkMZMApxQ5vWPh8u3xscZs3PQnt6GQeNQ9TWIP
   jUJsmRb3S5QbATZR62MmEAHozcCa/7p2D/Xhnk0HR5fQ3WxrAJBaoZz+a
   Kd0GLWGWeFw2ze9iTYmXIjR6Q9pRLVL5g5H1E9o1ZgTnZLRVA2yidv55f
   C/1lanLIn1p0YL49+39enXzhC6NaUmXDZL2fxBJzWUFCTlN2paUCwwSBs
   85T8x2VhhmIkcUZSZs4oAXEHAtF1WiE7v9kLo/gmQH/pu0d2LY4c3hS3e
   IYHaWoQIU6G9Ks2XHXBnwvcg7knQWPpjq/w04HSMqNwXb7aiwFgUVo+Jw
   w==;
X-CSE-ConnectionGUID: hpJ83SkGSWe+DiMzpHzsUA==
X-CSE-MsgGUID: ePqpvbegTbGhymdpWI413w==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60493914"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="60493914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 18:24:40 -0700
X-CSE-ConnectionGUID: H8t7LXr9SBemZO7B5fM59A==
X-CSE-MsgGUID: jDBO2ZlgRdSymknMlaYD2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="143906396"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2025 18:24:38 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGSlY-000KXT-2b;
	Sun, 18 May 2025 01:24:36 +0000
Date: Sun, 18 May 2025 09:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:pending-deferred 25/61]
 drivers/net/wireless/ath/ath12k/mac.c:10069 ath12k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
Message-ID: <202505180927.tbNWr3vE-lkp@intel.com>
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
CC: Jeff Johnson <jjohnson@kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
CC: ath12k@lists.infradead.org
TO: Baochen Qiang <quic_bqiang@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
head:   52c1e49f8c69a630f3dbe7dd79c52979cdad19d2
commit: aeda163bb0c7b9fc58bdd6ae90c0eef4f4050b7b [25/61] wifi: ath12k: fill parameters for vdev set TPC power WMI command
:::::: branch date: 27 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180927.tbNWr3vE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505180927.tbNWr3vE-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:10069 ath12k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1505 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1493 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:6285 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:6287 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:10131 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:10131 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:10131 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:10131 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:11993 ath12k_mac_hw_register() error: uninitialized symbol 'cap'.

vim +/eirp_power +10069 drivers/net/wireless/ath/ath12k/mac.c

aeda163bb0c7b9 Baochen Qiang 2025-04-18   9901  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9902  void ath12k_mac_fill_reg_tpc_info(struct ath12k *ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9903  				  struct ath12k_link_vif *arvif,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9904  				  struct ieee80211_chanctx_conf *ctx)
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9905  {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9906  	struct ath12k_base *ab = ar->ab;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9907  	struct ath12k_reg_tpc_power_info *reg_tpc_info = &arvif->reg_tpc_info;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9908  	struct ieee80211_bss_conf *bss_conf = ath12k_mac_get_link_bss_conf(arvif);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9909  	struct ieee80211_channel *chan, *temp_chan;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9910  	u8 pwr_lvl_idx, num_pwr_levels, pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9911  	bool is_psd_power = false, is_tpe_present = false;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9912  	s8 max_tx_power[ATH12K_NUM_PWR_LEVELS],
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9913  		psd_power, tx_power, eirp_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9914  	u16 start_freq, center_freq;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9915  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9916  	chan = ctx->def.chan;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9917  	start_freq = ath12k_mac_get_6ghz_start_frequency(&ctx->def);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9918  	pwr_reduction = bss_conf->pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9919  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9920  	if (arvif->reg_tpc_info.num_pwr_levels) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9921  		is_tpe_present = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9922  		num_pwr_levels = arvif->reg_tpc_info.num_pwr_levels;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9923  	} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9924  		num_pwr_levels = ath12k_mac_get_num_pwr_levels(&ctx->def);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9925  	}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9926  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9927  	for (pwr_lvl_idx = 0; pwr_lvl_idx < num_pwr_levels; pwr_lvl_idx++) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9928  		/* STA received TPE IE*/
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9929  		if (is_tpe_present) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9930  			/* local power is PSD power*/
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9931  			if (chan->flags & IEEE80211_CHAN_PSD) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9932  				/* Connecting AP is psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9933  				if (reg_tpc_info->is_psd_power) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9934  					is_psd_power = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9935  					ath12k_mac_get_psd_channel(ar, 20,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9936  								   &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9937  								   &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9938  								   pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9939  								   &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9940  								   &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9941  					psd_power = temp_chan->psd;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9942  					eirp_power = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9943  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9944  						min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9945  						      psd_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9946  						      reg_tpc_info->tpe[pwr_lvl_idx]);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9947  				/* Connecting AP is not psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9948  				} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9949  					ath12k_mac_get_eirp_power(ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9950  								  &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9951  								  &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9952  								  pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9953  								  &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9954  								  &ctx->def,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9955  								  &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9956  					psd_power = temp_chan->psd;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9957  					/* convert psd power to EIRP power based
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9958  					 * on channel width
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9959  					 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9960  					tx_power =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9961  						min_t(s8, tx_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9962  						      psd_power + 13 + pwr_lvl_idx * 3);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9963  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9964  						min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9965  						      tx_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9966  						      reg_tpc_info->tpe[pwr_lvl_idx]);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9967  				}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9968  			/* local power is not PSD power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9969  			} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9970  				/* Connecting AP is psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9971  				if (reg_tpc_info->is_psd_power) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9972  					is_psd_power = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9973  					ath12k_mac_get_psd_channel(ar, 20,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9974  								   &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9975  								   &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9976  								   pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9977  								   &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9978  								   &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9979  					eirp_power = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9980  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9981  						reg_tpc_info->tpe[pwr_lvl_idx];
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9982  				/* Connecting AP is not psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9983  				} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9984  					ath12k_mac_get_eirp_power(ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9985  								  &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9986  								  &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9987  								  pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9988  								  &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9989  								  &ctx->def,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9990  								  &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9991  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9992  						min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9993  						      tx_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9994  						      reg_tpc_info->tpe[pwr_lvl_idx]);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9995  				}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9996  			}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9997  		/* STA not received TPE IE */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9998  		} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9999  			/* local power is PSD power*/
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10000  			if (chan->flags & IEEE80211_CHAN_PSD) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10001  				is_psd_power = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10002  				ath12k_mac_get_psd_channel(ar, 20,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10003  							   &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10004  							   &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10005  							   pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10006  							   &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10007  							   &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10008  				psd_power = temp_chan->psd;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10009  				eirp_power = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10010  				max_tx_power[pwr_lvl_idx] = psd_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10011  			} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10012  				ath12k_mac_get_eirp_power(ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10013  							  &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10014  							  &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10015  							  pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10016  							  &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10017  							  &ctx->def,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10018  							  &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10019  				max_tx_power[pwr_lvl_idx] = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10020  			}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10021  		}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10022  
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10023  		if (is_psd_power) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10024  			/* If AP local power constraint is present */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10025  			if (pwr_reduction)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10026  				eirp_power = eirp_power - pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10027  
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10028  			/* If firmware updated max tx power is non zero, then take
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10029  			 * the min of firmware updated ap tx power
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10030  			 * and max power derived from above mentioned parameters.
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10031  			 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10032  			ath12k_dbg(ab, ATH12K_DBG_MAC,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10033  				   "eirp power : %d firmware report power : %d\n",
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10034  				   eirp_power, ar->max_allowed_tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10035  			/* Firmware reports lower max_allowed_tx_power during vdev
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10036  			 * start response. In case of 6 GHz, firmware is not aware
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10037  			 * of EIRP power unless driver sets EIRP power through WMI
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10038  			 * TPC command. So radio which does not support idle power
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10039  			 * save can set maximum calculated EIRP power directly to
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10040  			 * firmware through TPC command without min comparison with
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10041  			 * vdev start response's max_allowed_tx_power.
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10042  			 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10043  			if (ar->max_allowed_tx_power && ab->hw_params->idle_ps)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10044  				eirp_power = min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10045  						   eirp_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10046  						   ar->max_allowed_tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10047  		} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10048  			/* If AP local power constraint is present */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10049  			if (pwr_reduction)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10050  				max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10051  					max_tx_power[pwr_lvl_idx] - pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10052  			/* If firmware updated max tx power is non zero, then take
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10053  			 * the min of firmware updated ap tx power
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10054  			 * and max power derived from above mentioned parameters.
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10055  			 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10056  			if (ar->max_allowed_tx_power && ab->hw_params->idle_ps)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10057  				max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10058  					min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10059  					      max_tx_power[pwr_lvl_idx],
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10060  					      ar->max_allowed_tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10061  		}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10062  		reg_tpc_info->chan_power_info[pwr_lvl_idx].chan_cfreq = center_freq;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10063  		reg_tpc_info->chan_power_info[pwr_lvl_idx].tx_power =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10064  			max_tx_power[pwr_lvl_idx];
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10065  	}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10066  
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10067  	reg_tpc_info->num_pwr_levels = num_pwr_levels;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10068  	reg_tpc_info->is_psd_power = is_psd_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18 @10069  	reg_tpc_info->eirp_power = eirp_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10070  	reg_tpc_info->ap_power_type =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10071  		ath12k_reg_ap_pwr_convert(bss_conf->power_type);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10072  }
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10073  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
