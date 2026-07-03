Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D273264EA
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 19:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106423; cv=none; b=NY1O2FbR2xxOr8ilLi8G312A0l5pwTyzdO8J7hcIcsMwAJIPalBx6W5JAnZVob9nUV+v/Ou3F8prQHTfgxaEvt+AttAYdBXcwqoP8WlSqnt8m2eJZGoLdWebysgghkTWHjBolv0WgBf2Ir14eu+Sl9jZiV442Exe3pXzesmQc/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106423; c=relaxed/simple;
	bh=cDWByK13BAToY+ROI+qgc4a74fywNQPRQXAyDgInvrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LSAyS5XR6GeAXE1qCrMlZBBpNCfsfLgxwyk/GjASkCfaA9al5Yla/Z2ZwWeLzRYL8HMaOzMk+9zTeYcVlOMzBzWojahjeI7fUN0gOdwQtDhLpGK/UGN29RuBq71tlTCq9huypCNMn11uSlh0gTWWC7ZDKgYcuS/bCCAGrDN9mos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+L0JsL2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+L0JsL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783106421; x=1814642421;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cDWByK13BAToY+ROI+qgc4a74fywNQPRQXAyDgInvrM=;
  b=B+L0JsL2SAjOS59dzvJ+JBO12ElosP1uHhj5o+YcbrqZKB4G+q3Qsiv3
   R1N7RaKVMwGV1i515x0tymrSPPFBm5OFAqoRPXeTJrCv7qBZmXc60ng6J
   loPghOt4eXbEiYNs+2NCZJbcqxDcrpN4oxiGUJrYwUJwBYXxf9D1TIMGb
   orrv2AdkB8pu1v7rTH33Jih7/UTueqFXwgmkFRsFSQPUjEEprAs8Ig/M5
   ZXXOehISeCNn7Qj6BWF1rb1Ad7yGlWNg5QL/8h0lpcem6Di0uyxyQPh3h
   zu7CoWWG4iL++sw4115AFor8tJeKgFn55Eu2+8WpcvjiWlW+3vqJ5x6Nq
   g==;
X-CSE-ConnectionGUID: yWRseexPTpiNsPNACF7xPQ==
X-CSE-MsgGUID: kszE+qysQseyqe3PC0AScg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87539164"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="87539164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 12:20:20 -0700
X-CSE-ConnectionGUID: I+qE6ruaQsWaYRyhC8mfRQ==
X-CSE-MsgGUID: uGmI+F1ST2mz0Fhlxkac3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="252705377"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Jul 2026 12:20:20 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfjQv-000000001ZJ-33BJ;
	Fri, 03 Jul 2026 19:20:17 +0000
Date: Fri, 03 Jul 2026 21:19:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-absolute-reloc 30/44] /bin/sh: 1:
 bindgen: not found
Message-ID: <202607032159.kjGEQUCt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-absolute-reloc
head:   51bae9e2089ad8c330686d236304af8544025aa7
commit: d35f452115bea8d5ce495e37672d184b9c5e1290 [30/44] prepare
:::::: branch date: 5 hours ago
:::::: commit date: 6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260703/2026=
07032159.kjGEQUCt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260703/202607032159.kjGEQUCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607032159.kjGEQUCt-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0=
-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5680: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5909: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_b=
uild
     from /zdci/src/kernel-tests/lib/kbuild.sh:6419: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
>> /bin/sh: 1: bindgen: not found
   make[3]: *** [lib/vdso/check/Makefile:17: lib/vdso/check/bindings.rs] Er=
ror 127
   make[3]: Target 'vdsocheck' not remade because of errors.
   make[2]: *** [Makefile:1549: vdsocheck] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
