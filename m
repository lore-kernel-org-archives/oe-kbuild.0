Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F4936D518
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764680377; cv=none; b=mKqpR0L+/Oyv84Ske0GYAqhyjueKbG2MR494lSAVaYKufgkJrNaSbTpJOBIK8snltTFfMFbQow5Oad+FJqQSHbwz/2qZB1DQMfQaRbQd9faXpUgZ0cW8M6rbf33e0ItcqhutE/fyhaz5qEy1+eSST011kA5zO2s07l1X4ji0CxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764680377; c=relaxed/simple;
	bh=nzIb7lIlth7crJAZ0TOSAEP75nsNnXEBFtOgiXMD2Is=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvukGcvi2/psfhSMmPbFOXK/70i8nlPFzWPvOtfrd6igDRRnuYE4/8k7+J2Jr3BKaT+xVVN1CRBL/UzyV6kYHRSg/9x8jiFacJNTjQWr0UIZDtBXv0XKkSL5PLl7zSR9lgpOK7bhMg1TJHCx0EIAfjcGY0o0q4hP2D1pzYAlAbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MoqHsDZQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoqHsDZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764680376; x=1796216376;
  h=date:from:to:subject:message-id:mime-version;
  bh=nzIb7lIlth7crJAZ0TOSAEP75nsNnXEBFtOgiXMD2Is=;
  b=MoqHsDZQzTeYtLl14gy0PPgRLEYxudY9/7+8WJsLzjZNN2oMKhDY8Y7C
   CgHdC0t7KQQBLtEwt5A/QBEldkIFFt3SqvyvOG9SvUoTMJGzxemrw09jk
   Q0h5XB+DQkOHyc4SLP4/XO7a4mUTWYVXW0i6QfWruLByrJHMziPftRX+Q
   zBxhQn/3eFKdXuJGqaf5+e20QgwFKjNeErJcmz+vZgD0KR8HdAu63E6tx
   1pxc5w5BeigqKcUI6g4638hfjNOyZNca31HXCRiWEP4DpNQrghNtHmhYT
   WJazC2cjB0FU7Rkm0jQfSc8ZT78/8t/V/rf2V/bX+nc+S8QpxNyCxmBRe
   A==;
X-CSE-ConnectionGUID: m4yj/FfOQoum9nbGhRa2Sw==
X-CSE-MsgGUID: rfyx1p67T2K25F+h2+16IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65649880"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="65649880"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 04:59:35 -0800
X-CSE-ConnectionGUID: t8hbdAlIQQKFGTJHGyYGfw==
X-CSE-MsgGUID: dhlbwbc3QXW8MNZYALMWMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="225332609"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 02 Dec 2025 04:59:34 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQPye-000000002sH-3Cfl
	for oe-kbuild@lists.linux.dev;
	Tue, 02 Dec 2025 12:59:32 +0000
Date: Tue, 2 Dec 2025 13:58:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mingo-tip:WIP.sched/misc 11/12] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'use'
Message-ID: <202512021315.inKT9SNy-lkp@intel.com>
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
TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.sched/misc
head:   ae9952358c782ce80811cc253c9dd13d0538ea97
commit: 6ea03dd06aa3ed5a2e04a10bcce921a5749699d8 [11/12] sched/fair: Introduce and use the vruntime_cmp() and vruntime_op() wrappers for wrapped-signed aritmetics
:::::: branch date: 3 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251202/202512021315.inKT9SNy-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'use'
#30: 
In the vruntime_cmp() and vruntime_op() macros use Use __builtin_strcmp(),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
