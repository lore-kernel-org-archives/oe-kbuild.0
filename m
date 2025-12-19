Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF154758
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766102860; cv=none; b=CAFI+9ajlnvtgp+L0gZ3dVFgdItplLuecPHJigrWli2h5PAeA5y4JluaYyL8DGWpcaoCV/CBQugCKCJ3mZmmHwrtaOHc7ijweyG5Pi033xU+i1kXuy/LPYVrcvqWdi3hcv7ifDTGOpZSrT/b6HTh5Ra7RfTMWS05by71a3PXKXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766102860; c=relaxed/simple;
	bh=4jZCvIN3FxTHKSsso39akouznxSyhm5Jvryi7sNmmsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNpAufTulIALI96AqjrScTALjWPHFH9wbePiudkPgnzDQPsYnNBmnyGdCUVnv9gSN6U7HUl89YpVPnnjQ1v6gn4X9Ma1UjmhW0RVymfXYN2BdAWonIM2WCZ/JEJ3PFUGm9sWq0Zm/C/daSzVRtJjgCZ0nP/0UlWU6/i/z75+Crk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqmtdr3x; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqmtdr3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766102858; x=1797638858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4jZCvIN3FxTHKSsso39akouznxSyhm5Jvryi7sNmmsI=;
  b=cqmtdr3xIzcUY1AarRo3Me5RNi4lejqni2HIPIjA7+bgEcitfQO1xf9N
   1i7wT2O+H2UsSJdsDzWlKqQ7Ovo822T7aBdLTuAkvqBrvyXuPP7yEjAl+
   xBWOnkSuZkfaO2WDzENcB88v6gtMSWcTdukz6Kw2BI72MzGXrXyBhDM5/
   LkNSWaQHD9n4G3SUiqSthDkQnZzKL1wmTYYeW6igeCQzX9Kn3JsEYZjXZ
   mNbI3zA9Og7pdO02dr8VTZrRBUWOWV6Ahzi9O/aRvUjM3wAEiGSrkQjsz
   w22k8Xffsgs4/5N8EyrIVkKGFDdQGHue0ndF36JsTujZjpL1yAupUsFC6
   Q==;
X-CSE-ConnectionGUID: lePCTeyBR9yuC9ILn1EHCw==
X-CSE-MsgGUID: puwDn/mYRm2zKEk4nnn29w==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71697392"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="71697392"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 16:07:37 -0800
X-CSE-ConnectionGUID: nCjbbOdbQ/y1qwn1ea1WxA==
X-CSE-MsgGUID: OY5UBlH/RP+eKGeQDKXi1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198732732"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Dec 2025 16:07:36 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWO1t-000000002n4-3p9Z;
	Fri, 19 Dec 2025 00:07:33 +0000
Date: Fri, 19 Dec 2025 08:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/scsi/qla2xxx/qla_dbg.o: error: SIGSEGV: objtool stack
 overflow!
Message-ID: <202512190825.l1RDJ2PT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 799647ddb4c0ce1d7084fcf5b524e9a0c7728325 objtool: Add more robust signal error handling, detect and warn about stack overflows
date:   2 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-buildonly-randconfig-003-20251219 (https://download.01.org/0day-ci/archive/20251219/202512190825.l1RDJ2PT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190825.l1RDJ2PT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512190825.l1RDJ2PT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_dbg.o: error: SIGSEGV: objtool stack overflow!
   /bin/bash: line 1: 1615687 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --sls --static-call --uaccess --no-unreachable drivers/scsi/qla2xxx/qla_dbg.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
