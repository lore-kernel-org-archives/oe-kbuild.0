Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA4223EA94
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 04:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764219277; cv=none; b=hOmzyUbv0sg0+pIusv2OagcOxHGFOYDnrKUZX0CX7JVYY/xsRa0t4K/gGmyiEc17IEdv8ZkPt738lg5y+Z4GDfpScimuTltGfDkDM8u6JMLtH9NH94k+ZqhUp1UK8MjWa/oJtqvEplO2ZDVsOT1JO5op+udLh1MQhncLmq74CdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764219277; c=relaxed/simple;
	bh=wjznjBBMlJWuxYWy5BpURY/YhgYoMYJMShZjTWj7Me0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oI00PeqM4jjcJUUYJIfShQz2LfoMr7dknasU0uCTPfHiYvxjcC/5uy/MpF/Cso2kBJJ0b6InmqjozacnMdbLgQshAiJDlYyhX2CTbtmk0wHOXV68C/qHYkdLLW7GyGIEVcJ+jV6GxdJPs3rwZ69KmXNvuhfoILN4Gld+4E07Fas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKk/suV6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKk/suV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764219276; x=1795755276;
  h=date:from:to:subject:message-id:mime-version;
  bh=wjznjBBMlJWuxYWy5BpURY/YhgYoMYJMShZjTWj7Me0=;
  b=CKk/suV6YRzU7ryd4iXBX5zAmw+42hlm3j2XPN/iEcCyzk0Z0nRf0wfS
   adF1VxqbbdOeHyCb0eJTv5bsiJ/+VCkX0fSwpnaY039SFQ+l1NH65Ek0w
   LkVjKDZUICCU7YAbw0k2hdfT4AxHhrXm7bYBUr8tUv7D61cnnflzj0If/
   EQwzniEkJ5TIpaJHmD6hDUpMCUIjjnLNAmw8Vf9L64VvAjyxkSzCxHSQh
   IIEcHIF7X6K7SrQ08JgaqaRZoSMmRhjRmmYFEwMqiL7YWrmwne0P/CszX
   80GyHlUuRwBne/jzQX1oF0xJ6erIVB2yeO+vjVcBFSetoGuNafE+FAYS2
   A==;
X-CSE-ConnectionGUID: N+l+u1dQT2m3qNcsuy12Ww==
X-CSE-MsgGUID: wQOjYRPzQoWxrhrL2Qq1KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66221480"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66221480"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 20:54:35 -0800
X-CSE-ConnectionGUID: ZQqwxiYySd6UV4gpKmaDkg==
X-CSE-MsgGUID: UCM6hPohTDqWt10fWgsVIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="224086434"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 20:54:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOU1Y-000000001cT-1hOW
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 04:54:32 +0000
Date: Thu, 27 Nov 2025 05:53:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [nvdimm:libnvdimm-for-next 2/5] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Dave Jiang <dave.jiang@intel.com>> ---',
 should be: 'Dave Jiang <dave.jiang@intel.com> (---)'
Message-ID: <202511270515.0QhG1LKz-lkp@intel.com>
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
TO: Alison Schofield <alison.schofield@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git libnvdimm-for-next
head:   30065e73d7c018cf2e1bec68e2d6ffafc17b3c25
commit: f59b701b4674f7955170b54c4167c5590f4714eb [2/5] tools/testing/nvdimm: Use per-DIMM device handle
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270515.0QhG1LKz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Dave Jiang <dave.jiang@intel.com>> ---', should be: 'Dave Jiang <dave.jiang@intel.com> (---)'
#26: 
Reviewed-by: Dave Jiang <dave.jiang@intel.com>> ---

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
