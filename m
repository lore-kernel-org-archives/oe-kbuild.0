Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FFF1E8826
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 08:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752311; cv=none; b=n0k9+jJCmqsTKnHZcDaMNVqVzK+wvxbXdjlc9lUG3dhrndz1OFjNU2/8EGmkrpxvuZlhLC2pjPT1PLv6WCz7agoFxinF9IBsRc0x7zedpKJre6nuyAY84nst8nPe3hsOj/knAk/IWxpgsRNZWcmjUTwd9u7eIAx3GS+gvCc+DyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752311; c=relaxed/simple;
	bh=iYvk/JDZFAGjhId1PGyDhJPHJw4Na/1kygnJZTEvCTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDkhFxEyFoIBQGmPpHaT4Rwzw4/HMQ4LUKTAMFOEtyS+xXU3vtx5fRE5O+w56R7XnLUdC+wRoiETQYK3b3ns22YwyDQOn2nNjbQwgbVhAxUKjDlbnQ9M1Ws/8oszB++FhUO+TkAzL5ofIuP8ybbnHpLY9pOoP/bIOLG34Cvkn1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvP1IDCO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvP1IDCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764752310; x=1796288310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iYvk/JDZFAGjhId1PGyDhJPHJw4Na/1kygnJZTEvCTY=;
  b=AvP1IDCOD15jg0DBch7wnZM/EsxL4JHRYUX6U/jqOMtQx29+fGphbZM0
   aFNiljTDhmO/z5sx3AWNmE4VuImXHNiTm8yWXhYj+0Q1ZG0U0LsiCt/2+
   Efdq0YTS9NUh+HLumKO2/5LjpfAaTwyBy7DpQywgSXAj1d7XLN0LbPl+N
   QDGqzTD5q5K0XDOp7aaIXuqeuZqbVGQA3XRAYbVYFEWpCdCCrbgw2Bp1r
   Xg5/SGK7w15NQofuj9Q4+lKd40eoUFl7OMX8DwL5bxdnx5HtKSfE69ch1
   9iZNhDSQwQMc6NgVlWkdcM6YlOx1RkzkDovF1zybJoyCm/+XJIsf3Xo7Z
   g==;
X-CSE-ConnectionGUID: zgaGPOF7TXGiiu+Y9kbCVw==
X-CSE-MsgGUID: sjMYZzBtRJi7CnqO+Nqp9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69333644"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="69333644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 00:58:28 -0800
X-CSE-ConnectionGUID: tzVrqpPtRqya1wTccg81jQ==
X-CSE-MsgGUID: h+aJ19/URGmLSxFsfubXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="231959283"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Dec 2025 00:58:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQigq-00000000An5-170O;
	Wed, 03 Dec 2025 08:58:24 +0000
Date: Wed, 3 Dec 2025 16:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error[E0609]: no field `mm` on type `bindings::task_struct`
Message-ID: <202512031652.GdE3gPaM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "arm-randconfig-r121-20251201 results in various rust failures"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alice Ryhl <aliceryhl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Andreas Hindborg <a.hindborg@kernel.org>
CC: Gary Guo <gary@garyguo.net>

Hi Alice,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
commit: 6acb75ad7b9e1548ae7f7532312295f74e48c973 task: rust: rework how current is accessed
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031652.GdE3gPaM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031652.GdE3gPaM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512031652.GdE3gPaM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `mm` on type `bindings::task_struct`
   --> rust/kernel/task.rs:286:44
   |
   286 |         let mm = unsafe { (*self.as_ptr()).mm };
   |                                            ^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
