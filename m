Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EFB3A3E7E
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Sep 2026 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422172; cv=none; b=a8mXXVMTkKAUnw4ci4Z/XLZklE1kDm26nt/Hm9IXkgJwfw1pz1L8+TZ/lkdKTRAKx4Oqkuj+GfutNM593DvmsfRwH3Q0kCQCrwxEVWC7hZz4ccYsEjsbZaitoQb8QnqKBp4KD/T60PCr87DDlP36etbcqF//Z6geDWHOMmaIimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422172; c=relaxed/simple;
	bh=wYJJOwzvH9In1bMkeiLfn8tG+aX6OKh+1c28F4pm12Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SB1o6FFA9c2toD30gfzIKNVdq6X/4TZqykdHUmstSPdcfart2sh9GO8+py0tsX8jGAVDBOxA2VnK6Q9ZzU3XdKuqA5N2vqHCbGkvxe/LD0j4WK0mojClWuubMNHJErmnP/tpgzjJKsxWI8FTcMfQjyefBZWNAHL6LouonM9Lcb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKFHL/Sr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKFHL/Sr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788422170; x=1819958170;
  h=date:from:to:cc:subject:message-id;
  bh=wYJJOwzvH9In1bMkeiLfn8tG+aX6OKh+1c28F4pm12Y=;
  b=eKFHL/Srr6SNeeCcMfZt5VD4WMtZvVZze/mioTuca5ig0TcdtKZ8/d7q
   WRHPFf4sXhe7EWf1GWkSP/H5Gs57lLBlfeTaAfcykMbdDgLsN627eEmX5
   TZvI8tm1Q+hLYxy9nWmYtR7kQ468KU83A+TvZ8TPLjqWFvvXo6MJbY6bD
   FdxdrV0Uy7ToVgWl7Po/RiqgXPgVGcq//4WoRea2/Zdz7Id+i6Fjci+sd
   g6pyqlF7tdxx13viCsd0PEzOBIwvVhITDLMHl2GXpp6hhY8MVja5YIJSH
   ZVVLvL6vmklu7lVo4PgQw6DvFw4mmpMEh11eVXgNixeEbRnP0lG9hGiK7
   Q==;
X-CSE-ConnectionGUID: BZd4IQknT1WJOGhWluK/Cw==
X-CSE-MsgGUID: H7ei+TK/S4GAvmlzejtzgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88771349"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88771349"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:56:09 -0700
X-CSE-ConnectionGUID: BdRQ0VDTTvKFdHuYfM2sSw==
X-CSE-MsgGUID: WUt9RC2LTBCOHLaS/8Jpag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273145774"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Sep 2026 00:56:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x22Io-000000004Ku-1YhK;
	Thu, 03 Sep 2026 07:56:06 +0000
Date: Thu, 03 Sep 2026 15:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/dsa/motorcomm/leds.c:350:1: warning:
 'yt921x_cled_hw_control_get_device' defined but not used
Message-ID: <202609031559.Jj18eJEJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/David-Yang/net-dsa-yt921x-Check-lock-status-with-lockdep_assert_held_once/20260831-123854, commit: 333cd3d87e5b9f6b7e6ee2840d30563ec8df9e82"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Yang <mmyangfl@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Yang/net-dsa-yt921x-Check-lock-status-with-lockdep_assert_held_once/20260831-123854
head:   fd1e723564e7fedf4e4c6488de92f91c233fdf9f
commit: 333cd3d87e5b9f6b7e6ee2840d30563ec8df9e82 net: dsa: motorcomm: Add LED support
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-005-20260217 (https://download.01.org/0day-ci/archive/20260903/202609031559.Jj18eJEJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031559.Jj18eJEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609031559.Jj18eJEJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/motorcomm/leds.c:350:1: warning: 'yt921x_cled_hw_control_get_device' defined but not used [-Wunused-function]
     350 | yt921x_cled_hw_control_get_device(struct led_classdev *led_cdev)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/yt921x_cled_hw_control_get_device +350 drivers/net/dsa/motorcomm/leds.c

333cd3d87e5b9f6 David Yang 2026-08-31  348  
333cd3d87e5b9f6 David Yang 2026-08-31  349  static struct device * __maybe_unused
333cd3d87e5b9f6 David Yang 2026-08-31 @350  yt921x_cled_hw_control_get_device(struct led_classdev *led_cdev)
333cd3d87e5b9f6 David Yang 2026-08-31  351  {
333cd3d87e5b9f6 David Yang 2026-08-31  352  	struct yt921x_led *led = to_yt921x_led(led_cdev);
333cd3d87e5b9f6 David Yang 2026-08-31  353  	struct yt921x_port *pp = to_yt921x_port(led);
333cd3d87e5b9f6 David Yang 2026-08-31  354  	struct yt921x_priv *priv = to_yt921x_priv(pp);
333cd3d87e5b9f6 David Yang 2026-08-31  355  	struct dsa_port *dp;
333cd3d87e5b9f6 David Yang 2026-08-31  356  
333cd3d87e5b9f6 David Yang 2026-08-31  357  	dp = dsa_to_port(&priv->ds, pp->index);
333cd3d87e5b9f6 David Yang 2026-08-31  358  	if (!dp)
333cd3d87e5b9f6 David Yang 2026-08-31  359  		return NULL;
333cd3d87e5b9f6 David Yang 2026-08-31  360  
333cd3d87e5b9f6 David Yang 2026-08-31  361  	if (dsa_port_is_user(dp))
333cd3d87e5b9f6 David Yang 2026-08-31  362  		return !dp->user ? NULL : &dp->user->dev;
333cd3d87e5b9f6 David Yang 2026-08-31  363  	if (dsa_port_is_cpu(dp))
333cd3d87e5b9f6 David Yang 2026-08-31  364  		return !dp->conduit ? NULL : &dp->conduit->dev;
333cd3d87e5b9f6 David Yang 2026-08-31  365  
333cd3d87e5b9f6 David Yang 2026-08-31  366  	return NULL;
333cd3d87e5b9f6 David Yang 2026-08-31  367  }
333cd3d87e5b9f6 David Yang 2026-08-31  368  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
