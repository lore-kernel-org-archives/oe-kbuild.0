Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5D0428475
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 22:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290443; cv=none; b=ePCimnhmkluCXeDqr0z9kKGH0zFxlMRaNwYz07APtnPNU455oIih760zieqBSLx9KZ9jSzhrjDMnBe7LMROQLCSqZOKsCiy7EuaKbvGvWWH0edDM9vEKJoj3Uqtm+Mo7pa4DJLlFeRubXwaJdj0J8Xndd1bCbO/SQww1OgelBf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290443; c=relaxed/simple;
	bh=C68nBKtuMX6NCH1C9H+1vvTK/oKmbmwqq5HPfHpAAIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r8Vy7Q8EjrktCkqqW1EQkHqI8spaM0yRR9hjncZEfCOvBzhYb7aeMEntR3i0tlaRR6Q2dre/5U6P2BcvUx9JNcVeBOPObAN4h6HkZmfc9rHRsi7P/t5r6i8PbPQOsjSbaKFLZATwHhg0Do17ZT64ZwRkHw++SAs5xrcfzy8sZTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKmrxrBr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKmrxrBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790290440; x=1821826440;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C68nBKtuMX6NCH1C9H+1vvTK/oKmbmwqq5HPfHpAAIM=;
  b=gKmrxrBrU7kdQ/hsDoSoju+Q0ezMgPLU528qdZ9GavTNubkwiPuqIfxl
   +2n3lWyLovuZEq+OGSrNYzi2qswAyGGD6knbKsJCLXdn4JbMGVpY6lbDt
   qJCg1DTFmzULR5Nkk8iw9cIZ4D/HDcRK2b66EUjMeQ5g6TWfVE13miqRu
   Afb26akjsYznR2uxun5CRVKS874OqAZ3ixPZRlF5k6auTUyeuo5W5bifL
   YTYcN0qS9MVzs+GIBsA9caGPFnRrd+I9a+qsxerfumoFa6LuLjVoRZ/zp
   6laNqND+8AMfYU+ASHaH7ipDfJc5sswAan2pFfwfod3+hnt4L09nzI8Qs
   w==;
X-CSE-ConnectionGUID: ZNsDIIcSRm28wX8jE7k5/w==
X-CSE-MsgGUID: Z6WOs2dbTaWtx+sybc15HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="112863610"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="112863610"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 15:53:56 -0700
X-CSE-ConnectionGUID: dCaV4fjuRjGeR0taIrMUDw==
X-CSE-MsgGUID: ZrFVS85/QumDSwXohMRcAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277552749"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2026 15:53:55 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9sK9-000000000T0-15Jl;
	Thu, 24 Sep 2026 22:53:53 +0000
Date: Fri, 25 Sep 2026 00:52:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nolibc:for-next 12/14]
 ./../../../../include/nolibc/types.h:122:39: warning: 'status' may be used
 uninitialized
Message-ID: <202609250003.hvssJlRZ-lkp@intel.com>
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
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning =
on old compiler"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Danish Khateeb <danishkhateeb03@gmail.com>
CC: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc=
.git for-next
head:   6f114ae7b6006ca7cf72e3e3348d263bbfec4525
commit: 368fae47c6cae28a312c5dc86e5bdb8f9369fd26 [12/14] tools/nolibc: fix =
WIFSIGNALED() for status 0
:::::: branch date: 3 hours ago
:::::: commit date: 14 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0925/202609250003.hvssJlRZ-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260925/202609250003.hvssJlRZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609250003.hvssJlRZ-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from ./../../../../include/nolibc/nolibc.h:97,
                    from <command-line>:
   vstate_exec_nolibc.c: In function 'main':
>> ./../../../../include/nolibc/types.h:122:39: warning: 'status' may be us=
ed uninitialized [-Wmaybe-uninitialized]
     122 | #define WIFSIGNALED(status) ((status) - 1U < 0xff)
         |                              ~~~~~~~~~^~~~
   vstate_exec_nolibc.c:78:13: note: in expansion of macro 'WIFSIGNALED'
      78 |         if (WIFSIGNALED(status)) {
         |             ^~~~~~~~~~~
   vstate_exec_nolibc.c:9:22: note: 'status' was declared here
       9 |         int rc, pid, status, test_inherit =3D 0, xtheadvector =
=3D 0;
         |                      ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
