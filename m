Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FC7A50
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 01:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729818215; cv=none; b=u5Sr6xG1XKZDzubFh+OY57E9dmMGz5S9evxSsRcve6HlL/9Gdx6QTgYPX0tW+2h7il8DP7vJPd6ThxQF1CUJhmBPiIPaXnWTo80HdMoswZt8CaJP+StmfKmHW+b1unW1vM7c60lItj7h613AUaQJap5phmeHa5hYSLJ0XSeLdjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729818215; c=relaxed/simple;
	bh=A32w2hGN57mYbOOwii56oU574fy3NF1zH4rRLdSzyFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XK41atzOFP3xg7znPkQiTxHUy706ml8PU8ydG7lAeaD0Gbxe1GgkRjfF3moYdoU58n+dMmPQNUjq/x99uzYl4wvnRoLjpG7os3UaM/Kl1yeAoR8ewHNFz3G7wKsdF+2ssnKiLdzvOW/wL88+18rXAzXMAp+LCJ5CFoD8wU33StI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XplIERYS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XplIERYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729818212; x=1761354212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A32w2hGN57mYbOOwii56oU574fy3NF1zH4rRLdSzyFk=;
  b=XplIERYSvi47X5whNTE7Vmv4klTWdfjikbCKdjLyNSX1vwgz4pJ+ep/E
   +V15+sDjzYXyzR+npGRBCA6Va0HiT06bpuJjcwHewiHcvMGGkaP3l7rfD
   BV1+qlgwWsV4k2ZaUaVapX23vLc/mqD9bPBvm6UWOEHFi2BHctjkQux2i
   Jvt26Yi9ZnQQGCTEVFYHZj+zFlo11vWyiodHg/owDgD8T6ICn6Gqadnuw
   Li6ZSl+dqFcOxo0K77O+VO/6abJ8fuO5xY5jUJ9d+txBmhUbaR+Wlylse
   WXDL3eAJ/N3kPVR6Kwb2fLwRJ561Rx/cXyvWMBbQrW0R3hGhOpKCeSuEw
   g==;
X-CSE-ConnectionGUID: IeXZZMfGTHSURLIgv73qbA==
X-CSE-MsgGUID: KNvfrzhwQSuox8yc53Px4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17107027"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="17107027"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 18:03:31 -0700
X-CSE-ConnectionGUID: Q6IKITrwSmiDUxSAFUlfuA==
X-CSE-MsgGUID: K2On7rOvTCejCduF6XzBNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80866448"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Oct 2024 18:03:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t48jf-000XLQ-1q;
	Fri, 25 Oct 2024 01:03:27 +0000
Date: Fri, 25 Oct 2024 09:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4308/6766]
 drivers/net/wireless/ath/ath12k/mac.c:4306 ath12k_mac_op_set_key() error:
 uninitialized symbol 'ret'.
Message-ID: <202410250847.8S8Q6uC7-lkp@intel.com>
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
TO: Rameshkumar Sundaram <quic_ramess@quicinc.com>
CC: Jeff Johnson <quic_jjohnson@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
commit: 25e18b9d6b4bfd9cb3dd32e7b081eef306cd2517 [4308/6766] wifi: ath12k: modify ath12k_mac_op_set_key() for MLO
:::::: branch date: 19 hours ago
:::::: commit date: 8 days ago
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250847.8S8Q6uC7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410250847.8S8Q6uC7-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:4306 ath12k_mac_op_set_key() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1451 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1439 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:5103 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:5105 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.

vim +/ret +4306 drivers/net/wireless/ath/ath12k/mac.c

