Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779FB3176E1
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 12:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763729956; cv=none; b=b6mCiB7rN6xt1bNx5QO+vdB6DZF/RXbOc8+/lD2W/1iIQdmBfIw9Gl1J16M6Z4lnoX+uY8x0zOyrynNNlC8slm0L+iJoTc8Y0aFIrA4rvrivoKmmx4fjtsIoxnQAY1txoi1sHu3jx5oW2tNYHtzC91tSr9ygCpZVgfqH5WNZOP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763729956; c=relaxed/simple;
	bh=fFp5ijKnozQMJsq9XP8S1MF15g03I+pR7lsfpTPcqFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qN2v1a+gOR9F0ler3XrR8Uw/H6JG94y3fjS9XFuN/uooC/s2UanQL43S8ZjWYVG0QcsMulk59ZQDFcmNHCWgx2oHcdl1bxl7r/ltwKr9QRwh2JMMJnvP6JQHYIAe9+dQGsltyLzP+gV50QMoCQ4+s/Bw14VWm7Yakm9ZXxSSCg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVtbqmPL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVtbqmPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763729955; x=1795265955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fFp5ijKnozQMJsq9XP8S1MF15g03I+pR7lsfpTPcqFQ=;
  b=JVtbqmPLQpMC9ZgXBvpKZs7RsS1ft8F6M2AV/Rrj6IbCwXmONhpQ9L8M
   LzeX2eCL8GTxiL9Q1ZX3I0jZ9LX/eyzf+JexqvF+RUhqdmueTLuC2zVy/
   tnmO4xONZowMB7cJwMPArc6JkncgNaX559lIK7f9PqpPfHUxfpBHHyFKl
   zwQEHg2bXosCu2yrK5SVJyuJUrsdfG4aRQg1HU2mWEbJzLynAz9iBcOEx
   Kn0+8LPIxNe5YPwoAYn1eNGDnKX4hw1Ccjm1rE826a4zznafhO/Js3y1i
   SifX5kkNhHBjGqoKPERGxtkuQgK7dT6GhiVl69CsysVUJ5yIg061AfRHI
   A==;
X-CSE-ConnectionGUID: +Sbr6lkkTdusdmma74C3Cw==
X-CSE-MsgGUID: g6nvNrdCSNa8a1DX6LRPDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69687421"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="69687421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:59:14 -0800
X-CSE-ConnectionGUID: iAokqonQQyyRXByUqOI4Cw==
X-CSE-MsgGUID: dqQKuJIFQZOdb2cbwXVibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="190987927"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2025 04:59:13 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMQjG-000000001oJ-1IaM;
	Fri, 21 Nov 2025 12:59:10 +0000
Date: Fri, 21 Nov 2025 13:58:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:rseq/slice 32/32] slice_test.c:68:20: warning: overflow
 in expression; result is 705'032'704 with type 'long'
Message-ID: <202511211331.HMVB3J3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   7b8c131529204f7e05367a741e96fb382ace924f
commit: a94575b1f515b87068cb0d76d9e9714998a461a9 [32/32] selftests/rseq: Implement time slice extension test
:::::: branch date: 2 hours ago
:::::: commit date: 5 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251121/202511211331.HMVB3J3Z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211331.HMVB3J3Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511211331.HMVB3J3Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> slice_test.c:68:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
      68 |         .total_nsecs    =  5 * NSEC_PER_SEC,
         |                            ~~^~~~~~~~~~~~~~
   slice_test.c:76:20: warning: overflow in expression; result is 705'032'704 with type 'long' [-Winteger-overflow]
      76 |         .total_nsecs    =  5 * NSEC_PER_SEC,
         |                            ~~^~~~~~~~~~~~~~
   2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
