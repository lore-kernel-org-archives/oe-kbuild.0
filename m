Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA08457D221
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789062219; cv=none; b=b3kncwLF7Vijda9rI4wwWE9Nm6BqtWk9vPo0h7cnEsgNqcsyQkzhDVlOBaZeIkWyuuPRRzudgXOFCeVT4zuBg0UR4lTf36i4qLCNgTVrAEQMxtzLnzcMTrIFNhgWvXq/aGyBVQzpA5ayGQ98yMr00txgPnvRD3IGtTOZBzpkCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789062219; c=relaxed/simple;
	bh=tLULWEQd7QDh08cvy11Q9+4N3cXbD+UmVasRCLcoHYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YifCk4+munhyy4SLJGF9U+pRUK1thM+L2gSMJFW9gJLSL+5VM4arbLrM5/Q8M1LU0WFzPAXiYbcpZJwBybsoFgCCbbuJ10YsDL1afC3zLCwGN5TiPa/yKvq08OjnkAaUoqKSx4KFCwtx01hdcFPK71QziN745300GGgnVYwOQf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjsHZhUr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjsHZhUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789062197; x=1820598197;
  h=date:from:to:cc:subject:message-id;
  bh=tLULWEQd7QDh08cvy11Q9+4N3cXbD+UmVasRCLcoHYM=;
  b=HjsHZhUrc9UqkRzxEfA8xQsyaqJnFftabYC/AE9qLp7hVaZi5hywNYe9
   u1I4T6PG5zvwj50ACPF73LjsdxOAFKpTCBag1fEuL679IdW3nx6169tW3
   Zibsl2DeodDcgW//YX14MPyf6ca63Ln+uY9F0M+Z9ifdZsRtodOk/Z8hF
   CY7mvQodzwSyIGcqzWIrqH4wmiCAeQaAY9uouyVuzXPfQsPUCp1XFQ4kF
   ncFDKYyUI0EmBUV0FB2eEPqQAhlkmX1w56sOiEaWd3H4a0iWtjjKqJebL
   UOU9PBMSPqHdN6avqOpYZspqHxRySwYaD0FgWxmCqfqfveHr4UzJ3Lawp
   g==;
X-CSE-ConnectionGUID: tmugdMBZT16zEn/EC0cDZg==
X-CSE-MsgGUID: Ecbc9XkdSkawCMKJiZNwxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89535627"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89535627"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 10:43:11 -0700
X-CSE-ConnectionGUID: 965FObvAQtqNbtp6lFw6qQ==
X-CSE-MsgGUID: D4IADU35S42jcuq45Vn9Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="268414819"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2026 10:43:09 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4ind-000000000N1-3NFB;
	Thu, 10 Sep 2026 17:43:02 +0000
Date: Fri, 11 Sep 2026 01:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/raid/raid6/powerpc/vpermxor1.c:29:16: sparse: sparse:
 two or more data types in declaration specifiers
Message-ID: <202609110010.Zdu3ogcE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: lib/raid/raid6/powerpc/vpermxor1.c:29:16: sparse: sparse: two or more data types in declaration specifiers"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Christoph,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: 3626738bc7147d52cb49f3994a9846aa2d34810a raid6: move to lib/raid/
date:   4 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-r134-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110010.Zdu3ogcE-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110010.Zdu3ogcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3626738bc714 ("raid6: move to lib/raid/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609110010.Zdu3ogcE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17661:9: sparse: sparse: got vec_perm
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: got unsigned
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: got char
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/vpermxor1.c:29:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor1.c:29:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor1.c:29:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor1.c:29:25: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor1.c:32:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor1.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor1.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor1.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor1.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor1.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor1.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor1.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor1.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor1.c:45:19: sparse: sparse: got wp0
>> lib/raid/raid6/powerpc/vpermxor1.c:52:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:55:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:63:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor1.c:64:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697)
   lib/raid/raid6/powerpc/vpermxor1.c:45:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:52:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid/raid6/powerpc/vpermxor1.c:52:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid/raid6/powerpc/vpermxor1.c:52:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:52:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:55:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid/raid6/powerpc/vpermxor1.c:55:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:55:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid/raid6/powerpc/vpermxor1.c:57:25: sparse: sparse: undefined identifier 'wp0'
