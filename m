Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF8A42056
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 02:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740968872; cv=none; b=FCfvQkFNEPkelkh5BPkwL2IaF2iC065KOg8fJrrj5hzwCuq/LX6NXHjlp/8sxSU3GYSemUOLu/jLF9YkIS4N6oKU6zj7KhJI3qQUIQyVkzUR15s4ddbypzpz1FmyciJ0SBnxBFKhZdM7yr7u32jxKLSuUNewoO9wpyX00I2eMhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740968872; c=relaxed/simple;
	bh=8NuBEYXsSAAq6K0BsWNBQzLcz12i3SJHPStSuE2s29E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=trU3vZOmQvAymvvmi4dULvpoRPRZTjIwLedfDEJypGLmz/vJW14OrCLOHm0g0AmuE3AQkF9nM0q/xrxiDpH6xMZxl2Gl75UXiUopM6OvN6VZwVR5EosdSKqWqwUGQ/9wZ9cDZ1b3DwCMmxIDyNV/YeZ+tt4oWtZwvVOjvf2PJUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyTfT2Wl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyTfT2Wl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740968870; x=1772504870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NuBEYXsSAAq6K0BsWNBQzLcz12i3SJHPStSuE2s29E=;
  b=MyTfT2WlUTSdUgKk9o4HZ440UqStx8PKM4NtFnvgJzTOdpDNlB4uzOw+
   YGveeNlio4aE/5edSOSAwfJ7BcUwIpQhsdpISmNBue+Lp0BootBI390A2
   noDhtonJ4Lpsc3gJcbo7wNjdYfG+/1+BvVMfau7VHjMkjqOSN+8/VtTRz
   tRv9PINMJ7WLPIJaSFn9kRGO7k/1PKwjMhBRdFJrC2arPb4Xrsdoin0P2
   9brTgYJI3jZjJl4/TmGe0Ah9kTxofRFqAFEzxGalkmGu7tziyXu+y1qxg
   wkBlCcuK+Oe2JXH5vegVXNOrzBiQdGMSJUjNDHD6HyWdymlLaukq9Jn22
   A==;
X-CSE-ConnectionGUID: 2EDwhfiTTziGAdGB6ma7Gg==
X-CSE-MsgGUID: DDyw1c6pRWWVZGIVXQRR3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41681355"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41681355"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 18:27:49 -0800
X-CSE-ConnectionGUID: jsUHuvGiS++DCAGtC8tj2w==
X-CSE-MsgGUID: BClNsQvnToa2oGX+mOhcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="117677129"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Mar 2025 18:27:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tovWz-000Hpm-2K;
	Mon, 03 Mar 2025 02:27:45 +0000
Date: Mon, 3 Mar 2025 10:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7925/main.c:2005
 mt7925_change_vif_links() warn: inconsistent returns '&dev->mt76.mutex'.
