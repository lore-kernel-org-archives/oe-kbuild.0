Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B82EDD50
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 17:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769363954; cv=none; b=YjuE4+i4PZCuuHj9AgBVCApg6s84rYAkDTs29EJDQNc8vAFy9MeC5tI0JznsBP+5JhIhuw1c1+ggDXwY4xneAFouOefk169iE3oKhSPIuNKT/m+6/e093EC3EhvQylGAo1LCKXqfiW8Drw/B9Qi3wzwU9qcoimhYWwGJmPMTHDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769363954; c=relaxed/simple;
	bh=ND7Brv0U+6gCaBO3VCNHdkUMB4twq7VomIAhAA4nxqU=;
	h=Date:From:To:Subject:Message-ID; b=Cp5xCMFmC9SYToDWMuUJuvuAOcZT6+Zs12Eqb4/mhnIlLYE6B7ebb6iXZbeBk/3rV4MRzf9CrVIdX+WrdX8kkWr33iXDIeKk9pS+iGRbWd0bXHt932RUwVXditEmTV31b2bAmf480ylNC45VIe9NDKSM2i3gxK63c67ltoKSqPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XC4TEmaj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XC4TEmaj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769363953; x=1800899953;
  h=date:from:to:subject:message-id;
  bh=ND7Brv0U+6gCaBO3VCNHdkUMB4twq7VomIAhAA4nxqU=;
  b=XC4TEmajFp1l0QkdFN+nLhjYYX2rhgT0jW0pLJVtOrhiU1Zoi3Flrhcx
   jFluLkI74lGvG5cDJIzszJI+WKxWX1OjUSHf/jtyxFOJqtBRpH4xTY1nS
   GAzt4fi3M9SxdLdrEmweiMsRRMOJJAyJpi0qoZmON9uCYV3q8ofM5ZD4D
   bmRF17UfkNU0bQy35J+teZgFBMTp+tJNqduFTEzUkZ64hqRxS7Vs1FjcH
   h+5GzOIsYI0vfQ7zMSYTHQaVoqAP5fMV35PNlU7d8Wn8tZ3TwSJwydxuW
   gtI4dDbaW+MghEELwFHBBzfjkogXbcYtOlM14QmO259/BXM0n2Hii7kbq
   g==;
X-CSE-ConnectionGUID: rjG9qnQSSmSEPgsrJYXgXw==
X-CSE-MsgGUID: DSfAVumbRb+hmMiCqec4XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70461856"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70461856"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:59:13 -0800
X-CSE-ConnectionGUID: MSKpJ6LdRWeIJyxN31yJHA==
X-CSE-MsgGUID: PA1iN/TjTACUGf9q7fdJ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207097493"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jan 2026 09:59:12 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk4OD-000000001KN-39Sp
	for oe-kbuild@lists.linux.dev;
	Sun, 25 Jan 2026 17:59:09 +0000
Date: Sun, 25 Jan 2026 18:58:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/pan-opticon 12/24] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202601251825.4Aszrg9N-lkp@intel.com>
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
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pan-opticon
head:   d6fa4af5ed47e33eb5030914574ed208088883da
commit: c3f5cc95ef142f1d4048e01115e0a5a8398f2090 [12/24] KVM: arm64: Introduce data structure tracking both RES0 and RES1 bits
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260125/202601251825.4Aszrg9N-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#49: FILE: arch/arm64/include/asm/kvm_host.h:641:
+	} while(0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
