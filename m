Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B726056D
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 22:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765317615; cv=none; b=RsRgePy+zEkY3TG4BEc0lPo8jLpjp/KlPyE0ehtfyRMiE3gxT7X2kwk0i2BlZI3LR3zmby4V50wQQTUrNzPDxOtQ9B83VgrI7qfpO86XVpMOlgCPpk3EmS06I05Vnz8YCTpy4gPhRsRuTm2OnnYVRMDaB3DgqR3IIHTpcYmYIfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765317615; c=relaxed/simple;
	bh=drV1wvuWT63ErBCD1BJsodmBwkIWXdtMVRgjvTWsw3o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IDFeXyVEJpk2ikfC3iXCJ9q1vQlrqKhnAS9jufqyGwpkXPjT1EtUKFRHQRvdI/JTyvjBDZkaHZH5bO6MgshfNMtuXjL80XRY6xruaiXhFIoRxrxCOIWu3d7Fvo97/5J1aBWqHD8BGwsDeh2P1yGpf4mpXfCg6hZfOS+ij/8mfLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TX7NjKlO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TX7NjKlO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765317614; x=1796853614;
  h=date:from:to:subject:message-id:mime-version;
  bh=drV1wvuWT63ErBCD1BJsodmBwkIWXdtMVRgjvTWsw3o=;
  b=TX7NjKlOzzKKWFrFzlqmOBt2bTZIPnQj+CryWX22XIOvdj37dU4f76vS
   Zhv/cA50TFp5LReNFbNio86RjmyLXIeFM7X8U9m9QpLrMuX3//oq3bhKC
   AWXdJVjGYjvLfe786p/49lr17JvSm5WbzX1IKueVoen0jcDGAyjT2kM5g
   UrfqqSC7l5s2An1CAi1y2v85UbdKm0D3LnBTg5Y8eYmm+AsOHhhk6Ecbg
   JaVfUnSJlRvXdJ3/35x7qzQvtRWSl7wJXXj9hUHlJiD1rAaTNw++HR2pr
   yI7p3AIEkqKEyoL7YwYdQkAd8C8TdbcLLbCs3IQoUXR5JoFSin+YMP5nc
   A==;
X-CSE-ConnectionGUID: njm8BWMNSs+uPl+1wLzt3A==
X-CSE-MsgGUID: XXnEgTVHTyqIjB3nu9S6VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67010132"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67010132"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:00:14 -0800
X-CSE-ConnectionGUID: 6J6s9IK2T1WpthHMKpNd3A==
X-CSE-MsgGUID: xzZ0+PX1QImgVgShYh0guA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196090238"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 09 Dec 2025 14:00:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT5kg-000000000Nl-0bK9
	for oe-kbuild@lists.linux.dev;
	Tue, 09 Dec 2025 22:00:10 +0000
Date: Tue, 9 Dec 2025 22:59:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jirislaby:devel 7/31] checkpatch: WARNING:BAD_SIGN_OFF: Unexpected
 content after email: 'Nick Kossifidis <mickflemm@gmail.com>,', should be:
 'Nick Kossifidis <mickflemm@gmail.com>'
Message-ID: <202512092217.BwclYZKJ-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   aaa90151bf411e640973aee67d80cf7c4c5e41ff
commit: 83620a4bae6e766be4d0b9197fc584ead45e7733 [7/31] wifi: ath5k: do not access array OOB
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092217.BwclYZKJ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Nick Kossifidis <mickflemm@gmail.com>,', should be: 'Nick Kossifidis <mickflemm@gmail.com>'
#43: 
Cc: Nick Kossifidis <mickflemm@gmail.com>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
