Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7682EB85B
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 05:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765432122; cv=none; b=jSo2mKVoAwV/b9/n1QmKel6mUlko1edN3VM/7KhifwiSsaTyRcY2CZ10i+sXMsBpHZ5vdg9CFEmJxwkcnqYto0HhE1xWhINuRi5EWqZ964iui7AKVZBWkdlSsPFZPw3RoHLDZE7LjS8e1sV53ARBzzJ2Ztj8AmKw6nEu60NXOqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765432122; c=relaxed/simple;
	bh=MNeDWKJEB0Fu/AOhE/o2nd6GVB8fSn/gR0z+XFROU5M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXZIiAVROvNitg6lwNxZJVF2YxrNM3fOCB95bj+rbVkLi9oSjd/Aow1xEOjbh8FgmTcvVVPLVFMVAeskhe5tRuSdrePvTQdedXqff1mcRF3lXCKYCkPEM7rwjBwOTsYAgBL+72GxmHqwGZFYDWJr+EfLemV8SvqBPIc4qBTKNSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2VWA7oT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2VWA7oT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765432121; x=1796968121;
  h=date:from:to:subject:message-id:mime-version;
  bh=MNeDWKJEB0Fu/AOhE/o2nd6GVB8fSn/gR0z+XFROU5M=;
  b=Y2VWA7oTKHlP1TIpMAgIl4eT4n5ZdpNMuffyZCu4coZYeNtadauA06NZ
   cQiA1f5ixXOUB9Qj9cJHeKqsqrdQSZQc2uyqp9p7VAGuGODQ7dDs+WlXU
   6rVo85VwYMfVbkNkuymH0DZ0YAolsTh6lWiWHtsDiOT8fTsO5caerF8Uh
   xtIcVqXIkbEucbHCOALJ6DUz5LUGqTschkiHy8kLRUxhGNY6+HZz3F4sn
   dT/ey1hyZtOf1SNmdWSocFVPI+NIMbkJCXBdzfox3/GBxpD5EaQRN6r/q
   0pSOP1T6p1gYImA4ZElxnUFYLeGkI4bXYmn1WUzUlbwTDVzABmnA5VJjh
   Q==;
X-CSE-ConnectionGUID: zUiJlYgIT+axHjhIXtbTmg==
X-CSE-MsgGUID: k7kibOuKQrOZI1Ga3FhwrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84817449"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84817449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:48:40 -0800
X-CSE-ConnectionGUID: 5oqiFxESQIuHW3iPSO8IrA==
X-CSE-MsgGUID: 26q+rTWhT0WVETjePsarNQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 21:48:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTZXZ-000000000vc-1crx
	for oe-kbuild@lists.linux.dev;
	Thu, 11 Dec 2025 05:48:37 +0000
Date: Thu, 11 Dec 2025 06:47:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Robert-Richter/cxl-region-Rename-misleading-variable-name-hpa-to-hpa_range/20251210-021858
 13/13] checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'and'
Message-ID: <202512110632.ed2Mg3sq-lkp@intel.com>
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
TO: Robert Richter <rrichter@amd.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Robert-Richter/cxl-region-Rename-misleading-variable-name-hpa-to-hpa_range/20251210-021858
head:   466bc4bad379dad22da63894165056aba2d31b62
commit: 466bc4bad379dad22da63894165056aba2d31b62 [13/13] cxl: Disable HPA/SPA translation handlers for Normalized addressing
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110632.ed2Mg3sq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#25: 
and and return an error instead.

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#63: FILE: drivers/cxl/core/atl.c:78:
+	 * defined. Do not use this approach and and return an error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
