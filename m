Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406AA3246E1
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069303; cv=none; b=e2E81Cpl8LVlFlG0nJLckU6QH8Ge3oVdifjY19a9ktAFzCwMmWWTKD7lk0NOAu+TaB0EPjUn3UvurCJ0pypkwX2E/b+iA7dtmd2dlREeThI8Bvfaq6MonqRw9RbBwpvbbRiXrTXubPk8AR2D6UaY0rEZ1SKQaxu8rTJdVrhUbQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069303; c=relaxed/simple;
	bh=YXJ8+NH5PmyNOb0E4TZpp3M5wyzjd3oRKkUL/OWdnC0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzkjAA/in6neowoWuTFSJ9UBzaD7IlV8ZfWR1bzPM0/RFGcEKypNdnHlhjTPDylJio7WdEIltHgI772wE0AFXoLQKDWMO90PMcqc2QgbHeqZKDpeL7sc0o/z2iBjZVMvj0RIwVg+M9G+1smm9T4T7hhjIJ3aqC/+EMqyUaJiVT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4gnWmag; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4gnWmag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069301; x=1794605301;
  h=date:from:to:subject:message-id:mime-version;
  bh=YXJ8+NH5PmyNOb0E4TZpp3M5wyzjd3oRKkUL/OWdnC0=;
  b=C4gnWmag540fZmmWXs6lWMB1CS0iMgXcdRftQazKX3t8XoDrdtgA4KdI
   3ObHaxrdAwH+Ao92d1d8Pu/HdIcSDwlNq9Vmsx+L0HmLtaj11ixYgASbD
   WpzKdUUVXJFu+NJWJR9/rDhdW92pWjK3j9zx1ROk0XXlKWemwOtvBN2Vq
   ELMkFtpBBRwO/4+SxPvxI/TA48iEhiuInA5Gij/huVhqTDv5xozU6BPk8
   RfrX9kFLYMqusjZ1wVVZV90E2iCgKG8np0UDj1k3GepowI7lmX9UwqxP6
   pXJO6MqJxGoV/5L8raZclzhCIF6UnCAa0TWXtY8LzTSk8cdP3O0AnYRdu
   w==;
X-CSE-ConnectionGUID: nIcIE38HRauWYxpTojCmaA==
X-CSE-MsgGUID: LCpc7mtISe2+dFaV/2YvNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637517"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637517"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:28:17 -0800
X-CSE-ConnectionGUID: XkXfW/tpStKm6v6Jxz6+bw==
X-CSE-MsgGUID: Z6OM7eQ/RdSOgDlPjrGgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190035930"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 13:28:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJerW-0000000019x-1zAe
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:28:14 +0000
Date: Thu, 13 Nov 2025 22:27:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 576/867] checkpatch: ERROR:SPACING: space
 required after that ',' (ctx:VxV)
Message-ID: <202511131956.NTSh6wHv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 033347154bf3739b6b6f736bc8d027e3bf6dc3b0 [576/867] bcachefs: Compatibility with v6.18
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131956.NTSh6wHv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131956.NTSh6wHv-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#96: FILE: fs/bcachefs/util/darray.c:27:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#96: FILE: fs/bcachefs/util/darray.c:27:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#96: FILE: fs/bcachefs/util/darray.c:27:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#116: FILE: fs/bcachefs/util/util.h:52:
+#if defined(__KERNEL__) && LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#116: FILE: fs/bcachefs/util/util.h:52:
+#if defined(__KERNEL__) && LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#130: FILE: fs/bcachefs/util/util.h:69:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#130: FILE: fs/bcachefs/util/util.h:69:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#130: FILE: fs/bcachefs/util/util.h:69:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#150: FILE: fs/bcachefs/vfs/direct.c:151:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#150: FILE: fs/bcachefs/vfs/direct.c:151:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#150: FILE: fs/bcachefs/vfs/direct.c:151:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#162: FILE: fs/bcachefs/vfs/direct.c:468:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#162: FILE: fs/bcachefs/vfs/direct.c:468:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#162: FILE: fs/bcachefs/vfs/direct.c:468:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#186: FILE: fs/bcachefs/vfs/ioctl.c:29:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#186: FILE: fs/bcachefs/vfs/ioctl.c:29:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#186: FILE: fs/bcachefs/vfs/ioctl.c:29:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
