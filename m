Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B70138DD3
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 04:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777696409; cv=none; b=Eyp8uBu9K6kEfnwweXhLG3WvcSRyO4SAIHrAZ8l9fWyxcnzBYy5zPwGa/HpCgvG6pPYuAy9qn1zkNB8wr916P+h4tHGJC7VQfyAFo3VR8nbvm6ii6kQO/U8xvcnO5aTWPJD207w0drx94axdUy1GCqAO0AZJy3cNDeuU54HDkh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777696409; c=relaxed/simple;
	bh=1brITtElAoASVz4MWlvStYcT1rNtlPvCFasM6KXSv9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kRZCGcQ8RPFUIGYJzDgv8tvUX7cBG1g9aCWr2wo2doV6NJj3E8wqAhSY0f2kp+auM/CAw2D6tXyzKNFacoskmnEQMD3i3UtNDkPReM49ShcJx4+VEAn8Fe57fkehYtaFHwaPOkeCmtF/scKODFq8SzHHFNLPilVH36/KIZutv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWbeV52o; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWbeV52o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777696405; x=1809232405;
  h=date:from:to:cc:subject:message-id;
  bh=1brITtElAoASVz4MWlvStYcT1rNtlPvCFasM6KXSv9M=;
  b=LWbeV52omXkSeO3gnzO+nPppP5sjGo17nPYlGhL4cQbMNbq6jJsRZh6f
   Cuo06zCksZiOJz4qzRI9NroQRJNJ+e50at8F5XGQRybOUtvzBuK8xHPSm
   x9g4K9a8jDqdnzMXAOiCrtEtczD0cRFzK+MAqSMYCbRcX/jfDuOToL/XD
   rEI2lQ6Gixt7o2SsZncnYn1jqDdIq/JWve9d0Y4kCRNtF6xOOZZslG1lB
   qUotUh4E98ZmdI0+7sdEawXqUsMuNMZQzrISWWoP05zW7BcqqEPRVBzCv
   NpQvL2OZFJ7vpP224psQeZCYTBzP8BoAfhud9hNxDPs/cyo0vMm2Ezr02
   w==;
X-CSE-ConnectionGUID: D6HLtnjURcm0zm0/yKjN2g==
X-CSE-MsgGUID: cvVC0r2dS5+QABDCgCEBDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="90029280"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="90029280"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 21:33:24 -0700
X-CSE-ConnectionGUID: /Rne1BLBStGCCR9SZd8uTQ==
X-CSE-MsgGUID: sBmW5YRWQL2SMedMztN38A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="273133565"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2026 21:33:23 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ22a-0000000019N-22uX;
	Sat, 02 May 2026 04:33:20 +0000
Date: Sat, 02 May 2026 12:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/xor/arm64/xor-neon.c:189:9: sparse: sparse: Trying
 to use reserved word 'return' as identifier
