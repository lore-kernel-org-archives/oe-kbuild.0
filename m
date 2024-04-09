Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F054C69
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Apr 2024 00:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712624232; cv=none; b=JQa7gwlUuupSY+UfKOkt1DRlVJLKtD3fNROJDRRARFrSP7zu+AmsBLTdr+mN4Ohg6DCDR/wcIVOt4gErdZF3b6339wxNZsycA3yoJAPDS56COMnMBEHrtrEy4E/ppLGiQe5ncU63b2AsMXj0NCjIYlXVrNnZzLxRmlMkKTY1QYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712624232; c=relaxed/simple;
	bh=/gXP5XmrAdio6pxnhuQnR3y8USL5RnYruuCuXFogFj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ea9TOyVWdHO0kKvdr48gxxiv/1qecDIfus8sASmcuJKtQJwxwKMs0envjNg/PA4+6zWYkqRc6y1vbDUSvh0+YW9dObEOC5NKeaTq6ICaWHD1vBNgWIoN56VW/QnjaGv2Ll7U2+VK3umdDG6+b++1erIdXjegV66q84l7v7BGqwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWSsQZVm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWSsQZVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712624230; x=1744160230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/gXP5XmrAdio6pxnhuQnR3y8USL5RnYruuCuXFogFj8=;
  b=mWSsQZVm8kraMl1D01H3k0KIJNAPtZIosq/5p4haNlp6FE1WskJQKxqx
   U5b53EQyVPQupD0CSk2j+t2K8qeIHNZqFFGDKnxt4W+erFGznAhpEtAtS
   IMMLHOQtNkztjWbcb0/fvt5BeS7RlWEI72fGtwrzI+3DyflYFk3htLwyp
   QUbdeOh/yHxcjQBgCthZVB6mvThLfcCqzb9r0jos+szQwGeEC6XHbTiWh
   ScsjgCuIBX4z2yb70BfM2wOy7jxke2CHeoqujYFQEkgyr+B9sn2mnaZHE
   UepU1vzKxgJFdkmbx47mkanRp9kDBYcbQon+W7YBhIlE41onUqy5jQeIs
   Q==;
X-CSE-ConnectionGUID: X9T97zwGQFW5czAuhj5lig==
X-CSE-MsgGUID: pLSUJLG8STmB2lA7QQVDfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18645161"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="18645161"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 17:57:10 -0700
X-CSE-ConnectionGUID: mLkX9wcZTuSbfk9KTr1rSg==
X-CSE-MsgGUID: N5v/FhZQTm+xQG3eCVs8YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="57527572"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Apr 2024 17:57:09 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtznN-0005ba-2I;
	Tue, 09 Apr 2024 00:57:05 +0000
Date: Tue, 9 Apr 2024 08:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/rtl8192e/rtllib_rx.c:2522
 rtllib_process_probe_response() warn: iterator used outside loop: 'target'
