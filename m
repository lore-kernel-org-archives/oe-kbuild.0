Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71C821CC44
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 04:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756097779; cv=none; b=q69ebYd4eEur2rDWt9p+Lz1g/tCA760WFIj+HRoEmMzZle4lYw8Gf7k7dJSu9o98TfXI4yVgwbel6lLJUzjXz1n8mOPcAZJjoc3h9qk4J8T3xfZpqkSYF3EPOjDNpM3XCTNP7SY2mZqmtZByWVCrVhQXZ65pk+ST2d3wtrIiNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756097779; c=relaxed/simple;
	bh=WRNcA/KLobiHpCPw5Je7kItsRs34MDSxbKShyGrNb1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnuYDTiOEXpL57kPGuTyju7vDn6yhCudilYb1n7FgexYSdb1ApDkoef61C1vRT3Yn4JnKiUWn0OeDWmqfPN1f/2s5Es97HmrXW00R7B+ErIa9ZW6WxzPgkICk9No1I4QLpqMFD9PPAiPrHFLmL45Yf+AbJ3jhHwS3Mra3lV8ows=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJfmdwcp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJfmdwcp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756097778; x=1787633778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WRNcA/KLobiHpCPw5Je7kItsRs34MDSxbKShyGrNb1k=;
  b=MJfmdwcpvZNMLzPyab087ZUopPxdGfI8/1GWKQw1mAXhe44Up8O+f6+d
   6IbKT28Aflag2XnBjsHNXHFS0lKeX9+TLhEPVJTjJZYfGWu0rfqUfi1Td
   uPl4cSmyntP3ZNcyaYy1/1QAapDGe21QUPedOT7VKjpdlaZi5SM05oDbN
   TnCDwK929Rrkyq/r05ZZRbiT/S8hXv/1exLsyrhBMhNRuyNllATe7Vc8l
   4Uz1/gqzDMN57DBv+bZ7kRTe9ueVpgxGulNzN2wuuHVUblsyuyE8SDtbX
   ajfuizH9iikRJuItxdOGXeWh0KdINZq9In7Pt4ImXMJOvGs/zHyYX+cIM
   A==;
X-CSE-ConnectionGUID: pnTc5WMhRcmHOmHJZSmB5w==
X-CSE-MsgGUID: 953GMr1tSweYAN4yglSi+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="75754179"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75754179"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 21:56:16 -0700
X-CSE-ConnectionGUID: JoPtaQoSQsGL96720EcdAA==
X-CSE-MsgGUID: Eyy3YlF2QTKOodi59ZyOOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169120791"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Aug 2025 21:56:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqPFb-000NND-37;
	Mon, 25 Aug 2025 04:56:11 +0000
Date: Mon, 25 Aug 2025 12:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH wireless] wifi: mac80211: increase scan_ies_len for S1G
Message-ID: <202508251233.r1IFboEm-lkp@intel.com>
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
In-Reply-To: <20250822062020.904196-1-lachlan.hodges@morsemicro.com>
References: <20250822062020.904196-1-lachlan.hodges@morsemicro.com>
TO: Lachlan Hodges <lachlan.hodges@morsemicro.com>
TO: johannes@sipsolutions.net
CC: linux-wireless@vger.kernel.org
CC: arien.judge@morsemicro.com
CC: Lachlan Hodges <lachlan.hodges@morsemicro.com>

Hi Lachlan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.17-rc3 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lachlan-Hodges/wifi-mac80211-increase-scan_ies_len-for-S1G/20250822-142135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250822062020.904196-1-lachlan.hodges%40morsemicro.com
patch subject: [PATCH wireless] wifi: mac80211: increase scan_ies_len for S1G
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251233.r1IFboEm-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508251233.r1IFboEm-lkp@intel.com/

New smatch warnings:
net/mac80211/main.c:1277 ieee80211_register_hw() error: uninitialized symbol 'supp_s1g'.

Old smatch warnings:
net/mac80211/main.c:1410 ieee80211_register_hw() error: uninitialized symbol 'supp_s1g'.

vim +/supp_s1g +1277 net/mac80211/main.c

