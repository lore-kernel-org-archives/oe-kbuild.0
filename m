Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2709F1A262D
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 06:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769235174; cv=none; b=H+wVkSkdaP2aXiI4647sIVutOjmTJXjx6Ob/EIHkDBdL6tPRv+oTftzCIrU6mVVUFCRRJsBu3A/1NWmA5he0avYQcSGT39u2Ttrgnrbo0TEd3OW2PjU9GwZMCL2Hh+11B8aTa6br+dEH7pEQ3IhAOsB1Awq4EqdacammCG4NNyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769235174; c=relaxed/simple;
	bh=ive4blDAJemQhYivhe2ATq3ceReWfa4I89F6Saqfp6w=;
	h=Date:From:To:Subject:Message-ID; b=HUBnWS88H0UafSI/8bV2OGQn7w4dNyhojVLen5RLzK7pJPLGjoMeeNUyZ6L1vX36lo2yC8palaQulf5jvkB7CCzs0GpunzQPzQIpRBA4c+ffD0abhdlRUQ69tDCAn/bSqUdIkVj4DUa2WfozbLrpPS9LEbJbMDlEbItspdHWiUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJVXkPHY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJVXkPHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769235173; x=1800771173;
  h=date:from:to:subject:message-id;
  bh=ive4blDAJemQhYivhe2ATq3ceReWfa4I89F6Saqfp6w=;
  b=XJVXkPHYq4ay7JqHwmn9wiuQU3+Mfz19UcvgLO5hNQjoSy8QHU/x/VIB
   DcxzRuZe7yvqW+JAgMxDxbgqN/Z3wMJZGYAL+qmAu1WfTHP94Z0SDGMOr
   FjhTqvHBwoHVWySSTM71H0ehKaUv3kweCu6QJ7O8B/2hWnSZHBVh673XG
   aR8i1ikH0rBYSOBGkY4UrM8x5zkYL50fb4okCbeQf4/ykUHbtSEWSvO4v
   pRdvaNCXbzzBzjLn/Phm+iTo/L+lnS68m//UX0KyM2z3F5PBuxRSRWjlL
   otTAH3Q6AkROkep4G7g2DZ+ukzV4M3cMvHgN9A1OAhljq4WQEaEDw0Ooc
   Q==;
X-CSE-ConnectionGUID: oyF8oGB2SyWvqm6pVeYBnA==
X-CSE-MsgGUID: i1nqnqTaS8+5IbCVFZmrVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70645755"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70645755"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 22:12:52 -0800
X-CSE-ConnectionGUID: DEmfQcSVQpmX7GS97hc1cQ==
X-CSE-MsgGUID: Xpx3Q78ARdG14ezQzVK1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="237857835"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Jan 2026 22:12:52 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjWt7-000000000tR-2naC
	for oe-kbuild@lists.linux.dev;
	Sat, 24 Jan 2026 06:12:49 +0000
Date: Sat, 24 Jan 2026 07:12:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm64:for-next/fixes 14/15] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202601240725.g86RpiZa-lkp@intel.com>
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
TO: Mark Rutland <mark.rutland@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/fixes
head:   e2f8216ca2d8e61a23cb6ec355616339667e0ba6
commit: d2907cbe9ea0a54cbe078076f9d089240ee1e2d9 [14/15] arm64/fpsimd: signal: Fix restoration of SVE context
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601240725.g86RpiZa-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#54: 
    In these cases, the the provided SVE register data will be loaded

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
