Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C941856
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705739980; cv=none; b=GtJC9hhsFUTJNYpZF3etpE2uTZHyz4yU4hLmnM533DnkWr4vlIN4acXDSVek41cmNWvyuRs2HOaXLMJJBsb5ysMjSuGkC1su5FKUia+uCbsRoLIhG8k8yYaDg4Me0OeUV70dzU7ga+bJh6nR66trapAD3KShU3l4LSbO5xhqm4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705739980; c=relaxed/simple;
	bh=JP4yeqB1+CYtNGo76pHXp1ELrbkMGYJ2pjloqh2zqf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C2ggPAnQhHvOzvXYkOU2udSrTeoE9xYzDxInvBmP7KAXK4EP6/aAxXd6uvih460s5KIsZoCsioUVTB1S1Ra0Ptigmz8h2TqgcWIHxABGcCm5j88+3N+lb9aH3UlB58lP0egkbt6GWurtMUv0TnjFfjgKemWuGoFnPmIXY+xNMCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=em3u3iX6; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="em3u3iX6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705739977; x=1737275977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JP4yeqB1+CYtNGo76pHXp1ELrbkMGYJ2pjloqh2zqf4=;
  b=em3u3iX6fIW8vnnoAKQUN7H8l2SRUalbdTJolbis45R8heSnxIMKD9N4
   4jf2cfmdsJujsHt31FxNwTFioQKpvqPHh2BdPKflJjjK+fkIm1/SgrWZN
   XGdFLvc9kTOzLljkASPdGCU7Kb6I4XGpHuwLSKNuzulInPDYJJFIMxKIN
   blXKMYKiH3yaQXfh8PM8l2wEoNNEE7wSsyy3Mb6393+tMzHvnVdYHLVWB
   Jod+zlY96yI+fHqDFx5WemDcF+ae50nq7GhmdPZI0WZ+0P2TBrGfVNlcg
   kVMgUo8JiNsYWAXuasuIOJOYbbAX1WqRmmg2F8iXvDNLq1N5hsNsrcG8K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="399804369"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="399804369"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 00:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="33595419"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jan 2024 00:39:34 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR6t1-0004ve-24;
	Sat, 20 Jan 2024 08:39:31 +0000
Date: Sat, 20 Jan 2024 16:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kees:devel/overflow/wrap-around 50/77] mm/kasan/generic.c:174:13:
 sparse: sparse: invalid type for argument 1:
Message-ID: <202401201648.EZU4qtw2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/wrap-around
head:   e89bc1e50a4aea7c77987a344e7917eb41d290eb
commit: fc9e04fe0079812511d0da77c58aaea85ab63ba0 [50/77] kasan: Refactor intentional wrap-around test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-122-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201648.EZU4qtw2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201648.EZU4qtw2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401201648.EZU4qtw2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/kasan/generic.c:174:13: sparse: sparse: undefined identifier '__builtin_classify_type'
   mm/kasan/generic.c:174:13: sparse: sparse: undefined identifier '__builtin_classify_type'
   mm/kasan/generic.c:174:13: sparse: sparse: undefined identifier '__builtin_classify_type'
   mm/kasan/generic.c:174:13: sparse: sparse: undefined identifier '__builtin_classify_type'
   mm/kasan/generic.c:174:13: sparse: sparse: undefined identifier '__builtin_classify_type'
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr
>> mm/kasan/generic.c:174:13: sparse: sparse: invalid type for argument 1:
   mm/kasan/generic.c:174:13: sparse:         void const *addr

vim +174 mm/kasan/generic.c

0b24becc810dc3 mm/kasan/kasan.c   Andrey Ryabinin 2015-02-13  163  
bb6e04a173f06e mm/kasan/generic.c Arnd Bergmann   2023-05-09  164  static __always_inline bool check_region_inline(const void *addr,
936bb4bbbb832f mm/kasan/kasan.c   Andrey Ryabinin 2016-05-20  165  						size_t size, bool write,
936bb4bbbb832f mm/kasan/kasan.c   Andrey Ryabinin 2016-05-20  166  						unsigned long ret_ip)
0b24becc810dc3 mm/kasan/kasan.c   Andrey Ryabinin 2015-02-13  167  {
af3751f3c2b628 mm/kasan/generic.c Daniel Axtens   2021-06-28  168  	if (!kasan_arch_is_ready())
af3751f3c2b628 mm/kasan/generic.c Daniel Axtens   2021-06-28  169  		return true;
af3751f3c2b628 mm/kasan/generic.c Daniel Axtens   2021-06-28  170  
0b24becc810dc3 mm/kasan/kasan.c   Andrey Ryabinin 2015-02-13  171  	if (unlikely(size == 0))
b5f6e0fc7d60e0 mm/kasan/generic.c Marco Elver     2019-07-11  172  		return true;
0b24becc810dc3 mm/kasan/kasan.c   Andrey Ryabinin 2015-02-13  173  
fc9e04fe007981 mm/kasan/generic.c Kees Cook       2024-01-17 @174  	if (unlikely(add_would_overflow(addr, size)))
8cceeff48f23ee mm/kasan/generic.c Walter Wu       2020-04-01  175  		return !kasan_report(addr, size, write, ret_ip);
8cceeff48f23ee mm/kasan/generic.c Walter Wu       2020-04-01  176  
bb6e04a173f06e mm/kasan/generic.c Arnd Bergmann   2023-05-09  177  	if (unlikely(!addr_has_metadata(addr)))
8cceeff48f23ee mm/kasan/generic.c Walter Wu       2020-04-01  178  		return !kasan_report(addr, size, write, ret_ip);
0b24becc810dc3 mm/kasan/kasan.c   Andrey Ryabinin 2015-02-13  179  
0b24becc810dc3 mm/kasan/kasan.c   Andrey Ryabinin 2015-02-13  180  	if (likely(!memory_is_poisoned(addr, size)))
b5f6e0fc7d60e0 mm/kasan/generic.c Marco Elver     2019-07-11  181  		return true;
0b24becc810dc3 mm/kasan/kasan.c   Andrey Ryabinin 2015-02-13  182  
8cceeff48f23ee mm/kasan/generic.c Walter Wu       2020-04-01  183  	return !kasan_report(addr, size, write, ret_ip);
0b24becc810dc3 mm/kasan/kasan.c   Andrey Ryabinin 2015-02-13  184  }
0b24becc810dc3 mm/kasan/kasan.c   Andrey Ryabinin 2015-02-13  185  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
