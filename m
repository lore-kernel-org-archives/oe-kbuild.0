Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A970923507E
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 21:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762552772; cv=none; b=Do4kuhXWHVeGAYdZhgrB1uzu1cPDC+cXVTEzv1BW5YL3dJpyxV3K4pf/Fbwsm0YeX7ED6D4qwZ6YG5SNVQw+NRvRbssKz3wLz2gmcQ3oTMBJ/HNAXuC2pK64QFsfU04BMZwK5pAQh0eu0guZpx7npflkKf8LgUSfM337Q1HKsVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762552772; c=relaxed/simple;
	bh=wLEBGcbsBRtCoavCy0fEvaM6cu7YAZsde6shYqO7PAc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rDn5IIaQBYpax5gXnqmjMeAAmgRj4/1eCfLROuYAQ5d1gTJqeRil8tOC68P0H9Zr7QXwmSJg7fjWg8dPpIWdkJJDmHkCkMVpMTfn+VEYzw+W/+LYwKto8k1DNWSjEccDfrJ4Eo4Vr8sIJzFEqdOfAzGpqKN0f5ASvkwmrRaFdss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NKPKrlrM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NKPKrlrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762552771; x=1794088771;
  h=date:from:to:subject:message-id:mime-version;
  bh=wLEBGcbsBRtCoavCy0fEvaM6cu7YAZsde6shYqO7PAc=;
  b=NKPKrlrMIQuI0NLKpzMfOMYrjhIFhfFecNs89kgqNF297j0mCwlU/OYs
   EAKSOSfZHFs1i/ROMa0R23/ymbyljDE1E/73D2w7Gt+f6vmCBoTlkob9S
   Xq/XMLfFAt2YB9ku4lFqyGbxmY+G6cQay1VMU1kPljNF18vvj+rKQs5N5
   RbmQ4t4sq432D+m41RM3B8yNkEUFF9/z4uIOvI8/OzCd+2BxNXcxhxEqg
   bz81DYTb7c6ocQSi+0CfmlikMK1DW8fUpHsNu2Ec6wE6zPZvA4qUT3pLs
   E1nguWr2c1VbK8PPuco5vCRAf4Bf4oCMxJ4RHwlfEZjH5BHGvFUVtow1c
   g==;
X-CSE-ConnectionGUID: AutR7Q6kSYGve5Cs/xR0hg==
X-CSE-MsgGUID: v135ZmoLTuKXSmAiiVIq5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="82333743"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="82333743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 13:59:30 -0800
X-CSE-ConnectionGUID: 0qKHCYzbRpeH9J2QAubY1A==
X-CSE-MsgGUID: DA5w/KwyTS2O2AILQW1z6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="218797677"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Nov 2025 13:59:29 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vHUUR-000000003Vo-0fL8
	for oe-kbuild@lists.linux.dev;
	Fri, 07 Nov 2025 21:59:27 +0000
Date: Fri, 7 Nov 2025 22:59:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-nvme:nvme-6.19 4/23] checkpatch: WARNING: Possible repeated
 word: 'in'
Message-ID: <202511072211.KCkd764O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hannes Reinecke <hare@kernel.org>

tree:   git://git.infradead.org/nvme.git nvme-6.19
head:   1c2ad96dbb33c75098b9c1b2a077d9434ecb9f02
commit: 8d9937531a4d3cb6d2d352c46dd807bfa52988b6 [4/23] nvme-keyring: add 'dhchap' key type
reproduce: (https://download.01.org/0day-ci/archive/20251107/202511072211.KCkd764O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511072211.KCkd764O-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'in'
#76: FILE: drivers/nvme/common/keyring.c:297:
+ * Decode the DH-HMAC-CHAP key data passed in in @prep and

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#165: FILE: drivers/nvme/common/keyring.c:386:
+	switch (upayload->datalen) {
+	    case 32:
[...]
+	    case 48:
[...]
+	    case 64:
[...]
+	    default:

WARNING:TABSTOP: Statements should start on a tabstop
#166: FILE: drivers/nvme/common/keyring.c:387:
+	    case 32:

WARNING:TABSTOP: Statements should start on a tabstop
#169: FILE: drivers/nvme/common/keyring.c:390:
+	    case 48:

WARNING:TABSTOP: Statements should start on a tabstop
#172: FILE: drivers/nvme/common/keyring.c:393:
+	    case 64:

WARNING:TABSTOP: Statements should start on a tabstop
#175: FILE: drivers/nvme/common/keyring.c:396:
+	    default:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
