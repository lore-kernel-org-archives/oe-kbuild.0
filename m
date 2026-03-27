Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A02A3382C5
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 10:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608094; cv=none; b=KNTek75mpJ+Rojp9yV2674e4V5aFBCO23UYKd/Mb5k8//bsSSVgbVZNceAPqHXj5RoSqzngBcD2tSD2HjPelxCyzd8+/rCy204xllAigwGyFKYG8X9V0bZhWkzzRceN3V/BIbfgCcpPQljgbY31OErm3lB29TPtBwezdJJl/1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608094; c=relaxed/simple;
	bh=iMZZtTtiKx3dxDJrshbql7rrNlJQDWcm/6WaVCAdMTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eKwrTGM2ZSChxRioiWQkWJ0R4MCkSksRNojJ24Pq0U0Yy+f9CXoly1duBN8+oSoYNWlXmp7OHX7vCDtINa5CGbsawvnj6IXzWSH53CAs4/TF9LxKAJVcDBfE28FURm+bVAgLNxJNigm5wCVE+M5i4KkbEHMMjwsx8t4+hNpGbpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQz3U/fz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQz3U/fz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774608091; x=1806144091;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iMZZtTtiKx3dxDJrshbql7rrNlJQDWcm/6WaVCAdMTI=;
  b=YQz3U/fzVzObLlOtCNxzEGoV9vHyXZJTL3rNLQYKDmP86wy6Xv6C+enz
   4DPaR9eI1dImFOCGKgXvPvTA1+PEG9MdNYHfBXWh5dcE8cOLnfni6q82Z
   +DdjjE5OM3cy7Gqx3tEdyDmPTihx5U/Xwto3Gla/J6DfRDPKXiw7sAkMd
   su6NJ2s+MeMet6hI0tmDERhPh4edWe+nBew5ckHjnDyMaNFqOcvOc0hRj
   u2Vi8ItsLtaY6CL7DgjGM/34doYiJJdObNMRWcYUvlggkglIfUB9b64LI
   //9Ukh4sExjQELyPJfyO8QAwXw7nTbK1sJftiRvXSg+m7R+7v1gB15LQW
   Q==;
X-CSE-ConnectionGUID: G8tgdvc9TcyG9oMWxZcKvg==
X-CSE-MsgGUID: lcYi+ZioSnKIUPwCwjE2lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85986953"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="85986953"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:41:28 -0700
X-CSE-ConnectionGUID: HnFw39NUS8mxL4YKT22xhQ==
X-CSE-MsgGUID: gI7ImrncQq+Z5gn7SKeAQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="225202177"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Mar 2026 03:41:25 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w64cz-00000000AAn-10tS;
	Fri, 27 Mar 2026 10:41:21 +0000
