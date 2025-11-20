Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31F234166A
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 13:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646355; cv=none; b=EsReqVPgxu2yFTCQrwCnhyyqVAZyRzoUZAFcrg/NIhtVqa6/EDUSFg8rmXIrf6fPVQur9onNKhTOg/NN0RHo4KZc/LXmz57Zh3C5ECbJrvmcc8GsbQabcmEaCs5B8i2eyCYn0D6kTm9Tmn1jI2meqnXDfQ8wS0SAfyhjMFuAVWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646355; c=relaxed/simple;
	bh=gdGK3mc8YdWEA7mPq9dOru0RrkwHNrrtMlwmlP0do9A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uEVNSjG5tSXtqnOMIrJSETC4e0J+SYkAX8n74NSRYG2kuu1IAQlYiN3EDdeqgBPHsag5Ey6lBv/TBm+xZjdn992u4daU4OqmGXm8cLH+L43x71vQQPnbrESJfJ+74+6z44xDnhQ4x3mrKRLg7vN+KatcH1cKztht8UXytgSUbRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zy011+bt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zy011+bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763646354; x=1795182354;
  h=date:from:to:subject:message-id:mime-version;
  bh=gdGK3mc8YdWEA7mPq9dOru0RrkwHNrrtMlwmlP0do9A=;
  b=Zy011+btNBX6Ec7o8OF+3pP+CcwKBKiWZys966Ji7OQ1IiCLB2zKzBZB
   Usb3Fpu952iEpLzhJCI7R7w1Ki3l2RygnE/abWNoRXhjaHH+2+OW82RkJ
   KORAve1neGRDUaRjYCL0AH67OQPb9XpxNCWnFDd6o9XLlemTmS3kF3eao
   yPjlHiW+a8YPLosYyAKs8qenhX4uhumEeO74PuRCEqNf7rsVUgdM95vv9
   uFNZ0VCNn1W10ug2ocnN5LJDH1UNLB03cjBuPDDyuxH9az+lSr5dTPXUM
   8y4VslWrs1tZmmRLwsYDehdW9n0RYSgFnASQ4zhC/kdQwr1I/VLiqGoDo
   A==;
X-CSE-ConnectionGUID: B4fkVjEIQ4yTYuhyYGUhGQ==
X-CSE-MsgGUID: nyeOiyLpRG6KifsKMX5sXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64907398"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="64907398"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:45:53 -0800
X-CSE-ConnectionGUID: K/ztofxaSp670lS6JCm0tA==
X-CSE-MsgGUID: nKMAK8q2QQSRH41nfskpCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="195512549"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 20 Nov 2025 05:45:53 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM4ys-000000001T6-04BB
	for oe-kbuild@lists.linux.dev;
	Thu, 20 Nov 2025 13:45:50 +0000
Date: Thu, 20 Nov 2025 14:45:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20251115-081723
 5/51] checkpatch: WARNING:BRACES: braces {} are not necessary for any arm of
 this statement
Message-ID: <202511201434.qOsMrPAd-lkp@intel.com>
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
TO: Harry Wentland <harry.wentland@amd.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20251115-081723
head:   621ff29084f2623191e182f9d607500a6e474a35
commit: 5478b56d9db7de8bc3c758937b5dbd18de4baeec [5/51] drm/colorop: Add TYPE property
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511201434.qOsMrPAd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511201434.qOsMrPAd-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#52: FILE: drivers/gpu/drm/drm_atomic_uapi.c:669:
+	if (property == colorop->type_property) {
[...]
+	} else {
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
