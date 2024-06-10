Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C1D3A8CE
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 05:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717999063; cv=none; b=r4pz6iQonw3ucAkeGGJppCFPgy3Ru+R4gOyursq2hKp1uVOANlQjy7BnDb+73pKDFNIM816STeAbnJgck81xmC4TJbXAhyL17bmM2pOnLD/DglFEykRsUg1c2Emd7KD7fZIa9DQp9dU67JrliakwACKamllrmNGwPbEc8Xwuoko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717999063; c=relaxed/simple;
	bh=0/euRzOUfiLtKP7DpFZbbi0AHG6wdqV8cbvqMRyqTN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zccmvvi12RnxdXZTCv6dEnz579ix9eaOLzwa/Q/8ijTwO+OlBDksuDjiD6szr7CEg1UcD7cupXHOG4WbqCSVquGlvVnULALg20tAFs9ZeM3jJOkfbmRFc2uNm3/s8OrWb9lEmjXRs5eUCdN+UbU6YKDb9+0wTnkyKBilY5aQwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2QRt/MU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2QRt/MU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717999061; x=1749535061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/euRzOUfiLtKP7DpFZbbi0AHG6wdqV8cbvqMRyqTN4=;
  b=d2QRt/MUo6UtOr91GSgIYTBgtGfi19uAIi2lq+3M3ms5jRFwUTkM4yVB
   R+jnDS218LtVN5QUN4gXHOLQRfHLB9G5bLQ0paNOfKujOuoa628jnFNHm
   3iseMQEqOcuhuckV+ri0igqN5a00gx/vC3qGqOo2j4FiF/KkzrXL8YRm7
   uvkSyU7wtxDJBy+0E468IUqzbNzQpIYcUXH8NssEqMLnQAx+wTzQPodRZ
   twyjWIbdjaoJMhv95nFhtTBySRgUbK6uTgmZvyAef/4WRyY20YrI2fKq9
   A0r+gxre/QtfS4ccC2MBjSfCQSAveRCRMfGePYB7SpIJQzrpTHv2NuAum
   g==;
X-CSE-ConnectionGUID: qO+aQ5WPQvykxZJXHw5gqA==
X-CSE-MsgGUID: HvYFQr5BR7Co1dNuBXOkkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="40043520"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="40043520"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 22:57:40 -0700
X-CSE-ConnectionGUID: E2q+e/t5QW+ZsaxRVmUBxA==
X-CSE-MsgGUID: 8qXfRkI1TFWUQzfFrVEWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="39495633"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2024 22:57:40 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGY2D-0001tR-2F;
	Mon, 10 Jun 2024 05:57:37 +0000
Date: Mon, 10 Jun 2024 13:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jcmvbkbc-xtensa:xtensa-6.10-rc2-esp32 46/46]
 tools/perf/util/evlist.c:1533:8: error: unused variable 'bf'
Message-ID: <202406101319.AgYGRdaD-lkp@intel.com>
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
TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.10-rc2-esp32
head:   abd44c5784518efb46e1601d9b04cb5a63506944
commit: abd44c5784518efb46e1601d9b04cb5a63506944 [46/46] WIP: tools/perf: make work on noMMU
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101319.AgYGRdaD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406101319.AgYGRdaD-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:663: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.10.rc2.gabd44c578451
>> tools/perf/util/evlist.c:1533:8: error: unused variable 'bf' [-Werror,-Wunused-variable]
    1533 |                 char bf = 0;
         |                      ^~
   1 error generated.
>> error: command 'clang' failed with exit code 1
   cp: cannot stat 'tools/perf/python_ext_build/lib/perf*.so': No such file or directory
   make[5]: *** [Makefile.perf:702: tools/perf/python/perf.cpython-311-x86_64-linux-gnu.so] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +/bf +1533 tools/perf/util/evlist.c

35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1529  
7b392ef04ef570c Arnaldo Carvalho de Melo 2020-11-30  1530  int evlist__start_workload(struct evlist *evlist)
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1531  {
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1532  	if (evlist->workload.cork_fd > 0) {
b3824404ebbd489 David Ahern              2013-07-02 @1533  		char bf = 0;
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1534  		int ret;
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1535  		/*
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1536  		 * Remove the cork, let it rip!
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1537  		 */
abd44c5784518ef Max Filippov             2023-07-26  1538  		ret = 1;//write(evlist->workload.cork_fd, &bf, 1);
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1539  		if (ret < 0)
e978be9ea2990f1 Soramichi Akiyama        2017-01-10  1540  			perror("unable to write to pipe");
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1541  
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1542  		close(evlist->workload.cork_fd);
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1543  		return ret;
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1544  	}
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1545  
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1546  	return 0;
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1547  }
cb0b29e0861659c Arnaldo Carvalho de Melo 2012-08-02  1548  

:::::: The code at line 1533 was first introduced by commit
:::::: b3824404ebbd489858f3a7097c715120118fa5cd perf evlist: Fix use of uninitialized variable

:::::: TO: David Ahern <dsahern@gmail.com>
:::::: CC: Arnaldo Carvalho de Melo <acme@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
