Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3CFC8F0
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 22:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765664320; cv=none; b=NKmpI+HFu1Lo+p1ZHG3EZI4RhcJ1ffrQk9gazQJ76en+zKgwnR9pi42HpWM0de35xWHzh6qRtoNmaqcs/qUkEE3Mh5M/+QNneA5X8cmkDnw9kXccIwprSPcBnDGGmorvoXQSGEvRcCw4U+3TPXu8hUJgaBawWF+W/S8DwDs5j/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765664320; c=relaxed/simple;
	bh=mkZnF2dyfFuDnMw83T5XH+nTjkfHLyyTBQ3rUpKmaZ4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ike1IWVVTvEEaD1Jy+wfzZmM+5ssALrxEt21gJKtVted/crnI1uhBYjO9qNXb4JRcxW1s/CPOPgYbCKi9g0cv2s3yYNNC7KlVcArX2jQXoO0IYDV/uI35Cxro/CBazV1iulzoI5FcN3uR3IzWa1CiT5LtiE1ogXsdGopMeySL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2IrqD3X; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2IrqD3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765664318; x=1797200318;
  h=date:from:to:subject:message-id:mime-version;
  bh=mkZnF2dyfFuDnMw83T5XH+nTjkfHLyyTBQ3rUpKmaZ4=;
  b=B2IrqD3X7zagupi7u8wqIAJ6CSfxfKR5mKyPoJCB9tD0aN0e9E2Ak164
   jFKHT6xlpdPh2WFdHmKU6DWBN+0WWOBm88t2rFWBdKZ1iJ5qWnu4xheoX
   Zkaet6Dz2dbLLcdVRiu8Lu+DtPanAtHFH067ki+BlexWNfK7WR94/YEnS
   yd5CXmiqhCiacwDuHCPvebv5GSAYxBokOol2LxEpXxdKQhihs+uO+9Q2t
   mkgSovB9xC0E4wUhGAUSQ6DdMw2QwTzZhVv2xuKG2Hud12LA9nhJXN8kK
   qrj5Qz2iyWEQ/TrOwRvxolcyCXexis43NCYDIDlh6RIL9xkFtUI/UNAop
   Q==;
X-CSE-ConnectionGUID: 3GGN1wocSeC3JJ1Dq/Nb0Q==
X-CSE-MsgGUID: 9RW5O9WCQO6tQO63JkwCJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67584302"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67584302"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:18:38 -0800
X-CSE-ConnectionGUID: lGVJsY+SQ+WlfTrnYjWFoQ==
X-CSE-MsgGUID: rbtPI9qGSTeeq52ucV8KPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228445428"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Dec 2025 14:18:36 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUXwg-000000002CC-1mOs
	for oe-kbuild@lists.linux.dev;
	Sat, 13 Dec 2025 22:18:34 +0000
Date: Sat, 13 Dec 2025 23:18:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [iwlwifi-next:fixes 1/1] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'damian Tometzki damian@riscv-rocks.de'
Message-ID: <202512132353.uWsPDF7D-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yao Zi <ziyao@disroot.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git fixes
head:   8943c01468344df2bc7c1e98effe68ad92147cf2
commit: 8943c01468344df2bc7c1e98effe68ad92147cf2 [1/1] wifi: iwlwifi: Implement settime64 as stub for MVM/MLD PTP
:::::: branch date: 74 minutes ago
:::::: commit date: 74 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251213/202512132353.uWsPDF7D-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'damian Tometzki damian@riscv-rocks.de'
#28: 
tested-by: damian Tometzki damian@riscv-rocks.de

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
