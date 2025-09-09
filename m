Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88022877E6
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Sep 2025 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409726; cv=none; b=aOywh1EnXTVS1jJm74//PFpbnb4CtckRt/IrqPBYVSd3GfAlmsN9uY38YbtsWTg5H3axFwcrMhH/bHLKx6FSYSR7Q6+KXUwkau5nW60GC5OgY6+un/vutBaRcEmaFD3JMcAN/JB/WY/SueyPpe4aEDLgBZY4sHAC0pKHQRFkek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409726; c=relaxed/simple;
	bh=jiHZNWaI1nM4vJxZbs6Hq54wgBfQwllrF/FxhhV6W78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAqaGYSdpEb+TZGfxpMyfc5Qxc5qAPiav/5vxGKffhh+cNeDIFRI1RYUrYD5JqjFrOtXdTCOaLBAWr+76Mf2R9zW3jGZ3cffqW/B5QuV+sXmVc55NqH6bbHthbXp+kQKuozWu00FM/MrBFjLN61Hcp4GR4TQtUcwERAyl3rc2ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHuucQX/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHuucQX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757409725; x=1788945725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jiHZNWaI1nM4vJxZbs6Hq54wgBfQwllrF/FxhhV6W78=;
  b=IHuucQX/I3N+e1c5zrcobNuD6UBNdcMHF0mB7ahPIxsQZSQOANQaDDWJ
   ensRSAQVPVXpBtvTtK07J8m6j4ogRrfThMV5nN/ogVwkVCwjissyevuki
   mHOpoJrDYUHL4W0WE0l+ZcMskyyxr/4oeyJ8BqjPcQOnn4uP6HiEYyOI2
   STDHWUFxwFey++fqaTaH/ucfgy3LnJMpE77uEcHH3OFp+kVVMV/XrHyX7
   UE1uaYHWI5pfZjX8RBMZwe0Hj/U6bJCl/UzFuYk9WYwEJ2JinqsK0u6Fg
   WjxLI0QMtau7tgAXifCxH3DFXQC8gUDsIYJvAVMzb5K0QvV8vCBRMssTy
   w==;
X-CSE-ConnectionGUID: iOwUisZKTDaIDJnO64N3uQ==
X-CSE-MsgGUID: ypkCOq9SRwut8p0J6JhHtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59380793"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59380793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 02:21:40 -0700
X-CSE-ConnectionGUID: Cq6nDETGQLqeJBBmZlozKA==
X-CSE-MsgGUID: tJpHH1srTYG0BjVEwLvNoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="177089009"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Sep 2025 02:21:38 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvuXg-0004hP-00;
	Tue, 09 Sep 2025 09:21:36 +0000
Date: Tue, 9 Sep 2025 17:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 12/16] staging: rtl8723bs: remove unnecessary braces
 for single statement blocks
Message-ID: <202509091617.rTu26ZIe-lkp@intel.com>
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
In-Reply-To: <20250904021448.216461-13-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-13-vivek.balachandhar@gmail.com>
TO: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
TO: gregkh@linuxfoundation.org
CC: linux-staging@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Vivek BalachandharTN <vivek.balachandhar@gmail.com>

Hi Vivek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5141ae32d4b8971d7b689854fd47a200e695bda3]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-BalachandharTN/staging-rtl8723bs-fix-spacing-around-operators/20250904-101950
base:   5141ae32d4b8971d7b689854fd47a200e695bda3
patch link:    https://lore.kernel.org/r/20250904021448.216461-13-vivek.balachandhar%40gmail.com
patch subject: [PATCH v2 12/16] staging: rtl8723bs: remove unnecessary braces for single statement blocks
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: csky-randconfig-r072-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091617.rTu26ZIe-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509091617.rTu26ZIe-lkp@intel.com/

smatch warnings:
drivers/staging/rtl8723bs/core/rtw_mlme.c:517 rtw_update_scanned_network() warn: if statement not indented
drivers/staging/rtl8723bs/core/rtw_mlme.c:2548 rtw_update_ht_cap() warn: if statement not indented

vim +517 drivers/staging/rtl8723bs/core/rtw_mlme.c

