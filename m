Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0F52D877A
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737817; cv=none; b=IH4XPN+snGrv6qDEJCNKdaSU3GBRZjunC7L8K3jbezaaduml2saMhcBfOroiPMNyORVu/94g/gRMI00yJoiodRA6ReXwx8uohvQ9UCCZvZ4ENlipL1ecUzHzT+hUrh5FjDPLXPuW4lARvk+dGyJciqEhLFnJx68yh/XQv8LeRcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737817; c=relaxed/simple;
	bh=PwTywMyeRMOaoOQEU4sWiPXJtM2iGkXwhUC3LM5xy/M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J05V3CGF6cXEijt42Iowq0dWC5TkQMiYjnU89XpSDa/kPZKttEOii5nRo7bXEU/vjsC8a1wqgtabSfwUwpgg8EAm7qSimaIOMuw8SIExKetVq35s/38rvLDpm0uSOIBry/US01RG16+zXkVXKDZr0mkX8krCrOrdgvDqJQKpZFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l690VMpR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l690VMpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763737816; x=1795273816;
  h=date:from:to:subject:message-id:mime-version;
  bh=PwTywMyeRMOaoOQEU4sWiPXJtM2iGkXwhUC3LM5xy/M=;
  b=l690VMpRg26fDHj2Fp02/8GJbVauJj8Vmq8jtOg1GaXU47Z/rFQzZMTj
   AQGoo0tG0IyZ2/ifa926zRpqA34BVvWjVtc7OtVGp9S9lmm3qx1CWMnNb
   dhFB3ERZdOmpQGhymxejq/R82SQOnperK7Jblq3Le5sgn+hN1qUPCxoXE
   jMsj86ItUtSa+q0U29GxLKu1pyynU4YcKlcS3R5NMIhGOhg+DCjbBJr0w
   E/CM4o9u/Ht+AX4JtRaBlBlO61FCqz7Cd1RE6dJAjbxLcmQAGTevj82jo
   n+MUWPoXbzlQtMnCk+GFplFKQJqdHvKHWtpRkgHeT0ZA3grAQ8yxJaVT1
   Q==;
X-CSE-ConnectionGUID: TP0oL4y9SieQvlZtIh+rnw==
X-CSE-MsgGUID: FRo+aKXxS0C1lPWHo2V0Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65769003"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65769003"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 07:10:15 -0800
X-CSE-ConnectionGUID: okNQ8Y4nQgqlm7ltBExMCw==
X-CSE-MsgGUID: uBR/uU5nQqGommS9K1IiPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191596314"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2025 07:10:14 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMSm4-000000001ql-2exx
	for oe-kbuild@lists.linux.dev;
	Fri, 21 Nov 2025 15:10:12 +0000
Date: Fri, 21 Nov 2025 16:09:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cel:nfsv3-xdrgen 52/62] checkpatch: ERROR:SPACING: space required
 before the open parenthesis '('
Message-ID: <202511211612.vzImdwFm-lkp@intel.com>
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
TO: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsv3-xdrgen
head:   cd854fd564f91ff95890468a15e9f4418d8a2a1b
commit: 5bb9c9b6f0d665d134049f59c1a92e0e799ac765 [52/62] NFSD: Use xdrgen XDR functions for NFSv3 GETATTR procedure
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251121/202511211612.vzImdwFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511211612.vzImdwFm-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#95: FILE: fs/nfsd/nfs3proc.c:111:
+	switch(fsid_source(fhp)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
