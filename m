Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79D259C84
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772828285; cv=none; b=YwyhMhZyLBpjKvlRVRh3JIRsfo6cMmpGMGoQlct/ibbhLNMsIffzqsmRE2oDL4nssErRaiLarscShSTWjrjgUHXKMfYV6HViAp9WW9TiMSRV15msXpCltoYqc0efllEl4aCn3cd36evXULMlq03Au/lOpNmWU2+tdvRLg55R2HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772828285; c=relaxed/simple;
	bh=xTvxCN3VLyXfBnt0fLT944Gwzyb+32VeKjVdS8Gk/jE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QHy3DUpthiN7/T3pgIV6wCeIbS9RxfsPFNLPyYwXmjadaviSN3HvEPN6F6DQqwlQcBptPT52Z6VApc267RwbtT+TccmR2XGxkfrgBinnS6sym57LZWSORgpwrkwFD3/2wCZvI8Y7pFsw8jeHwAH8SkMvmKZrwvwZd8d72GW/wj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFSCLvh2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFSCLvh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772828283; x=1804364283;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xTvxCN3VLyXfBnt0fLT944Gwzyb+32VeKjVdS8Gk/jE=;
  b=oFSCLvh2pfPAATTd4J0NSNo39HXFDoVP6TN6Pk4b/hC1iCUj0i7kXdQ5
   bNBO/GZrQo4BMHlU1js619jz04ZWSHO7i7SOidGEE10sx6NSzeukBCsCb
   nNgGwTyyFrNQjbw5dbA4siR98WARy4sCUK4SPmmeaI9iFUsBYNirZX9Qs
   /r/qlOBmF083qz5+kUAP7GuYuIChAq8CJHz4/U0bUtE362gFpuVuTW5gt
   qu/LnwsuwusJqFDU0gaCSWqjWDolNKw9jHM5J2vff1bmLzW4FdXSEY/ud
   5faLjVMuoQEhXducQMjF/n9UuIJSfCjaunOLclKNWDJLwUtHE9F1VBNnW
   g==;
X-CSE-ConnectionGUID: fOI8NKILRRWM2s69GxnftQ==
X-CSE-MsgGUID: IlG18IeTSi2gKIiGtoJMig==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73138483"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73138483"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:18:02 -0800
X-CSE-ConnectionGUID: Mx7/kssuSVGO8+AtAXhmGw==
X-CSE-MsgGUID: 8RN1beVQQB6bM3mGuPYohg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="219230100"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2026 12:18:01 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybcU-000000002Jt-1UxA;
	Fri, 06 Mar 2026 20:17:58 +0000
Date: Fri, 06 Mar 2026 21:17:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-vmlinux-h 2/6]
 include/linux/math.h:6:10: fatal error: asm/div64.h: No such file or
 directory
Message-ID: <202603062155.NatiXxgF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-vmlinux-h
head:   8004855a92a2320932629e08adcf6e3048ff774c
commit: dc4d07a89d0af09d050c7954444aebe6c8b2c028 [2/6] bpftool
:::::: branch date: 49 minutes ago
:::::: commit date: 49 minutes ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20260306/202603062155.NatiXxgF-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260306/202603062155.NatiXxgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603062155.NatiXxgF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> cc1: warning: arch/powerpc/include/generated: No such file or directory =
[-Wmissing-include-dirs]
>> cc1: warning: arch/powerpc/include/generated/uapi: No such file or direc=
tory [-Wmissing-include-dirs]
   cc1: warning: include/generated/uapi: No such file or directory [-Wmissi=
ng-include-dirs]
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/io.h:11,
                    from include/linux/libnvdimm.h:10,
                    from ../../../drivers/nvdimm/core.c:5:
   include/linux/compiler.h:372:10: fatal error: asm/rwonce.h: No such file=
 or directory
     372 | #include <asm/rwonce.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: arch/powerpc/include/generated: No such file or directory =
[-Wmissing-include-dirs]
>> cc1: warning: arch/powerpc/include/generated/uapi: No such file or direc=
tory [-Wmissing-include-dirs]
   cc1: warning: include/generated/uapi: No such file or directory [-Wmissi=
ng-include-dirs]
   In file included from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from ../../../drivers/nvdimm/btt_devs.c:5:
>> include/linux/math.h:6:10: fatal error: asm/div64.h: No such file or dir=
ectory
       6 | #include <asm/div64.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +6 include/linux/math.h

aa6159ab99a9ab Andy Shevchenko 2020-12-15  4 =20
e820a33748b5e2 Andy Shevchenko 2022-01-26  5  #include <linux/types.h>
aa6159ab99a9ab Andy Shevchenko 2020-12-15 @6  #include <asm/div64.h>
aa6159ab99a9ab Andy Shevchenko 2020-12-15  7  #include <uapi/linux/kernel.h>
aa6159ab99a9ab Andy Shevchenko 2020-12-15  8 =20

:::::: The code at line 6 was first introduced by commit
:::::: aa6159ab99a9ab5df835b4750b66cf132a5aa292 kernel.h: split out mathema=
tical helpers

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
