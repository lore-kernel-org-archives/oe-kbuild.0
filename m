Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920463;
	b=ys5gOrTPTmOOER8MzFNDLzh8Z+drZQmKsVaL+vV/52wlx4oQqAZ3N7DgGXBjOhoYxIhy
	 2KrgDO01bDNYg4d3f+xezALkYw/bLwNBNou+bEEPoag9JGSwNAe8NQ32d55TNlRa0PDZF
	 Gu9y+Vg1MrIpAj21ySEU7/I47NEAi1bw+KTs5xdd+/MokqhNm4muY10nPftNWhx9VQXyp
	 YajYr1/KcLdw0/4tcS70TZjmYQ3o0jxMgZyCr0M9L7ox/DZKKKTsRHc0yxY8ktUkxK2h0
	 pIB5Wa4BZpBlHCfpMLM1xoTKZ2o0lCq/5q5vuGYm0eNrYjh1WsKdd24Nm2jgQFmj0BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920463;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FnuBIw9ilBPd/pVFzq04Rm0GrxsZ5RitICLkAlp4qm4=;
	b=lnqr49/HY2BWYEvtyFfUqcb3naWroAdc/Qptp9aqW86TIrmvS/rw53QOy7u9NqHkGVqU
	 YqAh0efzkKCtiRvJN7j7wX80YN0hBMUWqVwkpiVn+qJTNBOEELQ/Ggm05SSpCc9UO61YT
	 SlpX0j2UBM+xS0yFv42JtYPT0BvLna9eCEiia5mPylPGn+qcfqHpDM0X6unIDCwwybLct
	 Njm1rzLLMY8VsQEKfAnjS8iraBbon7JgGns8j3IBTYhs5IGEc5U9t6p6eTV0uXBotUWGY
	 O5n2ku4eCuwZJK6cud9sMt/zem8x7b5zcdy3rES3thIruILP6Ypg5dcNr4kYwI+Fmig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="h/svvwU8";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8D606A329
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 13:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3D8D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h/svvwU8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794920462; x=1826456462;
  h=date:from:to:cc:subject:message-id;
  bh=2UX7kE+bkCJmO0yoTvbBdOALg4+seC15Q86/FYf3fiw=;
  b=h/svvwU8cQNrfteXvSu1FZtDGyQEEIFLhlyeubw9jp2gPTIl4DqvqyZp
   l/AEf0C0LehskK5S2/PpRuIMLAhxZLNqyEuVdAYuik5RaGjLFSgHY622N
   OqlWNvthQDlY3IusVNDcDc+oJQXz5SeFWS1KT85urPERwcs6uiJkUej4+
   t+MM8jmQtwlrDgwivZrSsQZDM0mQMrunvFJTRddmfUdgjQbXUZKcKsn20
   QmBysxENwsFTYF3LmdGMwwNVbO3L2bUrADLm377OTSa2iqWN4q75lXG7o
   LU0nu3VYZma3/NBSEa07p+zChFe08jls6s4rGHpmILWGu4RM5JhvQWkYY
   A==;
X-CSE-ConnectionGUID: KDdF0hQtRjSYL9d4X8S4Kw==
X-CSE-MsgGUID: SrpdH+mfSe+FT8UrpLCziQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3711036"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3711036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:00:49 -0800
X-CSE-ConnectionGUID: k+5baECzTue01jgQ2XpaFw==
X-CSE-MsgGUID: xKyrz0IUTDSbMFf/HwfGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9911228"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2026 05:00:48 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTInl-0000000037C-3jOg;
	Tue, 17 Nov 2026 13:00:45 +0000
Date: Tue, 17 Nov 2026 14:00:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ardb:raid6-arm64-eor3 1/2] lib/raid/raid6/arm/neon1.c:84:9:
 sparse: sparse: Trying to use reserved word 'return' as identifier
