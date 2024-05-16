Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65A17C
	for <oe-kbuild@lists.linux.dev>; Thu, 16 May 2024 00:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715818576; cv=none; b=MLz8NwmBzZ3cggxvW7hm0EW2wOOFAUzQsx9QEEkgdBV8u6vlc7vavAVWKExJ9DcjtNd9Ha0BQxbdD/biqra+tBeoO23WjsyBS3427ZpilqFWEju1m0ZZb/2XqXKnEOSu6AFm8V0B98X79N+h/sjQDSAY/l1nZZSETKDP0rWxX/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715818576; c=relaxed/simple;
	bh=zbqWkFFXKZ/lkCO/05mzZYsBen4EVxf0LNtrdPHVgyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TBqq+PAe9JpgDNR0iHjfphJdAsXOmbRf+PNh8S68rh2wV5Dfr7ni+fIXn7KCmL0nJL9QJvmddeAwehtCLcDFy7X+Tun9yajRe7eOKrMpXKHjSdXXgmVodFqIdeJQDEcIL6vyB2IfWU57rVfDnA8GWHMv+nUF2QwQ1FISMKBI328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0m/QbHR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0m/QbHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715818575; x=1747354575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zbqWkFFXKZ/lkCO/05mzZYsBen4EVxf0LNtrdPHVgyU=;
  b=J0m/QbHRvOFb/O8eekpz3c51dcCnTd4ZC66bqt6LZwS182XYHdyjnEBp
   Y1gPeXh1kKh1nXmnb4z3Lk+9TDYv+xWz9PtFXCaRJFeIOrhHSIrFjT9o7
   4IYpL+p2Edq99mRVWyXsJG08CetHmzsgBFOs+e76M1otf5OUdrTKlNBb+
   zYpgg2ukpbC6+T62ZCJFqr1N2QRoV6JZ956B1PgkzmNheJuBfqJT+1BGd
   52ofuOTJHz8ll4HkI4vaLozpLAr82BBOWo5lSD7O1mCFBdd1jQBoOV3Ap
   UA7SLKlOCTJYtqjQDmo6CDLwq1E15hh4dQCeVm+btHZdENCDquynZgZ2u
   A==;
X-CSE-ConnectionGUID: 8v5fbigaQtO6PUXHxrAh8Q==
X-CSE-MsgGUID: CL0C/l5bR/OE/4BF5Zcdlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11755141"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="11755141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 17:16:15 -0700
X-CSE-ConnectionGUID: P742GCQeT9iYTAS4HHR9ug==
X-CSE-MsgGUID: bKrk1NpyQdG5KR9DcPcvCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35763385"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2024 17:16:14 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7On4-000DOh-31;
	Thu, 16 May 2024 00:16:10 +0000
Date: Thu, 16 May 2024 08:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: reuseport_bpf_cpu.c:15: warning: "_GNU_SOURCE" redefined
Message-ID: <202405160857.9PzXyUEN-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Edward Liaw <edliaw@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: Mark Brown <broonie@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c06da67d0bd3139a97f301b4aa9c482b9d4f29e
commit: daef47b89efd0b745e8478d69a3ad724bd8b4dc6 selftests: Compile kselftest headers with -D_GNU_SOURCE
date:   7 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160857.9PzXyUEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405160857.9PzXyUEN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from hid_bpf.c:5:
>> ../kselftest_harness.h:54:15: error: expected declaration specifiers or '...' before numeric constant
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         |               ^
>> ../kselftest_harness.h:54:18: error: expected declaration specifiers or '...' before string constant
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> reuseport_bpf_cpu.c:15: warning: "_GNU_SOURCE" redefined
      15 | #define _GNU_SOURCE
         | 
   <command-line>: note: this is the location of the previous definition
--
>> reuseport_bpf_numa.c:7: warning: "_GNU_SOURCE" redefined
       7 | #define _GNU_SOURCE
         | 
   <command-line>: note: this is the location of the previous definition
--
>> reuseport_dualstack.c:14: warning: "_GNU_SOURCE" redefined
      14 | #define _GNU_SOURCE
         | 
   <command-line>: note: this is the location of the previous definition
--
>> tls.c:3: warning: "_GNU_SOURCE" redefined
       3 | #define _GNU_SOURCE
         | 
   <command-line>: note: this is the location of the previous definition
--
>> tun.c:3: warning: "_GNU_SOURCE" redefined
       3 | #define _GNU_SOURCE
         | 
   <command-line>: note: this is the location of the previous definition
--
>> tap.c:3: warning: "_GNU_SOURCE" redefined
       3 | #define _GNU_SOURCE
         | 
   <command-line>: note: this is the location of the previous definition
--
>> so_incoming_cpu.c:3: warning: "_GNU_SOURCE" redefined
       3 | #define _GNU_SOURCE
         | 
   <command-line>: note: this is the location of the previous definition
--
   socket.c: In function 'run_tests':
>> socket.c:59:25: warning: ignoring return value of 'strerror_r' declared with attribute 'warn_unused_result' [-Wunused-result]
      59 |                         strerror_r(-s->expect, err_string1, ERR_STRING_SZ);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   socket.c:60:25: warning: ignoring return value of 'strerror_r' declared with attribute 'warn_unused_result' [-Wunused-result]
      60 |                         strerror_r(errno, err_string2, ERR_STRING_SZ);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   socket.c:73:33: warning: ignoring return value of 'strerror_r' declared with attribute 'warn_unused_result' [-Wunused-result]
      73 |                                 strerror_r(errno, err_string1, ERR_STRING_SZ);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> nettest.c:7: warning: "_GNU_SOURCE" redefined
       7 | #define _GNU_SOURCE
         | 
   <command-line>: note: this is the location of the previous definition
--
>> psock_fanout.c:30: warning: "_GNU_SOURCE" redefined
      30 | #define _GNU_SOURCE             /* for sched_setaffinity */
         | 
   <command-line>: note: this is the location of the previous definition
..


vim +/_GNU_SOURCE +15 tools/testing/selftests/net/reuseport_bpf_cpu.c

4b2a6aed2115cd7 Craig Gallek 2016-02-10 @15  #define _GNU_SOURCE
4b2a6aed2115cd7 Craig Gallek 2016-02-10  16  

:::::: The code at line 15 was first introduced by commit
:::::: 4b2a6aed2115cd72faaffc92e03d6516e8113904 soreuseport: BPF selection functional test for TCP

:::::: TO: Craig Gallek <kraig@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
