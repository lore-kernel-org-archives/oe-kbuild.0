Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A2518041
	for <oe-kbuild@lists.linux.dev>; Sun, 26 May 2024 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716740230; cv=none; b=uut+GpfW99MCPLbzOWsprCdykSjLAdkqv3HzGvloa72eZ65Yy97rOtM4aWiNxmZZSc+ad7REYrS1nNAWb1bK56REFHNLHyiDOvxaf4yw4h0QoVxecs3OitijZpVcZs8l0H3UrgU1pjUivAwLARi4VJWj31SSoywHfp3HkzioABk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716740230; c=relaxed/simple;
	bh=fvE1kCnwf5dCW5M/JKzpNjeUu1G6p4mYs/idtbLPpKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NuzqQ5zCrp0pe6Eaomtvvj/QePlVHWJBqMUmnc59AlDIqmL02Gg/Qz9imMAWRJnQjSR9+gGRRoe/hMdV2laLdMyZMR2Kbh16S5D097yKtrtbj8pjC5MAn6zvzKjSRJhZnDrxOX7A3kmT1w5aNH5lSlm050kp4BIoM+BNxkNlzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlxMh+gs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlxMh+gs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716740228; x=1748276228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fvE1kCnwf5dCW5M/JKzpNjeUu1G6p4mYs/idtbLPpKg=;
  b=mlxMh+gsbk0bojdUdbXa0Is1jSDn2+59FpQJyaqlAKQXmUCf1l6D82A/
   OHPRz/S6ttwhwp8hyqzXqKL5OLTXjaV8+SCgvdH8b3W9criFinBjQLGXa
   ZuAbwUOjn0l4zxy3/WIvE2wpU4CyfnqTqpR6EbPI9WItj1QxnJeSTURDl
   +8mPj/5BE5WvtD1mug/0/8XLXqgkc3xM+RymP94VjcEcvoRRZ00H3hJw6
   IZSIIHVl1CaQL7ldS8gbQk+GT47vkDeKujbXDP63WvxI8plAibZiRxTnZ
   L5RffpJkNp3UbuDQnnL5+d+XIK57OmQxCui5rxztGMQn+btPxihb36x1S
   A==;
X-CSE-ConnectionGUID: PKfwtfSeQaGfpZQfxoPXDA==
X-CSE-MsgGUID: jZG63CvWRJGD8nIsqKx2oA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16846265"
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="16846265"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2024 09:17:08 -0700
X-CSE-ConnectionGUID: XvdlOZmlTEmCFlXtboESsw==
X-CSE-MsgGUID: pdjY0IBqRvm7USRKcyo/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,190,1712646000"; 
   d="scan'208";a="34612172"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 May 2024 09:17:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBGYR-0008BM-0g;
	Sun, 26 May 2024 16:17:03 +0000
Date: Mon, 27 May 2024 00:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [kvalo-ath:pending 36/74]
 drivers/net/wireless/ath/ath12k/mac.c:8042:16-26: ERROR: sband is NULL but
 dereferenced.
