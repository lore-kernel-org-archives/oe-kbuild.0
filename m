Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95BA2222C4
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768334324; cv=none; b=r7690TDeVKorPafRNX0AzbvYmctSr8QwDFudDmrjTHdXq4OwRqhFdufMdClPeYJHZFRHf3rtFOlfvLYveHsWwR0KBrOXbf/9P/BFg4DMopu3PcvVJFdzcdMmO9+Jjf1DerLAGFbtnRVv6Rozg2jPs8/2WLwe9jGrYyxN/MYs9CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768334324; c=relaxed/simple;
	bh=fR/LRMqeeCLON1xpiiboZ8rd6V3BEtQTlh51iNWXElo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+L3mti1pI5AOpw0wNWXCtjs9o8Xx1b0JyuSZBiG61btm/NAfZ8QKejVqZWU5ZGjOyH282ER1o2UrQSHmB5pMiKqGWVJgrvQIrwXil2bV/zfMxYN2nKnJWFFp8S1H7FVG3hfrqxsCPH1K/OWCGdnASfdpKzEMn2mWrIgGorVSRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D16Xys0m; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D16Xys0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768334323; x=1799870323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fR/LRMqeeCLON1xpiiboZ8rd6V3BEtQTlh51iNWXElo=;
  b=D16Xys0mfp68tMvP0ibCIjsWSAVOBYIivtcLutg0l66xMX+6lvlXeRmN
   7Z97ngUvPGzCX+/DeeuYrc+kjn9lnfMyAm1eMG8G8f2OXM9Q9qdghd6Ve
   RhAG01PrdsAELxQuyDFO2fqmNU8/E3VyxO8xO5w0H7l1cxt9s1Rxl1Yj+
   SBNR32lb67+AXcEbfWT+L78Cfn5gA6yKtYArQK+EPZHfBwzxUQ+AyBXM5
   FY+C7CZqw494589ijYcVaxHnYIGj/qOQIr8LkiO5lSGMysfarTE92M1hW
   lBFSu/jGFLAb9J/goVyCspM0I1bMeOWwGcvLPGpaO8T7jOrUQSWnp2Np/
   w==;
X-CSE-ConnectionGUID: 8uHXruxUQ7y+VvhEMInJMg==
X-CSE-MsgGUID: OvWC7YYkRiq/yrsPUwY4BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80275773"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80275773"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:58:42 -0800
X-CSE-ConnectionGUID: qw66IW7/R6i68FsaP8gJIg==
X-CSE-MsgGUID: f974Hk0ORfeK7qhGz27MLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204366445"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 11:58:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfkXH-00000000FJ6-0HTK;
	Tue, 13 Jan 2026 19:58:39 +0000
Date: Wed, 14 Jan 2026 03:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 2/6] kfuzztest: implement core module and input
 processing
Message-ID: <202601140318.GSsavXic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/kfuzztest/main.c:16:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260112192827.25989-3-ethan.w.s.graham@gmail.com>
References: <20260112192827.25989-3-ethan.w.s.graham@gmail.com>
TO: Ethan Graham <ethan.w.s.graham@gmail.com>
TO: ethan.w.s.graham@gmail.com
TO: glider@google.com
CC: akpm@linux-foundation.org
CC: andreyknvl@gmail.com
CC: andy@kernel.org
CC: andy.shevchenko@gmail.com
CC: brauner@kernel.org
CC: brendan.higgins@linux.dev
CC: davem@davemloft.net
CC: davidgow@google.com
CC: dhowells@redhat.com
CC: dvyukov@google.com
CC: ebiggers@kernel.org
CC: elver@google.com
CC: gregkh@linuxfoundation.org
CC: herbert@gondor.apana.org.au
CC: ignat@cloudflare.com
CC: jack@suse.cz
CC: jannh@google.com
CC: johannes@sipsolutions.net
CC: kasan-dev@googlegroups.com
CC: kees@kernel.org
CC: kunit-dev@googlegroups.com
CC: linux-crypto@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mm@kvack.org
CC: lukas@wunner.de
CC: mcgrof@kernel.org
CC: rmoar@google.com
CC: shuah@kernel.org

Hi Ethan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.19-rc5 next-20260113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Graham/kfuzztest-add-user-facing-API-and-data-structures/20260113-033045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260112192827.25989-3-ethan.w.s.graham%40gmail.com
patch subject: [PATCH v4 2/6] kfuzztest: implement core module and input processing
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: parisc-randconfig-r122-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140318.GSsavXic-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140318.GSsavXic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140318.GSsavXic-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/kfuzztest/main.c:16:1: sparse: sparse: bad integer constant expression
   lib/kfuzztest/main.c:16:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> lib/kfuzztest/main.c:16:1: sparse: sparse: bad integer constant expression
   lib/kfuzztest/main.c:16:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   lib/kfuzztest/main.c:17:1: sparse: sparse: bad integer constant expression
   lib/kfuzztest/main.c:17:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/kfuzztest/main.c:18:1: sparse: sparse: bad integer constant expression
   lib/kfuzztest/main.c:18:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +16 lib/kfuzztest/main.c

c4c203aad010667 Ethan Graham 2026-01-12  15  
c4c203aad010667 Ethan Graham 2026-01-12 @16  MODULE_LICENSE("GPL");
c4c203aad010667 Ethan Graham 2026-01-12  17  MODULE_AUTHOR("Ethan Graham <ethan.w.s.graham@gmail.com>");
c4c203aad010667 Ethan Graham 2026-01-12  18  MODULE_DESCRIPTION("Kernel Fuzz Testing Framework (KFuzzTest)");
c4c203aad010667 Ethan Graham 2026-01-12  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