Date: Fri, 27 Mar 2026 18:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
Message-ID: <202603271853.RhfDTdOp-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>
References: <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>
TO: Alice Ryhl <aliceryhl@google.com>
TO: Andrey Ryabinin <ryabinin.a.a@gmail.com>
TO: Alexander Potapenko <glider@google.com>
TO: Andrey Konovalov <andreyknvl@gmail.com>
TO: Dmitry Vyukov <dvyukov@google.com>
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
TO: Bill Wendling <morbo@google.com>
TO: Justin Stitt <justinstitt@google.com>
TO: Miguel Ojeda <ojeda@kernel.org>
CC: Boqun Feng <boqun@kernel.org>
CC: Gary Guo <gary@garyguo.net>
CC: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
CC: Benno Lossin <lossin@kernel.org>
CC: Andreas Hindborg <a.hindborg@kernel.org>
CC: Trevor Gross <tmgross@umich.edu>
CC: Danilo Krummrich <dakr@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: kasan-dev@googlegroups.com
CC: rust-for-linux@vger.kernel.org
CC: llvm@lists.linux.dev
CC: Alice Ryhl <aliceryhl@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-kasan-do-not-pass-Zsanitizer-recover/20260326-213339
base:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
patch link:    https://lore.kernel.org/r/20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa%40google.com
patch subject: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-071-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271853.RhfDTdOp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271853.RhfDTdOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603271853.RhfDTdOp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __asan_report_load8
   >>> referenced by kvec.rs:847 (rust/kernel/alloc/kvec.rs:847)
   >>>               samples/rust/rust_soc.o:(core::ptr::drop_in_place::<kernel::str::CString>) in archive vmlinux.a
   >>> referenced by kvec.rs:847 (rust/kernel/alloc/kvec.rs:847)
   >>>               samples/rust/rust_soc.o:(core::ptr::drop_in_place::<kernel::str::CString>) in archive vmlinux.a
   >>> referenced by aref.rs:170 (rust/kernel/sync/aref.rs:170)
   >>>               samples/rust/rust_soc.o:(<kernel::driver::Registration<kernel::platform::Adapter<rust_soc::SampleSocDriver>>>::post_unbind_callback) in archive vmlinux.a
   >>> referenced 3034 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store8
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_soc.o:(<kernel::platform::Adapter<rust_soc::SampleSocDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_soc.o:(<kernel::platform::Adapter<rust_soc::SampleSocDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced by rust_configfs.rs:86 (samples/rust/rust_configfs.rs:86)
   >>>               samples/rust/rust_configfs.o:(<rust_configfs::Configuration as kernel::configfs::GroupOperations>::make_group) in archive vmlinux.a
   >>> referenced 1783 more times
--
>> ld.lld: error: undefined symbol: __asan_report_load16
   >>> referenced by num.rs:648 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:648)
   >>>               rust/core.o:(<u128 as core::fmt::Display>::fmt) in archive vmlinux.a
   >>> referenced by num.rs:655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:655)
   >>>               rust/core.o:(<i128 as core::fmt::Display>::fmt) in archive vmlinux.a
   >>> referenced by niche_types.rs:100 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/num/niche_types.rs:100)
   >>>               rust/core.o:(<core::num::niche_types::NonZeroU128Inner as core::fmt::Debug>::fmt) in archive vmlinux.a
   >>> referenced 9 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store16
   >>> referenced by option.rs:1279 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:1279)
   >>>               rust/core.o:(<core::num::nonzero::NonZero<u128> as core::str::traits::FromStr>::from_str) in archive vmlinux.a
   >>> referenced by option.rs:1279 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/option.rs:1279)
   >>>               rust/core.o:(<core::num::nonzero::NonZero<i128> as core::str::traits::FromStr>::from_str) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __asan_report_load1
   >>> referenced by c_str.rs:416 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ffi/c_str.rs:416)
   >>>               samples/rust/rust_configfs.o:(<kernel::configfs::GroupOperationsVTable<rust_configfs::Configuration, rust_configfs::Child>>::make_group) in archive vmlinux.a
   >>> referenced by c_str.rs:416 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ffi/c_str.rs:416)
   >>>               samples/rust/rust_configfs.o:(<kernel::configfs::GroupOperationsVTable<rust_configfs::Child, rust_configfs::GrandChild>>::make_group) in archive vmlinux.a
   >>> referenced by revocable.rs:218 (rust/kernel/revocable.rs:218)
   >>>               samples/rust/rust_driver_auxiliary.o:(core::ptr::drop_in_place::<kernel::sync::arc::Arc<kernel::revocable::Revocable<kernel::auxiliary::Registration>>>) in archive vmlinux.a
   >>> referenced 890 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store4
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_configfs.o:(<kernel::configfs::GroupOperationsVTable<rust_configfs::Configuration, rust_configfs::Child>>::make_group) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_configfs.o:(<kernel::configfs::GroupOperationsVTable<rust_configfs::Child, rust_configfs::GrandChild>>::make_group) in archive vmlinux.a
   >>> referenced by result.rs:2050 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/result.rs:2050)
   >>>               samples/rust/rust_configfs.o:(<rust_configfs::Configuration as kernel::configfs::GroupOperations>::make_group) in archive vmlinux.a
   >>> referenced 539 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store1
   >>> referenced by atomic.rs:3845 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/sync/atomic.rs:3845)
   >>>               samples/rust/rust_driver_auxiliary.o:(core::ptr::drop_in_place::<kernel::devres::Devres<kernel::auxiliary::Registration>>) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
