Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3FE11700
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 05:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qj23sh+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699852761; x=1731388761;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Qe+jqgcCscmSXM6yc/Sj6fjj9iN/qoo+xwdQmgsOkzQ=;
  b=Qj23sh+DJXxgiO3kK9VgeAdKZSAbMXwIeS6JNM4zdiHHvm6gLwCFm21r
   ylCgrZ6qOeFHfg9cGHFkiVy7KxgWr8wh61aA0uWF0tt8p7i86WYP2eHuo
   W2X45BuZnuJNt2EOZfKoZ0CadBKZxZWWphTTNS0/C4Q21VCXUjU7i4aG9
   E+7uBbrpQFKwx3c2PDN5WEVpaQTL/BT/N1oZundZ60i+RmFd7krdAGfhp
   mBi7pQZcNEBLosIo+10RMyFISqRgE8cB7Snc4qP9CPG0r/B+p/3t/03bE
   Vblj2jakZ+NqCYpjPql6t39OsOMB7w4QOh1YqFheeL62WWEWthLF3oUWI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="389245601"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="389245601"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 21:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="881563024"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="881563024"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2023 21:19:16 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2PLu-000Bq2-1D;
	Mon, 13 Nov 2023 05:19:14 +0000
Date: Mon, 13 Nov 2023 13:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: xskxceiver.c:841:81: error: format '%d' expects argument of type
 'int', but argument 4 has type '__u64' {aka 'long long unsigned int'}
Message-ID: <202311131351.7mFKVwOr-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Maciej Wieczor-Retman" <maciej.wieczor-retman@intel.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Reinette Chatre <reinette.chatre@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b85ea95d086471afb4ad062012a4d73cd328fa86
commit: e33a02ed6a4fbadfa7813831f1f52874c991d324 selftests: Add printf attribute to kselftest prints
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131351.7mFKVwOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311131351.7mFKVwOr-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   xskxceiver.c: In function 'is_metadata_correct':
>> xskxceiver.c:841:81: error: format '%d' expects argument of type 'int', but argument 4 has type '__u64' {aka 'long long unsigned int'} [-Werror=format=]
     841 |                 ksft_print_msg("[%s] expected meta_count [%d], got meta_count [%d]\n",
         |                                                                                ~^
         |                                                                                 |
         |                                                                                 int
         |                                                                                %lld
     842 |                                __func__, pkt->pkt_nb, meta->count);
         |                                                       ~~~~~~~~~~~                
         |                                                           |
         |                                                           __u64 {aka long long unsigned int}
   xskxceiver.c: In function 'is_frag_valid':
>> xskxceiver.c:859:55: error: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'u64' {aka 'long unsigned int'} [-Werror=format=]
     859 |                 ksft_print_msg("Frag invalid addr: %llx len: %u\n", addr, len);
         |                                                    ~~~^             ~~~~
         |                                                       |             |
         |                                                       |             u64 {aka long unsigned int}
         |                                                       long long unsigned int
         |                                                    %lx
   xskxceiver.c:863:70: error: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'u64' {aka 'long unsigned int'} [-Werror=format=]
     863 |                 ksft_print_msg("Frag crosses frame boundary addr: %llx len: %u\n", addr, len);
         |                                                                   ~~~^             ~~~~
         |                                                                      |             |
         |                                                                      |             u64 {aka long unsigned int}
         |                                                                      long long unsigned int
         |                                                                   %lx
   xskxceiver.c: In function 'complete_pkts':
   xskxceiver.c:956:69: error: format '%llx' expects argument of type 'long long unsigned int', but argument 2 has type 'u64' {aka 'long unsigned int'} [-Werror=format=]
     956 |                         ksft_print_msg("Last completion address: %llx\n", addr);
         |                                                                  ~~~^     ~~~~
         |                                                                     |     |
         |                                                                     |     u64 {aka long unsigned int}
         |                                                                     long long unsigned int
         |                                                                  %lx
   xskxceiver.c: In function 'validate_tx_invalid_descs':
>> xskxceiver.c:1343:72: error: format '%u' expects argument of type 'unsigned int', but argument 3 has type '__u64' {aka 'long long unsigned int'} [-Werror=format=]
    1343 |                 ksft_print_msg("[%s] tx_invalid_descs incorrect. Got [%u] expected [%u]\n",
         |                                                                       ~^
         |                                                                        |
         |                                                                        unsigned int
         |                                                                       %llu
    1344 |                                __func__, stats.tx_invalid_descs, ifobject->pkt_stream->nb_pkts);
         |                                          ~~~~~~~~~~~~~~~~~~~~~~         
         |                                               |
         |                                               __u64 {aka long long unsigned int}
   cc1: all warnings being treated as errors
--
   In file included from x86_64/nx_huge_pages_test.c:17:
   x86_64/nx_huge_pages_test.c: In function 'main':
>> include/test_util.h:40:32: warning: format '%d' expects a matching 'int' argument [-Wformat=]
      40 |                 ksft_exit_skip("- " fmt "\n", ##__VA_ARGS__);   \
         |                                ^~~~
   x86_64/nx_huge_pages_test.c:261:9: note: in expansion of macro '__TEST_REQUIRE'
     261 |         __TEST_REQUIRE(token == MAGIC_TOKEN,
         |         ^~~~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
   mremap_test.c: In function 'remap_region':
>> mremap_test.c:341:83: warning: format '%d' expects argument of type 'int', but argument 2 has type 'long long unsigned int' [-Wformat=]
     341 |                         ksft_print_msg("Data after remap doesn't match at offset %d\n",
         |                                                                                  ~^
         |                                                                                   |
         |                                                                                   int
         |                                                                                  %lld
     342 |                                        i);
         |                                        ~                                           
         |                                        |
         |                                        long long unsigned int

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
