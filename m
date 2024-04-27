Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08D737149
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Apr 2024 04:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714190907; cv=none; b=B6HoTOcAmULgY+eszBkWohVFdrRTz4Pvfn1gSYk5AOd/kW7CWG92A2GpLByWUNukp+Td3Z9H1A0RclVBz2rwiulDWNV+hSfK7lmx8McsLtmRGA+dtaeElDWVvjmHPJwBpbBOoNTZre8j0eMSryuIrkL1RLZYhkjufPfpizR2dio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714190907; c=relaxed/simple;
	bh=GOorAH4ATdVqrfCIFzCHMIoEgVDUR9T8iYM0J+fpve0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iy6vz2yEjp0rgFS/LkGan+Dav4oDbgkdx1hlTKj/nzNurkcZwfP7PENcg51zqwI3BEh/SWvN3jgxh8dVsjKxzIE9DexaKnrirHWWsIwJsG+InP0vJuwujORrd6ht7tvac38ogMH9B3ZNH8Tntch6qGa2pUUihrLXJSSOBWUV7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDeKxBC1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDeKxBC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714190905; x=1745726905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOorAH4ATdVqrfCIFzCHMIoEgVDUR9T8iYM0J+fpve0=;
  b=XDeKxBC1GNC/+shiAaK7vUD/HIubN4SqIh/wM3vtZBsbh1xz62H4qIDU
   Uz2Xbd7/6+YrOts3UHkjfTJ97mVkX3hXmthf8k8OLfSfUQDl+23CaGBkO
   UKF+RP1PPxkDEM3lhdqAsPjlbBiU3uY/8zlnv3FtglBNlsZ8JRU35kQOV
   1SRYoOaM5PjvVou/7um4NdNsdUXYFFQ1/uJnCF16iBFV+NuxFeylR7jTz
   p402ElYd6Am0uHxarGYJkkb6hB25BI0T7ZYeqdxw4lze/g4BLXu6ERch8
   yYuoZqnV15yDJ05OYbKBwMD3flwKMNdjuElGRkrC36wxiq796BoMVt2Tv
   w==;
X-CSE-ConnectionGUID: PGJvQ/g0TsW1mDd0kjRtcA==
X-CSE-MsgGUID: gZ+18GFKTdu1WJtGw3xH4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="13725107"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="13725107"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 21:08:24 -0700
X-CSE-ConnectionGUID: vSj4AwEnQ2efRF6eXkEOCg==
X-CSE-MsgGUID: OeApDb6xTPyRoYeA42evTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="30255116"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Apr 2024 21:08:23 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0ZMK-0004e6-2g;
	Sat, 27 Apr 2024 04:08:20 +0000
Date: Sat, 27 Apr 2024 12:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 4/4] selftests/mm: Add new testcases for pkeys
Message-ID: <202404271128.ERrCledH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240425180542.1042933-5-aruna.ramakrishna@oracle.com>
References: <20240425180542.1042933-5-aruna.ramakrishna@oracle.com>
TO: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
TO: linux-kernel@vger.kernel.org
CC: x86@kernel.org
CC: dave.hansen@linux.intel.com
CC: tglx@linutronix.de
CC: mingo@kernel.org
CC: keith.lucas@oracle.com
CC: aruna.ramakrishna@oracle.com

Hi Aruna,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on akpm-mm/mm-everything tip/master linus/master v6.9-rc5]
[cannot apply to tip/auto-latest next-20240426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aruna-Ramakrishna/x86-pkeys-Signal-handling-function-interface-changes-to-accept-PKRU-as-a-parameter/20240426-020800
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240425180542.1042933-5-aruna.ramakrishna%40oracle.com
patch subject: [PATCH v3 4/4] selftests/mm: Add new testcases for pkeys
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404271128.ERrCledH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404271128.ERrCledH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> pkey_sighandler_tests.c:41:16: error: couldn't allocate input reg for constraint '{r10}'
      41 |         asm volatile ("syscall"
         |                       ^
>> pkey_sighandler_tests.c:41:16: error: couldn't allocate input reg for constraint '{r10}'
>> pkey_sighandler_tests.c:41:16: error: couldn't allocate input reg for constraint '{r10}'
>> pkey_sighandler_tests.c:41:16: error: couldn't allocate input reg for constraint '{r10}'
>> pkey_sighandler_tests.c:41:16: error: couldn't allocate input reg for constraint '{r10}'
   5 errors generated.


vim +41 tools/testing/selftests/mm/pkey_sighandler_tests.c

6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  33  
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  34  static inline __attribute__((always_inline)) long
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  35  syscall_raw(long n, long a1, long a2, long a3, long a4, long a5, long a6)
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  36  {
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  37  	unsigned long ret;
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  38  	register long r10 asm("r10") = a4;
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  39  	register long r8 asm("r8") = a5;
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  40  	register long r9 asm("r9") = a6;
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25 @41  	asm volatile ("syscall"
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  42  		      : "=a"(ret)
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  43  		      : "a"(n), "D"(a1), "S"(a2), "d"(a3), "r"(r10), "r"(r8), "r"(r9)
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  44  		      : "rcx", "r11", "memory");
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  45  	return ret;
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  46  }
6b81215d7e8a34 Aruna Ramakrishna 2024-04-25  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