>> >>>               samples/rust/rust_driver_auxiliary.o:(pin_init::pin_init_scope::<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error, <kernel::auxiliary::Registration>::new::{closure#0}, core::result::Result<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error>>::{closure#0}) in archive vmlinux.a
   >>> referenced by atomic.rs:3845 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/sync/atomic.rs:3845)
   >>>               samples/rust/rust_driver_pci.o:(core::ptr::drop_in_place::<kernel::devres::Devres<kernel::pci::io::Bar<16>>>) in archive vmlinux.a
   >>> referenced 356 more times
--
>> ld.lld: error: undefined symbol: __asan_report_load4
   >>> referenced by lib.rs:1300 (rust/pin-init/src/lib.rs:1300)
>> >>>               samples/rust/rust_driver_auxiliary.o:(pin_init::pin_init_scope::<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error, <kernel::auxiliary::Registration>::new::{closure#0}, core::result::Result<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error>>::{closure#0}) in archive vmlinux.a
   >>> referenced by io.rs:261 (rust/kernel/pci/io.rs:261)
   >>>               samples/rust/rust_driver_pci.o:(core::ptr::drop_in_place::<kernel::devres::Devres<kernel::pci::io::Bar<16>>>) in archive vmlinux.a
   >>> referenced by io.rs:261 (rust/kernel/pci/io.rs:261)
   >>>               samples/rust/rust_driver_pci.o:(core::ptr::drop_in_place::<kernel::sync::arc::Arc<kernel::revocable::Revocable<kernel::pci::io::Bar<16>>>>) in archive vmlinux.a
   >>> referenced 320 more times
--
>> ld.lld: error: undefined symbol: __asan_report_store_n
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
>> >>>               samples/rust/rust_driver_auxiliary.o:(pin_init::pin_init_scope::<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error, <kernel::auxiliary::Registration>::new::{closure#0}, core::result::Result<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error>>::{closure#0}) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
>> >>>               samples/rust/rust_driver_auxiliary.o:(pin_init::pin_init_scope::<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error, <kernel::auxiliary::Registration>::new::{closure#0}, core::result::Result<kernel::devres::Devres<kernel::auxiliary::Registration>, kernel::error::Error>>::{closure#0}) in archive vmlinux.a
   >>> referenced by mod.rs:1655 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ptr/mod.rs:1655)
   >>>               samples/rust/rust_driver_pci.o:(<kernel::pci::Adapter<rust_driver_pci::SampleDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced 105 more times
--
>> ld.lld: error: undefined symbol: __asan_report_load2
   >>> referenced by pci.rs:372 (rust/kernel/pci.rs:372)
   >>>               samples/rust/rust_driver_pci.o:(<kernel::pci::Adapter<rust_driver_pci::SampleDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced by pci.rs:381 (rust/kernel/pci.rs:381)
   >>>               samples/rust/rust_driver_pci.o:(<kernel::pci::Adapter<rust_driver_pci::SampleDriver>>::probe_callback) in archive vmlinux.a
   >>> referenced by pci.rs:372 (rust/kernel/pci.rs:372)
   >>>               samples/rust/rust_driver_auxiliary.o:(<rust_driver_auxiliary::AuxiliaryDriver as kernel::auxiliary::Driver>::probe) in archive vmlinux.a
   >>> referenced 54 more times
--
>> ld.lld: error: undefined symbol: __asan_report_load_n
   >>> referenced by mod.rs:3753 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/intrinsics/mod.rs:3753)
   >>>               drivers/android/binder/rust_binder_main.o:(<[u8]>::copy_from_slice) in archive vmlinux.a
   >>> referenced by mod.rs:3753 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/intrinsics/mod.rs:3753)
   >>>               drivers/android/binder/rust_binder_main.o:(<[u8]>::copy_from_slice) in archive vmlinux.a
   >>> referenced by mod.rs:864 (/opt/cross/rustc-1.88.0-bindgen-0.72.1/rustup/toolchains/1.88.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/mem/mod.rs:864)
   >>>               drivers/android/binder/rust_binder_main.o:(<rust_binder_main::range_alloc::tree::Descriptor<rust_binder_main::allocation::AllocationInfo>>::try_change_state::<<rust_binder_main::range_alloc::tree::TreeRangeAllocator<rust_binder_main::allocation::AllocationInfo>>::reservation_abort::{closure#1}, (rust_binder_main::range_alloc::Reservation, kernel::rbtree::RBTreeNodeReservation<(usize, usize), ()>)>) in archive vmlinux.a
   >>> referenced 81 more times
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
