Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A94D1A683B
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 20:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772743551; cv=none; b=GRRTy2w59JR9nycTtsCAHzZH01WAugJ55gilmOr+xND2Xljxw/Wm+910nmRSC0CN7V6oUGPtEAwlcKPEuXTcxuwZTMaaXAphU+7ibajENhc0xGl2hAGibhoITyI6a6aMtKNyzq32RcFBVmdafFZYumTt2KDs6+Gn0xuy0lxaPNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772743551; c=relaxed/simple;
	bh=yRUAq7e/z/5D8xKVgUT7qWKe1U/uj0IAPDO6pbmNLAA=;
	h=Date:From:To:Subject:Message-ID; b=OiuNW7ny6xLqDnbMtni/Gkda3WhnOzGEEdqEtg/jPUObqlO1PKB+6GLl9OeYZ0WZCu+aWb0w83FFpRDicSNCCFr93WJeBMhosacUlQHoxgb5aEQfZqAg3rVkLcgW2x2DaOdNfobvxlJUUDgAXyyProTrZq23bJEqOt1ywDXi8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mw9ejmNN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mw9ejmNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772743550; x=1804279550;
  h=date:from:to:subject:message-id;
  bh=yRUAq7e/z/5D8xKVgUT7qWKe1U/uj0IAPDO6pbmNLAA=;
  b=Mw9ejmNNBIhHIb4kZq+kWHLuRR3o8JqymqOQpyWPwIXQnpHfYKZy1XYu
   iVvXcE8HNvU5AcxG+eeQ7w+ussTUOZuSItSrP3ovbOV4VtjmPmYmIA+xl
   VMx2JZQ4eFh7Uq+oi56ux+rCWHg0rVkMMWrR+E0P1Mazdxfmu5ogmCEpL
   smGffTh8xGJvB8oAVcgLLOQSsc0MwKeQ0DIROV7cvtMT8akFBeaQggVzM
   4J8GU6fQrw7ofR08Qz1sICKosB5ADXbfP3kdisGc9T844Gm8nLbCJoNSf
   gAd4REuHVJKoZX7vU1JFPkklDwyMUYpCgnA1lmtidnkT3v4WH0EmZlVAh
   A==;
X-CSE-ConnectionGUID: DAAQZweeQjOKbzx/u/a1IQ==
X-CSE-MsgGUID: 7UcLk7PDTIO2vuUc7i4U4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73966797"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73966797"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 12:45:48 -0800
X-CSE-ConnectionGUID: JpB+o5WjTOaIMZpL96m0jg==
X-CSE-MsgGUID: Z6DkvfzuSOSNr+EVx7NtYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223756910"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2026 12:45:48 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyFZp-0000000024H-1Rkb
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 20:45:45 +0000
Date: Thu, 05 Mar 2026 21:45:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [conor:tsu 10/10] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'represents'
Message-ID: <202603052121.L749CEld-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tsu
head:   e1cdba35f361ac3beb2895f66ee8cf4de8bd1699
commit: e1cdba35f361ac3beb2895f66ee8cf4de8bd1699 [10/10] net: macb: rework usrio refclk selection code
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603052121.L749CEld-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'represents'
#27: 
Change the capability flag so that it actually represents represents

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