Message-ID: <20261117135326.OS3AJr1u-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: lib/raid/raid6/arm/neon1.c:84:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git raid6-arm64-eor3
head:   043c329c87cd57114635e717638bdfd0a678e03d
commit: 9e93abb5ac1e3270e5410d47de5d59cae9809264 [1/2] raid6: neon: process four data disks per Horner step
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-r2302-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117135326.OS3AJr1u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117135326.OS3AJr1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117135326.OS3AJr1u-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34484:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34484:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34491:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34491:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34498:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34498:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34505:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34505:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34513:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34513:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34521:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34521:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34529:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34529:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34537:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34537:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34545:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34545:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34553:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34553:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34561:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34561:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34569:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34569:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34577:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34577:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34585:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34585:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34593:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34593:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34601:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34601:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34609:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34609:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34617:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34617:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34625:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34625:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34633:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34633:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34642:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34642:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34649:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34649:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34656:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34656:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34663:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34663:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34670:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34670:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34677:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34677:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34684:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34684:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34694:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34694:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34701:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34701:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34709:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34709:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34716:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34716:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34723:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34723:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34730:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34730:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34737:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34737:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34744:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34744:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34751:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34751:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34758:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34758:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34765:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34765:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34772:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34772:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34779:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34779:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34786:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34786:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34793:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34793:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34800:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34800:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:42:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:42:20: sparse: sparse: got unative_t
   lib/raid/raid6/arm/neon1.c:52:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:52:25: sparse: sparse: got SHLBYTE
   lib/raid/raid6/arm/neon1.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:55:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:64:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:64:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:69:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:69:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:75:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:75:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:82:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:82:19: sparse: sparse: got hi
>> lib/raid/raid6/arm/neon1.c:84:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/arm/neon1.c:84:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:84:16: sparse: sparse: got lo
   lib/raid/raid6/arm/neon1.c:85:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:85:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:93:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:93:19: sparse: sparse: got hi
   lib/raid/raid6/arm/neon1.c:96:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/arm/neon1.c:96:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:96:16: sparse: sparse: got lo
   lib/raid/raid6/arm/neon1.c:97:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:97:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:109:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:109:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon1.c:111:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:111:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:117:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:117:19: sparse: sparse: got d0
   lib/raid/raid6/arm/neon1.c:119:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:119:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon1.c:121:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:121:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:128:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:128:19: sparse: sparse: got d2
   lib/raid/raid6/arm/neon1.c:129:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:129:19: sparse: sparse: got d1
   lib/raid/raid6/arm/neon1.c:130:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:130:19: sparse: sparse: got d0
   lib/raid/raid6/arm/neon1.c:132:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:132:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon1.c:134:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:134:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:140:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:140:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:149:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:149:19: sparse: sparse: got wq0
   lib/raid/raid6/arm/neon1.c:150:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:150:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon1.c:156:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:156:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon1.c:156:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon1.c:156:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:156:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon1.c:156:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:156:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon1.c:161:24: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:161:24: sparse: sparse: got &