Message-ID: <202404090830.yY7CfXz2-lkp@intel.com>
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
TO: Wei Yang <richard.weiyang@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fec50db7033ea478773b159e0e2efb135270e3b7
commit: 2932fb0a927d30690b8cb70c71d511fd9054bb61 list: leverage list_is_head() for list_entry_is_head()
date:   7 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 7 weeks ago
config: powerpc-randconfig-r081-20240409 (https://download.01.org/0day-ci/archive/20240409/202404090830.yY7CfXz2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404090830.yY7CfXz2-lkp@intel.com/

New smatch warnings:
drivers/staging/rtl8192e/rtllib_rx.c:2522 rtllib_process_probe_response() warn: iterator used outside loop: 'target'

Old smatch warnings:
drivers/staging/rtl8192e/rtllib_rx.c:469 rtllib_indicate_packets() warn: variable dereferenced before check 'sub_skb' (see line 445)
drivers/staging/rtl8192e/rtllib_rx.c:996 rtllib_rx_get_crypt() warn: potential spectre issue 'ieee->crypt_info.crypt' [r]
drivers/staging/rtl8192e/rtllib_rx.c:1000 rtllib_rx_get_crypt() warn: possible spectre second half.  '*crypt'
drivers/staging/rtl8192e/rtllib_rx.c:2524 rtllib_process_probe_response() warn: iterator used outside loop: 'target'

vim +/target +2522 drivers/staging/rtl8192e/rtllib_rx.c

94a799425eee822 Larry Finger             2011-08-23  2388  
94a799425eee822 Larry Finger             2011-08-23  2389  static inline void rtllib_process_probe_response(
94a799425eee822 Larry Finger             2011-08-23  2390  	struct rtllib_device *ieee,
94a799425eee822 Larry Finger             2011-08-23  2391  	struct rtllib_probe_response *beacon,
94a799425eee822 Larry Finger             2011-08-23  2392  	struct rtllib_rx_stats *stats)
94a799425eee822 Larry Finger             2011-08-23  2393  {
94a799425eee822 Larry Finger             2011-08-23  2394  	struct rtllib_network *target;
94a799425eee822 Larry Finger             2011-08-23  2395  	struct rtllib_network *oldest = NULL;
94a799425eee822 Larry Finger             2011-08-23  2396  	struct rtllib_info_element *info_element = &beacon->info_element[0];
94a799425eee822 Larry Finger             2011-08-23  2397  	unsigned long flags;
94a799425eee822 Larry Finger             2011-08-23  2398  	short renew;
db8971b618ed967 Larry Finger             2011-08-25  2399  	struct rtllib_network *network = kzalloc(sizeof(struct rtllib_network),
db8971b618ed967 Larry Finger             2011-08-25  2400  						 GFP_ATOMIC);
71ddc43ed7c712b Philipp Hortmann         2023-09-15  2401  	__le16 frame_ctl = beacon->header.frame_control;
94a799425eee822 Larry Finger             2011-08-23  2402  
cb76215448947dd Mike McCormack           2011-07-11  2403  	if (!network)
94a799425eee822 Larry Finger             2011-08-23  2404  		return;
94a799425eee822 Larry Finger             2011-08-23  2405  
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2406  	netdev_dbg(ieee->dev,
ac50ddaaeeca4f6 Larry Finger             2011-08-25  2407  		   "'%s' ( %pM ): %c%c%c%c %c%c%c%c-%c%c%c%c %c%c%c%c\n",
94a799425eee822 Larry Finger             2011-08-23  2408  		   escape_essid(info_element->data, info_element->len),
ac50ddaaeeca4f6 Larry Finger             2011-08-25  2409  		   beacon->header.addr3,
26a6b074971cfb8 Rashika Kheria           2013-11-02  2410  		   (le16_to_cpu(beacon->capability) & (1 << 0xf)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2411  		   (le16_to_cpu(beacon->capability) & (1 << 0xe)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2412  		   (le16_to_cpu(beacon->capability) & (1 << 0xd)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2413  		   (le16_to_cpu(beacon->capability) & (1 << 0xc)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2414  		   (le16_to_cpu(beacon->capability) & (1 << 0xb)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2415  		   (le16_to_cpu(beacon->capability) & (1 << 0xa)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2416  		   (le16_to_cpu(beacon->capability) & (1 << 0x9)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2417  		   (le16_to_cpu(beacon->capability) & (1 << 0x8)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2418  		   (le16_to_cpu(beacon->capability) & (1 << 0x7)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2419  		   (le16_to_cpu(beacon->capability) & (1 << 0x6)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2420  		   (le16_to_cpu(beacon->capability) & (1 << 0x5)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2421  		   (le16_to_cpu(beacon->capability) & (1 << 0x4)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2422  		   (le16_to_cpu(beacon->capability) & (1 << 0x3)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2423  		   (le16_to_cpu(beacon->capability) & (1 << 0x2)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2424  		   (le16_to_cpu(beacon->capability) & (1 << 0x1)) ? '1' : '0',
26a6b074971cfb8 Rashika Kheria           2013-11-02  2425  		   (le16_to_cpu(beacon->capability) & (1 << 0x0)) ? '1' : '0');
94a799425eee822 Larry Finger             2011-08-23  2426  
94a799425eee822 Larry Finger             2011-08-23  2427  	if (rtllib_network_init(ieee, beacon, network, stats)) {
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2428  		netdev_dbg(ieee->dev, "Dropped '%s' ( %pM) via %s.\n",
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2429  			   escape_essid(info_element->data, info_element->len),
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2430  			   beacon->header.addr3,
dabd8585db95fa4 Philipp Hortmann         2023-09-12  2431  			   ieee80211_is_beacon(frame_ctl) ? "BEACON" : "PROBE RESPONSE");
94a799425eee822 Larry Finger             2011-08-23  2432  		goto free_network;
94a799425eee822 Larry Finger             2011-08-23  2433  	}
94a799425eee822 Larry Finger             2011-08-23  2434  
976d534118219b0 Sean MacLennan           2011-11-30  2435  	if (!rtllib_legal_channel(ieee, network->channel))
94a799425eee822 Larry Finger             2011-08-23  2436  		goto free_network;
94a799425eee822 Larry Finger             2011-08-23  2437  
dabd8585db95fa4 Philipp Hortmann         2023-09-12  2438  	if (ieee80211_is_probe_resp(frame_ctl)) {
94a799425eee822 Larry Finger             2011-08-23  2439  		if (IsPassiveChannel(ieee, network->channel)) {
d69d20549be9e44 Mateusz Kulikowski       2015-03-17  2440  			netdev_info(ieee->dev,
d69d20549be9e44 Mateusz Kulikowski       2015-03-17  2441  				    "GetScanInfo(): For Global Domain, filter probe response at channel(%d).\n",
db8971b618ed967 Larry Finger             2011-08-25  2442  				    network->channel);
94a799425eee822 Larry Finger             2011-08-23  2443  			goto free_network;
94a799425eee822 Larry Finger             2011-08-23  2444  		}
94a799425eee822 Larry Finger             2011-08-23  2445  	}
94a799425eee822 Larry Finger             2011-08-23  2446  
94a799425eee822 Larry Finger             2011-08-23  2447  	/* The network parsed correctly -- so now we scan our known networks
94a799425eee822 Larry Finger             2011-08-23  2448  	 * to see if we can find it in our list.
94a799425eee822 Larry Finger             2011-08-23  2449  	 *
94a799425eee822 Larry Finger             2011-08-23  2450  	 * NOTE:  This search is definitely not optimized.  Once its doing
94a799425eee822 Larry Finger             2011-08-23  2451  	 *	the "right thing" we'll optimize it for efficiency if
14b40d92881533d Mateusz Kulikowski       2015-04-01  2452  	 *	necessary
14b40d92881533d Mateusz Kulikowski       2015-04-01  2453  	 */
94a799425eee822 Larry Finger             2011-08-23  2454  
94a799425eee822 Larry Finger             2011-08-23  2455  	/* Search for this entry in the list and update it if it is
14b40d92881533d Mateusz Kulikowski       2015-04-01  2456  	 * already there.
14b40d92881533d Mateusz Kulikowski       2015-04-01  2457  	 */
94a799425eee822 Larry Finger             2011-08-23  2458  
94a799425eee822 Larry Finger             2011-08-23  2459  	spin_lock_irqsave(&ieee->lock, flags);
db8971b618ed967 Larry Finger             2011-08-25  2460  	if (is_same_network(&ieee->current_network, network,
db8971b618ed967 Larry Finger             2011-08-25  2461  	   (network->ssid_len ? 1 : 0))) {
8f90dfbf649b531 Mateusz Kulikowski       2015-05-31  2462  		update_network(ieee, &ieee->current_network, network);
5cac011cf1e8aab Philipp Hortmann         2023-06-17  2463  		if ((ieee->current_network.mode == WIRELESS_MODE_N_24G ||
5cac011cf1e8aab Philipp Hortmann         2023-06-17  2464  		     ieee->current_network.mode == WIRELESS_MODE_G) &&
1b873bd4ead85b9 Santha Meena Ramamoorthy 2018-02-28  2465  		    ieee->current_network.berp_info_valid) {
94a799425eee822 Larry Finger             2011-08-23  2466  			if (ieee->current_network.erp_value & ERP_UseProtection)
94a799425eee822 Larry Finger             2011-08-23  2467  				ieee->current_network.buseprotection = true;
94a799425eee822 Larry Finger             2011-08-23  2468  			else
94a799425eee822 Larry Finger             2011-08-23  2469  				ieee->current_network.buseprotection = false;
94a799425eee822 Larry Finger             2011-08-23  2470  		}
dabd8585db95fa4 Philipp Hortmann         2023-09-12  2471  		if (ieee80211_is_beacon(frame_ctl)) {
2445e3a5822b703 Philipp Hortmann         2023-06-17  2472  			if (ieee->link_state >= MAC80211_LINKED)
7e5cfa3c77d324f Philipp Hortmann         2022-11-13  2473  				ieee->link_detect_info.NumRecvBcnInPeriod++;
94a799425eee822 Larry Finger             2011-08-23  2474  		}
94a799425eee822 Larry Finger             2011-08-23  2475  	}
94a799425eee822 Larry Finger             2011-08-23  2476  	list_for_each_entry(target, &ieee->network_list, list) {
db8971b618ed967 Larry Finger             2011-08-25  2477  		if (is_same_network(target, network,
db8971b618ed967 Larry Finger             2011-08-25  2478  		   (target->ssid_len ? 1 : 0)))
94a799425eee822 Larry Finger             2011-08-23  2479  			break;
e63771781beadbd Michael Straube          2023-10-21  2480  		if (!oldest || (target->last_scanned < oldest->last_scanned))
94a799425eee822 Larry Finger             2011-08-23  2481  			oldest = target;
94a799425eee822 Larry Finger             2011-08-23  2482  	}
94a799425eee822 Larry Finger             2011-08-23  2483  
94a799425eee822 Larry Finger             2011-08-23  2484  	/* If we didn't find a match, then get a new network slot to initialize
14b40d92881533d Mateusz Kulikowski       2015-04-01  2485  	 * with this beacon's information
14b40d92881533d Mateusz Kulikowski       2015-04-01  2486  	 */
94a799425eee822 Larry Finger             2011-08-23  2487  	if (&target->list == &ieee->network_list) {
94a799425eee822 Larry Finger             2011-08-23  2488  		if (list_empty(&ieee->network_free_list)) {
94a799425eee822 Larry Finger             2011-08-23  2489  			/* If there are no more slots, expire the oldest */
94a799425eee822 Larry Finger             2011-08-23  2490  			list_del(&oldest->list);
94a799425eee822 Larry Finger             2011-08-23  2491  			target = oldest;
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2492  			netdev_dbg(ieee->dev,
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2493  				   "Expired '%s' ( %pM) from network list.\n",
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2494  				   escape_essid(target->ssid, target->ssid_len),
ac50ddaaeeca4f6 Larry Finger             2011-08-25  2495  				   target->bssid);
94a799425eee822 Larry Finger             2011-08-23  2496  		} else {
94a799425eee822 Larry Finger             2011-08-23  2497  			/* Otherwise just pull from the free list */
94a799425eee822 Larry Finger             2011-08-23  2498  			target = list_entry(ieee->network_free_list.next,
94a799425eee822 Larry Finger             2011-08-23  2499  					    struct rtllib_network, list);
94a799425eee822 Larry Finger             2011-08-23  2500  			list_del(ieee->network_free_list.next);
94a799425eee822 Larry Finger             2011-08-23  2501  		}
94a799425eee822 Larry Finger             2011-08-23  2502  
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2503  		netdev_dbg(ieee->dev, "Adding '%s' ( %pM) via %s.\n",
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2504  			   escape_essid(network->ssid, network->ssid_len),
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2505  			   network->bssid,
dabd8585db95fa4 Philipp Hortmann         2023-09-12  2506  			   ieee80211_is_beacon(frame_ctl) ? "BEACON" : "PROBE RESPONSE");
94a799425eee822 Larry Finger             2011-08-23  2507  
94a799425eee822 Larry Finger             2011-08-23  2508  		memcpy(target, network, sizeof(*target));
94a799425eee822 Larry Finger             2011-08-23  2509  		list_add_tail(&target->list, &ieee->network_list);
94a799425eee822 Larry Finger             2011-08-23  2510  		if (ieee->softmac_features & IEEE_SOFTMAC_ASSOCIATE)
94a799425eee822 Larry Finger             2011-08-23  2511  			rtllib_softmac_new_net(ieee, network);
94a799425eee822 Larry Finger             2011-08-23  2512  	} else {
521a9cbdb27142d Mateusz Kulikowski       2015-05-31  2513  		netdev_dbg(ieee->dev, "Updating '%s' ( %pM) via %s.\n",
ad5c8e0586bfda2 Mateusz Kulikowski       2015-05-31  2514  			   escape_essid(target->ssid, target->ssid_len),
ad5c8e0586bfda2 Mateusz Kulikowski       2015-05-31  2515  			   target->bssid,
dabd8585db95fa4 Philipp Hortmann         2023-09-12  2516  			   ieee80211_is_beacon(frame_ctl) ? "BEACON" : "PROBE RESPONSE");
94a799425eee822 Larry Finger             2011-08-23  2517  
db8971b618ed967 Larry Finger             2011-08-25  2518  		/* we have an entry and we are going to update it. But this
db8971b618ed967 Larry Finger             2011-08-25  2519  		 *  entry may be already expired. In this case we do the same
db8971b618ed967 Larry Finger             2011-08-25  2520  		 * as we found a new net and call the new_net handler
94a799425eee822 Larry Finger             2011-08-23  2521  		 */
db8971b618ed967 Larry Finger             2011-08-25 @2522  		renew = !time_after(target->last_scanned + ieee->scan_age,
db8971b618ed967 Larry Finger             2011-08-25  2523  				    jiffies);
94a799425eee822 Larry Finger             2011-08-23  2524  		if ((!target->ssid_len) &&
94a799425eee822 Larry Finger             2011-08-23  2525  		    (((network->ssid_len > 0) && (target->hidden_ssid_len == 0))
94a799425eee822 Larry Finger             2011-08-23  2526  		    || ((ieee->current_network.ssid_len == network->ssid_len) &&
db8971b618ed967 Larry Finger             2011-08-25  2527  		    (strncmp(ieee->current_network.ssid, network->ssid,
db8971b618ed967 Larry Finger             2011-08-25  2528  		    network->ssid_len) == 0) &&
fff6e8699345c85 Philipp Hortmann         2023-06-17  2529  		    (ieee->link_state == MAC80211_NOLINK))))
94a799425eee822 Larry Finger             2011-08-23  2530  			renew = 1;
8f90dfbf649b531 Mateusz Kulikowski       2015-05-31  2531  		update_network(ieee, target, network);
94a799425eee822 Larry Finger             2011-08-23  2532  		if (renew && (ieee->softmac_features & IEEE_SOFTMAC_ASSOCIATE))
94a799425eee822 Larry Finger             2011-08-23  2533  			rtllib_softmac_new_net(ieee, network);
94a799425eee822 Larry Finger             2011-08-23  2534  	}
94a799425eee822 Larry Finger             2011-08-23  2535  
94a799425eee822 Larry Finger             2011-08-23  2536  	spin_unlock_irqrestore(&ieee->lock, flags);
dabd8585db95fa4 Philipp Hortmann         2023-09-12  2537  	if (ieee80211_is_beacon(frame_ctl) &&
db8971b618ed967 Larry Finger             2011-08-25  2538  	    is_same_network(&ieee->current_network, network,
db8971b618ed967 Larry Finger             2011-08-25  2539  	    (network->ssid_len ? 1 : 0)) &&
2445e3a5822b703 Philipp Hortmann         2023-06-17  2540  	    (ieee->link_state == MAC80211_LINKED)) {
237fea2f2dc618c Philipp Hortmann         2023-02-25  2541  		ieee->handle_beacon(ieee->dev, beacon, &ieee->current_network);
94a799425eee822 Larry Finger             2011-08-23  2542  	}
94a799425eee822 Larry Finger             2011-08-23  2543  free_network:
94a799425eee822 Larry Finger             2011-08-23  2544  	kfree(network);
94a799425eee822 Larry Finger             2011-08-23  2545  }
94a799425eee822 Larry Finger             2011-08-23  2546  

:::::: The code at line 2522 was first introduced by commit
:::::: db8971b618ed967c93fb89622dfe6006a58d55a5 staging: rtl8192e: Cleanup checkpatch -f errors - Part XIII

:::::: TO: Larry Finger <Larry.Finger@lwfinger.net>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
