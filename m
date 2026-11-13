Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591866;
	b=KqTEqyC1QMyDXES2nHOZdUOj0GNELJ1W1aHUGdzO/3xcKo/ePL91tZMYPUHmqGf0vxZz
	 kWwCPHUro7T31tA1GeBtydDpsmIXMiU56G4/RXEYIc1ZKU3YXf6SCcAXQGIDN29713wyK
	 l0srxbePRavwZcjl+K98Atg13ZDtgpUlS1mNOB2Q4uIZaaCLXBfSdoFAu5ICV+3i5vddh
	 q7SpcsoWRpnc2FkF+5LhGMHU7nFSXYzqA86bdM6TOxCeVcGRdDm7fRc2AGAChpfUkLBC+
	 6mqi6QQHOATh3/llYbRmaXfxqZYaDmnkCdKHdepPXpJp6i8mO+An0nuNndu52L+1Twg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591866;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fj5gAQ/Xhhb8WMk1SuGWj6eKlQSVZdOyVj4xNFDS+zY=;
	b=yrRDrW+/hOpP6RX2/w1DQ142YsXH/f1bbSzf6jPwfAxbho/JSGzpBXjEiJ8x4rDjR8IS
	 cvmUJQ+cGchosi0HvvM1EVyR4ILi+WwmEyyYdlb+XrvxY24Vu5qJCdERSHJtPA7tpjmoN
	 nbu+vvr9RuFdO2IkOC4U7iAl/RMQ/7iboTp5vepKyUE2IUi8LiUf8P57DvSARirQVS7I7
	 QZB2+oi0xKiIGIOLBY4hLmeJjiQQK3JDLTQGI4TOvTZm+L4Tvem/QoJoUFa9EkLDFiBXr
	 FdFqWYKzlL/g/EGBt+Ag8qh2yBgJgBsDcRRLbHDt6IAbFGvLpy+4gJGTxds21N7IW9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ccZa42Ek;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF92A606BD22
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 17:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF92A606BD22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ccZa42Ek
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794591866; x=1826127866;
  h=date:from:to:cc:subject:message-id;
  bh=X5sobAmIT4TINGnRJRRoeh1xq7bnIT3Hlxk6ESKPXmw=;
  b=ccZa42EkJhh2Cl9S7LNdv9Zs9u9bftB1e5GqH4GHFDMv33PMKfJlTyyr
   +Gz590rUIlh63L3wY711r0sKMY+lwD/lr1gycOuWlLN23Q9805JuyrEXb
   Qwf32B/rNxEIQdzUy9whMf2V8i5UuEALKh2+0so3mrhtPsQDKZH3PxyEq
   C7dpcT5gEuLE4mSNGd+BWWjpad8SufmuCDSqy3aqTcXhQp5YXEaw7iynx
   rNwXbfS3FQKSQNcYpnkTqZtSMhebKusemaRsRv3REJJwsEzmHl3vZNcd2
   Wi78mU0544tKFcVnAAYlwsI4PowvlyQr7SpzXxFJ/du3xth7AIbcD7paq
   g==;
X-CSE-ConnectionGUID: 7rIbE1K9QQOS9NyDtnTHJQ==
X-CSE-MsgGUID: 1W6Ym3EsT9OW60Uib9p5rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3415980"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3415980"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 09:44:26 -0800
X-CSE-ConnectionGUID: h+nm5qvZSgutnNDf5eGk1Q==
X-CSE-MsgGUID: whL49O8eSkWoI+LE8d5eQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9291364"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2026 09:44:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRvK2-000000001Jj-1EDq;
	Fri, 13 Nov 2026 17:44:22 +0000
Date: Fri, 13 Nov 2026 18:44:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/vmscan.o: warning: objtool: folio_objcg+0x68: unreachable
 instruction
Message-ID: <202611131818.eacJjgEz-lkp@intel.com>
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
TO: Qi Zheng <zhengqi.arch@bytedance.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Qi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e1392a42ea288d70a266f6553fe06f57f8647ea
commit: 877c1d0059ca82eb1e88d1f6c488dec317f7d724 mm: memcontrol: make obj_cgroup_memcg() handle NULL objcg
date:   5 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-r2109-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131818.eacJjgEz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131818.eacJjgEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 877c1d0059ca ("mm: memcontrol: make obj_cgroup_memcg() handle NULL objcg")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611131818.eacJjgEz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: folio_objcg+0x68: unreachable instruction
   mm/vmscan.o: warning: objtool: page_ref_unfreeze+0x60: unreachable instruction
   mm/vmscan.o: warning: objtool: __remove_mapping+0x5c: unreachable instruction
   mm/vmscan.o: warning: objtool: shrink_folio_list+0x400: unreachable instruction
   mm/vmscan.o: warning: objtool: move_folios_to_lru+0x194: unreachable instruction
   mm/vmscan.o: warning: objtool: folio_isolate_lru+0x90: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
