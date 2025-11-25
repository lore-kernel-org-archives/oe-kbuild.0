Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0F7322C60
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076125; cv=none; b=o3BSqcRynLVyp9w0BfnpLyWk0yMRMrW3ylrFZWE/JYFucoZzcii1B9xxlRzlRGzjmNPW0JmFYwzr1SwLvcOCH55/dtN2Uu0csSbLwv0wnL6qKFTO1P9Oyy0Vd8lrnsbb2PTdDR8Pjp+i2T0Bpvtk6xMy1qVYeMXQ2pQR/j5nCJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076125; c=relaxed/simple;
	bh=CV7z33syTRoU+Ip4vm4dkRqsQHfKdbxIkgtundjrxsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHMjctG/r6RWkMUWLhf/92NC65/i13sjLV8jYE2oGE/Xr2KelGmtJFunbjkEPBUBVj8r4znXj+akzbSMq5+UUswtmyrZjkWaRe1l5uhMRYt2JGuqjCVRMtBR6BAj2YHrd2d8mVUTxGRXaEFouNlyahM37wESjV6l77eoTJuM4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lPqcJ/xi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPqcJ/xi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764076124; x=1795612124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CV7z33syTRoU+Ip4vm4dkRqsQHfKdbxIkgtundjrxsg=;
  b=lPqcJ/xiOTyau5bYgbQVJcCR1waxFpWBbgcqLyQbarg7MlmgqJ39ZsLV
   kXCd7CcVSQiNrrs32tMZJ7JoTyC7shH/m6dea62afsPMuIpibgsvGjV9F
   E72lGehv89lRjZ9k6YBK7QgkbEiGwN1zuUO2m0Zi4aW/3DYAkuNM9ndBB
   HPajTzLXnj6bWJHiDwW2uzKwDqk3fOhQOXC5Z9Nmm5AMXVocfm9sAJHnr
   Wp+AZFHo9fC0/ovbuG1hd2M97P92/sio/dks1nxNxio+aUuJ3zASw3h8S
   Lel758UA+CcNvHI5rAtyGlkF+asUBWiM1Kekeh7i2qsq/+i2ojiU9W6bA
   A==;
X-CSE-ConnectionGUID: u1WdRDDhT9iC2O1PvXavSQ==
X-CSE-MsgGUID: NGfzRsgHRpy2ncDPR74Ycw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66169834"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="66169834"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:08:43 -0800
X-CSE-ConnectionGUID: gBHg7ja5Q2ezJ5cHTILCTQ==
X-CSE-MsgGUID: UA/jw2oBQRKw4wvo60L7bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192632660"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2025 05:08:42 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNsmd-000000000V3-2n0V;
	Tue, 25 Nov 2025 13:08:39 +0000
Date: Tue, 25 Nov 2025 14:07:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5] userfaultfd.c:355:13: warning:
 'uffd_test_ctx_clear' defined but not used
Message-ID: <202511251420.OxKg9VPE-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: 2a92fb277f9435cd9959a1f9401217330b1b8aaf [5/5] BACKPORT: FROMGIT: userfaultfd/selftests: reinitialize test context in each test
:::::: branch date: 27 hours ago
:::::: commit date: 4 years, 6 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251125/202511251420.OxKg9VPE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251420.OxKg9VPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511251420.OxKg9VPE-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                 ^~~~
   userfaultfd.c:893:25: note: in expansion of macro 'err'
     893 |                         err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                         ^~~
   userfaultfd.c:896:47: error: expected ')' before 'PRId64'
     896 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                                               ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:896:17: note: in expansion of macro 'err'
     896 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:896:47: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     896 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                                               ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:896:17: note: in expansion of macro 'err'
     896 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:142:24: note: to match this '('
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:896:17: note: in expansion of macro 'err'
     896 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:142:33: warning: spurious trailing '%' in format [-Wformat=]
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:896:17: note: in expansion of macro 'err'
     896 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c: In function '__uffdio_zeropage':
   userfaultfd.c:920:55: error: expected ')' before 'PRId64'
     920 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                                                       ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:920:25: note: in expansion of macro 'err'
     920 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:920:55: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     920 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                                                       ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:920:25: note: in expansion of macro 'err'
     920 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:142:24: note: to match this '('
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:920:25: note: in expansion of macro 'err'
     920 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:142:33: warning: spurious trailing '%' in format [-Wformat=]
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:920:25: note: in expansion of macro 'err'
     920 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c: In function 'userfaultfd_zeropage_test':
   userfaultfd.c:954:9: error: implicit declaration of function 'uffd_test_ctx_init'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
     954 |         uffd_test_ctx_init(0);
         |         ^~~~~~~~~~~~~~~~~~
         |         uffd_test_ctx_clear
   userfaultfd.c: In function 'userfaultfd_minor_test':
   userfaultfd.c:1091:9: error: unknown type name 'uint8_t'
    1091 |         uint8_t expected_byte;
         |         ^~~~~~~
   userfaultfd.c:1091:9: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1095:9: error: unknown type name 'uint64_t'
    1095 |         uint64_t features = UFFD_FEATURE_MINOR_HUGETLBFS;
         |         ^~~~~~~~
   userfaultfd.c:1095:9: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1103:9: error: implicit declaration of function 'uffd_test_ctx_init_ext'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
    1103 |         uffd_test_ctx_init_ext(&features);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         uffd_test_ctx_clear
   userfaultfd.c:1127:58: error: 'uint8_t' undeclared (first use in this function)
    1127 |                 memset(area_dst + (p * page_size), p % ((uint8_t)-1),
         |                                                          ^~~~~~~
   userfaultfd.c:1127:58: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: At top level:
>> userfaultfd.c:355:13: warning: 'uffd_test_ctx_clear' defined but not used [-Wunused-function]
     355 | static void uffd_test_ctx_clear(void)
         |             ^~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
