Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02895322A28
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069123; cv=none; b=QnLJ/A/n8Yx9tuX1NNoh4ufwCMSnD77F0VG2k0OnPErHRkwDO7A4w5Y94E/HaWT74+s62Xtsz38z73h3ecG0NUboGiO+TfdFLwZ3LBHrTsQgRGgXd7huf/ALDcR4AdRrzAmFe0W+pFEP2cNBpI27AYQ233yAjAriUhVF4x6lXSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069123; c=relaxed/simple;
	bh=2MegaipST4dxw0G89bUW94ZEFTRYZArNioOAJ1C8JtQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsCgg3Y+8WUQgfezs6VnWUuSBfp5maQAff0E8wn9V5mCCviK3JYd/phzgH1XoefORNDgKceTbMMMg+xXdPEC9q8hwMACvjTA41vkm97qfilVlok2BHdMyM1L37DgRpP5qJxwLfvsxW95lM/XWJpv8zMi5mapPjmUXz1STTQIMbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2esGnE5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2esGnE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069122; x=1794605122;
  h=date:from:to:subject:message-id:mime-version;
  bh=2MegaipST4dxw0G89bUW94ZEFTRYZArNioOAJ1C8JtQ=;
  b=a2esGnE5RKRV7KClJ9F2bLwes7jpJLe63mMR3W8BF9n+/o/oXukADFXC
   2tG7/sByiKV2Ju4sJOoXP0tqYCfXGGzY5zGajCiRHfSTm3KHYdZYUbeC+
   s40ZN/SfURbLFbMxwMG96mSmZLNp7bZC2+8McNI0rbN85Ok0spbz+CaT1
   tD9ShYHda2mFV25xSf9EmV0OyClNF9XqwaulWBntKyJOdKxcsDZ5bE7Va
   it7UxBAA7pM/qIYHJDH8ByRK0O/VlW18NUH7+XMq9X1bvN4ZwLGAIuwJy
   gGrKGlzSsi1SLSukBanmkcFPFUbWuebIRuBMb5r6w/tprl8qnVQ210zj+
   Q==;
X-CSE-ConnectionGUID: Q+mouFNMS+2E1mfwtH+Z0g==
X-CSE-MsgGUID: NzGk8/x9QreYq+T8MBJBtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75842410"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="75842410"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:25:17 -0800
X-CSE-ConnectionGUID: SBwIWloMRH2aS7wnZ5Ppcg==
X-CSE-MsgGUID: eEL+pH7sR8mFbT6KvGEMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="213008640"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 13:25:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeob-0000000018R-2Q68
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:25:13 +0000
Date: Thu, 13 Nov 2025 22:25:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 2/867] checkpatch: ERROR:SPACING: space
 required after that ',' (ctx:VxV)
Message-ID: <202511131804.OrJHszhH-lkp@intel.com>
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
commit: 41d65618647653deddf789cd23b78cdfe77562bc [2/867] bcachefs: compat code for pre 6.17
:::::: branch date: 73 minutes ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131804.OrJHszhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131804.OrJHszhH-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#23: FILE: fs/bcachefs/fs-io-buffered.c:678:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#23: FILE: fs/bcachefs/fs-io-buffered.c:678:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#23: FILE: fs/bcachefs/fs-io-buffered.c:678:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#38: FILE: fs/bcachefs/fs-io-buffered.c:767:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#38: FILE: fs/bcachefs/fs-io-buffered.c:767:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#38: FILE: fs/bcachefs/fs-io-buffered.c:767:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#63: FILE: fs/bcachefs/fs-io-buffered.h:15:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#63: FILE: fs/bcachefs/fs-io-buffered.h:15:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#63: FILE: fs/bcachefs/fs-io-buffered.h:15:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#93: FILE: fs/bcachefs/fs.c:1555:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#93: FILE: fs/bcachefs/fs.c:1555:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#93: FILE: fs/bcachefs/fs.c:1555:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#117: FILE: fs/bcachefs/fs.c:1630:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,17,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#117: FILE: fs/bcachefs/fs.c:1630:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,17,0)
                                             ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#117: FILE: fs/bcachefs/fs.c:1630:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,17,0)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#128: FILE: fs/bcachefs/fs.c:1757:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                           ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#128: FILE: fs/bcachefs/fs.c:1757:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)
                                              ^

WARNING:CONSTANT_COMPARISON: Comparisons should place the constant on the right side of the test
#128: FILE: fs/bcachefs/fs.c:1757:
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,17,0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
