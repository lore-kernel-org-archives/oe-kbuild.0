Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C23A63E3
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 20:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616092; cv=none; b=KMqrlCYb6jLnK8OW/aLOOZyUTdBIuAdM6aflcroI1x2sgnBU8Uc8I/7ulkQgsHWskAc1zuOkfzrmB2VBb7nEdM9ZDRIN/lWLGlG/jo3nXlH0ARXhsy0qWSNghW0sEu3dZlnNuiJdF3usF/Xz6n0Ukx6/W6i89Oayyp1/XyjtcAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616092; c=relaxed/simple;
	bh=T6sepAhb5+9uWC6PE6znso7KnoyQxYxc7QkERqD/+5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PrLDpkW/+kDc98/KdCJCMog0eWxmvLtA1ixt37MfkppZzu5rC4FVT8w5xA6a2+nMtf65nxNAFbSbSCg3BfdeS3+VDKiYlbMtODYisv8yR3F+ZRbSQF5SihzuvNrkx7cUQ19hVb4lwHhwXSBVEyTeW0QJih1VKowiHb36sa35dew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8lnpNdu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8lnpNdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778616091; x=1810152091;
  h=date:from:to:cc:subject:message-id;
  bh=T6sepAhb5+9uWC6PE6znso7KnoyQxYxc7QkERqD/+5Y=;
  b=Y8lnpNdu3cJxMgqG87rYgj8EQ7x4UgQ0811QRaeSL/QStjtx2Ktn//IC
   2YHbG0gZJMZEDwsWat2XcAR7YuB3Gc6yiXena8iV4zIheABN5X6nHAJ2K
   BgpGXq7DCO1SiljHdVBiPQ8p65UrDm6UncJ2KjVg3eGqIkyTNediepu39
   ByOGu7GMu4TEvKMcL/qUZ5gbvQlMOupL6o3897fvN/ofN+TSazLF+xydp
   /l89q4XtYwc2PnI5gxgi7izF7wNTjdmKkFc72ywgnkyz82rWODCzFoTFp
   ST0Rijo59O8gt3KJOgm8/q7RnVGVffTrTwqBTeOPGf1B/kRJ3obPKLmiF
   g==;
X-CSE-ConnectionGUID: TAgbUZn0T2qM6zrcGZmk8Q==
X-CSE-MsgGUID: Olv5/2VFRkGZWR/10UfnKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79645637"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79645637"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:01:31 -0700
X-CSE-ConnectionGUID: gWt01ECmTTem5NXD4r32zA==
X-CSE-MsgGUID: JndwDiCET/SUyDw/z8TA4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="261355542"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 12 May 2026 13:01:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMtIF-000000008KT-1qRi;
	Tue, 12 May 2026 20:01:27 +0000
Date: Tue, 12 May 2026 22:00:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Makefile:23: ../liveupdate/lib/libliveupdate.mk: No such
 file or directory
Message-ID: <202605122134.oEzTYlT7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vipin Sharma <vipinsh@google.com>
CC: 0day robot <lkp@intel.com>
CC: David Matlack <dmatlack@google.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vipin-Sharma/vfio-pci-Register-a-file-handler-with-Live-Update-Orchestrator/20260512-152829
head:   ebd50d810440364055692a3ed1d967cd7149d0dc
commit: f35ed2dfb272632246d1c9b941897e618a8372e8 vfio: selftests: Build liveupdate library in VFIO selftests
date:   12 hours ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260512/202605122134.oEzTYlT7-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122134.oEzTYlT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605122134.oEzTYlT7-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: *** [../../lib.mk:225: tools/testing/selftests/drivers/net/psp_responder] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [Makefile:124: tools/testing/selftests/hid/host-tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
   make[1]: *** [../lib.mk:225: tools/testing/selftests/net/busy_poller] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/net/tun] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets specified and no makefile found.  Stop.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
>> Makefile:23: ../liveupdate/lib/libliveupdate.mk: No such file or directory
>> make[1]: *** No rule to make target '../liveupdate/lib/libliveupdate.mk'.
>> Makefile:23: Failed to remake makefile '../liveupdate/lib/libliveupdate.mk'.


vim +23 Makefile

87d599fc3955e5 Masahiro Yamada 2022-12-13  17  
121c2a137767df Masahiro Yamada 2020-05-11  18  $(if $(filter __%, $(MAKECMDGOALS)), \
121c2a137767df Masahiro Yamada 2020-05-11  19  	$(error targets prefixed with '__' are only for internal use))
121c2a137767df Masahiro Yamada 2020-05-11  20  
ba634eceb535d9 Masahiro Yamada 2017-10-04  21  # That's our default target when none is given on the command line
121c2a137767df Masahiro Yamada 2020-05-11  22  PHONY := __all
121c2a137767df Masahiro Yamada 2020-05-11 @23  __all:
ba634eceb535d9 Masahiro Yamada 2017-10-04  24  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
