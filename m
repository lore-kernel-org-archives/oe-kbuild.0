Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ABC1EDA3D
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Apr 2025 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499258; cv=none; b=YBxVelaMHUCz+pbSfo331TI3GlNPe0jj/gRte8FIW7Od7Scf/lN3GCQ47rHlJQvyhk9avYMyik3WtiOhhC89Rl9Sl69/W5GcMVVBQQ1LcN4vBB0r+tmJnwXCKfcZoYNo2GVlf1qYoE35RLn5/IPhsW+u7+ADr3rjOc0OUsOM1kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499258; c=relaxed/simple;
	bh=WORnQNZBjoxXe1T3UAHdtYIO9qp7z3KXZp+TDl9cETY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b5XiBn+PzgXvMIOLRbYVbL/l8dQakdkLKDicmXzCQGIh72WZ9rnnENXaZZP+PYBm5mTRw3yP9tlK73Hbxb/SQ8aQXu+QaewymUWQQxsQTwZDANDh5WrNFW8B/eUdTQ4Mh1kHC/cK/1NmH+jhAA2xCO8CuFM4ZuPG1jMfclp/8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6Xwh9Ro; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6Xwh9Ro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743499257; x=1775035257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WORnQNZBjoxXe1T3UAHdtYIO9qp7z3KXZp+TDl9cETY=;
  b=X6Xwh9Ro26OKeKSSwagnj0jtfMfcrjCoVAAUtIW15sJ6HRIdBGs5Uhbk
   1YUN8zeQuAafjvPhDyUCkyIOHoSIJ/UnLKMEMHBf4mZpOOSm6SufN8oD3
   Z0jBuUoDsiIz0/IrCeZwA0F2YRqSyPmcxQwyM1gGeqokwHyYEFH8EEDzu
   bUxu6JTiTPQxQ3+/SPRUgyIsHZF35ZlFD1HtRm92JL3tddN2lw27AI4v2
   qXpfpxzgQJhNRfFdPApvWtkfL4GNraSuYoUSlkogSk0C8YOAjUnMkV31X
   0O0JlcNrukI9J75xF6FhYVLQTMyCxLCLgc+T9edh9senypaiVWobL2Vlg
   A==;
X-CSE-ConnectionGUID: M35Swm7JTmmqEOkh6k+Tcg==
X-CSE-MsgGUID: 7YJtQcgITaikmRo6e6tusw==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="48683345"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="48683345"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:20:55 -0700
X-CSE-ConnectionGUID: 0RQIoWJxQ+qQimYnxJjORw==
X-CSE-MsgGUID: db0QRfW+T0G80gKBz+XczA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="157260001"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Apr 2025 02:20:55 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzXng-0009ks-0E;
	Tue, 01 Apr 2025 09:20:52 +0000
Date: Tue, 1 Apr 2025 17:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/channel.c:307
 mt76_put_vif_phy_link() warn: variable dereferenced before IS_ERR check
 'mlink' (see line 305)
Message-ID: <202504011739.HvUKtUUe-lkp@intel.com>
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
TO: Felix Fietkau <nbd@nbd.name>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08733088b566b58283f0f12fb73f5db6a9a9de30
commit: 3ba20af886d1f604dceeb4d4c8ff872e2c4e885e wifi: mt76: scan: set vif offchannel link for scanning/roc
date:   13 days ago
:::::: branch date: 8 hours ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-161-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011739.HvUKtUUe-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504011739.HvUKtUUe-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/channel.c:307 mt76_put_vif_phy_link() warn: variable dereferenced before IS_ERR check 'mlink' (see line 305)

vim +/mlink +307 drivers/net/wireless/mediatek/mt76/channel.c

e411b8190fe7c9 Felix Fietkau 2025-01-02  300  
e411b8190fe7c9 Felix Fietkau 2025-01-02  301  void mt76_put_vif_phy_link(struct mt76_phy *phy, struct ieee80211_vif *vif,
e411b8190fe7c9 Felix Fietkau 2025-01-02  302  			   struct mt76_vif_link *mlink)
e411b8190fe7c9 Felix Fietkau 2025-01-02  303  {
e411b8190fe7c9 Felix Fietkau 2025-01-02  304  	struct mt76_dev *dev = phy->dev;
3ba20af886d1f6 Felix Fietkau 2025-03-11 @305  	struct mt76_vif_data *mvif = mlink->mvif;
e411b8190fe7c9 Felix Fietkau 2025-01-02  306  
e411b8190fe7c9 Felix Fietkau 2025-01-02 @307  	if (IS_ERR_OR_NULL(mlink) || !mlink->offchannel)
e411b8190fe7c9 Felix Fietkau 2025-01-02  308  		return;
e411b8190fe7c9 Felix Fietkau 2025-01-02  309  
3ba20af886d1f6 Felix Fietkau 2025-03-11  310  	rcu_assign_pointer(mvif->offchannel_link, NULL);
e411b8190fe7c9 Felix Fietkau 2025-01-02  311  	dev->drv->vif_link_remove(phy, vif, &vif->bss_conf, mlink);
e411b8190fe7c9 Felix Fietkau 2025-01-02  312  	kfree(mlink);
e411b8190fe7c9 Felix Fietkau 2025-01-02  313  }
a8f424c1287cc7 Felix Fietkau 2025-01-02  314  

:::::: The code at line 307 was first introduced by commit
:::::: e411b8190fe7c969c668eedb5b01f2865c89b1af wifi: mt76: add multi-radio support to scanning code

:::::: TO: Felix Fietkau <nbd@nbd.name>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
