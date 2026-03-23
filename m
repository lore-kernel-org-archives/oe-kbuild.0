Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7649E5464D
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 01:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774227901; cv=none; b=I4ULhZq3u3TiivOY5+0sJhkZpKusaOTq0b6x0TAGNsfZ647POMLr0ljYbHtz0fI9osZiyUXLxXOJAUIsntlq9PvFUTiK2tM4U27rqT+33UtVbG6j3LUwOPnYULzI6Yqw3IOOJQwgMdhYFrVYVKN9USGCthJqXMc40FHg+4ADSMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774227901; c=relaxed/simple;
	bh=5N3hiQLh6pRjC5Ud6mSQQvM94o3e8h9/1PdHxceWoaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vl0O7pI4gwwocG/6J0X1hAhCNYdpnyntett65YYOX0JkWXOQf3dsNLQfPK/kROqUd7aS6txZPErZT72TgbV1YgUMHUXsOD4MPc6DA3ZqW8y8KDzJ6UDlKhceLkIwVon19n2TSesFbSl7P+OlFWr8jeNQ9xKAfqNzcriGjWjk04s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUZDaidq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUZDaidq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774227899; x=1805763899;
  h=date:from:to:cc:subject:message-id;
  bh=5N3hiQLh6pRjC5Ud6mSQQvM94o3e8h9/1PdHxceWoaQ=;
  b=DUZDaidqVBXqRH7rdmIwucRPfXAE3r2Pjc6OUCwO8/97Jzqne3WhbL2X
   /vxV+v+NtN+6+uKA37IrGujt2IwpOd5nCWew5JBHNVujPdMePrsUSDYam
   8qsiTVU/J/Vzs32oUiBHuDYKv3u7/089z4kabMUoSa0pQmaZrxiyo+fwv
   Ye0tlKpeHiYmaeirzTGyuejyjMPwo7qpnHGdD4KGTLBLwjim/sDQzRj1i
   mQh+X3Ozpsa/KStpZ2wnyvmCHcVwOPp/Ygvtwp4IBRblRd408k6HKDMx2
   L1o2YFJxmBTV8MoaoG5hTHjIx3RlBq2MhE9oaToryQA2gPF4rIXqfFEMt
   w==;
X-CSE-ConnectionGUID: 7hByp9p0QX6IEc/AEuB+7w==
X-CSE-MsgGUID: XNY2Xav/QnC9N+/unAsqFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75108629"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75108629"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 18:04:59 -0700
X-CSE-ConnectionGUID: chJH9jM0SIq/IbbPdQL+nA==
X-CSE-MsgGUID: U9vymze4RAqaOJ9gkQblFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="254345700"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Mar 2026 18:04:58 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Tix-000000006V7-439y;
	Mon, 23 Mar 2026 01:04:55 +0000
Date: Mon, 23 Mar 2026 02:04:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dsahern:perf-trace-ioctl-wip 5/7] undefined reference to
 `syscall_arg__ioctl_cmd_decode_init'
Message-ID: <202603230200.4xhBcjpW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Ahern <dsahern@kernel.org>

tree:   https://github.com/dsahern/linux perf-trace-ioctl-wip
head:   3e523442f5974b9f0f74d6f2ce26701950696817
commit: 647ca7f9d1a391f033597ff7e34d230019c33421 [5/7] perf-trace: add support to read ioctl mapping files
:::::: branch date: 57 minutes ago
:::::: commit date: 57 minutes ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260323/202603230200.4xhBcjpW-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230200.4xhBcjpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603230200.4xhBcjpW-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.0.rc4.g647ca7f9d1a3
   /usr/lib/gcc-cross/s390x-linux-gnu/14/../../../../s390x-linux-gnu/bin/ld: perf-in.o: in function `trace__fprintf_thread_summary.isra.0':
   builtin-trace.c:(.text+0x86ffc): undefined reference to `syscall_arg__ioctl_cmd_lookup'
   /usr/lib/gcc-cross/s390x-linux-gnu/14/../../../../s390x-linux-gnu/bin/ld: perf-in.o: in function `cmd_trace':
>> (.text+0x8b9a2): undefined reference to `syscall_arg__ioctl_cmd_decode_init'
>> /usr/lib/gcc-cross/s390x-linux-gnu/14/../../../../s390x-linux-gnu/bin/ld: (.text+0x8bab2): undefined reference to `syscall_arg__ioctl_cmd_decode_fini'
   collect2: error: ld returned 1 exit status
   make[2]: *** [Makefile.perf:803: perf] Error 1
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
