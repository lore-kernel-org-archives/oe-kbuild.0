Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B25392817
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 03:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495799; cv=none; b=Irypp9db4NE9iAusC/vsFCzijiZKnRoSR08DYpP2hbkVW7+khgVjqDhPQM/vwI2qYFRWJGitm1rXAnuInSoTG6meuMZ0VgvWqo4vg4qs+jO7oXXprLUDzZ7NRkj5H1jyJKt80Nz1W7BU01UHsgYwNXFPqEeAPpNRFRxDUgx97xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495799; c=relaxed/simple;
	bh=US73AgaIWdPJ+40qQEYjME1EUy2ULO9Wf4q6tLA1se4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hk79SQossdF6o6UFG7YxGL0qvCSYIC33ZIbTYTlDu8Q/5cETWcrQGFKB5v2GxBlYYcalG7JpDYY2wqBjH0tHO7iXQDHOOpj1K3eUR3xxtU7mkrVkbcubw4IsB5sY8HiMdGP8xGYssIMR2E5Ed/lPY7tsl6bCZJAjZiONwBBWsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpqivTXK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpqivTXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774495797; x=1806031797;
  h=date:from:to:cc:subject:message-id;
  bh=US73AgaIWdPJ+40qQEYjME1EUy2ULO9Wf4q6tLA1se4=;
  b=HpqivTXKuaurESmhyJCFji3SVrZSkMnTwEtE3ZJjDKV8UKYDUdl0T18l
   C6/rUMkCyr+xyK4+OCeJPGCsSiVbcpCcSm1GrL/7RlfEqlZOZbVpf13ID
   lXQQ/js+G0Ybu1iel0jd1YjAsqT+G6g7G/qhOxfrlcpUrTW27nbfS4pgT
   V3/fmRITZxxdfA2HKk/wvEKODGVOXhdUOGhO11a53SDJPCUMJdLpIxkSb
   J5PVOKL+sqM/iosBrMztaiIiHoKImCcjwuXCOLCEtNVYOB6eM+IRlpSJg
   ednUmlzh1v6svy7RUHngBFCElR5+P6fnudfaSo/JNj9iUgWFXosadRJvu
   w==;
X-CSE-ConnectionGUID: OS7197ztRvmdzNRGkVAgjw==
X-CSE-MsgGUID: tE0XGLTMQgattb6Sp9VAEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75659882"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75659882"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 20:29:56 -0700
X-CSE-ConnectionGUID: H0p7yehMQWaxUK/Bfc66OA==
X-CSE-MsgGUID: +YbPccZuQamsv+EOR3dDEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224898228"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2026 20:29:55 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5bPs-0000000084J-2xPq;
	Thu, 26 Mar 2026 03:29:52 +0000
Date: Thu, 26 Mar 2026 11:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pinctrl/uniphier/pinctrl-uniphier-core.o: error:
 objtool: uniphier_pctl_pin_dbg_show+0xd8: can't find jump dest instruction at
 .text.uniphier_pctl_pin_dbg_show+0x164
Message-ID: <202603261149.IqJxHMOs-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0138af2472dfdef0d56fc4697416eaa0ff2589bd
commit: 1fd1dc41724319406b0aff221a352a400b0ddfc5 objtool: Fix ERROR_INSN() error message
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: powerpc-randconfig-r073-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261149.IqJxHMOs-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261149.IqJxHMOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603261149.IqJxHMOs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pinctrl/uniphier/pinctrl-uniphier-core.o: error: objtool: uniphier_pctl_pin_dbg_show+0xd8: can't find jump dest instruction at .text.uniphier_pctl_pin_dbg_show+0x164

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
