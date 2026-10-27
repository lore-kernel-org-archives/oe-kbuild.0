Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104327;
	b=P+tS1ZF6lwVpjw87IOTElf7KBcI/qZ0WymZo0SXlLCCmF7/5z3l/iMKi6XrMX+4GpCsA
	 49iqkh2N4FDbLDjaZsCigAgR+IaPi9XEeKPXcBv2bn5Ol7w5XRjgZ3ET7Yfr0903tWION
	 0mA9ZONdc1M0bh1QvB5tOjp4Dzu5mi3aYuJApk32OUy1AJFfPl/BX87+AOzvY8y5UWDfs
	 3SXgB88eVPWOb5aUs7MyyXdy7uNflEhWGelc3h6Sr3Nsp+/X6povz+OsmMe+cgWqOWIXn
	 W6/+pJmgg2zmNs5R/mEMGFGWYqlHQpvnHj4axvzecvGq3eAzyx2g75F0fK2+t+AYP5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104327;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SBG2eqT9F23Bc3diDKOfJ6ACDd7MwkKGK2wsCWUO3qg=;
	b=zHPvS1ueD15rCauK/TOPy/qREQTnrad1rJ2JMxB3oJxdzKqRIbL46i1oOvmFTAjT6Oxb
	 JwJFuKrgF9QL3Z5kaUEcTr99OOpvnPe5f0THHwdyZo5wCbMUzLXwLc71gXRq0xW/LqPPQ
	 vWnwZnsnC7Iq82sxzzfD3E7Z7v+H7ocElvEavCavbaEFqt0wvZeyr7iMhydMByIWzoiYQ
	 YibQMMo0znvB1/gEtcZMjgOMI4eh/v3agL7wA2pgV4ECnQy+ue04w73GXVdWp7uwCVVRx
	 C4VyRo2Iml0JtyJ/EaOIEoilhzdepdQ78FdBOEjUV+IiPakzykDHCG4oAku9U7m2fIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dB66vSjE;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD369606B249
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Oct 2026 12:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD369606B249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dB66vSjE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793104327; x=1824640327;
  h=date:from:to:cc:subject:message-id;
  bh=4G1/Wg1YsAuBVbcY+CDdqqfYE/RnYOrd8h2yWwKIi0M=;
  b=dB66vSjEAnDRyZig7cKl4UvD9kv3GV+3d8B3CMp/5kJKM+RG0auUKwhQ
   RxCLI88pm+fw+k4jWpe7XPFqley7d2SzVi9+JMrVzqjzJ36kA6CUn6ynD
   dyrIhl1K/hkXigvWT7wLYtM6siBS7EhpI9r2srudLCd3FhygErMuMb/IH
   AjfCtiLNgmOted+noZXytRGcOutYIsHFLshm9/FW60PC3Zx6OIx+9X2Mt
   wVxhx4X2YxlDy+lAwRHoUbs/XSC+dPX6nMgkzUoKrt7cFcjrTbO18eec0
   WMcM90skGYAOuSt0MdNRmX05ytPHvTkGwYYR4pbzBdlumhwNrZNcPRVv7
   w==;
X-CSE-ConnectionGUID: sIEMozkBQLCdIZ0b9LOVaQ==
X-CSE-MsgGUID: sBcCnPC/S8C6cz0fiKRhiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1831754"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1831754"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 05:32:06 -0700
X-CSE-ConnectionGUID: d+wwVcSuSGer7Atdk36RPA==
X-CSE-MsgGUID: p82P+s7xSeKJL+tfy+Oj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6376756"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 27 Oct 2026 05:32:06 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLgLT-000000004Vj-21jZ;
	Tue, 27 Oct 2026 12:32:03 +0000
Date: Tue, 27 Oct 2026 13:31:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lubaolu-intel-iommu:cr/iommu-liveupdate/phase1-v6 56/56]
 v6-0000-cover-letter.patch: warning: ignored by one of the .gitignore files
Message-ID: <202610271356.XayHj0lz-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Baolu Lu <baolu.lu@linux.intel.com>

tree:   https://github.com/LuBaolu/intel-iommu.git cr/iommu-liveupdate/phase1-v6
head:   0c951d2dd0e55d5d98c67799bc384ae8d335ef4e
commit: 0c951d2dd0e55d5d98c67799bc384ae8d335ef4e [56/56] cover letter
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261027/202610271356.XayHj0lz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271356.XayHj0lz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610271356.XayHj0lz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> v6-0000-cover-letter.patch: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