--
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17661:9: sparse: sparse: got vec_perm
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: got unsigned
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: got char
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/vpermxor4.c:29:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor4.c:29:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor4.c:29:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor4.c:29:25: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor4.c:32:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor4.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor4.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor4.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor4.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor4.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor4.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor4.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor4.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:45:19: sparse: sparse: got wp0
   lib/raid/raid6/powerpc/vpermxor4.c:46:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:46:19: sparse: sparse: got wp1
   lib/raid/raid6/powerpc/vpermxor4.c:47:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:47:19: sparse: sparse: got wp2
   lib/raid/raid6/powerpc/vpermxor4.c:48:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor4.c:48:19: sparse: sparse: got wp3
>> lib/raid/raid6/powerpc/vpermxor4.c:55:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:56:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:57:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:58:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:61:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:62:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:63:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:64:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:81:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:82:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:83:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:84:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:85:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:86:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:87:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor4.c:88:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:9: sparse: sparse: undefined identifier '__b'
--
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17661:9: sparse: sparse: got vec_perm
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: got unsigned
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: got char
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec8.c:37:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/altivec8.c:37:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   lib/raid/raid6/powerpc/altivec8.c:37:23: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:37:23: sparse: sparse: got char
   lib/raid/raid6/powerpc/altivec8.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec8.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:49:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec8.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:60:27: sparse: sparse: got vec_cmpgt
   lib/raid/raid6/powerpc/altivec8.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec8.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:74:19: sparse: sparse: got wd1
   lib/raid/raid6/powerpc/altivec8.c:75:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:75:19: sparse: sparse: got wd2
   lib/raid/raid6/powerpc/altivec8.c:76:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:76:19: sparse: sparse: got wd3
   lib/raid/raid6/powerpc/altivec8.c:77:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:77:19: sparse: sparse: got wd4
   lib/raid/raid6/powerpc/altivec8.c:78:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:78:19: sparse: sparse: got wd5
   lib/raid/raid6/powerpc/altivec8.c:79:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:79:19: sparse: sparse: got wd6
   lib/raid/raid6/powerpc/altivec8.c:80:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:80:19: sparse: sparse: got wd7
   lib/raid/raid6/powerpc/altivec8.c:81:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:81:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec8.c:87:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:87:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec8.c:87:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec8.c:87:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:87:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec8.c:87:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:87:37: sparse: sparse: got +=
>> lib/raid/raid6/powerpc/altivec8.c:89:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:90:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:91:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:92:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:93:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:94:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:95:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:96:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:96:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec8.c:96:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec8.c:96:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:96:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec8.c:96:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:96:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec8.c:98:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:99:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:100:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:101:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:102:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:103:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:104:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec8.c:153:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:153:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:155:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:155:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:156:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:156:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:157:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:157:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:158:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:158:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:159:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:159:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:160:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:160:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:161:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:161:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:162:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:162:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:163:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:163:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:164:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:164:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:165:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:165:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:166:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:166:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:167:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:167:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:168:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:168:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:169:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec8.c:169:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec8.c:170:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:170:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:175:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:175:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:181:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec8.c:182:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec8.c:182:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697)
   lib/raid/raid6/powerpc/altivec8.c:83:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec8.c:84:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:84:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec8.c:84:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec8.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec8.c:85:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec8.c:85:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
--
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17661:9: sparse: sparse: got vec_perm
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: got unsigned
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: got char
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec1.c:37:16: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/altivec1.c:37:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   lib/raid/raid6/powerpc/altivec1.c:37:23: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:37:23: sparse: sparse: got char
   lib/raid/raid6/powerpc/altivec1.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec1.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:49:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec1.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec1.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:60:27: sparse: sparse: got vec_cmpgt
   lib/raid/raid6/powerpc/altivec1.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec1.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:74:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec1.c:80:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:80:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec1.c:80:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec1.c:80:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:80:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec1.c:80:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:80:37: sparse: sparse: got +=
   lib/raid/raid6/powerpc/altivec1.c:82:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:82:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec1.c:82:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec1.c:82:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:82:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec1.c:82:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:82:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec1.c:90:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:90:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:92:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec1.c:92:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec1.c:93:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:93:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:98:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:98:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:104:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec1.c:105:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec1.c:105:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697)
   lib/raid/raid6/powerpc/altivec1.c:76:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec1.c:77:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec1.c:77:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec1.c:77:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec1.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec1.c:78:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec1.c:78:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
