Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CDB3242AC
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 22:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770157374; cv=none; b=BUTxSfikqj2ZbUfYHKSKPkUpND97GqQQpyX15KrZzIt9Bnt4W4D49D00BszkfA5fx8zuXGNHHjtwOVVPMmRNCkjAuSRc+LjXxtujgEVe7tpo/iAxRX8n0iLAWaIP44yZaTsXMWSqguQoJAB6EEo+yzVgKbAINVfMuOmBSDr45mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770157374; c=relaxed/simple;
	bh=0aDR/wVqCUVnPlFfkaxKPmBJPcxtycwo6jyj6z153ok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q/2w4pCY9i4xf2LbOFYWPRNFnu//qA0T3/aL/wXwZFYPZUEiTkYX/A1kDovoXyXIvXMnWijwW3h/VVwQJs6XqdTEW+PiXGtSsirlw7PhoUSXl/NtMa13lf9OR5W77oK98LRn2IwKv+NYMi+xNwgDGn+U1nIrtHBW8kCToiKPJw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTGhYd8D; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTGhYd8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770157373; x=1801693373;
  h=date:from:to:cc:subject:message-id;
  bh=0aDR/wVqCUVnPlFfkaxKPmBJPcxtycwo6jyj6z153ok=;
  b=gTGhYd8D5ADkzfYpuigKE0+gDxaWTEBjwF3lmepWa4c7/YZTVVfFuEt3
   tE22JGxiy9in1mBtQQijwtTArc4jGR62J2ngUFaoRjn+xeIgzvsZthAOu
   8JZFhThatgCNuFmV2VXm2ZWtcMxKoq1eNK0cVL8UZkU/vez6+KaxeI1k8
   7ynekyHRMJ0W4qSoK4aH4NDZXPCKK52dE2hqAbhfJhgDpWcGruMpWXBK9
   E4/MX57zH01uKdDLETFuFncKZZhEjJpHwvCvFWsfW6lsm0JyV9Gi1+KrA
   gg1LAfvKH4iPbg42CAt2V70Gl5rBTYJd/FtZFKLPVugskjbPcDEb7XiBd
   g==;
X-CSE-ConnectionGUID: y1JkFdJNR/W2gYF9jLfBfw==
X-CSE-MsgGUID: l24WgwqLS4KDJODTEUHbMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70539740"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="70539740"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 14:22:53 -0800
X-CSE-ConnectionGUID: hYscSzvqRgiMy7N2aCqYPQ==
X-CSE-MsgGUID: g3D81TKWQZCL4b+CbNdv3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="232903298"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2026 14:22:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnOnJ-00000000h9i-24Lr;
	Tue, 03 Feb 2026 22:22:49 +0000
Date: Wed, 04 Feb 2026 06:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool:
 cec_receive_notify.isra.0+0x8e6: ignoring unreachables due to jump table
 quirk
Message-ID: <202602040605.QV1Ss7zP-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de0674d9bc69699c497477d45172493393ae9007
commit: eeff7ac61526a4a9c3916cf46885622078ad886b objtool: Warn when disabling unreachable warnings
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: x86_64-buildonly-randconfig-006-20260204 (https://download.01.org/0day-ci/archive/20260204/202602040605.QV1Ss7zP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040605.QV1Ss7zP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602040605.QV1Ss7zP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cec_receive_notify.isra.0+0x8e6: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
