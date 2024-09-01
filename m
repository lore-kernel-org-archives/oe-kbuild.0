Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B099126AC1
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 18:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725216928; cv=none; b=SvVtKZsN5cAqRl9MTLR/IuYZG/AtIUYLuhEXDNlRbxtxmUGn+VWeTtnolmoea8JMkFHcceKlwvsq6TzKfJbE1t+JG3EuzedjNIcT4vnyHms8wRUk+/8p7yx3m8bqhzCFk+5iNtY/NZduEV/vxD07eIMrU/JMMWJXilM/08FdFng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725216928; c=relaxed/simple;
	bh=LtGzSyzxVgOEqHjBskXnF/2cLt43D+Elsg5u9wifZ1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evVOeWJ8lFVVBeAm4n5GCuEiZ779o4Ed7V5KiPUWcYolfQGcXgDJhPBRW51z7kS6uuVXE0fyuXko2GxZ8zTF1J+Ov/pTiaf6YV8fOYBoMal+V6uzZRa9fFnrM+dQ1M6PPWvre+AtOSx/Tc+viZNqjO91vfypdbZJDbVdi0ttIZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ab0qSNTr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ab0qSNTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725216926; x=1756752926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtGzSyzxVgOEqHjBskXnF/2cLt43D+Elsg5u9wifZ1s=;
  b=Ab0qSNTrCTLFmSezLxhJoLcqHH3EsL7RqJy5lDVYtwCKHUCGx9+ZnGvA
   o0cbrltO01P/G5hW3ZvW71dB72NpVMJeXxrQefKn/85BtI8aSDBG6S8ez
   192oTCSx2JOI8O+lwviXmzkWvCszB52s55nddbVSINwocH6ufFFjYL/EE
   8IwDaC/lLKTmwcg2qfaqnF+RTibxgM8EN15lyUxMcb2OMuOtKta7OfEPj
   Pv79//bLlLVdj3Fc3gY3lDd9o0l059ukYIIRdDFfGTRz+n/KrWFcFowPU
   qNxD20MrlBsSRB4ERlM6O3TqTsYJiKhscl3M3GX5ql34l3eztsdb6K+Hu
   A==;
X-CSE-ConnectionGUID: Gy7wIfTXQMS4LQIX4lnYCw==
X-CSE-MsgGUID: 8Pn/inP3QbSkMavruZ6nPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23661923"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="23661923"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 11:55:25 -0700
X-CSE-ConnectionGUID: 2atAsdvzTvi/PSNeKrUYUQ==
X-CSE-MsgGUID: 1ddqFGDlRrC8HBgjd5dBEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64081933"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Sep 2024 11:55:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skpjN-0004qk-2x;
	Sun, 01 Sep 2024 18:55:21 +0000
Date: Mon, 2 Sep 2024 02:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v3 2/2] rxtimestamp.c: add the test for
 SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER
Message-ID: <202409020124.YybQQDrP-lkp@intel.com>
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
In-Reply-To: <20240830153751.86895-3-kerneljasonxing@gmail.com>
References: <20240830153751.86895-3-kerneljasonxing@gmail.com>
TO: Jason Xing <kerneljasonxing@gmail.com>
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: dsahern@kernel.org
TO: willemb@google.com
CC: netdev@vger.kernel.org
CC: Jason Xing <kernelxing@tencent.com>

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-timestamp-filter-out-report-when-setting-SOF_TIMESTAMPING_SOFTWARE/20240830-234014
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240830153751.86895-3-kerneljasonxing%40gmail.com
patch subject: [PATCH net-next v3 2/2] rxtimestamp.c: add the test for SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409020124.YybQQDrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409020124.YybQQDrP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rxtimestamp.c:102:6: error: use of undeclared identifier 'SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER'
     102 |                         | SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER },
         |                           ^
