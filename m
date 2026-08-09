Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F609B640
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786312033; cv=none; b=UgpDFmBxV8MSFOLwa7kEwiGhz1FOanSP7/ukmW3GeIK5sRTh0Coet5sI0QiW6njzF5Ntu83HziMpWctHVu9IYG9TcmP9v+5BjBVBQWmiLkj1A7WtcBzKh3tPmZUV60iz3flfYo1hZiAI3oZDR32cBT2CoxNaUSL9VJaQAYi3iFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786312033; c=relaxed/simple;
	bh=OKOseLNTFASK7Vl/6Sfy/1QOnBe/n+PfgaMGlR8xD0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tHdzNRrCepxSpINWJNWD+rtF8pxAGhJEppiRH5GwatTEIF7IDcY3AAW+YEK/bi0+MV6fOsszoLjW94vbz406loyAa0qxcpOF9NwuPZ3jpoV49vpiodAjONf/b+SHdln5M882nke4RRuZ237O1UO5qyk5GMS8/GJtRwtzfRkOYF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5+8b+vL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5+8b+vL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786312031; x=1817848031;
  h=date:from:to:cc:subject:message-id;
  bh=OKOseLNTFASK7Vl/6Sfy/1QOnBe/n+PfgaMGlR8xD0U=;
  b=X5+8b+vLl0ZYnG1KoC5J0XnND9bhYtJhqJsy76JRsAHUf5ZPu2I7FQMk
   g0FtLtmctUlxxGcBqBOMeeOrdG8d5BMSkFGjXV/rir+ptgLgp7SKTz+b3
   1VB18VXIJIFJ5TW0+1QzcnbtpcBWhUxieFXMpa06z4SoYOx8/6BlRgH5c
   oW1YpoZMakEQJYKzGOVPO2DCgYarNqpf16sTF/EFARIHiPuO7en8hi3D4
   xy+RHCvAXDHKnBMUA0EdZPz9fMI7lkTg9NCbRllsXlyfUyLguFo4thU8h
   CQC4uld7B6e2gUG3rSH3YiZ5pAXwq/jBa07ic82rcYTEt5UKMqsoPkcNY
   w==;
X-CSE-ConnectionGUID: JvBoZwFCRVmoAolHV3N+qw==
X-CSE-MsgGUID: 5c6oBx3rSC6bDsJwvyFIPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="112374627"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="112374627"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 14:47:10 -0700
X-CSE-ConnectionGUID: Lx+lfQhjScG7fHSPggwmtQ==
X-CSE-MsgGUID: yfVuDf67SBaAMd+ldpc2Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="292785092"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Aug 2026 14:47:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtBMJ-00000000MP8-2rSv;
	Sun, 09 Aug 2026 21:47:07 +0000
Date: Mon, 10 Aug 2026 05:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kbuild:kbuild-next-unstable 23/23] WARNING: modpost:
 vmlinux: 'saved_config' is COMMON symbol
Message-ID: <202608100557.YFtThHTi-lkp@intel.com>
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
TO: Jani Nikula <jani.nikula@intel.com>
CC: Nicolas Schier <nsc@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable
head:   bbeb002cdd3772d1c0156ebd2ca828a2d61612ec
commit: bbeb002cdd3772d1c0156ebd2ca828a2d61612ec [23/23] modpost: use mod_warn() and mod_error(), clean up logging
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260810/202608100557.YFtThHTi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100557.YFtThHTi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608100557.YFtThHTi-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: 'saved_config' is COMMON symbol

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
