Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885921;
	b=3Ac8YYUcH7+JsXzU0IoH6F4pwglHuO/KWgbigbNx7hvqfRTASLMJ236W2SEo+AwpTmNY
	 Bh5LkqqOI6WGm1oyvHG+n563jo/u4h7hZXHHsw1Fe4ou1knw/+UuejS73+CtfE20cGtLa
	 lNq8bAG3wU794hHJfBt+vp0DKUVUXlIA5jfSb5zuMqb4Bg+nLhaAQk/cFjnEhjsxTNHzW
	 Fx4GOlb9bX3o7iRbA30mRoi0Y27qGt1W5yJWD3Rv9W555jVCQuVVgI3xJKjB8uPUcf3kq
	 ddBRPT/8Vq9tcNW0spDfrqrmWyg1VicU9svbmFe024QaSLrxjx9SVJ3KwP/x0VF6CpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885921;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Z0zinuPBoeo1mvOo1jI6jWDqrhCOa9NXgYjZCJZwllw=;
	b=uYOPRO8FTdk1YjywpgWwV0cR2LHfx9r4f1PkD98G7SIO9fV6m2K2IvDiYqusHWsg5yFi
	 1FVmyYV8uOTsv+BFzoc9UVY5Mx/seEMcpMY1CAO/JXCIWlt3d0YR616+7XjZM3oVv5x4p
	 2cc65JsSTMcI/KuCtSh4DMXvvoYmQ3qi64hqKcg72LQjSDHC/7e6kFNdiJLrrw89ClKYr
	 lUHNNl8k1i4qJvYsF47J+HBYhsJG/0X3T4oQ72pGj+X2fMZRisiJZeN9OpeuupbWqRd8x
	 PAxREdWU7mrlPTEd86SekPd88XUrTBpI1y5cYApN/Uoozf7JIKTrm3uBnYKG9si2DzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czAV1MZ9;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8D606A323
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 03:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A8D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czAV1MZ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794885921; x=1826421921;
  h=date:from:to:cc:subject:message-id;
  bh=iPud60QO42hE+OMxFfqnvcblgnLTnyCBaU5w2xbAp2s=;
  b=czAV1MZ9oZvtlJ1fJVOu4X18ERkmW0SIrrC/mo4PxETkuUr5gngk/o7s
   JAq0tQVfT0BwVJEXrrQAiTxRuZ90wLKBb12Nc/q5ti5Fug20D1HlQXldf
   zHC+ls5WiJtGPTyQxBuJpoe8PtjKmdpkHapNW9ucm3TTy4IumDrVFt8BM
   FQKd7QBVQj/gGRO+i8ksddnqDRelebG3vaZ4KjeuFuy1lm3WowgVFGJAs
   IfgIorV9eFoVNCqPjdtmd68RZotzafZhe26V6xkxhXr6k8JSPYq9E8dX/
   Cof6c+m07bbdxN61mtQmiLeOY2ri34EPCpHFF+l1cWAr5+IQ13u/XMcS9
   Q==;
X-CSE-ConnectionGUID: bMvjDSCxSdys3RJznNqFow==
X-CSE-MsgGUID: E6kXQGwwSI+wpiYzGkWqkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3679647"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3679647"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 19:25:20 -0800
X-CSE-ConnectionGUID: gkty8DAkR8KPMPjbx+lXlA==
X-CSE-MsgGUID: fL7vzUlRR8S917yjabaBRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9641010"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Nov 2026 19:25:20 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT9or-000000002x8-39zY;
	Tue, 17 Nov 2026 03:25:17 +0000
Date: Tue, 17 Nov 2026 04:24:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/inode.o: warning: objtool: iput_not_last+0x30:
 unreachable instruction
Message-ID: <202611170445.blGaHJLw-lkp@intel.com>
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
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mateusz Guzik <mjguzik@gmail.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: aa8aba61d4e17e23ae048098b81f65840a7d5722 fs: assert on I_FREEING not being set in iput() and iput_not_last()
date:   12 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2302-20261115 (https://download.01.org/0day-ci/archive/20261117/202611170445.blGaHJLw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170445.blGaHJLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: aa8aba61d4e1 ("fs: assert on I_FREEING not being set in iput() and iput_not_last()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611170445.blGaHJLw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/inode.o: warning: objtool: clear_inode+0x40: unreachable instruction
>> fs/inode.o: warning: objtool: iput_not_last+0x30: unreachable instruction
   fs/inode.o: warning: objtool: iput_final+0x84: unreachable instruction
   fs/inode.o: warning: objtool: iput+0x6c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
