Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F13302146
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778048273; cv=none; b=fsQph4WTfsuXB/5ptJiv81pjyFLfQHr5oxJEK2AMmXEOS/IgsyzWe/MFeHYVZkPmTEvYODgfMWIQg5vtmHuElnj2P4QjZKKSCqSG4EpVlGZPg5KbedNaHuTISuDtMOTKqLkjio2Qvl6yiRk9f7TURVaJbsiD0PT5nl++/wNXcVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778048273; c=relaxed/simple;
	bh=W0j/fGBVhf03wsHdNJgrfL0RWV+t2opkQZO/oOicMnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EAqpjF5Kji+QfVD0hDj27nucYoZss0mjkRwBsriTQbn4AqBiM9WQPI3QH91k/RMZ2sECZNrVqMO3cad5LiAHNxeA+WKW3f5y+MCB/R4v1//ZBsxrZvloH1QxYBOZVIJjRl5tEu9TBFn0PRJDLYHQltnK+u6CQvcAoA+9XMuu8sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJTq4Tfm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJTq4Tfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778048271; x=1809584271;
  h=date:from:to:cc:subject:message-id;
  bh=W0j/fGBVhf03wsHdNJgrfL0RWV+t2opkQZO/oOicMnQ=;
  b=eJTq4Tfm3UnoZ6UeagFbMc0MwMxEP6bYzYsnrW25pBsJPROliinuxFdc
   GqlMyxuhaGW7sJnCH5AINfKWVmhLDTB2JAsW0Vj1VLo4QSy8fPEatwxD4
   7YNhzQFAmSaRtJ6fMLTD1Q5mpU5MJnOTr/WVw5YAUWjc9bfCatboH26kF
   ZbPeXRzQrfHjPTv0QFM2d28jpRsJq2UlIefieIGxVVvsnO2If+Ir6Tntg
   WsiSZFH0jLpzx4oJbAfCmg/RjqpIb8fBRox+TqOVJe5jI21yy66Tm+aEV
   X0rnW05zcXcgf0N3+p94rosvdqjw2hhZcEjOurMOJYTmoMqRn2QCvn/B4
   w==;
X-CSE-ConnectionGUID: r5MxJfyeSrCQeWX4zN8cww==
X-CSE-MsgGUID: ms7/7AgsQja1PZplehjqKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="90318196"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="90318196"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:17:49 -0700
X-CSE-ConnectionGUID: RrO+fSQ0T/e2KHrkQ8lqDA==
X-CSE-MsgGUID: qzALwyUDTimI/Sw/8KcCjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="259404321"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 May 2026 23:17:47 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKVZp-000000000l9-1lRH;
	Wed, 06 May 2026 06:17:45 +0000
Date: Wed, 06 May 2026 14:17:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/crc/arm64/crc64-neon-inner.c:29:9: sparse: sparse:
 Trying to use reserved word 'return' as identifier
Message-ID: <202605061434.s1nyxNjx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/crc/arm64/crc64-neon-inner.c:29:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   74fe02ce122a6103f207d29fafc8b3a53de6abaf
commit: 8fdef85d601db670e9c178314eedffe7bbb07e52 lib/crc: arm64: Simplify intrinsics implementation
date:   5 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-r121-20260505 (https://download.01.org/0day-ci/archive/20260506/202605061434.s1nyxNjx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061434.s1nyxNjx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 8fdef85d601d ("lib/crc: arm64: Simplify intrinsics implementation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605061434.s1nyxNjx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28494:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28494:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28501:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28501:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28508:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28508:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28515:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28515:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28522:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28522:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28529:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28529:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28536:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28536:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28543:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28543:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28545:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28545:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28552:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28552:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28554:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28554:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28561:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28561:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28563:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28563:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28570:10: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28570:10: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28572:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28572:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28580:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28580:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28588:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28588:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28596:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28596:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28604:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28604:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28612:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28612:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28620:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28620:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28628:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28628:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28636:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28636:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28644:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28644:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28652:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28652:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28660:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28660:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28668:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28668:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28682:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28682:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28689:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28689:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28696:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28696:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28704:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28704:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28712:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28712:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28720:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28720:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28727:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28727:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28735:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28735:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28743:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28743:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28751:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28751:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28760:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28760:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28767:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28767:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28774:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28774:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28783:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28783:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28790:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28790:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28797:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28797:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28804:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28804:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28811:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28811:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28818:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28818:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28825:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:28825:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:18:26: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:18:26: sparse: sparse: got pmull64
   lib/crc/arm64/crc64-neon-inner.c:22:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:22:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:27:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:27:20: sparse: sparse: got m
>> lib/crc/arm64/crc64-neon-inner.c:29:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm64/crc64-neon-inner.c:29:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:29:16: sparse: sparse: got vreinterpretq_u64_p128
   lib/crc/arm64/crc64-neon-inner.c:30:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:30:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:36:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:36:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:41:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:41:20: sparse: sparse: got v0
   lib/crc/arm64/crc64-neon-inner.c:42:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:42:20: sparse: sparse: got zero
   lib/crc/arm64/crc64-neon-inner.c:44:14: sparse: sparse: Expected ) in function declarator
   lib/crc/arm64/crc64-neon-inner.c:44:14: sparse: sparse: got ;
