Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987D9346795
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 05:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782969018; cv=none; b=RhM/osv9+N+1rTzzHYliaTNnLW2yIf6IGaitumR1BPGX4VF7V1I6HcIcpgkqJHE5mAaU4k+XNhWiGutW1JgYQuZvRifZIeVt69FSGeYOwdVtju1ZFrVDGkpnXHiKby++GJxEfSl80eRLdeQKgZ46dzvaWF/oQEQlN9WbW3YFUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782969018; c=relaxed/simple;
	bh=zLyh99jxeANAFaRNbrOto0LWK3Nb8pVaKVbjYnaG8KE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mCLNwfgxl0lF87DWIjoo/VoPTzSn87lJLJFAsAseYSbS/Ds57QML1ldMDOcwicvVoZbuUlx1IaHGyD8emGBhAM99TPdj7S5i2esTpWvj0mmQJ/7jzocfwxLXnuEN95FaYsEVsyKAqau8YBkJCjXUdI7rC8riDFwtTlGVmcWTynI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0zcB5M4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0zcB5M4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782969014; x=1814505014;
  h=date:from:to:cc:subject:message-id;
  bh=zLyh99jxeANAFaRNbrOto0LWK3Nb8pVaKVbjYnaG8KE=;
  b=O0zcB5M44n8u7E5kVH4qFtTTgZHZdYRDcIMsjpUX5KqNvgR0V2PWPath
   yzXyBAafgSBM0mTSpoyj46Y2bSryIF7V7Z8NJ7sZ2FKR7GUD1ITooYRZz
   xdvCsY3mcidMcw0tLOA5Qx5IC3sD7I8APrl/agfSyW6nHHl3mBZGmj2xN
   EOGCXH8ypNV5zrjPSy+VyoRfBLGAy8YSPVlPQeACoNMjNDJ7I2KbbPMug
   lLP+0wd1F2VbjiZf2IbtqOu8tHpfdr+0jvUgntBUgAO4+jl0LprAx6j1k
   sO5voc6vH3b/65PfJElJumIQrMT6OD1ND1ZHo92gjvPIsUpaqcOom8Dij
   A==;
X-CSE-ConnectionGUID: rnze28DUTWGQ55X5+Qzsrw==
X-CSE-MsgGUID: B89g7pKYS7KhiUMVArJKIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87542847"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87542847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 22:10:14 -0700
X-CSE-ConnectionGUID: zXJo/XhZQI2W4zRFgsRljg==
X-CSE-MsgGUID: d+6xCiATSXm5ZDmT/AfJFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248300586"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 01 Jul 2026 22:10:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf9gg-00000000A0V-0ygx;
	Thu, 02 Jul 2026 05:10:10 +0000
Date: Thu, 02 Jul 2026 13:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/mac80211/chan.c:1883 ieee80211_vif_use_reserved_switch()
 error: we previously assumed 'iter.link' could be null (see line 1862)
Message-ID: <202607021329.ot3ytAHS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a50a141f05a8d1737661b19ee22ff8455b94409
commit: 589c06e8fdeec592e018004cebe283370160e581 wifi: mac80211: add NAN local schedule support
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260702/202607021329.ot3ytAHS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 589c06e8fdee ("wifi: mac80211: add NAN local schedule support")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607021329.ot3ytAHS-lkp@intel.com/

New smatch warnings:
net/mac80211/chan.c:1883 ieee80211_vif_use_reserved_switch() error: we previously assumed 'iter.link' could be null (see line 1862)

Old smatch warnings:
net/mac80211/chan.c:1884 ieee80211_vif_use_reserved_switch() warn: missing unwind goto?

vim +1883 net/mac80211/chan.c