--
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: got unsigned
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: got char
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/vpermxor8.c:29:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/vpermxor8.c:29:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor8.c:29:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor8.c:29:25: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor8.c:32:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor8.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor8.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor8.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor8.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor8.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor8.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor8.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor8.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:45:19: sparse: sparse: got wp0
   lib/raid/raid6/powerpc/vpermxor8.c:46:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:46:19: sparse: sparse: got wp1
   lib/raid/raid6/powerpc/vpermxor8.c:47:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:47:19: sparse: sparse: got wp2
   lib/raid/raid6/powerpc/vpermxor8.c:48:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:48:19: sparse: sparse: got wp3
   lib/raid/raid6/powerpc/vpermxor8.c:49:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:49:19: sparse: sparse: got wp4
   lib/raid/raid6/powerpc/vpermxor8.c:50:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:50:19: sparse: sparse: got wp5
   lib/raid/raid6/powerpc/vpermxor8.c:51:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:51:19: sparse: sparse: got wp6
   lib/raid/raid6/powerpc/vpermxor8.c:52:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor8.c:52:19: sparse: sparse: got wp7
>> lib/raid/raid6/powerpc/vpermxor8.c:59:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:60:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:61:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:62:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:63:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:64:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:65:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:66:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:69:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:70:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:71:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:72:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:73:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:74:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:75:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:76:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:105:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:106:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:107:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:108:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:109:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:110:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:111:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:112:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:113:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:114:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:115:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:116:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:117:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:118:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:119:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor8.c:120:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:9: sparse: sparse: undefined identifier '__b'
--
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17661:9: sparse: sparse: got vec_perm
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: got unsigned
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: got char
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/vpermxor2.c:29:16: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor2.c:29:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor2.c:29:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor2.c:29:25: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor2.c:32:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor2.c:32:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor2.c:32:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor2.c:32:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor2.c:35:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid/raid6/powerpc/vpermxor2.c:35:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid/raid6/powerpc/vpermxor2.c:35:30: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/vpermxor2.c:35:30: sparse: sparse: got char
   lib/raid/raid6/powerpc/vpermxor2.c:45:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor2.c:45:19: sparse: sparse: got wp0
   lib/raid/raid6/powerpc/vpermxor2.c:46:19: sparse: sparse: Expected ; at end of statement
   lib/raid/raid6/powerpc/vpermxor2.c:46:19: sparse: sparse: got wp1
   lib/raid/raid6/powerpc/vpermxor2.c:53:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:54:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:57:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:58:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:69:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:70:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:71:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/vpermxor2.c:72:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:9: sparse: sparse: undefined identifier '__b'
--
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17661:9: sparse: sparse: got vec_perm
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: got unsigned
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: got char
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec2.c:37:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/altivec2.c:37:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   lib/raid/raid6/powerpc/altivec2.c:37:23: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:37:23: sparse: sparse: got char
   lib/raid/raid6/powerpc/altivec2.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec2.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:49:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec2.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:60:27: sparse: sparse: got vec_cmpgt
   lib/raid/raid6/powerpc/altivec2.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec2.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:74:19: sparse: sparse: got wd1
   lib/raid/raid6/powerpc/altivec2.c:75:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:75:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec2.c:81:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:81:17: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec2.c:81:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec2.c:81:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:81:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec2.c:81:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:81:37: sparse: sparse: got +=
>> lib/raid/raid6/powerpc/altivec2.c:83:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec2.c:84:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:84:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec2.c:84:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec2.c:84:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:84:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec2.c:84:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:84:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec2.c:86:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec2.c:99:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:99:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:101:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec2.c:101:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c:102:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec2.c:102:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c:103:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec2.c:103:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec2.c:104:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:104:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:109:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:109:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got (
>> lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:115:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec2.c:116:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec2.c:116:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697)
   lib/raid/raid6/powerpc/altivec2.c:77:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec2.c:78:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:78:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:78:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec2.c:79:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:79:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:79:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec2.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec2.c:83:23: sparse: sparse: undefined identifier 'wp1'