>> lib/crc/arm64/crc64-neon-inner.c:44:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/crc/arm64/crc64-neon-inner.c:44:16: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:44:16: sparse: sparse: got )
   lib/crc/arm64/crc64-neon-inner.c:47:19: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:47:19: sparse: sparse: got +=
   lib/crc/arm64/crc64-neon-inner.c:48:21: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:48:21: sparse: sparse: got -=
   lib/crc/arm64/crc64-neon-inner.c:49:25: sparse: sparse: Expected ) in function declarator
   lib/crc/arm64/crc64-neon-inner.c:49:25: sparse: sparse: got <
>> lib/crc/arm64/crc64-neon-inner.c:49:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/crc/arm64/crc64-neon-inner.c:53:9: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:53:9: sparse: sparse: got }
   lib/crc/arm64/crc64-neon-inner.c:59:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:59:20: sparse: sparse: got bconsts
   lib/crc/arm64/crc64-neon-inner.c:60:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:60:20: sparse: sparse: got final
   lib/crc/arm64/crc64-neon-inner.c:62:12: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:62:12: sparse: sparse: got ^=
   lib/crc/arm64/crc64-neon-inner.c:64:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm64/crc64-neon-inner.c:64:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon-inner.c:64:16: sparse: sparse: got vgetq_lane_u64
   lib/crc/arm64/crc64-neon-inner.c:65:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon-inner.c:65:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2636:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2636:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2643:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2643:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2650:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2650:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2657:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2657:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2664:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2664:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2671:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2671:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2678:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2678:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2685:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2685:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2692:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2692:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2699:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2699:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2706:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2706:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2713:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2713:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2720:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2720:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2727:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2727:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2736:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2736:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2743:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2743:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2750:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2750:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2757:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2757:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2764:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2764:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2771:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2771:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2778:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2778:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2785:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2785:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2792:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2792:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2799:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2799:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2806:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2806:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2813:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2813:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2820:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2820:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2827:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2827:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2836:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2850:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2850:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2850:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2850:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2850:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2850:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2843:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2850:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/14.3.0/include/arm_neon.h:2850:10: sparse:    int [addressable] [toplevel] __vec

vim +/return +29 lib/crc/arm64/crc64-neon-inner.c

63432fd625372a0 Demian Shulhan 2026-03-29  23  
8fdef85d601db67 Ard Biesheuvel 2026-03-30  24  static inline uint64x2_t pmull64_high(uint64x2_t a, uint64x2_t b)
8fdef85d601db67 Ard Biesheuvel 2026-03-30  25  {
8fdef85d601db67 Ard Biesheuvel 2026-03-30  26  	poly64x2_t l = vreinterpretq_p64_u64(a);
8fdef85d601db67 Ard Biesheuvel 2026-03-30  27  	poly64x2_t m = vreinterpretq_p64_u64(b);
63432fd625372a0 Demian Shulhan 2026-03-29  28  
8fdef85d601db67 Ard Biesheuvel 2026-03-30 @29  	return vreinterpretq_u64_p128(vmull_high_p64(l, m));
8fdef85d601db67 Ard Biesheuvel 2026-03-30  30  }
63432fd625372a0 Demian Shulhan 2026-03-29  31  
8fdef85d601db67 Ard Biesheuvel 2026-03-30  32  static inline uint64x2_t pmull64_hi_lo(uint64x2_t a, uint64x2_t b)
8fdef85d601db67 Ard Biesheuvel 2026-03-30  33  {
8fdef85d601db67 Ard Biesheuvel 2026-03-30  34  	return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 1),
8fdef85d601db67 Ard Biesheuvel 2026-03-30  35  						vgetq_lane_u64(b, 0)));
8fdef85d601db67 Ard Biesheuvel 2026-03-30  36  }
63432fd625372a0 Demian Shulhan 2026-03-29  37  
8fdef85d601db67 Ard Biesheuvel 2026-03-30  38  u64 crc64_nvme_arm64_c(u64 crc, const u8 *p, size_t len)
8fdef85d601db67 Ard Biesheuvel 2026-03-30  39  {
8fdef85d601db67 Ard Biesheuvel 2026-03-30  40  	uint64x2_t fold_consts = vld1q_u64(fold_consts_val);
8fdef85d601db67 Ard Biesheuvel 2026-03-30  41  	uint64x2_t v0 = { crc, 0 };
8fdef85d601db67 Ard Biesheuvel 2026-03-30  42  	uint64x2_t zero = { };
63432fd625372a0 Demian Shulhan 2026-03-29  43  
8fdef85d601db67 Ard Biesheuvel 2026-03-30 @44  	for (;;) {
8fdef85d601db67 Ard Biesheuvel 2026-03-30  45  		v0 ^= vreinterpretq_u64_u8(vld1q_u8(p));
63432fd625372a0 Demian Shulhan 2026-03-29  46  
63432fd625372a0 Demian Shulhan 2026-03-29  47  		p += 16;
63432fd625372a0 Demian Shulhan 2026-03-29  48  		len -= 16;
8fdef85d601db67 Ard Biesheuvel 2026-03-30 @49  		if (len < 16)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
