Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E8C15A856
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Mar 2025 16:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741797789; cv=none; b=JFBsrnBjxv2+XUvAq38joaIa0qz1GJDxZd/q3E/bzLgPXPur9iwDYKC/GdotM3PI5ousoINNUXOBFs3BuVxojVIJJgy1qmRxGIlwlukaiRQExQtrJhdVzLZDpz8mbQyPmeyLq/KZ/HmFcXv6Jr5pJPFbRXaVg4QGVNBmXVgutN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741797789; c=relaxed/simple;
	bh=luQWoF3ApbhENCJhxDpnwO64nHcQxub84jcvHUNFH3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2pC65p3q8RB0y61oOfOoOrsTwGcRx+QWaywtiLNpEpt7HR2cvnlu+MYpU4Rvl3Km4MPb7fivmtAqNcuFH9RdcCjbYjtvNgsyCSKC00rGtYXEEEci5vfSYlGDsOBK/TxNe8hrLcJGNRDmpKWDmWBS8bQ7K1s85UUtMHhuOPxnQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bhiof6JY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bhiof6JY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741797787; x=1773333787;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=luQWoF3ApbhENCJhxDpnwO64nHcQxub84jcvHUNFH3M=;
  b=Bhiof6JYdosi+5QEXtNuRv59XTmbQePSljGTtEFSxm8mT9+IFX9VTSsr
   36JU3tf7K+dadgSBkv9QwrFS79xqzdmyqJxCUYntRaAv9V5DtNATA5tRD
   GKcPVbdGNp4/dOc+D1XESTN7e59glqE85s4V8DenMQ1ZQ46jETstNV30F
   e6aU2B3K/VauElpcRVeNcl6UoVaj83wvNmJ+EL7CVWUXL/aqcNSggr2OL
   7U6xiz9of0VoNbXqK3fCf2VhfX1f4xY7TWCfZDn058pKl/rmI1JHXV1bO
   GQ9uDGC8wbFKiYoHB8KiokBaD0ckZqhelD66D0Ua+Y7z5+kYJypR0YsCE
   A==;
X-CSE-ConnectionGUID: KAZYQy+fRqirbnn/0JAE2g==
X-CSE-MsgGUID: dGKnSjDaQOCEd6PiAxFZgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="45664108"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="45664108"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 09:43:05 -0700
X-CSE-ConnectionGUID: obQbH/X7RyabFRqv0vI/pQ==
X-CSE-MsgGUID: SymPmoqASYySYkG7/x3R1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="125755008"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Mar 2025 09:43:04 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsPAb-0008jI-0h;
	Wed, 12 Mar 2025 16:43:01 +0000
Date: Thu, 13 Mar 2025 00:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
Message-ID: <202503130214.myqzPlR6-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
TO: Filipe Xavier <felipeaggger@gmail.com>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Alex Gaynor <alex.gaynor@gmail.com>
TO: Boqun Feng <boqun.feng@gmail.com>
TO: Gary Guo <gary@garyguo.net>
TO: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
TO: Benno Lossin <benno.lossin@proton.me>
TO: Andreas Hindborg <a.hindborg@kernel.org>
TO: Alice Ryhl <aliceryhl@google.com>
TO: Trevor Gross <tmgross@umich.edu>
TO: Danilo Krummrich <dakr@kernel.org>
CC: daniel.almeida@collabora.com
CC: rust-for-linux@vger.kernel.org
CC: felipe_life@live.com
CC: Filipe Xavier <felipeaggger@gmail.com>

Hi Filipe,

kernel test robot noticed the following build errors:

[auto build test ERROR on beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d]

url:    https://github.com/intel-lab-lkp/linux/commits/Filipe-Xavier/rust-add-new-macro-for-common-bitwise-operations/20250304-205635
base:   beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
patch link:    https://lore.kernel.org/r/20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b%40gmail.com
patch subject: [PATCH] rust: add new macro for common bitwise operations
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250313/202503130214.myqzPlR6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130214.myqzPlR6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503130214.myqzPlR6-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/prelude.rs at line 22:
    pub use super::{build_assert, build_error};
    
    // `super::std_vendor` is hidden, which makes the macro inline for some reason.
   +pub use super::bitmask;
    #[doc(no_inline)]
    pub use super::dbg;
    pub use super::fmt;
   Diff in rust/kernel/prelude.rs at line 28:
   -pub use super::bitmask;
    pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
    pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
    
>> Diff in rust/kernel/prelude.rs at line 22:
    pub use super::{build_assert, build_error};
    
    // `super::std_vendor` is hidden, which makes the macro inline for some reason.
   +pub use super::bitmask;
    #[doc(no_inline)]
    pub use super::dbg;
    pub use super::fmt;
   Diff in rust/kernel/prelude.rs at line 28:
   -pub use super::bitmask;
    pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
    pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
    
   make[2]: *** [Makefile:1816: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
