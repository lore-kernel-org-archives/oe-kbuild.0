Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878243E9C3
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922483; cv=none; b=sbnrrBj9q2Dx9zPHrA7OL8tUxWV/OxF2we5yiWXKuce0ufjzdy6Y/2cDd64ngFZ16x6kFez/y+uAOyWYWd3HHvhZiCOeswv4JIgH9HjqiZOqaprEuY0hFNdFEMS67ZudpHx48nOUIgnTSQPFxn8az/ov7lguLqZJyZUZ+1skQeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922483; c=relaxed/simple;
	bh=DFXTmGeVPo6zLuzoqOBA+RK/oEU7JPduxHBl6fPW/30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cCiJIDR7qBAjNYAyk7X0UQN8xcYusepxtMlZHhYcDPm7ViGi0Dy1/1V6eCv9lbijPLJxp2XU1RyBnElyPR8hTF0VwSq/MIg2xNwXZBL3Pdo0+PnVIlULpkIfV2iCE2iCFUgSiRaMLIro4a367LCEkt2vxCritboQXANJkJnc8Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgzasJpe; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgzasJpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768922483; x=1800458483;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DFXTmGeVPo6zLuzoqOBA+RK/oEU7JPduxHBl6fPW/30=;
  b=dgzasJpeATAe+IGG+BxS292aV8Q4blPyTaGzxqvOW+Pd4tLmtPQ24X8k
   +PJqTTF5xoX1qDd61PMlxyKYFbAoe/4dNtMP4fdhNE9JIzTLqkX327Edz
   EzbIZZLyWiTbVIU4JM7IcZSmj/lySO5k+l9QHvPSrEeT3A+CgEKPjDzEa
   GpGrvKY6Y5aATs9JhI0eqT3USWsbRRBYTEMIs6R5t7Dccfr1GP6PaGK9r
   48L8ZlVMvPqD5scQBGtH9iC8PGeAdf1SeBOl+NSZJZHhsJjjHD65pnOCq
   U10GxzHKED0MROydymUMk8420TBalj4GOBKOtVbO+tud+YYwWLZ28mg6t
   Q==;
X-CSE-ConnectionGUID: pXPR4+fuToO+iHX4VW3uCA==
X-CSE-MsgGUID: SQrq/rBeSoiE69+h4H2cyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70188037"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70188037"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 07:21:22 -0800
X-CSE-ConnectionGUID: 5JmmDUyfTS2EOl4StovJ0w==
X-CSE-MsgGUID: L+pw/mr7To6MvxR1T0HBaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210291379"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2026 07:21:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viDXi-00000000P7J-0q39;
	Tue, 20 Jan 2026 15:21:18 +0000
Date: Tue, 20 Jan 2026 23:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:dd-shrink 25/42] lib/test_dynamic_debug_submod.c:19:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202601202332.yKZmq4Dj-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: lib/test_=
dynamic_debug_submod.c:19:1: sparse: sparse: bad integer constant expressio=
n"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-shrink
head:   9287bee2d6ca94d7ba405ab042b352292a69ca3e
commit: 06b645fe81beda6df6a2c419c5bde9a290d3a542 [25/42] dyndbg-API: promot=
e DYNAMIC_DEBUG_CLASSMAP_PARAM to API
:::::: branch date: 19 hours ago
:::::: commit date: 20 hours ago
config: sh-randconfig-r133-20260120 (https://download.01.org/0day-ci/archiv=
e/20260120/202601202332.yKZmq4Dj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260120/202601202332.yKZmq4Dj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601202332.yKZmq4Dj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/test_dynamic_debug_submod.c: note: in included file:
   lib/test_dynamic_debug.c:213:1: sparse: sparse: bad integer constant exp=
ression
   lib/test_dynamic_debug.c:213:1: sparse: sparse: static assertion failed:=
 "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/test_dynamic_debug.c:214:1: sparse: sparse: bad integer constant exp=
ression
   lib/test_dynamic_debug.c:214:1: sparse: sparse: static assertion failed:=
 "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/test_dynamic_debug.c:215:1: sparse: sparse: bad integer constant exp=
ression
   lib/test_dynamic_debug.c:215:1: sparse: sparse: static assertion failed:=
 "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/test_dynamic_debug.c:216:1: sparse: sparse: bad integer constant exp=
ression
   lib/test_dynamic_debug.c:216:1: sparse: sparse: static assertion failed:=
 "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/test_dynamic_debug.c:216:1: sparse: sparse: bad integer constant exp=
ression
   lib/test_dynamic_debug.c:216:1: sparse: sparse: static assertion failed:=
 "MODULE_INFO(license, ...) contains embedded NUL byte"
>> lib/test_dynamic_debug_submod.c:19:1: sparse: sparse: bad integer consta=
nt expression
   lib/test_dynamic_debug_submod.c:19:1: sparse: sparse: static assertion f=
ailed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/test_dynamic_debug_submod.c:20:1: sparse: sparse: bad integer consta=
nt expression
   lib/test_dynamic_debug_submod.c:20:1: sparse: sparse: static assertion f=
ailed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/test_dynamic_debug_submod.c:21:1: sparse: sparse: bad integer consta=
nt expression
   lib/test_dynamic_debug_submod.c:21:1: sparse: sparse: static assertion f=
ailed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/test_dynamic_debug_submod.c:21:1: sparse: sparse: bad integer consta=
nt expression
   lib/test_dynamic_debug_submod.c:21:1: sparse: sparse: static assertion f=
ailed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +19 lib/test_dynamic_debug_submod.c

06b645fe81beda Jim Cromie 2025-11-18  18 =20
06b645fe81beda Jim Cromie 2025-11-18 @19  MODULE_DESCRIPTION("test/demonstr=
ate dynamic-debug subsystem support");

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