554c0a3abf216c Hans de Goede        2017-03-29  490  
554c0a3abf216c Hans de Goede        2017-03-29  491  /*
9404e2d29eafbf Vivek BalachandharTN 2025-09-04  492   * Caller must hold pmlmepriv->lock first.
554c0a3abf216c Hans de Goede        2017-03-29  493   */
554c0a3abf216c Hans de Goede        2017-03-29  494  void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
554c0a3abf216c Hans de Goede        2017-03-29  495  {
554c0a3abf216c Hans de Goede        2017-03-29  496  	struct list_head	*plist, *phead;
554c0a3abf216c Hans de Goede        2017-03-29  497  	u32 bssid_ex_sz;
400a23b2e0ca93 Vivek BalachandharTN 2025-07-20  498  	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
400a23b2e0ca93 Vivek BalachandharTN 2025-07-20  499  	struct __queue	*queue	= &pmlmepriv->scanned_queue;
554c0a3abf216c Hans de Goede        2017-03-29  500  	struct wlan_network	*pnetwork = NULL;
554c0a3abf216c Hans de Goede        2017-03-29  501  	struct wlan_network	*oldest = NULL;
554c0a3abf216c Hans de Goede        2017-03-29  502  	int target_find = 0;
554c0a3abf216c Hans de Goede        2017-03-29  503  	u8 feature = 0;
554c0a3abf216c Hans de Goede        2017-03-29  504  
554c0a3abf216c Hans de Goede        2017-03-29  505  	spin_lock_bh(&queue->lock);
554c0a3abf216c Hans de Goede        2017-03-29  506  	phead = get_list_head(queue);
b3cd518c5abd42 Guenter Roeck        2021-04-28  507  	list_for_each(plist, phead) {
b3cd518c5abd42 Guenter Roeck        2021-04-28  508  		pnetwork = list_entry(plist, struct wlan_network, list);
554c0a3abf216c Hans de Goede        2017-03-29  509  
554c0a3abf216c Hans de Goede        2017-03-29  510  		rtw_bug_check(pnetwork, pnetwork, pnetwork, pnetwork);
554c0a3abf216c Hans de Goede        2017-03-29  511  
400a23b2e0ca93 Vivek BalachandharTN 2025-07-20  512  		if (is_same_network(&pnetwork->network, target, feature)) {
554c0a3abf216c Hans de Goede        2017-03-29  513  			target_find = 1;
554c0a3abf216c Hans de Goede        2017-03-29  514  			break;
554c0a3abf216c Hans de Goede        2017-03-29  515  		}
554c0a3abf216c Hans de Goede        2017-03-29  516  
6973f76397f75d Vivek BalachandharTN 2025-09-04 @517  		if (rtw_roam_flags(adapter))
f8028fd96f918a Bhaskar Chowdhury    2021-03-23  518  			/* TODO: don't select network in the same ess as oldest if it's new enough*/
554c0a3abf216c Hans de Goede        2017-03-29  519  
cd1f1450092216 Michael Straube      2021-08-29  520  		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
554c0a3abf216c Hans de Goede        2017-03-29  521  			oldest = pnetwork;
554c0a3abf216c Hans de Goede        2017-03-29  522  	}
554c0a3abf216c Hans de Goede        2017-03-29  523  
554c0a3abf216c Hans de Goede        2017-03-29  524  	/* If we didn't find a match, then get a new network slot to initialize
9404e2d29eafbf Vivek BalachandharTN 2025-09-04  525  	 * with this beacon's information
9404e2d29eafbf Vivek BalachandharTN 2025-09-04  526  	 */
554c0a3abf216c Hans de Goede        2017-03-29  527  	if (!target_find) {
554c0a3abf216c Hans de Goede        2017-03-29  528  		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
554c0a3abf216c Hans de Goede        2017-03-29  529  			/* If there are no more slots, expire the oldest */
554c0a3abf216c Hans de Goede        2017-03-29  530  			/* list_del_init(&oldest->list); */
554c0a3abf216c Hans de Goede        2017-03-29  531  			pnetwork = oldest;
a8f74a8261111e Fabio Aiuto          2021-04-04  532  			if (!pnetwork)
554c0a3abf216c Hans de Goede        2017-03-29  533  				goto exit;
a8f74a8261111e Fabio Aiuto          2021-04-04  534  
400a23b2e0ca93 Vivek BalachandharTN 2025-07-20  535  			memcpy(&pnetwork->network, target,  get_wlan_bssid_ex_sz(target));
554c0a3abf216c Hans de Goede        2017-03-29  536  			/*  variable initialize */
554c0a3abf216c Hans de Goede        2017-03-29  537  			pnetwork->fixed = false;
554c0a3abf216c Hans de Goede        2017-03-29  538  			pnetwork->last_scanned = jiffies;
554c0a3abf216c Hans de Goede        2017-03-29  539  
554c0a3abf216c Hans de Goede        2017-03-29  540  			pnetwork->network_type = 0;
554c0a3abf216c Hans de Goede        2017-03-29  541  			pnetwork->aid = 0;
554c0a3abf216c Hans de Goede        2017-03-29  542  			pnetwork->join_res = 0;
554c0a3abf216c Hans de Goede        2017-03-29  543  
d7206352fc327e Ammly Fredrick       2017-05-15  544  			/* bss info not receiving from the right channel */
631f42e9079382 Fabio Aiuto          2021-07-21  545  			if (pnetwork->network.phy_info.signal_quality == 101)
631f42e9079382 Fabio Aiuto          2021-07-21  546  				pnetwork->network.phy_info.signal_quality = 0;
554c0a3abf216c Hans de Goede        2017-03-29  547  		} else {
554c0a3abf216c Hans de Goede        2017-03-29  548  			/* Otherwise just pull from the free list */
554c0a3abf216c Hans de Goede        2017-03-29  549  
554c0a3abf216c Hans de Goede        2017-03-29  550  			pnetwork = rtw_alloc_network(pmlmepriv); /*  will update scan_time */
554c0a3abf216c Hans de Goede        2017-03-29  551  
a8f74a8261111e Fabio Aiuto          2021-04-04  552  			if (!pnetwork)
554c0a3abf216c Hans de Goede        2017-03-29  553  				goto exit;
554c0a3abf216c Hans de Goede        2017-03-29  554  
554c0a3abf216c Hans de Goede        2017-03-29  555  			bssid_ex_sz = get_wlan_bssid_ex_sz(target);
d3fcee1b78a533 Fabio Aiuto          2021-07-21  556  			target->length = bssid_ex_sz;
400a23b2e0ca93 Vivek BalachandharTN 2025-07-20  557  			memcpy(&pnetwork->network, target, bssid_ex_sz);
554c0a3abf216c Hans de Goede        2017-03-29  558  
554c0a3abf216c Hans de Goede        2017-03-29  559  			pnetwork->last_scanned = jiffies;
554c0a3abf216c Hans de Goede        2017-03-29  560  
d7206352fc327e Ammly Fredrick       2017-05-15  561  			/* bss info not receiving from the right channel */
631f42e9079382 Fabio Aiuto          2021-07-21  562  			if (pnetwork->network.phy_info.signal_quality == 101)
631f42e9079382 Fabio Aiuto          2021-07-21  563  				pnetwork->network.phy_info.signal_quality = 0;
554c0a3abf216c Hans de Goede        2017-03-29  564  
400a23b2e0ca93 Vivek BalachandharTN 2025-07-20  565  			list_add_tail(&pnetwork->list, &queue->queue);
554c0a3abf216c Hans de Goede        2017-03-29  566  		}
554c0a3abf216c Hans de Goede        2017-03-29  567  	} else {
554c0a3abf216c Hans de Goede        2017-03-29  568  		/* we have an entry and we are going to update it. But this entry may
554c0a3abf216c Hans de Goede        2017-03-29  569  		 * be already expired. In this case we do the same as we found a new
554c0a3abf216c Hans de Goede        2017-03-29  570  		 * net and call the new_net handler
554c0a3abf216c Hans de Goede        2017-03-29  571  		 */
554c0a3abf216c Hans de Goede        2017-03-29  572  		bool update_ie = true;
554c0a3abf216c Hans de Goede        2017-03-29  573  
554c0a3abf216c Hans de Goede        2017-03-29  574  		pnetwork->last_scanned = jiffies;
554c0a3abf216c Hans de Goede        2017-03-29  575  
76ac3b19a702d3 Fabio Aiuto          2021-07-30  576  		/* target.reserved[0]== 1, means that scanned network is a bcn frame. */
8255017976dec9 Fabio Aiuto          2021-07-30  577  		if (pnetwork->network.ie_length > target->ie_length && target->reserved[0] == 1)
554c0a3abf216c Hans de Goede        2017-03-29  578  			update_ie = false;
554c0a3abf216c Hans de Goede        2017-03-29  579  
554c0a3abf216c Hans de Goede        2017-03-29  580  		/*  probe resp(3) > beacon(1) > probe req(2) */
8255017976dec9 Fabio Aiuto          2021-07-30  581  		if (target->reserved[0] != 2 &&
9b6818c1ac0e54 Fabio Aiuto          2021-07-30  582  		    target->reserved[0] >= pnetwork->network.reserved[0]) {
554c0a3abf216c Hans de Goede        2017-03-29  583  			update_ie = true;
554c0a3abf216c Hans de Goede        2017-03-29  584  		} else {
554c0a3abf216c Hans de Goede        2017-03-29  585  			update_ie = false;
554c0a3abf216c Hans de Goede        2017-03-29  586  		}
554c0a3abf216c Hans de Goede        2017-03-29  587  
400a23b2e0ca93 Vivek BalachandharTN 2025-07-20  588  		update_network(&pnetwork->network, target, adapter, update_ie);
554c0a3abf216c Hans de Goede        2017-03-29  589  	}
554c0a3abf216c Hans de Goede        2017-03-29  590  
554c0a3abf216c Hans de Goede        2017-03-29  591  exit:
554c0a3abf216c Hans de Goede        2017-03-29  592  	spin_unlock_bh(&queue->lock);
554c0a3abf216c Hans de Goede        2017-03-29  593  }
554c0a3abf216c Hans de Goede        2017-03-29  594  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
