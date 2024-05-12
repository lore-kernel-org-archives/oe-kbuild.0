Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A155A1CA9C
	for <oe-kbuild@lists.linux.dev>; Sun, 12 May 2024 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715513335; cv=none; b=U4/3PpoAvmCasvu4TSbtwXNmK9kn93VI24mfuB0YRDPVFhLVW1SKj7Di+OdhHFOVKtmTAeCYe3bsvyEpCGjHlV/NvR6rDt0pqwDKH8cCk95cBHZZbarAeIpopuElf8CPsQMUNEtc8/8fs/V1OSunezujqMX2OIRaxlDhD42WBQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715513335; c=relaxed/simple;
	bh=fBrSlBtH+nIO9DiUbmsO2cX/sHAOuJ8Yodb5Xo+eNDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QRnhI+0DqLKz5b8hQRs6eQGHupXA1iWS549RdWaDqsSaU1cHEEtQwfSqA9L1NiGJ/CzXdeBI9lP5vZAeZ/gtoI1IcgoSZKFY+yYLHgy7U6x3EuBYVdJO+6tOLBi9lxtNt1KKKPqnz3PGFQJNFNFV6pepCosBMhNBbaK6n/2njOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0gbt2Wx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0gbt2Wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715513334; x=1747049334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBrSlBtH+nIO9DiUbmsO2cX/sHAOuJ8Yodb5Xo+eNDE=;
  b=a0gbt2WxDI3vMZrGxMtU82+gos3V7IpHZrfiUaEi+xqiyUKnP6tSpcpl
   3QWRQXIX5S81zcy5OAmkfyJr34yEa8FTiJK142/tyESKS+P+ItQmGinwc
   bq//Lp/eaG9fkX3sptEzRJBdJjWucXkcnkGWTW5aiQ03hlt8cwTI/Q4Ss
   bw/BJzol/iZykhcSqWeLDjr2h+ti1LULEncimTSBh1zzSMK0NrM9v/e9L
   FABotHblbysW7HMm3VSimYq7l4ipF1sDlar1mNcrEyijvrYv77CHltc/o
   DwxxI7uMhpfge7LRPSSquPVrB8WtLbo2Zgnr8YZtzmYJnujIBgID8LAHG
   A==;
X-CSE-ConnectionGUID: F27usEWFQ7+d7ccNPMVVUQ==
X-CSE-MsgGUID: pMbrKFGuSYC8RBUvrMHw8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="22031561"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="22031561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 04:28:54 -0700
X-CSE-ConnectionGUID: dlDRXMTQSBezl59EjNRc+Q==
X-CSE-MsgGUID: tzo22hsQTuGMADZ7QzCHmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="53289006"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2024 04:28:52 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s67Np-0008Xj-2T;
	Sun, 12 May 2024 11:28:49 +0000
Date: Sun, 12 May 2024 19:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12023/12533] test_cachestat.c:2:9: warning:
 '_GNU_SOURCE' macro redefined
Message-ID: <202405121952.nKKkle9V-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Edward Liaw <edliaw@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: Mark Brown <broonie@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   75fa778d74b786a1608d55d655d42b480a6fa8bd
commit: daef47b89efd0b745e8478d69a3ad724bd8b4dc6 [12023/12533] selftests: Compile kselftest headers with -D_GNU_SOURCE
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121952.nKKkle9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405121952.nKKkle9V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> test_cachestat.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> test_execve.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3.c:5:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       5 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3_clear_sighand.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3_set_tid.c:9:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       9 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3_cap_checkpoint_restore.c:11:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      11 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> close_range_test.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> udmabuf.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> devpts_pts.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> dnotify_test.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE     /* needed to get the defines */
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> binderfs_test.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
..


vim +/_GNU_SOURCE +2 tools/testing/selftests/cachestat/test_cachestat.c

88537aac0b38403 Nhat Pham 2023-05-02 @2  #define _GNU_SOURCE
88537aac0b38403 Nhat Pham 2023-05-02  3  

:::::: The code at line 2 was first introduced by commit
:::::: 88537aac0b3840314d3a5cc401a7fc400c069bc9 selftests: add selftests for cachestat

:::::: TO: Nhat Pham <nphamcs@gmail.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
