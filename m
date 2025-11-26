Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439962D5A13
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764170062; cv=none; b=Y6WIJ3xb0evVukY8QPqGrLLcXP6S3Ur75K0ArWsiMVNZp3T6f0RLwKb99tpelr4UY1eT3nItR3fx3mK0ErBo+2PFzOF3H8GM444EeWAakNt7FEmkAT98ayEa6boPO59zZxVHIg7ElgiMPgSFUstvbp1144e1jYeRECYebiHHbik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764170062; c=relaxed/simple;
	bh=gw9Thnr5oZwGS4O38iolao24TaWNjVfbpiSDYIexxyc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORnvu7OB79KZAYci+v6TYyHkCTC2VdaYYSRRguOHKuxxzN7+P0UsHGwyMHg6LSfl+zhs9usJnUdsrlsfe5CPqRkwyUuu+wv0oQa5+tiTTM0AQ9hZXe81zBimY/CHvetrv547qgwXcchWLQyCJdJd2nT27Amn7iCrLCZIMabkTew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOZEPAwW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOZEPAwW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764170060; x=1795706060;
  h=date:from:to:subject:message-id:mime-version;
  bh=gw9Thnr5oZwGS4O38iolao24TaWNjVfbpiSDYIexxyc=;
  b=gOZEPAwWBbCOWDbFZx8JEovOh38kOE3wTzMEl2tBxPgguCxa/EBGmsgg
   qtgAtC0flC9A10ni0Jh7dAE0/Mp0VQZmtqXHGsmFJHg/K92HhB2ERkpDK
   gMdCnCSnMRkbMcA7xQ8W+cmqFRLjRupXNVq6WcsSpqW6kAJYVw37B21K0
   9gX0vSify76LJBLVgdzYNI+d5Z1FOdBgpo9jujM5t3RRYUox/btaVmHAi
   SoLSLbI1BvA7PWtYyUQ+O/B2JRO3CJ8NTaGXHLAjDHh3V+46rdp+m+3xQ
   wuTH8DE/iY93KWpR6JWS7iRNbMJ2r0GEKGvvEvuZuJzMX0ftnhM9KRAY3
   Q==;
X-CSE-ConnectionGUID: I6dag3RTSoSs7vLr8sUwdg==
X-CSE-MsgGUID: 6BfBgPZ7TJuSpBAetYYhWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70075120"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="70075120"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:14:19 -0800
X-CSE-ConnectionGUID: cjMTO/M3Qh2TmJE61tYWWQ==
X-CSE-MsgGUID: gZpBcZikT0uN8Rjk1kMTYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="230224899"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2025 07:14:19 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOHDl-000000001GH-0LA4
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 15:14:17 +0000
Date: Wed, 26 Nov 2025 16:14:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 30/82] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'code'
Message-ID: <202511261645.1sUIrQqX-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   246e8545d9b142e404d7cb318505b4a84e8a2364
commit: c2840cbda7b09df74f7f699b03bed354f903df91 [30/82] fuse: make debugging configurable at runtime
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261645.1sUIrQqX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'code'
#28: FILE: fs/fuse/Kconfig:104:
+	  Say N here if you don't want any debugging code code compiled in at

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
