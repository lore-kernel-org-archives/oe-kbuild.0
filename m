Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953742;
	b=5TON/feOYPPVG3wm64EeRWyHYecOpyD9znl9vzX42CoiqEwpgGWQf3uBrltPcoSH6YWQ
	 iAgMO3dJg1SVg66/3E9/yP04owIysLwxFpWdXYLxca/uKbKVDoMZzdZvKQRb7PMeDqXsz
	 QRA7xmhUfS2mu/ISD9k/wrF8MixV+1mX80GRooatwPEKuIJ6mr3pwN8+t/VNXkmqv9pbB
	 baWzf7UiRKMTAjE6a7R/hQphtchtfvRHL0486ri4XXHs+JDSC/NVE1OOQqdPuGulfSlQ3
	 6MukfQ7LS2tKqmQ8YgJK+EaP+NZ549ju/v0sQ/Ybug0po82fEA8bZJ0XL495ZwQPi0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953742;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=30WRZdOuSPXXI/nHyvg7oQFRJDqb9X2+S81iGzEK+oU=;
	b=Sb9GAezcFqBVDnGpeUjxAMjB4I+R59HWeH5bLaFjYX2Q3gqazVdHUhBB0HcFsNfAZjC6
	 0MUgAysBYUIqqi00yowCHqK04sNEg6zrR59xL/ZQtWtkQYzpBXDYFn7bbaPJ3oIDiF+vz
	 EqL61dnYo+8koPPi8E3Z0f1N4pLlorIFiF6+HHHViifDO+f1nY0PQELbTkJHETMlPyO7d
	 ggkpx80GURMH1/PMA34rSQYitpyEH4qGyRxlniBkkVNTVJXovXTZ2iOdKfWJhyqYIcckc
	 6TLFDECcqNofo13FO6D1S2yj8iramjtBiFc/Dk+T2WLK/d9lp2fwX9vGy/6ylGkO9DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g60uQBsr;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C16606A32A
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 22:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C16606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g60uQBsr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794953742; x=1826489742;
  h=date:from:to:cc:subject:message-id;
  bh=Y+j5XucQPy/OrE/W46MELtdz6kmcYMcwjGYy2NoIH/s=;
  b=g60uQBsrW4NNfaTXygNwx5WYYc9OwpN88Sp5z/eJwvkO7vyFI2jTJ/s3
   z7A+U84eg7JNVDYC9ZMcauuSAc9p+jW0Kjy8Atk+58xf1zeiYmO9L8nkU
   Xm4pBRFs/59xQVVFV6TobNF3AWQH4qnTvSyaVkLG4Xv1Zx/exxovbpXcI
   NtxTWPSOUdZtMvKX1uGdTIOTWTN3PiwoufDz7BYVrFw30zvWx70pFxY+c
   pW7UjT5FLfSDDlRHEjpnvXX1kgcKVPxw5FUGidW2oJHZ9AAdvQKpKs21W
   iHPo9oZKCM7HjX3SrG4yJRKu+wgse1v690lO/6rP4BIh8kbH+Z7KumruA
   g==;
X-CSE-ConnectionGUID: WJayeaf9SSeoljWOBFsVTg==
X-CSE-MsgGUID: 6kaabctWQlOj3bk3Y299cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3776845"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3776845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 14:15:41 -0800
X-CSE-ConnectionGUID: eUk/1YGeQXq6b2cbtQ3v6A==
X-CSE-MsgGUID: gg1NSmUkTNGnWVLncMUNvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9841984"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Nov 2026 14:15:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTRSj-000000003Cw-3rqY;
	Tue, 17 Nov 2026 22:15:37 +0000
Date: Tue, 17 Nov 2026 23:14:47 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-lts 205/205]
 ksm_tests.c:933:9: error: implicit declaration of function
 'ksft_test_result_report'; did you mean 'ksft_test_result_error'?
Message-ID: <20261117231407.vsyHqALt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   824580839cbc0d47e64dd2bbdef66590a57ef92d
commit: bdef4a404fab502f7ef8c855334d558f09a8e1af [205/205] selftests/mm: ksm_tests: use kselftest framework
:::::: branch date: 33 hours ago
:::::: commit date: 9 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261117/20261117231407.vsyHqALt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117231407.vsyHqALt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117231407.vsyHqALt-lkp@intel.com/

Note: the android-common/android15-6.6-lts HEAD 824580839cbc0d47e64dd2bbdef66590a57ef92d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ksm_tests.c: In function 'main':
>> ksm_tests.c:933:9: error: implicit declaration of function 'ksft_test_result_report'; did you mean 'ksft_test_result_error'? [-Wimplicit-function-declaration]
     933 |         ksft_test_result_report(ret, "%s\n", test_descr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         ksft_test_result_error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
