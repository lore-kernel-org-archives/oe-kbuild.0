Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792060;
	b=hZvynDFeLkrnJgkRRojjTMckNQz0d7NYilHTOGOy2iG/aKPqfT1Q2S5oreVM69A5GsjG
	 McVtf/2zKBgnj4huevHN1XStXlMbOY5Nf/XoEFmmV/qn7XYGBvbFqGR93QBbjEtFa2w90
	 3eBkzra/ErFB0i+dEIHvCXZCuG1twFmoVIy9vvKv/u8F3ZBr07dLiB1/vGTEFm/CKD6H/
	 o4i5wTf6r7DxZDnaj6JzqO8seKkCjI9r8nb2PsNY3uP7df5DJV1DzJedJJMVLfH7y6eKq
	 +m8qibfsV6uWzBEaD1BCD+w3b5SAbS7CakOBvi202NJH3ITs5z+jWHD0aog1BbCnXVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792060;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=i2fkbFAeQe8OqZetnVPyp1xeCm/SfU4O0S+1fCBaRkk=;
	b=kmpDqic7e+8ncYi7KlVMYBJobTb/A50BfBtToO9OKzxGN9uhgYNhPb1BHkJStQLGKZ8k
	 JqqEbsUWgJ0UyF3xwZOge4r5p0CCU/YEC/HVGNiYpWu90G7xzluv+9NWxod2Ba4SGMGCh
	 KavCfYnJNma84A6Fzs/XqAJ2i+MoXN5uJO3Bm1+m2Mk/L5k2GRw9ze494fuI3qePg2ZCU
	 K45uRj5x+TtVkWSVRzuKxCdHP/Mqf4b49a8/I/YxqOOgkDvKeaBNjnaQvOV0Az3oEDB3A
	 5/R1sAXmMxCEFw5tCul79Fo0W+WEgsXEmsCo0Iu46lqiTGuwuf8Y6EVmlb6HrdGxqlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="D/0mOxHw";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C69606A31C
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 15:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01C69606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D/0mOxHw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795792060; x=1827328060;
  h=date:from:to:cc:subject:message-id;
  bh=nWeP3nqJBonGMcsfiCm6lozIMIludIzKr3IE057X+30=;
  b=D/0mOxHwM7XUOIUnUMVKovea/fi3rwB8rNOMA6JZlPithIf1abmyGVZq
   GM/Q8853oKDBdhrfdo3YRY9neL7DzeNP9CSBhZLLy/o4UvylL45/3nXF+
   IW3dK9Yb3ulasqGPcKoTAs78djnLZq3sVK4buLU+JjSVotxGZhDmEr+rG
   nxvnwFP/gRjwJ8FmZjN3kCuF5lOesaVirIbJImjSav2hzpQCUqH+Ul6/p
   5uDHjrSQoA5eA+Cz7n3sGZ97KtguOKYZQMXCe5h1eGastR6HuSznUyQWk
   pFcjzAKrl4i5DIDX8arw4zSpa59Y+ALFq3aq0muO6bdie14DIK7BWLryK
   A==;
X-CSE-ConnectionGUID: ABS0+lKLREiQ7H6APIT2kA==
X-CSE-MsgGUID: u6ZvYyziSgiT9j2IF6fJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4617377"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4617377"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:07:40 -0800
X-CSE-ConnectionGUID: WoejaUcEQba32qQwwEKXlA==
X-CSE-MsgGUID: sKfkpBrURoWCQK9f5OQvjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12738538"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2026 07:07:39 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWxY0-000000000DD-3L8H;
	Fri, 27 Nov 2026 15:07:36 +0000
Date: Fri, 27 Nov 2026 16:07:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: call to __compiletime_assert_584 marked
 "dontcall-error": FIELD_PREP: value too large for the field
Message-ID: <20261127160154.ZkK2aY8a-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9437ee8b6cf607e883b36e44bd755968daaebd48
commit: 2b358510d5cc56164f83110ca1499c95a5a352cd kbuild: AutoFDO: Update split machine function argument for upstream rename
date:   6 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-r2300-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127160154.ZkK2aY8a-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3a9f981aab0cc32f74ffac36a87891cda8889c37)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127160154.ZkK2aY8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2b358510d5cc ("kbuild: AutoFDO: Update split machine function argument for upstream rename")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261127160154.ZkK2aY8a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_584 marked "dontcall-error": FIELD_PREP: value too large for the field

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
