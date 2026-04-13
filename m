Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F1288AD
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 00:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776040899; cv=none; b=joD73NHc8mdU3oPxZFM/ae1Jhrzpv////NDg5tkYArjTCVjRxitZKSon3ZJ0jG70m1V0vR0o0KtkwGAl2iB4hBgSYqEDnZLWr/ap+GiRqo4dJntr3flJhXx9j2jU0+cGBzCUJBPgEYiK7nrW+NuBEd1v9YR7v5kP+UfOSvl0+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776040899; c=relaxed/simple;
	bh=Ee4s0jIve18l6/Nqf/d0K9j8O/3l/8XyNbBDTpfISwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cTBpZCBVs1WYRuG5bzNBPLXhlle5dCMOb4b/bIlgu9hE2sNT997q+JAWolZ1UtgokPGzE8FfipDWGFhCwZTleyLMYjowfeVxqSa74lVMDnXLd6lp95/USmj4fgCiihUriwK+flh/BwM7kT6mJ6Nf1AKXhp4JWx0FZ2XyN9D495w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLHUiQtT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLHUiQtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776040897; x=1807576897;
  h=date:from:to:cc:subject:message-id;
  bh=Ee4s0jIve18l6/Nqf/d0K9j8O/3l/8XyNbBDTpfISwY=;
  b=dLHUiQtTGg9OR1lEPetu+OO0l1v8amo3EFwl2xKqEg1LI+VeywEUXRdP
   Yb2yP1bJ6Ep8W6fnAbtOr12uw2YZqAEsCH4kS84WsPSbN6Bd1dbGb/jTJ
   vwFw4i5bb1+lBfweat7FKB7TNT6psF1Fduq+gwFASsaXzixIZg+m+nx0S
   CvJApRInkn0fyC3IEKmdAW5swmuzUQMZ/C4GvcuZOGIXQclCnmK7e5xkY
   XOhK6ABjA2YQDnGGg3DYgU8N42anSU51deyTT7UGA6o0ocqO43l6KGQek
   49+okqzBM1PXiuSUueSeFbYnkErgSuG8sRYfNesUOCJDZMwudZIExAwKa
   A==;
X-CSE-ConnectionGUID: 8yhwyepBS/qXfMkcJvY9Hg==
X-CSE-MsgGUID: 9phw/2mTTF2UPx1skBr4hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="64501847"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="64501847"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 17:41:37 -0700
X-CSE-ConnectionGUID: I7wMD5SFSdiq1Fm85uNFuw==
X-CSE-MsgGUID: 6UCafJleTEiSvwqd2UD/nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="252824288"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 Apr 2026 17:41:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wC5Ms-00000000BO9-18tY;
	Mon, 13 Apr 2026 00:41:34 +0000
Date: Mon, 13 Apr 2026 02:41:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: "mipi_dsi_driver_register_full"
 [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
Message-ID: <202604130226.0edM0POE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Val Packett <val@packett.cool>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Val-Packett/drm-Introduce-drm_panel_prepare_for_mode-callback/20260412-203219
head:   a210eaa6cf90ed0bb6afe19395c080e50a1f71a7
commit: a210eaa6cf90ed0bb6afe19395c080e50a1f71a7 drm/panel: Add driver for Novatek NT37701 based OLED panels
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260413/202604130226.0edM0POE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130226.0edM0POE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604130226.0edM0POE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mipi_dsi_driver_register_full" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
ERROR: modpost: "drm_panel_remove" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "mipi_dsi_driver_unregister" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
