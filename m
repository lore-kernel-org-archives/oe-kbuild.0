Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35681E48A
	for <oe-kbuild@lists.linux.dev>; Sun,  5 May 2024 14:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714920304; cv=none; b=bHuxvVQFHYW3RoKPm/ADjuh/KlqTxp4W06AdYSwPvvtCe1/FaiBZH5Uiib8H2DOQMXHid3KeV3oz9qfptdqoTpkEudxp6njkDa31QjEDZ1FTUWMU3EjT/IehfhwYeevgx6cqVPV3wN11zfQiQDy/Zvka367JdvQHo/jGMSUQwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714920304; c=relaxed/simple;
	bh=Dlw2HXOkfcpRqY8jGe9WwYuF/dCLvxWV3u8GByuJ/WM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKELS9vLEMh5KkPZ0tczbPff88CxjVVv3c3csHtV9Z868sOHX9aGg8DYTFUwJRSwOakHyAqodfcIxtUJdQ+HLVA2sVePjJQMzq5zzEj6MumjNFRjsl83oEXAk00CoI8hZg2cCDhHXAp+8mhii+9JotPyc2wprXcNTJZPN7zSYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYkJlJSk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYkJlJSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714920303; x=1746456303;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Dlw2HXOkfcpRqY8jGe9WwYuF/dCLvxWV3u8GByuJ/WM=;
  b=GYkJlJSkT4To3Pb6banS5lbD4qG7Nv7FFQLi709Bcrh9s/6IMsBdV5t+
   0grgBWA7KK+qAxtYiXplpLzHy8d+MFnR6cupLtDPuF48v2fR8Ogz4jOhe
   RPLwO1SRha3LeYcso3rxjTIYh4dO5X4uXYR8r3KLZiL3Zqb1gUHo00ZZT
   IjFSdgx+VAkpk5bpVCdTjMmqUxsCwPHJFnOHyc1Z4F+z+CBYcHNHHhrXZ
   T/8IPTA1f5YHdS2hlM0fIr6GrOQZsbJTMFxUJAL7qaZbEUcHQLSo0dmpU
   oGMeZNHQeWrp5Qeo3G21inWgYY1ce3sTVWkAuU3hQh3tSbMKGzczHP5Ib
   g==;
X-CSE-ConnectionGUID: Y7/FpxzGQPKFy41lGXWSTg==
X-CSE-MsgGUID: Y6YOz/3yR1SlnEATlTt4ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10545810"
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="10545810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 07:45:02 -0700
X-CSE-ConnectionGUID: abKunBWjRcuAOiKD71FeBg==
X-CSE-MsgGUID: nfcftN+uTzyuhQ9kuaZGog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,256,1708416000"; 
   d="scan'208";a="65357414"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2024 07:45:01 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3d6o-0000I4-26;
	Sun, 05 May 2024 14:44:58 +0000
Date: Sun, 5 May 2024 22:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] selftests/openat2: fix clang build failures:
 -static-libasan, LOCAL_HDRS
Message-ID: <202405052201.5beL5OYU-lkp@intel.com>
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
In-Reply-To: <20240504044336.14411-1-jhubbard@nvidia.com>
References: <20240504044336.14411-1-jhubbard@nvidia.com>
TO: John Hubbard <jhubbard@nvidia.com>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: "Maciej Wieczor-Retman" <maciej.wieczor-retman@intel.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: Alexey Gladkov <legion@kernel.org>
CC: Valentin Obst <kernel@valentinobst.de>
CC: linux-kselftest@vger.kernel.org
CC: LKML <linux-kernel@vger.kernel.org>
CC: llvm@lists.linux.dev
CC: John Hubbard <jhubbard@nvidia.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on ddb4c3f25b7b95df3d6932db0b379d768a6ebdf7]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Hubbard/selftests-fchmodat2-fix-clang-build-failure-due-to-static-libasan/20240504-124520
base:   ddb4c3f25b7b95df3d6932db0b379d768a6ebdf7
patch link:    https://lore.kernel.org/r/20240504044336.14411-1-jhubbard%40nvidia.com
patch subject: [PATCH 1/2] selftests/openat2: fix clang build failures: -static-libasan, LOCAL_HDRS
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405052201.5beL5OYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405052201.5beL5OYU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/x86_64-linux-gnu-ld: cannot find /opt/cross/clang-e6c3289804/lib/clang/18/lib/linux/libclang_rt.asan_static-x86_64.a: No such file or directory
>> /usr/bin/x86_64-linux-gnu-ld: cannot find /opt/cross/clang-e6c3289804/lib/clang/18/lib/linux/libclang_rt.asan-x86_64.a: No such file or directory
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
