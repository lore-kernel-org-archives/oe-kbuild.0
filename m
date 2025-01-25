Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC8E1EEA43
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 02:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737771064; cv=none; b=lP4XxVPkBF+5PEMrDVpaJ9jr24S+prCT+/Hwzc4M4sxJzOjsGPEKb0jNwF4u1U0X7zkXkFFV63uWsTMIVAtZYxt6BAOmK4AN19/EC9BNHXjZHl92RSO6eekneNZSVJFn9/+lvmyHgh7LD6pUAhxsDNCwDmfODWn1ovPqAWww4Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737771064; c=relaxed/simple;
	bh=6/CgX9GcdzSY2WLtZDRZRkB43TwW31cBqSaaPh3OHaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qYAE1nV3K9x5ab2tDzBLy98l6pNsILOmyg00CmQZeTpZn2tCtV6q0vpYIzhdlt57ELkBKfSm73AMPMm7x6T6T8pWhccSzIR8hVg3Ew3VadSw7DAZj40MalWk1pmi67QGSbgITf/IwfKSCVnEm5+7ewyeKSKirr2gHtkTO+H5qpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFHuFGNb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFHuFGNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737771063; x=1769307063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6/CgX9GcdzSY2WLtZDRZRkB43TwW31cBqSaaPh3OHaE=;
  b=dFHuFGNb95fGjB3wFk73skZWl1ktX+XvDMcgF8ctxg+tg9L0X/XH7/DQ
   gAYuZuxeMJsG0+p2eIqxaEDnTYusKDsgOREbPfJdiUdRyutq+VQALMMhO
   Wt65k1Bcz250gxbQuYKTPILWHTYhvIl3tRhe6CrnGW8QJQ7EO+0f8Uaib
   STlbPtIH76hRDyDkm69/Ym3jyhWh5RgCBOVNdA8kkHfmRWNjxYiOuhnEE
   MPsQGckeo8ZagyecJ1EC3vcVeZ+bKlneV2XXkOTiqmZaP863FGzNSbZPv
   JGJz5YoiKb5PIUssVp8kPRQJksGlTfOy99pqgaT3ivycEhLIQ4Amw9VJB
   A==;
X-CSE-ConnectionGUID: nqq6p/GLRUeanzHayy9Pfg==
X-CSE-MsgGUID: eK7L3eFpQKShL8fhltxJyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="55733061"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="55733061"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 18:11:03 -0800
X-CSE-ConnectionGUID: DUIF0KUcShmXosexf3RwKg==
X-CSE-MsgGUID: wP7n5K8pRkaq1RXt6T6/Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="138797756"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2025 18:11:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbVdS-000dNR-2E;
	Sat, 25 Jan 2025 02:10:58 +0000
Date: Sat, 25 Jan 2025 10:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/intel/e1000e/e1000e.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202501251052.B9gUbLQ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "objtool: .discard.annotate_insn: dodgy linker"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b46c89c08f4146e7987fc355941a93b12e2c03ef
commit: 22c3d58079688b697f36d670616e463cbb14d058 objtool: Convert ANNOTATE_NOENDBR to ANNOTATE
date:   8 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-buildonly-randconfig-005-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251052.B9gUbLQ6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251052.B9gUbLQ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501251052.B9gUbLQ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/e1000e/e1000e.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/net/ethernet/marvell/octeontx2/af/rvu_mbox.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
