Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF354652
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 04:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764302753; cv=none; b=bpkt64x8cR10vz2YYqLylADZWkpid/qJrs5Oahe2R4BfEwTecdgTdtzfYBRIJ9mEJz1U1j6AehDixm8nIp0DCRPzafRrdCeHA37aFDZtxvy/4Zm/gl1QJDonb2LXCgVZAOm9JYEDb358nKPVZFBAX5ABpgqMHmvTkaYfxwdQJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764302753; c=relaxed/simple;
	bh=5aVGUez7ULGtlaozqIuc31MDZIm06RvKGjv8EYcFjEk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJaPwk8CVFPdIt8KNjhXoruuL9Ryl8/XhduX90EiN0nZtT7RzqBb4+CPmkXfJ5BYFrlS0uHGAQSmvqpIFmngOrO5nLr1ZUqiXCvd/ne2GU6bjXBFDCltxGXE7IbFd0TZ7Ss5F2LScpHCOh3vB7RNXsbbn4mwH13+cbrPJBZ4Rlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m36hrpKE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m36hrpKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764302751; x=1795838751;
  h=date:from:to:subject:message-id:mime-version;
  bh=5aVGUez7ULGtlaozqIuc31MDZIm06RvKGjv8EYcFjEk=;
  b=m36hrpKE5eImiJTzQaCkDTUsHfjYzZUNL/mtZF9P05nIC4sTiK4PkL6z
   liKoWpzkqZkI1dQGxOhSR/PrD5PvqXrosCHfq/CAYmxI3Qj6VUhcRcBJU
   PM9QZB0YrWgCKAscA8Hg9ynpM0aMenZF8tmW2oBEw6+kXpJ6LyRz3JNXh
   PmdFnLIQU8UodEiUtw8KLatLbdwRJrS2fUWIL0mBGvnXGtMDXDylO1AnK
   wbGBJseGoZ9n+N325lCjZUKF+0EpksmcsJotJ7FYE136RTU4WdyPJS/3q
   Jcx5Ntw+5lj4Fiab94PizpTxzIeciyCdApAkDSIbtgIZjDqW986btWCJ8
   A==;
X-CSE-ConnectionGUID: 0Yfa1gOMTOCQHHuYLyydBg==
X-CSE-MsgGUID: K0/0VFGWRZW4m4wAFqnC1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66503179"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66503179"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 20:05:51 -0800
X-CSE-ConnectionGUID: 5P/mTnGkQIGQZ6UvCb+VqA==
X-CSE-MsgGUID: z3jt4jPrSg++4JGRR9MiHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192496278"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Nov 2025 20:05:50 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOpjw-000000001ws-1Y9C
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 04:05:48 +0000
Date: Fri, 28 Nov 2025 05:05:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [xfs-linux:xfs-6.19-merge 11/50] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'in'
Message-ID: <202511280505.XFUj55KH-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git xfs-6.19-merge
head:   69ceb8a2d6665625d816fcf8ccd01965cddb233e
commit: 83bac569c762651ac6dff9a86f54ecc13d911f7d [11/50] xfs: prevent gc from picking the same zone twice
:::::: branch date: 13 hours ago
:::::: commit date: 4 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511280505.XFUj55KH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'in'
#7: 
which can lead to us moving the same data twice resulting in in write

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
