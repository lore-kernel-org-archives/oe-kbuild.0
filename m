Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A894E205ADA
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730209825; cv=none; b=aigvrokJAudh6F191UoFk1nyQHOhbsY1VhCoR1SiqzTyCKVPQ49pA1DN4ePuKcs2scXWGL49bQWZORLEVE16K5ZW0Ghnn4MwFPLVjAjynXQm/gkdXMZDjzX3CKf9V2syI5at74R7+4OtxP9aQXXGkb5yo+HPxXBAvqGWDqpkCgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730209825; c=relaxed/simple;
	bh=yddOJEAx7qod7wG2V8ePAG7D73FG4xEEs3MHufBaEng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0f+bG02aI9B+nqNfDx0EVwpQwT0Vrf4ZR9UyMdpLjAJKxt//nRbFlUlwfqyAxHHdxo4g8YFosxLYqaLfd8q/PLzmSo/FzsQmy1hLn7cIjPHMEhs7smPozTWtVoBozaAee9fgas/ujG4SKanhyYOMKa85tp5pcL7ru3GrFyOfL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXJBvJfk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXJBvJfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730209823; x=1761745823;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yddOJEAx7qod7wG2V8ePAG7D73FG4xEEs3MHufBaEng=;
  b=cXJBvJfkVH8x6CvZdJFGPchbwdFdPLD9SiAfkiJwyW3OoztN2b0gv0sU
   t73dATwO5OEkO74+B4Xjz38AFhEqMik8kjXUSWS95wJHZDLk0PqWe3MFa
   vcXFdr6IFz1k0Gg2m9MSIBXvxgVQO1Ks0xzVXlVyf5ks/mAIKrMJjGpIV
   I9/s6ensFfXLg7Oid2rm+faZsrpwaLi0hJT1YN6LRH91dUaS1SpyrPnX8
   mbvJszCNi3ZJBoWibuq2b83Ewt0WV6V1GK3Gp/dyQ6kh19cz5D2B0x2Lu
   r/pAX/we4UdYqfTquIN1S8+6pBns1/9fOKGAfkjL9kkt96wNf42H3YW86
   A==;
X-CSE-ConnectionGUID: G4PYDjNZS7Sp69UZUh3u7Q==
X-CSE-MsgGUID: QPWOdfrhS2689LwCYjQQGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33773950"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33773950"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 06:50:04 -0700
X-CSE-ConnectionGUID: i0tFsNznRmykBqMTDPbHDg==
X-CSE-MsgGUID: hf6f8Ch8TFe9oqk6hH1T/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82111412"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2024 06:50:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5mbf-000dii-17;
	Tue, 29 Oct 2024 13:49:59 +0000
Date: Tue, 29 Oct 2024 21:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/marvell/mwifiex/cfg80211.c:4338:27-28: WARNING
 opportunity for max()
