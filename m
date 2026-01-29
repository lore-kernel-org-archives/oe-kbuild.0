Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A948327B357
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 04:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769661535; cv=none; b=YACDU3JILvUAvEFouX0RldavOr0dKCEwmEulJVlJDdQ4ltBydYIUxouaxap0CNiexHpxf6pA/4g/7UtsWQXpgO5OS76Zi6acgIjiaj09exOMCHvGlFIbveKbo9yet+X/TlAP78GK+yiOs61YTpNV6LebP1yoruD0FI7G0aj860c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769661535; c=relaxed/simple;
	bh=KmnYsfiUVQRNsa3ahE6f2SczFrGEJl3YSk5M5bdfxGk=;
	h=Date:From:To:Subject:Message-ID; b=BWTav542rvu4jACfhTjStBzSXoBE7MxPIp1e08nIjHTExMZ2aZK2MFN0ZIodqAX6lvXrgxsUYPeW5LZnJ8+KvIdAD2Nm1lcQYK4l4W+OTWegYd6vxNAP9k+SpWBC4oS18KrO0F5/XxVmOZAKGgsDQ8DJLEL1czgC3FmJGL2s/hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGeiqFPt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGeiqFPt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769661533; x=1801197533;
  h=date:from:to:subject:message-id;
  bh=KmnYsfiUVQRNsa3ahE6f2SczFrGEJl3YSk5M5bdfxGk=;
  b=SGeiqFPtKjw7GaO5c4fbK3rbrA10lnGw2K2saNK8/MaDFwYDUq5lKmn8
   FYu65TdgZoerf74XVorc3hcUfOa++UaDdLOV0fukGZc6s48sxjbntHa7D
   7ey8plZ9lvlMfxwDvlizOnC1Y5tYFt95svIzozSDX9SZx+5fXiU+QCp1K
   sQBUE9yRzn8A4rFloCJdK6nbvI4daApsmkBky+UTkeNRoHXihL/sIypS7
   ES0JpGDpEyYOuwBk/CYhpQ4yK+gKUWB5EpeE5tO47SnqIDy252HZzFWeb
   qxxpJwRJa/RcTpG4h2HDn1wh0NN0J++c6N27j6pl/AMuGbZFATLCURAFb
   A==;
X-CSE-ConnectionGUID: k4mpXfeDRn6hlGEWep/kSg==
X-CSE-MsgGUID: 4pQ3FKFbRiCMBpEBtbuXxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70792434"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70792434"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:38:53 -0800
X-CSE-ConnectionGUID: zaNF2ZnWQcylhe0pi4mCUA==
X-CSE-MsgGUID: +xVP4U1KQ9WOi3yYTzRZFA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Jan 2026 20:38:52 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJnu-000000002CT-3DfD
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 04:38:50 +0000
Date: Thu, 29 Jan 2026 05:37:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 26/39] checkpatch: ERROR:SPACING:
 space required before that '&' (ctx:OxV)
Message-ID: <202601290526.y4Mu4a1a-lkp@intel.com>
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
TO: Richard Kuo <rkuo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   64417972b86f5eb0d4a466436b1fb43da5692dd6
commit: 9c7f9f757ab66a3f95c2797d143843cd529508a0 [26/39] hexagon: add memory management enhancements
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290526.y4Mu4a1a-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before that '&' (ctx:OxV)
#329: FILE: arch/hexagon/mm/init.c:156:
+	if (test_bit(BAD_BIT,&start))
 	                     ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
