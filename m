Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38802EA749
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 11:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764762400; cv=none; b=b7FC9oqB6mowDdtz7eRB12kC22B1m/c/5aXpSdZUEH/X+hyxD9Wz1aiMuTrP6+aIw/gKY474byr/dGSHg7l9bGW60TKsG+OB1PASUb6ndbyTJORkdonUwaGk2udViVPVRBFujpk6RUUFjNEQMTjQvTu5FEj7qSyGfbNpRibm4RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764762400; c=relaxed/simple;
	bh=vJpcr2uq9DAO5O9xKRkEO+Q7H89+UqOITzjmb+lpfng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ENK1+IN3RIPeRd7cSh6w8lR4L5yehJr4E9kg+aQXKyMIGk4vrjRPNzj9UTQ8rCt2QOTEclkbi7iI0EQ7H6WHkbKp3y9lSdcgTaxFKDPNSGbdbKl5A6qGF5wAJAt55U55NU1XgC6TvjgHHO4Y6DPYT8uLitHDPA6E1Ewyu/Zk3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBGw/i3h; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBGw/i3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764762398; x=1796298398;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vJpcr2uq9DAO5O9xKRkEO+Q7H89+UqOITzjmb+lpfng=;
  b=WBGw/i3hbFn4DEeySn7yG9N3CS1bb343SB/plpEws9kw9l+9VQX2QXxZ
   T5lXQ4lzHufMZYrPAOvGlZKqrTF2GB6cn9M5xMysBmqdt5c5rcQU6m0aa
   wypIbA3eerHBwyHUdAaZd0LygcDIIaueVYXZf2zaWYFnaeAk186GylCSe
   7I19uAokWdojreqNXYqkIxBjGyveEw/jofAs43nl4PgU9qJCLENere0bW
   IjyRtrBt0Z+HIDjIQHwRMSM3BHTgS+c8We3XaqN4S5Q0NlQ4iOO6VzK7g
   mN8Y6Pvs1MOt5UVv24xkApxaWEVxri+18Lf8n7i+2GY+EQMmSKTbtJ8R5
   w==;
X-CSE-ConnectionGUID: NEeRj7BqS4K0sF3hRUacqA==
X-CSE-MsgGUID: OgQdPfqnTK+SoxMVtpByTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77071400"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="77071400"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 03:46:35 -0800
X-CSE-ConnectionGUID: 1uP/BL8UTlO13oEvpgEruQ==
X-CSE-MsgGUID: jx1woAdcRMaTiSQOoVM3sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="217993872"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 03:46:33 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQlJW-00000000AvL-3VOw;
	Wed, 03 Dec 2025 11:46:30 +0000
Date: Wed, 3 Dec 2025 19:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0560]: struct `kunit_suite` has no field named `suite_init`
Message-ID: <202512031957.BoFx2PMx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "arm-randconfig-r121-20251201 results in various rust failures"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
CC: Daniel Gomez <da.gomez@samsung.com>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
commit: 818783c804bc051f7faf0ac226b5597f8259c6f8 module: make structure definitions always visible
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031957.BoFx2PMx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031957.BoFx2PMx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512031957.BoFx2PMx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `kunit_suite` has no field named `suite_init`
   --> rust/kernel/kunit.rs:291:21
   |
   291  |                     suite_init: None,
   |                     ^^^^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `suite_exit`
   --> rust/kernel/kunit.rs:292:21
   |
   292  |                     suite_exit: None,
   |                     ^^^^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `init`
   --> rust/kernel/kunit.rs:293:21
   |
   293  |                     init: None,
   |                     ^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `exit`
   --> rust/kernel/kunit.rs:294:21
   |
   294  |                     exit: None,
   |                     ^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `attr`
   --> rust/kernel/kunit.rs:295:21
   |
   295  |                     attr: ::kernel::bindings::kunit_attributes {
   |                     ^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `status_comment`
   --> rust/kernel/kunit.rs:298:21
   |
   298  |                     status_comment: [0; 256usize],
   |                     ^^^^^^^^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `debugfs`
   --> rust/kernel/kunit.rs:299:21
   |
   299  |                     debugfs: ::core::ptr::null_mut(),
   |                     ^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `log`
   --> rust/kernel/kunit.rs:300:21
   |
   300  |                     log: ::core::ptr::null_mut(),
   |                     ^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `suite_init_err`
   --> rust/kernel/kunit.rs:301:21
   |
   301  |                     suite_init_err: 0,
   |                     ^^^^^^^^^^^^^^ `kunit_suite` does not have this field
   |
   ::: rust/kernel/alloc/kvec.rs:1244:1
   |
   1244 | #[macros::kunit_tests(rust_kvec_kunit)]
   | --------------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `suite_init`
   --> rust/kernel/kunit.rs:291:21
   |
   291 |                     suite_init: None,
   |                     ^^^^^^^^^^ `kunit_suite` does not have this field
   ...
   344 | #[kunit_tests(rust_kernel_kunit)]
   | --------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0560]: struct `kunit_suite` has no field named `suite_exit`
   --> rust/kernel/kunit.rs:292:21
   |
   292 |                     suite_exit: None,
   |                     ^^^^^^^^^^ `kunit_suite` does not have this field
   ...
   344 | #[kunit_tests(rust_kernel_kunit)]
   | --------------------------------- in this procedural macro expansion
   |
   = note: all struct fields are already assigned
   = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
