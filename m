Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AC2264BB
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184885; cv=none; b=lb+IKOOjP+3uUgZDRDDRJ8OX2K2W6Zb+a8i5+LenXzHhYzGVX1/gxYSk1X8Ka0G+jssHoSWyEaQu+w95OtiWYCuTwg94GbQ1iERp8UDIkDjL6ufiagwhIP4f9LGLlNedIGPkjHK5qd1OMBEsEtptrRktZwbQtFPz1zVTbf0EGAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184885; c=relaxed/simple;
	bh=niXLhvw6M4hpUoxpcLq9x/R293DmYzjJnXrqt38MdhE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhEodbp6KHMlplnUl9aRAUu4I8pktgGxz3m0fxSDY/Dhipcu2kxg96KE4967y0G0DYyfcEIow9uTft4Lwxc1qJtvUHv/NfM71jL1hBthGSWf7fgnjIY74PMfq49OBHGk3cHiaGhuyY1UQYvOTX/KQ3YGCxaOxjAtWq/Lrl2ok+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONzd6HPA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONzd6HPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764184883; x=1795720883;
  h=date:from:to:subject:message-id:mime-version;
  bh=niXLhvw6M4hpUoxpcLq9x/R293DmYzjJnXrqt38MdhE=;
  b=ONzd6HPAU1wYotTDb6apBn03qh7DHqXy7G7KSiobtjHF1LqpZqyimJY+
   mUTOHnTumBmstexGkpAZTH9J3NjU2TA9E35BngC4ouzj4j18p68bTkuNz
   4LufMOh7wGgFAEerKeEP7Q/VkgcO6Ib2RwOyrfyqQfY1LtcG2j9iEX1GT
   rsimhHytPHJQwL9canIo5f2Xt/REwVocruICM4PL1sqJFfWh4HpecMhif
   WSUrZsT2pImAw8gOlISdGxpK5JpzgvM1lyywQIiAfd+BMO8rdSMSJFcC3
   WQdgBB2EiV+X7Jjd5Nn8KN41NyuKyLaMKkmemv3D4Sf6JTMTs9O7hRIvV
   w==;
X-CSE-ConnectionGUID: clnAuXNoR529BCNjncJ9IA==
X-CSE-MsgGUID: ML79eAp1RWyRi91IKyEM+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66265183"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66265183"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:21:23 -0800
X-CSE-ConnectionGUID: ZDJhF8pvSXiftPKHW6lo2A==
X-CSE-MsgGUID: W3YEs0bkStCc1zgPUDNYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193833414"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2025 11:21:22 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOL4q-000000001Kd-1ONX
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:21:20 +0000
Date: Wed, 26 Nov 2025 20:20:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 264/999] checkpatch: ERROR:SPACING: space required
 before the open brace '{'
Message-ID: <202511262040.JvaUFDT4-lkp@intel.com>
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
TO: Francis Rossi <francisdrossi@gmail.com>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: 038107d7a62b15fd606219cc43e94ab40be0be49 [264/999] bcachefs: Switch statement evaluate ids and confirm they are unique going forward
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262040.JvaUFDT4-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#22: FILE: fs/bcachefs/sb-counters_format.h:128:
+	switch(0){

ERROR:SPACING: space required before the open parenthesis '('
#22: FILE: fs/bcachefs/sb-counters_format.h:128:
+	switch(0){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
