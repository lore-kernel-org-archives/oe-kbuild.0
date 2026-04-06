Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DAB30BB8D
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Apr 2026 06:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775455521; cv=none; b=kgJUMHJeaPlcsqk8UEfAu6DqwaFwyKjCGxlte23stkZASkYo1ZEIID56RpkwFCBm48DNoLVutROC8X9oP77jixQDmE++b3rtnZgvntVPannGKmcYLNoQdCeYIOLplcsmy3gXCECBSJmXPHS118FNK28LVR92aP1V1CF/fmu2ZRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775455521; c=relaxed/simple;
	bh=Gi3dxeKnLJkw+VBzseN1SDP+sDM6DMeuxkBYOdDBdZI=;
	h=Date:From:To:Subject:Message-ID; b=ubxiu7oQtmFrPcCCfCM7HU7LPAmbKc4kfsF+g8rzhaDZmpcqzGvj9tHLRiTqCIEo+MqgImFehN8wu3/6CZyeMLDKrhOqCll481FhevI1erWPtDQuYJ2P+z3oDaYJGzqBPaiOgSG5Ajl1drPVObYnn8GobEIq/0AIbw6hcP2QcY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrow8G5l; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrow8G5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775455519; x=1806991519;
  h=date:from:to:subject:message-id;
  bh=Gi3dxeKnLJkw+VBzseN1SDP+sDM6DMeuxkBYOdDBdZI=;
  b=jrow8G5lTb9HfVl5nwdWLnU5FUw9/rnTSfXAvV397OxV3p48Hdge44+N
   5FlSqzSGWQrBwjegqbmC1RAk+rRTMGwyLMZWPVRJpbHdSgVmGFK5WN9ws
   SJShjU4YzkqwdXG5A3Ee9c78QaiqkjNj1PlGHwPLyJaf2s7vWEU/SAbgA
   nlphAGUfWcnosEXR0uz4o7EaA7qJlqJpJhjZIOlMExGGEnEKFh/Ka2a7h
   ioBc+4Qy/BYJI/tO/Vlt2nIBUkxV7R3bbGyGz39zVWovLV3HZMpO18jK6
   k/ROtC6M7Ib5KEFOsVOw5dDndjvSKmt7zHSL8OiiUL2BJuOspa840FVb+
   g==;
X-CSE-ConnectionGUID: BsfCSXwbSVa+sm2yW+zMOQ==
X-CSE-MsgGUID: ozzFDXMyTMulbJ+6UTsjWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76370350"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="76370350"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 23:05:19 -0700
X-CSE-ConnectionGUID: a/mi45nWTKeTcNTtAnydyg==
X-CSE-MsgGUID: K2yduk8kTvWkpSzy9h2LXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="232737622"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Apr 2026 23:05:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9d5I-000000009yx-1w6y
	for oe-kbuild@lists.linux.dev;
	Mon, 06 Apr 2026 06:05:16 +0000
Date: Mon, 06 Apr 2026 08:04:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jpoimboe:klp-build-arm64 15/35] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'to'
Message-ID: <202604060702.TZc0gkKF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   145dd0bef91c33be9d60ff43cc59020e4c809a71
commit: 48e9e660f49bf14cf9b7ae57559de9324decd06a [15/35] objtool/klp: Fix position-dependent checksums for non-relocated jumps/calls
:::::: branch date: 15 minutes ago
:::::: commit date: 23 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260406/202604060702.TZc0gkKF-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#13: 
alternative, which from objtool's perspective are jumps to to the end of

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