>> rxtimestamp.c:373:20: error: invalid application of 'sizeof' to an incomplete type 'struct test_case[]'
     373 |                         for (t = 0; t < ARRAY_SIZE(test_cases); t++) {
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   ./../kselftest.h:61:32: note: expanded from macro 'ARRAY_SIZE'
      61 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                                ^~~~~
   rxtimestamp.c:380:13: error: invalid application of 'sizeof' to an incomplete type 'struct test_case[]'
     380 |                         if (t >= ARRAY_SIZE(test_cases))
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   ./../kselftest.h:61:32: note: expanded from macro 'ARRAY_SIZE'
      61 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                                ^~~~~
   rxtimestamp.c:419:19: error: invalid application of 'sizeof' to an incomplete type 'struct test_case[]'
     419 |                 for (t = 0; t < ARRAY_SIZE(test_cases); t++) {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   ./../kselftest.h:61:32: note: expanded from macro 'ARRAY_SIZE'
      61 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
         |                                ^~~~~
   4 errors generated.


vim +/SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER +102 tools/testing/selftests/net/rxtimestamp.c

16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   67  
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   68  static struct test_case test_cases[] = {
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   69  	{ {}, {} },
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   70  	{
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   71  		{ .so_timestamp = 1 },
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   72  		{ .tstamp = true }
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   73  	},
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   74  	{
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   75  		{ .so_timestampns = 1 },
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   76  		{ .tstampns = true }
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   77  	},
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   78  	{
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   79  		{ .so_timestamp = 1, .so_timestampns = 1 },
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   80  		{ .tstampns = true }
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   81  	},
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   82  	{
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   83  		{ .so_timestamping = SOF_TIMESTAMPING_RX_SOFTWARE },
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   84  		{}
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   85  	},
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   86  	{
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   87  		/* Loopback device does not support hw timestamps. */
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   88  		{ .so_timestamping = SOF_TIMESTAMPING_RX_HARDWARE },
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   89  		{}
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   90  	},
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   91  	{
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   92  		{ .so_timestamping = SOF_TIMESTAMPING_SOFTWARE },
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   93  		.warn_on_fail = true
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   94  	},
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   95  	{
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04   96  		{ .so_timestamping = SOF_TIMESTAMPING_RX_SOFTWARE
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   97  			| SOF_TIMESTAMPING_RX_HARDWARE },
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   98  		{}
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22   99  	},
93e82194e6a4ec9 tools/testing/selftests/net/rxtimestamp.c                     Jason Xing   2024-08-30  100  	{
93e82194e6a4ec9 tools/testing/selftests/net/rxtimestamp.c                     Jason Xing   2024-08-30  101  		{ .so_timestamping = SOF_TIMESTAMPING_SOFTWARE
93e82194e6a4ec9 tools/testing/selftests/net/rxtimestamp.c                     Jason Xing   2024-08-30 @102  			| SOF_TIMESTAMPING_OPT_RX_SOFTWARE_FILTER },
93e82194e6a4ec9 tools/testing/selftests/net/rxtimestamp.c                     Jason Xing   2024-08-30  103  		{}
93e82194e6a4ec9 tools/testing/selftests/net/rxtimestamp.c                     Jason Xing   2024-08-30  104  	},
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22  105  	{
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04  106  		{ .so_timestamping = SOF_TIMESTAMPING_SOFTWARE
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22  107  			| SOF_TIMESTAMPING_RX_SOFTWARE },
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04  108  		{ .swtstamp = true }
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22  109  	},
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22  110  	{
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04  111  		{ .so_timestamp = 1, .so_timestamping = SOF_TIMESTAMPING_SOFTWARE
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22  112  			| SOF_TIMESTAMPING_RX_SOFTWARE },
f551e2fdaf81b7b tools/testing/selftests/net/rxtimestamp.c                     Tanner Love  2020-07-04  113  		{ .tstamp = true, .swtstamp = true }
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22  114  	},
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22  115  };
16e781224198be0 tools/testing/selftests/networking/timestamping/rxtimestamp.c Mike Maloney 2017-08-22  116  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
