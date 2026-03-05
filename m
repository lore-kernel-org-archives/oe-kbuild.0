Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F034A218EB1
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 02:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772679101; cv=none; b=CSnkphajPJtyS6NY+T6VLQX/ell9WlcfjPPziLBYvbvvVZnCI9y3rh4VKPIdWHZz242e+7eUBkqJ8x/lslwrNe1CYqJARHkBFEdIlp9Yv7ouOXAO3fmuGAjWwSp+NDazOwsz2O9zkbKxFbun2wr1obOYIc1w5Fwks7nteWydaYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772679101; c=relaxed/simple;
	bh=IBnjDzspqjw8G0rryv+7+9Ke4zvibGZwP6rl64K4tR8=;
	h=Date:From:To:Subject:Message-ID; b=QTmtLy3BmqR6L7EKt8GMvYDPJ0tf0XzWqcr67scabVqdkuURxRszKUyC7tkVr+DBYF8ncAiOjPFG3F9haK9lCvB/qpo/TpdZ2TyhLughtRQbDAIlsfBUOyS7lilZFfZ5FU0aiVbbZae97UzP90naLFltF8KuEJ/KLkwcfWaTokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzSfSGQW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzSfSGQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772679098; x=1804215098;
  h=date:from:to:subject:message-id;
  bh=IBnjDzspqjw8G0rryv+7+9Ke4zvibGZwP6rl64K4tR8=;
  b=HzSfSGQWfm+DTh4gK5DssztsyErJkzr5VpSatFy9RXizTp2y2WF9frIx
   wAD9QWlS/Gx/4FNmVgtEaUwzNIGy8kyXvvhTHwhhPkvpwVPfUvReQma87
   3yJBMxjoGgJAtva6Wb4T9eWAOZm6xRaZ/pH5/CkUV+GQhNthcFAgqsqAO
   nPmY2V5cMRwHkcdaVohaAn5z+wunEEfOCAVxYaruvghSkIrpRzrBQgiNx
   c1+NSvKeZsqraWF8jmjTbGuypw3SmIOf33IksjgXFLI5h4dvgxXa6aApN
   njf4k4EysexPH7mx8NSQepnqCs73rz0Yr4AyVWKxBk0S9pc0usB0rmLJI
   g==;
X-CSE-ConnectionGUID: QzbHi//xSUSbApFgyODe5A==
X-CSE-MsgGUID: WhYc/vn7RYClmi1kiknFYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73661651"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73661651"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 18:51:36 -0800
X-CSE-ConnectionGUID: sxS23scbSOSYZLJ0MrUYqQ==
X-CSE-MsgGUID: p41LUqjtRqi9a+aF5Nrw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="241548371"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 18:51:36 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxyoH-000000001px-46Fd
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 02:51:33 +0000
Date: Thu, 05 Mar 2026 03:51:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 115/467] checkpatch: WARNING:MINMAX: min()
 should probably be min_t(u8, 20, raw_data[2])
Message-ID: <202603050302.kHqYOIJe-lkp@intel.com>
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
commit: c1a18afdec14e9f8ddccce063aaaa86b7ac7ac15 [115/467] drivers/hid: convert to read/write iterators
:::::: branch date: 43 minutes ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050302.kHqYOIJe-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(u8, 20, raw_data[2])
#153: FILE: drivers/hid/hid-picolcd_debugfs.c:135:
+	if (!copy_from_iter_full(raw_data+3, min((u8)20, raw_data[2]), from))
 		return -EFAULT;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
