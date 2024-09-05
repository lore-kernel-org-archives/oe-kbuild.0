Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26271991B0
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Sep 2024 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725537891; cv=none; b=pcCoLd/MH0eEjZ821HAQtOH5vRFKKv+fOyIJw2mR6h998Cu/FGZRkE9eNmsM2YsBWuudcjO7KgU4F4GFRKBzUVRvzdyHli584Hte210urm0k526eMzkqwO1oIGGEGdJptvq2DJQEATLnrVpZXEt0L9e4ghk8usX+qeWqg1SMl1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725537891; c=relaxed/simple;
	bh=qfEvdNOh7rM3Ycrc+wz5pKX7UlXHbjPHzNU1/uwYE0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QceoFwr/pcz5kOxOixCzAH1HK1F1R8sn/5n2nDxq3zkr/D+fs3VW5jv2QpZiHH7RbpYZwY0kHRAosE+QfROzKqWfJ6r6WrtvoMB0gfUa7Ke5dsRzWoGWzCf7KQpf12ynQrBy/Xe8BOryG/xpxB+ZtcJc0hY5ivL2ynXMG/NDOWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHgu2AOt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHgu2AOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725537890; x=1757073890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfEvdNOh7rM3Ycrc+wz5pKX7UlXHbjPHzNU1/uwYE0c=;
  b=LHgu2AOt9oHLUjDWoRwhk9v9U2OEWEq5LGXOAhJk+Dwgwng4I762Jje/
   5f0hT1OTug59dkZ/77wY5flo3+/GeDQ65fnk2Ry7qDbKusFl8Pz99s9If
   RpXzOhppaia7Gb8unMECQPqmq/qTx9BUlOUO0cudm7hPU40VWzE6t6+Ji
   ocU4ebV9tQ5xR0x+F7t7owXwxi7zTz9ir86z1eUCfEdgL+kY4nkqVL6nu
   SQBzDvLfk7VA6IszhNWilDaZtR51efAGHVNxn9r8S7/iQM4I+11V9rfgM
   aAvBehb5U0uEuwOGjiER6GSdS9EQtR2lYTstwahSiSABSDGIeE+ZTXOAr
   Q==;
X-CSE-ConnectionGUID: uB7ODkR2SAaF9/Y8CdowEA==
X-CSE-MsgGUID: nG9oVi6/Rhik+9FeJHiX9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24052219"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="24052219"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:04:47 -0700
X-CSE-ConnectionGUID: 950q6nQtTXKCqdieBVTa6w==
X-CSE-MsgGUID: zuWaL7Z/QYe8jrrV8XAy0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65640555"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2024 05:04:46 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smBEB-0009p1-2N;
	Thu, 05 Sep 2024 12:04:43 +0000
Date: Thu, 5 Sep 2024 20:04:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [davidhildenbrand:virtio-mem-s390x-new 4/5] lib/Kconfig.debug:1890:
 syntax error
Message-ID: <202409051953.0QbErOvn-lkp@intel.com>
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
TO: David Hildenbrand <david@redhat.com>

tree:   https://github.com/davidhildenbrand/linux virtio-mem-s390x-new
head:   20ec4366bab8de03f08ac131659b8aaaf97fb222
commit: 2a876920cbbc3c1ed61d1cd847cfc939f7b7d003 [4/5] lib/Kconfig.debug: default STRICT_DEVMEM to "y" on s390x
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051953.0QbErOvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409051953.0QbErOvn-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/Kconfig.debug:1890:warning: ignoring unsupported character '|'
>> lib/Kconfig.debug:1890: syntax error
   lib/Kconfig.debug:1890: invalid statement
   lib/Kconfig.debug:1891: invalid statement
   lib/Kconfig.debug:1892:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1892: unknown statement "If"
   lib/Kconfig.debug:1893:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1893:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1893: unknown statement "of"
   lib/Kconfig.debug:1894:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1894: unknown statement "access"
   lib/Kconfig.debug:1895:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1895: unknown statement "be"
   lib/Kconfig.debug:1896:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1896:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1896:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1896: unknown statement "enabled"
   lib/Kconfig.debug:1897:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1897: unknown statement "use"
   lib/Kconfig.debug:1899:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1899:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1899:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1899:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1899: unknown statement "If"
   lib/Kconfig.debug:1900: unknown statement "file"
   lib/Kconfig.debug:1901:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1901: unknown statement "data"
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1902: unknown statement "users"
   lib/Kconfig.debug:1904:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1904:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1904: unknown statement "If"
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:680: oldconfig] Error 2
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
   lib/Kconfig.debug:1890:warning: ignoring unsupported character '|'
