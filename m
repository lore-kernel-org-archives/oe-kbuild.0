Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC7F47ECEC
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829544; cv=none; b=gjbokx8e1OvhcS8IWLTU4MlPdLOyn8/MUDE1L6LGI+SfszIO9D2A2rfg+FMh4YIEPOStvzR0fz19JPC8C83YyrQJeBbNpBuNQ6KOVI0z/YZSguY4EtwG4JoSa/DOKzSsaCdUGondtIfX3zzqGue+Y5dmQ7M059qQ/dHVWTEuXL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829544; c=relaxed/simple;
	bh=IYg69Mbb+F6hrlMPd4MC2ZQOovc2rius7VgSzbIvTWc=;
	h=Date:From:To:Subject:Message-ID; b=XP9UxvhHzyehXcZmBQxfybB/pOJZgdiY6I2dtjxevw81FuA61g7TinKgT7Vazf+3fGMUVuRZykRN9Pd3IV9+ogFjsSnDtoT1LgmqNgPumcQLmt9RmhmWe/wBrrOnBszDcSp5hG1XcgPIsJbXekoQQkLsndh+2JitZ1trn1Djcl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXjouR4Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXjouR4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772829543; x=1804365543;
  h=date:from:to:subject:message-id;
  bh=IYg69Mbb+F6hrlMPd4MC2ZQOovc2rius7VgSzbIvTWc=;
  b=TXjouR4YIamO4UTag+IJYneOjubB7KjO/Ou1Pjx89hm4IAXC0xI+qcUa
   XBjWWmmIHWdY4XNDt17Ed7PrpROR6EtQZC9t8u+k2Te0lMmqt/ob6jvLu
   /n0iO0eEhm53ZZwlxqA89e5Xd7zkEpb/nEkb92uieDg1tk4zIV+vUnYFt
   aDdgRDm3iV08VbNY3ayamrISqjjrb4+bkuSJqLtBaXURVtgCn7FJeZI0/
   i3qZMA3A1l+uWfAhhejarT6Ss3kKCiHoQ5yEXrZafFBTjgst6d+sJp8W/
   UAWfNEoiROpM4ReeczmIPvDVJAiOYltgx4523pJr6Qh/M2EDn2NLPeVX9
   A==;
X-CSE-ConnectionGUID: jg3CTdhrROyVR1ZjR9dRMA==
X-CSE-MsgGUID: 8v72VpcbQFWt1QF5npXVCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="85421072"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="85421072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:39:02 -0800
X-CSE-ConnectionGUID: 8CTphSXlT8idTt0ecKzqsw==
X-CSE-MsgGUID: qe53kyW3SH6XO8xStEc51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223601271"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 12:39:01 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybwp-000000002LJ-1MVa
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 20:38:59 +0000
Date: Fri, 06 Mar 2026 21:38:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260306-1425 11/31]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'revision'
Message-ID: <202603062153.siOCrwd7-lkp@intel.com>
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
commit: 89aed8b63cc9254a471eb313b66a9c31a4169760 [11/31] RDMA/hfi2: Add in HW register access support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603062153.siOCrwd7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'revision'
#1145: FILE: drivers/infiniband/hw/hfi2/chip.c:1109:
+/* return true if this is WFR chip revision revision a */

WARNING:REPEATED_WORD: Possible repeated word: 'revision'
#1158: FILE: drivers/infiniband/hw/hfi2/chip.c:1122:
+/* return true if this is WFR chip revision revision b or not WFR */

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#2031: FILE: drivers/infiniband/hw/hfi2/chip.c:1995:
+	/*
+	* Update the counters for the corresponding status bits.

WARNING:REPEATED_WORD: Possible repeated word: 'be'
#6939: FILE: drivers/infiniband/hw/hfi2/chip.c:6903:
+		 * Physical and Logical states should already be
+		 * be transitioned to LinkUp and LinkInit respectively.

WARNING:REPEATED_WORD: Possible repeated word: 'off'
#10691: FILE: drivers/infiniband/hw/hfi2/chip.c:10655:
+	 * the device since we are now in charge.  Turn off
+	 * off all outbound and inbound traffic and make sure

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
