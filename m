Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE088BE7
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728417011; cv=none; b=YZqkdKhF+rb/IJFvqHmEioHGyvKIPliCGnb5xTOJVTouXRf/ks0NfgLtXvwXph2GLR6m2spQr1qEan0MmNqdansP5jSvMJUEQ+r/EaOKDZMaBTX6czNtbCXefAzPJiQT+e4EP7nM3IftZirQncNjQXDAwEH099ferq4/INLR52Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728417011; c=relaxed/simple;
	bh=hoCN3nrl38NZNTQ2lJxbA6zfzucQbx1+FKkwc95ZSKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LFT5HOdKc4IksiUQtIvme8lAtX+pEhhYhR4ddLqjId9p2NjJL1drkEAJmGOkUNlgV1fRewT5NqBrb/Ue+/xrNBg12tO/Zdty5nan0nq2saHzIKsEcumD50jhLLxFUExQb5giVTaLP49r2ZEa4wmMjuMag9dETz7QQzcvZgvmv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZX9iXA0Y; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZX9iXA0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728417010; x=1759953010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hoCN3nrl38NZNTQ2lJxbA6zfzucQbx1+FKkwc95ZSKE=;
  b=ZX9iXA0YbD8aKoRWTuLHzWyDO2k4T1M2/C0EOnJj3LhasQQGZfh8w/Cz
   l/l0vSY5Gilf0BkIYepR16YcQVDDMTDYD/+XabAHJHQwEfJfLWf2I0Gud
   70hwVpI4MyVWJrnyQ2o3XeNJt3fYfZfriV3+uHGqs8ZHzuwCNAqh5JMXx
   5nyraWY6DViT8aJTc0iXAuC3vtEuAgptt8c8NXc8qrcR+PQ0UTMUxc3Ev
   HPzBbH93+HY1pT+eaYbpZyy8/W0wpLS/4mifzrJ0jmY1e7YTL0IDKoZsu
   iO0i02KUIGiHNQRrNKqA6ENXU3npFkRDTROmtAq2xRFd5Gr8zJEvgvwPY
   w==;
X-CSE-ConnectionGUID: FEoXgP6bR2m8nKqGKQegBA==
X-CSE-MsgGUID: jpPTv/FhTFGZViI4TUbbjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31546221"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="31546221"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 12:50:09 -0700
X-CSE-ConnectionGUID: vTL/WjqGRXirOJExDG7KHA==
X-CSE-MsgGUID: 4zO9YAIEQq2qhiF4PAOqWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="76322775"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 12:50:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syGDd-0008KG-2H;
	Tue, 08 Oct 2024 19:50:05 +0000
Date: Wed, 9 Oct 2024 03:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath12k-mlo-qcn9274 /81]
 drivers/net/wireless/ath/ath12k/mac.c:4304 ath12k_mac_op_set_key() error:
 uninitialized symbol 'ret'.
Message-ID: <202410090311.SK1SO5GL-lkp@intel.com>
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
TO: Rameshkumar Sundaram <quic_ramess@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
commit: 573de29145bf929c428f9e2dc55ad3f5f3da8453 [/81] wifi: ath12k: modify ath12k_mac_op_set_key for MLO
:::::: branch date: 2 hours ago
:::::: commit date: 5 days ago
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090311.SK1SO5GL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410090311.SK1SO5GL-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:4304 ath12k_mac_op_set_key() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1451 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1439 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:5099 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:5101 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:10094 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 10083)
drivers/net/wireless/ath/ath12k/mac.c:10161 ath12k_mac_allocate() error: uninitialized symbol 'ab'.

vim +/ret +4304 drivers/net/wireless/ath/ath12k/mac.c

