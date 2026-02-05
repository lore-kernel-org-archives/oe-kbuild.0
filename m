Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7A23D290
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 05:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770267799; cv=none; b=NaBigXP+9j2XMtlGn58rSzXIHq/rS97jQ6+q4iGr9n7zxZDsG1C9goqzxQMtPaUVkwHE6wab73OzDYUuEq5CdoxV2YpV3GOFWV/fV6/HuVVdEAMAhhBsS9s/njCiQ4zR7USxCMCPLSUMjRbA2M3lxyRsilFdO5Jhf3+zx+m2trM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770267799; c=relaxed/simple;
	bh=/aA1n1txk4NhDzRkeu0paPl03QHvGPfzhsbvOruRHGk=;
	h=Date:From:To:Subject:Message-ID; b=gM1Bo0VE1VK8w+L008P/y41dcMXckJS9a+R1QnfTA+cyP1L1rjXAIj9gdH8J40mPvewDvMlxV63S21OS1AYbBZ31gu1KlEwVx2/OXmoD78V5CiNstXX7jM5Uc7lBBfO4cmcZg/njTovj2CMCf4ohzKliiGXlW6UgyOMOmATYH5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gH/ju3ri; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gH/ju3ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770267799; x=1801803799;
  h=date:from:to:subject:message-id;
  bh=/aA1n1txk4NhDzRkeu0paPl03QHvGPfzhsbvOruRHGk=;
  b=gH/ju3ri2IKitw74mPBlpp9ePgZfBqInketesNn8Tp6OpwnPUb+ycwMw
   /MlLWdFjh41Tpur7S/+10D7EzZrADpBGGxV0IF8IPDeSvZlJnnF/oKDz5
   qz8bWrNHPfTCvuazWQUCJmXZAvAqL2M5czG/bff0tHKoa9FYOw91qv4RY
   tTOT0wIrKJXixpJXjS+CkTuXwfTrxAbJ7PM3ciGjmYswTa7oOoRHA/NS0
   1UvzGj/lQgQEcTj+b/Cs0rDRb9bvAbKvH/jCDeZpnI11kYQ/VG462/X25
   XR+0JBNkQm8GZatttJxv7CaLhIYXfxwQiqGiKZ0OKHD9eCI9q/0gCWBE1
   Q==;
X-CSE-ConnectionGUID: WQSn3Vx9QzWFoAXNwRFJrQ==
X-CSE-MsgGUID: JuXLTXFDRzSF8JTnVcebmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71357638"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71357638"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 21:03:18 -0800
X-CSE-ConnectionGUID: FTRfftu+R16zBjOvB6eA0g==
X-CSE-MsgGUID: RkjPcJWOTk+VmdE2T4tbFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="214880753"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2026 21:03:17 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnrWN-00000000403-1aO4
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Feb 2026 05:03:15 +0000
Date: Thu, 05 Feb 2026 06:03:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [xilinx-xlnx:master 198/590] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'Syed'
Message-ID: <202602050645.kzMeVSP8-lkp@intel.com>
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
TO: Pranavi Somisetty <pranavi.somisetty@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: a6c27ed71f72afd88420af3b21f61cb96591ee16 [198/590] staging: net: xilinx: add Xilinx TSN driver
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602050645.kzMeVSP8-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Syed'
#12309: FILE: drivers/staging/xilinx-tsn/xilinx_tsn_tadma.c:7:
+ * Author: Syed Syed <syeds@xilinx.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
