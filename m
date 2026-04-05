Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653F349AFF
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Apr 2026 05:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775366347; cv=none; b=GkwNLJCZTAcmD1mIX7vpyxNMMOR8ebObKkkY6GaFWc0HAZSXwlkMrywO54gaEHK34Ki0QauBZzImJUv+N+zh/bjrLuZcaloq+PmXJ8NndGBu2Ex8nrc4HNc2GBOms2MGakgqCXJHuOAFo2tfRXilA4XnDpMEDR4lc4GUYIoo/W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775366347; c=relaxed/simple;
	bh=bchh3jYmkTXzbEejCKeSrQNEIbdKYF79cgzIjl39AeY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ol5zWvKP+qECtG4YW6En51icB0muvk7zab2DuSefnzw1bP5OXztCvJWwrI8XZqQbSGyNqDjLs7eEaPV/kEDambufpxGSsIfuddVISKV0+Hi6lXqjGr2r59D4ugKGIqBwXMeMKQek1IgPZe0CUh/ceeP68HEvhNYSKdnIManf9xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHQ3mRNk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHQ3mRNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775366345; x=1806902345;
  h=date:from:to:cc:subject:message-id;
  bh=bchh3jYmkTXzbEejCKeSrQNEIbdKYF79cgzIjl39AeY=;
  b=oHQ3mRNkMUXpoT0WnpmJTuMarvKXMQZfyv7TzT/LaMtcAYgfzab4Resx
   vD6d209H08LfKMjywBnvsw2rfr+xH7KOcZHuIv7HG8OiVx4D4W9yqSNEz
   MdqWo5EyVUygTZHpv5fUaauLFI0Uv/qZPt02vwexzSJY62aVLylrNwpBo
   5E37l/S3Nt/fjjlfJhQgvNM/+37dvYZriYFb8OLq14GBhTpfu1DsBAsYF
   MapV/SEkkFldmtg2Cj7Es1XnixdyaQsHUI40d2mKGgzZKbs9Kwznfc0Um
   UwHWKw7Lks8viY8fhSMIazcW3KWOiHlVrsItOBTYHevYG+OY632duEZcq
   A==;
X-CSE-ConnectionGUID: 3+h0VuTDTC2RjRD1Xll9Gg==
X-CSE-MsgGUID: zyssVW3lRIWnNDypsjop7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="101823641"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="101823641"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 22:19:05 -0700
X-CSE-ConnectionGUID: 7wXlJK1PSx2Avg43KPdYPA==
X-CSE-MsgGUID: t1thredBTBusYjh/xAc++A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="226609654"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Apr 2026 22:19:04 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9Fsz-000000009kr-2dBD;
	Sun, 05 Apr 2026 05:19:01 +0000
Date: Sun, 05 Apr 2026 07:18:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build-arm64 14/35] vmlinux.o: warning:
 objtool: sync_regs+0x0: stack state mismatch: reg1[16]=-2-8 reg2[16]=-1+0
Message-ID: <202604050712.kxAt4Ah9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   96a27804fbb34c0e19f217848a8cbb91841bcc35
commit: 34289a9c265ced49097f0b40855c8b19a0cd62e9 [14/35] objtool: Don't copy insn->sym for alternative replacements
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260405/202604050712.kxAt4Ah9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050712.kxAt4Ah9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604050712.kxAt4Ah9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: sync_regs+0x0: stack state mismatch: reg1[16]=-2-8 reg2[16]=-1+0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
