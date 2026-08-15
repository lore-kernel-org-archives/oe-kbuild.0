Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E78189B84
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786816803; cv=none; b=JanlSlpKltRP/KWBVEhfNm74BKxuXzZL15zPO2LEhP7XeZBf/gZ/G5VLh5Aa1wGH1ye6xpXw687puMGAA3pYp+nIsEOFIlhYnnEQz4umTB2FhpHun3OQiRcM5CG0I12iYn8MEGZR3RNt9oxW+odYHHEJCw5j1NgJqYFKsKlBjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786816803; c=relaxed/simple;
	bh=RErp1IUoQDun76IhrO9MjfAN/kQLyA7eqCnilgrIMR0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NXX4Pssy19YjulradmAuz8FH17ZMhch0bzcXoUndn4lBe4PWDK4ysc5oW3vOh5lEzBpcZkY5HtJBivkPKbKf34sIImd8Uti264gYhvLkP489hK3JWEPLvybsfsmZRUHh+mErNlW13m7lhEk5tdIgKF7OKE8lOZyBoQmVE3vm2YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTOhFc1c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTOhFc1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786816802; x=1818352802;
  h=date:from:to:cc:subject:message-id;
  bh=RErp1IUoQDun76IhrO9MjfAN/kQLyA7eqCnilgrIMR0=;
  b=OTOhFc1ctowWCRV4f7QBK//Bc4qxpugq45KCcsaglGbGJ8f/03I7oIsI
   ZOjMaaPdGHs4Fq2P7moON7u1ZvSMLzAgGsU+UtDv6gnHcTAsLt1Lp/t7l
   RUWqTIisT1BDmgOHVMsDKEFvfUH/QegQUskT3It76LQlueTGa0TVYpUg6
   jzW1NrjSwYOqpcBSxfe7MlYaXwDE7PLomAxgje8ExSLBfXvsHehHJ2x3+
   gJSqji17WHbNtRmtMCNm2supnFK30wq8XgHDkW0guwWBcBXzH2YyOFCkd
   1a7dW1LdyPLn7r9ySBc46SAUDFa8Jr2sTrKHDqhVrmrayJxr+rc/Rgm85
   w==;
X-CSE-ConnectionGUID: n8lAOaQ/TUuA7f8pndRg9A==
X-CSE-MsgGUID: qBk9x1gzQGmekUfVVVJ1vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="97704373"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="97704373"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 11:00:01 -0700
X-CSE-ConnectionGUID: Q+J7AtviQrytxyf0zExVjA==
X-CSE-MsgGUID: x2zYn0DyS8a8LhRwoGDN1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="265121564"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Aug 2026 11:00:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvIfl-00000000cPS-2rPj;
	Sat, 15 Aug 2026 17:59:57 +0000
Date: Sun, 16 Aug 2026 01:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/liveupdate.h:287:5: warning: no previous
 prototype for 'liveupdate_flb_incoming_early'
Message-ID: <202608160151.EszMgENt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pratyush-Yadav/kho-drop-restriction-on-maximum-page-order/20260815-221525, commit: d0e70617c45e88d720e7461e6ea9f2d136a610c4"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pratyush Yadav <pratyush@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-drop-restriction-on-maximum-page-order/20260815-221525
head:   e99e331639f1c4883ed41f9a5201e7c5aec1bdbf
commit: d0e70617c45e88d720e7461e6ea9f2d136a610c4 liveupdate: flb: allow getting FLB data in early boot
date:   4 hours ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260816/202608160151.EszMgENt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608160151.EszMgENt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608160151.EszMgENt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mm_init.c:34:
>> include/linux/liveupdate.h:287:5: warning: no previous prototype for 'liveupdate_flb_incoming_early' [-Wmissing-prototypes]
     287 | int liveupdate_flb_incoming_early(struct liveupdate_flb *flb, u64 *datap)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/liveupdate_flb_incoming_early +287 include/linux/liveupdate.h

6ae88b58caeb68 Pasha Tatashin 2025-11-25  286  
d0e70617c45e88 Pratyush Yadav 2025-12-07 @287  int liveupdate_flb_incoming_early(struct liveupdate_flb *flb, u64 *datap)
d0e70617c45e88 Pratyush Yadav 2025-12-07  288  {
d0e70617c45e88 Pratyush Yadav 2025-12-07  289  	return -EOPNOTSUPP;
d0e70617c45e88 Pratyush Yadav 2025-12-07  290  }
d0e70617c45e88 Pratyush Yadav 2025-12-07  291  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
