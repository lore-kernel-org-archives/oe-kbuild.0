Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC14176AB7
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 01:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718588969; cv=none; b=SVHiLdnfs98u77hWqSy6fb3JR9n2K1Gv/vpRTgp2s5AMbcI480zmdEaIaWJf+2UYJSGGaDtUEjH1fU4zUwHCVMaxncB4ozGq/Aba3sjw4hzqghiCsXMqso0GC1EQe5niTfW81qH4ZfYUW4EpbFjG7iXlVwJD43LtBTUWGXN0nAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718588969; c=relaxed/simple;
	bh=eIwXw9BO2kGwM2oYT147Dbk43T5cdovkPbGKMuE9dD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urMObX3ws2FUEzEuUul/RgTJ+nm6Iisl/XTojSA6Fp3QQ5yM6OIs/Gp/6E9GArTdbWOHRxyhwjkR7w0VAUZJideO/etnEOM1x713nP4DTynD8yBY2j9qBSSt5/WVOrJQgp1UL5ZGxqerlqxq2eP39+SDrOjsx/BTrAfB52WriNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BORRaTn+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BORRaTn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718588968; x=1750124968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eIwXw9BO2kGwM2oYT147Dbk43T5cdovkPbGKMuE9dD0=;
  b=BORRaTn+j31vwMVBqqtoJxOQZiZgDmaEMWG1jxHyx61GIMe/VnBDXCM0
   sCr7nBrDQGArgAA+JWLZnXUv4+u1+ZXLEzbRSanXNSeLGwzEmgUjou763
   iGWd0lnzyH5VilcjCw86S/yWCuT9X5wqK4o7sOU8t71RsazfaAjwNC65S
   btG6GSxXyl6aQYneJC6fhRRuUCqJbVFC9YnUrovuF0yXoB3C+EqgJ3IYf
   pl4ft0rzNivZTFA21esz9nwPAzXDDgtPXkouMwGOVeCoIXvR9GNBajBHa
   OC+KJTi8Y7I/WS3OzofAxImbGsfUWCbE3B8TmfZxf0rJ2eawHsfEexz/n
   w==;
X-CSE-ConnectionGUID: lzCaZMlTS82VSYSasv3prw==
X-CSE-MsgGUID: a51xQ4EDQvy/15JmjnOVPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15560921"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="15560921"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 18:49:25 -0700
X-CSE-ConnectionGUID: XDDu5pTlTAqsDlsaV8F4Ng==
X-CSE-MsgGUID: 393u/X5nQ8+aXL17jgBT9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="72261399"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2024 18:49:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ1Un-0003da-0v;
	Mon, 17 Jun 2024 01:49:21 +0000
Date: Mon, 17 Jun 2024 09:48:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [crng-random:vdso 6/7] vdso_test_getrandom.c:149:40: warning:
 omitting the parameter name in a function definition is a C23 extension
Message-ID: <202406170938.rs6wG1Nd-lkp@intel.com>
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
CC: zx2c4@kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git vdso
head:   a115b568173a8ac7b2c0ed4b3aacdefa89fa7d22
commit: 1a9e8743248fb63fc15a6168d458e322e320e02b [6/7] random: introduce generic vDSO getrandom() implementation
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170938.rs6wG1Nd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406170938.rs6wG1Nd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vdso_test_getrandom.c:149:40: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     149 | static void *test_vdso_getrandom(void *)
         |                                        ^
   vdso_test_getrandom.c:159:40: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     159 | static void *test_libc_getrandom(void *)
         |                                        ^
   vdso_test_getrandom.c:169:43: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     169 | static void *test_syscall_getrandom(void *)
         |                                           ^
   3 warnings generated.
   parse_vdso.c:65:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
      65 |                 if (g = h & 0xf0000000)
         |                     ~~^~~~~~~~~~~~~~~~
   parse_vdso.c:65:9: note: place parentheses around the assignment to silence this warning
      65 |                 if (g = h & 0xf0000000)
         |                       ^               
         |                     (                 )
   parse_vdso.c:65:9: note: use '==' to turn this assignment into an equality comparison
      65 |                 if (g = h & 0xf0000000)
         |                       ^
         |                       ==
   parse_vdso.c:206:22: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     206 |         ver_hash = elf_hash(version);
         |                             ^~~~~~~
   parse_vdso.c:59:52: note: passing argument to parameter 'name' here
      59 | static unsigned long elf_hash(const unsigned char *name)
         |                                                    ^
   parse_vdso.c:207:46: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
     207 |         ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
         |                                                     ^~~~
   parse_vdso.c:59:52: note: passing argument to parameter 'name' here
      59 | static unsigned long elf_hash(const unsigned char *name)
         |                                                    ^
   3 warnings generated.


vim +149 tools/testing/selftests/vDSO/vdso_test_getrandom.c

1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  148  
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18 @149  static void *test_vdso_getrandom(void *)
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  150  {
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  151  	for (size_t i = 0; i < TRIALS; ++i) {
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  152  		unsigned int val;
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  153  		ssize_t ret = vgetrandom(&val, sizeof(val), 0);
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  154  		assert(ret == sizeof(val));
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  155  	}
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  156  	return NULL;
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  157  }
1a9e8743248fb6 Jason A. Donenfeld 2022-11-18  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
