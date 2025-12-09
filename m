Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BC31E7C18
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310413; cv=none; b=JLd/M9+fHVEJUrMTAUoziXUZU9PKJb/Og+Dl0nFvuuLIa23K1MEDTM3vS8YVgMDq3bWdozjhzdTw1OCICobK/xYL43USaf2FtbMtKWBGspMxce/XFpNIieMzT6CPuai9Pk9uE4PiV5cahvZv2SvO4XpeK5axgsb0Cp3UNaTWILE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310413; c=relaxed/simple;
	bh=9EY0GLPj/BdWvcDFBIVzYji7KBnJQ/nxKC3aPTlaEcA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEE8owb6u8PJAGMJPoL8Gui21+UFVS24lVl5XQYhgYLevG9DDZc0zVfQCu1x+J+sx41+zGeUv5PBde1B+xCxIl8IPVKSyEAitXsBleXJu6MkW45xKAJnIxyiE0wUnnpzPsnuLx79kA+Vh3/3UjjD0o2aVDIvDQBfuoxerthx5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBu9bMHB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBu9bMHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765310412; x=1796846412;
  h=date:from:to:subject:message-id:mime-version;
  bh=9EY0GLPj/BdWvcDFBIVzYji7KBnJQ/nxKC3aPTlaEcA=;
  b=jBu9bMHBG1ZIjdIpGoZ8oPl69BKCKdq9kaTHh3nzrqglWGgTuq7IfQZ4
   /AsXl7EsnPpnx2tBbGXLtXsNkjqcGj5+w/aujqSHe1cTcHCGqUMI5l+uj
   nGhvo1kqYHV/WzPleE9YwslhDmT+I4Au1cguQxSqqCnf6FYSge4sKPxh1
   DlTyoRIYLJB50oFpj+FdaXVKbAivig8M48HfFc6GtNB59aBl7Yy8/QRwc
   Xqq+dumvHNQPDNFQg03iPUKXzQaJFYFsV+iSAeXGt6Iie/2C4pNswCa51
   AdjKNgudQ9YGyofedsN9ofquLbUIoffGpCjuR9OHAAzsRIWZEgLt5veib
   g==;
X-CSE-ConnectionGUID: nb8v4qoVSnitnxNfxKeYcw==
X-CSE-MsgGUID: z2VFgy6FQ7u5rWrrESmFsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67207103"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67207103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 12:00:12 -0800
X-CSE-ConnectionGUID: Onu5VHyCToyssKtYU9ULrA==
X-CSE-MsgGUID: hAPe/x/eQnGsaYlbyNcRcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="200486094"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Dec 2025 12:00:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT3sX-000000000MP-07Wl
	for oe-kbuild@lists.linux.dev;
	Tue, 09 Dec 2025 20:00:09 +0000
Date: Tue, 9 Dec 2025 20:59:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:david-laight-linux-gmail-com/nfp-Call-FIELD_PREP-in-NFP_ETH_SET_BIT_CONFIG-wrapper/20251209-181248
 9/9] checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'the'
Message-ID: <202512092051.fcwcwNVs-lkp@intel.com>
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
TO: David Laight <david.laight.linux@gmail.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/david-laight-linux-gmail-com/nfp-Call-FIELD_PREP-in-NFP_ETH_SET_BIT_CONFIG-wrapper/20251209-181248
head:   efbce809c88e2a5a0da38be3de5037615fe60f0a
commit: efbce809c88e2a5a0da38be3de5037615fe60f0a [9/9] bitfield: Update comments for le/be functions
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092051.fcwcwNVs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#6: 
Make it clear the the values are converted to host order before

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
