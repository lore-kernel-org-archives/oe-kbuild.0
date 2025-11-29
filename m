Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A0F3115B5
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764439214; cv=none; b=oV1VCRA1ofdnpRKuDHAksOTmgQCBoL/zNP+HW/rFAinlm9zaheRRzxox7ZEMwmjopRacapRtD3m1OGvmuoKBU2LykfOUVBkuqtPi9FpVmgsCd7jXJtn9/DpSWvtTNaB+eOzwESgjiujC8q7twNPJqu27McwXzLYNshIoLu+srtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764439214; c=relaxed/simple;
	bh=n4jfTr9ULruX8Jvn+RcW0cyLIX1R6+U1hV+6U5gvCH8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h2ZKWC+jx1ZAULICwjzOP98RthR7RcejEM3z2sZw7beh5sJ0wYTf8aTQhkrBTdwANID1L9hEEh5OqBFovgyrFl6ZRxmzXJ5RNIwtm7yjHKmM7IsdIaXU0KmyHuNuXL0KGE0p+Jf6mhx/YpBhRppBymT9ZfpukjySnoxToNeF0NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luCMeOPl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luCMeOPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764439212; x=1795975212;
  h=date:from:to:subject:message-id:mime-version;
  bh=n4jfTr9ULruX8Jvn+RcW0cyLIX1R6+U1hV+6U5gvCH8=;
  b=luCMeOPlr50aKA1fUKuAc+KGhG+OPQ17arYGX6VMrnyFwyLu9AkjrAYq
   xNS2zssJuHw64m/ErdKOQA2cf65uRmrWlK2w85WISwu387U4RLJmOc5D3
   zDb2jx3gHXQsNhZQuyR4hid0GN+H4mfkaWfRomvC9zLpSMA66CgHN4QN2
   tF4ofgk+Xk4srEWGp4v/8jpbXx34f9/y+9v1ecUfkjCjRh+I4htEDHs7w
   9unUpTKaltr4vWTc1DjIxvfFOfyDspmiZ2VCEeMD4U7nw7I4kHrOKTdRF
   EP4CR0bF+S5PiXs0J3lJvdU2zpYKA+zNNVBRqDDIxdR8M8kKb4FhOZ4hJ
   w==;
X-CSE-ConnectionGUID: 97rQ3dssScS4mYf1zBLxvw==
X-CSE-MsgGUID: 44kK+OaxRNOuYk7py2MYHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66318287"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="66318287"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 10:00:11 -0800
X-CSE-ConnectionGUID: aarlcREOQn6LU7yBck/dXw==
X-CSE-MsgGUID: t+ELYquVSbmPhrO8vxmR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="198024346"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Nov 2025 10:00:10 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPPEu-000000002Mt-18ls
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 18:00:08 +0000
Date: Sat, 29 Nov 2025 18:59:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/vtcr 3/5] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202511291816.YNmoABLz-lkp@intel.com>
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
head:   d2a0e25a54756a2203354fe6dab273ad9c37e52f
commit: ca80d3177485936fb58b250ea2b589161a286096 [3/5] arm64: Convert VTCR_EL2 to sysreg infratructure
:::::: branch date: 5 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511291816.YNmoABLz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#11: 
Replace the ad-hoc definitions with the the generated version.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
