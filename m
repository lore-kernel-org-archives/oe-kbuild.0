Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056304;
	b=4NgknY4MzdwtuQS57pcsI3Iyz5dXcPfbb+2Rc36RQ4r0VVsoglNSmN2jgZA/wedbz2hB
	 siG5V2R0kjY/mYP1mRcd/MHuPwIWomsnhb35KWKn1TuwIZHShRYdmy7LC7R+EVNlwyymT
	 2hn6LBOL2OwQjcs+a0jbNpwq6KsyO2iVMJ+uT6THsPRLXrIYUCI6wEmGdzHkUlLFsvOfA
	 DOcPTS7O+zEpO2zOAiL8J/p0vmNjJ+347jQgf7x3Rqk05brOOx0PzT53j6/ItNWJCbgFU
	 uDZcM4A/Hij/GPgdyspXgU7ff3/FLzU3i0qotKoOf8fFjV2Uz/Z/ILV4FHPB8ScJPOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056304;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pYZ3asOn6vKznrt8IgwQghm/v0y6KF57E+Udofy6mgg=;
	b=wOw/btrpoxXFCMiddSVLwHzfr89Fqx7L0UNE8wgbyhND0qQ1hFOCB6LiscA96WyFwUVY
	 RRDprMLEcdCZjtPMEu1X8s+3m0Syodsd7teLa8N8PQdXnnXYSJJGdQyqUqwbUHxp803Eu
	 iVh6lA9I54vS2kgavMcF5SlWIoDAshu0HWnFiinUzWlGrzARDc0U5K+uau1aD6CdvRhdV
	 9mV60J3voA/aJfvtzfqxVVljZ68oGZ3Xfd1wjflKKdFRv6b7L4bG0q3W6jItRe0ktyE/+
	 RMfOZOSGCaoJBY+yAdgsXlI/ykgdupJL8lwrdIQrnZ4KFKq/Y1gUJbyU2Ha5PGHvkuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c6tw7ApH;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D266606A31A
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Oct 2026 23:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D266606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c6tw7ApH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793056302; x=1824592302;
  h=date:from:to:cc:subject:message-id;
  bh=9N359xsvVd5PBr3E+U4XqTLbeEyuu7rL1i1m3dliA3U=;
  b=c6tw7ApHV2RrKz1eIG8Jpe0Kax7tqH8K9K61lFc9x3TpqwXs38vUP1MU
   piNgfo6m8wNY0mdy86BLScse1OfTQAK/0q6iXcp1u2xbQ26gh1dDhVIe3
   RT03g2Ladtaz2Xbxk2tZvRe5poEMHSfBxI6YPAxRUYrRA9PStERI83HOq
   UzLjpEEA1twtGF8mNVxHd58wywLC5OTvVSaO2XsNhg2GXrxsebTrnc/DN
   wWbXYoZk6Vucm0Fl+tDUK9Hkn19dVXJsm+88DEA89VQrdPQ90sNGjah5R
   S/Rfgz/ctfj03TJ4piNeldOzQSf97v+GNRz0HoAi/GHtbBs6Z3+AICgOy
   A==;
X-CSE-ConnectionGUID: ffQ4xsSrQ0Oo0adL4nY79g==
X-CSE-MsgGUID: +zVhZzJaQQa8xSdxMwAVbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1628171"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1628171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 16:11:41 -0700
X-CSE-ConnectionGUID: /Lt7zY/xSkqop/9JpsF/tQ==
X-CSE-MsgGUID: l3R2mWx+TeOrq8eryzH/+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4254222"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2026 16:11:40 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLTqs-000000004Gl-0ZRV;
	Mon, 26 Oct 2026 23:11:38 +0000
Date: Tue, 27 Oct 2026 00:10:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: undefined symbol:
 __kcfi_typeid_aria_aesni_avx_encrypt_16way
Message-ID: <202610270004.o2T9YaDu-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d135ab453a7400a34930bdda1ef4bdc8acfac80e
commit: 4e5019216402ad0b4a84cff457b662d26803f103 objtool: Fix Clang jump table detection
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-2104-20261026 (https://download.01.org/0day-ci/archive/20261027/202610270004.o2T9YaDu-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270004.o2T9YaDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4e5019216402 ("objtool: Fix Clang jump table detection")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610270004.o2T9YaDu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_encrypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:962 (arch/x86/crypto/aria-aesni-avx-asm_64.S:962)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_encrypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_decrypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:987 (arch/x86/crypto/aria-aesni-avx-asm_64.S:987)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_decrypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_ctr_crypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:1088 (arch/x86/crypto/aria-aesni-avx-asm_64.S:1088)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_ctr_crypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_gfni_encrypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:1257 (arch/x86/crypto/aria-aesni-avx-asm_64.S:1257)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_gfni_encrypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_gfni_decrypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:1282 (arch/x86/crypto/aria-aesni-avx-asm_64.S:1282)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_gfni_decrypt_16way)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid_aria_aesni_avx_gfni_ctr_crypt_16way
   >>> referenced by aria-aesni-avx-asm_64.S:1307 (arch/x86/crypto/aria-aesni-avx-asm_64.S:1307)
   >>>               vmlinux.o:(__cfi_aria_aesni_avx_gfni_ctr_crypt_16way)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
