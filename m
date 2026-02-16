Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A81C2BEC52
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771266212; cv=none; b=AqF+e9FPXZTARJEt64lWa0QbvI9m5ZlvjFolmtRMjyouYcByzARb4yw4wsz+p9bpOp5kXkqhDmEEqzWzBdyd5gB/8Ovts987FKzWFlmFjtanYEidFxvsJsWFttXRhZAJoZm0hQ8H9lqFS/Tcbm1fFOhXBQk6cWRruZxen8dIjeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771266212; c=relaxed/simple;
	bh=cEEngM0XBIDdLzASdDoAlUrVqctMaWfFmzw9H1vLG7c=;
	h=Date:From:To:Subject:Message-ID; b=tzOnhF4PanWzLsBMEKnejgbz1DFPqAncH/NekfrUM9b63wymOFHpQDV4zigoa89B1309jdqda0sQpDI3yc6hOiE55ovErwTq8Nd8cYa8lCri6hTf5ThkwCZlA8bSZoxo1Bn0CzR+NEsD7DxkjOCt2KUR/mW+f66JHggZAqjzBK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBBUZ/xs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBBUZ/xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771266211; x=1802802211;
  h=date:from:to:subject:message-id;
  bh=cEEngM0XBIDdLzASdDoAlUrVqctMaWfFmzw9H1vLG7c=;
  b=oBBUZ/xsagu6/Uj8t+YUB2xuZ9J4RxgGNjpCRXGVNMYWLVMoGueEHMTw
   RAqmqj2DGWhBKMBSzfuWPOd7y8HcVCvd1Ss6oytTAtxqnkdj0qbBJkOZl
   dli9P+IE9S0uIPtfun+7TuT4WvwEQucCjBLRB0PJIxTAtPBtOWEb6oYhL
   IPApda5ZAHG1iPorUUXRe/69cE5sLreAFzlJieGAxYSA/MnbCFm/VyzJl
   52ziZ2MOzp4+ewW/t2Ed81TZ/UKLEMTH8GIoyntW5Id40RSVyPXX5szyG
   yM3U9k9Xf18KMW8iofPKNXDsgH5IdaUSfnEnOIoNIwDk3l2wI4SrF6ztO
   Q==;
X-CSE-ConnectionGUID: 3JtM3KMpQwyODaBTrgqhgg==
X-CSE-MsgGUID: 9Spdh1MxQhCInMfISiCrGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89760615"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="89760615"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 10:23:31 -0800
X-CSE-ConnectionGUID: LG+VPhaMQ3GRO+pbc8Ah7Q==
X-CSE-MsgGUID: OS4kH18LTRa6LCKT8Nc1QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="217822278"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Feb 2026 10:23:30 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs3Fn-000000002W7-3kSV
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Feb 2026 18:23:27 +0000
Date: Mon, 16 Feb 2026 19:23:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:highmem-reduce 7/20] checkpatch:
 WARNING:SIZEOF_PARENTHESIS: sizeof *icm should be sizeof(*icm)
Message-ID: <202602161944.UIri4HrG-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git highmem-reduce
head:   718dd72a00e45b52f424a6db19645b761fefc2ac
commit: 35d06bbbc2a1793bc8a1ba8a2dd357e5fd7196ff [7/20] IB/mthca: stop using highmem allocations
:::::: branch date: 87 minutes ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602161944.UIri4HrG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SIZEOF_PARENTHESIS: sizeof *icm should be sizeof(*icm)
#137: FILE: drivers/infiniband/hw/mthca/mthca_memfree.c:145:
+	icm = kmalloc(sizeof *icm, gfp_mask & ~__GFP_NOWARN);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
