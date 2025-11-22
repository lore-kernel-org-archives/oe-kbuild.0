Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7118027
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763822574; cv=none; b=ezTQx4goonzkKyfWqWmbWX2GFFIMApb01C6z2D1Yzic3xQvNdelUzx5ohBernXZI1xOXIvHKknVHdMHC/yOm51Zm0E2gT7A2ERuNP7PMI6l1qAtSwriX9FwiA3U+DOebG7Ghf3LWOhGeqYCZxK046BWxU9kThSrfYhvPpqjRDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763822574; c=relaxed/simple;
	bh=ZDhrlSrdr2O+VSKDOAryx8vPC48UZi0asM/tNXTQQmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bCLlENRA5kaYOXlpzAqayR4S9SXb6UM02qF1b6R4WBVlrhD420NtjFlvVlxZEzx2GDjR4KOb+by5A7TuqeF6XcDR9G9u+irn7ASgYKxkET7WfJdRx7QdkTz3clf343vnzbBTt+1bF3xE47wyZBN6U+AVksUBrsrPYiATLxd+XNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huRX7s9r; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huRX7s9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763822572; x=1795358572;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZDhrlSrdr2O+VSKDOAryx8vPC48UZi0asM/tNXTQQmc=;
  b=huRX7s9rHOtiBRx2E1LS7sqtnpoitl95bP3gqnXSwfe07fe8I4y/JbcA
   xzOLjir3cW7lFG7FjBTU9zdW4ATKTMjYZpDPKS0EA9lSpDuuF90F1pjwV
   H/ICYk2IYxgYeBsBOWvjXB8tgu8XKOeVg8s2kJrgX9Rf5UxM/X3Pv/xTV
   eLr0aKQQPTwQhCqYOFQr8euTwluGxiM3ZBjKYNJplMnO2AgF4rKAkfbzu
   RDy8K5a2VyHnJFn3HPruYujahp9FTT59NKRONXbRgY43oXCxuOdcDYJ0f
   b0MBD9B1UsyUnwKi80sDRV1EApdm18kk8wuhAMMK7YFECbZQTX3eVoe3q
   w==;
X-CSE-ConnectionGUID: 8t1hfQ2zTeyIuPemICFgKg==
X-CSE-MsgGUID: bfWetKClQLe+LWiP0flu6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65921786"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65921786"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:42:51 -0800
X-CSE-ConnectionGUID: P6cAehUISuGuJ/ss5UOxYw==
X-CSE-MsgGUID: AzMM838GQu2LwU7arDJ22w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="191960385"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2025 06:42:50 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMop6-0007bP-0h;
	Sat, 22 Nov 2025 14:42:48 +0000
Date: Sat, 22 Nov 2025 22:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 07/18] vfio: selftests: Eliminate overly chatty logging
Message-ID: <202511222214.BiU6tURK-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251121181429.1421717-8-dmatlack@google.com>
References: <20251121181429.1421717-8-dmatlack@google.com>
TO: David Matlack <dmatlack@google.com>
TO: Alex Williamson <alex@shazbot.org>
CC: Alex Mastro <amastro@fb.com>
CC: David Matlack <dmatlack@google.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Josh Hilke <jrhilke@google.com>
CC: kvm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Raghavendra Rao Ananta <rananta@google.com>
CC: Vipin Sharma <vipinsh@google.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on fa804aa4ac1b091ef2ec2981f08a1c28aaeba8e7]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Matlack/vfio-selftests-Move-run-sh-into-scripts-directory/20251122-022109
base:   fa804aa4ac1b091ef2ec2981f08a1c28aaeba8e7
patch link:    https://lore.kernel.org/r/20251121181429.1421717-8-dmatlack%40google.com
patch subject: [PATCH v3 07/18] vfio: selftests: Eliminate overly chatty logging
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511222214.BiU6tURK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511222214.BiU6tURK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511222214.BiU6tURK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/testing/selftests/vfio/lib/vfio_pci_driver.c:2:
>> tools/testing/selftests/vfio/lib/include/../../../kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +53 tools/testing/selftests/vfio/lib/include/../../../kselftest.h

7fb2c3ea28bf7b7 Shuah Khan     2014-10-03  51  
9e38be732da8fe3 Mark Brown     2023-04-06  52  #ifndef NOLIBC
fc2e634e997d84f Aleksa Sarai   2019-07-20 @53  #include <errno.h>
7fb2c3ea28bf7b7 Shuah Khan     2014-10-03  54  #include <stdlib.h>
7fb2c3ea28bf7b7 Shuah Khan     2014-10-03  55  #include <unistd.h>
151b2732111f074 Paul Elder     2017-06-28  56  #include <stdarg.h>
f2662ec26b26adb André Almeida  2025-09-17  57  #include <stdbool.h>
907f33028871fa7 Mark Brown     2023-09-28  58  #include <string.h>
a18261d71bbc625 Tycho Andersen 2019-01-18  59  #include <stdio.h>
6d029c25b71f2de Oleg Nesterov  2024-04-09  60  #include <sys/utsname.h>
9e38be732da8fe3 Mark Brown     2023-04-06  61  #endif
7fb2c3ea28bf7b7 Shuah Khan     2014-10-03  62  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
