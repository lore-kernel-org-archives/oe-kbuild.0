Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAC5EA4
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jun 2023 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687713588; x=1719249588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+gAusUCAqpkq7Lhi1i80eGTkaAVrY4d7HdHAnwpHdPA=;
  b=chuNT/ng4DgvX6kJo4hpJLs7QpVtnf5gHSysV4/3CkEx+RqU2cd7KF93
   QhlC+eH3LIAzl53zJFh+eJXGZg4DMwF2JekqIvz2O/mlmaCsVwpe/YD8B
   gUIzBCIt2KIBfReCUeui1Ysyt0lH+fNzMddf49CTZpm+S9T47yegV2n9j
   QPPOyovQDfYW2swZ40074l/1ON8m+HOKUdWTbi9DJvi4F2eRf5lXpNt9c
   +vc7aENvZT+1VleO4gX67IZtp+K9sFwBLrXEct8E8SL0sBSGBhQVeEKQ3
   0Si5xzG+8UX6l7UiAi/jIAQmAVvi+o4TlqY6kulqIOKLJWakIcMTdk42D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="358585629"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="358585629"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 10:19:47 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="750744292"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="750744292"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Jun 2023 10:19:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDTOr-000AAF-1p;
	Sun, 25 Jun 2023 17:19:45 +0000
Date: Mon, 26 Jun 2023 01:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 4/8] rust: kernel: add some info handler
 TargetOperations
Message-ID: <202306260130.wbYhOWAt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230625121657.3631109-5-changxian.cqs@antgroup.com>
References: <20230625121657.3631109-5-changxian.cqs@antgroup.com>
TO: Qingsong Chen <changxian.cqs@antgroup.com>

Hi Qingsong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.4-rc7 next-20230623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qingsong-Chen/rust-kernel-add-basic-abstractions-for-device-mapper/20230625-201850
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20230625121657.3631109-5-changxian.cqs%40antgroup.com
patch subject: [RFC PATCH 4/8] rust: kernel: add some info handler TargetOperations
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230626/202306260130.wbYhOWAt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306260130.wbYhOWAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306260130.wbYhOWAt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/device_mapper.rs:145:34
   |
   145 |               (*$tt).$filed = Some(TargetType::$func::<T>);
   |                               ---- ^^^^^^^^^^^^^^^^^^^^^^ incorrect number of function parameters
   |                               |
   |                               arguments to this enum variant are incorrect
   ...
   170 | /                 check_target_operations!(
   171 | |                     tt,
   172 | |                     (HAS_CTR, ctr, dm_ctr_fn),
   173 | |                     (HAS_DTR, dtr, dm_dtr_fn),
   ...   |
   195 | |                     (HAS_REPORT_ZONES, report_zones, dm_report_zones_fn),
   196 | |                 );
   | |_________________- in this macro invocation
   |
   = note: expected fn pointer `unsafe extern "C" fn(*mut bindings::dm_target) -> _`
   found fn item `unsafe extern "C" fn(*mut bindings::dm_target, *mut bindings::dm_report_zones_args, u32) -> _ {device_mapper::TargetType::dm_report_zones_fn::<T>}`
   help: the type constructed contains `unsafe extern "C" fn(*mut bindings::dm_target, *mut bindings::dm_report_zones_args, u32) -> i32 {device_mapper::TargetType::dm_report_zones_fn::<T>}` due to the type of the argument passed
   --> rust/kernel/device_mapper.rs:145:29
   |
   145 |               (*$tt).$filed = Some(TargetType::$func::<T>);
   |                               ^^^^^----------------------^
   |                                    |
   |                                    this argument influences the type of `Some`
   ...
   170 | /                 check_target_operations!(
   171 | |                     tt,
   172 | |                     (HAS_CTR, ctr, dm_ctr_fn),
   173 | |                     (HAS_DTR, dtr, dm_dtr_fn),
   ...   |
   195 | |                     (HAS_REPORT_ZONES, report_zones, dm_report_zones_fn),
   196 | |                 );
   | |_________________- in this macro invocation
   note: tuple variant defined here
   --> /opt/cross/rustc-1.68.2-bindgen-0.56.0/rustup/toolchains/1.68.2-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:570:5
   |
   570 |     Some(#[stable(feature = "rust1", since = "1.0.0")] T),
   |     ^^^^
   = note: this error originates in the macro `check_target_operations` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0609]: no field `next_sector` on type `bindings::dm_report_zones_args`
   --> rust/kernel/device_mapper.rs:657:34
   |
   657 |         unsafe { (*self.0.get()).next_sector as _ }
   |                                  ^^^^^^^^^^^ unknown field
--
>> error: aborting due to 2 previous errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
