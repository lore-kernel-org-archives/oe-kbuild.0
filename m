Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C307037107E
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 08:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791706595; cv=none; b=Ka7ChEw69QX2H+hHpteazaEXFsuW/1b7WCunbWpFR8h06ciXMFMQrBJFiO6PepySovVoaTDdgDdWvjhQ5BPrjRn/PvDU6eI0BFsEErz5cuCjhQV2oQetwElQN/udP/Xchx+3GTpvS2+u6cfEg2bn4J/XAWZE/Vo0z2+PPKFNQ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791706595; c=relaxed/simple;
	bh=tRcOPC6p1OSOVZ5WpxrswY0yAjL9zJP8INe+lrcVLCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fek3D7ZYtylgp51jwmq8Q9oEw68Gslbv/SEPiG7OJ5y4uhyugn5bO+f9sHPX8YRO2se8HchPNJx59vowy1GB1xuUZolHKrIiOg+IQCfeE4FuFE7rkMvS5JarcNkAeMvl1vB1jd74Th8P6qw8/4F/KAh3WN2iZt3Ch8xx/UmVf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lX7t/yXn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lX7t/yXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791706593; x=1823242593;
  h=date:from:to:cc:subject:message-id;
  bh=tRcOPC6p1OSOVZ5WpxrswY0yAjL9zJP8INe+lrcVLCM=;
  b=lX7t/yXnfyzS8z2cPMGmrAkXyHcf5CWMFBKxpFw0548f0y2ZXNchxmhf
   vNHxFT9NUoJXunGg1u5v4BeR8Q0ieoRFclWi4Axm2kW4vIl0Xmwyzq+ur
   cgIzDt00lt4hd2eIzCquHHE81gzWaGWXQS9iiZnh44TEoUxP1HdffmM7d
   G3VBFBCP3M3XUsHaBQ9D2FTTHM98cLpQOAo6zJbaVMEFpR3r4Y4DYwsSg
   VHtIg6UXDNPslVcr88nezwgPArgWsGVCQ6sqcyjCNneH13S2YYs9EP5TJ
   I99DDpcYkOVbfMAY/Fh65AwpZs+dfxjYJOjuPazlzFEoqNn8t+JC2gMk3
   w==;
X-CSE-ConnectionGUID: 4iQAOE0JTFyZMDhLNrmxuw==
X-CSE-MsgGUID: kkuQZaP1RTeeXnJOvVFrdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="458226"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="458226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 01:16:33 -0700
X-CSE-ConnectionGUID: KCzhfi9BSvKM8TtV8KPHIg==
X-CSE-MsgGUID: rZs2n5OWRH6mU3HsnhLWgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="620325"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Oct 2026 01:16:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFojM-000000009Rz-3Ppa;
	Sun, 11 Oct 2026 08:16:28 +0000
Date: Sun, 11 Oct 2026 10:15:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pkshih-rtw:rtw-next 22/40] net/wireless/nl80211.c:267
 nl80211_lock_and_recheck() warn: inconsistent returns '&rdev->wiphy.mtx'.
