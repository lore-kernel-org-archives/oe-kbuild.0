Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FEA341061
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646355; cv=none; b=VXSlYVtlR889uJa34tLYn4RtgREq+36vUs78sH9s3iNflyJgstls2iI54UqN9Jtcfvmyv04h2gKSIAc8YV4AOoVQK9Nhzh/VjYH763pmXGxO5L0H5eDvM1SH2MKHX79neS4N01RbvTvoWuhZyuhNSpOAGUiKxE366nDqfWtm42g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646355; c=relaxed/simple;
	bh=1nCH25RIWeLugpIdAt9kOIfIO4MkB2ReyBYUAQelW8A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nW5fbXDKYfnypzYXAcRrDmdYjSiWgTZAZXoq3Ffs3awEDv6DQpeo8DwMTMrPC7qTwE4wV/FfFdrL6sYXwTstPN22tyjkyzLYLsNe/NwcmYMSposU1cWs8cj+TZtHgNV38SaGUNPACm+gJ6CKmuqqiG5EMZhRWlTmLl932TBal7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CfESFwbD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfESFwbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763646353; x=1795182353;
  h=date:from:to:subject:message-id:mime-version;
  bh=1nCH25RIWeLugpIdAt9kOIfIO4MkB2ReyBYUAQelW8A=;
  b=CfESFwbDqAZLCC0r93Mx2/bD8u1IDSZkTii2RCOr+BIq8m/zIZW0huMu
   Yj1AFxY+glAjufvXz/R9rP1/aFvNAf5O4HuYl92kwxEK4sgcgAhjkv2/y
   mx3uXkMagnvqaxP98ZIuIHI6ylsCG+bEu9WW+RAI/vQJxVGQJ3QXOs48k
   vgey6EoTy5ZLXDn6rrzylbLP+k3UOQd4swQ6rdgQmVOfa7LlFgSb4goUt
   E8lr1Q9wn/qEnGjxsJiR1IMxchZeMnc/Ctm3JqiDahzCjuVFjApNZIhbl
   VUjhFcR3i3BphN85J/NbAw3Y08XemRrDlHr1MKV1mfCiK6iD7lD1qvifT
   g==;
X-CSE-ConnectionGUID: CTtaQ5szRzGONKRZOtiRMA==
X-CSE-MsgGUID: aCQkui9sSUCovBLvRiuQqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65647742"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65647742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:45:52 -0800
X-CSE-ConnectionGUID: SXFDSAinSKSbbyjh8QVENg==
X-CSE-MsgGUID: sLFcj7NHSUa090Q5wIvKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="190650118"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 Nov 2025 05:45:52 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM4yr-000000001T3-46ri
	for oe-kbuild@lists.linux.dev;
	Thu, 20 Nov 2025 13:45:49 +0000
Date: Thu, 20 Nov 2025 14:45:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20251115-081723
 4/51] checkpatch: WARNING:SPACING: space prohibited between function name
 and open parenthesis '('
Message-ID: <202511201425.XDEd3bvM-lkp@intel.com>
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
commit: 36c0d9fd3b894b2cfd2360bb49ecd9d493638bf1 [4/51] drm/colorop: Introduce new drm_colorop mode object
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511201425.XDEd3bvM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511201425.XDEd3bvM-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#526: FILE: include/drm/drm_atomic.h:1064:
+		for_each_if ((__state)->colorops[__i].ptr &&		\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
