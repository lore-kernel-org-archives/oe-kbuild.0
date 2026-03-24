Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4D274B4D
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 05:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331659; cv=none; b=P2AGbtwHH2YIOEqQ4ddm5NTziaX5/ceLE3o7sVTYaUXJac9aH1qyF1qR+PaUDDjbdgwlg+fHM5/Cdnl0z45s7pVqPPBL/6DekO4AJh4uHZM3mK6L303l0bk2r0Z6K/27mvtLDBZwItLJCyEpjyzF22fVJlKD8Xn6AjEkWMHoWkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331659; c=relaxed/simple;
	bh=q+p54jk2szRQfau0D4BSN0xsyVgeavBsrg7PvzY3AzI=;
	h=Date:From:To:Subject:Message-ID; b=XW9A74lxXMWy0mwp/Fy8IkQsp/+eGFesHGa6H/0KGqYXSr9pSnrSbPpbhkxdL9x5bVWWOcrxaiV+iSodxcCZFKW/rkYYRpjQUpuibLVK40zg4qm/y3FCdUTMdya+zLlHYSViNlJgjugqA5xi2EHbfFikbDg4eDceyLkyrN6FM2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGgEECyd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGgEECyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774331657; x=1805867657;
  h=date:from:to:subject:message-id;
  bh=q+p54jk2szRQfau0D4BSN0xsyVgeavBsrg7PvzY3AzI=;
  b=GGgEECydjEvyDtJw5vuhSQEb4ALIwhzvjYOmPCGUTKRdlSOuOgB1ebNj
   prE7xD90GkHllfnmm8j33NAYIMPAEwfNeEZHhr92nkxr3VghYNKtXiJ5Q
   qEpTddPv0IZl/wVQoFKll3aqpNXeL8zo2ADfpFdMwOGZh3mDfq1dL5Mnl
   BdFf043uvVj62rw8vGmNjUCvUvgtAZiqTJCvjLWrRe7S+Yr+/YeKqxY/5
   8E0BzZ466liH4Igfz2A+3+17XU5AqwZZJCYfIjX6LJIVRhESsSFE5JycA
   zGepsA7A7bfAELTYqgXVGRh23vcwgXpZHLx9c0NDgTH7DW+JDUkD3C8nn
   Q==;
X-CSE-ConnectionGUID: 7tWpN1NbRIaZwjcMWoBMKQ==
X-CSE-MsgGUID: Ee+n6HH2R2OCb3hrOoJeJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85649399"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="85649399"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:54:17 -0700
X-CSE-ConnectionGUID: UY05KgQkT9CExpueX3OmYw==
X-CSE-MsgGUID: UUAiT4dTTLiTym+C1yZlgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247327355"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2026 22:54:16 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4uiU-000000006ph-1pri
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Mar 2026 05:54:14 +0000
Date: Tue, 24 Mar 2026 06:53:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next 21/80] checkpatch: WARNING:SPACING: space
 prohibited before semicolon
Message-ID: <202603240609.zzC9k5GH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ivan Lipski <ivan.lipski@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   470891606c5a97b1d0d937e0aa67a3bed9fcb056
commit: 058cb97b730f2b47f168d843cd82832bca6babf1 [21/80] drm/amd/display: Move DPM clk read to clk_mgr_construct in DCN42
:::::: branch date: 11 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260324/202603240609.zzC9k5GH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited before semicolon
#275: FILE: drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_clk_mgr.c:1059:
+				clk_mgr_base->bw_params->clk_table.entries[dpm_clks->NumMemPstatesEnabled - 1 - i].wck_ratio = dcn42_convert_wck_ratio(dpm_clks->MemPstateTable[i].WckRatio)	;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