Message-ID: <202610111016.9wexeSaG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://github.com/pkshih/rtw rtw-next
head:   fbfa27d9b06f025c5f2cfa79d0e01e6400eeff2a
commit: 8e3d9039d280c61e1ef5c5cbe8ee8db342907173 [22/40] wifi: nl80211: avoid rtnl for commands that don't want it
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r2202-20261011 (https://download.01.org/0day-ci/archive/20261011/202610111016.9wexeSaG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610111016.9wexeSaG-lkp@intel.com/

New smatch warnings:
net/wireless/nl80211.c:267 nl80211_lock_and_recheck() warn: inconsistent returns '&rdev->wiphy.mtx'.

Old smatch warnings:
net/wireless/nl80211.c:4843 nl80211_send_iface() error: we previously assumed 'rdev->ops->get_channel' could be null (see line 4766)

vim +267 net/wireless/nl80211.c

a9455408b09395 Johannes Berg 2012-06-15  227  
8e3d9039d280c6 Johannes Berg 2026-10-06  228  /*
8e3d9039d280c6 Johannes Berg 2026-10-06  229   * Lock the given wiphy, put the device and double-check it's
8e3d9039d280c6 Johannes Berg 2026-10-06  230   * still valid to use.
8e3d9039d280c6 Johannes Berg 2026-10-06  231   *
8e3d9039d280c6 Johannes Berg 2026-10-06  232   * Returns with wiphy mutex held unless there was an error.
8e3d9039d280c6 Johannes Berg 2026-10-06  233   */
8e3d9039d280c6 Johannes Berg 2026-10-06  234  static struct wireless_dev *
8e3d9039d280c6 Johannes Berg 2026-10-06  235  nl80211_lock_and_recheck(struct cfg80211_registered_device *rdev,
8e3d9039d280c6 Johannes Berg 2026-10-06  236  			 struct net *netns, u32 wdev_id)
8e3d9039d280c6 Johannes Berg 2026-10-06  237  {
8e3d9039d280c6 Johannes Berg 2026-10-06  238  	struct wireless_dev *wdev;
8e3d9039d280c6 Johannes Berg 2026-10-06  239  
8e3d9039d280c6 Johannes Berg 2026-10-06  240  	wiphy_lock(&rdev->wiphy);
8e3d9039d280c6 Johannes Berg 2026-10-06  241  
8e3d9039d280c6 Johannes Berg 2026-10-06  242  	if (!rdev->wiphy.registered ||
8e3d9039d280c6 Johannes Berg 2026-10-06  243  	    !net_eq(wiphy_net(&rdev->wiphy), netns)) {
8e3d9039d280c6 Johannes Berg 2026-10-06  244  		wiphy_unlock(&rdev->wiphy);
8e3d9039d280c6 Johannes Berg 2026-10-06  245  		put_device(&rdev->wiphy.dev);
8e3d9039d280c6 Johannes Berg 2026-10-06  246  		return ERR_PTR(-ENODEV);
8e3d9039d280c6 Johannes Berg 2026-10-06  247  	}
8e3d9039d280c6 Johannes Berg 2026-10-06  248  
8e3d9039d280c6 Johannes Berg 2026-10-06  249  	/*
8e3d9039d280c6 Johannes Berg 2026-10-06  250  	 * unregistration blocks on wiphy mutex,
8e3d9039d280c6 Johannes Berg 2026-10-06  251  	 * so we don't need this now
8e3d9039d280c6 Johannes Berg 2026-10-06  252  	 */
8e3d9039d280c6 Johannes Berg 2026-10-06  253  	put_device(&rdev->wiphy.dev);
8e3d9039d280c6 Johannes Berg 2026-10-06  254  
8e3d9039d280c6 Johannes Berg 2026-10-06  255  	if (!wdev_id)
8e3d9039d280c6 Johannes Berg 2026-10-06  256  		return NULL;
8e3d9039d280c6 Johannes Berg 2026-10-06  257  
8e3d9039d280c6 Johannes Berg 2026-10-06  258  	list_for_each_entry(wdev, &rdev->wiphy.wdev_list, list) {
8e3d9039d280c6 Johannes Berg 2026-10-06  259  		if (wdev->identifier != wdev_id)
8e3d9039d280c6 Johannes Berg 2026-10-06  260  			continue;
8e3d9039d280c6 Johannes Berg 2026-10-06  261  		if (wdev->netdev && !net_eq(dev_net(wdev->netdev), netns))
8e3d9039d280c6 Johannes Berg 2026-10-06  262  			break;
8e3d9039d280c6 Johannes Berg 2026-10-06  263  		return wdev;
8e3d9039d280c6 Johannes Berg 2026-10-06  264  	}
8e3d9039d280c6 Johannes Berg 2026-10-06  265  	wiphy_unlock(&rdev->wiphy);
8e3d9039d280c6 Johannes Berg 2026-10-06  266  
8e3d9039d280c6 Johannes Berg 2026-10-06 @267  	return ERR_PTR(-ENODEV);
8e3d9039d280c6 Johannes Berg 2026-10-06  268  }
8e3d9039d280c6 Johannes Berg 2026-10-06  269  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
