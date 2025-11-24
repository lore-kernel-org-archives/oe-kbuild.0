Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676F41B4257
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973688; cv=none; b=q0/OSpC/J+wwxjbuJKg36lU2+l/eZDkdjgnsKf6J/FqdVboqDvEM+LECoiM5N3trCwpqKakZmDetEecwe3bUwlqnyNfHDgKX2WY9lOidZ9xCozBODi1+h8lqyGOnx3XYMD+GbA/Fa+XABiwTeppKijvGDl/JhmoGt9j0wG9pGTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973688; c=relaxed/simple;
	bh=kck6kaOSkBq6IFht1po4IT6Nt+16ig59SoWygZExCHY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b66MGbUuxZ3nrnIzGOxto0pb3hUl1WFvL/3I0VWcYkfyWHeFY0ceVovCBCF2rphz8SXpXQDuSr6+hVUsYyZIL/fsgocAkUSDCUo+WTDEC7AHUjg+jsEEzj2aLpwO+tHZlrj8BMR3K3r1HhUBoJO6AC6BhBm8C/nSEozFsBYGr7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXdhRU9q; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXdhRU9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763973686; x=1795509686;
  h=date:from:to:subject:message-id:mime-version;
  bh=kck6kaOSkBq6IFht1po4IT6Nt+16ig59SoWygZExCHY=;
  b=lXdhRU9qRZu4X3E81kkhFsKCzNenyUhfMXv8gOZdm5fa7RwrUrM97ToU
   cLhSA+nLqfDUpszEBf5TfNO4F7+7rnpOHSWnVxA/s3jvy0m57bDDM9Gja
   s3BetYVHXbogd4mlfzAU838Q4cecLSoYzyDmmciCMvPjvyU++Em4EoU4e
   AQnrMGQd8N8Wd2G+kxQZZLM1HPWo5ed6NnKBka6tM1ajN93Mf835Yl1+p
   iMM74QBdzxiMVe0IsQXDZ0wktlBoDj6ODRXS7Y7PFT1Q7OfqcjfvN1z7a
   QVhteABZCZBfVxX2GHcqqkQHNS9D1eFl4UTF532qtNlzGlwVyTiw+M2Qj
   w==;
X-CSE-ConnectionGUID: 5JSorpDPQLmYbcVqOV4ScQ==
X-CSE-MsgGUID: G9qHkuF+SdCGRHWrARseoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65917211"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65917211"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 00:41:25 -0800
X-CSE-ConnectionGUID: JJrXUpJLSGqXuNSPNE36kQ==
X-CSE-MsgGUID: Q1RCwQrDS7OA7ti+OfYj1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="196728016"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2025 00:41:25 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNS8R-000000000BB-0EoE
	for oe-kbuild@lists.linux.dev;
	Mon, 24 Nov 2025 08:41:23 +0000
Date: Mon, 24 Nov 2025 09:40:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [paragon-software-group-ntfs3:devel 2/22] checkpatch: ERROR:SPACING:
 space required before the open brace '{'
Message-ID: <202511240907.pD2OvfpJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

Hi Konstantin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git devel
head:   2469f2e78d074bf2d416ea82c32b154f5632effe
commit: a846cd0d0a05364c6fa5c4988e75d3b639d6dae5 [2/22] fs/ntfs3: Reformat code and update terminology
:::::: branch date: 7 days ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251124/202511240907.pD2OvfpJ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#249: FILE: fs/ntfs3/super.c:607:
+static void ntfs_create_procdir(struct super_block *sb){}

ERROR:SPACING: space required before the open brace '{'
#250: FILE: fs/ntfs3/super.c:608:
+static void ntfs_remove_procdir(struct super_block *sb){}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
