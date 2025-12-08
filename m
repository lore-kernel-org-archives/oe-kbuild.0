Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7499321FF23
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Dec 2025 11:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765193567; cv=none; b=EOS/09OR5feVBezNRUNhmhnLMssQPBypfZ7IGC6K1N34A5es6rcz1y+AVr2cHBQT5vveCPejGTjUwK7drl45xgv0WXWB2TuZ6vIF5IAXbWmxRCtbb7bFmZJ3Eti/aiVH4HJrtLln4BQI2r8ws9OpGWillVfRfZHVcE2mAVwVYvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765193567; c=relaxed/simple;
	bh=I6Hn4FgAHzl6SUKBLFn5OeHR0ItlQrdYVaM9FEu4U7I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TVqP2kYrtRbvQS+yVqDc6FGhQYroGMxngGHLNqzJGwVnJbjBkCNMA9yPSkmw2kE7dbqcT+wKZYGjsOe0H6QOsA9FM4fJmIxiwtXHDpAiiLv9BCRgok9YPPQ1my9TOYsGqfJyadtpU2toQ4HgXH+u3/8iU0BNf/G0e+QOolQtLvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihpnKijI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihpnKijI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765193566; x=1796729566;
  h=date:from:to:subject:message-id:mime-version;
  bh=I6Hn4FgAHzl6SUKBLFn5OeHR0ItlQrdYVaM9FEu4U7I=;
  b=ihpnKijI2x9PmR4bwA1bMO06YSPPAnmyd8If37RdfuKDkU67FkchZrqZ
   1skvIi1LAw6RksQDUDFXRmBh4pu6FWFmqdGvfIC+re4ttUAu/dPpAwWxI
   Kl87g/gYaecLhA8pAnDykxrNes/B/uP2L/cw4ZHeZvlcb0ZY+UvJtOPpM
   0hMMLyCnP+t9YkNJ247ZIunnS+lfmK1fXVcRZ+diw0VcXnOe0HkeWe47C
   Kyp63+NDYKNRA5cwQXefzEgqGsW+HFcSKkzcI5HMIHz13IMtPt9fbgIaS
   1nP/7VUdSrg1pqv8YEyqZRVPnliNybETgR/mInE+acpoZWsCsehIWv/MQ
   g==;
X-CSE-ConnectionGUID: 2wMElwaBSSWlK9BTxb+8rg==
X-CSE-MsgGUID: 5BsU8mJYRlSxrIfVQbBdsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="78249645"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="78249645"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 03:32:46 -0800
X-CSE-ConnectionGUID: De7HwxipTQOvP4gq674yWQ==
X-CSE-MsgGUID: 6/iG98iCTCmYsyAWacNk0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200084177"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2025 03:32:44 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSZTu-00000000051-1Frh
	for oe-kbuild@lists.linux.dev;
	Mon, 08 Dec 2025 11:32:42 +0000
Date: Mon, 8 Dec 2025 12:32:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [steev:lenovo-t14s-linux-6.18.y 131/135] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'for'
Message-ID: <202512081252.Z0P0Or4s-lkp@intel.com>
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
TO: Steev Klimaszewski <steev@kali.org>

tree:   https://github.com/steev/linux lenovo-t14s-linux-6.18.y
head:   9066f7e809e610c4f3e79f481616ad27981ae2be
commit: 1e46e2a34249c3b6ecbfdf44527115d61b3046de [131/135] drm/msm: adreno: attach the GMU device to a driver
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251208/202512081252.Z0P0Or4s-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'for'
#285: FILE: drivers/gpu/drm/msm/adreno/a6xx_gmu.c:2024:
+		/* Allocate memory for for the HFI queues */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
