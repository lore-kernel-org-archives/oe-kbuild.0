Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140C91A073F
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764408549; cv=none; b=YuxuDL2zJn9j7WASwteWSR7y40RXOKIKMhzXFMIaT/ml4Zny6wj/dG91uM9xgS/y3AWc36krdxJuFbVlROhqEUJ4lxY7JRst1ikPmn6P4XVd4Gm8g0LwevhVAK41PkZhbh9tJiexN3ff38JMDF34yBKbI1KlGf/Af2No1OEmjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764408549; c=relaxed/simple;
	bh=zmC6mk5KDJRRpPK5DzDHU0jslDTTZZgrcgQ84Ac/jp4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LOikE/GTtLwMsOSo44OMTwARauZCQ4hf3VRsqQLqpy0Ewh4YRD52JJ3zJfpyrHVuIgynaOMHkU/6iLruct6cBQEBWLWnPZ3n1COeUnD4rUu7U5Xt+PqBDF13YO0jxcHiSg1bldvw4ocn98/tZ0z/0fJqor8YsrjFfgv0BgRdzW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StJR/HqV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StJR/HqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764408548; x=1795944548;
  h=date:from:to:subject:message-id:mime-version;
  bh=zmC6mk5KDJRRpPK5DzDHU0jslDTTZZgrcgQ84Ac/jp4=;
  b=StJR/HqVnEYUNhsSY/nYVb+ufXOGPRCKojMd1St4Fk7ztIvhKAwyNaSV
   5jnsdVfUGDRMCe49MIg8a1FLlkphOs4Wv4fdt/4C7wECJvM+Pu4nrxULm
   CHjDvgDMznQwKQW0lunM6U6rIEn9a0cLKcIqePKM/Gv3mm1KNKuX/QEsL
   /ApRY4j7wh4SUQlq6NLWTMRo3vIsOga0UR6lNx+TwZczJehXD46ae59SQ
   ObA9YwZR7ZUjeDG2iDHUGsN6RzNgVn9NXkruaSoKk2cvEiOCaYRECxylm
   fEC/f/w5z+1K3Tr7N0MmGEoanyJcpX8Ld5ctYIMM4p5oFl0DvS5kPElwP
   Q==;
X-CSE-ConnectionGUID: GzhT1gxvSrKYAkDrr8o5IQ==
X-CSE-MsgGUID: o73S8PaJQ9GQ/rNCauwGhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66304637"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="66304637"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 01:29:07 -0800
X-CSE-ConnectionGUID: osZmZEagR2mMpfks9ubdbg==
X-CSE-MsgGUID: kkhbh4LpQzmUOoHv7hi6UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="197956929"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Nov 2025 01:29:06 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPHGK-000000002Hx-26pY
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 09:29:04 +0000
Date: Sat, 29 Nov 2025 10:28:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [devsec-tsm:staging 28/31] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'and'
Message-ID: <202511291004.RfxYQzTY-lkp@intel.com>
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
TO: Dan Williams <dan.j.williams@intel.com>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm staging
head:   7849e77cb51ca31f8340e9a27ad0b846524fe07e
commit: bf316a4fb78d9bde46e665c9490ba246485a51f8 [28/31] samples/devsec: Add sample TSM bind and guest_request flows
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511291004.RfxYQzTY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#8: 
Arrange for pci_tsm_bind() and and pci_tsm_guest_req() to be invoked via

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
