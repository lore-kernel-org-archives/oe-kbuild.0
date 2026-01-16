Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BAF2222D0
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 20:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768593740; cv=none; b=G9Y5Nz9Dfclb0ScSPMuCCmgys1EDk0ApHSexPPN63kTBz3T7GdtXnZNiM8qP5W0MrCl5kHUUxLBbl4+Ead5uCN7MwE13iPTQ3e6HXSNeCmXzEN7LcQ7ca5KgRYG3Iqgj9hVdsoXj/F+RgXQ8pTQWazATE07EkV/fhcCHnCj4xpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768593740; c=relaxed/simple;
	bh=chn0OI7hqR2zWGINu7lSC3dAUQ0IG9vQV77CH7BaCo0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eG5yFZyPBisfazSWhjbeY6hZNMvjqMJnY4I8c4ZBLmCGw0jdZJR4UlqVXt/fexKI4TukwUlDsF2SM+H3GkQ4+u+S+SPvRT+n2AH3QFWlgxPjtQdw2+f7kgGgUIytp+9GgE1WmdTXzW/ytN23xMLY4EykvlahxwLsJ7M3vIUuyaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OunwsVVQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OunwsVVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768593739; x=1800129739;
  h=date:from:to:cc:subject:message-id;
  bh=chn0OI7hqR2zWGINu7lSC3dAUQ0IG9vQV77CH7BaCo0=;
  b=OunwsVVQXb9G4dtGqCMcDGGhn+273yyJ4hrbX8IFwG470weG7oB0IUXS
   tRuMw+2cBzphHlcrwcpHseZ06tANa7qVlFZIc8bvxkG6n4ilpsYGx+0Ll
   bAiXO77U/vVT/Dl5ZBdgJU8T5ludEBDpJ+SKwTKSbdXNkmfOjLZt6oczs
   OPTDCMazrccgQUIByNIzMHpdC8ribBIxa6Ust8lwHXSg+EIMv6REw+0x9
   sdepU4RQTFl1O43fs0aG5jTtfEn6OqWYbcXlVpcstt4t/32eOVHYNltc9
   qAjBedCPC0DVApTPuAHQT2JfgHcFlwz9kSlqbPU4Gn1oGxWmlVmAYdI3w
   g==;
X-CSE-ConnectionGUID: ouqxdt5NSimF66E/gwInAg==
X-CSE-MsgGUID: yMqL9rP3R0CCKg5tf/Ju0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80552562"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="80552562"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 12:02:18 -0800
X-CSE-ConnectionGUID: p8xR2QFhTMaFWTegNIB+yQ==
X-CSE-MsgGUID: 0aFvBehXRO+1FedTfylFtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="204941959"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Jan 2026 12:02:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgq1P-00000000LCM-1Bdu;
	Fri, 16 Jan 2026 20:02:15 +0000
Date: Sat, 17 Jan 2026 04:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: bmi160_setup_irq: unexpected
 end of section .text.bmi160_setup_irq
Message-ID: <202601170341.ZHJClUgd-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   983d014aafb14ee5e4915465bf8948e8f3a723b5
commit: c5995abe15476798b2e2f0163a33404c41aafc8f objtool: Improve error handling
date:   10 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-013-20260113 (https://download.01.org/0day-ci/archive/20260117/202601170341.ZHJClUgd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170341.ZHJClUgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601170341.ZHJClUgd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: bmi160_setup_irq: unexpected end of section .text.bmi160_setup_irq

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