25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4221  
b5068bc9180d06 Sriram R             2024-04-09  4222  static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
b5068bc9180d06 Sriram R             2024-04-09  4223  				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
b5068bc9180d06 Sriram R             2024-04-09  4224  				 struct ieee80211_key_conf *key)
b5068bc9180d06 Sriram R             2024-04-09  4225  {
3dd2c68f206ef7 Sriram R             2024-10-15  4226  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
3dd2c68f206ef7 Sriram R             2024-10-15  4227  	struct ath12k_link_vif *arvif;
b89b5dbea65294 Sriram R             2024-10-15  4228  	struct ath12k_link_sta *arsta = NULL;
b5068bc9180d06 Sriram R             2024-04-09  4229  	struct ath12k_vif_cache *cache;
b89b5dbea65294 Sriram R             2024-10-15  4230  	struct ath12k_sta *ahsta;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4231  	unsigned long links;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4232  	u8 link_id;
b5068bc9180d06 Sriram R             2024-04-09  4233  	int ret;
b5068bc9180d06 Sriram R             2024-04-09  4234  
b8c67509b91ec2 Kalle Valo           2024-10-07  4235  	lockdep_assert_wiphy(hw->wiphy);
b8c67509b91ec2 Kalle Valo           2024-10-07  4236  
b5068bc9180d06 Sriram R             2024-04-09  4237  	/* BIP needs to be done in software */
b5068bc9180d06 Sriram R             2024-04-09  4238  	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
b5068bc9180d06 Sriram R             2024-04-09  4239  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
b5068bc9180d06 Sriram R             2024-04-09  4240  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
3dd2c68f206ef7 Sriram R             2024-10-15  4241  	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
b5068bc9180d06 Sriram R             2024-04-09  4242  		return 1;
3dd2c68f206ef7 Sriram R             2024-10-15  4243  	}
b5068bc9180d06 Sriram R             2024-04-09  4244  
b5068bc9180d06 Sriram R             2024-04-09  4245  	if (key->keyidx > WMI_MAX_KEY_INDEX)
b5068bc9180d06 Sriram R             2024-04-09  4246  		return -ENOSPC;
b5068bc9180d06 Sriram R             2024-04-09  4247  
b5068bc9180d06 Sriram R             2024-04-09  4248  	if (sta) {
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4249  		ahsta = ath12k_sta_to_ahsta(sta);
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4250  		/* For an ML STA Pairwise key is same for all associated link Stations,
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4251  		 * hence do set key for all link STAs which are active.
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4252  		 */
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4253  		if (sta->mlo) {
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4254  			links = ahsta->links_map;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4255  			for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4256  				arvif = wiphy_dereference(hw->wiphy,
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4257  							  ahvif->link[link_id]);
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4258  				arsta = wiphy_dereference(hw->wiphy,
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4259  							  ahsta->link[link_id]);
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4260  
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4261  				if (WARN_ON(!arvif || !arsta))
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4262  					/* arvif and arsta are expected to be valid when
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4263  					 * STA is present.
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4264  					 */
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4265  					continue;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4266  
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4267  				ret = ath12k_mac_set_key(arvif->ar, cmd, arvif,
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4268  							 arsta, key);
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4269  				if (ret)
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4270  					break;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4271  			}
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4272  		} else {
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4273  			arsta = &ahsta->deflink;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4274  			arvif = arsta->arvif;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4275  			if (WARN_ON(!arvif)) {
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4276  				ret = -EINVAL;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4277  				goto out;
b5068bc9180d06 Sriram R             2024-04-09  4278  			}
b5068bc9180d06 Sriram R             2024-04-09  4279  
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4280  			ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, arsta, key);
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4281  		}
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4282  	} else {
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4283  		if (key->link_id >= 0 && key->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4284  			link_id = key->link_id;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4285  			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4286  		} else {
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4287  			link_id = 0;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4288  			arvif = &ahvif->deflink;
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4289  		}
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4290  
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4291  		if (!arvif || !arvif->is_created) {
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4292  			cache = ath12k_ahvif_get_link_cache(ahvif, link_id);
b5068bc9180d06 Sriram R             2024-04-09  4293  			if (!cache)
b5068bc9180d06 Sriram R             2024-04-09  4294  				return -ENOSPC;
3dd2c68f206ef7 Sriram R             2024-10-15  4295  
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4296  			ret = ath12k_mac_update_key_cache(cache, cmd, sta, key);
3dd2c68f206ef7 Sriram R             2024-10-15  4297  
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4298  			return ret;
b5068bc9180d06 Sriram R             2024-04-09  4299  		}
b5068bc9180d06 Sriram R             2024-04-09  4300  
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4301  		ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
b89b5dbea65294 Sriram R             2024-10-15  4302  	}
b89b5dbea65294 Sriram R             2024-10-15  4303  
25e18b9d6b4bfd Rameshkumar Sundaram 2024-10-15  4304  out:
3dd2c68f206ef7 Sriram R             2024-10-15  4305  
d889913205cf7e Kalle Valo           2022-11-28 @4306  	return ret;
d889913205cf7e Kalle Valo           2022-11-28  4307  }
d889913205cf7e Kalle Valo           2022-11-28  4308  

:::::: The code at line 4306 was first introduced by commit
:::::: d889913205cf7ebda905b1e62c5867ed4e39f6c2 wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices

:::::: TO: Kalle Valo <quic_kvalo@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
