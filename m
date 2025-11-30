Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33919D071
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Nov 2025 02:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764468437; cv=none; b=tT2LlxirMKySo07qyVihDc/VCCtRJwMcgcLzdW87KyR1lTM+2Jm4IjxrwA1QvgY0tyD8V4JPZ59FIL1TL7ImSRY4bRdB10ar2Oh3xcG+ijZyA1dJcZueRz6I1YG37Fd95zJqqZMUIYG7UAqHVwG/nThLENG0viEmb0Huv22k+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764468437; c=relaxed/simple;
	bh=pypLkFe7q1ZjRdXUGMwxk/AY9B6jpZeoOTim+pXyHf8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p01pKHHOFYovkj33BN/mV8Mk77uIrYqs5OOQGivSaSlP2JwfOI2cEnfHjUJQlYLD2oVD5WatNKtxJsSnP3jqudBY9xrvhLkAOGU1rsbHX0b1nzfy78++8lvqpV888WWu19vvr5yZ3A+bpjZp/R1HE4cSehHpy+d5wIqxqwGggiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEoAsPGC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEoAsPGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764468436; x=1796004436;
  h=date:from:to:subject:message-id:mime-version;
  bh=pypLkFe7q1ZjRdXUGMwxk/AY9B6jpZeoOTim+pXyHf8=;
  b=XEoAsPGCHEB85kx/uGvV6xtcyO/5ReHXn7dUs7PDkl2Uimdj5+JUACRN
   FdZ7l1KNwdBp9Q+eEtLDkiEDUEXKxmp/YTGTDxFwUt0jEu46KnqNi74Xv
   5hObdDuADBQLSEC6NwlORE5uvQO1edJy+1FQ7+PuXCjF9H3aAvtq6AP/6
   2uks+G6/p+bNz6T82TcgiaeWX4XXn6Y16W1lTnR+a0f31lD5Zw4O+15ji
   mo2KfOooD+xSvkvjcdw7PGwViwaWpEahCA1GHpgW9kXyjZsWOIPtX2sLf
   NhAEAGl0ryxl4idQldWszdv1I509ZvfRWiN1qONjzJ0s4igrmdWizeVSQ
   A==;
X-CSE-ConnectionGUID: t8Bc6sDYSAaRjNgCvLsdjw==
X-CSE-MsgGUID: IeFYeQceSr67CUiL0eiOHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="65623274"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="65623274"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 18:07:15 -0800
X-CSE-ConnectionGUID: 4mtC96y5Rf6R/ExqnqpFNQ==
X-CSE-MsgGUID: Oxap2ReMQ8eBSoQue5l7YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="224708845"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 29 Nov 2025 18:07:15 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPWqH-000000002TF-0Gob
	for oe-kbuild@lists.linux.dev;
	Sun, 30 Nov 2025 02:07:13 +0000
Date: Sun, 30 Nov 2025 03:06:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sj:damon/next 101/124] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'is'
Message-ID: <202511300304.rUeJHz4N-lkp@intel.com>
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
TO: SeongJae Park <sj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   5944dbef07c13b544ee63200c93230760ca61a37
commit: 655754d7b2fa367f7f76343942292377393e3ded [101/124] mm/damon: add data structures for access check control
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251130/202511300304.rUeJHz4N-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#45: FILE: include/linux/damon.h:862:
+ * @matching:	Whether is is for condition-matching reports.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