Message-ID: <202503031055.3ZRqxhAl-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Charles Han <hanchunchao@inspur.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7eb172143d5508b4da468ed59ee857c6e5e01da6
commit: 5cd0bd815c8a48862a296df9b30e0ea0da14acd3 wifi: mt76: mt7925: fix NULL deref check in mt7925_change_vif_links
date:   7 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-141-20250303 (https://download.01.org/0day-ci/archive/20250303/202503031055.3ZRqxhAl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503031055.3ZRqxhAl-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/main.c:2005 mt7925_change_vif_links() warn: inconsistent returns '&dev->mt76.mutex'.

Old smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/main.c:691 mt7925_set_key() error: uninitialized symbol 'err'.

vim +2005 drivers/net/wireless/mediatek/mt76/mt7925/main.c

43626f0e0c99159 Deren Wu    2024-06-12  1900  
69acd6d910b0c83 Sean Wang   2024-07-06  1901  static int
69acd6d910b0c83 Sean Wang   2024-07-06  1902  mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
69acd6d910b0c83 Sean Wang   2024-07-06  1903  			u16 old_links, u16 new_links,
69acd6d910b0c83 Sean Wang   2024-07-06  1904  			struct ieee80211_bss_conf *old[IEEE80211_MLD_MAX_NUM_LINKS])
69acd6d910b0c83 Sean Wang   2024-07-06  1905  {
69acd6d910b0c83 Sean Wang   2024-07-06  1906  	struct mt792x_bss_conf *mconfs[IEEE80211_MLD_MAX_NUM_LINKS] = {}, *mconf;
69acd6d910b0c83 Sean Wang   2024-07-06  1907  	struct mt792x_link_sta *mlinks[IEEE80211_MLD_MAX_NUM_LINKS] = {}, *mlink;
69acd6d910b0c83 Sean Wang   2024-07-06  1908  	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
69acd6d910b0c83 Sean Wang   2024-07-06  1909  	unsigned long add = new_links & ~old_links;
69acd6d910b0c83 Sean Wang   2024-07-06  1910  	unsigned long rem = old_links & ~new_links;
69acd6d910b0c83 Sean Wang   2024-07-06  1911  	struct mt792x_dev *dev = mt792x_hw_dev(hw);
69acd6d910b0c83 Sean Wang   2024-07-06  1912  	struct mt792x_phy *phy = mt792x_hw_phy(hw);
69acd6d910b0c83 Sean Wang   2024-07-06  1913  	struct ieee80211_bss_conf *link_conf;
69acd6d910b0c83 Sean Wang   2024-07-06  1914  	unsigned int link_id;
69acd6d910b0c83 Sean Wang   2024-07-06  1915  	int err;
69acd6d910b0c83 Sean Wang   2024-07-06  1916  
69acd6d910b0c83 Sean Wang   2024-07-06  1917  	if (old_links == new_links)
69acd6d910b0c83 Sean Wang   2024-07-06  1918  		return 0;
69acd6d910b0c83 Sean Wang   2024-07-06  1919  
69acd6d910b0c83 Sean Wang   2024-07-06  1920  	mt792x_mutex_acquire(dev);
69acd6d910b0c83 Sean Wang   2024-07-06  1921  
69acd6d910b0c83 Sean Wang   2024-07-06  1922  	for_each_set_bit(link_id, &rem, IEEE80211_MLD_MAX_NUM_LINKS) {
69acd6d910b0c83 Sean Wang   2024-07-06  1923  		mconf = mt792x_vif_to_link(mvif, link_id);
69acd6d910b0c83 Sean Wang   2024-07-06  1924  		mlink = mt792x_sta_to_link(&mvif->sta, link_id);
69acd6d910b0c83 Sean Wang   2024-07-06  1925  
69acd6d910b0c83 Sean Wang   2024-07-06  1926  		if (!mconf || !mlink)
69acd6d910b0c83 Sean Wang   2024-07-06  1927  			continue;
69acd6d910b0c83 Sean Wang   2024-07-06  1928  
69acd6d910b0c83 Sean Wang   2024-07-06  1929  		if (mconf != &mvif->bss_conf) {
69acd6d910b0c83 Sean Wang   2024-07-06  1930  			mt792x_mac_link_bss_remove(dev, mconf, mlink);
69acd6d910b0c83 Sean Wang   2024-07-06  1931  			devm_kfree(dev->mt76.dev, mconf);
69acd6d910b0c83 Sean Wang   2024-07-06  1932  			devm_kfree(dev->mt76.dev, mlink);
69acd6d910b0c83 Sean Wang   2024-07-06  1933  		}
69acd6d910b0c83 Sean Wang   2024-07-06  1934  
69acd6d910b0c83 Sean Wang   2024-07-06  1935  		rcu_assign_pointer(mvif->link_conf[link_id], NULL);
69acd6d910b0c83 Sean Wang   2024-07-06  1936  		rcu_assign_pointer(mvif->sta.link[link_id], NULL);
69acd6d910b0c83 Sean Wang   2024-07-06  1937  	}
69acd6d910b0c83 Sean Wang   2024-07-06  1938  
69acd6d910b0c83 Sean Wang   2024-07-06  1939  	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
69acd6d910b0c83 Sean Wang   2024-07-06  1940  		if (!old_links) {
9f89f05bef1a573 Sean Wang   2024-07-06  1941  			mvif->deflink_id = link_id;
69acd6d910b0c83 Sean Wang   2024-07-06  1942  			mconf = &mvif->bss_conf;
69acd6d910b0c83 Sean Wang   2024-07-06  1943  			mlink = &mvif->sta.deflink;
69acd6d910b0c83 Sean Wang   2024-07-06  1944  		} else {
69acd6d910b0c83 Sean Wang   2024-07-06  1945  			mconf = devm_kzalloc(dev->mt76.dev, sizeof(*mconf),
69acd6d910b0c83 Sean Wang   2024-07-06  1946  					     GFP_KERNEL);
69acd6d910b0c83 Sean Wang   2024-07-06  1947  			mlink = devm_kzalloc(dev->mt76.dev, sizeof(*mlink),
69acd6d910b0c83 Sean Wang   2024-07-06  1948  					     GFP_KERNEL);
5cd0bd815c8a488 Charles Han 2024-10-25  1949  			if (!mconf || !mlink)
5cd0bd815c8a488 Charles Han 2024-10-25  1950  				return -ENOMEM;
69acd6d910b0c83 Sean Wang   2024-07-06  1951  		}
69acd6d910b0c83 Sean Wang   2024-07-06  1952  
69acd6d910b0c83 Sean Wang   2024-07-06  1953  		mconfs[link_id] = mconf;
69acd6d910b0c83 Sean Wang   2024-07-06  1954  		mlinks[link_id] = mlink;
69acd6d910b0c83 Sean Wang   2024-07-06  1955  		mconf->link_id = link_id;
69acd6d910b0c83 Sean Wang   2024-07-06  1956  		mconf->vif = mvif;
69acd6d910b0c83 Sean Wang   2024-07-06  1957  		mlink->wcid.link_id = link_id;
4f0f33d2747f207 Sean Wang   2024-07-06  1958  		mlink->wcid.link_valid = !!vif->valid_links;
b1d21403c0cfe71 Sean Wang   2024-07-06  1959  		mlink->wcid.def_wcid = &mvif->sta.deflink.wcid;
69acd6d910b0c83 Sean Wang   2024-07-06  1960  	}
69acd6d910b0c83 Sean Wang   2024-07-06  1961  
69acd6d910b0c83 Sean Wang   2024-07-06  1962  	if (hweight16(mvif->valid_links) == 0)
69acd6d910b0c83 Sean Wang   2024-07-06  1963  		mt792x_mac_link_bss_remove(dev, &mvif->bss_conf,
69acd6d910b0c83 Sean Wang   2024-07-06  1964  					   &mvif->sta.deflink);
69acd6d910b0c83 Sean Wang   2024-07-06  1965  
69acd6d910b0c83 Sean Wang   2024-07-06  1966  	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
69acd6d910b0c83 Sean Wang   2024-07-06  1967  		mconf = mconfs[link_id];
69acd6d910b0c83 Sean Wang   2024-07-06  1968  		mlink = mlinks[link_id];
69acd6d910b0c83 Sean Wang   2024-07-06  1969  		link_conf = mt792x_vif_to_bss_conf(vif, link_id);
69acd6d910b0c83 Sean Wang   2024-07-06  1970  
69acd6d910b0c83 Sean Wang   2024-07-06  1971  		rcu_assign_pointer(mvif->link_conf[link_id], mconf);
69acd6d910b0c83 Sean Wang   2024-07-06  1972  		rcu_assign_pointer(mvif->sta.link[link_id], mlink);
69acd6d910b0c83 Sean Wang   2024-07-06  1973  
69acd6d910b0c83 Sean Wang   2024-07-06  1974  		err = mt7925_mac_link_bss_add(dev, link_conf, mlink);
69acd6d910b0c83 Sean Wang   2024-07-06  1975  		if (err < 0)
69acd6d910b0c83 Sean Wang   2024-07-06  1976  			goto free;
69acd6d910b0c83 Sean Wang   2024-07-06  1977  
69acd6d910b0c83 Sean Wang   2024-07-06  1978  		if (mconf != &mvif->bss_conf) {
69acd6d910b0c83 Sean Wang   2024-07-06  1979  			err = mt7925_set_mlo_roc(phy, &mvif->bss_conf,
69acd6d910b0c83 Sean Wang   2024-07-06  1980  						 vif->active_links);
69acd6d910b0c83 Sean Wang   2024-07-06  1981  			if (err < 0)
69acd6d910b0c83 Sean Wang   2024-07-06  1982  				goto free;
69acd6d910b0c83 Sean Wang   2024-07-06  1983  		}
69acd6d910b0c83 Sean Wang   2024-07-06  1984  	}
69acd6d910b0c83 Sean Wang   2024-07-06  1985  
69acd6d910b0c83 Sean Wang   2024-07-06  1986  	mvif->valid_links = new_links;
69acd6d910b0c83 Sean Wang   2024-07-06  1987  
69acd6d910b0c83 Sean Wang   2024-07-06  1988  	mt792x_mutex_release(dev);
69acd6d910b0c83 Sean Wang   2024-07-06  1989  
69acd6d910b0c83 Sean Wang   2024-07-06  1990  	return 0;
69acd6d910b0c83 Sean Wang   2024-07-06  1991  
69acd6d910b0c83 Sean Wang   2024-07-06  1992  free:
69acd6d910b0c83 Sean Wang   2024-07-06  1993  	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
69acd6d910b0c83 Sean Wang   2024-07-06  1994  		rcu_assign_pointer(mvif->link_conf[link_id], NULL);
69acd6d910b0c83 Sean Wang   2024-07-06  1995  		rcu_assign_pointer(mvif->sta.link[link_id], NULL);
69acd6d910b0c83 Sean Wang   2024-07-06  1996  
69acd6d910b0c83 Sean Wang   2024-07-06  1997  		if (mconf != &mvif->bss_conf)
69acd6d910b0c83 Sean Wang   2024-07-06  1998  			devm_kfree(dev->mt76.dev, mconfs[link_id]);
69acd6d910b0c83 Sean Wang   2024-07-06  1999  		if (mlink != &mvif->sta.deflink)
69acd6d910b0c83 Sean Wang   2024-07-06  2000  			devm_kfree(dev->mt76.dev, mlinks[link_id]);
69acd6d910b0c83 Sean Wang   2024-07-06  2001  	}
69acd6d910b0c83 Sean Wang   2024-07-06  2002  
69acd6d910b0c83 Sean Wang   2024-07-06  2003  	mt792x_mutex_release(dev);
69acd6d910b0c83 Sean Wang   2024-07-06  2004  
69acd6d910b0c83 Sean Wang   2024-07-06 @2005  	return err;
69acd6d910b0c83 Sean Wang   2024-07-06  2006  }
69acd6d910b0c83 Sean Wang   2024-07-06  2007  

:::::: The code at line 2005 was first introduced by commit
:::::: 69acd6d910b0c83842bd45c36224d4f8fe59d1d4 wifi: mt76: mt7925: add mt7925_change_vif_links

:::::: TO: Sean Wang <sean.wang@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
