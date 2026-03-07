Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75F8450F2
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 05:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772862428; cv=none; b=aG4kzoA31kU+tdi0b/Bj9zL1FeO2oE33bCEuLssTucG7cilfkaJwNPMfrkHhQvkd0R4o8nzlTNaIsskbaiEm4n26YDUwYUU7BmOJue1VEhG171sMI5p4WRXAeYQeN2WVEClGO4cwkpb7607eJMCLv2KRkvZM7i0BekTfmHrEKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772862428; c=relaxed/simple;
	bh=QcNtpOdPPLQfTd59vM8z6rCaViAHKPjHW1r3sWEFmBc=;
	h=Date:From:To:Subject:Message-ID; b=l8DuXCXsVvbHeuw9+72gnnJ5O7Nlk1bXzXWVQWIgI4vZw3PtXkuCDGfpdevZwxKUUTJL6FHZTb0wbbO5o8v1UrXV08+r5cdJQ6uM2vmShasJpwzgUAR3X/HhnqIXz2jaPXVTpk9S8Q3CspUAp+GMoZzK9nD7/sRNkpTWEKIyRqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfxKbygF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfxKbygF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772862427; x=1804398427;
  h=date:from:to:subject:message-id;
  bh=QcNtpOdPPLQfTd59vM8z6rCaViAHKPjHW1r3sWEFmBc=;
  b=XfxKbygFwK7QxgxU6Ud7wmpnbq+rZ+id7JMs55gO9vPuJ4KUMgfx6hX6
   BF32VZWu1IK3gje1ELkWGRUav8Tads7WG/VpkoX6u7DjcpnCFcH15zYX5
   fVrbrigHdb7GltZ3TTy89O5l/tYm9Xa4a1QoBTlHKAWRWratENC9qwIXR
   1KOmHiQaMQV6tD+u5EqmIng5C6WEesTDRRHqRGtr+iYsgVhkcfA6eG7rS
   ZHW7ovDEtY7g6G93n1/4nC8lhDk5aadzPyB+o1dewUSM3i4KIRfwjFein
   ywJ60d8PndudpNnDCWV6pgQToVEMwBkzeh+dMAk7438rKK2GEs2xemOpc
   Q==;
X-CSE-ConnectionGUID: e4D4t2O2RIShXzH/ExQjDg==
X-CSE-MsgGUID: IdEwcgnOSMOwDE+gYAt7Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74159545"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="74159545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 21:47:06 -0800
X-CSE-ConnectionGUID: B0xxx9gzT8W6N08LwBXUYw==
X-CSE-MsgGUID: lSs34NDrRaKmYFj+VEMjlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="218433618"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2026 21:47:05 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vykVD-000000002QL-2fUa
	for oe-kbuild@lists.linux.dev;
	Sat, 07 Mar 2026 05:47:03 +0000
Date: Sat, 07 Mar 2026 06:46:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next 48/180] checkpatch: WARNING:SPACING: space
 prohibited before semicolon
Message-ID: <202603070648.dKB8wjyx-lkp@intel.com>
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
TO: Roman Li <Roman.Li@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   eb2e7f20c1473f9153088d564471dc0226530824
commit: bd096a56da7cad1c93c0138a64478b43f5a94736 [48/180] drm/amd/display: Add dcn42 DC resources
:::::: branch date: 8 hours ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260307/202603070648.dKB8wjyx-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited before semicolon
#820: FILE: drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_clk_mgr.c:707:
+				clk_mgr_base->bw_params->clk_table.entries[dpm_clks->NumMemPstatesEnabled - 1 - i].wck_ratio = dcn42_convert_wck_ratio(dpm_clks->MemPstateTable[i].WckRatio)	;

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1410: FILE: drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.c:54:
+/** @defgroup ResponseCodes PMFW Response Codes
+*  @{

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1422: FILE: drivers/gpu/drm/amd/display/dc/clk_mgr/dcn42/dcn42_smu.c:66:
+/** @defgroup definitions Message definitions
+*  @{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
