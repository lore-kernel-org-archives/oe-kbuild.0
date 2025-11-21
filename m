Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF303370EE
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763721371; cv=none; b=PlgYGIc+7zInjMS/lIgn7blMjD2Kva13ymSZ9VIh/bntBDHSulTpLaXVH6a//yd9xq3JBO6KEwoKaU8EN6SV6lnbkVzfRSGu0rWsHxBbNTdm8MAtJliKv6WzFT+SMQYoDkujgAuaEIhUzp8NhIpX5+XpWoJO82PsGf2WWXDFSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763721371; c=relaxed/simple;
	bh=Q69U0T+lV1NLO2VI7xK7QMbwS0CKSjK9War6f7BhvHw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SKrkvi+RX+lvN6dAwoPjKiHBPLBLhSMytB4Ns8yUD/qJdj6yb+XzvOzBum4UlGTn+ql3XVFf57taozB9nLqCKLViwK5Htd6BOfJOo397JAW5tytbPdZL4FEyle9CuERwBv8Iy3FoWocGjPuvHdnKJMd1w5Ts3AFUhUjenHa9pbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sz8j4AbC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sz8j4AbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763721371; x=1795257371;
  h=date:from:to:subject:message-id:mime-version;
  bh=Q69U0T+lV1NLO2VI7xK7QMbwS0CKSjK9War6f7BhvHw=;
  b=Sz8j4AbCJPB8AaK12zSfnJ2P2/SH/UUAnlN0oNZmNDRDbjxNP067o29y
   6raCpZMHB+y3/2V95npXpNiZHmHjd8PWZhmds0vOLyI0P1pGBDfJdmU+E
   jCEJXeV/1Lgehd4gKdOSdIdaisCGP05bHmvM5kxNDVhydmgWL0rE/Zn5C
   EJwxYjlxijM7Bm8L7E5JXC6P5uM9BmPaqzkbi67CEw+vwFXiDTcG3JojC
   zyP9+jEiRuyRluUfbsvdRxkavaUu0+q6ciJb6a+t2ItICcg+uqeNKl7sf
   IYTsuNE1a0P18zcO9/8DNbGKIyZZM0qe9Za5g3Z6FZJhSSIpq9Kmc/zeZ
   Q==;
X-CSE-ConnectionGUID: r8GhhZgJSjC6bJIhg9faZA==
X-CSE-MsgGUID: 6hhvwN9pRlKkhJx0ThDiOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69425338"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="69425338"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 02:36:10 -0800
X-CSE-ConnectionGUID: /GUReuWXRm6zoGiPnEbpZQ==
X-CSE-MsgGUID: RPUOfelARy2acNi0nXS/OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="191908715"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2025 02:36:09 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMOUo-000000001kX-3sZO
	for oe-kbuild@lists.linux.dev;
	Fri, 21 Nov 2025 10:36:06 +0000
Date: Fri, 21 Nov 2025 11:35:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [trace:trace/for-next 1/28] checkpatch: WARNING:BRACES: braces {}
 are not necessary for any arm of this statement
Message-ID: <202511211103.oGZHW13W-lkp@intel.com>
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
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   bc089c47250e8923892873809471e54e05919d80
commit: a9f16872642203761e0b6fa7c25ca4e286ab5083 [1/28] tracing: Make trace_user_fault_read() exposed to rest of tracing
:::::: branch date: 7 days ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251121/202511211103.oGZHW13W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511211103.oGZHW13W-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#361: FILE: kernel/trace/trace.c:7486:
+		if (copy_func) {
[...]
+		} else {
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
