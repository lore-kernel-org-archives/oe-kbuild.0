Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977BB23D7F4
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 03:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766461597; cv=none; b=cQP+wAvTwzwOGPa3T6EECkQvVfxVJos2znxcJtW+v1hkvXfBX+9hSP+0u6KxOS8KEDRqrqQBRjvlq6CbALOrsHm+lf/dvG2RGmtPOH1LA0yRlLVGgq699zrB0SDflXgjBhBVZex7sqT0w/tOVJfmDT8A3odu43KSPIj7cGkoXG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766461597; c=relaxed/simple;
	bh=TGrv67oMlQ6uMBVktUuru8//yXo6UUGEFrjDPkLNcVw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AD9u2tNLB0d6Htl8W9G7hVynRTnr8kI86nMO30bWyIqVNcxAEuYGULfhtKUqF2w7sVcSUCrD8zfB5h1/rJsKFlEazEeA2JeuPGWlhKgNIvlQx2oiPunqNHhpKXQOyGJEviwepNkuTtYk1OzzWGqEgIQcqLkPTDOqDQeLj4HOW7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRVVEs8s; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRVVEs8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766461596; x=1797997596;
  h=date:from:to:subject:message-id:mime-version;
  bh=TGrv67oMlQ6uMBVktUuru8//yXo6UUGEFrjDPkLNcVw=;
  b=lRVVEs8s30DYYuQAqKrII8Eb6sVPNOStHdl6x0RqiADjj7FRJzBxPvWq
   ogH0tXxcr7FIevznNIAUJ610dpbd84/95HOkY44hKnGyQhUssFH7/IX6T
   3MNPIlGMGdmfppSiN9VDxWZxV0QWfIkq3eNXNjNmT/m1RabvjUXRPpOpd
   xau6FOpzCC8hkOrtDgX23kVFnnYzk+V494sjxRZc8irtcCdk8FPMPIbea
   oASOzoVeJFJISun3e0fk2Nop3LzWOEedo07jjqG2LN3zhm5x6dd8G7n8y
   KS98rL1EWY+uX+LqXpuxhkHxMmeAoZz65wl7P9yku2eM0gyO/oHZDCAbe
   Q==;
X-CSE-ConnectionGUID: oSCx9LtnSfO4igyDlF8BEg==
X-CSE-MsgGUID: vjjW2IEiRXmOKhwdQbEL/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="67309719"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="67309719"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 19:46:33 -0800
X-CSE-ConnectionGUID: P0JwBuf0SUm9qYr7qOmJwg==
X-CSE-MsgGUID: wv6hN4JBTya4xhMIqsIWjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="237086884"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 19:46:32 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXtLy-000000005lk-0ecT
	for oe-kbuild@lists.linux.dev;
	Tue, 23 Dec 2025 03:46:30 +0000
Date: Tue, 23 Dec 2025 04:45:58 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Felix-Maurer/selftests-hsr-Add-ping-test-for-PRP/20251223-050252
 1/6] checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'of'
Message-ID: <202512230432.pyV0gtag-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Felix Maurer <fmaurer@redhat.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Felix-Maurer/selftests-hsr-Add-ping-test-for-PRP/20251223-050252
head:   96f8174381ece1941fdeb606f942f3f7c320d1b1
commit: 515b29210955bf2431cb85c9b22f1148a23cef6e [1/6] selftests: hsr: Add ping test for PRP
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230432.pyV0gtag-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'of'
#8: 
ping test for HSR. The test first checks reachability of of the other node,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
