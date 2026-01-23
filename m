Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E08E2EF64F
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 02:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769137082; cv=none; b=SCik1Zw4UxRTTdG4OQUT9TLdq8lMVetOJm19SXIkv8qy7AdnLBp5Ex9dJcQZ1PQ+ZQ/O6EtXhQ3w9UJX8jey/11JmWOBfx29OaUtRF/Py0zPEUidWXMWOAvFZcmvv0VaFRRKevNKP/9568Nb3n5hMwPyZmp3Gz48241wnO7pv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769137082; c=relaxed/simple;
	bh=O9Q9ipan/wUhzjnZMOdhX000fLWPlSqiC7QJXIwSi48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CrZfc/57DpanU0T16pCdA6h16nswXQLdkC6l0s5f+KPl2ilHkRHpPh/+dajRZKFYAplGC8MJ0ScyRen/bnJSXOQIuq5hruOlF1u+nXLIr1GpQEqQCRCizWgd0sFT+ninsEQ5X8Ws5IYhpqSNBb91q9BoxDDgg4Miofsli9VNHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfZAR1yj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfZAR1yj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769137068; x=1800673068;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=O9Q9ipan/wUhzjnZMOdhX000fLWPlSqiC7QJXIwSi48=;
  b=bfZAR1yjjrUCZYTlbi0tL6gvItX/pkqawNEqWSBdvyxCMxB5W5RYuc9u
   Rpih8ZpxOSjvJ2iFnYiSL8OeI4Lcf/8BACmPg0D4l3PpOzGiN2vAVz0/c
   QDjMU4q1SfIMmPd2187ghszCRZt3cxJx97RD/FlPBj1Du9UjztSH3e+t6
   jZTTwxSLwxt7BBC/4Rl2dzVuR476DXRAR4mRL6P6LW5zC9KKTnQ6gavc5
   yvyj8OMLgeiysGR34GgGdMyKmEZvg5B0erF0PwB1tGMgFIfek74B8sF3F
   L20dc2M/h8BWF+e6Gr1Y7BF0Fk856+Vx06BwwkupqPrYby3J7uwZHTb68
   w==;
X-CSE-ConnectionGUID: csZ0BfAcQzmWHLsG3rZcrg==
X-CSE-MsgGUID: 4sapSjdjTDOKJUJ40cFVfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70440922"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70440922"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:57:41 -0800
X-CSE-ConnectionGUID: 7KXY6NwoT/OwkSNCUz+jUg==
X-CSE-MsgGUID: AkyQqTATSLmsKNeEy/r0RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211363626"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2026 18:57:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj7Mg-000000000dF-1siY;
	Fri, 23 Jan 2026 02:57:38 +0000
Date: Fri, 23 Jan 2026 03:57:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mic:next 10/19] tsync_test.c:9:10: fatal error: pthread.h:
 No such file or directory
Message-ID: <202601230353.IxElMkMR-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "G=C3=BCnther Noack" <gnoack@google.com>
CC: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   28bb107b9761b1a53148190ee3f9bbd20d63344d
commit: a13f06f2e9b6ec08f94ed802accd5397751952ec [10/19] selftests/landlock=
: Add LANDLOCK_RESTRICT_SELF_TSYNC tests
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/2026=
0123/202601230353.IxElMkMR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260123/202601230353.IxElMkMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601230353.IxElMkMR-lkp@intel.com/

Note: the mic/next HEAD 28bb107b9761b1a53148190ee3f9bbd20d63344d builds fin=
e.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> tsync_test.c:9:10: fatal error: pthread.h: No such file or directory
       9 | #include <pthread.h>
         |          ^~~~~~~~~~~
   compilation terminated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
