Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB5C1E260A
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 19:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764443774; cv=none; b=J8XKcucFeZRZeFv/o1OSyFLEz7aUYeabK5Qay9hW6BOjroH33528i29AXJHiZXauBjVjCT2btr3UWuQumE8+fJIspi6A+g8o6qB5gzJaTBPr1pZW/dIHKdQFcrnO8U2iVyulGAo/OKbHeoiaZcRKKysg2QVHb2KVjukkyog29kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764443774; c=relaxed/simple;
	bh=rP+OTQMf43eimyCn/J1FIcXEUv5NiuIKo5JmSDOvvb0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GwIcvVXlB0NRcBf2sNeG5RmIso3YyJi9wPP++1Zyux836uU2DgVE+2UnwajrCspCnHYEh6FZTTQEworofq+EUAR0kXz9v0D4AFlPyV1cyaTCRvkfV73GQ/sR3WFM2xk0c+aoRqw3G7Np3TZa/b9mXf41ozRpXVMvvVrKVfUGC2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8dwXjgt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8dwXjgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764443772; x=1795979772;
  h=date:from:to:subject:message-id:mime-version;
  bh=rP+OTQMf43eimyCn/J1FIcXEUv5NiuIKo5JmSDOvvb0=;
  b=E8dwXjgt9ZLPT3r8qlYvcQO4/VJCKtPGPRSta0E1lds7UlUu62PRmTFn
   r4h18XOcF8rVS1uiEKrHjOcDCGDS/f6cGm/H/u1S72o99ouBVKou8bKsa
   Ty1wmiihQ9tMjn/YAYxYqeph/fk8aMYq+3YRaEMAGuokmBkUVkbAbnhLQ
   rN9gJl81gSIU3t1kyYwC00RTxyvfAYc+HQ1URcsUdJopPPPbdApy5L2Cv
   TycZFfB8RnJCWfokyHUBe93dw2o3AsMtf4eq+f4lQxcMACLv7yke0JZCZ
   5Zc2fJ67F0EvTLD+9qigSoPoq2DZw8zF+SQBJK5u/OrwWkD4PlhvUF1Ys
   g==;
X-CSE-ConnectionGUID: wQ0d7I/AQXex+28yLPF8bg==
X-CSE-MsgGUID: /Emden16T/y4DjxBO8sVKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77785982"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="77785982"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 11:16:11 -0800
X-CSE-ConnectionGUID: 0CRKpqEVSgWF/tp8RGRnXg==
X-CSE-MsgGUID: EOiM2mH8RFGIU9ZpTMjyHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="193822222"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Nov 2025 11:16:11 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPQQS-000000002NZ-3YeK
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 19:16:08 +0000
Date: Sat, 29 Nov 2025 20:15:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sj:damon/next 101/107] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'is'
Message-ID: <202511292013.OgSrTVBA-lkp@intel.com>
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
head:   dc85bee8bbc5346521716cf1f469e403af219179
commit: 5e3fefed6d95bbe0b2505ad80309debcf09bc439 [101/107] mm/damon: add data structures for access check control
:::::: branch date: 2 hours ago
:::::: commit date: 23 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511292013.OgSrTVBA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#45: FILE: include/linux/damon.h:862:
+ * @matching:	Whether is is for condition-matching reports.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