Message-ID: <202410292118.wvB98ggH-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Pali Rohár" <pali@kernel.org>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e42b1a9a2557aa94fee47f078633677198386a52
commit: 982d7287f8dad2d5e1c57dc84aca83128e787666 mwifiex: Add support for NL80211_ATTR_MAX_AP_ASSOC_STA
date:   4 years, 5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 years, 5 months ago
config: i386-randconfig-051-20241029 (https://download.01.org/0day-ci/archive/20241029/202410292118.wvB98ggH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410292118.wvB98ggH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/marvell/mwifiex/cfg80211.c:4338:27-28: WARNING opportunity for max()

vim +4338 drivers/net/wireless/marvell/mwifiex/cfg80211.c

bf35443314acb43 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2014-10-31  4286  
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4287  /*
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4288   * This function registers the device with CFG802.11 subsystem.
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4289   *
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4290   * The function creates the wireless device/wiphy, populates it with
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4291   * default parameters and handler function pointers, and finally
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4292   * registers the device.
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4293   */
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4294  
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4295  int mwifiex_register_cfg80211(struct mwifiex_adapter *adapter)
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4296  {
270e58e8898c8be drivers/net/wireless/mwifiex/cfg80211.c         Yogesh Ashok Powar 2011-05-03  4297  	int ret;
270e58e8898c8be drivers/net/wireless/mwifiex/cfg80211.c         Yogesh Ashok Powar 2011-05-03  4298  	void *wdev_priv;
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4299  	struct wiphy *wiphy;
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4300  	struct mwifiex_private *priv = adapter->priv[MWIFIEX_BSS_TYPE_STA];
9e04a7c6d45fd70 drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar   2012-04-09  4301  	u8 *country_code;
f862bfd1837c36e drivers/net/wireless/mwifiex/cfg80211.c         Ujjal Roy          2014-01-14  4302  	u32 thr, retry;
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4303  
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4304  	/* create a new wiphy for use with cfg80211 */
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4305  	wiphy = wiphy_new(&mwifiex_cfg80211_ops,
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4306  			  sizeof(struct mwifiex_adapter *));
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4307  	if (!wiphy) {
acebe8c10a6eabd drivers/net/wireless/mwifiex/cfg80211.c         Zhaoyang Liu       2015-05-12  4308  		mwifiex_dbg(adapter, ERROR,
acebe8c10a6eabd drivers/net/wireless/mwifiex/cfg80211.c         Zhaoyang Liu       2015-05-12  4309  			    "%s: creating new wiphy\n", __func__);
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4310  		return -ENOMEM;
b53575ecf939a4f drivers/net/wireless/mwifiex/cfg80211.c         Christoph Fritz    2011-05-08  4311  	}
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4312  	wiphy->max_scan_ssids = MWIFIEX_MAX_SSID_LIST_LENGTH;
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4313  	wiphy->max_scan_ie_len = MWIFIEX_MAX_VSIE_LEN;
83719be861d2301 drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao         2012-09-25  4314  	wiphy->mgmt_stypes = mwifiex_mgmt_stypes;
7feb4c48313d58b drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao         2012-09-25  4315  	wiphy->max_remain_on_channel_duration = 5000;
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4316  	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
197f4a2ec99dd3a drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao         2012-09-25  4317  				 BIT(NL80211_IFTYPE_P2P_CLIENT) |
197f4a2ec99dd3a drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao         2012-09-25  4318  				 BIT(NL80211_IFTYPE_P2P_GO) |
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4319  				 BIT(NL80211_IFTYPE_AP);
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4320  
6f21ab30469d670 drivers/net/wireless/marvell/mwifiex/cfg80211.c Brian Norris       2019-02-14  4321  	if (ISSUPP_ADHOC_ENABLED(adapter->fw_cap_info))
6f21ab30469d670 drivers/net/wireless/marvell/mwifiex/cfg80211.c Brian Norris       2019-02-14  4322  		wiphy->interface_modes |= BIT(NL80211_IFTYPE_ADHOC);
6f21ab30469d670 drivers/net/wireless/marvell/mwifiex/cfg80211.c Brian Norris       2019-02-14  4323  
57fbcce37be7c1d drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Berg      2016-04-12  4324  	wiphy->bands[NL80211_BAND_2GHZ] = &mwifiex_band_2ghz;
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4325  	if (adapter->config_bands & BAND_A)
57fbcce37be7c1d drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Berg      2016-04-12  4326  		wiphy->bands[NL80211_BAND_5GHZ] = &mwifiex_band_5ghz;
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4327  	else
57fbcce37be7c1d drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Berg      2016-04-12  4328  		wiphy->bands[NL80211_BAND_5GHZ] = NULL;
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4329  
de9e9932b76d545 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2015-06-22  4330  	if (adapter->drcs_enabled && ISSUPP_DRCS_ENABLED(adapter->fw_cap_info))
cc7359b5c82f67a drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2015-06-22  4331  		wiphy->iface_combinations = &mwifiex_iface_comb_ap_sta_drcs;
cc7359b5c82f67a drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2015-06-22  4332  	else if (adapter->is_hw_11ac_capable)
cc7359b5c82f67a drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2015-06-22  4333  		wiphy->iface_combinations = &mwifiex_iface_comb_ap_sta_vht;
de9e9932b76d545 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2015-06-22  4334  	else
cd8440dabcfb336 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4335  		wiphy->iface_combinations = &mwifiex_iface_comb_ap_sta;
cd8440dabcfb336 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4336  	wiphy->n_iface_combinations = 1;
cd8440dabcfb336 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4337  
982d7287f8dad2d drivers/net/wireless/marvell/mwifiex/cfg80211.c Pali Rohár         2020-05-21 @4338  	if (adapter->max_sta_conn > adapter->max_p2p_conn)
982d7287f8dad2d drivers/net/wireless/marvell/mwifiex/cfg80211.c Pali Rohár         2020-05-21  4339  		wiphy->max_ap_assoc_sta = adapter->max_sta_conn;
982d7287f8dad2d drivers/net/wireless/marvell/mwifiex/cfg80211.c Pali Rohár         2020-05-21  4340  	else
982d7287f8dad2d drivers/net/wireless/marvell/mwifiex/cfg80211.c Pali Rohár         2020-05-21  4341  		wiphy->max_ap_assoc_sta = adapter->max_p2p_conn;
982d7287f8dad2d drivers/net/wireless/marvell/mwifiex/cfg80211.c Pali Rohár         2020-05-21  4342  
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4343  	/* Initialize cipher suits */
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4344  	wiphy->cipher_suites = mwifiex_cipher_suites;
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4345  	wiphy->n_cipher_suites = ARRAY_SIZE(mwifiex_cipher_suites);
5e6e3a92b9a4c94 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao          2011-03-21  4346  
72539799104d4d7 drivers/net/wireless/marvell/mwifiex/cfg80211.c Amitkumar Karwar   2016-08-09  4347  	if (adapter->regd) {
72539799104d4d7 drivers/net/wireless/marvell/mwifiex/cfg80211.c Amitkumar Karwar   2016-08-09  4348  		wiphy->regulatory_flags |= REGULATORY_CUSTOM_REG |
72539799104d4d7 drivers/net/wireless/marvell/mwifiex/cfg80211.c Amitkumar Karwar   2016-08-09  4349  					   REGULATORY_DISABLE_BEACON_HINTS |
947d315257f9b25 drivers/net/wireless/marvell/mwifiex/cfg80211.c Amitkumar Karwar   2015-12-04  4350  					   REGULATORY_COUNTRY_IE_IGNORE;
72539799104d4d7 drivers/net/wireless/marvell/mwifiex/cfg80211.c Amitkumar Karwar   2016-08-09  4351  		wiphy_apply_custom_regulatory(wiphy, adapter->regd);
72539799104d4d7 drivers/net/wireless/marvell/mwifiex/cfg80211.c Amitkumar Karwar   2016-08-09  4352  	}
947d315257f9b25 drivers/net/wireless/marvell/mwifiex/cfg80211.c Amitkumar Karwar   2015-12-04  4353  
8d05eb222074169 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2015-01-28  4354  	ether_addr_copy(wiphy->perm_addr, adapter->perm_addr);
d6bffe8bb520bc1 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-05-08  4355  	wiphy->signal_type = CFG80211_SIGNAL_TYPE_MBM;
2dd2bd6b36bc10b drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2012-06-28  4356  	wiphy->flags |= WIPHY_FLAG_HAVE_AP_SME |
cc0ba0d522c4054 drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar   2012-09-10  4357  			WIPHY_FLAG_AP_PROBE_RESP_OFFLOAD |
54428c57b6d7a9d drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2013-01-02  4358  			WIPHY_FLAG_AP_UAPSD |
7d652034d1a08bd drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2015-01-28  4359  			WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL |
c2b6680f63ff472 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2015-06-03  4360  			WIPHY_FLAG_HAS_CHANNEL_SWITCH |
c2b6680f63ff472 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2015-06-03  4361  			WIPHY_FLAG_PS_ON_BY_DEFAULT;
b23bce296568011 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2014-02-07  4362  
b23bce296568011 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2014-02-07  4363  	if (ISSUPP_TDLS_ENABLED(adapter->fw_cap_info))
b23bce296568011 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2014-02-07  4364  		wiphy->flags |= WIPHY_FLAG_SUPPORTS_TDLS |
b23bce296568011 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2014-02-07  4365  				WIPHY_FLAG_TDLS_EXTERNAL_SETUP;
b23bce296568011 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil      2014-02-07  4366  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
