Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26972622
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 13:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597569; cv=none; b=gXQEP314w9hSHONAtxfhee3CWlZcN9x6SyeXd3SDL4HUNfG6HxFWrTimpbduqO3VYco1m+n1EzkFJ7rCagAkhyyv6fNW1mNLqsfIsPj0BmF+jJzJC1wrmCpSQh6+SmJMK7Q0SAbbnxpIKZUtCJ/fPalBTSmmmHOgvE8qgJi3beo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597569; c=relaxed/simple;
	bh=2a8j4saRJpQzVrvU85VBSd9U7rwKRDq4mCPkX8pdsao=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iU/O6WydmwFhQ4h5lBdlb62jBR5LJ2i9xcPNbdDKLseo8eGzRhTDrs9wTfOwr6aIpPKJ+UGgYAoip/A0K1BFQsJ4op4qRsHNMHsIErM182YhrUlOHyRyYnoaqxucje8sWnrUAFCTTeTnt0939ek3g5WMCRs3CoPIwRnkLyyFcIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDyyhh9B; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDyyhh9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764597567; x=1796133567;
  h=date:from:to:subject:message-id:mime-version;
  bh=2a8j4saRJpQzVrvU85VBSd9U7rwKRDq4mCPkX8pdsao=;
  b=eDyyhh9BqxbvfO10HxOphttrCSHprGoDLiN8yg+LABn6US2TqiayNTQx
   M4e+Q1nuyXIZf7a4tquc536xk2PaPMPbzEFTzgHUCJg4meBDiNENDSSEs
   3tLJblG2OEXpyT8eYTnDCUbbB5W0JMsAF2HNbEucohi7s/wohYmmTbeSc
   bUDdBGx7g05mEK6hSuh1CcmjMbmVr0gsBss91uPjCIZaLzdQk1+ugqmmT
   J0SG1DGV53+/yWhn5CqiV3z8kLjR7lBHTue/OpknNcKGTqksusiil8nky
   5YEZt9ho3eeMa9aRMEkRclMO+nlyb4A/rlAmiLobRJiIrFgcFL1TX3Ft6
   Q==;
X-CSE-ConnectionGUID: YTkQkBuuT0qazb3+jfV0DA==
X-CSE-MsgGUID: jsduix9yTTaBKB6HMMAb+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89185733"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="89185733"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 05:59:26 -0800
X-CSE-ConnectionGUID: IYYVW3y1TpuMIBfnL2J2dQ==
X-CSE-MsgGUID: b3ZS4q1sRPqUpsXKHM9oxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="225062173"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Dec 2025 05:59:25 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ4R1-000000002gn-2ihI
	for oe-kbuild@lists.linux.dev;
	Mon, 01 Dec 2025 13:59:23 +0000
Date: Mon, 1 Dec 2025 14:58:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 38/70] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
Message-ID: <202512011406.LcHjCdy2-lkp@intel.com>
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
TO: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Hi Shyam,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   c36f9d7b2869a003a2f7d6ff2c6bac9e62fd7d68
commit: bc3c0a3231b78589896f283d971a003761b100e5 [38/70] platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
:::::: branch date: 4 hours ago
:::::: commit date: 10 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251201/202512011406.LcHjCdy2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#18: 
Reviewed-by:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
