Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350571BC4B
	for <oe-kbuild@lists.linux.dev>; Sat, 18 May 2024 20:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716065275; cv=none; b=Lq0BxoBzr4ZVE/pLKPRLFRIEqQwpNLzrLTtgEXSCJ3sybVPN64uwolB/eRElobzW8ogUM2kwd1yusiVUqJHEbK72KjChYAb5F/KbMcec58Ii29uyhls/923Zy6DiMW9z6yKAfpImOSqKh9nfqBwmMb3GNwk08YKA6zjCPgpZEtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716065275; c=relaxed/simple;
	bh=JgtJfQb36HJmsfZ/I4IDFLAzHvzEprTo0Q9araRcuVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e7LoJc9QehUhEDFP1EVj2xiKFFNY9Ndoz5jxkfqGUc+fterPWxFseKPEqnBigqzRzvg1O1Fmo/Q8Oi4sTC7UaYVBeqY98xg20erYIWfms93B91pIjxGo9rw+3WA/O4L/6XORkZMPFymx+iis6CUOSKJyGV1fyryT+PtLCZvRxzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azP6Tl9/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azP6Tl9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716065272; x=1747601272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JgtJfQb36HJmsfZ/I4IDFLAzHvzEprTo0Q9araRcuVE=;
  b=azP6Tl9/dgjs08FoDiPu9SES8MNEkB+N0/YtROHGvXcui0C63OmF3Mso
   YmDTqL18nP3GeAI2i3fbhnqqQhQq3b4ZXWTVFoRaiJNEAd0O0H9wYPMcX
   gk/VeNOUrHHj8PGWBOx0id5AQtXA8ESg3khZ9LXVdhC/92oVuACzT3Y9H
   2pPEA+woR5Apa+IgyJwzE0b5D1+Hh1w7DeQKLF1swoDIseHxK6ltwQz80
   KhBB+OcGo709E79EVNA9u9gcMQU4qe61zXAmnqZfacQFcYqk3+SrKua2x
   hp6PoySmuZ+B/WKoY9yWIb7Flt4s02V6x19SI0Iy4ICJf4B2ex6g/QKNO
   w==;
X-CSE-ConnectionGUID: jkGIdiB1SxqhH+2RPHOoqg==
X-CSE-MsgGUID: inrXXAegSqKyvh0YdJGlCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12078356"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12078356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 13:47:52 -0700
X-CSE-ConnectionGUID: FpGddnWQSh6yAHMYTx7QOg==
X-CSE-MsgGUID: 2f3WMiVtStC6vH7hrCEFuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="55353656"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 May 2024 13:47:50 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Qy4-0002c2-06;
	Sat, 18 May 2024 20:47:48 +0000
Date: Sun, 19 May 2024 04:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 RFC] wifi: cfg80211: Refactor interface combination
 input parameter
