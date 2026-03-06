Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2739E6F4
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829548; cv=none; b=YSuaI4DNUQWZk6yhAqMlHWZg0V9DBH1QSZpo6Tz9z3o5+AMQm+fBlEpNO1gNzdfWpTvXKY8OM1pGD/98OrSpkQ6VmhZFzHqCqkGS0tESqsiipoXTTrlamZUgPN0hMNLOB8280jseKUi6UipSoZL41IWYbRr4LQGPR3kDEEZrpwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829548; c=relaxed/simple;
	bh=uTDLqkS/gQUjN8d/ToKfnQ0SG8Ci0OFXPLVFxEOyww0=;
	h=Date:From:To:Subject:Message-ID; b=ihijpqReSZvmo1bQX7CqjpNMihm+yE2/8CO4ItssQ5ofvd/kVbc7hwGXvJTeZjCE6sSHSIyFTn+7TBUB1r7cAiRArcQ0sVBWClh3CDpGZi4ic7BULVpmqUiUFrGh5r960R+tHvw7aQmV7MOnjo7wEK9g3NgIL5bi4zPn+Fn/SHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7llsdnb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7llsdnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772829546; x=1804365546;
  h=date:from:to:subject:message-id;
  bh=uTDLqkS/gQUjN8d/ToKfnQ0SG8Ci0OFXPLVFxEOyww0=;
  b=T7llsdnbWDFIRH9ixFP8TySU4zKLEwkuXhApR2EW6uBHOKvUXnp6jkKR
   lGlfhEZiQVsOawcjBQRQpwFN/QqObFD4hsDpcox28kXBaX5w26rRMTXyA
   eN9pa8tMHLUp7oQXipCPBDsi8oNsaX/IEiWKD7xnvufdrCLS+KorPU1kE
   fUGrtBqMo+wiznwx7hXI4WVRn6VmYfUf/o9HAA7+u8URGg8WehVkTfxt+
   +MtS9B8NJ/vliHpj/5NhOFsaPwdZZ/edgOCShT7WCKYgGd8rwVKIMZlP5
   R4Lr9NwswsJeVrgMJN2LSOhevcNuWLR1iHXtiauDK8XG2/K6Iih6FUSeS
   Q==;
X-CSE-ConnectionGUID: GPJmIlghQZOVfhXBm5HB9A==
X-CSE-MsgGUID: Nnmy3FRMQmeaUaqnCtreeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84578735"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84578735"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:39:03 -0800
X-CSE-ConnectionGUID: oVC8QJmgRWaLWhMmoeDZgQ==
X-CSE-MsgGUID: n4CDUrYtTHG75RLg46FVig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223233742"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2026 12:39:01 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybwp-000000002LU-1zgZ
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 20:38:59 +0000
Date: Fri, 06 Mar 2026 21:38:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260306-1425 21/31]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'until'
Message-ID: <202603062149.T9lQX8UJ-lkp@intel.com>
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
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260306-1425
head:   8e85a7c6fd859479abc528a78dec59382ef82d3d
commit: 991e68fa4d151f6a1e37ece4b05a46710ad71a8f [21/31] RDMA/hfi2: Add PIO send infrastructure
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603062149.T9lQX8UJ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'until'
#2339: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:71:
+		 * copy until until the wrap, then wrap.

WARNING:REPEATED_WORD: Possible repeated word: 'from'
#2442: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:174:
+ * o do not read from from if nbytes is zero

WARNING:REPEATED_WORD: Possible repeated word: 'until'
#2570: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:302:
+		 * copy until until the wrap, then wrap.

WARNING:REPEATED_WORD: Possible repeated word: 'until'
#2665: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:397:
+	 * copy until until the wrap, then wrap.

WARNING:REPEATED_WORD: Possible repeated word: 'until'
#2791: FILE: drivers/infiniband/hw/hfi2/pio_copy.c:523:
+	 * copy until until the wrap, then wrap.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
