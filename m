Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2902C029D
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Dec 2025 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765129328; cv=none; b=nQwJIYZQ86teClM4FdlyxeutNKZrImUncK/j6CZrqRAMXSHkz6Vjm30hfbJl1fddUfnAAPxODxEINaGlcZ5kxKjV20YKYsvLbV5rM3qAjk0trtNuHKAbiENzkjuL3UP0YZrNcI6vHgFHF6UzTfMPB0s/lEIx9tmJGgtAnS89tH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765129328; c=relaxed/simple;
	bh=qHhFxRORH0wIN3aMaF7sf7vN5u2C8oiOMQVpKIt2ggw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d458WOqbSUVPnBXwHONwhlL+wnanYsRn4b2/LnDzyQfbLVnOPGEPV5COxR4ui91sT3CvlWu2OJvvlXi+rcRzRgMIJm1pcXNtoia25FUkG47S/B5ABu3PbHwaZhWWGqU1c2YJ+nEP1FnoBwGsLRsC9eRxHKj5F4TCUJgdaB4CfhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsSpTKwC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsSpTKwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765129326; x=1796665326;
  h=date:from:to:subject:message-id:mime-version;
  bh=qHhFxRORH0wIN3aMaF7sf7vN5u2C8oiOMQVpKIt2ggw=;
  b=TsSpTKwCSg9CnukzTd+GyxUhn2LK8P2A7Rc2OhjZvd06uma3mq4OTKYy
   5uW1D77AQn9uehQROwK9IsDbbC9Tj4WQY66JHVexI+JVeETrpkSeYrINN
   fDvhMhgXv2s1f2haEejT/E0nev1pW0Of5ottsVrRuvF7OtavfNntEH+SS
   1gVhN6rxlU50bRE6QYOyweXmBCdbil4m4I9BfDXEQljkue9VMPWi02wVh
   NpmmHFyFqDkaCi8WN7Z+kbnp6mqJglo3W2ke9453VvajGu2OhdLER1WKi
   G+nV+8Aqlrgvm+dqrXiaHTqwTo+yPJulqMCvjR8LG8sy8z1RDdn/uG1MY
   g==;
X-CSE-ConnectionGUID: Va98QarYSou9jVuGpotVxg==
X-CSE-MsgGUID: QYkNAKiNQ/etRELnETmn3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="54631248"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="54631248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 09:42:06 -0800
X-CSE-ConnectionGUID: eXYu6JuST1i2QRamuS5L4Q==
X-CSE-MsgGUID: giOuEVisS9SOSqqSeHILuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; 
   d="scan'208";a="195655424"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Dec 2025 09:42:06 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSIln-000000001Dl-1t5w
	for oe-kbuild@lists.linux.dev;
	Sun, 07 Dec 2025 17:42:03 +0000
Date: Sun, 7 Dec 2025 18:41:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mptcp:export-net 11/17] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'Bochs'
Message-ID: <202512071812.Y1NRI10i-lkp@intel.com>
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
TO: Paolo Abeni <pabeni@redhat.com>

tree:   https://github.com/multipath-tcp/mptcp_net-next.git export-net
head:   af7b33f935e3e886c8cd61a892b2962c4fe3d293
commit: e247b66ea5d898f6a832d90beb11092f8daa5f23 [11/17] mptcp: ensure context reset on disconnect()
:::::: branch date: 87 minutes ago
:::::: commit date: 87 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251207/202512071812.Y1NRI10i-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Bochs'
#18: 
  Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