5bcae31d9cb1ebf Michal Kazior      2014-06-25  1818  
649b2a4da5d8a39 Johannes Berg      2014-07-25  1819  static int ieee80211_vif_use_reserved_switch(struct ieee80211_local *local)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1820  {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1821  	struct ieee80211_chanctx *ctx, *ctx_tmp, *old_ctx;
b7f2405c6bd8ae0 Kirtika Ruchandani 2016-11-23  1822  	int err, n_assigned, n_reserved, n_ready;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1823  	int n_ctx = 0, n_vifs_switch = 0, n_vifs_assign = 0, n_vifs_ctxless = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1824  
5435af6e6ac0132 Johannes Berg      2023-08-28  1825  	lockdep_assert_wiphy(local->hw.wiphy);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1826  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1827  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1828  	 * If there are 2 independent pairs of channel contexts performing
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1829  	 * cross-switch of their vifs this code will still wait until both are
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1830  	 * ready even though it could be possible to switch one before the
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1831  	 * other is ready.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1832  	 *
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1833  	 * For practical reasons and code simplicity just do a single huge
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1834  	 * switch.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1835  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1836  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1837  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1838  	 * Verify if the reservation is still feasible.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1839  	 *  - if it's not then disconnect
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1840  	 *  - if it is but not all vifs necessary are ready then defer
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1841  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1842  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1843  	list_for_each_entry(ctx, &local->chanctx_list, list) {
1ce954c98b8968e Johannes Berg      2025-11-05  1844  		struct ieee80211_chanctx_user_iter iter;
b4f85443c17c7ed Johannes Berg      2022-05-30  1845  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1846  		if (ctx->replace_state != IEEE80211_CHANCTX_REPLACES_OTHER)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1847  			continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1848  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1849  		if (WARN_ON(!ctx->replace_ctx)) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1850  			err = -EINVAL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1851  			goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1852  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1853  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1854  		n_ctx++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1855  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1856  		n_assigned = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1857  		n_reserved = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1858  		n_ready = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1859  
de3c5142349c6cd Johannes Berg      2025-11-21  1860  		for_each_chanctx_user_assigned(local, ctx->replace_ctx, &iter) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1861  			n_assigned++;
589c06e8fdeec59 Miri Korenblit     2026-03-26 @1862  			if (iter.link && iter.link->reserved_chanctx) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1863  				n_reserved++;
1ce954c98b8968e Johannes Berg      2025-11-05  1864  				if (iter.link->reserved_ready)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1865  					n_ready++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1866  			}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1867  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1868  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1869  		if (n_assigned != n_reserved) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1870  			if (n_ready == n_reserved) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1871  				wiphy_info(local->hw.wiphy,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1872  					   "channel context reservation cannot be finalized because some interfaces aren't switching\n");
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1873  				err = -EBUSY;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1874  				goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1875  			}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1876  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1877  			return -EAGAIN;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1878  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1879  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1880  		ctx->conf.radar_enabled = false;
1ce954c98b8968e Johannes Berg      2025-11-05  1881  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  1882  			if (ieee80211_link_has_in_place_reservation(iter.link) &&
1ce954c98b8968e Johannes Berg      2025-11-05 @1883  			    !iter.link->reserved_ready)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1884  				return -EAGAIN;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1885  
1ce954c98b8968e Johannes Berg      2025-11-05  1886  			old_ctx = ieee80211_link_get_chanctx(iter.link);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1887  			if (old_ctx) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1888  				if (old_ctx->replace_state ==
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1889  				    IEEE80211_CHANCTX_WILL_BE_REPLACED)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1890  					n_vifs_switch++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1891  				else
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1892  					n_vifs_assign++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1893  			} else {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1894  				n_vifs_ctxless++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1895  			}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1896  
1ce954c98b8968e Johannes Berg      2025-11-05  1897  			if (iter.radar_required)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1898  				ctx->conf.radar_enabled = true;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1899  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1900  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1901  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1902  	if (WARN_ON(n_ctx == 0) ||
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1903  	    WARN_ON(n_vifs_switch == 0 &&
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1904  		    n_vifs_assign == 0 &&
0a44dfc07074951 Johannes Berg      2024-01-29  1905  		    n_vifs_ctxless == 0)) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1906  		err = -EINVAL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1907  		goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1908  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1909  
dd7b1bdb5614419 Johannes Berg      2024-06-12  1910  	/* update station rate control and min width before switch */
dd7b1bdb5614419 Johannes Berg      2024-06-12  1911  	list_for_each_entry(ctx, &local->chanctx_list, list) {
1ce954c98b8968e Johannes Berg      2025-11-05  1912  		struct ieee80211_chanctx_user_iter iter;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1913  
dd7b1bdb5614419 Johannes Berg      2024-06-12  1914  		if (ctx->replace_state != IEEE80211_CHANCTX_REPLACES_OTHER)
dd7b1bdb5614419 Johannes Berg      2024-06-12  1915  			continue;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1916  
dd7b1bdb5614419 Johannes Berg      2024-06-12  1917  		if (WARN_ON(!ctx->replace_ctx)) {
dd7b1bdb5614419 Johannes Berg      2024-06-12  1918  			err = -EINVAL;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1919  			goto err;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1920  		}
dd7b1bdb5614419 Johannes Berg      2024-06-12  1921  
1ce954c98b8968e Johannes Berg      2025-11-05  1922  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  1923  			if (!ieee80211_link_has_in_place_reservation(iter.link))
dd7b1bdb5614419 Johannes Berg      2024-06-12  1924  				continue;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1925  
dd7b1bdb5614419 Johannes Berg      2024-06-12  1926  			ieee80211_chan_bw_change(local,
1ce954c98b8968e Johannes Berg      2025-11-05  1927  						 ieee80211_link_get_chanctx(iter.link),
dd7b1bdb5614419 Johannes Berg      2024-06-12  1928  						 true, true);
dd7b1bdb5614419 Johannes Berg      2024-06-12  1929  		}
dd7b1bdb5614419 Johannes Berg      2024-06-12  1930  
52363af3a9c989e Johannes Berg      2025-11-05  1931  		_ieee80211_recalc_chanctx_min_def(local, ctx, NULL, true);
dd7b1bdb5614419 Johannes Berg      2024-06-12  1932  	}
dd7b1bdb5614419 Johannes Berg      2024-06-12  1933  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1934  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1935  	 * All necessary vifs are ready. Perform the switch now depending on
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1936  	 * reservations and driver capabilities.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1937  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1938  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1939  	if (n_vifs_switch > 0) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1940  		err = ieee80211_chsw_switch_vifs(local, n_vifs_switch);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1941  		if (err)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1942  			goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1943  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1944  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1945  	if (n_vifs_assign > 0 || n_vifs_ctxless > 0) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1946  		err = ieee80211_chsw_switch_ctxs(local);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1947  		if (err)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1948  			goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1949  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1950  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1951  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1952  	 * Update all structures, values and pointers to point to new channel
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1953  	 * context(s).
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1954  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1955  	list_for_each_entry(ctx, &local->chanctx_list, list) {
1ce954c98b8968e Johannes Berg      2025-11-05  1956  		struct ieee80211_chanctx_user_iter iter;
b4f85443c17c7ed Johannes Berg      2022-05-30  1957  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1958  		if (ctx->replace_state != IEEE80211_CHANCTX_REPLACES_OTHER)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1959  			continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1960  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1961  		if (WARN_ON(!ctx->replace_ctx)) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1962  			err = -EINVAL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1963  			goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1964  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1965  
1ce954c98b8968e Johannes Berg      2025-11-05  1966  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  1967  			struct ieee80211_link_data *link = iter.link;
1ce954c98b8968e Johannes Berg      2025-11-05  1968  			struct ieee80211_sub_if_data *sdata = iter.sdata;
d8675a63518c614 Johannes Berg      2022-06-17  1969  			struct ieee80211_bss_conf *link_conf = link->conf;
15ddba5f43114c1 Anjaneyulu         2023-06-04  1970  			u64 changed = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1971  
b4f85443c17c7ed Johannes Berg      2022-05-30  1972  			if (!ieee80211_link_has_in_place_reservation(link))
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1973  				continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1974  
b4f85443c17c7ed Johannes Berg      2022-05-30  1975  			rcu_assign_pointer(link_conf->chanctx_conf,
d0a9123ef548def Johannes Berg      2022-05-10  1976  					   &ctx->conf);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1977  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1978  			if (sdata->vif.type == NL80211_IFTYPE_AP)
b4f85443c17c7ed Johannes Berg      2022-05-30  1979  				__ieee80211_link_copy_chanctx_to_vlans(link,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1980  								       false);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1981  
17c18bf880b2464 Johannes Berg      2015-03-21  1982  			ieee80211_check_fast_xmit_iface(sdata);
17c18bf880b2464 Johannes Berg      2015-03-21  1983  
1ce954c98b8968e Johannes Berg      2025-11-05  1984  			link->radar_required = iter.radar_required;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1985  
1ce954c98b8968e Johannes Berg      2025-11-05  1986  			if (link_conf->chanreq.oper.width != iter.chanreq->oper.width)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1987  				changed = BSS_CHANGED_BANDWIDTH;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1988  
6092077ad09ce88 Johannes Berg      2024-01-29  1989  			ieee80211_link_update_chanreq(link, &link->reserved);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1990  			if (changed)
b4f85443c17c7ed Johannes Berg      2022-05-30  1991  				ieee80211_link_info_change_notify(sdata,
d8675a63518c614 Johannes Berg      2022-06-17  1992  								  link,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1993  								  changed);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1994  
c4382d5ca1af75c Emmanuel Grumbach  2024-10-07  1995  			ieee80211_recalc_txpower(link, false);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1996  		}
73da7d5bab79ad7 Simon Wunderlich   2013-07-11  1997  
73da7d5bab79ad7 Simon Wunderlich   2013-07-11  1998  		ieee80211_recalc_chanctx_chantype(local, ctx);
73da7d5bab79ad7 Simon Wunderlich   2013-07-11  1999  		ieee80211_recalc_smps_chanctx(local, ctx);
73da7d5bab79ad7 Simon Wunderlich   2013-07-11  2000  		ieee80211_recalc_radar_chanctx(local, ctx);
52363af3a9c989e Johannes Berg      2025-11-05  2001  		ieee80211_recalc_chanctx_min_def(local, ctx);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2002  
1ce954c98b8968e Johannes Berg      2025-11-05  2003  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  2004  			if (ieee80211_link_get_chanctx(iter.link) != ctx)
a1dc648aa76d61d Johannes Berg      2025-11-05  2005  				continue;
a1dc648aa76d61d Johannes Berg      2025-11-05  2006  
1ce954c98b8968e Johannes Berg      2025-11-05  2007  			iter.link->reserved_chanctx = NULL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2008  
1ce954c98b8968e Johannes Berg      2025-11-05  2009  			ieee80211_link_chanctx_reservation_complete(iter.link);
dd7b1bdb5614419 Johannes Berg      2024-06-12  2010  			ieee80211_chan_bw_change(local, ctx, false, false);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2011  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2012  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2013  		/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2014  		 * This context might have been a dependency for an already
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2015  		 * ready re-assign reservation interface that was deferred. Do
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2016  		 * not propagate error to the caller though. The in-place
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2017  		 * reservation for originally requested interface has already
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2018  		 * succeeded at this point.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2019  		 */
1ce954c98b8968e Johannes Berg      2025-11-05  2020  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  2021  			struct ieee80211_link_data *link = iter.link;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2022  
a1dc648aa76d61d Johannes Berg      2025-11-05  2023  			if (WARN_ON(ieee80211_link_has_in_place_reservation(link)))
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2024  				continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2025  
b4f85443c17c7ed Johannes Berg      2022-05-30  2026  			if (!link->reserved_ready)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2027  				continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2028  
b4f85443c17c7ed Johannes Berg      2022-05-30  2029  			if (ieee80211_link_get_chanctx(link))
b4f85443c17c7ed Johannes Berg      2022-05-30  2030  				err = ieee80211_link_use_reserved_reassign(link);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2031  			else
b4f85443c17c7ed Johannes Berg      2022-05-30  2032  				err = ieee80211_link_use_reserved_assign(link);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2033  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2034  			if (err) {
b4f85443c17c7ed Johannes Berg      2022-05-30  2035  				link_info(link,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2036  					  "failed to finalize (re-)assign reservation (err=%d)\n",
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2037  					  err);
b4f85443c17c7ed Johannes Berg      2022-05-30  2038  				ieee80211_link_unreserve_chanctx(link);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2039  				cfg80211_stop_iface(local->hw.wiphy,
b4f85443c17c7ed Johannes Berg      2022-05-30  2040  						    &link->sdata->wdev,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2041  						    GFP_KERNEL);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2042  			}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2043  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2044  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2045  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2046  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2047  	 * Finally free old contexts
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2048  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2049  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2050  	list_for_each_entry_safe(ctx, ctx_tmp, &local->chanctx_list, list) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2051  		if (ctx->replace_state != IEEE80211_CHANCTX_WILL_BE_REPLACED)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2052  			continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2053  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2054  		ctx->replace_ctx->replace_ctx = NULL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2055  		ctx->replace_ctx->replace_state =
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2056  				IEEE80211_CHANCTX_REPLACE_NONE;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2057  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2058  		list_del_rcu(&ctx->list);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2059  		kfree_rcu(ctx, rcu_head);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2060  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2061  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2062  	return 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2063  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2064  err:
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2065  	list_for_each_entry(ctx, &local->chanctx_list, list) {
1ce954c98b8968e Johannes Berg      2025-11-05  2066  		struct ieee80211_chanctx_user_iter iter;
b4f85443c17c7ed Johannes Berg      2022-05-30  2067  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2068  		if (ctx->replace_state != IEEE80211_CHANCTX_REPLACES_OTHER)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2069  			continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2070  
1ce954c98b8968e Johannes Berg      2025-11-05  2071  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  2072  			ieee80211_link_unreserve_chanctx(iter.link);
1ce954c98b8968e Johannes Berg      2025-11-05  2073  			ieee80211_link_chanctx_reservation_complete(iter.link);
03078de4f928ffc Michal Kazior      2014-06-25  2074  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2075  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2076  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2077  	return err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2078  }
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2079  

:::::: The code at line 1883 was first introduced by commit
:::::: 1ce954c98b8968e66a304c8586122d706bae97c3 wifi: mac80211: add and use chanctx usage iteration

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