Message-ID: <202405270021.7PcYNyfH-lkp@intel.com>
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
CC: Kalle Valo <kvalo@codeaurora.org>
CC: ath10k@lists.infradead.org
TO: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
head:   68eaacb5ce0b7ce33f5524fc01c98dde66988412
commit: 70e3be54bbddc39123b8785408fb9aeb8f822ab6 [36/74] wifi: ath12k: fix survey dump collection in 6 GHz
:::::: branch date: 31 hours ago
:::::: commit date: 10 days ago
config: arc-randconfig-r053-20240526 (https://download.01.org/0day-ci/archive/20240527/202405270021.7PcYNyfH-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405270021.7PcYNyfH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath12k/mac.c:8042:16-26: ERROR: sband is NULL but dereferenced.

vim +8042 drivers/net/wireless/ath/ath12k/mac.c

d889913205cf7e Kalle Valo             2022-11-28  8015  
d889913205cf7e Kalle Valo             2022-11-28  8016  static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
d889913205cf7e Kalle Valo             2022-11-28  8017  				    struct survey_info *survey)
d889913205cf7e Kalle Valo             2022-11-28  8018  {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  8019  	struct ath12k *ar;
d889913205cf7e Kalle Valo             2022-11-28  8020  	struct ieee80211_supported_band *sband;
d889913205cf7e Kalle Valo             2022-11-28  8021  	struct survey_info *ar_survey;
d889913205cf7e Kalle Valo             2022-11-28  8022  
d889913205cf7e Kalle Valo             2022-11-28  8023  	if (idx >= ATH12K_NUM_CHANS)
d889913205cf7e Kalle Valo             2022-11-28  8024  		return -ENOENT;
d889913205cf7e Kalle Valo             2022-11-28  8025  
d889913205cf7e Kalle Valo             2022-11-28  8026  	sband = hw->wiphy->bands[NL80211_BAND_2GHZ];
d889913205cf7e Kalle Valo             2022-11-28  8027  	if (sband && idx >= sband->n_channels) {
d889913205cf7e Kalle Valo             2022-11-28  8028  		idx -= sband->n_channels;
d889913205cf7e Kalle Valo             2022-11-28  8029  		sband = NULL;
d889913205cf7e Kalle Valo             2022-11-28  8030  	}
d889913205cf7e Kalle Valo             2022-11-28  8031  
d889913205cf7e Kalle Valo             2022-11-28  8032  	if (!sband)
d889913205cf7e Kalle Valo             2022-11-28  8033  		sband = hw->wiphy->bands[NL80211_BAND_5GHZ];
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8034  	if (sband && idx >= sband->n_channels) {
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8035  		idx -= sband->n_channels;
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8036  		sband = NULL;
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8037  	}
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8038  
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8039  	if (!sband)
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8040  		sband = hw->wiphy->bands[NL80211_BAND_6GHZ];
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8041  	if (!sband || idx >= sband->n_channels) {
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08 @8042  		idx -= sband->n_channels;
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8043  		sband = NULL;
70e3be54bbddc3 Pradeep Kumar Chitrapu 2024-05-08  8044  	}
d889913205cf7e Kalle Valo             2022-11-28  8045  
4f242b1d6996af Sriram R               2024-04-09  8046  	if (!sband || idx >= sband->n_channels)
4f242b1d6996af Sriram R               2024-04-09  8047  		return -ENOENT;
4f242b1d6996af Sriram R               2024-04-09  8048  
4f242b1d6996af Sriram R               2024-04-09  8049  	ar = ath12k_mac_get_ar_by_chan(hw, &sband->channels[idx]);
4f242b1d6996af Sriram R               2024-04-09  8050  	if (!ar) {
4f242b1d6996af Sriram R               2024-04-09  8051  		if (sband->channels[idx].flags & IEEE80211_CHAN_DISABLED) {
4f242b1d6996af Sriram R               2024-04-09  8052  			memset(survey, 0, sizeof(*survey));
4f242b1d6996af Sriram R               2024-04-09  8053  			return 0;
4f242b1d6996af Sriram R               2024-04-09  8054  		}
4f242b1d6996af Sriram R               2024-04-09  8055  		return -ENOENT;
d889913205cf7e Kalle Valo             2022-11-28  8056  	}
d889913205cf7e Kalle Valo             2022-11-28  8057  
4f242b1d6996af Sriram R               2024-04-09  8058  	ar_survey = &ar->survey[idx];
4f242b1d6996af Sriram R               2024-04-09  8059  
4f242b1d6996af Sriram R               2024-04-09  8060  	mutex_lock(&ar->conf_mutex);
4f242b1d6996af Sriram R               2024-04-09  8061  
d889913205cf7e Kalle Valo             2022-11-28  8062  	ath12k_mac_update_bss_chan_survey(ar, &sband->channels[idx]);
d889913205cf7e Kalle Valo             2022-11-28  8063  
d889913205cf7e Kalle Valo             2022-11-28  8064  	spin_lock_bh(&ar->data_lock);
d889913205cf7e Kalle Valo             2022-11-28  8065  	memcpy(survey, ar_survey, sizeof(*survey));
d889913205cf7e Kalle Valo             2022-11-28  8066  	spin_unlock_bh(&ar->data_lock);
d889913205cf7e Kalle Valo             2022-11-28  8067  
d889913205cf7e Kalle Valo             2022-11-28  8068  	survey->channel = &sband->channels[idx];
d889913205cf7e Kalle Valo             2022-11-28  8069  
d889913205cf7e Kalle Valo             2022-11-28  8070  	if (ar->rx_channel == survey->channel)
d889913205cf7e Kalle Valo             2022-11-28  8071  		survey->filled |= SURVEY_INFO_IN_USE;
d889913205cf7e Kalle Valo             2022-11-28  8072  
d889913205cf7e Kalle Valo             2022-11-28  8073  	mutex_unlock(&ar->conf_mutex);
4f242b1d6996af Sriram R               2024-04-09  8074  	return 0;
d889913205cf7e Kalle Valo             2022-11-28  8075  }
d889913205cf7e Kalle Valo             2022-11-28  8076  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
