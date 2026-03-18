Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2224503F
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 02:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773799386; cv=none; b=K5B5KdM4s6tItjyvVbPxa1IJjBlRuckDvzipIuQ/mFi6auIuzl3S+AkpCacA9EzZPp1HwT+zgrCTDvWdMh/Fr2qDq0rV6fhImhwpPNB7PkUx44bsr0U0Aq0UyaJfoiJzgsoKFMsAOjS6MCV970M0uzIaATMP9M19sGVblZxqbdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773799386; c=relaxed/simple;
	bh=/rZc8xJL1P14xr5/9UkcvIgyGnQu2JGDwQb90H1DnxM=;
	h=Date:From:To:Subject:Message-ID; b=RB5n52EHSNNPzjPSBrBsQksh772+C4ysYZXW25/nyeb/TVL1xBcMu8Bfy1tsTQUKA8rbg064ym/8Yqu3rVX4JbnK/kD0XQIgbrFz4EO/r7FIvhs18mGlGDH88iD3HwsQ+wypvi/IechrvRYcvU3Z9xlIWz/y36QducdDW/ZPrHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSCv6qK8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSCv6qK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773799385; x=1805335385;
  h=date:from:to:subject:message-id;
  bh=/rZc8xJL1P14xr5/9UkcvIgyGnQu2JGDwQb90H1DnxM=;
  b=VSCv6qK8WgRoxltNbMiwiG5I6bwRpxTg9IBPBeA2NNszJa3q3grCHO0r
   7VFcuFirwvgJW4WgzsLE1/D6kQ0MJi9IZIxoElUleB986ArpkoxRbUL01
   YDvE9FRjE55vqGmJ/mZbQKjD62C7pfmfLHbcQmjHVH5qwWbz3FbEXzNBa
   bcJrK0GCLH/yN5mUvIUgi8yZDQhD9N3EObCB0sg+V0A7/+j57wPPn+1Y1
   DGvFTEIs05+Fa7tQfcx9Ira2d4IkO9/ejIEameGNIhAHz+LEKk3Nb14bF
   WMoanZbrMUnuZJRrFRPq/n/tuLuGxJ1hQ/ScijrmdAWpsYnjYbDbcAdsp
   Q==;
X-CSE-ConnectionGUID: BiJAAxyDQu2P+Gs0n4IZvQ==
X-CSE-MsgGUID: uYXpxcFsT1ur7sQdD4oY1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92231430"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92231430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 19:03:04 -0700
X-CSE-ConnectionGUID: kIkqEDRYRmapyZH2nGlB7Q==
X-CSE-MsgGUID: AQdTuUYDS+W5KFaVw01f/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="221680488"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2026 19:03:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2gFR-000000004Yf-1Xkg
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Mar 2026 02:03:01 +0000
Date: Wed, 18 Mar 2026 03:02:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-7.1/block 29/33] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Chaitanya Kulkarni
 <kch@nvidia.com> -ck', should be: 'Chaitanya Kulkarni <kch@nvidia.com> (-ck)'
Message-ID: <202603180349.TYXJ6XUt-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.1/block
head:   3141e0e536b43ab3555737cb2ee6ea1ed0aff69f
commit: e80fd7a08940093aad5ea247a42046b57709a7bd [29/33] block: remove bvec_free
:::::: branch date: 33 minutes ago
:::::: commit date: 35 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260318/202603180349.TYXJ6XUt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Chaitanya Kulkarni <kch@nvidia.com> -ck', should be: 'Chaitanya Kulkarni <kch@nvidia.com> (-ck)'
#9: 
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com> -ck

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
