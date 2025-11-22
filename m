Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E482BE5E
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 21:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763848063; cv=none; b=LrS/qqQviyMcQqTUQQilqeX4CNa/iTg237iHauh6N1p+PtOo9Kv8CDNLsT1WqLtTTdnQcooVFtoyiOeZZ3EL0hUFKb01g/5fjKgccHedTS90FzdaleuJBQ4ho+wIEaH59O78WFDTPXLpb1HETVxfbtjHA92ACGpt/S2a9Tbr+9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763848063; c=relaxed/simple;
	bh=cpKyXHEZ7gvjHdWHbo0ahvHgQsb1TFh7UFoS/pfAHY8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJe/7C9RXObz60tMnG01f3Jl8QegK4b/u8/HRD7tN1u5djUYXL0GeFpZtNF83m1DTn+7gzqT+Rwg3sYQ/nvnkv+UcNG/CSUlyqCBUV8NFDtmRSGzRmrTzfXakZOiN99ZqOMew9yoCNYWR1iFfxoC+/HJEGCsh62vpb3Wi632En8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLxUMs7p; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLxUMs7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763848062; x=1795384062;
  h=date:from:to:subject:message-id:mime-version;
  bh=cpKyXHEZ7gvjHdWHbo0ahvHgQsb1TFh7UFoS/pfAHY8=;
  b=jLxUMs7p2nj633z+qmfRJnvrccmDmz7uCWrpWP/LycFxBbHnlDTRTDA/
   rl/51v4fPDLU3ETjAsvdXeehl8YLXOlV4oiwaEX0Igld1WHFcmuSrRWjF
   Krn2SC6LNpVyTxmTzNgooHmN1ivtdHtnLZ2wX+3MfKgnSsmUujVoq0dDZ
   T2VVgj61BdJbrwQufomM6hhxLuJ8Kj0vadnfmytH2Ni7fBRAXdwdIPmIL
   QEPVh/9mBpodlgR9DyQICO8nXPwa4hCm7co8+qXaMEF5rSPr/d8Kr2gr7
   Oft5Is4A0B2s8bwAkcgQnZaK0xi8Iko/Lz99CXQk3byWUuX5FHVicFVbF
   A==;
X-CSE-ConnectionGUID: CwSpJ7MUSFCVBSYvO8sOHg==
X-CSE-MsgGUID: GgHYBHQbQVCMmJtZvxbLYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65787809"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65787809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 13:47:42 -0800
X-CSE-ConnectionGUID: +4Vjvk0wQKW2wTMO5slB2A==
X-CSE-MsgGUID: C069648MQReUHcHKwcT0lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="222619188"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Nov 2025 13:47:40 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMvSE-000000002FB-1hoy
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 21:47:38 +0000
Date: Sat, 22 Nov 2025 22:47:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:2724853925-qq-com/input-touchscreen-Add-ilitek-touchscreen-driver-support/20251116-215220
 1/1] checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align
 the * on each line
Message-ID: <202511222224.eG7rLdyw-lkp@intel.com>
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
TO: weisicheng <2724853925@qq.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/2724853925-qq-com/input-touchscreen-Add-ilitek-touchscreen-driver-support/20251116-215220
head:   0458c09b79ce0e1e0f8e6cdddb494562aff9035d
commit: 0458c09b79ce0e1e0f8e6cdddb494562aff9035d [1/1] input: touchscreen: Add ilitek touchscreen driver support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511222224.eG7rLdyw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511222224.eG7rLdyw-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4966: FILE: drivers/input/touchscreen/ilitek/ilitek_protocol.c:604:
+		/*
+		* for no-INT-ack flow, add delay to prevent

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#7416: FILE: drivers/input/touchscreen/ilitek/ilitek_protocol.c:3054:
+			mp_result("Key Raw Test", _mp->station[i].key_test);;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#7488: FILE: drivers/input/touchscreen/ilitek/ilitek_protocol.c:3126:
+		mp_result("Key Raw Test", mp->station[i].key_test);;

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#9607: FILE: drivers/input/touchscreen/ilitek/ilitek_tool.c:128:
+			if (buffer[3] == 0) {
[...]
+			} else if (buffer[3] == 1) {
[...]

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#12216: FILE: drivers/input/touchscreen/ilitek/ilitek_update.c:1301:
+	/*
+	* Update AP code forcely if AP crc/checksum not match or

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
