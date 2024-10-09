Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF12119
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 03:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728444390; cv=none; b=aPR2Ix7gXQI8GINesNWRy50kTxewGEwY28yW7v6dqJIVxIeFhG2dJY6aDWnBzijigSWlZIk9JN/FB6TKR1TW5BkRlS4ZfwNgN9AxfMgvkspJW/T5O0Rb6a3vScW3r0qp6X6qCZsACkdNoaJXRRwWD35V5n8WNUXIGZME/t89Q2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728444390; c=relaxed/simple;
	bh=jtNhYJIKD3sd18YZx7n6L9SUeiFntRMRNdr4YRAP+9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V76w9Bs3suU4CQReWT0WhE81rNifxpy9GhGFh78LtT2nperher/FnGUNoksvh1EspUr0IDrJhEc2VrysoO2/GgkavOQcKf0XN9yeRQ8sA8Hu81FWC6+WtDvwmbQGopwv04AwZSphbxolBPyiYTdaDXlqv5vdmg8xq8ipWnlnT8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWNHR0WS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWNHR0WS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728444389; x=1759980389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jtNhYJIKD3sd18YZx7n6L9SUeiFntRMRNdr4YRAP+9s=;
  b=eWNHR0WS2+qpTG1zNFf3c7+NJcSUTrfM81pMIpp5eVeLI1vMbaiXEIih
   w+ywc4OEtKuLly4D58U8zEKZ1EMW0OgDhK78AYNzWWERA9cs5DMj9O/lm
   epSVUXWCHc9RsqJmuuqX3J4pJYzesp0kkFzYcBw/mtcB68SNOjh23vv7+
   nocavHAf0TXrsMyvAZOx1YEM7OGPwHRbLvtRgyrCFRpNFb+zd+grLEGpk
   IJAcJN5AuTJ7nUqV6SxyInQwAQgxOzDT8QKY0uBiXfWRuQ9ZDrATJRF0f
   2gjyft4DgkdOma6wg/qB3bd/PLsjirp7AFZddC1f3fZomvgWGhr9sEaR/
   Q==;
X-CSE-ConnectionGUID: ny1xo9jGSy66gkFl7YFgIQ==
X-CSE-MsgGUID: YZz0bqkDSJ+NlbY3ZdMgxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31419612"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="31419612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 20:26:26 -0700
X-CSE-ConnectionGUID: aef/uuNCTiu/Sri08OpupA==
X-CSE-MsgGUID: 6U7MAl0DSkycdZIv7/Ll5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="81128973"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Oct 2024 20:26:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syNLC-0008fc-2F;
	Wed, 09 Oct 2024 03:26:22 +0000
Date: Wed, 9 Oct 2024 11:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath12k-mlo-qcn9274 65/81]
 drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error:
 buffer overflow 'sta->link' 15 <= 15
Message-ID: <202410091157.eMoYClhc-lkp@intel.com>
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
TO: Sriram R <quic_srirrama@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>
CC: Rameshkumar Sundaram <quic_ramess@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
commit: d50d85ea8574956b273faf4cb2493a98c6548b04 [65/81] wifi: ath12k: Use mac80211 sta's link_sta instead of deflink
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410091157.eMoYClhc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410091157.eMoYClhc-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:1496 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1484 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:4675 ath12k_mac_op_set_key() error: uninitialized symbol 'ret'.
drivers/net/wireless/ath/ath12k/mac.c:5892 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:5894 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:11000 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 10989)
drivers/net/wireless/ath/ath12k/mac.c:11067 ath12k_mac_allocate() error: uninitialized symbol 'ab'.

vim +534 drivers/net/wireless/ath/ath12k/mac.c

8e3d460d4c16e5 Sriram R 2024-08-16  521  
d50d85ea857495 Sriram R 2024-08-16  522  static struct
d50d85ea857495 Sriram R 2024-08-16  523  ieee80211_link_sta *ath12k_get_link_sta(struct ath12k_link_sta *arsta)
d50d85ea857495 Sriram R 2024-08-16  524  {
d50d85ea857495 Sriram R 2024-08-16  525  	struct ath12k_sta *ahsta = arsta->ahsta;
d50d85ea857495 Sriram R 2024-08-16  526  	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
d50d85ea857495 Sriram R 2024-08-16  527  	struct ieee80211_link_sta *link_sta;
d50d85ea857495 Sriram R 2024-08-16  528  	/* ieee80211_sta->link[]'s are rcu objects which requires rcu_read_lock()
d50d85ea857495 Sriram R 2024-08-16  529  	 * to be held for safe access.
d50d85ea857495 Sriram R 2024-08-16  530  	 */
d50d85ea857495 Sriram R 2024-08-16  531  	if (arsta->link_id > IEEE80211_MLD_MAX_NUM_LINKS)
d50d85ea857495 Sriram R 2024-08-16  532  		return NULL;
d50d85ea857495 Sriram R 2024-08-16  533  	rcu_read_lock();
d50d85ea857495 Sriram R 2024-08-16 @534  	link_sta = rcu_dereference(sta->link[arsta->link_id]);
d50d85ea857495 Sriram R 2024-08-16  535  	rcu_read_unlock();
d50d85ea857495 Sriram R 2024-08-16  536  	return link_sta;
d50d85ea857495 Sriram R 2024-08-16  537  }
d50d85ea857495 Sriram R 2024-08-16  538  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
