Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D93325712
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769715722; cv=none; b=PQDqX2+L2JYfgfSMWw9fnmYYydu7CBMjiLMdsA11qi8SwHb/KXiJVXFUo5i7Ys8Ah48194pj7WpyccLMqWI43SxWBUpInoGe0OzPYpnVcENpJLBMnErnTeuhKz9vJymxg/45LlkbXhuYVTlulhBGOwYjxOCkBmDvdq2W8p+7+EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769715722; c=relaxed/simple;
	bh=05hvKusJAYUNzt955xhbjWa0MjpEIhY/LfXezM9oJOM=;
	h=Date:From:To:Subject:Message-ID; b=eaOkLlzHPbS07wCnZPIlixiDh/YxxZ3UZRupA5yQ8v3aV05xXdp85x50rNgmiPvtNAy0Fb9J8AgZ/FHkDEATOPT9f9qmgVTLzFeT+wiaWr2PN4gYsT2/6gdcRGPIp985RQ1YGcLlQ6BTI0ct7Jy87aAHNNpHpGPZibjiFbhMiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+W7bJ43; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+W7bJ43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769715720; x=1801251720;
  h=date:from:to:subject:message-id;
  bh=05hvKusJAYUNzt955xhbjWa0MjpEIhY/LfXezM9oJOM=;
  b=M+W7bJ43g4r4jzcjPCoWcUsNArZLcoY5bfATpHxeKfz1G07TyQrX4eNc
   cYVzPAvI0ZrzATgUH8/uEzo02w2zC3Zsb+U+k6SMhWeULxptanLjsEP9y
   Ocl8aP/DmXzB6WO4K/nmGK/R7VRV8VS/nMAeu6hgcUp28M2e3Oi6J33qK
   vg4FgLgcrSsC0MogkD0E09swGxT9xNujsz1KWOjI+qNr3DWtpUiCsV1Xg
   FY5UALKTPFYHqLqr9D93Rd7vAH/8JLVC3r6WbWIxfPfJHxZ7hSrV8bApu
   v1u4TYEg9rdR9hgyrMPfA+BGC68mzcrWSsQZzntxKKqty8Z9T9KSb2xLM
   A==;
X-CSE-ConnectionGUID: bRdPDOD5Sn+McMNbYjKhjQ==
X-CSE-MsgGUID: Oq/7ZVd4SoSA1zafO6fJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81283754"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="81283754"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 11:41:59 -0800
X-CSE-ConnectionGUID: QiaZ5pT/Tj6SKwirdhaQCA==
X-CSE-MsgGUID: q+HrKpu0TxCb0pc7dutjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="213556175"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jan 2026 11:41:59 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlXts-000000002KP-2cKj
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 19:41:56 +0000
Date: Thu, 29 Jan 2026 20:41:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 45/101] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'code'
Message-ID: <202601292051.BN3qoF11-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   a71b4fbb5f9908b0e1a9ad21faac5475d08987e8
commit: 446566e6e829301b6939ce58ee5cb3ffba1dcba1 [45/101] fuse: make debugging configurable at runtime
:::::: branch date: 83 minutes ago
:::::: commit date: 83 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601292051.BN3qoF11-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'code'
#26: FILE: fs/fuse/Kconfig:104:
+	  Say N here if you don't want any debugging code code compiled in at

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
