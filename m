Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D323F429
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 16:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766332810; cv=none; b=GgFEwllJwsS9rrix+4GwAVHYLO5GTyYl3fI1BJA/bTZlWSO+trx4qenqy4yyqtyTDyPlcJ3u5ek8fWDUVflkS+WIR4PeGRGbBOw8TRD2n+BD9SiMZpoWG90AVIBkp+Lc1UWtD2MSn2c59aJAMJQm3zXnvlwlKV3aiMcw/V9cyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766332810; c=relaxed/simple;
	bh=e/OIP+EiW8mitzzLajpbNVaicChTFpZfuExeStrksVE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BeUBZ2faxmJrd+9JHsLzrc2e58iKahF9T1Vfjw+1uGuwv43Cnk3I9+PrEdXnkv+7qu0MZ3ciuXbXWGpXClKJak9w7nBzpTXXIJFHFxt4BZIpfABuFgo/Alws9R1BYoB6y82Yyo+hK0EnFneiIx1cXYakAU/d+/CNATD3Dd80tj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJ33nT4j; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJ33nT4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766332808; x=1797868808;
  h=date:from:to:subject:message-id:mime-version;
  bh=e/OIP+EiW8mitzzLajpbNVaicChTFpZfuExeStrksVE=;
  b=KJ33nT4jrfAUIzGTu8GTsSzqf1FvePZvHi1tsK5ZHXXPwc6nMxVYV3wU
   y5P797ca4DdOBZ57SifIGbygPfgFXUqXSAlgIOh2qfUSHc7arSma1umf7
   K/+fWbvSIfLuCoO4U2OBKk1vP7L7ToyPNAagA6wsCWO/5MYmSq9eL2624
   gYQ5abAI7OM2mnrQuffBk7yy47adGEi3sjLL2vSe5D81s5ngtZ2Beb2Nl
   NY4A3OEO7QtOriDQkSedvV+LvdAXdljVrkCRNKapdYend0KAEO98y9yJW
   C1VH0IZUKC2MEww2vlBSiaRY3YxTpbsVQ7ynNfnmSK6iqzqYgDzwo0lwo
   g==;
X-CSE-ConnectionGUID: mgsPD3EtRpmAuj2YsQJd6A==
X-CSE-MsgGUID: GLE2TiTcT360bVF/G+IAJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78928971"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78928971"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:00:05 -0800
X-CSE-ConnectionGUID: VDhd+rmPRW2dEVKykCYV0Q==
X-CSE-MsgGUID: Pn6qkS/uRNG2bUdNQPC45A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="198571885"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 21 Dec 2025 08:00:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLqk-0000000059q-0F6c
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 16:00:02 +0000
Date: Sun, 21 Dec 2025 16:59:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/010-soc 6/11] checkpatch: ERROR:SPACING: space
 required before the open parenthesis '('
Message-ID: <202512211625.UGUbRU5U-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   ae59b602c2cc0caac2808fea7937dfb2f581020f
commit: 4c135ef5c4c15479593b86a6da1b7abf87ffa6e7 [6/11] cpuidle: apple: Add Apple SoC cpuidle driver
:::::: branch date: 7 days ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211625.UGUbRU5U-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#130: FILE: drivers/cpuidle/cpuidle-apple.c:80:
+	switch(index) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