>> lib/Kconfig.debug:1890: syntax error
   lib/Kconfig.debug:1890: invalid statement
   lib/Kconfig.debug:1891: invalid statement
   lib/Kconfig.debug:1892:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1892: unknown statement "If"
   lib/Kconfig.debug:1893:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1893:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1893: unknown statement "of"
   lib/Kconfig.debug:1894:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1894: unknown statement "access"
   lib/Kconfig.debug:1895:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1895: unknown statement "be"
   lib/Kconfig.debug:1896:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1896:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1896:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1896: unknown statement "enabled"
   lib/Kconfig.debug:1897:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1897: unknown statement "use"
   lib/Kconfig.debug:1899:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1899:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1899:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1899:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1899: unknown statement "If"
   lib/Kconfig.debug:1900: unknown statement "file"
   lib/Kconfig.debug:1901:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1901: unknown statement "data"
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1902: unknown statement "users"
   lib/Kconfig.debug:1904:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1904:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1904: unknown statement "If"
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:680: olddefconfig] Error 2
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +1890 lib/Kconfig.debug

045f6d7942be24 Changbin Du       2019-12-17  1882  
045f6d7942be24 Changbin Du       2019-12-17  1883  config ARCH_HAS_DEVMEM_IS_ALLOWED
045f6d7942be24 Changbin Du       2019-12-17  1884  	bool
045f6d7942be24 Changbin Du       2019-12-17  1885  
045f6d7942be24 Changbin Du       2019-12-17  1886  config STRICT_DEVMEM
045f6d7942be24 Changbin Du       2019-12-17  1887  	bool "Filter access to /dev/mem"
045f6d7942be24 Changbin Du       2019-12-17  1888  	depends on MMU && DEVMEM
527701eda5f196 Palmer Dabbelt    2020-07-09  1889  	depends on ARCH_HAS_DEVMEM_IS_ALLOWED || GENERIC_LIB_DEVMEM_IS_ALLOWED
2a876920cbbc3c David Hildenbrand 2024-09-04 @1890  	default y if PPC || X86 || ARM64 | S390
045f6d7942be24 Changbin Du       2019-12-17  1891  	help
045f6d7942be24 Changbin Du       2019-12-17  1892  	  If this option is disabled, you allow userspace (root) access to all
045f6d7942be24 Changbin Du       2019-12-17  1893  	  of memory, including kernel and userspace memory. Accidental
045f6d7942be24 Changbin Du       2019-12-17  1894  	  access to this is obviously disastrous, but specific access can
045f6d7942be24 Changbin Du       2019-12-17  1895  	  be used by people debugging the kernel. Note that with PAT support
045f6d7942be24 Changbin Du       2019-12-17  1896  	  enabled, even in this case there are restrictions on /dev/mem
045f6d7942be24 Changbin Du       2019-12-17  1897  	  use due to the cache aliasing requirements.
045f6d7942be24 Changbin Du       2019-12-17  1898  
045f6d7942be24 Changbin Du       2019-12-17  1899  	  If this option is switched on, and IO_STRICT_DEVMEM=n, the /dev/mem
045f6d7942be24 Changbin Du       2019-12-17  1900  	  file only allows userspace access to PCI space and the BIOS code and
045f6d7942be24 Changbin Du       2019-12-17  1901  	  data regions.  This is sufficient for dosemu and X and all common
045f6d7942be24 Changbin Du       2019-12-17  1902  	  users of /dev/mem.
045f6d7942be24 Changbin Du       2019-12-17  1903  
045f6d7942be24 Changbin Du       2019-12-17  1904  	  If in doubt, say Y.
045f6d7942be24 Changbin Du       2019-12-17  1905  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
