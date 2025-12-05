Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE84325724
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 18:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958736; cv=none; b=L/vD2dKaKE0lc1bYG8ZbI3zYbOqIp5mu0HX2W3DsQp2po6zWgNybJHr/hX5Tq85CBNkRz0OayyMNn6KZth5pky/jiq3/d9wK/HgWRxY0M+ke4hOFM5AXTIGnqTp2SrfbwVayopoKRnG9+XFdpScTWMGhhOnnB1uk7FheGQw2BJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958736; c=relaxed/simple;
	bh=2eUElSp6nybuCOH4T33pMcifrLGPYJvO/Ht2XEf/DJY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d8suSv0d4q+n4Pkf/+vIhE4y0fJRsgLKCHBUYxFY93utURCDvpWF5ODuw7ll2TChsnQUqlsk2Ue+XGRFbmzE8B8ua0PLQFZXcvblTAvIKCr/wHXLyzi31u2upzcxqk5lIwkZYmQlX8f9mpQjD0TggK+OMzr2yetg3J9kChBcr+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdVy5Vg9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdVy5Vg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764958735; x=1796494735;
  h=date:from:to:subject:message-id:mime-version;
  bh=2eUElSp6nybuCOH4T33pMcifrLGPYJvO/Ht2XEf/DJY=;
  b=RdVy5Vg9TDSh+3KFrxE+GDYBj+wwtHLP8OJCBmLW0hNa5PSfYL5W4L42
   nzB0OufgnDoVLIuJ7pFZV3QRXVCt4fvsmHE4nbWrs5686wngt7d+O5mLj
   uJZJVxq5If3tr3Q9ZczLH/Ge1UNWc5KDajDbGG73v15MXV2Z4jbqpeptZ
   2EwUE+DKPc2p7cDBAPgtiqcpN/oz6i2M6xIJKfm2WxDAxTnVJJyondxNs
   Y6kxcdBOYJVOXfHUgdbZcp2AYjJk8yHIyHAMQ4qC//bZJnfRwFa5KRrkZ
   4G548Pn7gYSI99EpWtzUS8kVA2U2rfWuxsQE1FfyBhWPAXrv4EwjO4JqN
   g==;
X-CSE-ConnectionGUID: Ixi+bRL/SamAHL5ROEEP1A==
X-CSE-MsgGUID: vd6+9hciRsOOUjfT+8qwGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66957437"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="66957437"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 10:18:55 -0800
X-CSE-ConnectionGUID: 8MLUzsK6TmuLZBQFXJpAkg==
X-CSE-MsgGUID: IKaqJoFuSwGOR/SeCR9W8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="195802346"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Dec 2025 10:18:53 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRaOJ-000000000xt-2fR9
	for oe-kbuild@lists.linux.dev;
	Fri, 05 Dec 2025 18:18:51 +0000
Date: Fri, 5 Dec 2025 19:18:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sean-jc:x86/mediated_pmu 10/45] checkpatch: WARNING:BAD_SIGN_OFF:
 Co-developed-by: should not be used to attribute nominal patch author 'Sean
 Christopherson <seanjc@google.com>'
Message-ID: <202512051942.zrfY79S1-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux x86/mediated_pmu
head:   fa9dadacc710a06aad337013a55d5fba6438b2e6
commit: dbe259220b6864689b4e9c59a4fa69fd75ab7968 [10/45] perf/x86/core: Add APIs to switch to/from mediated PMI vector (for KVM)
:::::: branch date: 70 minutes ago
:::::: commit date: 71 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251205/202512051942.zrfY79S1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Sean Christopherson <seanjc@google.com>'
#20: 
Co-developed-by: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
