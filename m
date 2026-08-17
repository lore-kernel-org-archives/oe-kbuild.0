Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441B92236FD
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968213; cv=none; b=MBJHjdkatpcU0Ly8CAdWOPrYa2YfwuFhVM2MY20D8bO1uhnZUEiL2w5etffEoNSyHAbmoTOgg8tbjHbCvX1dfSTMJvsiQKBVQygnfxdnyxMFXie94Ny2aR5+PP2Bd8Ydp5jmXhJBTCvuymUezl/ccXuPGMM3b0+5fXM6Qit45AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968213; c=relaxed/simple;
	bh=0lpSnmv5WRVEDnaeToW1zuw0uSv4dTGPqbeLitS4j88=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EwQyGDKP33xjOQjEo4LhSXbkrIpGHzW0Y0Iglaob3Y4LmPbEzyloif1l2JDgo+K1jYoOY6dWi6Zbj+EgA9wiHwnVcuQP0YH0nNZwf6XroIl8QO4411vf44GFM+Vlr+1kKzW///dXuoQROW269iJfnSBA1ePgXfIEXnC2V3unI9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWaA/8us; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWaA/8us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786968212; x=1818504212;
  h=date:from:to:cc:subject:message-id;
  bh=0lpSnmv5WRVEDnaeToW1zuw0uSv4dTGPqbeLitS4j88=;
  b=RWaA/8us+fJNaa+6dfVSDD68Fq8ky/U5wTNVvyVc/uIy0iM9Hjl+ARkn
   o2ZR18HCgFoqrVWUFm5IjbwVByd9LQXhk/UFmJKOdt+zQ710Z4t8nEZtY
   FRplmq44xgIdsTJiJHFdsD9UigZAXzrEovbGjcMN5bHVsmWZk0tXMUYlW
   PmGwsxQkEz1jPcFAEd5V6GY9pnw9PVtClXJgMIEquJZYvJFH1ChMJY6vO
   IspzZ9kpw76cUSHCP/YT2HbJkJ0BMJs7oTUE6GoKpsaJxahUAUIHaCLEf
   G9/oL6rH9ZGyEJ/ung+87DIKTtSBblIi0O++xHjMZioY9r/Ur4UHOalpS
   w==;
X-CSE-ConnectionGUID: tJtKvywBQMuSFYPlM0/kQA==
X-CSE-MsgGUID: x1Gh3GRbSyKgAV7OUVtmyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87462183"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="87462183"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:03:31 -0700
X-CSE-ConnectionGUID: ieO98yW9SzuO8PmJfisMow==
X-CSE-MsgGUID: e1Dfnww5SkSkm+vGLYDpXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="266879474"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Aug 2026 05:03:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvw3r-00000000dRt-2F9g;
	Mon, 17 Aug 2026 12:03:27 +0000
Date: Mon, 17 Aug 2026 19:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/linux/liveupdate.h:287:5: warning: no previous
 prototype for function 'liveupdate_flb_incoming_early'
Message-ID: <202608171952.lUMoZkY8-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Pratyush Yadav <pratyush@kernel.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pratyush-Yadav/kho-drop-restriction-on-maximum-page-order/20260815-221525
head:   2a05e428bcce0e5ebfdb2617adf37760c36639b0
commit: d0e70617c45e88d720e7461e6ea9f2d136a610c4 liveupdate: flb: allow getting FLB data in early boot
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260817/202608171952.lUMoZkY8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171952.lUMoZkY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171952.lUMoZkY8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/kexec_core.c:18:
>> include/linux/liveupdate.h:287:5: warning: no previous prototype for function 'liveupdate_flb_incoming_early' [-Wmissing-prototypes]
     287 | int liveupdate_flb_incoming_early(struct liveupdate_flb *flb, u64 *datap)
         |     ^
   include/linux/liveupdate.h:287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     287 | int liveupdate_flb_incoming_early(struct liveupdate_flb *flb, u64 *datap)
         | ^
         | static 
   1 warning generated.


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
