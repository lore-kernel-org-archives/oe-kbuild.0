Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA7A19A
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Mar 2025 00:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742257319; cv=none; b=iTl7RiXdKK5GaduDCjoLWHKWPszvzINJcjJT5Ty2HDSFkTm4Srivj1wmZf3SESWDr7EUN/FlV+D4FM99hMPQz3+3x0eGLJsuAdzZ6UB+VhJuc6MI7F8WUMx5Io9CU+g/edtKxQuCQhUU9/Qq3xe5dzafY3G/TVd0gUsqjNCy3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742257319; c=relaxed/simple;
	bh=Iwd7h8sVyG1wH8PHtkbgC5SGH3sWuDHW/4nsArruVMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fah3k3jIn96eHwg+oytDqYHd3aG57wDbal6GURzMW83nQ2R6wz2rtnJJMmzuAGFed0uogm/Opy8G06ZJqMzNN4XttNbbUQDIjDz7e0LkxXOU78CK353N5N/z2yRwmsBLw0idUYQa1/rY9adiK4FU/XAPiqdXg7Br4YmmwecRC4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iT2qYTH8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iT2qYTH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742257317; x=1773793317;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Iwd7h8sVyG1wH8PHtkbgC5SGH3sWuDHW/4nsArruVMs=;
  b=iT2qYTH82sEv4t3POdMvZL9gys5G+nLy2zYHGFAfzCw5acWBuT5dGWBd
   X9QqRaTTLWDvs6bv18EnyzEKm56S/+qPeScjV9ICHIpUnK0SfAvRGvQo3
   6kJm/jx+J+rFZ5VFquOF9g0AjpllOGVyZ8iI3kpVqJlGDchJtb8VuZDpL
   +sXeO0a9lXVvV7WIM1UKnNNFmvWHZF7yGmq0BxRf59KDbf5BCiavRKrDP
   5HoRJ9TZPy5GcadHGcUkeHzpNrf3umYaml9HwiL4C9jHeDeuvJfj9mLqs
   jWbuH4h0LuQHQ53wdlIUBgsPUz7x+jsgsWBaTEjUYGRnMoIe9OU5P3kX0
   Q==;
X-CSE-ConnectionGUID: WKD4Ep5dQE2witcayDojxw==
X-CSE-MsgGUID: g+HTWbZ/Sti9+VV/FNP0tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42552437"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="42552437"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 17:21:56 -0700
X-CSE-ConnectionGUID: GeY4PyZLQf+RJ0B1c6eRTQ==
X-CSE-MsgGUID: qdmKfccLSiCy/QxaoPXBTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="126753727"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Mar 2025 17:21:55 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuKiO-000DFb-2h;
	Tue, 18 Mar 2025 00:21:52 +0000
Date: Tue, 18 Mar 2025 08:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11408/11415]
 lib/tests/longest_symbol_kunit.c:28:14: sparse: sparse: '##' failed:
 concatenation is not a valid token
Message-ID: <202503180806.WdbmHQEr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/tests/longest_symbol_kunit.c:28:14: sparse: sparse: '##' failed: concatenation is not a valid token"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <kees@kernel.org>


First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e94bd4ec45ac156616da285a0bf03056cd7430fc
commit: 8d483b174d31ef9aff98089d67401e6fc6ad4ea7 [11408/11415] Merge branch 'for-next/kspp' of git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
:::::: branch date: 11 hours ago
:::::: commit date: 13 hours ago
config: csky-randconfig-r131-20250318 (https://download.01.org/0day-ci/archive/20250318/202503180806.WdbmHQEr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250318/202503180806.WdbmHQEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503180806.WdbmHQEr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/longest_symbol_kunit.c:28:14: sparse: sparse: '##' failed: concatenation is not a valid token
>> lib/tests/longest_symbol_kunit.c:28:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:29:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:29:14: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:34:23: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:34:23: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:37:1: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:37:1: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:41:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:41:9: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:64:47: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:64:47: sparse: sparse: '##' failed: concatenation is not a valid token
   lib/tests/longest_symbol_kunit.c:28:14: sparse: sparse: Expected ; at end of declaration
   lib/tests/longest_symbol_kunit.c:28:14: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/tests/longest_symbol_kunit.c:29:14: sparse: sparse: Expected ; at end of declaration
   lib/tests/longest_symbol_kunit.c:29:14: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/tests/longest_symbol_kunit.c:32:1: sparse: sparse: Expected ; at the end of type declaration
   lib/tests/longest_symbol_kunit.c:32:1: sparse: sparse: got }
   lib/tests/longest_symbol_kunit.c:41:9: sparse: sparse: Expected ) after typeof
   lib/tests/longest_symbol_kunit.c:41:9: sparse: sparse: got nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n
   lib/tests/longest_symbol_kunit.c:41:9: sparse: sparse: undefined identifier '__right'
   lib/tests/longest_symbol_kunit.c:41:9: sparse: sparse: undefined identifier '__right'

vim +28 lib/tests/longest_symbol_kunit.c

c104c16073b7fd lib/longest_symbol_kunit.c Sergio González Collado 2025-03-02  27  
c104c16073b7fd lib/longest_symbol_kunit.c Sergio González Collado 2025-03-02 @28  noinline int LONGEST_SYM_NAME(void);
c104c16073b7fd lib/longest_symbol_kunit.c Sergio González Collado 2025-03-02  29  noinline int LONGEST_SYM_NAME(void)
c104c16073b7fd lib/longest_symbol_kunit.c Sergio González Collado 2025-03-02  30  {
c104c16073b7fd lib/longest_symbol_kunit.c Sergio González Collado 2025-03-02  31  	return RETURN_LONGEST_SYM;
c104c16073b7fd lib/longest_symbol_kunit.c Sergio González Collado 2025-03-02  32  }
c104c16073b7fd lib/longest_symbol_kunit.c Sergio González Collado 2025-03-02  33  

:::::: The code at line 28 was first introduced by commit
:::::: c104c16073b7fdb3e4eae18f66f4009f6b073d6f Kunit to check the longest symbol length

:::::: TO: Sergio González Collado <sergio.collado@gmail.com>
:::::: CC: Shuah Khan <shuah@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
