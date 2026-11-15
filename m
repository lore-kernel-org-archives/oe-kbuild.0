Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794763343;
	b=5b/83qDuQiGHYt8XB2+oJuTnAubvWdO2cZr5TSvvx2+gEvJWP09unSqT747+ZlcKFPU2
	 6FlTHPbDqvIgGBkHMrnqM6qFoRG45E0ynSkMonHb2/9NbpD/MxSxo7l7qa8HFBc+h7fTK
	 GPiVRJAIiuVYSuoPGwHcSERBeRtuR9p2mUEDbUoJcLpAT4xqzDYEuzuSiKI4qRLLQ0we1
	 5CxjJ4ngxpL1H4tQ6W4YIj7UPhmLP+Qo+8dXBSQp+yfKTnm0IYmPmTfiJ9D/TpRMexYjg
	 cWxtLQxze9C3jnFqK8E4QQhCgO2yXTcCq3HcO59q3RyTr3sClgDLZtx8dLC4gNYcjBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794763343;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=95c1ykBuZ1LjrMGSGuYGtuDpwhJQD0BZ2C5uJj1U8Sg=;
	b=f5a77W5ifmEoWi7oBm8SnXvq/rCu9JmpyxHFAmUexorgrwvN+09w1wTLNIr6BGuzSgNT
	 g3vfPgQwvWK620IhDLGU7ro4ZRrhZb1F9587yA0OBniqtvLlNahlWFzKOxu1Gw8hhczht
	 5Sz6CWyn8SC9SKfxyMI+FFCagEaI3y/H49hJ/WWfsgHVGC9+RU/0S6rta3AlgRj5dkG4T
	 hTyC/EbNDHeiEGWWsaHSlL4m+IYqPCIN2z6vEfFzIKuDEaq8fjssbVzkrCRK+4iqKOD3H
	 3DGPYwowwMj/GNkySr7xcxYisYStec933JFXvhZVgO47LfH1OLGyFsMBCJM1ri6EpiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iFLoVhQo;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB4D606A31D
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 17:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEB4D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iFLoVhQo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794763344; x=1826299344;
  h=date:from:to:cc:subject:message-id;
  bh=CaYR9QA/Vj9AtK79CqQUE7MAewWTJY55Gn4tuoY0tI0=;
  b=iFLoVhQo6aOH9V22qPdwR8z3hGmyQ4N/Xx+sBqHJlPMxCS5ITcOofK0U
   4phC5T7ZOcBuWsyLyLVtLK/ofg5RUhZr68cGOm4PEUaaWCEQvr7VC6iZ8
   DFcgqcD6p2OautWIzdcWrcdZgSVejMIOZnbOKJE+7QDn+eKeBcnWbua0x
   Fy1HAK9jGQlQyk6vJ3nVSnly7MM1FwKcDZyyiGRXbAPadPbnj8TYVyEb9
   +JTqYwSs3xbvpWFzXy9k0j/MGg9PdWZxk8eMV5H/NBnbTI9yjV/LsfjJM
   oAcVkpElqtQizGKjuVhozQObO0TS0MUYJOP5rBr1azOEKQLBjwdCuZzn8
   w==;
X-CSE-ConnectionGUID: 1szGUmIhQSiq5SblOSYP1w==
X-CSE-MsgGUID: brxKKIBVRQiar5jOEu0abQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3583245"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3583245"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 09:22:23 -0800
X-CSE-ConnectionGUID: iGvsbODrQ3aZTuttgpkZIg==
X-CSE-MsgGUID: XQwcSo6wSJ2bG17kUJ30Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9611866"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 09:22:22 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSdvn-000000002L1-1jcC;
	Sun, 15 Nov 2026 17:22:19 +0000
Date: Sun, 15 Nov 2026 18:21:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: unknown target CPU 'la32v1.0'
Message-ID: <202611151859.Hxbe6CMG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/56/5643c6b2c8308b206cb01cbfd0e6ac80f9f1bc9a-reported_build_error_fbc-error"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 5643c6b2c8308b206cb01cbfd0e6ac80f9f1bc9a LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
date:   7 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: loongarch-randconfig-r2110-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151859.Hxbe6CMG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151859.Hxbe6CMG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5643c6b2c830 ("LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151859.Hxbe6CMG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1 shuffle=2779785399
>> error: unknown target CPU 'la32v1.0'
   note: valid target CPU values are: loongarch64, la464
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1 shuffle=2779785399
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1372: prepare0] Error 2 shuffle=2779785399
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2779785399
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2779785399
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
