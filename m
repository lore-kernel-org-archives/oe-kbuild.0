Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E141327B4FA
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765288807; cv=none; b=fohQUxK0eQUR5Q6Mpeh0p6iZbEc5YzvQnEqmC6BgadkN62aSpgl9DSuXnwa23tF0ZBdwxEnV7dbGmkqfGQS0HeZ7W6z4RFsW4EHZ/mJjd/1HWyKi7cscRvDzK0+EmxsNKGBFC7A3nWsLbTzdYqUOAHS8DMewWC0Wv67mOB5QKhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765288807; c=relaxed/simple;
	bh=Kicn6pgH0q9GvP2QKvoSE9+0T5AzJ2u7TBLbiLINot0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBCB6/Od0jqhx/NPJPOcM/V5qr09s2I0KcJ0btBFlrEzfledayDIDFtcIOm8yhi8EU45+0qZ15cGaD37BOweA+hdrdYwSvBcRlNHv4Q6AMZ5VC0kQ5gZk7FOIGuEPczbkPltzXKligGKpfh/LukTms219SUXP38BigYycrKwFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wjq2j//w; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wjq2j//w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765288806; x=1796824806;
  h=date:from:to:subject:message-id:mime-version;
  bh=Kicn6pgH0q9GvP2QKvoSE9+0T5AzJ2u7TBLbiLINot0=;
  b=Wjq2j//wy5Owc9RJPON9x208rPSx8ewo3Xvccyi2pwX7uPpatVMjHsbh
   R0StWg/ijuXPLTQhLE8r+YnNVliRXZ+AN2R5uXiBDjPZo517T0OjrGTcS
   4uj0CC3qNmfVvFxYVECPb7U74gL2BNh4cGcouC8G5knnHGwHN4pLFJXFI
   Mu9qPEQvuvseoeGgrcXGNkK5DO98xmh8Qmfk9qaQpJ+6UzINyl/2zmuTb
   YGxscnr1KGtBex64g9WNMer3UE6YsWNR6kIo7iy1HH82zbhY6kTZgNveb
   jVgpGjaFqvFEB9upy5fLDvrvNh/Rx68roM2y/UrgObuSwXfUZdOr1kJci
   A==;
X-CSE-ConnectionGUID: dhRMQ/8dTrKq4r6M6r8bgw==
X-CSE-MsgGUID: alNwqxq5T2OQC7POfYt5sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="89896948"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="89896948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:00:06 -0800
X-CSE-ConnectionGUID: pTXgaN6DToWLginYP6BsVg==
X-CSE-MsgGUID: tl973OPqQzmuYZ7D68RGRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="226896313"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2025 06:00:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSyG2-000000000E9-43n0
	for oe-kbuild@lists.linux.dev;
	Tue, 09 Dec 2025 14:00:02 +0000
Date: Tue, 9 Dec 2025 14:59:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [andi-shyti:i2c/i2c-host-fixes 63/719] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'to'
Message-ID: <202512091459.NpvSRpEr-lkp@intel.com>
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
TO: Catalin Marinas <catalin.marinas@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-fixes
head:   bf73845cc1394cefe52dd2c91478b606e1892e76
commit: 6dacf05fe6fbc3551580eafcc5cb7c39f12df7b4 [63/719] arm64: Use load LSE atomics for the non-return per-CPU atomic operations
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091459.NpvSRpEr-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#19: 
concurrently on the same memory location, encourage the hardware to to

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
