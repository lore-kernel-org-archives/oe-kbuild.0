Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E048C2D6E42
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763760227; cv=none; b=Dlwo2qGpRZafS0FghIq4/uZgmhlRUO4hH6GRQkI7RErnNIifp+RGPq7THJiZlUcoOck+3o5sF4nIupWZvHMu4CY1E2C/y8BPdYP65OMiz9/1rrTiHqVRzb0zmp7ufRmt5GVcKSJnhLXtNw2j28plY/o9LO1BeqLwwuhJoUQSNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763760227; c=relaxed/simple;
	bh=pxE4GrXMd5CskSxI/FcFJ7APtPrkTBvVdHPqThajglo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHJzMMwwfNWjYl5SuBo94NGGjJih4jTYsvhppz3gXC0oCaAuf3TIieJ1qsbHRl+mzi8naxzXFKUu0MGfka2mUizvWxv/FXbwBF4JfLwmHWFY+rDADesDeAWu9O5lYFPSdTuHGF4ysRqMrZ5yjdWqZJK+TzqK6BVrhOGjZLPJHW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hw5zO/Vi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hw5zO/Vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763760226; x=1795296226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxE4GrXMd5CskSxI/FcFJ7APtPrkTBvVdHPqThajglo=;
  b=hw5zO/Vi2cPCEwUSfwq6bCOXpWQgXROiQcSdIuRXmcKOSZTM1OhYyIHK
   kb3llXBTQuYpHOTojxMtEte6DlAwLhCz65Im4CMWtJ3tueIYXRPllYA6G
   9mATA86L0+/gUcfr+nqsiFTdhF7KAbKuS3xSnWz72jNUZuGSaRY+300HX
   kMZx1FgvcDsYyhvrpSNRpPhNQJLPkZl/88fuT4nxM8whemUvC6etPJ2kE
   AL3Wd+RtmYOe+yHg1bJ8mssO5oKNhfR0nfX/jjZ4rHSmhTy3FstfbgyBq
   nnqaXoCS4vg60Zo9h3xgil0Zi3LZCKNZvXqiQ3nWNA+JeetN+rADk5BDU
   Q==;
X-CSE-ConnectionGUID: DTi15qyqRTm6l+L07xdNMQ==
X-CSE-MsgGUID: WG8HoNZsSX+ENFVwBE2V2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="83482374"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="83482374"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 13:23:45 -0800
X-CSE-ConnectionGUID: BpeNQlzDSHiDNzrW7sTO9g==
X-CSE-MsgGUID: P72Pa1TwQ6W4ASuoltE6gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191092780"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2025 13:23:44 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMYbV-0006tL-28;
	Fri, 21 Nov 2025 21:23:41 +0000
Date: Sat, 22 Nov 2025 05:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0609]: no field `ki_filp` on type `bindings::kiocb`
Message-ID: <202511220552.RXFzXD0E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um-randconfig-001-20251121 results in a lot of rust failure"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alice Ryhl <aliceryhl@google.com>
CC: Andreas Hindborg <a.hindborg@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
commit: 5e15de179a204ce26623d8468283ac04a0dc672f rust: fs: add Kiocb struct
date:   3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220552.RXFzXD0E-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220552.RXFzXD0E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220552.RXFzXD0E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `ki_filp` on type `bindings::kiocb`
   --> rust/kernel/fs/kiocb.rs:52:51
   |
   52 |         let private = unsafe { (*(*self.as_raw()).ki_filp).private_data };
   |                                                   ^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `ki_pos` on type `bindings::kiocb`
   --> rust/kernel/fs/kiocb.rs:60:35
   |
   60 |         unsafe { (*self.as_raw()).ki_pos }
   |                                   ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `ki_pos` on type `bindings::kiocb`
   --> rust/kernel/fs/kiocb.rs:66:40
   |
   66 |         unsafe { &mut (*self.as_raw()).ki_pos }
   |                                        ^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
