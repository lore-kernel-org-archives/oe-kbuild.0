Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED82366550
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 18:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771612651; cv=none; b=qmGIzmT12Q9MJNpoKT8F7GaYXnDT39vboMIrlcNTtAOOS9knaBL7XaYvvUiRkWqy55WNAeEDf2ylUXSo6Q2qSdyZQNVWSaXFJ65XjtRMWFyT3idAy5DpSlAKjOZjWaSNT2+ROPVSpdb0+uC6apigeAFcy5nzPs+yVMxlpdvhUF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771612651; c=relaxed/simple;
	bh=5B6prZlkbupAuWIOW6UeDMaqMRiZUd3SI+WFmZTfJz4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JuHlViii3qpdKScIE+QfpM8GbuyQPGDYxD9tSbJ3DcjIIapLWoY7NDbh0invixAzSemm60nJTN4Q2TfS1/DxXWw6JmswH3NPCZsZZ0PDXYW90ToKJuI9occ+QP1ogqQ6n0cRb2fE3enJj+NdpnSq8IGUCNdO0La88iRbQ4B0aEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TE6F+xa3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TE6F+xa3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771612647; x=1803148647;
  h=date:from:to:cc:subject:message-id;
  bh=5B6prZlkbupAuWIOW6UeDMaqMRiZUd3SI+WFmZTfJz4=;
  b=TE6F+xa38cryUVg3NoY4UKO57Mstiq0Z0kRY1jNEUFDkl/qHH7e5RTDv
   8nMdtnJavAASX5Kn/CZ9CmwvrmIpkjp6mM5kG+pDpnyRNgbjNAbr67ED6
   bs/QHp3CZv8KL8KZ+CcRchcFalEJCUV4tpowJM1ET839g9r0d8sc8nXWD
   x7Nmv3Hg7vorCCdXSoXXu8yERU+zqPi+AioIQGVl1QX/Cdb9KLB7ioN13
   z+vIINDLsu0RSPQ8SrdhlAUUNqW02TwYl7SnHuQbg2c4y1L5ueZTiTtop
   s163J9Ogi7ZhvxgsDSItmOK0januH0XKpD9vucS/bkOKBjOte3J+LzCvB
   Q==;
X-CSE-ConnectionGUID: KrlCM/R2Tji8gKda6PhqwQ==
X-CSE-MsgGUID: by9lG3arTQqbYc0UNKOLkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84070302"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84070302"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 10:37:26 -0800
X-CSE-ConnectionGUID: D1UJV+STRNmCLd1+RdZXjw==
X-CSE-MsgGUID: EaAKQH1zSnCXkKVodz/1nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219924318"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Feb 2026 10:37:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtVNS-000000014Nq-3nEv;
	Fri, 20 Feb 2026 18:37:22 +0000
Date: Sat, 21 Feb 2026 02:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-misc:xor-improvements 24/25]
 lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved
 word 'while' as identifier
Message-ID: <202602210254.uP4CNHxi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'while' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git xor-improvements
head:   b59ee0f84041aa86ac6b994429874f54186a87d3
commit: cdea18a07f19192a128ae7e4a1545c51f4b3b79c [24/25] xor: pass the entire operation to the low-level ops
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-r131-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210254.uP4CNHxi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210254.uP4CNHxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602210254.uP4CNHxi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid/xor/arm64/xor-neon.c: note: in included file (through lib/raid/xor/xor_impl.h):
   include/linux/minmax.h:279:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:279:1: sparse: sparse: got }
   include/linux/minmax.h:284:1: sparse: sparse: Expected ; at the end of type declaration
   include/linux/minmax.h:284:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c: note: in included file:
   lib/raid/xor/xor_impl.h:14:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/xor_impl.h:14:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:19:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:19:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:48:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:48:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:86:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:86:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:133:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:133:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:178:26: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:178:26: sparse: sparse: got eor3
   lib/raid/xor/arm64/xor-neon.c:185:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/xor/arm64/xor-neon.c:185:16: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:185:16: sparse: sparse: got res
   lib/raid/xor/arm64/xor-neon.c:186:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:186:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:196:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:196:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:199:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:199:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:199:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:211:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:211:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:212:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:212:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:213:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:213:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:214:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:214:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:216:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:216:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:217:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:217:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:218:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:218:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:219:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:219:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:220:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:220:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:232:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:232:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:235:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:235:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:235:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:253:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:253:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:254:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:254:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:255:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:255:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:256:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:256:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:258:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:258:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:259:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:259:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:260:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:260:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:261:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:261:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:262:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:262:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:263:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:263:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:277:29: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:277:29: sparse: sparse: got v0
   lib/raid/xor/arm64/xor-neon.c:280:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:280:12: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:280:12: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:298:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:298:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:299:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:299:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:300:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:300:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:301:31: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:301:31: sparse: sparse: got +
   lib/raid/xor/arm64/xor-neon.c:303:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:303:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:304:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:304:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:305:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:305:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:306:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:306:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:307:21: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:307:21: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:308:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:308:9: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:309:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:309:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got >
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'while' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got {
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got !
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ) in nested declarator
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got <
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ) in function declarator
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got ==
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'if' as identifier
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got if
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got if
>> lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved word 'else' as identifier
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got __xor_eor3_5
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got -=
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at end of declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got +=
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: got }
   lib/raid/xor/arm64/xor-neon.c: note: in included file (through arch/arm64/include/asm/neon-intrinsics.h):
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2636:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2636:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2643:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2643:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2650:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2650:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2657:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2657:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2664:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2664:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2671:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2671:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2678:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2678:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2685:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2685:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2692:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2692:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2699:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2699:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2706:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2706:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2713:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2713:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2720:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2720:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2727:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2727:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2736:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2736:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2743:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2743:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2750:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2750:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2757:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2757:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2764:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2764:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2771:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2771:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2778:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2778:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2785:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2785:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2792:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2792:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2799:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2799:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2806:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2806:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2813:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2813:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2820:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2820:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2827:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2827:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2836:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2843:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2850:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/13.4.0/include/arm_neon.h:2857:10: sparse: sparse: undefined identifier '__index'

vim +/while +311 lib/raid/xor/arm64/xor-neon.c

cdea18a07f1919 Christoph Hellwig 2026-02-19  310  
cdea18a07f1919 Christoph Hellwig 2026-02-19 @311  __DO_XOR_BLOCKS(eor3_inner, __xor_neon_2, __xor_eor3_3, __xor_eor3_4,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
