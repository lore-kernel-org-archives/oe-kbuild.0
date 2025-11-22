Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6854219E8
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817397; cv=none; b=Gy43LIOQfZ+0q45yd8Al3Kh04GPT6HdHL1Hsucm46zTI15mprWfjCKMq9f/fsP3ss5G9T09yjuY6VIV2sUCHCALWq0cqz/WpgJF9UzcI3+0ERoU6XO0iscgRH+intrBsB8gAU/oFNhAMsOZUEZEVTuIHRoQ62O2lR4WWHKxpHX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817397; c=relaxed/simple;
	bh=eAfEt/+AwUNZl/xab5bSN2iNO37AljQbux9w56ORQvM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HEDRZmh79uAbRcCVdAiWLgD1BgHuhGkS9z2vpIn1B8zQ09Lo3bBLTLU+jir8Md9V/f8atNIwsfaIqLKkm28uvdAAjG5arFZhqxNTuEmOQaKhd7CsU8/EHVgqGm1kCC5UZ4+55ZDDBOawaalsvLIS6pzQo8bm0hdp3OkCyHAX+aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l8ZGwHmB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l8ZGwHmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763817396; x=1795353396;
  h=date:from:to:subject:message-id:mime-version;
  bh=eAfEt/+AwUNZl/xab5bSN2iNO37AljQbux9w56ORQvM=;
  b=l8ZGwHmBR6LPBVYSiK66cAI/hd5zTgEINRg5/Zoww/v4PGs9QbRi6D4G
   0c6epOQ9QZ6FC+up79iwTR7Nml+fAQEooCh39kjoE6jd1KoR92tCDjnKm
   q/uE25+E0lqIi5pnrv4W4ejsKW5TkDonSBrlUjYCzehQPW6pW0D3SGtu8
   WC90Qo3wKz7sC6fZDr5Zqm/Cn5aEFibLoFjMqKe04dIfnrtr1c5PJ8529
   f4q4Ko8SGMrexlQzwLUrgT9//a88ueafsMbTIIWoPNqrieOlbcg7MA0dI
   csBnXsaoFeI1k7tqvAlsR3rhzG42d/r66w3gUaLjjsQj3Su77IWbefQlU
   w==;
X-CSE-ConnectionGUID: smsOeQH6QuGvhuSe27uYbA==
X-CSE-MsgGUID: zxuIva8/Q3uUTyI8ONYY6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65840867"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="65840867"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:16:35 -0800
X-CSE-ConnectionGUID: di/6RvHZRqCX6k/OUc6d/w==
X-CSE-MsgGUID: JG/hviX1R/CLs7kb6jTaEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="215277451"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2025 05:16:34 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMnTc-0000000029N-0YwB
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 13:16:32 +0000
Date: Sat, 22 Nov 2025 14:15:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-jumbo 47/124] checkpatch: WARNING:SPACING:
 space prohibited between function name and open parenthesis '('
Message-ID: <202511221422.gpEodoN4-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-jumbo
head:   75dad9228908d3efbf1d989ac0a93cc0a7ef84de
commit: 17c84e96b19afd71792fc43ac712df31e69b2fb5 [47/124] net: dsa: add tag formats for MaxLinear switches
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511221422.gpEodoN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221422.gpEodoN4-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#355: FILE: net/dsa/tag_mxl862xx_8021q.c:56:
+#if (LINUX_VERSION_CODE < KERNEL_VERSION (5, 14, 0))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