573de29145bf92 Rameshkumar Sundaram 2024-08-09  4221  
b5068bc9180d06 Sriram R             2024-04-09  4222  static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
b5068bc9180d06 Sriram R             2024-04-09  4223  				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
b5068bc9180d06 Sriram R             2024-04-09  4224  				 struct ieee80211_key_conf *key)
b5068bc9180d06 Sriram R             2024-04-09  4225  {
18333c4baa4d72 Sriram R             2024-01-27  4226  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
18333c4baa4d72 Sriram R             2024-01-27  4227  	struct ath12k_link_vif *arvif;
611aacdb3540ff Sriram R             2024-04-14  4228  	struct ath12k_link_sta *arsta = NULL;
b5068bc9180d06 Sriram R             2024-04-09  4229  	struct ath12k_vif_cache *cache;
611aacdb3540ff Sriram R             2024-04-14  4230  	struct ath12k_sta *ahsta;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4231  	unsigned long links;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4232  	u8 link_id;
b5068bc9180d06 Sriram R             2024-04-09  4233  	int ret;
b5068bc9180d06 Sriram R             2024-04-09  4234  
d4243fd891671d Kalle Valo           2024-09-25  4235  	lockdep_assert_wiphy(hw->wiphy);
d4243fd891671d Kalle Valo           2024-09-25  4236  
b5068bc9180d06 Sriram R             2024-04-09  4237  	/* BIP needs to be done in software */
b5068bc9180d06 Sriram R             2024-04-09  4238  	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
b5068bc9180d06 Sriram R             2024-04-09  4239  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
b5068bc9180d06 Sriram R             2024-04-09  4240  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
18333c4baa4d72 Sriram R             2024-01-27  4241  	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
b5068bc9180d06 Sriram R             2024-04-09  4242  		return 1;
18333c4baa4d72 Sriram R             2024-01-27  4243  	}
b5068bc9180d06 Sriram R             2024-04-09  4244  
b5068bc9180d06 Sriram R             2024-04-09  4245  	if (key->keyidx > WMI_MAX_KEY_INDEX)
b5068bc9180d06 Sriram R             2024-04-09  4246  		return -ENOSPC;
b5068bc9180d06 Sriram R             2024-04-09  4247  
b5068bc9180d06 Sriram R             2024-04-09  4248  	if (sta) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4249  		ahsta = ath12k_sta_to_ahsta(sta);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4250  		/* For an ML STA Pairwise key is same for all associated link Stations,
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4251  		 * hence do set key for all link STAs which are active.
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4252  		 */
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4253  		if (sta->mlo) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4254  			links = ahsta->links_map;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4255  			for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4256  				arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4257  				arsta = wiphy_dereference(hw->wiphy, ahsta->link[link_id]);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4258  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4259  				if (WARN_ON(!arvif || !arsta))
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4260  					/* arvif and arsta are expected to be valid when
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4261  					 * STA is present.
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4262  					 */
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4263  					continue;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4264  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4265  				ret = ath12k_mac_set_key(arvif->ar, cmd, arvif,
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4266  							 arsta, key);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4267  				if (ret)
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4268  					break;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4269  			}
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4270  		} else {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4271  			arsta = &ahsta->deflink;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4272  			arvif = arsta->arvif;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4273  			if (WARN_ON(!arvif)) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4274  				ret = -EINVAL;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4275  				goto out;
b5068bc9180d06 Sriram R             2024-04-09  4276  			}
b5068bc9180d06 Sriram R             2024-04-09  4277  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4278  			ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, arsta, key);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4279  		}
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4280  	} else {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4281  		if (key->link_id >= 0 && key->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4282  			link_id = key->link_id;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4283  			arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4284  		} else {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4285  			link_id = 0;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4286  			arvif = &ahvif->deflink;
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4287  		}
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4288  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4289  		if (!arvif || !arvif->is_created) {
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4290  			cache = ath12k_ahvif_get_link_cache(ahvif, link_id);
b5068bc9180d06 Sriram R             2024-04-09  4291  			if (!cache)
b5068bc9180d06 Sriram R             2024-04-09  4292  				return -ENOSPC;
18333c4baa4d72 Sriram R             2024-01-27  4293  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4294  			ret = ath12k_mac_update_key_cache(cache, cmd, sta, key);
18333c4baa4d72 Sriram R             2024-01-27  4295  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4296  			return ret;
b5068bc9180d06 Sriram R             2024-04-09  4297  		}
b5068bc9180d06 Sriram R             2024-04-09  4298  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4299  		ret = ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
611aacdb3540ff Sriram R             2024-04-14  4300  	}
611aacdb3540ff Sriram R             2024-04-14  4301  
573de29145bf92 Rameshkumar Sundaram 2024-08-09  4302  out:
18333c4baa4d72 Sriram R             2024-01-27  4303  
d889913205cf7e Kalle Valo           2022-11-28 @4304  	return ret;
d889913205cf7e Kalle Valo           2022-11-28  4305  }
d889913205cf7e Kalle Valo           2022-11-28  4306  

:::::: The code at line 4304 was first introduced by commit
:::::: d889913205cf7ebda905b1e62c5867ed4e39f6c2 wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices

:::::: TO: Kalle Valo <quic_kvalo@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
