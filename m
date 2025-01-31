Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3025919E7D3
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jan 2025 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738364025; cv=none; b=Q/JtOfCIBuGHoODXMovFf7qRKs695BOdeKNY+nziGSdtawoTqSQv+RqsOgXLu1rYPgf/dtyPWjB5lM/GzkfHIanOEjOM7ZZMmgBTHVd5KnEofYxpo6ovXreHAmvLbuoVF7fjRzx8eqxS4UFTlO+U2eeHjKpUADUJh9h0yxFzXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738364025; c=relaxed/simple;
	bh=g5Dk21VuPbzoEulNGJcyrIM/IUzsl+hUQMWyR2hRgas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iq2DnPuoUsMeoaxM84ty2nLtmcnRxysleTlTHcdrJDN+r6kWNTrqGEsbCXX4JjR1UagKGPxFcq+9Tz4vNF5A1q4DEhAzaTfjhIPqLtdmaJ2IuUOnAEv8cNtA+Aw86M6GQxqi390lhu0KfDM4wUhW8MjREA/liL3ystXuWzWp9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Le9qzCbd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Le9qzCbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738364023; x=1769900023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g5Dk21VuPbzoEulNGJcyrIM/IUzsl+hUQMWyR2hRgas=;
  b=Le9qzCbdkgPXJSTQ67HqEGvH98dPkVDlwMidsfGGDNyluHXdD9A4kzSx
   s5xFfGo6jnXhmjZQZgLOu2cFAg+fKSyk9yq3A+PfUgbKg2wZi5ci705m8
   GCzGmo/ZVy6AykBARrDlTKNF6MsOZixVKk9uqedrfeiV0reE2PI9Yr8p1
   26VJlZkhKN8ni5Mylr5bvin156UdqRhPlQI4Vk7CqDCbOmiiQSaAnEJCs
   Iidu8OBMbye5LO0uAI6aFByRI/ttZV8iNFI1kXcv4dhwCy8exSJtfL7b9
   JD5RlnNsiP58u6E1FQZOVEA41QPHXqxz13jKEBQOf1xFjBWarXyzcQGIt
   w==;
X-CSE-ConnectionGUID: ChhQWz/dSwK/eYTP31f4FA==
X-CSE-MsgGUID: cBc5JyD7TXW+9V9UatZxXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50360460"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50360460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 14:53:37 -0800
X-CSE-ConnectionGUID: HybnRin9TWq4+5Mi79IfnQ==
X-CSE-MsgGUID: m4GA05FFSYOQFlx76wW6dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140633196"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2025 14:53:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdztA-000nLx-1A;
	Fri, 31 Jan 2025 22:53:28 +0000
Date: Sat, 1 Feb 2025 06:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/mediatek/mt76/mt7996/main.c:73
 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line
 71)
Message-ID: <202502010604.nBhFqzvE-lkp@intel.com>
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
head:   fd8c09ad0d87783b9b6a27900d66293be45b7bad
commit: 69d54ce7491d046eaae05de7fb2493319a481991 wifi: mt76: mt7996: switch to single multi-radio wiphy
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: alpha-randconfig-r071-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010604.nBhFqzvE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502010604.nBhFqzvE-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:73 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line 71)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:357 mt7996_set_monitor() warn: variable dereferenced before check 'phy' (see line 355)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:906 mt7996_set_rts_threshold() error: uninitialized symbol 'ret'.

vim +/phy +73 drivers/net/wireless/mediatek/mt76/mt7996/main.c

98686cd21624c75 Shayne Chen   2022-11-22  68  
69d54ce7491d046 Felix Fietkau 2025-01-02  69  static void mt7996_stop_phy(struct mt7996_phy *phy)
98686cd21624c75 Shayne Chen   2022-11-22  70  {
69d54ce7491d046 Felix Fietkau 2025-01-02 @71  	struct mt7996_dev *dev = phy->dev;
69d54ce7491d046 Felix Fietkau 2025-01-02  72  
69d54ce7491d046 Felix Fietkau 2025-01-02 @73  	if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
69d54ce7491d046 Felix Fietkau 2025-01-02  74  		return;
98686cd21624c75 Shayne Chen   2022-11-22  75  
98686cd21624c75 Shayne Chen   2022-11-22  76  	cancel_delayed_work_sync(&phy->mt76->mac_work);
98686cd21624c75 Shayne Chen   2022-11-22  77  
98686cd21624c75 Shayne Chen   2022-11-22  78  	mutex_lock(&dev->mt76.mutex);
98686cd21624c75 Shayne Chen   2022-11-22  79  
d73dab22e7a8a8f Shayne Chen   2023-06-05  80  	mt7996_mcu_set_radio_en(phy, false);
d73dab22e7a8a8f Shayne Chen   2023-06-05  81  
98686cd21624c75 Shayne Chen   2022-11-22  82  	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
98686cd21624c75 Shayne Chen   2022-11-22  83  
98686cd21624c75 Shayne Chen   2022-11-22  84  	mutex_unlock(&dev->mt76.mutex);
98686cd21624c75 Shayne Chen   2022-11-22  85  }
98686cd21624c75 Shayne Chen   2022-11-22  86  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
