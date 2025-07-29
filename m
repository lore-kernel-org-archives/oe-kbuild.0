Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C521D001
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Jul 2025 23:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753831763; cv=none; b=E6SmJfbrUd9J7YUEkoB/3/CagOopZBAH4pdm/dYdIqIsPnyN+9SuvB4yq1mB6RpNCpBmnwmzYSHnNL7tHX0T20jTVdWaH9sfA5FTyoiP4db1F4jmAc/hmMvKdAR8BLY9kJfZcX1XS0bLk2ny1LunymabN/KfB0SGQpYZjwCIc4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753831763; c=relaxed/simple;
	bh=SVA/n67qOJgrRiqw3Y0kmjozvwn3lWi0O8fMZ8B4kcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M9j203gWTK6AjDE+YUuOy8f4L5y9lIT95EZ7gnm8LaTLqK+wytkL78i5gBirXmopKhiDwLTC76BcuTARb5rxXQA2vLWVqPBsddx9i8d9fQ1cqIXmCt2RcCK0XCeG3bndGKRuYobaD5zbroV1qGq4qWr76Y2f3PD9kK/wZMOWMps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8TpHAGL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8TpHAGL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753831762; x=1785367762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SVA/n67qOJgrRiqw3Y0kmjozvwn3lWi0O8fMZ8B4kcc=;
  b=U8TpHAGLy+NcK5CNQBaNEcfreX4fGcjTo3n5Q5lQzkH5P+rZap0X/Iir
   vD/GciXg362JgGgM9UAXpO1iJkiGgIUbysEKOz+aOV2eHx15pwL5FLKX5
   XH5GWjDcKw64OB8krWgaKXXqiwsdMvfwgt9muQzJrec2061b1MZI9pOig
   Pd/10CzruLDmrjZaLWF+BAL22wcXW4WDn/GJKp4VQFahqiLAPEWt1AsFD
   4hjdSvxep+bII0QUVAy6vIH4vRLkaxElwjcR21FfJFoqqbao8h446KDCI
   G0Q4TAFhMfJBEG+YtAY/LGF18mc/H3x3gXGzLq/+gk3exuRvIT6lOZd1R
   A==;
X-CSE-ConnectionGUID: IPIs+0NdQ3yE/uodINo5Mw==
X-CSE-MsgGUID: XsINfQ0hQz+xEDoF+8PBMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59765617"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="59765617"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 16:29:21 -0700
X-CSE-ConnectionGUID: ZRTi2aiKTrWVFl56yze0XA==
X-CSE-MsgGUID: Y9KxCTUARFOlOH8gYLwxuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162551914"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jul 2025 16:29:19 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugtkz-0001lD-0p;
	Tue, 29 Jul 2025 23:29:17 +0000
Date: Wed, 30 Jul 2025 07:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8861/12827] net/mac80211/key.c:584
 ieee80211_key_replace() warn: Function too hairy.  No more merges.
