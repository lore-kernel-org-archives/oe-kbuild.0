Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413E2222B7
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 06:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768716690; cv=none; b=FCGqKRMLm/S9+HgdKHtmWSaj3qd3mh5dq2C43XCSJsxzXXSZTLgalRhyIxLaj0D72X1XgyuuPktWQV8xK89tIyjPrPTYwh4TuHb3AD5htqs3dd0rQsyxQZQcYQrGOeMaaxvMHH5oxmqfl1sbwo+B8yF/aQfRGEfjubuFqEkZUdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768716690; c=relaxed/simple;
	bh=fr41mUHajrX9I25HrmLPYXaCZg9RT7zT5DDyezNurqw=;
	h=Date:From:To:Subject:Message-ID; b=WLIhYI6vmqyOoSI1oVk7dJ3UxpefxfBIcNpYpKDhEbtV7loyQtjt1CmBvbYrKLzAVe4d3T3UvXLsQXkStIF8CIKL26sJrl2P1n9pDu1tN1iImApWEO5WaypUiB8CdLSBGqQvrp5Qw+3nWQ5MwUttkIZLFWLcCyP34rLkOarUR/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBgzhppB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBgzhppB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768716690; x=1800252690;
  h=date:from:to:subject:message-id;
  bh=fr41mUHajrX9I25HrmLPYXaCZg9RT7zT5DDyezNurqw=;
  b=NBgzhppBgD/0gFl7/sZPaRx8KpNgqNAI+Z5UlV8sz8niNb+EfIclOIjL
   aHlcV4SSOSC+Re33JDWT83yfk8s2u27nCeKcslzrHKiCJFoGyKKsqaSBg
   gdMQZs7pmGsd0muIFk/taPQ9ZNqeTaSgNUAkCQ1TvXcjQZbVnQJYEIbgV
   Br5AQLo/bHWmgC6rWDealEZZhXTpbG+EmVqT6GdARrm2iQ0RETnw4BJOH
   XgzS0Oy5A4kBYQvQrEu5vLanI9dURa1+0GiiDwiQ0n5d9CtEBlA9G3hXp
   v6TVqfITRgcNlnLHfE5TA9dEJh60qwOFb/uBbBHBrgB6FYjn/YD4JwZG9
   Q==;
X-CSE-ConnectionGUID: X/VjokLFQAO6vlvCO/9Jxw==
X-CSE-MsgGUID: IPWF/s7YTCaa6oO2AZ4Xww==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="81412065"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="81412065"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 22:11:30 -0800
X-CSE-ConnectionGUID: BGjtAKoOQMGUMknyXvp41w==
X-CSE-MsgGUID: RkXZD9tHTJ+0ShGPhMmXQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="206007574"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jan 2026 22:11:28 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhM0U-0000000026X-1Xci
	for oe-kbuild@lists.linux.dev;
	Sun, 18 Jan 2026 06:11:26 +0000
Date: Sun, 18 Jan 2026 07:10:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 145/160] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Karim Yaghmour
 <karim.yaghmour@opersys.com>	[relay]', should be: 'Karim Yaghmour
 <karim.yaghmour@opersys.com> (relay)'
Message-ID: <202601180724.JloC6rnw-lkp@intel.com>
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
TO: Tim Bird <tim.bird@sony.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   a406d78f487503325470f89efd06a85e7def5742
commit: 500963c65e00bee16aa50b92bba5dabdc88764ac [145/160] kernel: add SPDX-License-Identifier lines
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260118/202601180724.JloC6rnw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Karim Yaghmour <karim.yaghmour@opersys.com>	[relay]', should be: 'Karim Yaghmour <karim.yaghmour@opersys.com> (relay)'
#10: 
Acked-by: Karim Yaghmour <karim.yaghmour@opersys.com>	[relay]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
