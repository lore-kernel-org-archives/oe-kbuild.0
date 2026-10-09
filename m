Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118A948595E
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 20:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577678; cv=none; b=KrrDu9MDN1gEMDHfcypZpFsdsYadiJ7IIHbaSrwZnXVpfGjpoQ+TghApK2Kidh9LZS+nuIbvHQAqHdtFtydHXPwBSybIsi9q5AjAE79jdC+lsMRxyAkYPWFLWnpqwEq/jDIuwUrAdW9S2dqNBh3wdYLSxdX80sXG/jsZtsVQ9bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577678; c=relaxed/simple;
	bh=z9Wk2ECPhUtZ6UpIPJDulFmsilC9Ltmuxw/Vn3GZWis=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HCsLiXr32I0RmNoBjn3P3P3FvpkB1n1y6KnkG3dietQnhB9jO/Dmc7Sje+DT8J3rmZDVgo3UgTpB/9vnYA/1aagkitXV75FwrxTJ3HpJNYz+Fj6r2x/jFVHuAmfb9WVbwpcWD+cu+sw2YAcQKBQscdJhJYNZWU5znE830rrNLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUogw+DS; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUogw+DS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791577677; x=1823113677;
  h=date:from:to:cc:subject:message-id;
  bh=z9Wk2ECPhUtZ6UpIPJDulFmsilC9Ltmuxw/Vn3GZWis=;
  b=aUogw+DS16CGkCQCtK1v9ZpswMN7AGX5mBEEvL9dTbd3s78TEgN3foFc
   fvBSz9SnHBsaHULxs7o3n8H7IX8jR+clOhZISs41jSEIHw1n89PTBzQQl
   j+5e3mTwG/m+rKrnUbLoQrGow948ONJGhe2a1LuLdUs/Gn4We3Pe/Lh24
   0wUBd3nMzFt29RZh0hWjpz+t9wuEHCTHn9E60wm9Z0jaT3DKfLNcJUQ9J
   rV9XH/3A+LvXjwbgOgfy9SCpnRPsdK7FQTOiUH+UaJTelt7JqNuhJDk6u
   JtFAuUnneeAAUzgSQXkndmPcRvsqR5nbN7rnODXmrZzt764Qiq3ij+xGm
   g==;
X-CSE-ConnectionGUID: ppR3C5BySXS/k9LieEWLEg==
X-CSE-MsgGUID: wloAWFF8SZa1bV3GACIP4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="391858"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="391858"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 13:27:18 -0700
X-CSE-ConnectionGUID: RP2IBDBSSZa/h/DUXAPwUA==
X-CSE-MsgGUID: QBENAypfQRibNkWaS4ittQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="746511"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 13:27:18 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFHBT-000000007Ih-0aTm;
	Fri, 09 Oct 2026 20:27:15 +0000
Date: Fri, 09 Oct 2026 22:26:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/mediatek/mt76/mt7925/nan.c:106:32-33:
 WARNING opportunity for min()
Message-ID: <202610092212.rtfizEXs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sean Wang <sean.wang@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Stella Liu <yu-ching.liu@mediatek.com>
CC: Jeremy Yu <chengwei.yu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af32da41b0327b9c6a37856ba82b6760d6c8d10e
commit: a5487a6824068cba6fab02f3e5186940a59275ed wifi: mt76: mt7925: add NAN MCU helpers
date:   2 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 2 months ago
config: sparc-randconfig-r2105-20261009 (https://download.01.org/0day-ci/archive/20261009/202610092212.rtfizEXs-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a5487a682406 ("wifi: mt76: mt7925: add NAN MCU helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610092212.rtfizEXs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/mt7925/nan.c:106:32-33: WARNING opportunity for min()
   drivers/net/wireless/mediatek/mt76/mt7925/nan.c:108:24-25: WARNING opportunity for min()

vim +106 drivers/net/wireless/mediatek/mt76/mt7925/nan.c

a5487a6824068c Sean Wang 2026-06-24  101  
a5487a6824068c Sean Wang 2026-06-24  102  static void mt7925_nan_set_scan_params(struct mt7925_nan_enable_req_tlv *req,
a5487a6824068c Sean Wang 2026-06-24  103  				       struct cfg80211_nan_conf *conf)
a5487a6824068c Sean Wang 2026-06-24  104  {
a5487a6824068c Sean Wang 2026-06-24  105  	req->scan_params_val.scan_period[0] =
a5487a6824068c Sean Wang 2026-06-24 @106  		cpu_to_le16(conf->scan_period < 255 ? conf->scan_period : 255);
a5487a6824068c Sean Wang 2026-06-24  107  	req->scan_params_val.dwell_time[0] =
a5487a6824068c Sean Wang 2026-06-24  108  		conf->scan_dwell_time < 255 ? conf->scan_dwell_time : 255;
a5487a6824068c Sean Wang 2026-06-24  109  }
a5487a6824068c Sean Wang 2026-06-24  110  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
