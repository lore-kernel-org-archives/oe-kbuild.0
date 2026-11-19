Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073519;
	b=g+uWWo2XGWxDUiUckFSBM92euBpC1Xm1RcPMg9rTT4iWACATTXnn+YlFGJZsk31aoJVb
	 KaNb9DFxNHaunRKUcZ0bSF3lezhEzQdXXLycKexC8qVzSqTVVcEW41j8Y/cLYjrelEBlz
	 Ek7Aw1IgaHqg1JZwpl3BRon5DqUxqHqYWHKqxMRIY3m/5aHW1cAFYvpNjsuxrXauZkU0L
	 aapmKq1C/F6yFPIlTuNmEMGf9KDJpKZVHquCcPQLu80jLhf9ozomesT26Ez7jFN4lqyyY
	 hfx0+6h1U/NBydxda0AfMRo5jPDASBwdrC07UAGo3QYxt2rujVPDDShgcteSDordfjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073519;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZsdPFOnm3ucwggj6mKbKsbv+sb4czRnAydpQEdIh3BU=;
	b=vAyH51yKIZeEmSUBwY1hMZQi1LDapasI8CJZ/OHZM2DaSEcdT/BSeKonNUkVW7Naoub6
	 45BLJHqiQA89m7LrxbFzEe/dmXb013TN5ilte+QWljG7o1brKcsa8eq1/oziQ/MfmRCIz
	 w/A6OjKpTO7frp+qkbuTX1tgGNlOk5t60v7yx2u8x8enhXDTE+zgQVN9sZKClTO/QoMX/
	 37Ko8r9yIxWCfU/Wq5f9I9HjHhWfu7NkFEANB1D2EjzkNLRN0/TUGcsFaBueJXXKaXbf+
	 6hTfEBhVub1CtYi2s1h1d//yyNN0JD8dR+e+OLl3i24lvz4+SSAqvhykXoQyyHkQGNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HsU6EOLh;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C581F606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 07:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C581F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HsU6EOLh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795073519; x=1826609519;
  h=date:from:to:cc:subject:message-id;
  bh=x9qU9K09LheLxAbEXvBq01vsltr18GS74VI7vpMuiYQ=;
  b=HsU6EOLhYP6hGV9bu/D+KaNxHH8CTGFsIpYk4qimM+SKOqtWcNHtE/sj
   Q2dZk0qbFsi0cU/36GNBpVxcNrQFxXK9i/ojqhlXa3qw63hci5BDHTShF
   mzX8+ddhXDEGFfvjgjZ6RjHH6y4NjVv9K4PwluWa0sabJm8wUH8HM8UpW
   isN17aZ7DS6Uo0t5LwIZLuxbSJQme8Wb3WeZgHf9aH3ywIKcaqAXRo6xm
   7LlyC3bYGcWbAOZN/MxLtdwQAVNTCh2I9HNmdAmFiiuV1iyPHFy0pgQXj
   2rVCMbTjk1BO0XfW7Qq3ni6gX4TdcUazfT4zomcsnrFAB9jPfjlm51uPQ
   g==;
X-CSE-ConnectionGUID: 0zq9vnfATtCPI6OV7qpo4w==
X-CSE-MsgGUID: UKxiQWjvTHmKILiecVxRyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3801842"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3801842"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:31:58 -0800
X-CSE-ConnectionGUID: QrRlyN4SS/S2jd1LJ6tpSA==
X-CSE-MsgGUID: 0FMlMqWxT1yO5Is9KcAltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10697044"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2026 23:31:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTwcd-000000003hx-1pMm;
	Thu, 19 Nov 2026 07:31:55 +0000
Date: Thu, 19 Nov 2026 08:31:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:vfs-7.5.misc 22/29]
 ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of
 type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long
 unsigned int'}
