Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B4D23EAAB
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 19:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767556346; cv=none; b=QpuybCxQrXMJ3FACvuXH1oz5U9ZKpQq8WWZWrO2cM8Ay58oP0ZXWqw6cJsXH2GdMpq6lTocz7yMq8qioA/y+ujXc+XHVWsmi9U741r8oC6V/E1ULHrtqtT7QIcg8uyuX/yFStJmAIOXmZZdbhwFwrcHstY8KlgsTQOZLE5M+WDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767556346; c=relaxed/simple;
	bh=QccMCPe0QB8OQSsJLI4K8eic17GQSpTTYIpyDnIxvbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O6EpeIqOVoHa7+ivdyEh9tfM8cqgyP/JeIyN2mJECK7QBY50K6eysmP90IjiKn30j3nBPxbdZu7Ayo0PuEqpVuSaqc0bKveYe9a1tztHI0/MjTJoLGQeFdi7DAnhQh2savsdjvuWrnqZwvYtvZl47R7g0nqkS4VJTIcsMKHkyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jm3FfAuN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jm3FfAuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767556344; x=1799092344;
  h=date:from:to:cc:subject:message-id;
  bh=QccMCPe0QB8OQSsJLI4K8eic17GQSpTTYIpyDnIxvbY=;
  b=jm3FfAuNzuWzU/NOZHOqQS/ZdxPrn1VDDRC2u7rF3ES6lnbFsApAVPHO
   NMZodev9DhMsR/QMjJT8ul8oORhY4uRj1EoOf+GDxNjbcu5Pyxnk2tNek
   dRRw6MPm5NThrkCoTkyHcUm2d5HE9mbgI/hOFyWc/Z/IDkZLdfh+4gUtk
   4Rdg6ef7IBLgglwMEAn0cp77m91nQv/zuYKspxNbxgtfKt175TgZT4HIF
   ua8F3R1rPt06JtUDe0AAWs4D3VdlQRo7VGQW51PO1a4pdiXoX2t4YLKCM
   0u8Wrw7Gz+W9Pn+RnoaJ50l/5h3vPowKWnJrRM1vrj2WsjzmQZvQIZZuN
   w==;
X-CSE-ConnectionGUID: xOwOmBVdQLG2ThGxrir88w==
X-CSE-MsgGUID: 7pKUlmZCS02YiJQHj0WfXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="56499105"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="56499105"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 11:52:24 -0800
X-CSE-ConnectionGUID: tx/UjV3KT1mPA1mk7sJz0A==
X-CSE-MsgGUID: f5qtAnSDQbe39S3eYyUnmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="232931102"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jan 2026 11:52:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcU9E-000000000kb-2Idt;
	Sun, 04 Jan 2026 19:52:20 +0000
Date: Mon, 05 Jan 2026 03:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: error: objtool: mce_read_aux+0x70: call to
 smca_extract_err_addr.isra.0() leaves .noinstr.text section
Message-ID: <202601050339.PuekkHsQ-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   54e82e93ca93e49cb4c33988adec5c8cb9d0df31
commit: 4759670bc3e670069c055c2b33174813099fea4f objtool: Fix CONFIG_OBJTOOL_WERROR for vmlinux.o
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-001-20260105 (https://download.01.org/0day-ci/archive/20260105/202601050339.PuekkHsQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601050339.PuekkHsQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601050339.PuekkHsQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: mce_read_aux+0x70: call to smca_extract_err_addr.isra.0() leaves .noinstr.text section
   vmlinux.o: error: objtool: __ct_user_enter+0x4d: call to rcu_irq_work_resched() leaves .noinstr.text section
   vmlinux.o: error: objtool: 2 warning(s) upgraded to errors
   ./tools/objtool/objtool --Werror --noinstr --link vmlinux.o.orig -o vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