Message-ID: <202405190450.IQFyqNLZ-lkp@intel.com>
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
In-Reply-To: <20240518055316.3102746-1-quic_periyasa@quicinc.com>
References: <20240518055316.3102746-1-quic_periyasa@quicinc.com>
TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Hi Karthikeyan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on a17b9f590f6ec2b9f1b12b1db3bf1d181de6b272]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikeyan-Periyasamy/wifi-cfg80211-Refactor-interface-combination-input-parameter/20240518-135455
base:   a17b9f590f6ec2b9f1b12b1db3bf1d181de6b272
patch link:    https://lore.kernel.org/r/20240518055316.3102746-1-quic_periyasa%40quicinc.com
patch subject: [PATCH v2 RFC] wifi: cfg80211: Refactor interface combination input parameter
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-161-20240518 (https://download.01.org/0day-ci/archive/20240519/202405190450.IQFyqNLZ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405190450.IQFyqNLZ-lkp@intel.com/

smatch warnings:
net/wireless/util.c:2495 cfg80211_iter_combinations() error: uninitialized symbol 'beacon_int_gcd'.
net/wireless/util.c:2499 cfg80211_iter_combinations() error: uninitialized symbol 'beacon_int_different'.

vim +/beacon_int_gcd +2495 net/wireless/util.c

7527a782e187d1 Johannes Berg          2011-05-13  2362  
65a124dd719d6e Michal Kazior          2014-04-09  2363  int cfg80211_iter_combinations(struct wiphy *wiphy,
e227300c8395df Purushottam Kushwaha   2016-10-12  2364  			       struct iface_combination_params *params,
65a124dd719d6e Michal Kazior          2014-04-09  2365  			       void (*iter)(const struct ieee80211_iface_combination *c,
65a124dd719d6e Michal Kazior          2014-04-09  2366  					    void *data),
65a124dd719d6e Michal Kazior          2014-04-09  2367  			       void *data)
cb2d956dd329ca Luciano Coelho         2014-02-17  2368  {
8c48b50a1a888a Felix Fietkau          2014-05-05  2369  	const struct ieee80211_regdomain *regdom;
8c48b50a1a888a Felix Fietkau          2014-05-05  2370  	enum nl80211_dfs_regions region = 0;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2371  	int i, j, k, iftype;
cb2d956dd329ca Luciano Coelho         2014-02-17  2372  	u32 used_iftypes = 0;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2373  	u32 beacon_int_gcd, link_beacon_int_gcd = 0;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2374  	u32 *freqs, num_different_channels = 0;
4c8dea638c1614 Johannes Berg          2016-10-21  2375  	bool beacon_int_different;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2376  	u8 radar_detect = 0, link_id;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2377  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2378  	if (!params->num_iface)
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2379  		goto skip;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2380  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2381  	freqs = kcalloc(params->num_iface * sizeof(params->ifaces->links),
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2382  			sizeof(*freqs), GFP_KERNEL);
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2383  	if (!freqs)
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2384  		return -ENOMEM;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2385  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2386  	for (i = 0; i < params->num_iface; i++) {
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2387  		const struct iface_combination_interface *iface;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2388  		u32 link_bi;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2389  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2390  		iface = &params->ifaces[i];
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2391  		iftype = iface->iftype;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2392  		if (!cfg80211_iftype_allowed(wiphy, iftype, 0, 1))
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2393  			used_iftypes |= BIT(iftype);
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2394  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2395  		for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2396  		     link_id++) {
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2397  			if (!(iface->valid_links & BIT(link_id)))
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2398  				continue;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2399  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2400  			link_bi = iface->links[link_id].new_beacon_int;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2401  			if (link_bi && link_beacon_int_gcd != link_bi) {
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2402  				link_beacon_int_gcd = gcd(link_beacon_int_gcd,
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2403  							  link_bi);
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2404  				beacon_int_different = true;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2405  			}
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2406  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2407  			radar_detect |= iface->links[link_id].radar_detect;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2408  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2409  			/* check this freq is already match or not */
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2410  			for (j = 0; j < num_different_channels; j++)
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2411  				if (freqs[j] == iface->links[link_id].freq)
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2412  					break;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2413  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2414  			/* if not match then its a different channel freq */
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2415  			if (j == num_different_channels) {
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2416  				freqs[j] = iface->links[link_id].freq;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2417  				num_different_channels++;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2418  			}
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2419  		}
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2420  	}
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2421  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2422  	kfree(freqs);
4c8dea638c1614 Johannes Berg          2016-10-21  2423  
4c8dea638c1614 Johannes Berg          2016-10-21  2424  	/*
4c8dea638c1614 Johannes Berg          2016-10-21  2425  	 * This is a bit strange, since the iteration used to rely only on
4c8dea638c1614 Johannes Berg          2016-10-21  2426  	 * the data given by the driver, but here it now relies on context,
4c8dea638c1614 Johannes Berg          2016-10-21  2427  	 * in form of the currently operating interfaces.
4c8dea638c1614 Johannes Berg          2016-10-21  2428  	 * This is OK for all current users, and saves us from having to
4c8dea638c1614 Johannes Berg          2016-10-21  2429  	 * push the GCD calculations into all the drivers.
4c8dea638c1614 Johannes Berg          2016-10-21  2430  	 * In the future, this should probably rely more on data that's in
4c8dea638c1614 Johannes Berg          2016-10-21  2431  	 * cfg80211 already - the only thing not would appear to be any new
4c8dea638c1614 Johannes Berg          2016-10-21  2432  	 * interfaces (while being brought up) and channel/radar data.
4c8dea638c1614 Johannes Berg          2016-10-21  2433  	 */
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2434  	cfg80211_calculate_bi_data(wiphy, link_beacon_int_gcd,
4c8dea638c1614 Johannes Berg          2016-10-21  2435  				   &beacon_int_gcd, &beacon_int_different);
cb2d956dd329ca Luciano Coelho         2014-02-17  2436  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2437  	if (radar_detect) {
8c48b50a1a888a Felix Fietkau          2014-05-05  2438  		rcu_read_lock();
8c48b50a1a888a Felix Fietkau          2014-05-05  2439  		regdom = rcu_dereference(cfg80211_regdomain);
8c48b50a1a888a Felix Fietkau          2014-05-05  2440  		if (regdom)
8c48b50a1a888a Felix Fietkau          2014-05-05  2441  			region = regdom->dfs_region;
8c48b50a1a888a Felix Fietkau          2014-05-05  2442  		rcu_read_unlock();
8c48b50a1a888a Felix Fietkau          2014-05-05  2443  	}
8c48b50a1a888a Felix Fietkau          2014-05-05  2444  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2445  skip:
cb2d956dd329ca Luciano Coelho         2014-02-17  2446  	for (i = 0; i < wiphy->n_iface_combinations; i++) {
cb2d956dd329ca Luciano Coelho         2014-02-17  2447  		const struct ieee80211_iface_combination *c;
cb2d956dd329ca Luciano Coelho         2014-02-17  2448  		struct ieee80211_iface_limit *limits;
cb2d956dd329ca Luciano Coelho         2014-02-17  2449  		u32 all_iftypes = 0;
cb2d956dd329ca Luciano Coelho         2014-02-17  2450  
cb2d956dd329ca Luciano Coelho         2014-02-17  2451  		c = &wiphy->iface_combinations[i];
cb2d956dd329ca Luciano Coelho         2014-02-17  2452  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2453  		if (params->num_iface > c->max_interfaces)
cb2d956dd329ca Luciano Coelho         2014-02-17  2454  			continue;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2455  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2456  		if (num_different_channels > c->num_different_channels)
cb2d956dd329ca Luciano Coelho         2014-02-17  2457  			continue;
cb2d956dd329ca Luciano Coelho         2014-02-17  2458  
cb2d956dd329ca Luciano Coelho         2014-02-17  2459  		limits = kmemdup(c->limits, sizeof(limits[0]) * c->n_limits,
cb2d956dd329ca Luciano Coelho         2014-02-17  2460  				 GFP_KERNEL);
cb2d956dd329ca Luciano Coelho         2014-02-17  2461  		if (!limits)
cb2d956dd329ca Luciano Coelho         2014-02-17  2462  			return -ENOMEM;
cb2d956dd329ca Luciano Coelho         2014-02-17  2463  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2464  		for (j = 0; j < params->num_iface; j++) {
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2465  			iftype = params->ifaces[j].iftype;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2466  
e6f4051123fd33 Manikanta Pubbisetty   2019-07-22  2467  			if (cfg80211_iftype_allowed(wiphy, iftype, 0, 1))
cb2d956dd329ca Luciano Coelho         2014-02-17  2468  				continue;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2469  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2470  			for (k = 0; k < c->n_limits; k++) {
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2471  				all_iftypes |= limits[k].types;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2472  				if (!(limits[k].types & BIT(iftype)))
cb2d956dd329ca Luciano Coelho         2014-02-17  2473  					continue;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2474  				if (!limits[k].max)
cb2d956dd329ca Luciano Coelho         2014-02-17  2475  					goto cont;
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2476  				limits[k].max--;
cb2d956dd329ca Luciano Coelho         2014-02-17  2477  			}
cb2d956dd329ca Luciano Coelho         2014-02-17  2478  		}
cb2d956dd329ca Luciano Coelho         2014-02-17  2479  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2480  		if (radar_detect != (c->radar_detect_widths & radar_detect))
cb2d956dd329ca Luciano Coelho         2014-02-17  2481  			goto cont;
cb2d956dd329ca Luciano Coelho         2014-02-17  2482  
a9cbd2afb83c02 Karthikeyan Periyasamy 2024-05-18  2483  		if (radar_detect && c->radar_detect_regions &&
8c48b50a1a888a Felix Fietkau          2014-05-05  2484  		    !(c->radar_detect_regions & BIT(region)))
8c48b50a1a888a Felix Fietkau          2014-05-05  2485  			goto cont;
8c48b50a1a888a Felix Fietkau          2014-05-05  2486  
cb2d956dd329ca Luciano Coelho         2014-02-17  2487  		/* Finally check that all iftypes that we're currently
cb2d956dd329ca Luciano Coelho         2014-02-17  2488  		 * using are actually part of this combination. If they
cb2d956dd329ca Luciano Coelho         2014-02-17  2489  		 * aren't then we can't use this combination and have
cb2d956dd329ca Luciano Coelho         2014-02-17  2490  		 * to continue to the next.
cb2d956dd329ca Luciano Coelho         2014-02-17  2491  		 */
cb2d956dd329ca Luciano Coelho         2014-02-17  2492  		if ((all_iftypes & used_iftypes) != used_iftypes)
cb2d956dd329ca Luciano Coelho         2014-02-17  2493  			goto cont;
cb2d956dd329ca Luciano Coelho         2014-02-17  2494  
4c8dea638c1614 Johannes Berg          2016-10-21 @2495  		if (beacon_int_gcd) {
0c317a02ca982c Purushottam Kushwaha   2016-10-12  2496  			if (c->beacon_int_min_gcd &&
4c8dea638c1614 Johannes Berg          2016-10-21  2497  			    beacon_int_gcd < c->beacon_int_min_gcd)
0507a3ac6e98f5 Johannes Berg          2016-10-21  2498  				goto cont;
4c8dea638c1614 Johannes Berg          2016-10-21 @2499  			if (!c->beacon_int_min_gcd && beacon_int_different)
0c317a02ca982c Purushottam Kushwaha   2016-10-12  2500  				goto cont;
0c317a02ca982c Purushottam Kushwaha   2016-10-12  2501  		}
0c317a02ca982c Purushottam Kushwaha   2016-10-12  2502  
cb2d956dd329ca Luciano Coelho         2014-02-17  2503  		/* This combination covered all interface types and
cb2d956dd329ca Luciano Coelho         2014-02-17  2504  		 * supported the requested numbers, so we're good.
cb2d956dd329ca Luciano Coelho         2014-02-17  2505  		 */
65a124dd719d6e Michal Kazior          2014-04-09  2506  
65a124dd719d6e Michal Kazior          2014-04-09  2507  		(*iter)(c, data);
cb2d956dd329ca Luciano Coelho         2014-02-17  2508   cont:
cb2d956dd329ca Luciano Coelho         2014-02-17  2509  		kfree(limits);
cb2d956dd329ca Luciano Coelho         2014-02-17  2510  	}
cb2d956dd329ca Luciano Coelho         2014-02-17  2511  
65a124dd719d6e Michal Kazior          2014-04-09  2512  	return 0;
65a124dd719d6e Michal Kazior          2014-04-09  2513  }
65a124dd719d6e Michal Kazior          2014-04-09  2514  EXPORT_SYMBOL(cfg80211_iter_combinations);
65a124dd719d6e Michal Kazior          2014-04-09  2515  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
