Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E1276038
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680483; cv=none; b=XHZ7XBSxL7QJQSIVnXleoh0H+ThI3HW1B1F9rbyutEEm1owQ8lMSvNw8hQMmchZRs+WVnNbi87G6r1eUBdDHx4f4O7NQwry1QghOunori73gtv8aTeqYnW493K8VPFkuciCBIyYCZF4+9K/ymwbuzlMYS/5X/p1yeBcHXe2UKz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680483; c=relaxed/simple;
	bh=+aYyfrjfSAjzhCf4ggdHTCDXKUV+KWFgKxUKQ/xh4LA=;
	h=Date:From:To:Subject:Message-ID; b=pDTTR3mlZTcI/df3HLTZlE73AmrB1c7c5Rln6DJwKwNvOQv/D3176dmzVeI7zo7f3qAdR/bLOMFBBQRR3KOo9pi1h3mT3uBFyVWeVAKSx/bPsqOvCTq0dMeNLiwcR4pGAVNVCadrsdhbeMW7SlkjePtErgoiHzB/hSRLDJlIYCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nh+CNIYu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nh+CNIYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680482; x=1804216482;
  h=date:from:to:subject:message-id;
  bh=+aYyfrjfSAjzhCf4ggdHTCDXKUV+KWFgKxUKQ/xh4LA=;
  b=nh+CNIYuFr/9YhbCUejCxDxyoBhaP2u9BXgBT24ORyrU/m42BS2xF8Hp
   O5yyHoZnKcXDeQ5IJYErrh61Ej72/3l2Lb52Lvn6x173fZuUzp0KXbS6I
   DE9D8/Z8zuhlpTvzOP8TNAdCcxBnk+WyjMCj199M9jFa1Skx+HwgowgFW
   ekvu+ld53LKZEhbFh66gqaX/V8o0eJz39gppO0Jy4fLmJNp8mf4g2uJHi
   yCCxkw+n0w2OYrgaBKA6aJTtSvRDJD66NYzuaq7EvDxzqqm0So9r6NQds
   u9SmKmHtvICnLyK5LPSeLPb5vPssyKjWvLUNJqlc1xIBZC0I9e7CO16kl
   A==;
X-CSE-ConnectionGUID: zK+2WlsOT8GmhOnAzGP/ew==
X-CSE-MsgGUID: eiDvCFDbQ9SVBgGfv/13Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91148717"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91148717"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:14:40 -0800
X-CSE-ConnectionGUID: 2YQgy1R3QNS9nY/t0SAwCw==
X-CSE-MsgGUID: QiW38ho1ScWj2A9daipIZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="241555233"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 19:14:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzAa-000000001tV-1qyf
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:14:36 +0000
Date: Thu, 05 Mar 2026 04:13:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 338/467] checkpatch: ERROR:POINTER_LOCATION:
 "foo * bar" should be "foo *bar"
Message-ID: <202603050451.B7YLFiKu-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 18f64b9afc55f000acbd7f306e1954d94daefc9d [338/467] s390: vmlogrdr: convert to read/write iterators
:::::: branch date: 57 minutes ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050451.B7YLFiKu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#43: FILE: drivers/s390/char/vmlogrdr.c:478:
+	struct vmlogrdr_priv_t * priv = iocb->ki_filp->private_data;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
