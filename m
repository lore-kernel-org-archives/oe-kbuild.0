Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5177E22D785
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 05:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765429725; cv=none; b=eL8gO643HUy3PSQp5fJyMz4x5NFz/BC/9OD34vv9MN8qcF5NbQ0/hgIsWsh/fZJutaXSdK+qBuvZMgUXD6xHNt8TwC1xuwlPqzOQlrQ9nmWjzVNB8i2dG/gLmVhTj3g5QQEmNSxsd4G36+BaukQy/R6SfPGbOtydmiizHbPA+/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765429725; c=relaxed/simple;
	bh=cRG15jV+1z5NHwcD7cyhuKyqH78B4lsN1EZ1B1uxq5o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPGK0/l8MBdyPTVlhAJq2AeWlns6d11W8Aa0m9uezSFlwsMCkiE993UQBmNt+v4EOad3MeHDB9j8MPOlM6o2iG1512I1ZAEOIRkuM9+BjMptJec2MqTwXOyO8oAZ9jZPTAJ50qU4t7Cl23cvtQRgA3Jqmg8FWLfRYYHAUsWYeZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQnxaSIZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQnxaSIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765429720; x=1796965720;
  h=date:from:to:subject:message-id:mime-version;
  bh=cRG15jV+1z5NHwcD7cyhuKyqH78B4lsN1EZ1B1uxq5o=;
  b=DQnxaSIZmWweOm/BbxA5fOpoTq3Ca3TmH9+CURSI/XAKD5mU17MhJdDz
   XrQ8wIq5ITKTObjB1ATSsFNb1uSwwoCJot0H6E4bMPtVOM4kTH8sHGmzU
   QELWCZeXvBjlwdZdw8GAWXCVSGK3OGEkHVhf+YL4HO/Vk7J4Is9QxE8Y7
   20ZZcSrmnNexLhlEhFnUDn71R9i8Shg4rv7DhM3qd8ML1SiU4nkgXuCkr
   TRdo11N6qwIbNiJ6p3ELdWfvZxH3eNhFT55f5N/ePPgBHHmzf6J0j721i
   oCyfvYkowrTU5VtgQlHQtceMIk7cB5raniVzhTsOHjbvzrnPqO6a/9ytz
   w==;
X-CSE-ConnectionGUID: zmLbGMigS7mokH+2xbYdWg==
X-CSE-MsgGUID: Tpssgyu0QbGBq1Kw+afm+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67367362"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67367362"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:08:40 -0800
X-CSE-ConnectionGUID: XxrJf36WQ4CnN13944fbAw==
X-CSE-MsgGUID: /Hfq/AkNS8m5suWHfaEH6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="227360029"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2025 21:08:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYur-000000000vI-0SEx
	for oe-kbuild@lists.linux.dev;
	Thu, 11 Dec 2025 05:08:37 +0000
Date: Thu, 11 Dec 2025 06:07:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/vtcr 4/7] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202512110619.D6YeYONk-lkp@intel.com>
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
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/vtcr
head:   6d4b6d582293f56af781e41f0aabade0abf1b69d
commit: 6750b5a48a426d79b6619c99fd88e280bef7b4ed [4/7] arm64: Convert VTCR_EL2 to sysreg infratructure
:::::: branch date: 16 hours ago
:::::: commit date: 17 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110619.D6YeYONk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#11: 
Replace the ad-hoc definitions with the the generated version.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
