Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0133B1EC0
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355531; cv=none; b=gGF9h9Y/glVcGLSiW1Sxw2GPxZj4078jIX/4VWFcfkZx5Hxas2GasfxftGL7B0oiCagGHI6/p10DCDPD86XsYaPa+pleVPtLsvZkqmvx2h5Lyad7mviPPQD7nJm2wFGbjLsl0gNlUD+VQj4qCRyKU33bSZX3Za1/63CiEESN2ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355531; c=relaxed/simple;
	bh=AUNg/a9gPb3vtmJ63FUpfK7DLcsEIxTSc/ytxt/5C5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uqh3h3zSfMwFJWUSpnPzUT630zAhIhSppiUCjkCbadwmC7RmZn226DCyYcjvHXHUSbbsMns9q8MkFwre80J/VNHDeSFkdSYkUZnxymW2at2k+pg7eFY62+odQMjTPro2m2webfg66U5t1d8dTf+x5zTSL2JgZuNqtczXNPn/M/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQkiEBGw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQkiEBGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786355528; x=1817891528;
  h=date:from:to:cc:subject:message-id;
  bh=AUNg/a9gPb3vtmJ63FUpfK7DLcsEIxTSc/ytxt/5C5w=;
  b=DQkiEBGwMkKGc2ArfGTIZCpuuz2iD+DNxooX68Wy7DjKBaU6tPgUyITQ
   g/asqqO8fdtChAp6Tp4gwddUBGq8ecDJ04slwqp4Z3N95ZTtyrX38nd1v
   nLDSrG41kkESr6a70+LlL4MurcINQ9WqP0LwcVfxVNQVD/ygheO3DZOpS
   AzCmaAgeJ4cSc+usGmX77kNseSZt/kZC+JyknnEkj3rsesQTmlcDR/isI
   Gt0GRtEYlBj8I1xN4ncvR2+4CJVRnYtDfFYXb0ZCJaSjAViKnWASfF4BK
   fmraB1XuF3jf9xFXegM7kSSkzigBEUk8vFpXMaqgzoSNPt7fIgX+ytVVq
   Q==;
X-CSE-ConnectionGUID: CQ40SAH2SVCmIE1W6xNyVg==
X-CSE-MsgGUID: HdILhy5URTSgkNn86Zf7YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86874369"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="86874369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 02:51:59 -0700
X-CSE-ConnectionGUID: b01Lh2HLS9aCQrGA9BjoUg==
X-CSE-MsgGUID: +08URmnZQyy5RU5ZQvrl5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="268154114"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Aug 2026 02:51:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtMfj-00000000N6g-0TBH;
	Mon, 10 Aug 2026 09:51:55 +0000
Date: Mon, 10 Aug 2026 17:51:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10145/13846]
 drivers/net/wireless/mediatek/mt76/mt7925/nan.c:210 mt7925_nan_mp_tlv() warn:
 impossible condition '(master_pref > 255) => (0-255 > 255)'
Message-ID: <202608101725.AtQNuubl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Wang <sean.wang@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Stella Liu <yu-ching.liu@mediatek.com>
CC: Jeremy Yu <chengwei.yu@mediatek.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: a5487a6824068cba6fab02f3e5186940a59275ed [10145/13846] wifi: mt76: mt7925: add NAN MCU helpers
:::::: branch date: 3 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-161-20260810 (https://download.01.org/0day-ci/archive/20260810/202608101725.AtQNuubl-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608101725.AtQNuubl-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/nan.c:210 mt7925_nan_mp_tlv() warn: impossible condition '(master_pref > 255) => (0-255 > 255)'

vim +210 drivers/net/wireless/mediatek/mt76/mt7925/nan.c

a5487a6824068cb Sean Wang 2026-06-24  193  
a5487a6824068cb Sean Wang 2026-06-24  194  static int
a5487a6824068cb Sean Wang 2026-06-24  195  mt7925_nan_mp_tlv(struct sk_buff *skb, u8 master_pref)
a5487a6824068cb Sean Wang 2026-06-24  196  {
a5487a6824068cb Sean Wang 2026-06-24  197  	struct mt7925_nan_master_preference_tlv *mp_tlv = NULL;
a5487a6824068cb Sean Wang 2026-06-24  198  	struct tlv *tlv = NULL;
a5487a6824068cb Sean Wang 2026-06-24  199  
a5487a6824068cb Sean Wang 2026-06-24  200  	if (!skb)
a5487a6824068cb Sean Wang 2026-06-24  201  		return -EINVAL;
a5487a6824068cb Sean Wang 2026-06-24  202  
a5487a6824068cb Sean Wang 2026-06-24  203  	tlv = mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_SET_MASTER_PREFERENCE,
a5487a6824068cb Sean Wang 2026-06-24  204  				      sizeof(struct mt7925_nan_master_preference_tlv));
a5487a6824068cb Sean Wang 2026-06-24  205  	if (!tlv)
a5487a6824068cb Sean Wang 2026-06-24  206  		return -ENOMEM;
a5487a6824068cb Sean Wang 2026-06-24  207  
a5487a6824068cb Sean Wang 2026-06-24  208  	mp_tlv = (struct mt7925_nan_master_preference_tlv *)tlv;
a5487a6824068cb Sean Wang 2026-06-24  209  
a5487a6824068cb Sean Wang 2026-06-24 @210  	if (master_pref > NAN_MAX_MASTER_PREFERENCE)
a5487a6824068cb Sean Wang 2026-06-24  211  		return 0;
a5487a6824068cb Sean Wang 2026-06-24  212  
a5487a6824068cb Sean Wang 2026-06-24  213  	mp_tlv->master_preference = master_pref;
a5487a6824068cb Sean Wang 2026-06-24  214  
a5487a6824068cb Sean Wang 2026-06-24  215  	return 0;
a5487a6824068cb Sean Wang 2026-06-24  216  }
a5487a6824068cb Sean Wang 2026-06-24  217  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
