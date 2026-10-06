Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877E53BCD36
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 20:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791319932; cv=none; b=CxeFNVaNOFHe5iFbuLn82cQ6nspnramu/7+nnMUZQ1+HkkEkktPRd5aUBgSMjXQQoMyWmeU+H5AHzoLI+PiEMijyBqSBAp8xUft10VUXDybNCb34vNsXnhoHwygEu2wum8MajGYfPcQ9Sed7D1mIcyehTM5t2SIpy3hSauDH8ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791319932; c=relaxed/simple;
	bh=6ackFDlEH9WORnm/r3z1MkLoOidABIP+jqKP61s4JF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G6Oy1AZdPRTQ6CIDlfxgV9PdfPplpSZi1oDCEhWg0O0gRyVG7L81+mPwE9OTYWlBl35RncKY2JfqScnJG/6uP4a1to83vdKcFvz8WEyzKNwl8tNGEGHtZeNsCIRzCriKKW2wQRF1qNkBGsElxvkBLqVdKyAPguPGwC4pskX0VaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpYUmKgN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpYUmKgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791319930; x=1822855930;
  h=date:from:to:cc:subject:message-id;
  bh=6ackFDlEH9WORnm/r3z1MkLoOidABIP+jqKP61s4JF4=;
  b=JpYUmKgNYRWCoTag4HD8FviMAAsqA+jlaM3UKjhznwY7WHrFPwa787TV
   tI2kTCf/PM9TJlIeyqDhu/J5yesxz4+d9C+n0kSX0Gzft4SumwZM6eGpf
   SX+VbsKz9RSZBDHbpetMdg/HBTwDNNq4PB0M29Q+h1cZ3J2FDQsp25Y6k
   LqRWybvgCV7ywyEctWXlsBGI5KC7Yj9rum0U85rkHz97JWLQYg0ttpCp8
   n70Xy2pxJAHXs1v7+6QzHmg39wD5mwzzI5QsLLrZtUu7RqNXnrR2Z0w05
   NbxYlJEaKWIgnj3atc6unqH+KGqdy2lY3K10yM56D/parKtfkgJeBxJJ4
   g==;
X-CSE-ConnectionGUID: X7L+efLvQju+fP1lmFJOrA==
X-CSE-MsgGUID: mTavrex+Rxibh0QXlE2X8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="85047"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="85047"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 13:52:10 -0700
X-CSE-ConnectionGUID: skDgO1ehRVusfUEaASM6JA==
X-CSE-MsgGUID: UnBhAwvXSlmvKWuv0CernA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="273605956"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Oct 2026 13:52:09 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEC8t-0000000028G-08gW;
	Tue, 06 Oct 2026 20:52:07 +0000
Date: Wed, 07 Oct 2026 04:51:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9889/14724]
 build_policy.c:(.text+0x7c9f): dangerous relocation: l32r: literal target out
 of range (try using text-section-literals): (.text+0x7c88)
Message-ID: <202610070448.bcnwYJG6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
commit: 13d3783a55b758a9fa05b67835afa7e216476c61 [9889/14724] io_uring: wait for in-flight requests on ring release
:::::: branch date: 8 hours ago
:::::: commit date: 8 days ago
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20261007/202610070448.bcnwYJG6-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070448.bcnwYJG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610070448.bcnwYJG6-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/build_policy.o: in function `switched_to_dl':
>> build_policy.c:(.text+0x7c9f): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.text+0x7c88)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
