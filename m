Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24783D668F
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837124; cv=none; b=V1YKFOTnmZF0mwwoKgp1RF3aVLHEj7LZeDkxtgShdTnOdKZviHv14iSXmIA2acA5kkyNil4DtfJtHJ/bvSWxBpCcxTo8cV43seW/cVnV5WFcRqXNsWWXizA07GWqee/IXEcrEsYyCWZn4B3nQNPMdeK/fa4gZfE/3n6TYihYVj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837124; c=relaxed/simple;
	bh=7ztUVkwRLomRjKWZ2rf9sXUqe7u1JEX9FwzZbZRsboM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SfR8lkCkFOSlkQW20dqxpt7xxT6BaJrOHIIC+ObVLChCalHQ/eJEMsFCDSO1lzEBYI+EirHpJh/dVh7V9s4oP3UXQZODBZMQM7SDp7GQVz4s7tvf+gF0H4VjqCYb3IJ4HURqDyLLPwXa6jtDVX20KY5GL6LJie1xCly7Rc5ZIlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KD1Cg/9E; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KD1Cg/9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773837121; x=1805373121;
  h=date:from:to:cc:subject:message-id;
  bh=7ztUVkwRLomRjKWZ2rf9sXUqe7u1JEX9FwzZbZRsboM=;
  b=KD1Cg/9EYDGcqMxMdrlO67w5lqBxscm47bXBeXn57bP1VfzdubRdSpLH
   pp4v3GbQoySdli4gOo/oteJMN7X+WplofPKvUEoqO7CQAeMbbmMUqmlcO
   HL6sQfimpvcJWmeNct17wMmc0XyVBJHRnOtWdvG3LnPukTjJcWfM4vtrB
   hekDsl18cHPnpvMLES4AUgxbkrcw778FcE9Bkd27wBibx6kLNyMIcPTfV
   YCC/NetOTlWEDM8bOAbNnbkEOFjntC/j08zIg9I88RVxUS1vOKc8eC3K4
   Mmhe7rhefR+pbsBq73ZwllHkAyyxZ/iTsrG76k47hEvqRhMiloWFChZe2
   g==;
X-CSE-ConnectionGUID: qDHwOhgkQ+mGqtwn5oJ6rg==
X-CSE-MsgGUID: 9IB7Cof9RCmjTqVXNBRPwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74861789"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74861789"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:31:58 -0700
X-CSE-ConnectionGUID: /xb87i1iS/O8czf08qy0rQ==
X-CSE-MsgGUID: KUeB+iUbQEehRSaLC8KeYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="218644400"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2026 05:31:56 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2q42-000000002tr-10aW;
	Wed, 18 Mar 2026 12:31:54 +0000
Date: Wed, 18 Mar 2026 20:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [iwlwifi-next:nan_mac80211_phase2 36/57]
 net/mac80211/chan.c:1880 ieee80211_vif_use_reserved_switch() error: we
 previously assumed 'iter.link' could be null (see line 1859)
Message-ID: <202603182055.hBqK4ZR9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miri Korenblit <miriam.rachel.korenblit@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git nan_mac80211_phase2
head:   2d6c6fa9647943d4c8ff3d8a6f82c00ea1edd2f4
commit: 526620c0d683e120277a5daeab93c7e46620d4b2 [36/57] wifi: mac80211: add NAN local schedule support
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182055.hBqK4ZR9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603182055.hBqK4ZR9-lkp@intel.com/

New smatch warnings:
net/mac80211/chan.c:1880 ieee80211_vif_use_reserved_switch() error: we previously assumed 'iter.link' could be null (see line 1859)

Old smatch warnings:
net/mac80211/chan.c:1881 ieee80211_vif_use_reserved_switch() warn: missing unwind goto?

vim +1880 net/mac80211/chan.c

