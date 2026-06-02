Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A8919D89E
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 21:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434644; cv=none; b=kAlchkCiFSQP0gJeEn7tuvR1hbK7iVKJJd9CoWissJ1CAd25NpdBch4Blqx61zO3CZaGNxJol84k/3YAhqqcVxnhhL7+TsYO0CYvhioA/Wmq+QLSv1osyl2sgtzEJlX+AX48CR9A8scklL76Ow23EWHa9Fw9aJOMFg/hNl1Fd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434644; c=relaxed/simple;
	bh=DI3I6mHPQR4Mv6gqML/Qcvg1GMZoJbg34a6kouIcav8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tc4WvnmBxPpkzsR3XZ1+ZCYPAEfLyRRr66TnLK3h6E3zKddP3tAAVoeawCl4eaGrkyLHc7IpoW7frN5scQsVdIlzCk25LFyWZz6T0/VdFxK+J8jrnTj9rr+Sde0XZLrOr6ejFD2uuoAJia9vPKUk0CxFa/QaUFrzmb2FexNVM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n87q98H5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n87q98H5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780434642; x=1811970642;
  h=date:from:to:cc:subject:message-id;
  bh=DI3I6mHPQR4Mv6gqML/Qcvg1GMZoJbg34a6kouIcav8=;
  b=n87q98H5WlwQ5CjEZnmMkWB+KaaXMmVlTb5zzHnwDQ5bGUIdbPyLMvBB
   ecHjY+OfzhW0m9OfwjsCbtHDNz5TsjcG5WzfAcvudEQRB2SF/1io5L+jG
   xlvP/dwYreQIMzpH2khmRkc9GCwzmqbsJ0L8DVxLgqlJVBQXfqyVR88i7
   o0fgV/rgRvYTnGuhllKlclyaYQTUoZCfZSXe8vurdfgUPv6OCq3y/kSqz
   kdBEeK3FM0j3mRUDjWCL8kkiSrVm9JEl+Y1U4AVATUQKahniySSX59EKb
   9+D3zMGrIP98JA4VR0AOWyNITbPnYlH1y/jPdKlWPCzUdfmzmh11Wnhb4
   A==;
X-CSE-ConnectionGUID: IhAZc2s5R7eh16VypgP0yw==
X-CSE-MsgGUID: f5Vwc20NQumpqYeaLtBsHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="85120284"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="85120284"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 14:10:38 -0700
X-CSE-ConnectionGUID: MR+Esi8AR6ajiQUl3uRFgw==
X-CSE-MsgGUID: qpxVCTFEQ6eHGucDEhJlfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="245831828"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jun 2026 14:10:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUWNW-00000000CX0-00hE;
	Tue, 02 Jun 2026 21:10:26 +0000
Date: Wed, 03 Jun 2026 05:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8269/9733]
 lib/crc/arm64/crc64-neon.h:14:9: sparse: sparse: Trying to use reserved word
 'return' as identifier
Message-ID: <202606030533.0WmeheRO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/crc/arm64/crc64-neon.h:14:9: sparse: sparse: Trying to use reserved word 'return' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Eric Biggers <ebiggers@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08484c504b55a98bd100527fbe10a3caf55ff3ff
commit: 061cef5fcee5a4bbaa8726f8c5fc1d5e2f89bff7 [8269/9733] lib/crc: Turn NEON intrinsics crc64 implementation into common code
:::::: branch date: 28 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r123-20260602 (https://download.01.org/0day-ci/archive/20260603/202606030533.0WmeheRO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030533.0WmeheRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606030533.0WmeheRO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34568:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: got __o
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34570:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got .
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function call
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got __temp
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34571:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: Expected ; at end of declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: got __o
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: Expected ) in function declarator
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: got (
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34573:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34587:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34587:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34594:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34594:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34601:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34601:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34609:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34609:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34617:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34617:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34625:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34625:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34632:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34632:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34640:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34640:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34648:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34648:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34656:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34656:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34665:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34665:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34672:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34672:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34679:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34679:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34688:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34688:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34695:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34695:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34702:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34702:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34709:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34709:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34716:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34716:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34723:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34723:1: sparse: sparse: got }
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34730:1: sparse: sparse: Expected ; at the end of type declaration
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:34730:1: sparse: sparse: got }
   lib/crc/crc64-neon.c: note: in included file:
   lib/crc/arm64/crc64-neon.h:7:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:7:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon.h:12:20: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:12:20: sparse: sparse: got m
>> lib/crc/arm64/crc64-neon.h:14:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/crc/arm64/crc64-neon.h:14:16: sparse: sparse: Expected ; at end of declaration
   lib/crc/arm64/crc64-neon.h:14:16: sparse: sparse: got vreinterpretq_u64_p128
   lib/crc/arm64/crc64-neon.h:15:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:15:1: sparse: sparse: got }
   lib/crc/arm64/crc64-neon.h:21:1: sparse: sparse: Expected ; at the end of type declaration
   lib/crc/arm64/crc64-neon.h:21:1: sparse: sparse: got }
   lib/crc/crc64-neon.c:22:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:22:20: sparse: sparse: got fold_consts
   lib/crc/crc64-neon.c:23:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:23:20: sparse: sparse: got v0
   lib/crc/crc64-neon.c:24:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:24:20: sparse: sparse: got zero
   lib/crc/crc64-neon.c:41:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:41:20: sparse: sparse: got bconsts
   lib/crc/crc64-neon.c:42:20: sparse: sparse: Expected ; at end of statement
   lib/crc/crc64-neon.c:42:20: sparse: sparse: got final
   lib/crc/crc64-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3164:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3164:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3171:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3171:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3178:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3178:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3185:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3185:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3192:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3192:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3199:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3199:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3206:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3206:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3213:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3213:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3220:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3220:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3227:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3227:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3234:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3234:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3241:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3241:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3248:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3248:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3255:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3255:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3264:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3264:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3271:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3271:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3278:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3278:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3285:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3285:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3292:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3292:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3299:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3299:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3306:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3306:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3313:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3313:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3320:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3320:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3327:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3327:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3334:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3334:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3341:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3341:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3348:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3348:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3355:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:3355:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6111:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6118:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6125:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6125:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6125:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6125:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6125:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/11.5.0/include/arm_neon.h:6125:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]

vim +/return +14 lib/crc/arm64/crc64-neon.h

061cef5fcee5a4 Ard Biesheuvel 2026-04-22   2  
061cef5fcee5a4 Ard Biesheuvel 2026-04-22   3  static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
061cef5fcee5a4 Ard Biesheuvel 2026-04-22   4  {
061cef5fcee5a4 Ard Biesheuvel 2026-04-22   5  	return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 0),
061cef5fcee5a4 Ard Biesheuvel 2026-04-22   6  						vgetq_lane_u64(b, 0)));
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  @7  }
061cef5fcee5a4 Ard Biesheuvel 2026-04-22   8  
061cef5fcee5a4 Ard Biesheuvel 2026-04-22   9  static inline uint64x2_t pmull64_high(uint64x2_t a, uint64x2_t b)
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  10  {
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  11  	poly64x2_t l = vreinterpretq_p64_u64(a);
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  12  	poly64x2_t m = vreinterpretq_p64_u64(b);
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  13  
061cef5fcee5a4 Ard Biesheuvel 2026-04-22 @14  	return vreinterpretq_u64_p128(vmull_high_p64(l, m));
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  15  }
061cef5fcee5a4 Ard Biesheuvel 2026-04-22  16  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
