Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FC04B7A39
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Sep 2026 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068688; cv=none; b=AjTvOOeCx75OAYtyrijLwsGCRjJTXQgg9ugKsNdYUr3TufdoWA8DJgqX0PzafNKb0Qn3x1JlFEe29oP+a23ocO2EODx6tN0s3cu4jfsOyPAcc5j0Vl6DerUgPCCnBRnjfEiY5VeI8JNI6Wh9oCd1p8Vecg3JMi0tiEGqgIS/OAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068688; c=relaxed/simple;
	bh=D5ap3UeGjerq81aMl26azeHV6K62Sznmem06QJdYqz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Slc7y5E5wxyJtKEUfmLOO8fEDBF8gfok53PTJGcUgMqF7s8KkrUKMdnTX2bvppRtBHhVZNNjzf9wNt+dt9NKdLjLpHCTnq/NuFqAbPwZJUFDmmnMPkOvdrpaKzWt/l9mnTABl2iz12s/Ca9prJ1lVdwC1DtFA8Zl9vHFwOUlftM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SElJU0gW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SElJU0gW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790068684; x=1821604684;
  h=date:from:to:cc:subject:message-id;
  bh=D5ap3UeGjerq81aMl26azeHV6K62Sznmem06QJdYqz8=;
  b=SElJU0gW/H8vCA81zqeOifZ0QUt3Hq0zTsKLzh6CbFmig7AdvpJNcx9l
   wwL43a0h1maNI4fOV7clpWUyHHJwFxuKyicd5F9nZ2yzUhaC5m3seItA1
   8mHwmFd0ZVMmcq96YTw3LFVvceTxIcI+n62HAc06ZaTCI/89UWydZO/s3
   9H2yuJ7QEk3dJS3sK35RRayymLl8TsmdK+mzGg+a7e81U2RRq02QqIjEv
   WtTJw78h9zipptU1/UzOoqgn65ct0MF1Y0dcXwMg9ezlhbG6ignU6MneJ
   8eJ+kqt34PxRV4flLcKrS6oNrsZxFgH+4PyfZJ19yQZh0ZOuKNVMP3Axy
   w==;
X-CSE-ConnectionGUID: 5KWBZQehSpSYkwfqdrGwSQ==
X-CSE-MsgGUID: lG6IOibpRdak1VfbKiOLkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89788687"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89788687"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:18:04 -0700
X-CSE-ConnectionGUID: 1J/fLOo4RAa6+SsGqj5p2g==
X-CSE-MsgGUID: Wpgy+fapR+ahhag8AztaLg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Sep 2026 02:18:02 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8wdU-00000000FGV-1Jui;
	Tue, 22 Sep 2026 09:18:00 +0000
Date: Tue, 22 Sep 2026 17:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/xor/xor-neon.c:21:9: sparse: sparse: Trying to use
 reserved word 'do' as identifier
Message-ID: <202609221614.rpt4n5xr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/xor/xor-neon.c:21:9: sparse: sparse: Trying to use reserved word 'do' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 4d3c5cbfe2b55c12ad1d866ddf0928d13d775816 xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r1308-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221614.rpt4n5xr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221614.rpt4n5xr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4d3c5cbfe2b5 ("xor/arm64: Use shared NEON intrinsics implementation from 32-bit ARM")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609221614.rpt4n5xr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34314:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34314:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34322:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34322:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34330:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34330:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34338:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:34338:1: sparse: sparse: got }
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
   lib/raid/xor/xor-neon.c:18:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:18:29: sparse: sparse: got v0
