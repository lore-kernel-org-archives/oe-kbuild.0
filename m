Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3A2224245
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 13:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817217; cv=none; b=RdMDwVCgJ5lWKws0LI2FKwXNNuXdBzJXGzvDZqBdjFaMHPtuOTCjBtzNI0RKXkKmwypa/1epof/uxipEsLhUOvePEaRe6FpvBEKBtK7utzL2f+7YX/x/vSmYnXyebb28EEncHJCsPU5eaFWBazYEtyO5aPcDLGopc5xqOakg5CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817217; c=relaxed/simple;
	bh=va7ApgRSvml9t3IFfZRtFF3ybqy0giFoaSORzfxfeE0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=diNxDYasMXDmixzqGYmCH8ACZRtYSGxZu9rmD91iKbGllURHaM3JKYnDoRrZDAptBP+0kwhq15ZzA3Q37PAp/5XMmPOFz6P6FDZ19haViv1ezzBdAWZJMBuzK1Y36dPwsXPQF5B3lGmJJVwsr3YncLJgg6a4UWdKMDfM+4CMJu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXfAIm2S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXfAIm2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763817215; x=1795353215;
  h=date:from:to:subject:message-id:mime-version;
  bh=va7ApgRSvml9t3IFfZRtFF3ybqy0giFoaSORzfxfeE0=;
  b=NXfAIm2SaCGuKL8WABi57eqmNCzxLwS5UC7aFIyNrB/fuYJvuhLCqo8C
   f+zvw2NvxzJahQHvMwE3MRYlawexlx43aH+epcvJYF/6aXGr/3OjglFNx
   qiTzYpq6Z0C/KF/2Ugoi/TYV1ZzRiadRRTi8kdGXit1cYu1P3PRJ9isv4
   KPh0LZGY3NRQ8I5W2lTRykrRcL6YM+2T9EnCTBJNUMII3z2RNFhuGZZbz
   DwCRGsMFUDr4p6vtE0bbDEa0jPcxvnxLlHPH+3JVhN0MjDNKLPqFsVh3S
   CpBlOkqT/2Y+gEli3etI2izdizr365V+SpfkQcHFF0KD6f9c8HrtiHZoO
   g==;
X-CSE-ConnectionGUID: sIsSC2uGQRexsK9WqNFHaA==
X-CSE-MsgGUID: KEvuovvkSxW47EotHbqdDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69746568"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="69746568"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:13:35 -0800
X-CSE-ConnectionGUID: JJIy8j2EQmyzoX4+HgVBRA==
X-CSE-MsgGUID: Uw25S2aZQRqdKKrO5mNoPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="229221821"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Nov 2025 05:13:34 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMnQh-0000000028p-3Pg9
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 13:13:31 +0000
Date: Sat, 22 Nov 2025 14:12:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-jumbo 7/124] checkpatch: WARNING:BRACES:
 braces {} are not necessary for any arm of this statement
Message-ID: <202511221428.GkRAKknO-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-jumbo
head:   75dad9228908d3efbf1d989ac0a93cc0a7ef84de
commit: e5b83c8df237ebcb1c923771b9ae31b7cc27dc92 [7/124] add mtd-rw driver
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511221428.GkRAKknO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221428.GkRAKknO-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#553: FILE: drivers/mtd/mtdrw/mtd-rw.c:94:
+		if (!err) {
[...]
+		} else if (err == -ENODEV) {
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
