Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF73F86ADE
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jan 2024 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706631904; cv=none; b=mdeXELvF+Pn44D4G9+6sMlpX98b7k0a5dU3qjfc3eKf+DAOFDTp8XzrSY/U8B3Le3VLlzwcoXQBNXx1Sc1aH7lwz7m+wzGJDGKd8uYZS66xNNh6fYqVtUiITNCtQcOBtCJt9GviKrs8PIAYqoWas7FUHF38RdeXDIxzkHRSKPco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706631904; c=relaxed/simple;
	bh=Dtpe751S81BAtcD01ljBPUv/lCFFRTc6h9QaKX2Nub8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rxhzemSOOgY421sEsGdod7y/S4uzWRQOtgEltWPm3nZ443WgrYX7uO/YR69ZO2Aq2hVT5KlXOQHLKZtEwTox80+CKauxPNDGGGpKmWrV1Fank4+MCwiX6iXEeRc32Wzn3i0LLvnM1SPd4V8yj/RcBK7jV7nZ+XvxOtJXExR2hIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAS50mKl; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAS50mKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706631901; x=1738167901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dtpe751S81BAtcD01ljBPUv/lCFFRTc6h9QaKX2Nub8=;
  b=BAS50mKlBZHE7VU4jMR1VSX1iNBGZKQeBvCyBaSuplPAu9MVNPIXDJwb
   cD5dxJMHDt3BH9jvkuz/yQZrbU7qbAWvk5mnSCGCLdimDClAzVIu2oaVn
   e5hLObvH1Lp+FQ8ecxbIiV5n16irNZSmHtEbkl3ZOFHEhUG5Y388X1RWG
   CVGQNLggEMilRW2hBhGWSGssGVSvda2yHWRmyo3HkRXeYqVlLsXE8KRH/
   DJSLWdexIUK4JQxeH0uzQAT4OnS/F67xIZXbGKdlzM1ZSZmbn0/Mg9U88
   NAqPMG829/kyphrAAn6nNbg6mBM0Lx3jtUaPbNFqOEkvGeddEG5EIkU64
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402189233"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="402189233"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 08:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858526327"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="858526327"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Jan 2024 08:24:59 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUquv-0000Xq-2R;
	Tue, 30 Jan 2024 16:24:57 +0000
Date: Wed, 31 Jan 2024 00:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kees:devel/overflow/ubsan-only 2/6]
 include/linux/fortify-string.h:63:33: warning: '__builtin_memcmp' specified
 bound 2147483648 exceeds maximum object size 2147483647
Message-ID: <202401310026.cAWaqUun-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/fortify-string.h:63:33: warning: '__builtin_memcmp' specified bound 2147483648 exceeds maximum object size 2147483647 [-Wstringop-overread]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/ubsan-only
head:   ec27d9baa678ce3b875e5784ba6ebbf759daabd6
commit: 9e4334268976a961432a609a5b373a6e1f6b6b68 [2/6] ubsan: Reintroduce signed and unsigned overflow sanitizers
:::::: branch date: 22 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-061-20240130 (https://download.01.org/0day-ci/archive/20240131/202401310026.cAWaqUun-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310026.cAWaqUun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401310026.cAWaqUun-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:292,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from net/netfilter/nft_set_pipapo.c:333:
   In function 'memcmp',
       inlined from 'nft_pipapo_insert' at net/netfilter/nft_set_pipapo.c:1224:7:
>> include/linux/fortify-string.h:63:33: warning: '__builtin_memcmp' specified bound 2147483648 exceeds maximum object size 2147483647 [-Wstringop-overread]
      63 | #define __underlying_memcmp     __builtin_memcmp
         |                                 ^
   include/linux/fortify-string.h:673:16: note: in expansion of macro '__underlying_memcmp'
     673 |         return __underlying_memcmp(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~


vim +/__builtin_memcmp +63 include/linux/fortify-string.h

78a498c3a227f2 Alexander Potapenko 2022-10-24  61  
78a498c3a227f2 Alexander Potapenko 2022-10-24  62  #define __underlying_memchr	__builtin_memchr
78a498c3a227f2 Alexander Potapenko 2022-10-24 @63  #define __underlying_memcmp	__builtin_memcmp
a28a6e860c6cf2 Francis Laniel      2021-02-25  64  #define __underlying_strcat	__builtin_strcat
a28a6e860c6cf2 Francis Laniel      2021-02-25  65  #define __underlying_strcpy	__builtin_strcpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  66  #define __underlying_strlen	__builtin_strlen
a28a6e860c6cf2 Francis Laniel      2021-02-25  67  #define __underlying_strncat	__builtin_strncat
a28a6e860c6cf2 Francis Laniel      2021-02-25  68  #define __underlying_strncpy	__builtin_strncpy
a28a6e860c6cf2 Francis Laniel      2021-02-25  69  #endif
a28a6e860c6cf2 Francis Laniel      2021-02-25  70  

:::::: The code at line 63 was first introduced by commit
:::::: 78a498c3a227f2ac773a8234b2ce092a4403f2c3 x86: fortify: kmsan: fix KMSAN fortify builds

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
