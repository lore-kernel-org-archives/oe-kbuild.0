Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC4A3FEB1F
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362146; cv=none; b=ME5sbaDl2J2BLVhNc1u/Fzo00urackVK+GQrjCLli5hw5TsHUBshmRb46PuY1v4yKP2TavdAZbZ2yEPSZc01IYae5DMeksKN7gJK28djOmF+79cHUFCFrArk7lnnuLSLsu92DX2VjUrVk4sqgqozThOHt/bLFCMmJABgtFm1rSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362146; c=relaxed/simple;
	bh=z4HTVewevEnuCptAt6TYJJTzmDTPkBoXYeEdjSsWztU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MId6l3UYAyGFKcwwxW5yQtghUPj7p6HMksvAurD5gIOUhZTdf3JKtKxVu/gvxcS3WnCUhOBA+may9hlfD/OOP14OQ2AzkRaJJTR/lVpv0V2lvnRwLDfdKvDM/nmM6LgtztH1s0KnsEdW9hptmQ0cwfI/Z3UzTryXp2U6ld+GcMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOeEG9wP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOeEG9wP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774362140; x=1805898140;
  h=date:from:to:cc:subject:message-id;
  bh=z4HTVewevEnuCptAt6TYJJTzmDTPkBoXYeEdjSsWztU=;
  b=WOeEG9wP67jDC8pg0zacH8o7GA7KGJan2O8qInYgDMqXko6ldyMMbqti
   2kXU/Ihy7rw47TYbNExIvDVVMSR9h0+niINfgausQGLp+8bFzJiRnv83c
   1O6MonqC4rb5ktgtrZbU9huG0jNhPF1KHUOTrWaINg63fnV/UzEsegAOo
   5qMlGUXgA09dedpXtwf3Y9N8IjPqJ9tLRUAz3uK3WuIhrJgBIw1yz5Gyt
   v8lbfBMQz7ozYvNC7NRDyC7iFXqn8yEauUmhDVFOyCeHwquPk3f013BNo
   SWVZPDJ3WYDbqn29MXyunMyz/aHIF4ma4pPHe4zPho1UgxOhffSTLOj8A
   w==;
X-CSE-ConnectionGUID: wjHLIeqwQ02VXC/C8kkJQw==
X-CSE-MsgGUID: /LEQcunCSjmVnSX3egdwiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75448469"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75448469"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 07:22:19 -0700
X-CSE-ConnectionGUID: Vx/lVJ7xS+qXIUuBCaicGQ==
X-CSE-MsgGUID: TWnIqXWbSBKZBTwyGqW0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="247435236"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Mar 2026 07:22:18 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w52e7-000000004gT-2OCW;
	Tue, 24 Mar 2026 14:22:15 +0000
Date: Tue, 24 Mar 2026 22:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 84/139]
 lib/raid/xor/arm64/xor-neon.c:311:1: sparse: sparse: Trying to use reserved
 word 'while' as identifier
Message-ID: <202603242241.jlMmAqqE-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   5d52decfc868efa2049fafb60878067b6588739d
commit: 17fd9317d762b8723a69c4eb62e7bf1769f77b63 [84/139] xor: pass the entire operation to the low-level ops
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-r122-20260324 (https://download.01.org/0day-ci/archive/20260324/202603242241.jlMmAqqE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603242241.jlMmAqqE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603242241.jlMmAqqE-lkp@intel.com/

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
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3164:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3164:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3171:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3171:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3178:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3178:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3185:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3185:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3192:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3192:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3199:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3199:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3206:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3206:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3213:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3213:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3220:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3220:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3227:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3227:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3234:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3234:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3241:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3241:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3248:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3248:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3255:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3255:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3264:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3264:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3271:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3271:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3278:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3278:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3285:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3285:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3292:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3292:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3299:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3299:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3306:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3306:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3313:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3313:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3320:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3320:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3327:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3327:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3334:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3334:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3341:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3341:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3348:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3348:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3355:10: sparse: sparse: undefined identifier '__b'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:3355:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6111:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse: sparse: undefined identifier '__index'
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse: sparse: bad constant expression type
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse: sparse: invalid initializer
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6118:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse: sparse: symbol '__vec' redeclared with different type (different base types):
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse:    int [addressable] [toplevel] __vec
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse: note: previously declared as:
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse: sparse: bad constant expression
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6125:10: sparse:    incomplete type [addressable] [toplevel] __vec[0]
   ../lib/gcc/aarch64-linux/10.5.0/include/arm_neon.h:6132:10: sparse: sparse: undefined identifier '__index'

vim +/while +311 lib/raid/xor/arm64/xor-neon.c

2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  264  
17fd9317d762b8 lib/raid/xor/arm64/xor-neon.c Christoph Hellwig 2026-03-11  265  static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
297565aa22cfa8 arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2022-02-05  266  		const unsigned long * __restrict p2,
297565aa22cfa8 arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2022-02-05  267  		const unsigned long * __restrict p3,
297565aa22cfa8 arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2022-02-05  268  		const unsigned long * __restrict p4,
297565aa22cfa8 arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2022-02-05  269  		const unsigned long * __restrict p5)
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  270  {
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  271  	uint64_t *dp1 = (uint64_t *)p1;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  272  	uint64_t *dp2 = (uint64_t *)p2;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  273  	uint64_t *dp3 = (uint64_t *)p3;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  274  	uint64_t *dp4 = (uint64_t *)p4;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  275  	uint64_t *dp5 = (uint64_t *)p5;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  276  
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  277  	register uint64x2_t v0, v1, v2, v3;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  278  	long lines = bytes / (sizeof(uint64x2_t) * 4);
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  279  
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  280  	do {
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  281  		/* p1 ^= p2 ^ p3 */
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  282  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  283  			  vld1q_u64(dp3 + 0));
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  284  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  285  			  vld1q_u64(dp3 + 2));
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  286  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  287  			  vld1q_u64(dp3 + 4));
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  288  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  289  			  vld1q_u64(dp3 + 6));
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  290  
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  291  		/* p1 ^= p4 ^ p5 */
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  292  		v0 = eor3(v0, vld1q_u64(dp4 + 0), vld1q_u64(dp5 + 0));
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  293  		v1 = eor3(v1, vld1q_u64(dp4 + 2), vld1q_u64(dp5 + 2));
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  294  		v2 = eor3(v2, vld1q_u64(dp4 + 4), vld1q_u64(dp5 + 4));
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  295  		v3 = eor3(v3, vld1q_u64(dp4 + 6), vld1q_u64(dp5 + 6));
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  296  
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  297  		/* store */
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  298  		vst1q_u64(dp1 + 0, v0);
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  299  		vst1q_u64(dp1 + 2, v1);
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  300  		vst1q_u64(dp1 + 4, v2);
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  301  		vst1q_u64(dp1 + 6, v3);
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  302  
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  303  		dp1 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  304  		dp2 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  305  		dp3 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13 @306  		dp4 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  307  		dp5 += 8;
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13  308  	} while (--lines > 0);
2c54b423cf85ba arch/arm64/lib/xor-neon.c     Ard Biesheuvel    2021-12-13 @309  }
17fd9317d762b8 lib/raid/xor/arm64/xor-neon.c Christoph Hellwig 2026-03-11  310  
17fd9317d762b8 lib/raid/xor/arm64/xor-neon.c Christoph Hellwig 2026-03-11 @311  __DO_XOR_BLOCKS(eor3_inner, __xor_neon_2, __xor_eor3_3, __xor_eor3_4,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