Message-ID: <20261119082400.bsY00dqo-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Sasha Levin <sashal@kernel.org>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git vfs-7.5.misc
head:   bc0dc43794630fd5c38369d19e91477d2a197328
commit: c07b5d746febe1ae2658304a0d878939e632f5f3 [22/29] selftests: add namespaces to TARGETS
:::::: branch date: 18 hours ago
:::::: commit date: 19 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261119/20261119082400.bsY00dqo-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119082400.bsY00dqo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119082400.bsY00dqo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from siocgskns_test.c:20:
   siocgskns_test.c: In function 'siocgskns_listns_visibility':
>> ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:741:9: note: in expansion of macro 'TH_LOG'
     741 |         TH_LOG("Found netns %llu in listns() output (kept alive by socket)", netns_id);
         |         ^~~~~~
>> ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:758:9: note: in expansion of macro 'TH_LOG'
     758 |         TH_LOG("Found netns %llu owned by userns %llu", netns_id, owner_id);
         |         ^~~~~~
   ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 7 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:758:9: note: in expansion of macro 'TH_LOG'
     758 |         TH_LOG("Found netns %llu owned by userns %llu", netns_id, owner_id);
         |         ^~~~~~
>> ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:779:9: note: in expansion of macro 'TH_LOG'
     779 |         TH_LOG("Netns %llu correctly disappeared from listns() after socket closed", netns_id);
         |         ^~~~~~
   siocgskns_test.c: In function 'siocgskns_file_handle':
   ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 7 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:914:9: note: in expansion of macro 'TH_LOG'
     914 |         TH_LOG("Constructed file handle for netns %lu (id=%llu)", netns_ino, netns_id);
         |         ^~~~~~
   siocgskns_test.c: In function 'siocgskns_listns_and_file_handle':
   ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 7 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:1140:9: note: in expansion of macro 'TH_LOG'
    1140 |         TH_LOG("Testing netns %lu (id=%llu) owned by userns id=%llu", netns_ino, netns_id, userns_id);
         |         ^~~~~~
   ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 8 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:1140:9: note: in expansion of macro 'TH_LOG'
    1140 |         TH_LOG("Testing netns %lu (id=%llu) owned by userns id=%llu", netns_ino, netns_id, userns_id);
         |         ^~~~~~
>> ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:1164:9: note: in expansion of macro 'TH_LOG'
    1164 |         TH_LOG("Found netns %llu in listns() output", netns_id);
         |         ^~~~~~
>> ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:1228:9: note: in expansion of macro 'TH_LOG'
    1228 |         TH_LOG("Found netns %llu in listns() output", netns_id);
         |         ^~~~~~
>> ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:1254:9: note: in expansion of macro 'TH_LOG'
    1254 |         TH_LOG("Netns %llu correctly disappeared from listns() after socket closed", netns_id);
         |         ^~~~~~
   siocgskns_test.c: In function 'siocgskns_multilevel_resurrection':
>> ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:1664:9: note: in expansion of macro 'TH_LOG'
    1664 |         TH_LOG("Multi-level hierarchy: net_L3A (id=%llu) -> userns_L3 (id=%llu) -> userns_L2 (id=%llu) -> userns_L1 (id=%llu)",
         |         ^~~~~~
   ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 7 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:1664:9: note: in expansion of macro 'TH_LOG'
    1664 |         TH_LOG("Multi-level hierarchy: net_L3A (id=%llu) -> userns_L3 (id=%llu) -> userns_L2 (id=%llu) -> userns_L1 (id=%llu)",
         |         ^~~~~~
   ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 8 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:1664:9: note: in expansion of macro 'TH_LOG'
    1664 |         TH_LOG("Multi-level hierarchy: net_L3A (id=%llu) -> userns_L3 (id=%llu) -> userns_L2 (id=%llu) -> userns_L1 (id=%llu)",
         |         ^~~~~~
   ../kselftest_harness.h:116:40: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 9 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   ../kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   siocgskns_test.c:1664:9: note: in expansion of macro 'TH_LOG'
    1664 |         TH_LOG("Multi-level hierarchy: net_L3A (id=%llu) -> userns_L3 (id=%llu) -> userns_L2 (id=%llu) -> userns_L1 (id=%llu)",
         |         ^~~~~~
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gnu/bin/ld: cannot find -lcap: No such file or directory
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
