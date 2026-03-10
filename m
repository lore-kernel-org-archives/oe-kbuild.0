Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C244D013
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Mar 2026 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136264; cv=none; b=mAO5ppkaHLJMtn0rqYjaOcaF22E65WMyusRXOW1pm0fdP8FYmMChZbr5VkjvRAttk3BS4Ny4xNA6scQ7KUxXPDLQwIfQs3F5IT+LoJFYvA+EFHSxQa3+xMI4YK48Ho62Zcg0HIVA3v8N8AOLhiOLuerUpt2lUU5LhnbrEJEV8hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136264; c=relaxed/simple;
	bh=HmD4o3zG18wrnmg9HkiBNleCL9jPnhj9fYPihSUfteQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dc4QrIZg5+jINwIviNTNi8sT0PYhzCSYT2xUS189lhhwxhYnuWgugVlY2WXM1IOnI+LNkUyKe3v/4rTq6ygcPXgV27Adgia+2ME0GUq54SOYlsUAITvqw1T/uEYj/Qb+w8h+MRinTu/OeYOM3IsqAKXvKgq5aluKDZFktz+pGF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eotgMF4n; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eotgMF4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773136259; x=1804672259;
  h=date:from:to:cc:subject:message-id;
  bh=HmD4o3zG18wrnmg9HkiBNleCL9jPnhj9fYPihSUfteQ=;
  b=eotgMF4nIgaD1GhjCBSLpacjbv1RVy66Ct30i7ackwTas3Cc67lHkBmS
   CyKZAmvyIDq8h/fhxAGkBydKTcIpsbE3c+7vcM+f80gtH6IOyw2fV5Ral
   lTF4f8E9kTcZrVi5HigshuKU4ylTM71K5YR7HyAidfpslxBZpChL9XwaT
   L7F7P2SUGKtD12LgP7VSjnrZyagXCUcuifMFyVXvVxooFo6TCbYHb20B2
   Hb13aKeRJGGs87921vivgITpbjg6zrOm4Zhc1uJu8CDR9iVqK60bomyKD
   KGGS69hMj0jmjewpvpp8HI0TEqR6ndIakO+5Yd9+Gpwk/fA+ziupSz4nA
   w==;
X-CSE-ConnectionGUID: 7ELm5630QxSR34ILlrKOTw==
X-CSE-MsgGUID: 5GwXrWWjQu+VNZEPHOAnuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85533619"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="85533619"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 02:50:56 -0700
X-CSE-ConnectionGUID: h14UnzoGSkCPN2rO76AZwA==
X-CSE-MsgGUID: MyAfQA0wRzWEWQoQtkQx1A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Mar 2026 02:50:55 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vztjp-000000001fg-2CvS;
	Tue, 10 Mar 2026 09:50:53 +0000
Date: Tue, 10 Mar 2026 17:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 75/120]
 lib/raid/xor/arm/xor-neon.c:9:2: sparse: sparse: You should compile this file
 with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
Message-ID: <202603101759.nId075YX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/raid/xor/arm/xor-neon.c:9:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
TO: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   6030b05cd1b4407de19e2fceb7a7bd1667bb00f5
commit: 2ddd42327368dbaf8bc94e4463775084cdabe008 [75/120] arm: move the XOR code to lib/raid/
:::::: branch date: 28 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-r112-20260308 (https://download.01.org/0day-ci/archive/20260310/202603101759.nId075YX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101759.nId075YX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603101759.nId075YX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/raid/xor/arm/xor-neon.c:9:2: sparse: sparse: You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'

vim +9 lib/raid/xor/arm/xor-neon.c

01956597cbc46d arch/arm/lib/xor-neon.c Ard Biesheuvel    2013-05-17   7  
01956597cbc46d arch/arm/lib/xor-neon.c Ard Biesheuvel    2013-05-17   8  #ifndef __ARM_NEON__
de9c0d49d85dc5 arch/arm/lib/xor-neon.c Nathan Chancellor 2019-02-02  @9  #error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
01956597cbc46d arch/arm/lib/xor-neon.c Ard Biesheuvel    2013-05-17  10  #endif
01956597cbc46d arch/arm/lib/xor-neon.c Ard Biesheuvel    2013-05-17  11  

:::::: The code at line 9 was first introduced by commit
:::::: de9c0d49d85dc563549972edc5589d195cd5e859 ARM: 8833/1: Ensure that NEON code always compiles with Clang

:::::: TO: Nathan Chancellor <natechancellor@gmail.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
