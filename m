Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EC02773CC
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668921; cv=none; b=tDbCNpKr73mOL6lGm+e6XlDi53zbJbhMmYuBPZYiXu0RM/q+5nYxPHIm8syFbaDzLbNUjKCx24yeXVcmbWqJ+5zODWukOJXaCtIOjG2WaVQhrUi0z2e+WvDcnW3IUTqfsmLQeOfUd6SWjl6Xo7sbcToqL/KvHb3luKP/Hl7tzj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668921; c=relaxed/simple;
	bh=lTTk7fw/Xf1PEir7Cm6YgTBKyaO8Rpgg4C5HaE+aY5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eiaES9K4NfkmJELEep/6R7sSwIAVvtCprVHpbS0FrH2fnuPMicV4VFNif5H8bhwGX6DiqRPjI0sRekw+6PIEWoSPeuy0I6Rpr4isYPVYFl+6oOQ4q/8BXQem9ofAVU4v3OrWH188+4+pqeJPcAyGCg1N3/VaiC0M7zvXFgY7Qd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqxemYeu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqxemYeu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780668919; x=1812204919;
  h=date:from:to:cc:subject:message-id;
  bh=lTTk7fw/Xf1PEir7Cm6YgTBKyaO8Rpgg4C5HaE+aY5Q=;
  b=SqxemYeuSpuJwNr5GrLf8RRVFlASVJEtRbcfC3XAGcIsxrbV0Xv1yA0L
   S/xXZ/SelsVR1SRCgqo9Kg1mI9T46LQkol0JC8o7o37DMBE0d0v0ZQbbq
   zraZqKfwfiHBbWog955vC6IuPqnmMWjzi+ia1FSeIqf6jQXTWHCvV7Hk2
   ykBJYo3terlHlEjep3iEGg4dG3HzJ97/kvQciJQXqJ/LpSTeexrR9Loen
   0LI06JWEd2L56eUBudX5NnHaa6/hAqXqRi3E42cOGHOGYg0kbrmw0U+PK
   QashATzaOWO+38K7DxvGkONf9HZbR3HBN8ZVJGSmoXX7FiJR9gHPqhzgh
   g==;
X-CSE-ConnectionGUID: zNeznl8xSJaUAay+dEzLqQ==
X-CSE-MsgGUID: 6FLvc4XxR9KMszYAPe3llQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="69034660"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="69034660"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:15:17 -0700
X-CSE-ConnectionGUID: uf1tqYJ4QhCm3dETrdNGaA==
X-CSE-MsgGUID: j4OSfZl3RX6miWpOVMXiXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="244918037"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Jun 2026 07:15:17 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVKM-000000002aX-1Mik;
	Fri, 05 Jun 2026 14:15:14 +0000
Date: Fri, 05 Jun 2026 16:14:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 8/8]
 progs/hid_bpf_helpers.h:116:12: error: conflicting types for
 'bpf_wq_set_callback_impl'
Message-ID: <202606051654.BUSJHbDz-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   d7c970e477a170f747392effd61753561f1e7251
commit: 5714d24869a65b639f8192eb15bc14193da86e36 [8/8] ANDROID: dma-buf: Follow function parameter type change
:::::: branch date: 10 hours ago
:::::: commit date: 1 year, 10 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260605/202606051654.BUSJHbDz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051654.BUSJHbDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606051654.BUSJHbDz-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD d7c970e477a170f747392effd61753561f1e7251 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
>> progs/hid_bpf_helpers.h:116:12: error: conflicting types for 'bpf_wq_set_callback_impl'
     116 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq,
         |            ^
   tools/testing/selftests/hid/tools/include/vmlinux.h:110074:12: note: previous declaration is here
    110074 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq, int (*callback_fn)(void *, int *, void *), unsigned int flags, void *aux__ign) __weak __ksym;
           |            ^
   progs/hid.c:490:30: error: incompatible function pointer types passing 'int (void *, int *, struct bpf_wq *)' to parameter of type 'int (*)(void *, int *, void *)' [-Wincompatible-function-pointer-types]
     490 |         if (bpf_wq_set_callback(wq, wq_cb_sleepable, 0))
         |                                     ^~~~~~~~~~~~~~~
   tools/testing/selftests/hid/tools/include/vmlinux.h:110074:62: note: passing argument to parameter 'callback_fn' here
    110074 | extern int bpf_wq_set_callback_impl(struct bpf_wq *wq, int (*callback_fn)(void *, int *, void *), unsigned int flags, void *aux__ign) __weak __ksym;
           |                                                              ^
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:56:9: note: forward declaration of 'struct hid_device'
      56 |         struct hid_device *hid;
         |                ^
   3 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
