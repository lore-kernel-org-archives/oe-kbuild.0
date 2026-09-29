Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DFE36A363
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Sep 2026 06:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662721; cv=none; b=efDxuY9K5ZvamOfu1UCVdUsELzZbY4IrQIcR43apVfhGjzv7aNXxcPL6HxrpqEWi/0cbTDsMM/AhCm44YtpB6cSq+3JkaP+iVIOjqcu0INolFocbEB1qmcGvN5C79zBTvt4l9wSBCxWqw1aoMUtMoGuISRtqMLRwKgHAqYcOgzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662721; c=relaxed/simple;
	bh=GevcYkW3Q7BLh8FBsrTWGzxdyrYhYjz/frPbzGxpf0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mA8Y+EsW+Ri1B659lTWsnJWPrC6GEl0F+cB0u9oILjXc0ykKXINCRPVGBJteVL2WEJi8WzyMyIKgT+BFe8lLhtk4PtUvVj6CmsV0lS0Ai0nNK1K7xj2xgY5mVSaJW8J0DPynjMEgv0CLn+2UOCbm7apenlAUBVX/WqvV2HCJLrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kte89qOB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kte89qOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790662719; x=1822198719;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GevcYkW3Q7BLh8FBsrTWGzxdyrYhYjz/frPbzGxpf0w=;
  b=Kte89qOB4Xz0jlDNQzVFnDhCP5gM6QJb7J5KKJUpv/FKAuiUNbOZA8wB
   0ICnUKS+lOBbHMLzQMzjMwynMME+k1N+WmWtuzET2rF/nVM5oawhnTyLH
   JM5qeeLwwoD4U7ObPzaIU4yA4OuUQ9p/6rnMFcrV1GgsVMmFSaUynnqpx
   uFrQryaDLPa37ArClpMAcliTcr8/9qtTgqcRIM/yLwFdfs6R+lYSKq+Ep
   sZ6T3pRVRYsqVh3MxN3KwiKL/0FzrY4zdyiMeBRp2k0OF9xhkEGEQfnCL
   Ayb1OjormzZWdeL5SGj4QyzUdT6BWfidSvQH3oZb4fXtJqUoZLdj0+40a
   A==;
X-CSE-ConnectionGUID: MRjH4Qz0QjWsxirWSjrRdA==
X-CSE-MsgGUID: GJLUbaMjSuKd2McJOld4tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="94253954"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="94253954"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 23:18:38 -0700
X-CSE-ConnectionGUID: J94qp/q9S5e0hkBJRaumQw==
X-CSE-MsgGUID: QH+mBPAWS/6UbK2YM2kbog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="273405559"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2026 23:18:37 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBRAf-000000001KB-1r2C;
	Tue, 29 Sep 2026 06:18:33 +0000
Date: Tue, 29 Sep 2026 08:18:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18-kminext 1/1]
 futex_numa_mpol.c:134:13: warning: 'test_futex_mpol' defined but not used
Message-ID: <202609290831.fYMDdP3U-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Andr=C3=A9,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-kmine=
xt
head:   54d0fea3f15fbe40f4f28989d16061afc3259b1f
commit: d35ca2f642726a2c8a85c5b864fd05f59f3965af [1/1] selftests/futex: Ref=
actor futex_numa_mpol with kselftest_harness.h
:::::: branch date: 4 days ago
:::::: commit date: 1 year ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
929/202609290831.fYMDdP3U-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260929/202609290831.fYMDdP3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: d35ca2f64272 ("selftests/futex: Refactor futex_numa_mpol with ksel=
ftest_harness.h")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609290831.fYMDdP3U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> futex_numa_mpol.c:134:13: warning: 'test_futex_mpol' defined but not use=
d [-Wunused-function]
     134 | static void test_futex_mpol(void *futex_ptr, int err_value)
         |             ^~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
