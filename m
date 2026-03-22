Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FFF347C6
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 02:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774146825; cv=none; b=f7MmiXTAISwNyDfJFmWr5APT/ZRvGpFUUL2Up1A7NXmrF2/oi1Ohb+cxMDZTEKJ/UG8cgGPfiCxWmGTFzTmXMb1dB8sCay24L+oZ0TnmWFqmFssvOd89DKXbmeuy9PkXRDWKPI6nJLfb8nagPgrXHJipfFacXKhhBSPBs6n6cXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774146825; c=relaxed/simple;
	bh=eIMeHA38HfpgnXa3D2O4CwpBrPFolfFjeI6pHCPMPto=;
	h=Date:From:To:Subject:Message-ID; b=tli/DISx9ArXNZ/6akIV1T3nEur24l6KsifhbTNFpygODALsEZ+6HEQYuXK5gPe3AyTw9Drhe7cyA6yblfVpLzOMSrndRXCZYD2y3iz+jDlWEMKZHPdF22m2FXcMroIx0qEyal+zneo3oSHS3wZpIjoCl26u5VaSyHuKeRwQ4ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmopdgIQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmopdgIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774146823; x=1805682823;
  h=date:from:to:subject:message-id;
  bh=eIMeHA38HfpgnXa3D2O4CwpBrPFolfFjeI6pHCPMPto=;
  b=CmopdgIQ5PAje1U9LKceSP76Rj6H8lMyfuMmKdEixegRO1U93nd/Fw+P
   ZDQlUiOdAI5DvG/iXMgNeYZbwaVdFVEEmRx7e7zkiC2IKAUi70w6ta6V0
   0rwJ7XdgLnuOycKjeVlgUTtRuGQWHBrEosxKl4MiWJdowu7pwwMnFEvTz
   c+Jgb5RjqEU7h1NZRs6WtnTgDlTc/L2SQgobpqHMK0x7GKQKkze8ycleK
   FimSF07WLPqD4HLgtlCoH8jNBBX4oQ0SGFSUeU1sLqfvjfAuFCXl/ER2m
   i5gn34cjs74h2bMrQ/9dlIYpxhNgjhv+41EbQPXhDvlwx5WDBuDLr87u8
   g==;
X-CSE-ConnectionGUID: yLUkShTNQDW1Wn8Q2QOrSg==
X-CSE-MsgGUID: DZfaxK/KQtOWSzfH4sLljQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="86264571"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="86264571"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 19:33:43 -0700
X-CSE-ConnectionGUID: qaUL6JANT9GV6UKQ4KtHUg==
X-CSE-MsgGUID: F9dgbP/FRlG8GGEjX9ccCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="228608326"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Mar 2026 19:33:43 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w48dI-000000006GP-1fsP
	for oe-kbuild@lists.linux.dev;
	Sun, 22 Mar 2026 02:33:40 +0000
Date: Sun, 22 Mar 2026 03:32:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/pkvm-psci 17/17] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'this'
Message-ID: <202603220347.ZIkjEGoY-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pkvm-psci
head:   5cfdf1b3e26114dbc237922e7813cf6db8c421ab
commit: 5cfdf1b3e26114dbc237922e7813cf6db8c421ab [17/17] KVM: arm64: Remove extra ISBs when using msr_hcr_el2
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260322/202603220347.ZIkjEGoY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'this'
#8: 
otherwise. Note that this this option is 'default y', meaning that

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