>> lib/raid/raid6/powerpc/altivec2.c:83:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec2.c:83:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:86:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec2.c:86:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec2.c:87:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:88:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:89:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec2.c:90:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec2.c:91:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec2.c:92:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec2.c:93:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec2.c:93:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:89)
   lib/raid/raid6/powerpc/altivec2.c:94:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec2.c:94:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:90)
   lib/raid/raid6/powerpc/altivec2.c:95:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:95:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:91)
   lib/raid/raid6/powerpc/altivec2.c:96:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:96:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:92)
   lib/raid/raid6/powerpc/altivec2.c:97:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:98:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec2.c:98:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec2.c:83)
   lib/raid/raid6/powerpc/altivec2.c:101:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:101:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:102:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:102:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:103:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:103:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec2.c:75:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec2.c:114:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec2.c:114:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec2.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec2.c:128:9: sparse: sparse: undefined identifier 'raid6_altivec2_gen_syndrome'
   lib/raid/raid6/powerpc/altivec2.c:130:9: sparse: sparse: undefined identifier 'raid6_have_altivec'
--
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17661:9: sparse: sparse: got vec_perm
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17662:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17720:16: sparse: sparse: got unsigned
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17721:23: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17722:25: sparse: sparse: got short
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17723:23: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17724:25: sparse: sparse: got int
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17725:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:39: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17727:46: sparse: sparse: got char
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17730:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17735:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17740:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17741:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17746:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17747:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17752:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17753:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17758:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17759:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17764:10: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:17765:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18000:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18005:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18010:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18011:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18017:26: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18018:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18023:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18024:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18029:24: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18030:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18035:25: sparse: sparse: got *
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18036:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18240:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18257:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18261:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18265:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18269:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18286:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18290:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18294:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:18299:1: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec4.c:37:16: sparse: sparse: two or more data types in declaration specifiers
>> lib/raid/raid6/powerpc/altivec4.c:37:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   lib/raid/raid6/powerpc/altivec4.c:37:23: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:37:23: sparse: sparse: got char
   lib/raid/raid6/powerpc/altivec4.c:46:45: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:46:45: sparse: sparse: got SHLBYTE
   lib/raid/raid6/powerpc/altivec4.c:49:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:49:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:60:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   lib/raid/raid6/powerpc/altivec4.c:60:27: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:60:27: sparse: sparse: got vec_cmpgt
   lib/raid/raid6/powerpc/altivec4.c:61:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:61:1: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:73:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:73:19: sparse: sparse: got wd0
   lib/raid/raid6/powerpc/altivec4.c:74:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:74:19: sparse: sparse: got wd1
   lib/raid/raid6/powerpc/altivec4.c:75:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:75:19: sparse: sparse: got wd2
   lib/raid/raid6/powerpc/altivec4.c:76:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:76:19: sparse: sparse: got wd3
   lib/raid/raid6/powerpc/altivec4.c:77:19: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:77:19: sparse: sparse: got x1d
   lib/raid/raid6/powerpc/altivec4.c:83:17: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:83:17: sparse: sparse: got =
>> lib/raid/raid6/powerpc/altivec4.c:83:9: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec4.c:83:25: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:83:25: sparse: sparse: got <
   lib/raid/raid6/powerpc/altivec4.c:83:37: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:83:37: sparse: sparse: got +=
>> lib/raid/raid6/powerpc/altivec4.c:85:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:86:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:87:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:88:25: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:88:25: sparse: sparse: got =
   lib/raid/raid6/powerpc/altivec4.c:88:17: sparse: sparse: Trying to use reserved word 'for' as identifier
   lib/raid/raid6/powerpc/altivec4.c:88:36: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:88:36: sparse: sparse: got >=
   lib/raid/raid6/powerpc/altivec4.c:88:44: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:88:44: sparse: sparse: got --
   lib/raid/raid6/powerpc/altivec4.c:90:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:91:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:92:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid/raid6/powerpc/altivec4.c:117:17: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:117:17: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:119:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:119:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:120:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:120:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:121:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:121:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:122:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:122:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:123:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:123:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:124:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:124:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:125:29: sparse: sparse: Expected ) in nested declarator
   lib/raid/raid6/powerpc/altivec4.c:125:29: sparse: sparse: got *
   lib/raid/raid6/powerpc/altivec4.c:126:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:126:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:131:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:131:9: sparse: sparse: got }
>> lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ; at end of declaration
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got {
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ) in function declarator
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got (
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:137:9: sparse: sparse: got }
   lib/raid/raid6/powerpc/altivec4.c:138:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid/raid6/powerpc/altivec4.c:138:1: sparse: sparse: got }
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10107)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10116)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10125)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10134)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10143)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10152)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10161)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10241)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10250)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10259)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10268)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10170)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10281)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10290)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:10299)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14654)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14664)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14672)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14681)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14688)
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:9: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:13: sparse: sparse: bad constant expression type
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-e9846648fd/lib/clang/22/include/altivec.h:14697)
   lib/raid/raid6/powerpc/altivec4.c:79:14: sparse: sparse: undefined identifier 'disks'
   lib/raid/raid6/powerpc/altivec4.c:80:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:80:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:80:9: sparse:    int [addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:70:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid/raid6/powerpc/altivec4.c:81:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:81:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:81:9: sparse:    int [addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec4.c:70:16: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:70:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid/raid6/powerpc/altivec4.c:85:23: sparse: sparse: undefined identifier 'wp1'
>> lib/raid/raid6/powerpc/altivec4.c:85:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:85:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:86:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid/raid6/powerpc/altivec4.c:86:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:86:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:87:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid/raid6/powerpc/altivec4.c:87:29: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:87:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:90:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:90:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:91:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:91:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:92:31: sparse: sparse: cannot dereference this type
   lib/raid/raid6/powerpc/altivec4.c:92:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid/raid6/powerpc/altivec4.c:93:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:94:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:95:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:96:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:97:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:98:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:99:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:100:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid/raid6/powerpc/altivec4.c:101:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:102:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:103:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:104:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid/raid6/powerpc/altivec4.c:105:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec4.c:105:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:97)
   lib/raid/raid6/powerpc/altivec4.c:106:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec4.c:106:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:98)
   lib/raid/raid6/powerpc/altivec4.c:107:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec4.c:107:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:99)
   lib/raid/raid6/powerpc/altivec4.c:108:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid/raid6/powerpc/altivec4.c:108:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:100)
   lib/raid/raid6/powerpc/altivec4.c:109:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:109:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:101)
   lib/raid/raid6/powerpc/altivec4.c:110:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:110:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:102)
   lib/raid/raid6/powerpc/altivec4.c:111:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:111:25: sparse: sparse: symbol 'w12' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:103)
   lib/raid/raid6/powerpc/altivec4.c:112:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:112:25: sparse: sparse: symbol 'w13' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:104)
   lib/raid/raid6/powerpc/altivec4.c:113:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:114:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:114:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:85)
   lib/raid/raid6/powerpc/altivec4.c:115:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:115:25: sparse: sparse: symbol 'wq2' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:86)
   lib/raid/raid6/powerpc/altivec4.c:116:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid/raid6/powerpc/altivec4.c:116:25: sparse: sparse: symbol 'wq3' has multiple initializers (originally initialized at lib/raid/raid6/powerpc/altivec4.c:87)
   lib/raid/raid6/powerpc/altivec4.c:119:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:119:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:120:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:120:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:121:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:121:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:122:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:122:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:123:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:123:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:124:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:124:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:125:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:125:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse: note: previously declared as:
   lib/raid/raid6/powerpc/altivec4.c:77:9: sparse:    int static [toplevel] unative_t
   lib/raid/raid6/powerpc/altivec4.c:136:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid/raid6/powerpc/altivec4.c:136:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec4.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:62:20: sparse:    void static inline [gnu_inline] [toplevel] [unused] disable_kernel_altivec( ... )
   lib/raid/raid6/powerpc/altivec4.c:150:9: sparse: sparse: undefined identifier 'raid6_altivec4_gen_syndrome'
   lib/raid/raid6/powerpc/altivec4.c:152:9: sparse: sparse: undefined identifier 'raid6_have_altivec'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
