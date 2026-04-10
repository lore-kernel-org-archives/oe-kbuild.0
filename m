Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87273314A73
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 03:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775791808; cv=none; b=uo/ghVGijZFjOPDJeSSlfImNDpjK0vS+BBEjG+z8snQOCyFJt6bqVX6RUDWBG+pOv5uMNh2ZZYl7Z1JgtfxpVkppBIS26UE6A5b1bgEuLqz8hIj+atE6oh4kGVaoRKs/0dKzX45jrKEDBBrHwejtyjAxkYbwuf8YQUiO9C8dGnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775791808; c=relaxed/simple;
	bh=QdbfWnDBRI7HGgPpnd6UyjWYnjE0ijY54gou9Ah37hA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FoGIFMrOjpX6ko8qnMD3fmT3SpIrRPG3OkZj8A0degvwMFu7E/F1eR5tPcn1HLP5eBnamNiRRQfKxfQAth5uP0+GSFo+tRKmyrCxAzWmOV4Y6tqdqLX58QOqxuqrKRi/zV9YujWsQAbFmJGDRK5oFRgI+ngO0yU6I1Hat3p/X5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OwCViITI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OwCViITI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775791806; x=1807327806;
  h=date:from:to:cc:subject:message-id;
  bh=QdbfWnDBRI7HGgPpnd6UyjWYnjE0ijY54gou9Ah37hA=;
  b=OwCViITIDB6/iYdzyMOSRRsrWlaUHzdCZjVjlIYQ3N+fBCvQLQqZRa2F
   3mqOUwAc9l99N+7AGPrxMecP25ooZKsH6/h4p77OiapHolp/w38dMsJlX
   inEtIDHC2IstaVbWure0zzP55X6y5Hajmy6HLjtFtuM1GtiphoXfVVwWF
   xaB8UB+sJKu1VTBshLhu/wRVqSItY7krqRuNGU/uxF2Ud4Ah6ksoCLXB/
   RVIsTK0y+Xd+dMB+Gxulxc5BFEcDfYioiFKH+uUiV5NVQxb62Z727M1xf
   nyIIpmHzUZvNQ9s9Y24y0Vb6cibCliKNB+YylW8ZgodSGO6exasA8dTAh
   Q==;
X-CSE-ConnectionGUID: R6roAq/PRXqNHMTs95tnUA==
X-CSE-MsgGUID: 86NK4K8URBiOc2G+lBVzvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="99438239"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="99438239"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 20:30:05 -0700
X-CSE-ConnectionGUID: pn1xGtKJTYKvvuR7aRW6xg==
X-CSE-MsgGUID: Sw+bapxyTQuaARne3kiPCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="224223101"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2026 20:30:04 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB2ZG-00000000Amr-0ZpJ;
	Fri, 10 Apr 2026 03:30:02 +0000
Date: Fri, 10 Apr 2026 05:29:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build-arm64 36/39] klp-diff.c:721:94: error:
 'prefix' undeclared
Message-ID: <202604100546.vfNgSqI1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   74681679b950d923bcf7d8f0ed35c447c447ec61
commit: e8ec3435bfebdc5dbed148c4f946969632005897 [36/39] objtool/klp: Add support for __patchable_function_entries
:::::: branch date: 75 minutes ago
:::::: commit date: 75 minutes ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260410/202604100546.vfNgSqI1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604100546.vfNgSqI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604100546.vfNgSqI1-lkp@intel.com/

All errors (new ones prefixed by >>):

   klp-diff.c: In function '__clone_symbol':
>> klp-diff.c:721:94: error: 'prefix' undeclared (first use in this function)
     721 |                                 data = patched_sym->sec->data->d_buf + patched_sym->offset - prefix.size;
         |                                                                                              ^~~~~~
   klp-diff.c:721:94: note: each undeclared identifier is reported only once for each function it appears in
--
>> /bin/bash: line 1: tools/objtool/objtool: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
