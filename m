Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD103A8F7
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 02:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768184008; cv=none; b=OpPLt/O7dBTPtvCOB99D9T1B9eWm2IcLMjnLn6OU8/2vHMd/UhIzcWdO65XSWkJ2ZkImJdPvMDcWb4MNbsxdGTotK23aa7tXA/V3U4yQFkF+6Mj/n8r8N+R6aEq15TEbz/gONioIXj9EGzhVf1D7CfUg1+9ehvoe6oMJ4fnU7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768184008; c=relaxed/simple;
	bh=SsB+IuiB3mOS+4dLAJJiWQXQ0IHwzK8AkTVj68SZkQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AGSlMqtYeiqBe/A4LCrOW2JAeHRThPe0z9HU2LdJhQCoFbo7mi3O7PNIfR3gdixALvNjKRyC+lVVA2iHEdGKHjj2lZ7khYATiMrNe181iUU6iZvBcB44wtkFCQB5NpgaoWGnbDAF2x3E00RIOl/i/elPQ/2PEN9Q7ZCJvd1h+R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVqsAL7X; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVqsAL7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768184006; x=1799720006;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SsB+IuiB3mOS+4dLAJJiWQXQ0IHwzK8AkTVj68SZkQk=;
  b=OVqsAL7X+XKilo7kz2A0g6ydRgF1b/Rs0IcdXrGPcBbfEqYOFnJ4bZ0u
   EP1y97687CNR/Ddhtftg8Khej0RvLMOXYO9Z8XyRVob7tMroV3H4k8Za+
   7/pe7g/EQmwGS4PV116NbCg41mWINNRx48w6EA6jgVBA6MDNtfjpxyiGc
   T4JA9eXDmubnjyhm2EUsEYLAkkOiEcoRNTEXCJzXWJGmbbrTHUw2rUhZt
   BeVbecgihUOZUqCmQNIMBHO3XJh9JXbwzE8w1Qsp60KFr6fQ57S3syPg8
   QyT36QHLAfst+Mzd3TWUGHzXNO4YYeyed9y7Gf/vPLHwpaVnZudjewYee
   Q==;
X-CSE-ConnectionGUID: IyDh+fTfQl2JlBh/yoMHuw==
X-CSE-MsgGUID: OZvW67KVTkGSgarieLHcDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69508704"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69508704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 18:13:25 -0800
X-CSE-ConnectionGUID: 7Ss0qhQcTQmghldeYhGSIA==
X-CSE-MsgGUID: RnykjM52Qtay0X/SmWvOJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="241502006"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2026 18:13:24 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf7Qo-000000000cb-1Nye;
	Mon, 12 Jan 2026 02:13:22 +0000
Date: Mon, 12 Jan 2026 03:13:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nolibc:for-next 22/25] nolibc-test.c:12:10: fatal error:
 stdio.h: No such file or directory
Message-ID: <202601120334.gadyryQ9-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc=
.git for-next
head:   a5f00be9b3b07d92c6689997403851a32e1874cc
commit: 6fe8360b16acbfb50c703f52568cad46759be2ed [22/25] selftests/nolibc: =
also test libc-test through regular selftest framework
:::::: branch date: 14 hours ago
:::::: commit date: 16 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/=
20260112/202601120334.gadyryQ9-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260112/202601120334.gadyryQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120334.gadyryQ9-lkp@intel.com/

Note: the nolibc/for-next HEAD a5f00be9b3b07d92c6689997403851a32e1874cc bui=
lds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> nolibc-test.c:12:10: fatal error: stdio.h: No such file or directory
      12 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
>> nolibc-test-linkage.c:5:10: fatal error: errno.h: No such file or direct=
ory
       5 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
