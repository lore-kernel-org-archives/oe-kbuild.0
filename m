Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07F431A564
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069299; cv=none; b=XDVgQtHKHdKCx7mSZoCAepRlox1WVx2xnrBCN0jVFGmVmSAPYduHLKrAdlTW/cFpnwxBNfDfOTX0NfNHpIKIY6vvl5EEzi5CeXP3bOZP6/32Y5j4g9JLdeZQJqf6fzGCP41DBxcOTLQ8RoXGyKd1Wrgspsg/iEceaNxKjRNM1Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069299; c=relaxed/simple;
	bh=XU3eCHuRl+EUNjnbvVKFcEELomgThGUddkUCUtNdZpQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LBORnJZYasretLjweYm+uRhI/1u66ASnRkXNDeP4IWZ5WUapqxIL2LFLkpL3pxShMsMwAMzhS2U9oAmCR+RaazUg4k5vaqovBD1ecW7Y/uXLL0g8fGIngettaYanPL0OdLj9uRTTkvPKmhtRA8FvOFdTmLVRP8OOPTgjdj9Tyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mdq5q6/Z; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mdq5q6/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069298; x=1794605298;
  h=date:from:to:subject:message-id:mime-version;
  bh=XU3eCHuRl+EUNjnbvVKFcEELomgThGUddkUCUtNdZpQ=;
  b=Mdq5q6/ZdeA4PQ4de3MIbxSsuOVOkVas8eNjchdKc8hWtZrt1owCCVzu
   WtDOqXUEuSoZLXRQzur8v0rQ274ZKjM9NpA2bLzBnI6ye/Igk9lh46eG/
   QaEFMfGJCmSrvweOdPO5sl0XvP5QcCidtAlbBBP+yBlW45WiGo60Ej01E
   5Mmh8YxSHtNWPCR8QQrg2ybxrg9JIfgMI1Ftn9CR6T2xsfTZZfsqD7DnR
   yqEG2IMTV+LNzaPi29F1Q0RBtUgZTHx3NtJ/G9wSw0TJUqar60FaJ8tD3
   GPcE9PP9wvlFUEPcf91XE2pEUcLnoHLq3uaFOl8OOiCtYEBmm8HLOsDvX
   A==;
X-CSE-ConnectionGUID: aXJ+WchCSWWX5Jok4EzHCg==
X-CSE-MsgGUID: 4RKt1TicQs6QoFH9K0Dryw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637513"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637513"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:28:17 -0800
X-CSE-ConnectionGUID: RLM9u/uyQ1K1QrKn05qAAQ==
X-CSE-MsgGUID: MjlT5uJJR0GN0y9bVn6gIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190035928"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 13:28:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJerW-0000000019p-1MEY
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:28:14 +0000
Date: Thu, 13 Nov 2025 22:27:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 502/867] checkpatch:
 WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or
 return
Message-ID: <202511131928.6tdwIZaC-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 5aad10f0e2edf84c7abbeaf12dc1e32d9185b14d [502/867] bcachefs: split out vfs/fiemap.c
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131928.6tdwIZaC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131928.6tdwIZaC-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#109: FILE: fs/bcachefs/vfs/fiemap.c:76:
+		return 0;
+	} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