eecc48000afe2c net/mac80211/main.c      Johannes Berg         2011-05-04  1184  
0a44dfc0707495 net/mac80211/main.c      Johannes Berg         2024-01-29  1185  	if (local->emulate_chanctx) {
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1186  		for (i = 0; i < local->hw.wiphy->n_iface_combinations; i++) {
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1187  			const struct ieee80211_iface_combination *comb;
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1188  
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1189  			comb = &local->hw.wiphy->iface_combinations[i];
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1190  
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1191  			if (comb->num_different_channels > 1)
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1192  				return -EINVAL;
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1193  		}
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1194  	}
164eb02d070af9 net/mac80211/main.c      Simon Wunderlich      2013-02-08  1195  
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1196  	if (hw->wiphy->n_radio) {
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1197  		for (i = 0; i < hw->wiphy->n_radio; i++) {
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1198  			const struct wiphy_radio *radio = &hw->wiphy->radio[i];
164eb02d070af9 net/mac80211/main.c      Simon Wunderlich      2013-02-08  1199  
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1200  			if (!ieee80211_ifcomb_check(radio->iface_combinations,
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1201  						    radio->n_iface_combinations))
164eb02d070af9 net/mac80211/main.c      Simon Wunderlich      2013-02-08  1202  				return -EINVAL;
164eb02d070af9 net/mac80211/main.c      Simon Wunderlich      2013-02-08  1203  		}
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1204  	} else {
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1205  		if (!ieee80211_ifcomb_check(hw->wiphy->iface_combinations,
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1206  					    hw->wiphy->n_iface_combinations))
a01b1e9f995567 net/mac80211/main.c      Felix Fietkau         2024-07-09  1207  			return -EINVAL;
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1208  	}
fe57d9f5c0a2c1 net/mac80211/main.c      Johannes Berg         2012-07-26  1209  
72d7872852e173 net/mac80211/main.c      Arik Nemtsov          2012-05-10  1210  	/* Only HW csum features are currently compatible with mac80211 */
07b83d2ecd2f81 net/mac80211/main.c      Johannes Berg         2020-01-31  1211  	if (WARN_ON(hw->netdev_features & ~MAC80211_SUPPORTED_FEATURES))
72d7872852e173 net/mac80211/main.c      Arik Nemtsov          2012-05-10  1212  		return -EINVAL;
72d7872852e173 net/mac80211/main.c      Arik Nemtsov          2012-05-10  1213  
78be49ec2a0df3 net/mac80211/main.c      Helmut Schaa          2010-10-02  1214  	if (hw->max_report_rates == 0)
78be49ec2a0df3 net/mac80211/main.c      Helmut Schaa          2010-10-02  1215  		hw->max_report_rates = hw->max_rates;
78be49ec2a0df3 net/mac80211/main.c      Helmut Schaa          2010-10-02  1216  
04ecd2578e712c net/mac80211/main.c      Johannes Berg         2012-09-11  1217  	local->rx_chains = 1;
04ecd2578e712c net/mac80211/main.c      Johannes Berg         2012-09-11  1218  
8318d78a44d49a net/mac80211/ieee80211.c Johannes Berg         2008-01-24  1219  	/*
8318d78a44d49a net/mac80211/ieee80211.c Johannes Berg         2008-01-24  1220  	 * generic code guarantees at least one band,
8318d78a44d49a net/mac80211/ieee80211.c Johannes Berg         2008-01-24  1221  	 * set this very early because much code assumes
8318d78a44d49a net/mac80211/ieee80211.c Johannes Berg         2008-01-24  1222  	 * that hw.conf.channel is assigned
8318d78a44d49a net/mac80211/ieee80211.c Johannes Berg         2008-01-24  1223  	 */
2a519311926906 net/mac80211/main.c      Johannes Berg         2009-02-10  1224  	channels = 0;
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1225  	max_bitrates = 0;
5ef2d41afb7fce net/mac80211/main.c      Johannes Berg         2009-03-31  1226  	supp_ht = false;
ba0afa2f22e1e3 net/mac80211/main.c      Mahesh Palivela       2012-07-02  1227  	supp_vht = false;
41cbb0f5a29592 net/mac80211/main.c      Luca Coelho           2018-06-09  1228  	supp_he = false;
820acc810fb6ec net/mac80211/main.c      Ilan Peer             2022-02-14  1229  	supp_eht = false;
57fbcce37be7c1 net/mac80211/main.c      Johannes Berg         2016-04-12  1230  	for (band = 0; band < NUM_NL80211_BANDS; band++) {
e8c1841278a783 net/mac80211/main.c      Johannes Berg         2023-08-28  1231  		const struct ieee80211_sband_iftype_data *iftd;
8318d78a44d49a net/mac80211/ieee80211.c Johannes Berg         2008-01-24  1232  		struct ieee80211_supported_band *sband;
8318d78a44d49a net/mac80211/ieee80211.c Johannes Berg         2008-01-24  1233  
8318d78a44d49a net/mac80211/ieee80211.c Johannes Berg         2008-01-24  1234  		sband = local->hw.wiphy->bands[band];
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1235  		if (!sband)
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1236  			continue;
fffa4b1c170a3c net/mac80211/main.c      Karl Beldan           2013-04-15  1237  
fffa4b1c170a3c net/mac80211/main.c      Karl Beldan           2013-04-15  1238  		if (!dflt_chandef.chan) {
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1239  			/*
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1240  			 * Assign the first enabled channel to dflt_chandef
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1241  			 * from the list of channels
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1242  			 */
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1243  			for (i = 0; i < sband->n_channels; i++)
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1244  				if (!(sband->channels[i].flags &
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1245  						IEEE80211_CHAN_DISABLED))
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1246  					break;
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1247  			/* if none found then use the first anyway */
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1248  			if (i == sband->n_channels)
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1249  				i = 0;
fffa4b1c170a3c net/mac80211/main.c      Karl Beldan           2013-04-15  1250  			cfg80211_chandef_create(&dflt_chandef,
041c881a0ba8a7 net/mac80211/main.c      Karthikeyan Kathirvel 2021-03-11  1251  						&sband->channels[i],
4bf88530be971b net/mac80211/main.c      Johannes Berg         2012-11-09  1252  						NL80211_CHAN_NO_HT);
fffa4b1c170a3c net/mac80211/main.c      Karl Beldan           2013-04-15  1253  			/* init channel we're on */
6092077ad09ce8 net/mac80211/main.c      Johannes Berg         2024-01-29  1254  			local->monitor_chanreq.oper = dflt_chandef;
0a44dfc0707495 net/mac80211/main.c      Johannes Berg         2024-01-29  1255  			if (local->emulate_chanctx) {
0a44dfc0707495 net/mac80211/main.c      Johannes Berg         2024-01-29  1256  				local->dflt_chandef = dflt_chandef;
fffa4b1c170a3c net/mac80211/main.c      Karl Beldan           2013-04-15  1257  				local->hw.conf.chandef = dflt_chandef;
fffa4b1c170a3c net/mac80211/main.c      Karl Beldan           2013-04-15  1258  			}
fffa4b1c170a3c net/mac80211/main.c      Karl Beldan           2013-04-15  1259  		}
fffa4b1c170a3c net/mac80211/main.c      Karl Beldan           2013-04-15  1260  
2a519311926906 net/mac80211/main.c      Johannes Berg         2009-02-10  1261  		channels += sband->n_channels;
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1262  
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1263  		/*
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1264  		 * Due to the way the aggregation code handles this and it
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1265  		 * being an HT capability, we can't really support delayed
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1266  		 * BA in MLO (yet).
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1267  		 */
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1268  		if (WARN_ON(sband->ht_cap.ht_supported &&
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1269  			    (sband->ht_cap.cap & IEEE80211_HT_CAP_DELAY_BA) &&
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1270  			    hw->wiphy->flags & WIPHY_FLAG_SUPPORTS_MLO))
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1271  			return -EINVAL;
69e0d04e2b0b3a net/mac80211/main.c      Johannes Berg         2022-09-30  1272  
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1273  		if (max_bitrates < sband->n_bitrates)
de95a54b1aebe5 net/mac80211/main.c      Johannes Berg         2009-04-01  1274  			max_bitrates = sband->n_bitrates;
5ef2d41afb7fce net/mac80211/main.c      Johannes Berg         2009-03-31  1275  		supp_ht = supp_ht || sband->ht_cap.ht_supported;
ba0afa2f22e1e3 net/mac80211/main.c      Mahesh Palivela       2012-07-02  1276  		supp_vht = supp_vht || sband->vht_cap.vht_supported;
0eafa59746812a net/mac80211/main.c      Lachlan Hodges        2025-08-22 @1277  		supp_s1g = supp_s1g || sband->s1g_cap.s1g;
04ecd2578e712c net/mac80211/main.c      Johannes Berg         2012-09-11  1278  
e8c1841278a783 net/mac80211/main.c      Johannes Berg         2023-08-28  1279  		for_each_sband_iftype_data(sband, i, iftd) {
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1280  			u8 he_40_mhz_cap;
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1281  
4a11174d6dbd0b net/mac80211/main.c      Dan Carpenter         2021-06-28  1282  			supp_he = supp_he || iftd->he_cap.has_he;
820acc810fb6ec net/mac80211/main.c      Ilan Peer             2022-02-14  1283  			supp_eht = supp_eht || iftd->eht_cap.has_eht;
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1284  
37c37096ad80bf net/mac80211/main.c      Johannes Berg         2024-02-07  1285  			if (band == NL80211_BAND_2GHZ)
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1286  				he_40_mhz_cap =
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1287  					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G;
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1288  			else
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1289  				he_40_mhz_cap =
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1290  					IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G;
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1291  
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1292  			/* currently no support for HE client where HT has 40 MHz but not HT */
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1293  			if (iftd->he_cap.has_he &&
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1294  			    iftd->types_mask & (BIT(NL80211_IFTYPE_STATION) |
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1295  						BIT(NL80211_IFTYPE_P2P_CLIENT)) &&
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1296  			    sband->ht_cap.ht_supported &&
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1297  			    sband->ht_cap.cap & IEEE80211_HT_CAP_SUP_WIDTH_20_40 &&
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1298  			    !(iftd->he_cap.he_cap_elem.phy_cap_info[0] & he_40_mhz_cap))
f04d2c247e0407 net/mac80211/main.c      Johannes Berg         2024-01-11  1299  				return -EINVAL;
f52de501d111ae net/mac80211/main.c      Johannes Berg         2025-01-01  1300  
f52de501d111ae net/mac80211/main.c      Johannes Berg         2025-01-01  1301  			/* no support for per-band vendor elems with MLO */
f52de501d111ae net/mac80211/main.c      Johannes Berg         2025-01-01  1302  			if (WARN_ON(iftd->vendor_elems.len &&
f52de501d111ae net/mac80211/main.c      Johannes Berg         2025-01-01  1303  				    hw->wiphy->flags & WIPHY_FLAG_SUPPORTS_MLO))
f52de501d111ae net/mac80211/main.c      Johannes Berg         2025-01-01  1304  				return -EINVAL;
bac2fd3d753430 net/mac80211/main.c      Johannes Berg         2021-06-18  1305  		}
41cbb0f5a29592 net/mac80211/main.c      Luca Coelho           2018-06-09  1306  
75e296e9b22aef net/mac80211/main.c      Johannes Berg         2020-01-31  1307  		/* HT, VHT, HE require QoS, thus >= 4 queues */
75e296e9b22aef net/mac80211/main.c      Johannes Berg         2020-01-31  1308  		if (WARN_ON(local->hw.queues < IEEE80211_NUM_ACS &&
75e296e9b22aef net/mac80211/main.c      Johannes Berg         2020-01-31  1309  			    (supp_ht || supp_vht || supp_he)))
75e296e9b22aef net/mac80211/main.c      Johannes Berg         2020-01-31  1310  			return -EINVAL;
75e296e9b22aef net/mac80211/main.c      Johannes Berg         2020-01-31  1311  
820acc810fb6ec net/mac80211/main.c      Ilan Peer             2022-02-14  1312  		/* EHT requires HE support */
820acc810fb6ec net/mac80211/main.c      Ilan Peer             2022-02-14  1313  		if (WARN_ON(supp_eht && !supp_he))
820acc810fb6ec net/mac80211/main.c      Ilan Peer             2022-02-14  1314  			return -EINVAL;
820acc810fb6ec net/mac80211/main.c      Ilan Peer             2022-02-14  1315  
43071d8fb3b7f5 net/mac80211/main.c      Felix Fietkau         2017-01-13  1316  		if (!sband->ht_cap.ht_supported)
43071d8fb3b7f5 net/mac80211/main.c      Felix Fietkau         2017-01-13  1317  			continue;
43071d8fb3b7f5 net/mac80211/main.c      Felix Fietkau         2017-01-13  1318  
43071d8fb3b7f5 net/mac80211/main.c      Felix Fietkau         2017-01-13  1319  		/* TODO: consider VHT for RX chains, hopefully it's the same */
04ecd2578e712c net/mac80211/main.c      Johannes Berg         2012-09-11  1320  		local->rx_chains =
04ecd2578e712c net/mac80211/main.c      Johannes Berg         2012-09-11  1321  			max(ieee80211_mcs_to_chains(&sband->ht_cap.mcs),
04ecd2578e712c net/mac80211/main.c      Johannes Berg         2012-09-11  1322  			    local->rx_chains);
04ecd2578e712c net/mac80211/main.c      Johannes Berg         2012-09-11  1323  
43071d8fb3b7f5 net/mac80211/main.c      Felix Fietkau         2017-01-13  1324  		/* no need to mask, SM_PS_DISABLED has all bits set */
43071d8fb3b7f5 net/mac80211/main.c      Felix Fietkau         2017-01-13  1325  		sband->ht_cap.cap |= WLAN_HT_CAP_SM_PS_DISABLED <<
43071d8fb3b7f5 net/mac80211/main.c      Felix Fietkau         2017-01-13  1326  			             IEEE80211_HT_CAP_SM_PS_SHIFT;
8318d78a44d49a net/mac80211/ieee80211.c Johannes Berg         2008-01-24  1327  	}
f0706e828e96d0 net/mac80211/ieee80211.c Jiri Benc             2007-05-05  1328  
db3bdcb9c3ffc6 net/mac80211/main.c      Manikanta Pubbisetty  2018-03-28  1329  	/* if low-level driver supports AP, we also support VLAN.
db3bdcb9c3ffc6 net/mac80211/main.c      Manikanta Pubbisetty  2018-03-28  1330  	 * drivers advertising SW_CRYPTO_CONTROL should enable AP_VLAN
db3bdcb9c3ffc6 net/mac80211/main.c      Manikanta Pubbisetty  2018-03-28  1331  	 * based on their support to transmit SW encrypted packets.
db3bdcb9c3ffc6 net/mac80211/main.c      Manikanta Pubbisetty  2018-03-28  1332  	 */
db3bdcb9c3ffc6 net/mac80211/main.c      Manikanta Pubbisetty  2018-03-28  1333  	if (local->hw.wiphy->interface_modes & BIT(NL80211_IFTYPE_AP) &&
db3bdcb9c3ffc6 net/mac80211/main.c      Manikanta Pubbisetty  2018-03-28  1334  	    !ieee80211_hw_check(&local->hw, SW_CRYPTO_CONTROL)) {
7527a782e187d1 net/mac80211/main.c      Johannes Berg         2011-05-13  1335  		hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_AP_VLAN);
7527a782e187d1 net/mac80211/main.c      Johannes Berg         2011-05-13  1336  		hw->wiphy->software_iftypes |= BIT(NL80211_IFTYPE_AP_VLAN);
7527a782e187d1 net/mac80211/main.c      Johannes Berg         2011-05-13  1337  	}
f59ac0481660e6 net/mac80211/main.c      Luis R. Rodriguez     2008-08-29  1338  
f59ac0481660e6 net/mac80211/main.c      Luis R. Rodriguez     2008-08-29  1339  	/* mac80211 always supports monitor */
7527a782e187d1 net/mac80211/main.c      Johannes Berg         2011-05-13  1340  	hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_MONITOR);
7527a782e187d1 net/mac80211/main.c      Johannes Berg         2011-05-13  1341  	hw->wiphy->software_iftypes |= BIT(NL80211_IFTYPE_MONITOR);
7527a782e187d1 net/mac80211/main.c      Johannes Berg         2011-05-13  1342  
8e621fc90b42fa net/mac80211/main.c      Johannes Berg         2011-05-14  1343  
82bbe02b2500ef net/mac80211/main.c      Kees Cook             2025-05-09  1344  	local->int_scan_req = kzalloc(struct_size(local->int_scan_req,
82bbe02b2500ef net/mac80211/main.c      Kees Cook             2025-05-09  1345  						  channels, channels),
82bbe02b2500ef net/mac80211/main.c      Kees Cook             2025-05-09  1346  				      GFP_KERNEL);
5b0ec94f9cfdcd net/mac80211/main.c      Johannes Berg         2014-01-06  1347  	if (!local->int_scan_req)
5b0ec94f9cfdcd net/mac80211/main.c      Johannes Berg         2014-01-06  1348  		return -ENOMEM;
5b0ec94f9cfdcd net/mac80211/main.c      Johannes Berg         2014-01-06  1349  
9beed8de806644 net/mac80211/main.c      Johannes Berg         2022-09-26  1350  	eth_broadcast_addr(local->int_scan_req->bssid);
9beed8de806644 net/mac80211/main.c      Johannes Berg         2022-09-26  1351  
57fbcce37be7c1 net/mac80211/main.c      Johannes Berg         2016-04-12  1352  	for (band = 0; band < NUM_NL80211_BANDS; band++) {
5b0ec94f9cfdcd net/mac80211/main.c      Johannes Berg         2014-01-06  1353  		if (!local->hw.wiphy->bands[band])
5b0ec94f9cfdcd net/mac80211/main.c      Johannes Berg         2014-01-06  1354  			continue;
5b0ec94f9cfdcd net/mac80211/main.c      Johannes Berg         2014-01-06  1355  		local->int_scan_req->rates[band] = (u32) -1;
5b0ec94f9cfdcd net/mac80211/main.c      Johannes Berg         2014-01-06  1356  	}
5b0ec94f9cfdcd net/mac80211/main.c      Johannes Berg         2014-01-06  1357  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