Message-ID: <202507300712.H2K0UUnS-lkp@intel.com>
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
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   54efec8782214652b331c50646013f8526570e8d
commit: 63df3956903748c5f374a0dfe7a89490714a4625 [8861/12827] wifi: mac80211: don't mark keys for inactive links as uploaded
:::::: branch date: 18 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20250729 (https://download.01.org/0day-ci/archive/20250730/202507300712.H2K0UUnS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507300712.H2K0UUnS-lkp@intel.com/

smatch warnings:
net/mac80211/key.c:584 ieee80211_key_replace() warn: Function too hairy.  No more merges.

vim +584 net/mac80211/key.c

e5473e80d46767 Jouni Malinen     2020-02-22  436  
62872a9b9a106f Alexander Wetzel  2018-08-31  437  static int ieee80211_key_replace(struct ieee80211_sub_if_data *sdata,
ccdde7c74ffd7e Johannes Berg     2022-08-17  438  				 struct ieee80211_link_data *link,
3b96766f0e643f Johannes Berg     2008-04-08  439  				 struct sta_info *sta,
e31b82136d1adc Johannes Berg     2010-10-05  440  				 bool pairwise,
3b96766f0e643f Johannes Berg     2008-04-08  441  				 struct ieee80211_key *old,
3b96766f0e643f Johannes Berg     2008-04-08  442  				 struct ieee80211_key *new)
3b96766f0e643f Johannes Berg     2008-04-08  443  {
ccdde7c74ffd7e Johannes Berg     2022-08-17  444  	struct link_sta_info *link_sta = sta ? &sta->deflink : NULL;
ccdde7c74ffd7e Johannes Berg     2022-08-17  445  	int link_id;
f7e0104c1a4e77 Johannes Berg     2010-12-09  446  	int idx;
90cc4bd611903c Alexander Wetzel  2019-05-06  447  	int ret = 0;
e5473e80d46767 Jouni Malinen     2020-02-22  448  	bool defunikey, defmultikey, defmgmtkey, defbeaconkey;
92ea8df110b8ca Johannes Berg     2022-05-19  449  	bool is_wep;
3b96766f0e643f Johannes Berg     2008-04-08  450  
2a8b665e6bcc3d Johannes Berg     2023-08-28  451  	lockdep_assert_wiphy(sdata->local->hw.wiphy);
2a8b665e6bcc3d Johannes Berg     2023-08-28  452  
5282c3ba4c5a24 Johannes Berg     2013-10-29  453  	/* caller must provide at least one old/new */
5282c3ba4c5a24 Johannes Berg     2013-10-29  454  	if (WARN_ON(!new && !old))
62872a9b9a106f Alexander Wetzel  2018-08-31  455  		return 0;
5282c3ba4c5a24 Johannes Berg     2013-10-29  456  
92ea8df110b8ca Johannes Berg     2022-05-19  457  	if (new) {
92ea8df110b8ca Johannes Berg     2022-05-19  458  		idx = new->conf.keyidx;
92ea8df110b8ca Johannes Berg     2022-05-19  459  		is_wep = new->conf.cipher == WLAN_CIPHER_SUITE_WEP40 ||
92ea8df110b8ca Johannes Berg     2022-05-19  460  			 new->conf.cipher == WLAN_CIPHER_SUITE_WEP104;
ccdde7c74ffd7e Johannes Berg     2022-08-17  461  		link_id = new->conf.link_id;
92ea8df110b8ca Johannes Berg     2022-05-19  462  	} else {
92ea8df110b8ca Johannes Berg     2022-05-19  463  		idx = old->conf.keyidx;
92ea8df110b8ca Johannes Berg     2022-05-19  464  		is_wep = old->conf.cipher == WLAN_CIPHER_SUITE_WEP40 ||
92ea8df110b8ca Johannes Berg     2022-05-19  465  			 old->conf.cipher == WLAN_CIPHER_SUITE_WEP104;
ccdde7c74ffd7e Johannes Berg     2022-08-17  466  		link_id = old->conf.link_id;
ccdde7c74ffd7e Johannes Berg     2022-08-17  467  	}
ccdde7c74ffd7e Johannes Berg     2022-08-17  468  
ccdde7c74ffd7e Johannes Berg     2022-08-17  469  	if (WARN(old && old->conf.link_id != link_id,
ccdde7c74ffd7e Johannes Berg     2022-08-17  470  		 "old link ID %d doesn't match new link ID %d\n",
ccdde7c74ffd7e Johannes Berg     2022-08-17  471  		 old->conf.link_id, link_id))
ccdde7c74ffd7e Johannes Berg     2022-08-17  472  		return -EINVAL;
ccdde7c74ffd7e Johannes Berg     2022-08-17  473  
ccdde7c74ffd7e Johannes Berg     2022-08-17  474  	if (link_id >= 0) {
ccdde7c74ffd7e Johannes Berg     2022-08-17  475  		if (!link) {
ccdde7c74ffd7e Johannes Berg     2022-08-17  476  			link = sdata_dereference(sdata->link[link_id], sdata);
ccdde7c74ffd7e Johannes Berg     2022-08-17  477  			if (!link)
ccdde7c74ffd7e Johannes Berg     2022-08-17  478  				return -ENOLINK;
ccdde7c74ffd7e Johannes Berg     2022-08-17  479  		}
ccdde7c74ffd7e Johannes Berg     2022-08-17  480  
ccdde7c74ffd7e Johannes Berg     2022-08-17  481  		if (sta) {
ccdde7c74ffd7e Johannes Berg     2022-08-17  482  			link_sta = rcu_dereference_protected(sta->link[link_id],
4d3acf4311a040 Johannes Berg     2023-08-28  483  							     lockdep_is_held(&sta->local->hw.wiphy->mtx));
ccdde7c74ffd7e Johannes Berg     2022-08-17  484  			if (!link_sta)
ccdde7c74ffd7e Johannes Berg     2022-08-17  485  				return -ENOLINK;
ccdde7c74ffd7e Johannes Berg     2022-08-17  486  		}
ccdde7c74ffd7e Johannes Berg     2022-08-17  487  	} else {
ccdde7c74ffd7e Johannes Berg     2022-08-17  488  		link = &sdata->deflink;
92ea8df110b8ca Johannes Berg     2022-05-19  489  	}
92ea8df110b8ca Johannes Berg     2022-05-19  490  
92ea8df110b8ca Johannes Berg     2022-05-19  491  	if ((is_wep || pairwise) && idx >= NUM_DEFAULT_KEYS)
92ea8df110b8ca Johannes Berg     2022-05-19  492  		return -EINVAL;
3b96766f0e643f Johannes Berg     2008-04-08  493  
3b96766f0e643f Johannes Berg     2008-04-08  494  	WARN_ON(new && old && new->conf.keyidx != old->conf.keyidx);
3b96766f0e643f Johannes Berg     2008-04-08  495  
90cc4bd611903c Alexander Wetzel  2019-05-06  496  	if (new && sta && pairwise) {
90cc4bd611903c Alexander Wetzel  2019-05-06  497  		/* Unicast rekey needs special handling. With Extended Key ID
90cc4bd611903c Alexander Wetzel  2019-05-06  498  		 * old is still NULL for the first rekey.
90cc4bd611903c Alexander Wetzel  2019-05-06  499  		 */
90cc4bd611903c Alexander Wetzel  2019-05-06  500  		ieee80211_pairwise_rekey(old, new);
90cc4bd611903c Alexander Wetzel  2019-05-06  501  	}
90cc4bd611903c Alexander Wetzel  2019-05-06  502  
62872a9b9a106f Alexander Wetzel  2018-08-31  503  	if (old) {
90cc4bd611903c Alexander Wetzel  2019-05-06  504  		if (old->flags & KEY_FLAG_UPLOADED_TO_HARDWARE) {
90cc4bd611903c Alexander Wetzel  2019-05-06  505  			ieee80211_key_disable_hw_accel(old);
90cc4bd611903c Alexander Wetzel  2019-05-06  506  
90cc4bd611903c Alexander Wetzel  2019-05-06  507  			if (new)
90cc4bd611903c Alexander Wetzel  2019-05-06  508  				ret = ieee80211_key_enable_hw_accel(new);
90cc4bd611903c Alexander Wetzel  2019-05-06  509  		}
62872a9b9a106f Alexander Wetzel  2018-08-31  510  	} else {
2a8b665e6bcc3d Johannes Berg     2023-08-28  511  		if (!new->local->wowlan)
62872a9b9a106f Alexander Wetzel  2018-08-31  512  			ret = ieee80211_key_enable_hw_accel(new);
63df3956903748 Miri Korenblit    2025-07-09  513  		else if (link_id < 0 || !sdata->vif.active_links ||
63df3956903748 Miri Korenblit    2025-07-09  514  			 BIT(link_id) & sdata->vif.active_links)
f52a0b408ed144 Yedidya Benshimol 2023-06-21  515  			new->flags |= KEY_FLAG_UPLOADED_TO_HARDWARE;
f52a0b408ed144 Yedidya Benshimol 2023-06-21  516  	}
62872a9b9a106f Alexander Wetzel  2018-08-31  517  
62872a9b9a106f Alexander Wetzel  2018-08-31  518  	if (ret)
62872a9b9a106f Alexander Wetzel  2018-08-31  519  		return ret;
3b96766f0e643f Johannes Berg     2008-04-08  520  
ccdde7c74ffd7e Johannes Berg     2022-08-17  521  	if (new)
ccdde7c74ffd7e Johannes Berg     2022-08-17  522  		list_add_tail_rcu(&new->list, &sdata->key_list);
ccdde7c74ffd7e Johannes Berg     2022-08-17  523  
2475b1cc0d5283 Max Stepanov      2013-03-24  524  	if (sta) {
2475b1cc0d5283 Max Stepanov      2013-03-24  525  		if (pairwise) {
2475b1cc0d5283 Max Stepanov      2013-03-24  526  			rcu_assign_pointer(sta->ptk[idx], new);
96fc6efb9ad9d0 Alexander Wetzel  2019-03-19  527  			if (new &&
a0761a301746ec Johannes Berg     2020-03-26  528  			    !(new->conf.flags & IEEE80211_KEY_FLAG_NO_AUTO_TX))
a0761a301746ec Johannes Berg     2020-03-26  529  				_ieee80211_set_tx_key(new, true);
2475b1cc0d5283 Max Stepanov      2013-03-24  530  		} else {
ccdde7c74ffd7e Johannes Berg     2022-08-17  531  			rcu_assign_pointer(link_sta->gtk[idx], new);
2475b1cc0d5283 Max Stepanov      2013-03-24  532  		}
96fc6efb9ad9d0 Alexander Wetzel  2019-03-19  533  		/* Only needed for transition from no key -> key.
96fc6efb9ad9d0 Alexander Wetzel  2019-03-19  534  		 * Still triggers unnecessary when using Extended Key ID
96fc6efb9ad9d0 Alexander Wetzel  2019-03-19  535  		 * and installing the second key ID the first time.
96fc6efb9ad9d0 Alexander Wetzel  2019-03-19  536  		 */
96fc6efb9ad9d0 Alexander Wetzel  2019-03-19  537  		if (new && !old)
49ddf8e6e2347c Johannes Berg     2016-03-31  538  			ieee80211_check_fast_rx(sta);
2475b1cc0d5283 Max Stepanov      2013-03-24  539  	} else {
40b275b69ee660 Johannes Berg     2011-05-13  540  		defunikey = old &&
2a8b665e6bcc3d Johannes Berg     2023-08-28  541  			old == wiphy_dereference(sdata->local->hw.wiphy,
40b275b69ee660 Johannes Berg     2011-05-13  542  						 sdata->default_unicast_key);
40b275b69ee660 Johannes Berg     2011-05-13  543  		defmultikey = old &&
2a8b665e6bcc3d Johannes Berg     2023-08-28  544  			old == wiphy_dereference(sdata->local->hw.wiphy,
ccdde7c74ffd7e Johannes Berg     2022-08-17  545  						 link->default_multicast_key);
40b275b69ee660 Johannes Berg     2011-05-13  546  		defmgmtkey = old &&
2a8b665e6bcc3d Johannes Berg     2023-08-28  547  			old == wiphy_dereference(sdata->local->hw.wiphy,
ccdde7c74ffd7e Johannes Berg     2022-08-17  548  						 link->default_mgmt_key);
e5473e80d46767 Jouni Malinen     2020-02-22  549  		defbeaconkey = old &&
2a8b665e6bcc3d Johannes Berg     2023-08-28  550  			old == wiphy_dereference(sdata->local->hw.wiphy,
ccdde7c74ffd7e Johannes Berg     2022-08-17  551  						 link->default_beacon_key);
3b96766f0e643f Johannes Berg     2008-04-08  552  
f7e0104c1a4e77 Johannes Berg     2010-12-09  553  		if (defunikey && !new)
ccdde7c74ffd7e Johannes Berg     2022-08-17  554  			__ieee80211_set_default_key(link, -1, true, false);
f7e0104c1a4e77 Johannes Berg     2010-12-09  555  		if (defmultikey && !new)
ccdde7c74ffd7e Johannes Berg     2022-08-17  556  			__ieee80211_set_default_key(link, -1, false, true);
3cfcf6ac6d69dc Jouni Malinen     2009-01-08  557  		if (defmgmtkey && !new)
ccdde7c74ffd7e Johannes Berg     2022-08-17  558  			__ieee80211_set_default_mgmt_key(link, -1);
e5473e80d46767 Jouni Malinen     2020-02-22  559  		if (defbeaconkey && !new)
ccdde7c74ffd7e Johannes Berg     2022-08-17  560  			__ieee80211_set_default_beacon_key(link, -1);
3b96766f0e643f Johannes Berg     2008-04-08  561  
bfd8403adddd09 Johannes Berg     2022-05-16  562  		if (is_wep || pairwise)
3b96766f0e643f Johannes Berg     2008-04-08  563  			rcu_assign_pointer(sdata->keys[idx], new);
bfd8403adddd09 Johannes Berg     2022-05-16  564  		else
ccdde7c74ffd7e Johannes Berg     2022-08-17  565  			rcu_assign_pointer(link->gtk[idx], new);
bfd8403adddd09 Johannes Berg     2022-05-16  566  
f7e0104c1a4e77 Johannes Berg     2010-12-09  567  		if (defunikey && new)
ccdde7c74ffd7e Johannes Berg     2022-08-17  568  			__ieee80211_set_default_key(link, new->conf.keyidx,
f7e0104c1a4e77 Johannes Berg     2010-12-09  569  						    true, false);
f7e0104c1a4e77 Johannes Berg     2010-12-09  570  		if (defmultikey && new)
ccdde7c74ffd7e Johannes Berg     2022-08-17  571  			__ieee80211_set_default_key(link, new->conf.keyidx,
f7e0104c1a4e77 Johannes Berg     2010-12-09  572  						    false, true);
3cfcf6ac6d69dc Jouni Malinen     2009-01-08  573  		if (defmgmtkey && new)
ccdde7c74ffd7e Johannes Berg     2022-08-17  574  			__ieee80211_set_default_mgmt_key(link,
3cfcf6ac6d69dc Jouni Malinen     2009-01-08  575  							 new->conf.keyidx);
e5473e80d46767 Jouni Malinen     2020-02-22  576  		if (defbeaconkey && new)
ccdde7c74ffd7e Johannes Berg     2022-08-17  577  			__ieee80211_set_default_beacon_key(link,
e5473e80d46767 Jouni Malinen     2020-02-22  578  							   new->conf.keyidx);
3b96766f0e643f Johannes Berg     2008-04-08  579  	}
3b96766f0e643f Johannes Berg     2008-04-08  580  
b5c34f662a3519 Johannes Berg     2011-01-03  581  	if (old)
ef044763a3ca6b Eliad Peller      2015-11-17  582  		list_del_rcu(&old->list);
62872a9b9a106f Alexander Wetzel  2018-08-31  583  
62872a9b9a106f Alexander Wetzel  2018-08-31 @584  	return 0;
11a843b7e16062 Johannes Berg     2007-08-28  585  }
11a843b7e16062 Johannes Berg     2007-08-28  586  

:::::: The code at line 584 was first introduced by commit
:::::: 62872a9b9a106f00360193f428451c321ec2e823 mac80211: Fix PTK rekey freezes and clear text leak

:::::: TO: Alexander Wetzel <alexander@wetzel-home.de>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
