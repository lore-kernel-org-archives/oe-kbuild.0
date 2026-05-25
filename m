Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6373125C80E
	for <oe-kbuild@lists.linux.dev>; Mon, 25 May 2026 05:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779685579; cv=none; b=poyGEfgzb3WMHuUR9qAFIFF1pMUlrYr+ioX/cpqTGMAuXPbFRMoblAN2HikRnAkgE1lNhXiDzfII1PCjC+tF9YGkBYDBGFMv7fSyII1Nh7iaRUiS+gCCm0cr1DpOCqkdVvB16QEuayJvv7HAq+zQD8zxSXSr906xob+uoNmztwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779685579; c=relaxed/simple;
	bh=g643Ha+RWPHvuDHxyguD0WwJWORCywiyOBiHZhrAyUI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fwXlbw8+enfhABZiq5G7qa8F0tA//sw4nr3K47S9WWqPbyC2jc+Kion7uDgj4RqwmD82oZtvHIHB19srULR390eB3C8+4gGaSkGZArRFh8SOOJIipoIJQKPgfT4h2o4r3m5v0A55Y6j/awEE0HaUN+Js2aCFQiDLSPDhZxcYW/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HS3lWoI+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HS3lWoI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779685578; x=1811221578;
  h=date:from:to:cc:subject:message-id;
  bh=g643Ha+RWPHvuDHxyguD0WwJWORCywiyOBiHZhrAyUI=;
  b=HS3lWoI+OODeXmWdYHh8tlbIGnIKHBf4xzqrQP6WYsq/tQwI6ikiGSG2
   k9sf6ZY++ZAuixnkWHZbJk5I22VfjUUiAPBlr1AQLsalQVG0A3eFoZ6MF
   3Kz0h9TDHjRf+LCo4Bxaj/akoq7eCgVkWcedGgf2uVSxwMuZ7nriC36qI
   AyJA3D41+mNXLWbxltt/K4R1IaFz4v2A6jgS0Q4Gt2QiHq8pfiVRyjtwO
   ShRnVhWVW+3mlz8FXhUXmKGnsqXEltr6Y4t9FBOHNCee/JPeRGxqOe1sl
   vZW4P92UY1dDfXhH8CZ71DQu8EfNns31kT5h2lYpIkaPXpkSHSKZtxUus
   w==;
X-CSE-ConnectionGUID: RysOpTrAQ0SnXT046w2+cg==
X-CSE-MsgGUID: f5r0n0ItS12/FcmAwpVfcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="91977303"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="91977303"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 22:06:17 -0700
X-CSE-ConnectionGUID: KfTC8AYiRnCyNm3YddvpVg==
X-CSE-MsgGUID: uo+omGBUSHS6kUKgTu+n6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="241571190"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 24 May 2026 22:06:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRNW0-00000000C8b-3v4B;
	Mon, 25 May 2026 05:06:12 +0000
Date: Mon, 25 May 2026 07:05:39 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dwmw2:ffclock 8/43] x86/pvclock_migration_test.c:368:60:
 warning: 'tight_mono_lo' may be used uninitialized
Message-ID: <202605250628.l0K9Dwcy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Woodhouse <dwmw@amazon.co.uk>
CC: Paul Durrant <paul@xen.org>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   8a1091fbcaad10bb4456922928c030cb17219b3c
commit: acae447828f80e9496aea34b3d626c47eb60097a [8/43] KVM: x86: Add KVM_VCPU_TSC_SCALE and fix the documentation on TSC migration
:::::: branch date: 9 hours ago
:::::: commit date: 5 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260525/202605250628.l0K9Dwcy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605250628.l0K9Dwcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605250628.l0K9Dwcy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from x86/pvclock_migration_test.c:24:
   x86/pvclock_migration_test.c: In function 'main':
>> x86/pvclock_migration_test.c:321:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type '__u64' {aka 'long long unsigned int'} [-Wformat=]
     321 |         pr_info("  KVM_GET_CLOCK:  %" PRIu64 " ns\n", clock_now.clock);
         |                 ^~~~~~~~~~~~~~~~~~~~~                 ~~~~~~~~~~~~~~~
         |                                                                |
         |                                                                __u64 {aka long long unsigned int}
   include/test_util.h:37:29: note: in definition of macro 'pr_info'
      37 | #define pr_info(...) printf(__VA_ARGS__)
         |                             ^~~~~~~~~~~
>> x86/pvclock_migration_test.c:368:60: warning: 'tight_mono_lo' may be used uninitialized [-Wmaybe-uninitialized]
     368 |         int64_t tight_actual_err = (int64_t)(tight_mono_hi - tight_mono_lo) / 2;
         |                                             ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   x86/pvclock_migration_test.c:332:18: note: 'tight_mono_lo' was declared here
     332 |         uint64_t tight_mono_lo, tight_mono_hi, tight_kvm;
         |                  ^~~~~~~~~~~~~
>> x86/pvclock_migration_test.c:368:60: warning: 'tight_mono_hi' may be used uninitialized [-Wmaybe-uninitialized]
     368 |         int64_t tight_actual_err = (int64_t)(tight_mono_hi - tight_mono_lo) / 2;
         |                                             ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   x86/pvclock_migration_test.c:332:33: note: 'tight_mono_hi' was declared here
     332 |         uint64_t tight_mono_lo, tight_mono_hi, tight_kvm;
         |                                 ^~~~~~~~~~~~~
>> x86/pvclock_migration_test.c:366:55: warning: 'tight_kvm' may be used uninitialized [-Wmaybe-uninitialized]
     366 |         int64_t tight_actual_hi = (int64_t)(tight_kvm - tight_mono_lo);
         |                                            ~~~~~~~~~~~^~~~~~~~~~~~~~~~
   x86/pvclock_migration_test.c:332:48: note: 'tight_kvm' was declared here
     332 |         uint64_t tight_mono_lo, tight_mono_hi, tight_kvm;
         |                                                ^~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
