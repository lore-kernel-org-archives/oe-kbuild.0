Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF03DA7C4
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309959; cv=none; b=kFkRfv/wJ8Iqpkd++dLcp1a420oMXbzembow+ttTOqFCUZHbJQxMb19xxRCNLsH1YePLbme6lfZoSzSvlwbUGP/p253/7cFTI90YTCaDJaQRKs5y+t0Xn6++Z7p+Hen6XlL0yVoOR2UQqwYUXduHXRknlcghhTFErG/lZaRDWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309959; c=relaxed/simple;
	bh=eJoJzxzc5/iZvXMddP6b1lUmhMUrWgg8ZxAuZ/crnbs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G8MRDPSU9sSRkeHzanGTXgxXg3oxDidw7kOrVF2u7VoHMExIr9RbX2f8/74mySXIa7Dhy8S/2DZHujrPYPmWxRv0BIHfRq420YVWr+h2YXK6li8/9ieim7+dT388d2IKekyvKGgIGE50jTYYuWxhsx4r2dGt2XzP3VDUg0eNYu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTY+dje1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTY+dje1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309958; x=1823845958;
  h=date:from:to:cc:subject:message-id;
  bh=eJoJzxzc5/iZvXMddP6b1lUmhMUrWgg8ZxAuZ/crnbs=;
  b=VTY+dje1+CqA8WlXseFJuO1K2Dm+/qI/z3T4T0lqBK+pkRbUm0usCKBd
   7V8ukwwkwDShRh39jtuK1yM9qYIO/+W1SXbLkbej9Dd7vRsE6al3/amIx
   HZo57ZmR3nPT/r7SbOFx2lWea7LmZaBSabbaOOfsCj76KNwHgLNkYd+Nf
   1lclJre2S93eE0kYqBPXpBrQpP1NMh0AWl8rd4Qq26J0jhTJEWSSiQpJN
   IfT5lUho6FuF4OlWvO0PKDZgdu1ZXUurtuy6n8p+Wx5K3B7KF4GSz9Pb5
   x3zqXFuxq8GyEE/9uPPl+j3VGC0w9XLzAV9xFnH6Fxqy0g1d5gFGf39/5
   Q==;
X-CSE-ConnectionGUID: eEE6c6UfRvePFOJ4Mcbg4A==
X-CSE-MsgGUID: TNIkSXI5QHCsLlopRvEfdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908845"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908845"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:36 -0700
X-CSE-ConnectionGUID: g+V/ZcGUTXeX1DzFpSXZGg==
X-CSE-MsgGUID: u4qX/spvSYSm72E3X72fQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115542"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xT-0Sfu;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:43:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mszeredi-fuse:for-next 26/52]
 /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld:
 cannot find -lfuse3: No such file or directory
Message-ID: <202610170140.tU9LUfij-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: fuse-devel@lists.sourceforge.net
TO: Luis Henriques <luis@igalia.com>
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   4dd8d396740168f5379f332ad2c165d7f0f91953
commit: c7d054ac8ee905801db370b3fddbf2bd0775ca5d [26/52] selftests/fuse: factor-out test fixture setup/teardown
:::::: branch date: 8 hours ago
:::::: commit date: 35 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261017/202610170140.tU9LUfij-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610170140.tU9LUfij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610170140.tU9LUfij-lkp@intel.com/

Note: the mszeredi-fuse/for-next HEAD 4dd8d396740168f5379f332ad2c165d7f0f91953 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> /usr/lib/gcc-cross/aarch64-linux-gnu/14/../../../../aarch64-linux-gnu/bin/ld: cannot find -lfuse3: No such file or directory
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
