Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E42744C65C
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014410; cv=none; b=IoYCOAdN57gItekwYYKVKbZZK8o45q8SkfNmUufr3g2O18T/u9IjtKNARtOu8WsyAmQlvwZyOJGddFn6K6m5wCnNJNTC9MN+N3l3Ba775WX6liNzy+ESzqzVGcUO/pozwQnwpc6SANjj/ETC50/4ht21ODtEDhlX2Wsw/gWqXyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014410; c=relaxed/simple;
	bh=JrsQxeH+Ty4AQLPNHb1QkLKMRbZzl7BM55Qzdkco2jM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FKRYStA7brOMISD8JBFDNNGpaUvN955bmfYUlpA5iTZtdy7zT1j7mfbLMxGjCi26SGLE/MYtixRsl9TeUvCG2FYvii4VBRnIFT3GZJyE+LP7akaZK3s+KvAHc22mPoZSGe/WbP1zxBUUVpj21j7o7Pmfz4F3evItoiQfO/Z6gQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0Y8NdEi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0Y8NdEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786014406; x=1817550406;
  h=date:from:to:cc:subject:message-id;
  bh=JrsQxeH+Ty4AQLPNHb1QkLKMRbZzl7BM55Qzdkco2jM=;
  b=E0Y8NdEiPtWc3DvIxuQrBpwEI86BTudEWak/Ls6hsL17BNdcU+1igdeB
   ZP+lgKUO5Y/u4jb2GwiW6za8NfsN8N78ZAlqbr8dVKzuFRwo5CZgoqQ9i
   Gqb1MgS7wU+I6OtvQmmfRnyFsUSsSx3N7LobF4lYhvoihru7rNRibCRH0
   bixdcmsZHHN6RMWaDhT95z8CwHReiJ154MalfQJOW1nykioqi6moFjh0/
   S8ivfDybyE2R7gDiaIONbqMMBjLp9xJe6vD8IxJlZX/hpbUFHCT/UJoI+
   LpgKNf2I/y8DjWcdVr3odYFa3oyKV7D38zBu7an7obUC5D7W84AluXYop
   Q==;
X-CSE-ConnectionGUID: 3++4C+dHTdKPn1P9fdvGTg==
X-CSE-MsgGUID: 18N3T4jWQ0Gr2pz4FtWa9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96956521"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="96956521"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:06:45 -0700
X-CSE-ConnectionGUID: ZD3hiPT/Qa+9nXW+S8Wdsg==
X-CSE-MsgGUID: S/E01EmDS4i3Egxaq6RJ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="300293068"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2026 04:06:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrvvt-000000004cU-37Dd;
	Thu, 06 Aug 2026 11:06:41 +0000
Date: Thu, 06 Aug 2026 13:05:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: main.c:276:31: error: passing argument 1 of 'fputc' makes
 integer from pointer without a cast
Message-ID: <202608061302.Gj3RVITR-lkp@intel.com>
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
TO: Markus Elfring <elfring@users.sourceforge.net>
CC: 0day robot <lkp@intel.com>

Hi Markus,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Markus-Elfring/tools-Use-fputc-calls-in-some-functions/20260806-165154
head:   e56bf8a92708e92480f6dc2a8fcf773661b9e616
commit: e56bf8a92708e92480f6dc2a8fcf773661b9e616 tools: Use fputc() calls in some functions
date:   2 hours ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260806/202608061302.Gj3RVITR-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061302.Gj3RVITR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608061302.Gj3RVITR-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:564: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:938: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1044: No babeltrace2 found, disables 'perf data' CTF format support, please install libbabeltrace2-dev[el]
   Makefile.config:1134: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.2.rc4.ge56bf8a92708
   cc1: warning: '-Wformat-y2k' ignored without '-Wformat' [-Wformat-y2k]
   cc1: warning: '-Wformat-security' ignored without '-Wformat' [-Wformat-security]
   main.c: In function 'fprint_hex':
>> main.c:276:31: error: passing argument 1 of 'fputc' makes integer from pointer without a cast [-Wint-conversion]
     276 |                         fputc(f, '\n');
         |                               ^
         |                               |
         |                               FILE *
   In file included from main.c:8:
   /usr/include/stdio.h:611:23: note: expected 'int' but argument is of type 'FILE *'
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                   ~~~~^~~
>> main.c:276:34: error: passing argument 2 of 'fputc' makes pointer from integer without a cast [-Wint-conversion]
     276 |                         fputc(f, '\n');
         |                                  ^~~~
         |                                  |
         |                                  int
   /usr/include/stdio.h:611:34: note: expected 'FILE *' but argument is of type 'int'
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                            ~~~~~~^~~~~~~~
   make[4]: *** [Makefile:294: tools/perf/util/bpf_skel/.tmp/bootstrap/main.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   common.c: In function 'p_err':
>> common.c:56:23: error: passing argument 1 of 'fputc' makes integer from pointer without a cast [-Wint-conversion]
      56 |                 fputc(stderr, '\n');
         |                       ^~~~~~
         |                       |
         |                       FILE *
   In file included from common.c:15:
   /usr/include/stdio.h:611:23: note: expected 'int' but argument is of type 'FILE *'
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                   ~~~~^~~
>> common.c:56:31: error: passing argument 2 of 'fputc' makes pointer from integer without a cast [-Wint-conversion]
      56 |                 fputc(stderr, '\n');
         |                               ^~~~
         |                               |
         |                               int
   /usr/include/stdio.h:611:34: note: expected 'FILE *' but argument is of type 'int'
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                            ~~~~~~^~~~~~~~
   common.c: In function 'p_info':
   common.c:70:15: error: passing argument 1 of 'fputc' makes integer from pointer without a cast [-Wint-conversion]
      70 |         fputc(stderr, '\n');
         |               ^~~~~~
         |               |
         |               FILE *
   /usr/include/stdio.h:611:23: note: expected 'int' but argument is of type 'FILE *'
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                   ~~~~^~~
   common.c:70:23: error: passing argument 2 of 'fputc' makes pointer from integer without a cast [-Wint-conversion]
      70 |         fputc(stderr, '\n');
         |                       ^~~~
         |                       |
         |                       int
   /usr/include/stdio.h:611:34: note: expected 'FILE *' but argument is of type 'int'
     611 | extern int fputc (int __c, FILE *__stream) __nonnull ((2));
         |                            ~~~~~~^~~~~~~~
   make[4]: *** [Makefile:294: tools/perf/util/bpf_skel/.tmp/bootstrap/common.o] Error 1
   make[3]: *** [bpf_skel.mak:44: tools/perf/util/bpf_skel/.tmp/bootstrap/bpftool] Error 2
   make[2]: *** [Makefile.perf:622: bpf-skel-prepare] Error 2
   make[1]: *** [Makefile.perf:281: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
