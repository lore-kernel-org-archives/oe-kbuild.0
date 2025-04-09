Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D2C1D7999
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Apr 2025 18:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223443; cv=none; b=h8E112Fd0DkbpPi+pgBt4joC93IcYqocp6uvVQDk0f6ZSZctEKJvnNqtqwVmvDDjDWGQrMm9O2OKcOpg0F2gUBON1E0qD5USYNC/PsCEn+5HNbl5j/180QN+7J5hc+tMn/LYeXMLPa6hth02z+dbxgtrj7XLuIhg0iuhWZV+BqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223443; c=relaxed/simple;
	bh=8nKOWIqxZQ+qLEcdFbBes4joUKV16dGyosoLcm/iUnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hI1MZ1C2HE1h7LlywQDyb1LNVPpHbGN7keeNKBOO9nFpHmjQw4qL+/XKhE92rXuek4CutLgD3+yAuGRrgRvHh2GBJz/ilUUxgqqulJo7Ul+ss6ryUltFsphZKG1fnaxQV7P5mnrS6ccqZiCKL22drCesBcZ0AxO1/qYKg4tz6CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZZKcUk2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZZKcUk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744223442; x=1775759442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8nKOWIqxZQ+qLEcdFbBes4joUKV16dGyosoLcm/iUnM=;
  b=lZZKcUk2BJ/4Mmb8J3Vesi8sZ5KqgthB9eT/bA3Ph9YWko/aj5F9uJcP
   TmAdsHD8AdjGeUwgJCowIRCIxDWKPy/xzxuB0J1ajvVc8C+d4hlpqgU/+
   QtB0VtHf8d+WpmQvaubaI0Vgn8icZjlJFXwb4j0fmp1RDB0VdwiWu527Z
   nRIkUwdAT54WECVKir+TMYquzSpsPjyt+nn7GmU+l0rIsdrcRvMVrPh5O
   +rVKZd7n65ROLgV5zgxEKHV+oMvuUSrEaCCKQX+Aq0Hb3B+q5kRkcSvYa
   Kak+pYPB6JtvJAaXznowhRhLlQ5YzK8u9oZwXSc6R3BUNuYwAi8nSPfIE
   A==;
X-CSE-ConnectionGUID: zwNk/hVrQ+eNGRSvY75bCQ==
X-CSE-MsgGUID: ZVoxpdq/QWWgwFlqZWT5tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45611779"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45611779"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 11:30:41 -0700
X-CSE-ConnectionGUID: HYGV8aw2RqisYDvUluLCCg==
X-CSE-MsgGUID: huqeRattS/yRVL9RUFc4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="128636411"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2025 11:30:39 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2aC5-0009C7-0p;
	Wed, 09 Apr 2025 18:30:37 +0000
Date: Thu, 10 Apr 2025 02:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7925/init.c:85
 mt7925_regd_be_ctrl() warn: should this be a bitwise op?
Message-ID: <202504100204.la3Z3iGz-lkp@intel.com>
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
TO: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a24588245776dafc227243a01bfbeb8a59bafba9
commit: f0317215b367e22e1cde5dcdb4c0687f0a85b913 wifi: mt76: mt7925: add EHT control support based on the CLC data
date:   3 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: powerpc64-randconfig-r073-20250409 (https://download.01.org/0day-ci/archive/20250410/202504100204.la3Z3iGz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504100204.la3Z3iGz-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7925/init.c:85 mt7925_regd_be_ctrl() warn: should this be a bitwise op?

vim +85 drivers/net/wireless/mediatek/mt76/mt7925/init.c

a0f721b8d986b6 Quan Zhou      2025-01-03  60  
f0317215b367e2 Ming Yen Hsieh 2025-03-04  61  void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2)
f0317215b367e2 Ming Yen Hsieh 2025-03-04  62  {
f0317215b367e2 Ming Yen Hsieh 2025-03-04  63  	struct mt792x_phy *phy = &dev->phy;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  64  	struct mt7925_clc_rule_v2 *rule;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  65  	struct mt7925_clc *clc;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  66  	bool old = dev->has_eht, new = true;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  67  	u8 *pos;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  68  
f0317215b367e2 Ming Yen Hsieh 2025-03-04  69  	if (!phy->clc[MT792x_CLC_BE_CTRL])
f0317215b367e2 Ming Yen Hsieh 2025-03-04  70  		goto out;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  71  
f0317215b367e2 Ming Yen Hsieh 2025-03-04  72  	clc = (struct mt7925_clc *)phy->clc[MT792x_CLC_BE_CTRL];
f0317215b367e2 Ming Yen Hsieh 2025-03-04  73  	pos = clc->data;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  74  
f0317215b367e2 Ming Yen Hsieh 2025-03-04  75  	while (1) {
f0317215b367e2 Ming Yen Hsieh 2025-03-04  76  		rule = (struct mt7925_clc_rule_v2 *)pos;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  77  
f0317215b367e2 Ming Yen Hsieh 2025-03-04  78  		if (rule->alpha2[0] == alpha2[0] &&
f0317215b367e2 Ming Yen Hsieh 2025-03-04  79  		    rule->alpha2[1] == alpha2[1]) {
f0317215b367e2 Ming Yen Hsieh 2025-03-04  80  			new = false;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  81  			break;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  82  		}
f0317215b367e2 Ming Yen Hsieh 2025-03-04  83  
f0317215b367e2 Ming Yen Hsieh 2025-03-04  84  		/* Check the last one */
f0317215b367e2 Ming Yen Hsieh 2025-03-04 @85  		if (rule->flag && BIT(0))
f0317215b367e2 Ming Yen Hsieh 2025-03-04  86  			break;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  87  
f0317215b367e2 Ming Yen Hsieh 2025-03-04  88  		pos += sizeof(*rule);
f0317215b367e2 Ming Yen Hsieh 2025-03-04  89  	}
f0317215b367e2 Ming Yen Hsieh 2025-03-04  90  
f0317215b367e2 Ming Yen Hsieh 2025-03-04  91  out:
f0317215b367e2 Ming Yen Hsieh 2025-03-04  92  	if (old == new)
f0317215b367e2 Ming Yen Hsieh 2025-03-04  93  		return;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  94  
f0317215b367e2 Ming Yen Hsieh 2025-03-04  95  	dev->has_eht = new;
f0317215b367e2 Ming Yen Hsieh 2025-03-04  96  	mt7925_set_stream_he_eht_caps(phy);
f0317215b367e2 Ming Yen Hsieh 2025-03-04  97  }
f0317215b367e2 Ming Yen Hsieh 2025-03-04  98  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
