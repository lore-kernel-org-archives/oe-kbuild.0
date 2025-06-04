Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F132F339A1
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Jun 2025 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749054434; cv=none; b=UHZGme6Hfj8kh9eYi/qao3D2bu6iuAwr24VWkAlj3yN4PiBjwAb48nZ1Pj8Iq+oMcXXQLNFd5NC6qVVR6Jdidlh1OeS3g3BYN1eATh+Z7Uq7kkN8bFWWJ7LlHneKfGiPDzEo3Q8bmZ0jj2NayTV+FbNfYD94jpkzm4qrTtOMAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749054434; c=relaxed/simple;
	bh=yfmBdPok+AR5r4+N7cM/hlx9PEWUUyOtOHw+dc7yKCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQU8kxtGdlFUdnBWVXpQslKo1VvVn4gip7e8tyn54mJwLJkMDiEx4IBSSZlbxRgoK9cIoYX1aObpDaJWSimxJzkKCOvWjv56Af3nMmqRLZYQuPGo8jXggFKFRU4h1dKxopkwDHdX7yooiHB1ODxRUmBMLFxq2HT1VDYODxvNzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4ogBcBE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4ogBcBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749054433; x=1780590433;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yfmBdPok+AR5r4+N7cM/hlx9PEWUUyOtOHw+dc7yKCQ=;
  b=P4ogBcBEPMoU+phFuTb06KFtudL9YrMdAJtXZzAENzRElfFf+uGYl1yq
   Q7D7sK8uEZtq6mKq48UL76x6IFKmg0QZVxQAeHnE6TgngljoQgWk0HaXH
   c77R9rNR1Y3UMDUG91sckBYOSVAySdHBcINKE8ECc2G2lRclRNG3BEx3e
   WJwgDuqiFmR2n7RtQ4DTHpQSLmDgDFAGjZ7flsCsxh9vy0+0u4ZQxx53v
   VzT6kaodhoI/GG8Ribn/Fa9dT28VWY27nQH52ZzbCztpx+xslRPLy4cj/
   vgooLAUAOSImZlkbozDOy8IlG8RWtTS5HkEBipN1dYg4C4TVaP0VS1OEG
   g==;
X-CSE-ConnectionGUID: V5nXqK5WSS6aWky0CS2vlg==
X-CSE-MsgGUID: dSwuAd/ZQaeWWrHa1cxm5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68701684"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="68701684"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 09:27:12 -0700
X-CSE-ConnectionGUID: gz0V462cToiZ5qXO67fMfg==
X-CSE-MsgGUID: CiwvtQOgTDSS7/rQroos+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="150513044"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2025 09:27:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMqxI-0003JJ-2C;
	Wed, 04 Jun 2025 16:27:08 +0000
Date: Thu, 5 Jun 2025 00:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-ptp 25/34] ld: cannot find
 loongarch64-linux-gcc:: No such file or directory
Message-ID: <202506050031.XC2lJsg1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-ptp
head:   07453cfef5683be5805a70316b1345e7fbeb716b
commit: e844e7134d3f49799bf7a762d2870dfc9b228bfa [25/34] libgcc
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: loongarch-randconfig-002-20250604 (https://download.01.org/0day-ci/archive/20250605/202506050031.XC2lJsg1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050031.XC2lJsg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506050031.XC2lJsg1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: cannot find loongarch64-linux-gcc:: No such file or directory
>> ld: cannot find note:: No such file or directory
>> ld: cannot find ABI: No such file or directory
>> ld: cannot find lp64s: No such file or directory
>> ld: cannot find is: No such file or directory
>> ld: cannot find not: No such file or directory
>> ld: cannot find enabled: No such file or directory
>> ld: cannot find at: No such file or directory
>> ld: cannot find configure-time,: No such file or directory
>> ld: cannot find the: No such file or directory
>> ld: cannot find linker: No such file or directory
>> ld: cannot find might: No such file or directory
>> ld: cannot find report: No such file or directory
>> ld: cannot find an: No such file or directory
>> ld: cannot find error: No such file or directory
>> ld: cannot find loongarch64-linux-gcc:: No such file or directory
>> ld: cannot find note:: No such file or directory
>> ld: cannot find ABI: No such file or directory
>> ld: cannot find with: No such file or directory
>> ld: cannot find startfiles:: No such file or directory
   ld: cannot find lp64d: No such file or directory
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