>> lib/raid/xor/xor-neon.c:21:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/xor-neon.c:21:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:21:12: sparse: sparse: got {
   lib/raid/xor/xor-neon.c:29:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:29:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:30:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:30:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:31:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:31:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:32:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:32:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:34:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:34:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:35:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:35:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:36:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:36:9: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:37:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:37:1: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:47:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:47:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:50:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/xor-neon.c:50:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:50:12: sparse: sparse: got {
   lib/raid/xor/xor-neon.c:64:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:64:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:65:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:65:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:66:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:66:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:67:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:67:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:69:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:69:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:70:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:70:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:71:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:71:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:72:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:72:9: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:73:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:73:1: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:85:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:85:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:88:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/xor-neon.c:88:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:88:12: sparse: sparse: got {
   lib/raid/xor/xor-neon.c:108:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:108:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:109:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:109:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:110:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:110:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:111:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:111:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:113:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:113:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:114:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:114:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:115:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:115:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:116:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:116:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:117:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:117:9: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:118:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:118:1: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:132:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:132:29: sparse: sparse: got v0
   lib/raid/xor/xor-neon.c:135:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/xor-neon.c:135:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:135:12: sparse: sparse: got {
   lib/raid/xor/xor-neon.c:161:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:161:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:162:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:162:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:163:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:163:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:164:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:164:31: sparse: sparse: got +
   lib/raid/xor/xor-neon.c:166:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:166:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:167:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:167:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:168:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:168:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:169:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:169:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:170:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:170:21: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:171:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:171:9: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:172:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:172:1: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got >
>> lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got {
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got !
>> lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ) in nested declarator
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got <
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got }
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got ==
>> lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Trying to use reserved word 'if' as identifier
>> lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got if
>> lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got if
>> lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got __xor_neon_5
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got -=
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got +=
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor-neon.c:174:1: sparse: sparse: got }
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
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3208:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3208:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3215:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3215:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3222:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3222:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3231:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3231:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3238:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3238:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3245:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3245:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3252:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3252:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3259:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3259:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3266:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3266:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3273:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3273:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3280:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3280:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3287:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3287:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3294:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3294:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3301:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3301:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3308:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3308:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3315:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3315:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3322:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:3322:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6078:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6085:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6092:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/8.5.0/include/arm_neon.h:6099:10: sparse: sparse: bad constant expression type

vim +/do +21 lib/raid/xor/xor-neon.c

a967b1f51c83b6 Ard Biesheuvel 2026-04-22   11  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   12  static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   13  		const unsigned long * __restrict p2)
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   14  {
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   15  	uint64_t *dp1 = (uint64_t *)p1;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   16  	uint64_t *dp2 = (uint64_t *)p2;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   17  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   18  	register uint64x2_t v0, v1, v2, v3;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   19  	long lines = bytes / (sizeof(uint64x2_t) * 4);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   20  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  @21  	do {
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   22  		/* p1 ^= p2 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   23  		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   24  		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   25  		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   26  		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   27  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   28  		/* store */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   29  		vst1q_u64(dp1 +  0, v0);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   30  		vst1q_u64(dp1 +  2, v1);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   31  		vst1q_u64(dp1 +  4, v2);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   32  		vst1q_u64(dp1 +  6, v3);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   33  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   34  		dp1 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   35  		dp2 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   36  	} while (--lines > 0);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   37  }
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   38  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   39  static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   40  		const unsigned long * __restrict p2,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   41  		const unsigned long * __restrict p3)
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   42  {
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   43  	uint64_t *dp1 = (uint64_t *)p1;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   44  	uint64_t *dp2 = (uint64_t *)p2;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   45  	uint64_t *dp3 = (uint64_t *)p3;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   46  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   47  	register uint64x2_t v0, v1, v2, v3;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   48  	long lines = bytes / (sizeof(uint64x2_t) * 4);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   49  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   50  	do {
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   51  		/* p1 ^= p2 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   52  		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   53  		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   54  		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   55  		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   56  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   57  		/* p1 ^= p3 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   58  		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   59  		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   60  		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   61  		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   62  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   63  		/* store */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   64  		vst1q_u64(dp1 +  0, v0);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   65  		vst1q_u64(dp1 +  2, v1);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   66  		vst1q_u64(dp1 +  4, v2);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   67  		vst1q_u64(dp1 +  6, v3);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   68  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   69  		dp1 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   70  		dp2 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   71  		dp3 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   72  	} while (--lines > 0);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   73  }
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   74  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   75  static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   76  		const unsigned long * __restrict p2,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   77  		const unsigned long * __restrict p3,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   78  		const unsigned long * __restrict p4)
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   79  {
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   80  	uint64_t *dp1 = (uint64_t *)p1;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   81  	uint64_t *dp2 = (uint64_t *)p2;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   82  	uint64_t *dp3 = (uint64_t *)p3;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   83  	uint64_t *dp4 = (uint64_t *)p4;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   84  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   85  	register uint64x2_t v0, v1, v2, v3;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   86  	long lines = bytes / (sizeof(uint64x2_t) * 4);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   87  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   88  	do {
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   89  		/* p1 ^= p2 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   90  		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   91  		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   92  		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   93  		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   94  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   95  		/* p1 ^= p3 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   96  		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   97  		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   98  		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22   99  		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  100  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  101  		/* p1 ^= p4 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  102  		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  103  		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  104  		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  105  		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  106  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  107  		/* store */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  108  		vst1q_u64(dp1 +  0, v0);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  109  		vst1q_u64(dp1 +  2, v1);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  110  		vst1q_u64(dp1 +  4, v2);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  111  		vst1q_u64(dp1 +  6, v3);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  112  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  113  		dp1 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  114  		dp2 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  115  		dp3 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  116  		dp4 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  117  	} while (--lines > 0);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  118  }
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  119  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  120  static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  121  		const unsigned long * __restrict p2,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  122  		const unsigned long * __restrict p3,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  123  		const unsigned long * __restrict p4,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  124  		const unsigned long * __restrict p5)
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  125  {
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  126  	uint64_t *dp1 = (uint64_t *)p1;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  127  	uint64_t *dp2 = (uint64_t *)p2;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  128  	uint64_t *dp3 = (uint64_t *)p3;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  129  	uint64_t *dp4 = (uint64_t *)p4;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  130  	uint64_t *dp5 = (uint64_t *)p5;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  131  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  132  	register uint64x2_t v0, v1, v2, v3;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  133  	long lines = bytes / (sizeof(uint64x2_t) * 4);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  134  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  135  	do {
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  136  		/* p1 ^= p2 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  137  		v0 = veorq_u64(vld1q_u64(dp1 +  0), vld1q_u64(dp2 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  138  		v1 = veorq_u64(vld1q_u64(dp1 +  2), vld1q_u64(dp2 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  139  		v2 = veorq_u64(vld1q_u64(dp1 +  4), vld1q_u64(dp2 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  140  		v3 = veorq_u64(vld1q_u64(dp1 +  6), vld1q_u64(dp2 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  141  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  142  		/* p1 ^= p3 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  143  		v0 = veorq_u64(v0, vld1q_u64(dp3 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  144  		v1 = veorq_u64(v1, vld1q_u64(dp3 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  145  		v2 = veorq_u64(v2, vld1q_u64(dp3 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  146  		v3 = veorq_u64(v3, vld1q_u64(dp3 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  147  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  148  		/* p1 ^= p4 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  149  		v0 = veorq_u64(v0, vld1q_u64(dp4 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  150  		v1 = veorq_u64(v1, vld1q_u64(dp4 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  151  		v2 = veorq_u64(v2, vld1q_u64(dp4 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  152  		v3 = veorq_u64(v3, vld1q_u64(dp4 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  153  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  154  		/* p1 ^= p5 */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  155  		v0 = veorq_u64(v0, vld1q_u64(dp5 +  0));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  156  		v1 = veorq_u64(v1, vld1q_u64(dp5 +  2));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  157  		v2 = veorq_u64(v2, vld1q_u64(dp5 +  4));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  158  		v3 = veorq_u64(v3, vld1q_u64(dp5 +  6));
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  159  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  160  		/* store */
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  161  		vst1q_u64(dp1 +  0, v0);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  162  		vst1q_u64(dp1 +  2, v1);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  163  		vst1q_u64(dp1 +  4, v2);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  164  		vst1q_u64(dp1 +  6, v3);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  165  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  166  		dp1 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  167  		dp2 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  168  		dp3 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  169  		dp4 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  170  		dp5 += 8;
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  171  	} while (--lines > 0);
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  172  }
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  173  
a967b1f51c83b6 Ard Biesheuvel 2026-04-22 @174  __DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
a967b1f51c83b6 Ard Biesheuvel 2026-04-22  175  		__xor_neon_5);
4d3c5cbfe2b55c Ard Biesheuvel 2026-04-22  176  

:::::: The code at line 21 was first introduced by commit
:::::: a967b1f51c83b65372a93d652a888e3addd9c5a3 xor/arm: Replace vectorized implementation with arm64's intrinsics

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
