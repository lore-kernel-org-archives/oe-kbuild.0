Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB837383C93
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 19:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552438; cv=none; b=ovSyCKkqliCiJN8D3LILeJu8Dr5Tr6s6Hnyr910lI7qHvSiyDlsvSPEqFFaDvMqawtwXYqOPlWAmiROI6MPXCs9W2XYk4pFsLlYxGURhaKP4Ej74jEgAeshoL0/3a/4GiwkYZiEt9IFvUlCJqkbMQD2wjRlPVVAfz6KngEiTGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552438; c=relaxed/simple;
	bh=jtEfT2hoEjie8IC1F/o//JXmTaGCz5BUoHDP+s/rprc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TEKpMu0EfOe2cTGvL1PMZwIhAK/6Px/oNVTjCvDpIqWT7HWHQwizhVm/NKW/FEsMrfUIvuDTX+sH2WdGhimDRRVmCGRbxxApXXscIa9Zeu8QsR/ejuQvTbmXvtTJpTwIcK27jmKEXc+8j7UAUS7ObFTnVckdHpk7pMgsY+1KuNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gL2fMP0k; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gL2fMP0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774552437; x=1806088437;
  h=date:from:to:cc:subject:message-id;
  bh=jtEfT2hoEjie8IC1F/o//JXmTaGCz5BUoHDP+s/rprc=;
  b=gL2fMP0kqgo6V3RAz1+t5DgzmLyw5k5xKEJ6cgWuRhgB+FNtT2DIA4NW
   nCow/yDX077zPANqtmIJmPwvTaHDnbFTmCjezY0Ja/iUoXRw+mNC+voBQ
   f8L5WjjVyX5dkWH8RTvtNZoee0qZVnIJDm5q42Gp4QyIkChK1KOrxwN4Y
   DfE/cA374YEqudic2wkRcCmNdgr/WbkXOPLTPoua4n9538YdFUp9bedle
   xmcvqe3QbSkYDWb1nmhMSKdz92qpK7ws2vEnWdNxNG3Vg+jCOVQIZzpE/
   x+ShVB5xhlj4qOkzH54PUMIwhDlbREKq0vBx9LoR7b/Jx5ih7IQq1JRku
   g==;
X-CSE-ConnectionGUID: cUcmIGj1SBe9fiBYkcuAdA==
X-CSE-MsgGUID: aPNsQzNpQ3iwiyJWO9ZTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="63181168"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="63181168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 12:13:56 -0700
X-CSE-ConnectionGUID: tSBBnBRESluTGXOGfYxFkQ==
X-CSE-MsgGUID: 1cmDj/n9RMqCqZOLLS8TeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="222183337"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2026 12:13:55 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5q9R-000000009FX-2bgT;
	Thu, 26 Mar 2026 19:13:53 +0000
Date: Fri, 27 Mar 2026 03:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/cec/core/cec-adap.o: warning: objtool:
 cec_receive_notify.isra.0+0x69e: ignoring unreachables due to jump table
 quirk
Message-ID: <202603270311.Jq2uYJ49-lkp@intel.com>
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
head:   0138af2472dfdef0d56fc4697416eaa0ff2589bd
commit: eeff7ac61526a4a9c3916cf46885622078ad886b objtool: Warn when disabling unreachable warnings
date:   1 year ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year ago
config: x86_64-buildonly-randconfig-005-20260327 (https://download.01.org/0day-ci/archive/20260327/202603270311.Jq2uYJ49-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270311.Jq2uYJ49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603270311.Jq2uYJ49-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/cec/core/cec-adap.o: warning: objtool: cec_receive_notify.isra.0+0x69e: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