5bcae31d9cb1ebf Michal Kazior      2014-06-25  1815  
649b2a4da5d8a39 Johannes Berg      2014-07-25  1816  static int ieee80211_vif_use_reserved_switch(struct ieee80211_local *local)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1817  {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1818  	struct ieee80211_chanctx *ctx, *ctx_tmp, *old_ctx;
b7f2405c6bd8ae0 Kirtika Ruchandani 2016-11-23  1819  	int err, n_assigned, n_reserved, n_ready;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1820  	int n_ctx = 0, n_vifs_switch = 0, n_vifs_assign = 0, n_vifs_ctxless = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1821  
5435af6e6ac0132 Johannes Berg      2023-08-28  1822  	lockdep_assert_wiphy(local->hw.wiphy);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1823  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1824  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1825  	 * If there are 2 independent pairs of channel contexts performing
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1826  	 * cross-switch of their vifs this code will still wait until both are
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1827  	 * ready even though it could be possible to switch one before the
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1828  	 * other is ready.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1829  	 *
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1830  	 * For practical reasons and code simplicity just do a single huge
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1831  	 * switch.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1832  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1833  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1834  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1835  	 * Verify if the reservation is still feasible.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1836  	 *  - if it's not then disconnect
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1837  	 *  - if it is but not all vifs necessary are ready then defer
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1838  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1839  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1840  	list_for_each_entry(ctx, &local->chanctx_list, list) {
1ce954c98b8968e Johannes Berg      2025-11-05  1841  		struct ieee80211_chanctx_user_iter iter;
b4f85443c17c7ed Johannes Berg      2022-05-30  1842  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1843  		if (ctx->replace_state != IEEE80211_CHANCTX_REPLACES_OTHER)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1844  			continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1845  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1846  		if (WARN_ON(!ctx->replace_ctx)) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1847  			err = -EINVAL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1848  			goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1849  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1850  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1851  		n_ctx++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1852  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1853  		n_assigned = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1854  		n_reserved = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1855  		n_ready = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1856  
de3c5142349c6cd Johannes Berg      2025-11-21  1857  		for_each_chanctx_user_assigned(local, ctx->replace_ctx, &iter) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1858  			n_assigned++;
526620c0d683e12 Miri Korenblit     2025-11-09 @1859  			if (iter.link && iter.link->reserved_chanctx) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1860  				n_reserved++;
1ce954c98b8968e Johannes Berg      2025-11-05  1861  				if (iter.link->reserved_ready)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1862  					n_ready++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1863  			}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1864  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1865  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1866  		if (n_assigned != n_reserved) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1867  			if (n_ready == n_reserved) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1868  				wiphy_info(local->hw.wiphy,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1869  					   "channel context reservation cannot be finalized because some interfaces aren't switching\n");
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1870  				err = -EBUSY;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1871  				goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1872  			}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1873  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1874  			return -EAGAIN;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1875  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1876  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1877  		ctx->conf.radar_enabled = false;
1ce954c98b8968e Johannes Berg      2025-11-05  1878  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  1879  			if (ieee80211_link_has_in_place_reservation(iter.link) &&
1ce954c98b8968e Johannes Berg      2025-11-05 @1880  			    !iter.link->reserved_ready)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1881  				return -EAGAIN;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1882  
1ce954c98b8968e Johannes Berg      2025-11-05  1883  			old_ctx = ieee80211_link_get_chanctx(iter.link);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1884  			if (old_ctx) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1885  				if (old_ctx->replace_state ==
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1886  				    IEEE80211_CHANCTX_WILL_BE_REPLACED)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1887  					n_vifs_switch++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1888  				else
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1889  					n_vifs_assign++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1890  			} else {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1891  				n_vifs_ctxless++;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1892  			}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1893  
1ce954c98b8968e Johannes Berg      2025-11-05  1894  			if (iter.radar_required)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1895  				ctx->conf.radar_enabled = true;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1896  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1897  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1898  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1899  	if (WARN_ON(n_ctx == 0) ||
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1900  	    WARN_ON(n_vifs_switch == 0 &&
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1901  		    n_vifs_assign == 0 &&
0a44dfc07074951 Johannes Berg      2024-01-29  1902  		    n_vifs_ctxless == 0)) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1903  		err = -EINVAL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1904  		goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1905  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1906  
dd7b1bdb5614419 Johannes Berg      2024-06-12  1907  	/* update station rate control and min width before switch */
dd7b1bdb5614419 Johannes Berg      2024-06-12  1908  	list_for_each_entry(ctx, &local->chanctx_list, list) {
1ce954c98b8968e Johannes Berg      2025-11-05  1909  		struct ieee80211_chanctx_user_iter iter;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1910  
dd7b1bdb5614419 Johannes Berg      2024-06-12  1911  		if (ctx->replace_state != IEEE80211_CHANCTX_REPLACES_OTHER)
dd7b1bdb5614419 Johannes Berg      2024-06-12  1912  			continue;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1913  
dd7b1bdb5614419 Johannes Berg      2024-06-12  1914  		if (WARN_ON(!ctx->replace_ctx)) {
dd7b1bdb5614419 Johannes Berg      2024-06-12  1915  			err = -EINVAL;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1916  			goto err;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1917  		}
dd7b1bdb5614419 Johannes Berg      2024-06-12  1918  
1ce954c98b8968e Johannes Berg      2025-11-05  1919  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  1920  			if (!ieee80211_link_has_in_place_reservation(iter.link))
dd7b1bdb5614419 Johannes Berg      2024-06-12  1921  				continue;
dd7b1bdb5614419 Johannes Berg      2024-06-12  1922  
dd7b1bdb5614419 Johannes Berg      2024-06-12  1923  			ieee80211_chan_bw_change(local,
1ce954c98b8968e Johannes Berg      2025-11-05  1924  						 ieee80211_link_get_chanctx(iter.link),
dd7b1bdb5614419 Johannes Berg      2024-06-12  1925  						 true, true);
dd7b1bdb5614419 Johannes Berg      2024-06-12  1926  		}
dd7b1bdb5614419 Johannes Berg      2024-06-12  1927  
52363af3a9c989e Johannes Berg      2025-11-05  1928  		_ieee80211_recalc_chanctx_min_def(local, ctx, NULL, true);
dd7b1bdb5614419 Johannes Berg      2024-06-12  1929  	}
dd7b1bdb5614419 Johannes Berg      2024-06-12  1930  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1931  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1932  	 * All necessary vifs are ready. Perform the switch now depending on
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1933  	 * reservations and driver capabilities.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1934  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1935  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1936  	if (n_vifs_switch > 0) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1937  		err = ieee80211_chsw_switch_vifs(local, n_vifs_switch);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1938  		if (err)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1939  			goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1940  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1941  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1942  	if (n_vifs_assign > 0 || n_vifs_ctxless > 0) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1943  		err = ieee80211_chsw_switch_ctxs(local);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1944  		if (err)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1945  			goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1946  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1947  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1948  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1949  	 * Update all structures, values and pointers to point to new channel
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1950  	 * context(s).
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1951  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1952  	list_for_each_entry(ctx, &local->chanctx_list, list) {
1ce954c98b8968e Johannes Berg      2025-11-05  1953  		struct ieee80211_chanctx_user_iter iter;
b4f85443c17c7ed Johannes Berg      2022-05-30  1954  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1955  		if (ctx->replace_state != IEEE80211_CHANCTX_REPLACES_OTHER)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1956  			continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1957  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1958  		if (WARN_ON(!ctx->replace_ctx)) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1959  			err = -EINVAL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1960  			goto err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1961  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1962  
1ce954c98b8968e Johannes Berg      2025-11-05  1963  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  1964  			struct ieee80211_link_data *link = iter.link;
1ce954c98b8968e Johannes Berg      2025-11-05  1965  			struct ieee80211_sub_if_data *sdata = iter.sdata;
d8675a63518c614 Johannes Berg      2022-06-17  1966  			struct ieee80211_bss_conf *link_conf = link->conf;
15ddba5f43114c1 Anjaneyulu         2023-06-04  1967  			u64 changed = 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1968  
b4f85443c17c7ed Johannes Berg      2022-05-30  1969  			if (!ieee80211_link_has_in_place_reservation(link))
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1970  				continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1971  
b4f85443c17c7ed Johannes Berg      2022-05-30  1972  			rcu_assign_pointer(link_conf->chanctx_conf,
d0a9123ef548def Johannes Berg      2022-05-10  1973  					   &ctx->conf);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1974  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1975  			if (sdata->vif.type == NL80211_IFTYPE_AP)
b4f85443c17c7ed Johannes Berg      2022-05-30  1976  				__ieee80211_link_copy_chanctx_to_vlans(link,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1977  								       false);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1978  
17c18bf880b2464 Johannes Berg      2015-03-21  1979  			ieee80211_check_fast_xmit_iface(sdata);
17c18bf880b2464 Johannes Berg      2015-03-21  1980  
1ce954c98b8968e Johannes Berg      2025-11-05  1981  			link->radar_required = iter.radar_required;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1982  
1ce954c98b8968e Johannes Berg      2025-11-05  1983  			if (link_conf->chanreq.oper.width != iter.chanreq->oper.width)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1984  				changed = BSS_CHANGED_BANDWIDTH;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1985  
6092077ad09ce88 Johannes Berg      2024-01-29  1986  			ieee80211_link_update_chanreq(link, &link->reserved);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1987  			if (changed)
b4f85443c17c7ed Johannes Berg      2022-05-30  1988  				ieee80211_link_info_change_notify(sdata,
d8675a63518c614 Johannes Berg      2022-06-17  1989  								  link,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1990  								  changed);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1991  
c4382d5ca1af75c Emmanuel Grumbach  2024-10-07  1992  			ieee80211_recalc_txpower(link, false);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1993  		}
73da7d5bab79ad7 Simon Wunderlich   2013-07-11  1994  
73da7d5bab79ad7 Simon Wunderlich   2013-07-11  1995  		ieee80211_recalc_chanctx_chantype(local, ctx);
73da7d5bab79ad7 Simon Wunderlich   2013-07-11  1996  		ieee80211_recalc_smps_chanctx(local, ctx);
73da7d5bab79ad7 Simon Wunderlich   2013-07-11  1997  		ieee80211_recalc_radar_chanctx(local, ctx);
52363af3a9c989e Johannes Berg      2025-11-05  1998  		ieee80211_recalc_chanctx_min_def(local, ctx);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  1999  
1ce954c98b8968e Johannes Berg      2025-11-05  2000  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  2001  			if (ieee80211_link_get_chanctx(iter.link) != ctx)
a1dc648aa76d61d Johannes Berg      2025-11-05  2002  				continue;
a1dc648aa76d61d Johannes Berg      2025-11-05  2003  
1ce954c98b8968e Johannes Berg      2025-11-05  2004  			iter.link->reserved_chanctx = NULL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2005  
1ce954c98b8968e Johannes Berg      2025-11-05  2006  			ieee80211_link_chanctx_reservation_complete(iter.link);
dd7b1bdb5614419 Johannes Berg      2024-06-12  2007  			ieee80211_chan_bw_change(local, ctx, false, false);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2008  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2009  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2010  		/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2011  		 * This context might have been a dependency for an already
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2012  		 * ready re-assign reservation interface that was deferred. Do
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2013  		 * not propagate error to the caller though. The in-place
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2014  		 * reservation for originally requested interface has already
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2015  		 * succeeded at this point.
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2016  		 */
1ce954c98b8968e Johannes Berg      2025-11-05  2017  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  2018  			struct ieee80211_link_data *link = iter.link;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2019  
a1dc648aa76d61d Johannes Berg      2025-11-05  2020  			if (WARN_ON(ieee80211_link_has_in_place_reservation(link)))
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2021  				continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2022  
b4f85443c17c7ed Johannes Berg      2022-05-30  2023  			if (!link->reserved_ready)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2024  				continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2025  
b4f85443c17c7ed Johannes Berg      2022-05-30  2026  			if (ieee80211_link_get_chanctx(link))
b4f85443c17c7ed Johannes Berg      2022-05-30  2027  				err = ieee80211_link_use_reserved_reassign(link);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2028  			else
b4f85443c17c7ed Johannes Berg      2022-05-30  2029  				err = ieee80211_link_use_reserved_assign(link);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2030  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2031  			if (err) {
b4f85443c17c7ed Johannes Berg      2022-05-30  2032  				link_info(link,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2033  					  "failed to finalize (re-)assign reservation (err=%d)\n",
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2034  					  err);
b4f85443c17c7ed Johannes Berg      2022-05-30  2035  				ieee80211_link_unreserve_chanctx(link);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2036  				cfg80211_stop_iface(local->hw.wiphy,
b4f85443c17c7ed Johannes Berg      2022-05-30  2037  						    &link->sdata->wdev,
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2038  						    GFP_KERNEL);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2039  			}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2040  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2041  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2042  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2043  	/*
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2044  	 * Finally free old contexts
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2045  	 */
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2046  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2047  	list_for_each_entry_safe(ctx, ctx_tmp, &local->chanctx_list, list) {
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2048  		if (ctx->replace_state != IEEE80211_CHANCTX_WILL_BE_REPLACED)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2049  			continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2050  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2051  		ctx->replace_ctx->replace_ctx = NULL;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2052  		ctx->replace_ctx->replace_state =
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2053  				IEEE80211_CHANCTX_REPLACE_NONE;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2054  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2055  		list_del_rcu(&ctx->list);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2056  		kfree_rcu(ctx, rcu_head);
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2057  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2058  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2059  	return 0;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2060  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2061  err:
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2062  	list_for_each_entry(ctx, &local->chanctx_list, list) {
1ce954c98b8968e Johannes Berg      2025-11-05  2063  		struct ieee80211_chanctx_user_iter iter;
b4f85443c17c7ed Johannes Berg      2022-05-30  2064  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2065  		if (ctx->replace_state != IEEE80211_CHANCTX_REPLACES_OTHER)
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2066  			continue;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2067  
1ce954c98b8968e Johannes Berg      2025-11-05  2068  		for_each_chanctx_user_reserved(local, ctx, &iter) {
1ce954c98b8968e Johannes Berg      2025-11-05  2069  			ieee80211_link_unreserve_chanctx(iter.link);
1ce954c98b8968e Johannes Berg      2025-11-05  2070  			ieee80211_link_chanctx_reservation_complete(iter.link);
03078de4f928ffc Michal Kazior      2014-06-25  2071  		}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2072  	}
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2073  
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2074  	return err;
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2075  }
5bcae31d9cb1ebf Michal Kazior      2014-06-25  2076  

:::::: The code at line 1880 was first introduced by commit
:::::: 1ce954c98b8968e66a304c8586122d706bae97c3 wifi: mac80211: add and use chanctx usage iteration

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
