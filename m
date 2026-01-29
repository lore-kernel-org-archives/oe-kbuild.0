Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AD82586FE
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 04:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769661295; cv=none; b=DR2oQXreWzJkMkfxDMHMgvEQ5qLapvQ4b5BQPslbNQtPBQ0cDdHD3Ns2lyMK7ALzyUoKL9/Iar0iQWNOYJwSepSQ5Kl9fZY2EKFkU6cQNJix4U6gKPCff2zX14H1XpqwvC9Upp6MxtJv1Wuu4eXTjx72FS7Wz/6eCwazzUyk4HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769661295; c=relaxed/simple;
	bh=Ebh4aHUFrOhYbuxtzOOiyQaUQtMUZMtaSd/33FkyvXo=;
	h=Date:From:To:Subject:Message-ID; b=mT7mY/9TnO/FZ42GzrRKORim04Hiv7/PIB8myADiIkElvK6TSOO4ZJBd/Nu+fV3EVyHa8/iQIxtBiA2lR0uNNLduAs00LdPTcYsoc1L9utJm7jzIPaG/zGojSlx2ZfTWsSkFHYPJl93ByjRQU2UMZaniTsuVx2AgeSY5Kn4DnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TuNO/rjd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuNO/rjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769661294; x=1801197294;
  h=date:from:to:subject:message-id;
  bh=Ebh4aHUFrOhYbuxtzOOiyQaUQtMUZMtaSd/33FkyvXo=;
  b=TuNO/rjd+qLLy1TKKIIPklWX/ycigWTa/R0MkC5bFWMBlNNRWeoZ7rKC
   ZQGQ7z+FgdlngQWkorgpwHzjC67c/bqdI/lUVs1brkIR2BW3HMeXWq4gt
   Jxx6XkZvZ1h2D8JUQvF2m2D3jdR2qAUxCt4KSUCUGTlDwPgOFoIavfy58
   WphJi+dH8y1ZnYVRIFX6C+1c/Y+RixxHcOwJQDM+Y9PbbxBQkmp2IK17g
   tt6IOE1vx5oBTinb2BfzEuTZL+0q3F0p1PgcVrW+xNgkQnrgLSRFmY/s2
   /73deeTxgYk6F0wtVLnxCOLC1hGjgG6e33Rp/9vCkce0YRm7SQxRFlsyW
   A==;
X-CSE-ConnectionGUID: /YS9MoDHSlyfpBgpKqLkoA==
X-CSE-MsgGUID: Uw2SuloBRMapaINIGNltJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82001730"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="82001730"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:34:53 -0800
X-CSE-ConnectionGUID: NSF4TnlXR4CuFO4nRBICSA==
X-CSE-MsgGUID: 0QwIjLWATSOkN45oroJgpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="246066267"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Jan 2026 20:34:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJk2-000000002BV-0ong
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 04:34:50 +0000
Date: Thu, 29 Jan 2026 05:34:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 16/39] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202601290522.Y4u5IzN4-lkp@intel.com>
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
TO: Richard Kuo <rkuo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   64417972b86f5eb0d4a466436b1fb43da5692dd6
commit: 57d9a292755c8023e31bdefe25e21f0c9837db51 [16/39] hexagon: add device tree support
:::::: branch date: 26 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290522.Y4u5IzN4-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#1608: FILE: arch/hexagon/kernel/devtree.c:66:
+	pr_debug("Command line is: %s\n", (char*)data);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
