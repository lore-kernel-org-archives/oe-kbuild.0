Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1964E364EA4
	for <oe-kbuild@lists.linux.dev>; Sun, 31 May 2026 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780226045; cv=none; b=jaw+W0f0cdmcWXQSpOBrv2u8SpO9NHmxfHfkhmwCazYHycPqLTER6aDXVsDPp7NflpXQohCVdeabDHB3etjuRVj45EWueFevHK1SC/8icS495doxapU3ZNHPSy+ax5YjZ/OK/m78l59LPmwBTpWUteilJNDUo8t4rU/LnnfXPC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780226045; c=relaxed/simple;
	bh=S1JlkXTFSDVLAKP0bPn4BHTC94xtu1baZvuKsEl6sdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XTr/nLh89MKzANRePtQvIiZfkUkv0ac4TS1S00PZk5n/sgWX1CYQxHE/MHEnITa1Ej+sSvjC86aMhjkgb9P2CS0TORNPXDXmC/Pm58agfJznMVz3xfqPdOJD69MZMTEpp9IUmdc7SoeTmse6mIDIJoGY3KOQoNUSykEpyX5b8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6vJ/7xU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6vJ/7xU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780226043; x=1811762043;
  h=date:from:to:cc:subject:message-id;
  bh=S1JlkXTFSDVLAKP0bPn4BHTC94xtu1baZvuKsEl6sdw=;
  b=L6vJ/7xUzgBtqZSu6oNiG0mgIZzalJAUDYHpG/FQlHWLO71Z4usPhhko
   y3piGAASlszVvbyfXj0glyQ6k5Dpcvi5bEYqyKVXGs/AFSdkOFMupHZIy
   /+Du5r1XeADElF6j0lU6et5dEbS7rpK12eeiCn9GGL1JHrOsjRSTjsY26
   GV09QB5amhTuog619CN8GuePtDBLBYP2Mb5wGb1e7m5yPpQAq52hq9GHZ
   /hYvorZbCVah6FbNU/rXBQLEID71M9BTh+eGSFjs4fTJbL2EWVBJ1iJNJ
   H58trW3r9eg/0Q+jjcKVWs5NDAhUm2WuYIjA73oZQFPmunTud7plCJ3Ld
   Q==;
X-CSE-ConnectionGUID: KH0QrUsxS5Gmb1/RS3LTTw==
X-CSE-MsgGUID: JL7tcRXARRG5jx3ZJfFBsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="91692274"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="91692274"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 04:14:03 -0700
X-CSE-ConnectionGUID: QQUxRYbASIGr3vOeid/3Wg==
X-CSE-MsgGUID: yTQtVnaBQgG3G7tNs5UW3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="236952234"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 31 May 2026 04:14:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTe7D-000000001Mv-3la6;
	Sun, 31 May 2026 11:13:59 +0000
Date: Sun, 31 May 2026 13:13:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: run-command.c:259:25: error: 'waiting' undeclared; did you
 mean 'waitid'?
Message-ID: <202605311329.zYSRhguj-lkp@intel.com>
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
TO: Ian Rogers <irogers@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-jevents-py-Make-generated-C-code-more-kernel-style/20260531-163012
head:   69f2cb88abe78c59ec6c963e1833369a0f080c9d
commit: 8cea940c10badef9d9b9752fcdb00e04648d27bc tools subcmd: Robust fallback and existence checks for process reaping
date:   3 hours ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260531/202605311329.zYSRhguj-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260531/202605311329.zYSRhguj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605311329.zYSRhguj-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:566: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:940: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1136: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc5.g8cea940c10ba
   run-command.c: In function 'check_if_command_finished':
>> run-command.c:259:25: error: 'waiting' undeclared (first use in this function); did you mean 'waitid'?
     259 |                         waiting = waitpid(cmd->pid, &status, WNOHANG);
         |                         ^~~~~~~
         |                         waitid
   run-command.c:259:25: note: each undeclared identifier is reported only once for each function it appears in
>> run-command.c:259:54: error: 'status' undeclared (first use in this function); did you mean 'statx'?
     259 |                         waiting = waitpid(cmd->pid, &status, WNOHANG);
         |                                                      ^~~~~~
         |                                                      statx
   make[4]: *** [tools/build/Makefile.build:95: tools/perf/libsubcmd/run-command.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile:78: tools/perf/libsubcmd/libsubcmd-in.o] Error 2
   make[2]: *** [Makefile.perf:727: tools/perf/libsubcmd/libsubcmd.a] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:288: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