>> lib/raid/raid6/arm/neon1.c:161:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/arm/neon1.c:163:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:163:26: sparse: sparse: got --
   lib/raid/raid6/arm/neon1.c:164:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:164:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:167:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:167:27: sparse: sparse: got -=
   lib/raid/raid6/arm/neon1.c:168:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:168:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:169:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:169:27: sparse: sparse: got >=
   lib/raid/raid6/arm/neon1.c:169:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:169:36: sparse: sparse: got -=
   lib/raid/raid6/arm/neon1.c:171:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:171:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:173:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:173:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon1.c:174:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:174:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:189:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:189:19: sparse: sparse: got wq0
   lib/raid/raid6/arm/neon1.c:190:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:190:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon1.c:191:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:191:25: sparse: sparse: got gm0
   lib/raid/raid6/arm/neon1.c:192:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:192:25: sparse: sparse: got gm1
   lib/raid/raid6/arm/neon1.c:198:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:198:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon1.c:198:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon1.c:198:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:198:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon1.c:198:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:198:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon1.c:204:21: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:204:21: sparse: sparse: got (
   lib/raid/raid6/arm/neon1.c:204:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/arm/neon1.c:206:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:206:26: sparse: sparse: got --
   lib/raid/raid6/arm/neon1.c:207:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:207:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:210:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:210:27: sparse: sparse: got -=
   lib/raid/raid6/arm/neon1.c:211:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:211:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:212:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:212:27: sparse: sparse: got >=
   lib/raid/raid6/arm/neon1.c:212:40: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon1.c:212:40: sparse: sparse: got -=
   lib/raid/raid6/arm/neon1.c:214:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:214:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:219:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:219:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon1.c:222:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:222:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon1.c:223:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon1.c:223:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon1.c:224:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon1.c:224:9: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3131:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3131:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3138:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3138:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3145:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3145:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3152:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3152:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3159:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3159:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3166:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3166:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3173:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3173:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3180:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3180:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3187:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3187:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3194:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3194:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3201:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3201:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3208:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3208:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3215:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3215:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3222:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3222:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3231:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3231:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3238:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3238:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3245:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3245:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3252:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3252:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3259:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3259:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3266:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3266:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3273:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3273:10: sparse: sparse: bad constant expression type
--
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34484:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34484:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34491:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34491:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34498:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34498:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34505:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34505:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34513:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34513:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34521:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34521:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34529:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34529:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34537:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34537:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34545:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34545:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34553:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34553:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34561:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34561:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34569:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34569:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34577:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34577:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34585:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34585:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34593:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34593:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34601:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34601:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34609:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34609:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34617:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34617:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34625:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34625:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34633:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34633:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34642:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34642:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34649:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34649:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34656:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34656:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34663:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34663:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34670:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34670:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34677:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34677:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34684:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34684:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34694:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34694:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34701:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34701:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34709:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34709:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34716:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34716:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34723:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34723:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34730:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34730:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34737:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34737:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34744:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34744:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34751:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34751:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34758:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34758:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34765:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34765:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34772:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34772:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34779:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34779:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34786:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34786:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34793:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34793:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34800:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34800:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:42:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:42:20: sparse: sparse: got unative_t
   lib/raid/raid6/arm/neon2.c:52:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:52:25: sparse: sparse: got SHLBYTE
   lib/raid/raid6/arm/neon2.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:55:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:64:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:64:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:69:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:69:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:75:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:75:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:82:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:82:19: sparse: sparse: got hi
>> lib/raid/raid6/arm/neon2.c:84:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/arm/neon2.c:84:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:84:16: sparse: sparse: got lo
   lib/raid/raid6/arm/neon2.c:85:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:85:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:93:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:93:19: sparse: sparse: got hi
   lib/raid/raid6/arm/neon2.c:96:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/arm/neon2.c:96:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:96:16: sparse: sparse: got lo
   lib/raid/raid6/arm/neon2.c:97:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:97:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:109:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:109:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon2.c:111:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:111:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:117:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:117:19: sparse: sparse: got d0
   lib/raid/raid6/arm/neon2.c:119:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:119:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon2.c:121:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:121:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:128:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:128:19: sparse: sparse: got d2
   lib/raid/raid6/arm/neon2.c:129:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:129:19: sparse: sparse: got d1
   lib/raid/raid6/arm/neon2.c:130:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:130:19: sparse: sparse: got d0
   lib/raid/raid6/arm/neon2.c:132:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:132:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon2.c:134:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:134:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:140:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:140:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:149:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:149:19: sparse: sparse: got wq0
   lib/raid/raid6/arm/neon2.c:150:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:150:19: sparse: sparse: got wq1
   lib/raid/raid6/arm/neon2.c:151:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:151:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon2.c:157:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:157:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon2.c:157:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon2.c:157:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:157:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon2.c:157:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:157:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon2.c:163:24: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:163:24: sparse: sparse: got &
>> lib/raid/raid6/arm/neon2.c:163:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/arm/neon2.c:165:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:165:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:166:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:166:26: sparse: sparse: got --
   lib/raid/raid6/arm/neon2.c:167:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:167:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:170:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:170:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:171:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:171:27: sparse: sparse: got -=
   lib/raid/raid6/arm/neon2.c:172:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:172:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:173:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:173:27: sparse: sparse: got >=
   lib/raid/raid6/arm/neon2.c:173:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:173:36: sparse: sparse: got -=
   lib/raid/raid6/arm/neon2.c:175:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:175:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:176:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:176:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:178:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:178:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:179:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:179:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:180:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:180:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:181:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:181:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:196:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:196:19: sparse: sparse: got wq0
   lib/raid/raid6/arm/neon2.c:197:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:197:19: sparse: sparse: got wq1
   lib/raid/raid6/arm/neon2.c:198:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:198:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon2.c:199:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:199:25: sparse: sparse: got gm0
   lib/raid/raid6/arm/neon2.c:200:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:200:25: sparse: sparse: got gm1
   lib/raid/raid6/arm/neon2.c:206:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:206:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon2.c:206:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon2.c:206:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:206:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon2.c:206:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:206:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon2.c:214:21: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:214:21: sparse: sparse: got (
   lib/raid/raid6/arm/neon2.c:214:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/arm/neon2.c:216:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:216:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:217:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:217:26: sparse: sparse: got --
   lib/raid/raid6/arm/neon2.c:218:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:218:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:221:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:221:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:222:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:222:27: sparse: sparse: got -=
   lib/raid/raid6/arm/neon2.c:223:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:223:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:224:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:224:27: sparse: sparse: got >=
   lib/raid/raid6/arm/neon2.c:224:40: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:224:40: sparse: sparse: got -=
   lib/raid/raid6/arm/neon2.c:226:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:226:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:227:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:227:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:233:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:233:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon2.c:236:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon2.c:236:21: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon2.c:237:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:237:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:238:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:238:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:239:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:239:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:240:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon2.c:240:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon2.c:241:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon2.c:241:9: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3131:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3131:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3138:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3138:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3145:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3145:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3152:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3152:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3159:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3159:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3166:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3166:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3173:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3173:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3180:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3180:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3187:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:3187:10: sparse: sparse: bad constant expression type
--
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34484:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34484:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34491:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34491:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34498:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34498:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34505:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34505:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34513:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34513:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34521:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34521:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34529:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34529:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34537:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34537:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34545:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34545:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34553:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34553:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34561:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34561:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34569:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34569:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34577:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34577:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34585:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34585:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34593:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34593:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34601:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34601:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34609:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34609:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34617:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34617:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34625:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34625:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34633:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34633:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34642:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34642:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34649:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34649:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34656:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34656:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34663:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34663:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34670:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34670:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34677:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34677:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34684:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34684:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34694:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34694:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34701:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34701:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34709:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34709:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34716:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34716:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34723:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34723:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34730:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34730:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34737:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34737:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34744:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34744:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34751:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34751:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34758:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34758:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34765:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34765:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34772:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34772:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34779:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34779:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34786:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34786:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34793:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34793:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34800:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34800:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:42:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:42:20: sparse: sparse: got unative_t
   lib/raid/raid6/arm/neon4.c:52:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:52:25: sparse: sparse: got SHLBYTE
   lib/raid/raid6/arm/neon4.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:55:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:64:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:64:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:69:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:69:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:75:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:75:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:82:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:82:19: sparse: sparse: got hi
>> lib/raid/raid6/arm/neon4.c:84:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/arm/neon4.c:84:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:84:16: sparse: sparse: got lo
   lib/raid/raid6/arm/neon4.c:85:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:85:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:93:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:93:19: sparse: sparse: got hi
   lib/raid/raid6/arm/neon4.c:96:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/arm/neon4.c:96:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:96:16: sparse: sparse: got lo
   lib/raid/raid6/arm/neon4.c:97:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:97:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:109:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:109:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon4.c:111:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:111:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:117:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:117:19: sparse: sparse: got d0
   lib/raid/raid6/arm/neon4.c:119:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:119:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon4.c:121:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:121:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:128:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:128:19: sparse: sparse: got d2
   lib/raid/raid6/arm/neon4.c:129:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:129:19: sparse: sparse: got d1
   lib/raid/raid6/arm/neon4.c:130:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:130:19: sparse: sparse: got d0
   lib/raid/raid6/arm/neon4.c:132:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:132:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon4.c:134:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:134:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:140:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:140:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:149:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:149:19: sparse: sparse: got wq0
   lib/raid/raid6/arm/neon4.c:150:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:150:19: sparse: sparse: got wq1
   lib/raid/raid6/arm/neon4.c:151:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:151:19: sparse: sparse: got wq2
   lib/raid/raid6/arm/neon4.c:152:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:152:19: sparse: sparse: got wq3
   lib/raid/raid6/arm/neon4.c:153:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:153:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon4.c:159:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:159:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon4.c:159:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon4.c:159:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:159:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon4.c:159:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:159:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon4.c:167:24: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:167:24: sparse: sparse: got &
>> lib/raid/raid6/arm/neon4.c:167:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/arm/neon4.c:169:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:169:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:170:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:170:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:171:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:171:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:172:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:172:26: sparse: sparse: got --
   lib/raid/raid6/arm/neon4.c:173:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:173:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:176:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:176:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:177:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:177:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:178:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:178:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:179:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:179:27: sparse: sparse: got -=
   lib/raid/raid6/arm/neon4.c:180:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:180:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:181:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:181:27: sparse: sparse: got >=
   lib/raid/raid6/arm/neon4.c:181:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:181:36: sparse: sparse: got -=
   lib/raid/raid6/arm/neon4.c:183:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:183:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:184:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:184:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:185:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:185:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:186:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:186:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:188:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:188:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:189:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:189:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:190:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:190:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:191:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:191:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:192:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:192:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:193:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:193:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:194:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:194:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:195:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:195:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:210:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:210:19: sparse: sparse: got wq0
   lib/raid/raid6/arm/neon4.c:211:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:211:19: sparse: sparse: got wq1
   lib/raid/raid6/arm/neon4.c:212:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:212:19: sparse: sparse: got wq2
   lib/raid/raid6/arm/neon4.c:213:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:213:19: sparse: sparse: got wq3
   lib/raid/raid6/arm/neon4.c:214:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:214:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon4.c:215:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:215:25: sparse: sparse: got gm0
   lib/raid/raid6/arm/neon4.c:216:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:216:25: sparse: sparse: got gm1
   lib/raid/raid6/arm/neon4.c:222:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:222:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon4.c:222:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon4.c:222:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:222:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon4.c:222:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:222:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon4.c:234:21: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:234:21: sparse: sparse: got (
   lib/raid/raid6/arm/neon4.c:234:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/arm/neon4.c:236:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:236:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:237:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:237:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:238:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:238:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:239:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:239:26: sparse: sparse: got --
   lib/raid/raid6/arm/neon4.c:240:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:240:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:243:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:243:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:244:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:244:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:245:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:245:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:246:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:246:27: sparse: sparse: got -=
   lib/raid/raid6/arm/neon4.c:247:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon4.c:247:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon4.c:248:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:248:27: sparse: sparse: got >=
   lib/raid/raid6/arm/neon4.c:248:40: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon4.c:248:40: sparse: sparse: got -=
   lib/raid/raid6/arm/neon4.c:250:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:250:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon4.c:251:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon4.c:251:31: sparse: sparse: got &
--
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34484:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34484:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34491:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34491:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34498:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34498:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34505:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34505:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34513:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34513:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34521:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34521:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34529:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34529:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34537:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34537:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34545:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34545:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34553:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34553:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34561:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34561:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34569:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34569:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34577:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34577:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34585:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34585:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34593:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34593:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34601:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34601:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34609:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34609:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34617:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34617:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34625:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34625:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34633:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34633:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34642:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34642:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34649:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34649:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34656:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34656:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34663:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34663:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34670:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34670:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34677:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34677:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34684:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34684:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34694:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34694:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34701:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34701:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34709:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34709:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34716:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34716:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34723:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34723:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34730:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34730:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34737:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34737:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34744:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34744:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34751:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34751:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34758:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34758:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34765:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34765:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34772:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34772:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34779:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34779:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34786:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34786:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34793:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34793:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34800:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/9.5.0/include/arm_neon.h:34800:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:42:20: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:42:20: sparse: sparse: got unative_t
   lib/raid/raid6/arm/neon8.c:52:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:52:25: sparse: sparse: got SHLBYTE
   lib/raid/raid6/arm/neon8.c:55:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:55:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:64:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:64:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:69:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:69:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:75:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:75:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:82:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:82:19: sparse: sparse: got hi
>> lib/raid/raid6/arm/neon8.c:84:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/arm/neon8.c:84:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:84:16: sparse: sparse: got lo
   lib/raid/raid6/arm/neon8.c:85:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:85:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:93:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:93:19: sparse: sparse: got hi
   lib/raid/raid6/arm/neon8.c:96:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/arm/neon8.c:96:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:96:16: sparse: sparse: got lo
   lib/raid/raid6/arm/neon8.c:97:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:97:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:109:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:109:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon8.c:111:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:111:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:117:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:117:19: sparse: sparse: got d0
   lib/raid/raid6/arm/neon8.c:119:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:119:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon8.c:121:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:121:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:128:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:128:19: sparse: sparse: got d2
   lib/raid/raid6/arm/neon8.c:129:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:129:19: sparse: sparse: got d1
   lib/raid/raid6/arm/neon8.c:130:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:130:19: sparse: sparse: got d0
   lib/raid/raid6/arm/neon8.c:132:13: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:132:13: sparse: sparse: got ^=
   lib/raid/raid6/arm/neon8.c:134:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:134:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:140:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:140:1: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:149:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:149:19: sparse: sparse: got wq0
   lib/raid/raid6/arm/neon8.c:150:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:150:19: sparse: sparse: got wq1
   lib/raid/raid6/arm/neon8.c:151:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:151:19: sparse: sparse: got wq2
   lib/raid/raid6/arm/neon8.c:152:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:152:19: sparse: sparse: got wq3
   lib/raid/raid6/arm/neon8.c:153:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:153:19: sparse: sparse: got wq4
   lib/raid/raid6/arm/neon8.c:154:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:154:19: sparse: sparse: got wq5
   lib/raid/raid6/arm/neon8.c:155:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:155:19: sparse: sparse: got wq6
   lib/raid/raid6/arm/neon8.c:156:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:156:19: sparse: sparse: got wq7
   lib/raid/raid6/arm/neon8.c:157:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:157:25: sparse: sparse: got x1d
   lib/raid/raid6/arm/neon8.c:163:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:163:17: sparse: sparse: got =
   lib/raid/raid6/arm/neon8.c:163:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/arm/neon8.c:163:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:163:25: sparse: sparse: got <
   lib/raid/raid6/arm/neon8.c:163:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:163:37: sparse: sparse: got +=
   lib/raid/raid6/arm/neon8.c:175:24: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:175:24: sparse: sparse: got &
>> lib/raid/raid6/arm/neon8.c:175:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/arm/neon8.c:177:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:177:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:178:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:178:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:179:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:179:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:180:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:180:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:181:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:181:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:182:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:182:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:183:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:183:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:184:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:184:26: sparse: sparse: got --
   lib/raid/raid6/arm/neon8.c:185:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:185:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:188:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:188:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:189:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:189:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:190:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:190:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:191:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:191:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:192:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:192:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:193:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:193:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:194:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:194:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:195:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:195:27: sparse: sparse: got -=
   lib/raid/raid6/arm/neon8.c:196:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:196:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:197:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:197:27: sparse: sparse: got >=
   lib/raid/raid6/arm/neon8.c:197:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:197:36: sparse: sparse: got -=
   lib/raid/raid6/arm/neon8.c:199:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:199:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:200:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:200:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:201:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:201:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:202:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:202:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:203:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:203:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:204:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:204:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:205:31: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:205:31: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:206:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:206:17: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:208:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:208:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:209:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:209:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:210:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:210:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:211:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:211:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:212:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:212:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:213:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:213:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:214:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:214:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:215:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:215:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:216:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:216:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:217:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:217:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:218:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:218:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:219:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:219:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:220:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:220:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:221:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:221:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:222:26: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/arm/neon8.c:222:26: sparse: sparse: got &
   lib/raid/raid6/arm/neon8.c:223:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/arm/neon8.c:223:9: sparse: sparse: got }
   lib/raid/raid6/arm/neon8.c:238:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:238:19: sparse: sparse: got wq0
   lib/raid/raid6/arm/neon8.c:239:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:239:19: sparse: sparse: got wq1
   lib/raid/raid6/arm/neon8.c:240:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:240:19: sparse: sparse: got wq2
   lib/raid/raid6/arm/neon8.c:241:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:241:19: sparse: sparse: got wq3
   lib/raid/raid6/arm/neon8.c:242:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:242:19: sparse: sparse: got wq4
   lib/raid/raid6/arm/neon8.c:243:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/arm/neon8.c:243:19: sparse: sparse: got wq5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
