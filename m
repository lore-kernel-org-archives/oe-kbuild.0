Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF6F21A0A
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Feb 2024 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707045029; cv=none; b=J27BBzsmqk7tXRJda3pmn4B55CkCNgOvnivzboY4dAgoGdkWK6lGEyRnUcnlN2a/5c5AY5Cotfos8C8rcPtl4ABG7tqk94iGE5Fv8wNze8JV4OCbT2Cf4gvkVrgDBUrChBgHZnDoUrtt+W0M/102y8Zulti+b1Of/QEpG0xgY1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707045029; c=relaxed/simple;
	bh=egcGDqU+IU5RHgHilOfmONqVbCel3ZdKSFnVtgEZbSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnTlUEEkoVxIPD3OBg8V5BeAdk0soX0BhfzllO2ITG6Gh2TwXXyScy9cD+AYEDYtMNwKfHsguGLvScMh7U3DiQgnp9EWEUkD+W4Dn6sj8yY01BA2LPUJmtkOhdIs3UF3KJtt8FEm6GRjN/xdhVVTuoNXLmUmx89+XVe9f3uJLME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpMaMbjX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpMaMbjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707045027; x=1738581027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=egcGDqU+IU5RHgHilOfmONqVbCel3ZdKSFnVtgEZbSE=;
  b=BpMaMbjXE9mZUQ2sOM1nYbszVj/cAUs3rbzrawEG8EkCAhptWHRv2o0n
   Jdxs3U+FOBsm+F5TlxcEzGzyCL7izfof0ec5/C/wsBpBsO/fzhVLXy8cH
   Jxh2X3NxRN8U1n2XwZ77Wt3SR3cnZSZfo4bm4lRUwaAYZoS/yi6ZhsWrk
   rCM22RY0KnZFDzT/8Fv8VW87ysSQs6MTEeRazYubEKNmyj+UbmAN6dmfN
   HPHypdnGr7998lV8Aad4RQ0+rO/NAFGFAG1pMg5ZkKYibyoMqaK+d70rp
   jPRNqW3kf1zu97C/QZaYbmjb5Kgai8DAgo7jFI53JsgcTMe7Al7gcQTiI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="551612"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="551612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 03:10:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5239649"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2024 03:10:25 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWaOE-0006HM-1X;
	Sun, 04 Feb 2024 11:10:22 +0000
Date: Sun, 4 Feb 2024 19:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [nbd168-wireless:mt76 33/45]
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:286
 __mt76_connac_mcu_alloc_sta_req() error: we previously assumed 'wcid' could
 be null (see line 281)
Message-ID: <202402041909.mUA4dToD-lkp@intel.com>
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
TO: Shayne Chen <shayne.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://github.com/nbd168/wireless mt76
head:   9f806d96c7054c92c1e0c0005a16d80e124964b7
commit: cbc8d409f650e3e275059888f766af70a0a0ba51 [33/45] wifi: mt76: connac: set correct muar_idx for mt799x chipsets
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041909.mUA4dToD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402041909.mUA4dToD-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:286 __mt76_connac_mcu_alloc_sta_req() error: we previously assumed 'wcid' could be null (see line 281)

vim +/wcid +286 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c

d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  274  
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  275  struct sk_buff *
e2c93b68cb5444 Lorenzo Bianconi 2021-12-19  276  __mt76_connac_mcu_alloc_sta_req(struct mt76_dev *dev, struct mt76_vif *mvif,
e2c93b68cb5444 Lorenzo Bianconi 2021-12-19  277  				struct mt76_wcid *wcid, int len)
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  278  {
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  279  	struct sta_req_hdr hdr = {
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  280  		.bss_idx = mvif->idx,
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26 @281  		.muar_idx = wcid ? mvif->omac_idx : 0,
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  282  		.is_tlv_append = 1,
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  283  	};
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  284  	struct sk_buff *skb;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  285  
cbc8d409f650e3 Shayne Chen      2024-01-26 @286  	if (is_mt799x(dev) && !wcid->sta)
cbc8d409f650e3 Shayne Chen      2024-01-26  287  		hdr.muar_idx = 0xe;
cbc8d409f650e3 Shayne Chen      2024-01-26  288  
67aa27431c7f87 Lorenzo Bianconi 2021-01-28  289  	mt76_connac_mcu_get_wlan_idx(dev, wcid, &hdr.wlan_idx_lo,
67aa27431c7f87 Lorenzo Bianconi 2021-01-28  290  				     &hdr.wlan_idx_hi);
e2c93b68cb5444 Lorenzo Bianconi 2021-12-19  291  	skb = mt76_mcu_msg_alloc(dev, NULL, len);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  292  	if (!skb)
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  293  		return ERR_PTR(-ENOMEM);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  294  
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  295  	skb_put_data(skb, &hdr, sizeof(hdr));
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  296  
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  297  	return skb;
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  298  }
e2c93b68cb5444 Lorenzo Bianconi 2021-12-19  299  EXPORT_SYMBOL_GPL(__mt76_connac_mcu_alloc_sta_req);
d0e274af2f2e44 Lorenzo Bianconi 2021-01-26  300  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
