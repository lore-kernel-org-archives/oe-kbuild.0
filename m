Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA172765F5
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 23:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763767980; cv=none; b=QPkf92FzoTcdLc5GMwMP4xZBSAIy3CZFl8SDAZDlvaD7KWQ3XuwwERxEBNvifI2MOOeQ040IaBdN2pscfhy/EmBXTKM43b0PmbQK3a++Sb3INVj6SE6Ka1ER7NVz9ZcbNeN/LTZeg/WrXzHisU6z8nm65xk/6euvfpaHcUYpOjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763767980; c=relaxed/simple;
	bh=DuqgN9RBJU5liBr0lO+7mxAcVQQgHgpz0kPSbQH8dag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLRSvR3Poo/uAK22dzRn/UwJfyKXCtidkLC0v46NBCfOMk3ZNBiWCnshDBXPVDkhoXOjHIVt8ws8BOCjH4dwRU2KDe2AIyNPAM0CPb/8QBFvSlvcNKFZDJ2+wyx3LV81ibDXp7f09m6isVJJsBwtnyl+KVA/QQqZaSPGyYWrfMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHJnCf17; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHJnCf17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763767978; x=1795303978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DuqgN9RBJU5liBr0lO+7mxAcVQQgHgpz0kPSbQH8dag=;
  b=iHJnCf17kCuf/s7lftSu+YlIWS4I2PzvkdQezT+BbiZBwLK4YmKa65D4
   hqB5B/l9xE9xENatwWPLjHvOjZAPnvUQz81VUbMTps2PE6ovfTAN+sDUO
   Hl1/+RdbymFLLDzsnCiWTRhysIQpYXXmCd8DTDaMJJFEj93xyskP+EwhS
   sD5VNWkOv6WhdQ33ctSZAGdENJa+EgRkUi8ObwZQ3NhLQx89vm/JHz0Kn
   TcjxtG3//Kd+R+ds1S0SZWAxqfTGGM+PBueVw/ND7FpT4MXpBZ8ZEH1E9
   4V54crZoFe2XCgMXyhDDJ0nphrI6h/8EUOYcAMDhTZB0Cy3NueGLr6LKx
   A==;
X-CSE-ConnectionGUID: +sXK/CuWQmq9riggxR+k/g==
X-CSE-MsgGUID: 0Y2B5I6IRg2QbNLZPgh+6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65805221"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65805221"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 15:32:58 -0800
X-CSE-ConnectionGUID: klhtx6PBSL+NISMu67N6tA==
X-CSE-MsgGUID: x7csIDegTei9Ej8jFunxAw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2025 15:32:56 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMacY-0006yW-1k;
	Fri, 21 Nov 2025 23:32:54 +0000
Date: Sat, 22 Nov 2025 07:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0560]: struct `bindings::file_operations` has no field named
 `read_iter`
Message-ID: <202511220744.cA12gIBc-lkp@intel.com>
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
CC: Lee Jones <lee@kernel.org>
CC: Andreas Hindborg <a.hindborg@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
commit: 39c2745b37dac18c6604083f26caea3fd7e4c50b rust: miscdevice: Provide additional abstractions for iov_iter and kiocb structures
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220744.cA12gIBc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220744.cA12gIBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220744.cA12gIBc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `bindings::file_operations` has no field named `read_iter`
   --> rust/kernel/miscdevice.rs:395:9
   |
   395 |         read_iter: if T::HAS_READ_ITER {
   |         ^^^^^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `_address`
--
>> error[E0560]: struct `bindings::file_operations` has no field named `write_iter`
   --> rust/kernel/miscdevice.rs:400:9
   |
   400 |         write_iter: if T::HAS_WRITE_ITER {
   |         ^^^^^^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