Message-ID: <202605021231.cgxQKE1v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/xor/arm64/xor-neon.c:189:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1a5e78a55ebf2b05777fd5eb738038ddae609d6
commit: 3786f2ad009549c9e5e2af86e5829b31ad788eb4 arm64: move the XOR code to lib/raid/
date:   4 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-r132-20260502 (https://download.01.org/0day-ci/archive/20260502/202605021231.cgxQKE1v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021231.cgxQKE1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3786f2ad0095 ("arm64: move the XOR code to lib/raid/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605021231.cgxQKE1v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34345:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34345:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34352:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34352:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34359:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34359:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34367:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34367:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34375:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34375:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34383:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34383:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34391:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34391:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34398:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34398:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34405:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34405:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34412:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34412:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34420:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34420:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34428:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34428:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34436:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34436:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34444:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34444:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34456:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34456:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34463:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34463:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34470:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34470:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34477:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34477:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34484:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34484:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34491:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34491:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34498:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34498:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34505:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34505:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34513:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34513:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34521:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34521:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34529:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34529:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34537:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34537:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34545:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34545:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34553:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34553:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34561:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34561:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34569:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34569:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34577:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34577:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34585:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34585:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34593:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34593:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34601:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34601:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34609:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34609:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34617:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34617:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34625:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34625:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34633:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34633:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34642:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34642:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34649:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34649:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34656:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34656:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34663:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34663:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34670:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34670:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34677:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34677:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34684:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34684:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:18:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:18:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:47:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:47:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:85:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:85:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:132:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:132:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:182:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:182:26: sparse: sparse: got eor3
>> lib/raid/xor/arm64/xor-neon.c:189:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/xor/arm64/xor-neon.c:189:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:189:16: sparse: sparse: got res
   lib/raid/xor/arm64/xor-neon.c:190:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:190:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:201:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:201:29: sparse: sparse: got v0
>> lib/raid/xor/arm64/xor-neon.c:204:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:204:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:204:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:216:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:216:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:217:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:217:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:218:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:218:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:219:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:219:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:221:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:221:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:222:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:222:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:223:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:223:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:224:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:224:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:225:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:225:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:238:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:238:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:241:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:241:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:241:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:259:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:259:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:260:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:260:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:261:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:261:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:262:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:262:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:264:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:264:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:265:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:265:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:266:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:266:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:267:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:267:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:268:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:268:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:269:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:269:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:284:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:284:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:287:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:287:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:287:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:305:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:305:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:306:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:306:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:307:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:307:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:308:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:308:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:310:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:310:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:311:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:312:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:312:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:313:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:313:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:314:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:314:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:315:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:315:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:316:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:316:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:322:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:322:37: sparse: sparse: got .
   lib/raid/xor/arm64/xor-neon.c:323:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:323:37: sparse: sparse: got .
   lib/raid/xor/arm64/xor-neon.c:324:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:324:9: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3131:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3131:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3138:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3138:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3145:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3145:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3152:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3152:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3159:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3159:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3166:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3166:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3173:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3173:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3180:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3180:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3187:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3187:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3194:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3194:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3201:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3201:10: sparse: sparse: bad constant expression type

vim +/return +189 lib/raid/xor/arm64/xor-neon.c

cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   11  
320a93d4df48a3 arch/arm64/lib/xor-neon.c Arnd Bergmann  2023-05-16   12  static void xor_arm64_neon_2(unsigned long bytes, unsigned long * __restrict p1,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05   13  	const unsigned long * __restrict p2)
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   14  {
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   15  	uint64_t *dp1 = (uint64_t *)p1;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   16  	uint64_t *dp2 = (uint64_t *)p2;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   17  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  @18  	register uint64x2_t v0, v1, v2, v3;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   19  	long lines = bytes / (sizeof(uint64x2_t) * 4);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   20  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   21  	do {
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   22  		/* p1 ^= p2 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   23  		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   24  		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   25  		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   26  		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   27  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   28  		/* store */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   29  		vst1q_u64(dp1 +  0, v0);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   30  		vst1q_u64(dp1 +  2, v1);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   31  		vst1q_u64(dp1 +  4, v2);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   32  		vst1q_u64(dp1 +  6, v3);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   33  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   34  		dp1 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   35  		dp2 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   36  	} while (--lines > 0);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   37  }
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   38  
320a93d4df48a3 arch/arm64/lib/xor-neon.c Arnd Bergmann  2023-05-16   39  static void xor_arm64_neon_3(unsigned long bytes, unsigned long * __restrict p1,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05   40  	const unsigned long * __restrict p2,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05   41  	const unsigned long * __restrict p3)
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   42  {
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   43  	uint64_t *dp1 = (uint64_t *)p1;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   44  	uint64_t *dp2 = (uint64_t *)p2;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   45  	uint64_t *dp3 = (uint64_t *)p3;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   46  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   47  	register uint64x2_t v0, v1, v2, v3;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   48  	long lines = bytes / (sizeof(uint64x2_t) * 4);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   49  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   50  	do {
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   51  		/* p1 ^= p2 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   52  		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   53  		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   54  		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   55  		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   56  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   57  		/* p1 ^= p3 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   58  		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   59  		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   60  		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   61  		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   62  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   63  		/* store */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   64  		vst1q_u64(dp1 +  0, v0);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   65  		vst1q_u64(dp1 +  2, v1);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   66  		vst1q_u64(dp1 +  4, v2);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   67  		vst1q_u64(dp1 +  6, v3);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   68  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   69  		dp1 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   70  		dp2 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   71  		dp3 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   72  	} while (--lines > 0);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   73  }
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   74  
320a93d4df48a3 arch/arm64/lib/xor-neon.c Arnd Bergmann  2023-05-16   75  static void xor_arm64_neon_4(unsigned long bytes, unsigned long * __restrict p1,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05   76  	const unsigned long * __restrict p2,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05   77  	const unsigned long * __restrict p3,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05   78  	const unsigned long * __restrict p4)
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   79  {
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   80  	uint64_t *dp1 = (uint64_t *)p1;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   81  	uint64_t *dp2 = (uint64_t *)p2;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   82  	uint64_t *dp3 = (uint64_t *)p3;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   83  	uint64_t *dp4 = (uint64_t *)p4;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   84  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   85  	register uint64x2_t v0, v1, v2, v3;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   86  	long lines = bytes / (sizeof(uint64x2_t) * 4);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   87  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   88  	do {
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   89  		/* p1 ^= p2 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   90  		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   91  		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   92  		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   93  		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   94  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   95  		/* p1 ^= p3 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   96  		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   97  		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   98  		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04   99  		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  100  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  101  		/* p1 ^= p4 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  102  		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  103  		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  104  		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  105  		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  106  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  107  		/* store */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  108  		vst1q_u64(dp1 +  0, v0);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  109  		vst1q_u64(dp1 +  2, v1);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  110  		vst1q_u64(dp1 +  4, v2);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  111  		vst1q_u64(dp1 +  6, v3);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  112  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  113  		dp1 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  114  		dp2 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  115  		dp3 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  116  		dp4 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  117  	} while (--lines > 0);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  118  }
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  119  
320a93d4df48a3 arch/arm64/lib/xor-neon.c Arnd Bergmann  2023-05-16  120  static void xor_arm64_neon_5(unsigned long bytes, unsigned long * __restrict p1,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  121  	const unsigned long * __restrict p2,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  122  	const unsigned long * __restrict p3,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  123  	const unsigned long * __restrict p4,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  124  	const unsigned long * __restrict p5)
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  125  {
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  126  	uint64_t *dp1 = (uint64_t *)p1;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  127  	uint64_t *dp2 = (uint64_t *)p2;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  128  	uint64_t *dp3 = (uint64_t *)p3;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  129  	uint64_t *dp4 = (uint64_t *)p4;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  130  	uint64_t *dp5 = (uint64_t *)p5;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  131  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  132  	register uint64x2_t v0, v1, v2, v3;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  133  	long lines = bytes / (sizeof(uint64x2_t) * 4);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  134  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  135  	do {
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  136  		/* p1 ^= p2 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  137  		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  138  		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  139  		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  140  		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  141  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  142  		/* p1 ^= p3 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  143  		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  144  		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  145  		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  146  		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  147  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  148  		/* p1 ^= p4 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  149  		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  150  		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  151  		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  152  		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  153  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  154  		/* p1 ^= p5 */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  155  		v0 = veorq_u64(v0, vld1q_u64(dp5 +  0));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  156  		v1 = veorq_u64(v1, vld1q_u64(dp5 +  2));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  157  		v2 = veorq_u64(v2, vld1q_u64(dp5 +  4));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  158  		v3 = veorq_u64(v3, vld1q_u64(dp5 +  6));
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  159  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  160  		/* store */
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  161  		vst1q_u64(dp1 +  0, v0);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  162  		vst1q_u64(dp1 +  2, v1);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  163  		vst1q_u64(dp1 +  4, v2);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  164  		vst1q_u64(dp1 +  6, v3);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  165  
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  166  		dp1 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  167  		dp2 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  168  		dp3 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  169  		dp4 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  170  		dp5 += 8;
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  171  	} while (--lines > 0);
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  172  }
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  173  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  174  struct xor_block_template xor_block_inner_neon __ro_after_init = {
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  175  	.name	= "__inner_neon__",
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  176  	.do_2	= xor_arm64_neon_2,
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  177  	.do_3	= xor_arm64_neon_3,
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  178  	.do_4	= xor_arm64_neon_4,
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  179  	.do_5	= xor_arm64_neon_5,
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  180  };
cc9f8349cb3396 arch/arm64/lib/xor-neon.c Jackie Liu     2018-12-04  181  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13 @182  static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  183  {
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  184  	uint64x2_t res;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  185  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  186  	asm(ARM64_ASM_PREAMBLE ".arch_extension sha3\n"
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  187  	    "eor3 %0.16b, %1.16b, %2.16b, %3.16b"
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  188  	    : "=w"(res) : "w"(p), "w"(q), "w"(r));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13 @189  	return res;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  190  }
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  191  
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  192  static void xor_arm64_eor3_3(unsigned long bytes,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  193  	unsigned long * __restrict p1,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  194  	const unsigned long * __restrict p2,
297565aa22cfa8 arch/arm64/lib/xor-neon.c Ard Biesheuvel 2022-02-05  195  	const unsigned long * __restrict p3)
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  196  {
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  197  	uint64_t *dp1 = (uint64_t *)p1;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  198  	uint64_t *dp2 = (uint64_t *)p2;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  199  	uint64_t *dp3 = (uint64_t *)p3;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  200  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  201  	register uint64x2_t v0, v1, v2, v3;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  202  	long lines = bytes / (sizeof(uint64x2_t) * 4);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  203  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13 @204  	do {
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  205  		/* p1 ^= p2 ^ p3 */
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  206  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  207  			  vld1q_u64(dp3 + 0));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  208  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  209  			  vld1q_u64(dp3 + 2));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  210  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  211  			  vld1q_u64(dp3 + 4));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  212  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  213  			  vld1q_u64(dp3 + 6));
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  214  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  215  		/* store */
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  216  		vst1q_u64(dp1 + 0, v0);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  217  		vst1q_u64(dp1 + 2, v1);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  218  		vst1q_u64(dp1 + 4, v2);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  219  		vst1q_u64(dp1 + 6, v3);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  220  
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  221  		dp1 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  222  		dp2 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  223  		dp3 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  224  	} while (--lines > 0);
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  225  }
2c54b423cf85ba arch/arm64/lib/xor-neon.c Ard Biesheuvel 2021-12-13  226  

:::::: The code at line 189 was first introduced by commit
:::::: 2c54b423cf85baed5ad9f9546f6c8ea741774a06 arm64/xor: use EOR3 instructions when available

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
