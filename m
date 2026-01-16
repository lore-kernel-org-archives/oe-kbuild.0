Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C323FC54
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569664; cv=none; b=BrpIr2RKdyUAhLl4EABIMsubIEs21yBZiWGN2s0EumQZpHchY2qXChJ6ChzcjPaileKhzp7TCkDCkTslR2+DNe027t1jcRnorqqNMHaTKroWHrG//9V285fYFOm/f2tG51uNANhLSsc0dBknu3mMPRubnDlczwUm0WdKU6wXGoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569664; c=relaxed/simple;
	bh=L2CoeITT2YGtjnVwplvBvyEe+4RAVI4WkpGHbnKlCPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cRUUVs6sBfFLGd1hS6UK4U90vx7hm3ywbkRyeqnbqUbALqjn73RjFzaDfYg2+NfeJsidtZFClcXb+5PqUSiXVNkm7YkWWbJAkrPHkA31IriGhD1fx6SFkzTRm5DPNEGuDsdNeqLH7Ly+sv7to8DN2e1UsZKV+P8LzT6smqsXTl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCYLrzro; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCYLrzro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768569661; x=1800105661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2CoeITT2YGtjnVwplvBvyEe+4RAVI4WkpGHbnKlCPc=;
  b=aCYLrzrooduhKOoq7F140/+XMFAyxJ561+a+gbBqe7o7Am8ARp/R5SRo
   aZTZNioRegy7aL+GeR7p/VncWxt0dd+t6UGGHJym0p6Kv9qaSvv2vpaEN
   uji+jRtyCSE21PbefdiTv+ehJONtpEZSoKVK1XZSi7bAHaHbslPYW8fQu
   qa8D89kMLxWbfYVuGvKnC5oGOYyclciCgbiV45/uP2R9/cGXHkK1AYo4C
   WmnkeqcDeq2e04VnpdgOl708eoFuZKt1t59eGdUrhSB9x+bszlbj2M6C+
   P3pR3FNSSlrAbH5a/OjZDcqig6DKmumGT5HqC2AtUULDM1wCkTAgfYNx3
   w==;
X-CSE-ConnectionGUID: 5RvbWqhiQYS3R1WhCyyukQ==
X-CSE-MsgGUID: x6HgE/EuSoOUmd5sbE3gLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73735953"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="73735953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 05:21:00 -0800
X-CSE-ConnectionGUID: ofbw+uX9RQums4QtcSECUg==
X-CSE-MsgGUID: bri+kwH+QH+68SnxBKFg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="236502855"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2026 05:20:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgjl3-00000000KrO-1WBr;
	Fri, 16 Jan 2026 13:20:57 +0000
Date: Fri, 16 Jan 2026 21:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/1] lib/crypto: tests: Add KUnit tests for AES
Message-ID: <202601162147.fF0LZSp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/crypto/tests/aes_kunit.c:148:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260115183831.72010-2-dengler@linux.ibm.com>
References: <20260115183831.72010-2-dengler@linux.ibm.com>
TO: Holger Dengler <dengler@linux.ibm.com>
TO: Eric Biggers <ebiggers@kernel.org>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: "Jason A . Donenfeld" <Jason@zx2c4.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Harald Freudenberger <freude@linux.ibm.com>
CC: Holger Dengler <dengler@linux.ibm.com>
CC: linux-kernel@vger.kernel.org
CC: linux-crypto@vger.kernel.org

Hi Holger,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 47753e09a15d9fd7cdf114550510f4f2af9333ec]

url:    https://github.com/intel-lab-lkp/linux/commits/Holger-Dengler/lib-crypto-tests-Add-KUnit-tests-for-AES/20260116-030041
base:   47753e09a15d9fd7cdf114550510f4f2af9333ec
patch link:    https://lore.kernel.org/r/20260115183831.72010-2-dengler%40linux.ibm.com
patch subject: [PATCH v1 1/1] lib/crypto: tests: Add KUnit tests for AES
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: s390-randconfig-r132-20260116 (https://download.01.org/0day-ci/archive/20260116/202601162147.fF0LZSp1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162147.fF0LZSp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601162147.fF0LZSp1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/crypto/tests/aes_kunit.c:148:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/aes_kunit.c:148:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/crypto/tests/aes_kunit.c:149:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/aes_kunit.c:149:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/crypto/tests/aes_kunit.c:149:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/aes_kunit.c:149:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +148 lib/crypto/tests/aes_kunit.c

7f9363bd920b12 Holger Dengler 2026-01-15  147  
7f9363bd920b12 Holger Dengler 2026-01-15 @148  MODULE_DESCRIPTION("KUnit tests and benchmark aes library");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
