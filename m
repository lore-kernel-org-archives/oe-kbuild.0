Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE22F36AB6F
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 23:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769903842; cv=none; b=Yztl5BD4dkVU02nTzSofl9ds1ndWPj1qbPTsaJ9eO8AJ95tYup1P/5SUgw2klr4BAvHUYU/JUmDBDLvrNbknQBAVH+XisipjAvK28T4HciLFHjpdM6YhMEetdDIhnC7DWfk3gIwWI/WM/u/kg2iQnQPmJX7xYI9N3FnZaltzfTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769903842; c=relaxed/simple;
	bh=4nZuxzUJHcVOxHzIFzAKuwr0Oh0cwMdA97e58mc9oJA=;
	h=Date:From:To:Subject:Message-ID; b=LR+wQtN2AjvQqPIZ1BC14sJJOwCQEejp0d3IwOPojBIXV/6jSQLO67/u1iSQ4eqJ+ruMu4Yy3sjHUTtV30oOPBhh/ozl0IFilBUv1BGRj/D0OcUywhJKARgDce8VSuC3Wis0keiyro7hnRN7LynKGSao0AazmA64gKj5hIFP6e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeTGqLV1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeTGqLV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769903841; x=1801439841;
  h=date:from:to:subject:message-id;
  bh=4nZuxzUJHcVOxHzIFzAKuwr0Oh0cwMdA97e58mc9oJA=;
  b=jeTGqLV1SW2JDUxyuEE6Rz05fZ/Yi1Dj9YQZELqNozgQJFHOIBQs43iK
   fK6PLDKj9dZ6xv2TYJO8KPPg42TPDiGsCTs0JHntFfOnPXdI2AXoch0QS
   8MQZnGy9koti19OMvKqiaUHvShRRESPCeUh596li6YmTB2fZ/HBxPD3zC
   +u73JadmagMY7LrYAFGUrbxzCxRhol9Spt5xvltoDPb9b9qSqscs+EQ9X
   4ukhFf3h3R0RFdnIdZEYALs2EOBt/RtU683ssht3dHHPU6dIP+V0sp9b4
   rJS8DMp5Jb0ZBS4oN9SsIOUzYKUcgmX5FnqnPL6VLU/VBjWkI2Bhs5Zxi
   w==;
X-CSE-ConnectionGUID: 74tHQLXAQl+r3TMwS7WjYg==
X-CSE-MsgGUID: UAoyWkKlTEajktI/pRrw8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="82481463"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="82481463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 15:57:20 -0800
X-CSE-ConnectionGUID: 9KE1JoPeQlmGEMaYRYiMvA==
X-CSE-MsgGUID: 9J8Xxl1vRwyFY0C84CnLRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="240426864"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2026 15:57:19 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmKq5-000000002mh-2U79
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 23:57:17 +0000
Date: Sun, 01 Feb 2026 00:56:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 25/295] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202602010028.kN9a4e9V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   cf5d0c72be97c816cab62b53688284b64ac7a10e
commit: 3c521b23e9879374d37af70c369f6b01a9d638af [25/295] bcachefs: Plumb zstd error codes to bch_err
:::::: branch date: 44 minutes ago
:::::: commit date: 6 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260201/202602010028.kN9a4e9V-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#26: FILE: fs/bcachefs/errcode.c:92:
+	switch (err) {
[...]
+		default:		return BCH_ERR_ZSTD_error_unknown;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
