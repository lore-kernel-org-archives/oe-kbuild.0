Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E983B8D45
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 23:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495916; cv=none; b=jK0CtlC8C7SfLPyzVanlprS/VP8b1FUs9RyySb6tQNGXVjhvLZnoStt5ZHCPIzsKbUzJILsjvi+OWXw4sxbLAYOcXrw75ElWE4EmRA0dAh0KRgszy66DA+dYw+vgWtMOx7Rmaux2JFNDPpAPFMpXEcRFmTkMO5hhemv18/mhqV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495916; c=relaxed/simple;
	bh=FgQRCCcaGbf+Xgacrp/PEEPsSscxW/RVvW7G2AM1z9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A4q0e8wbNEFDGBCQvirVJDkGcAUXWquLxwKpjk9/l3A2UY6FnGEk84VlEJQzK4ARYcy2ygkRFmzD354khu6e4+m0032DsazWRKJDdoXAfVKzg45RX5Un9N8x8s+rVsUS75vMx3fqePbxrfFfE5NgkkIhj8U+9s41dA4WcrOMJU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7bAgNla; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7bAgNla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765495916; x=1797031916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FgQRCCcaGbf+Xgacrp/PEEPsSscxW/RVvW7G2AM1z9w=;
  b=H7bAgNlagQsxGBypDPHZCmYPD0lOUAXaTiVL9QqX+OGFQLkKrgRDXWxV
   74abKF73ZC1OcqrSpO65PioammBFmca9BCxjmF8ggQ9faVT+MOj6FaOdq
   QJyBo9rzwjuhfOrHGs/N4iZxLNYsxyu6e/VgrZ3IIbmfmIR7FQ9wu1U/k
   X4wJDBZJ94yAhOFjQL9yH5gvCxq5+1TO5Ej0N7jKMnGng1lUArDu+CTx+
   1v3k0jpsTr0PNMTuKmWbEOHNlH6J9fGKzFRNgSrkCdXSWZhAqjKvvEB5+
   N9rVp0hcyERNaxtkngyUEJlkRON/joOi19K99dlh4yDkuWS+yakTRZ/+X
   Q==;
X-CSE-ConnectionGUID: 376VxUNWRCqDd/vBRJaUlw==
X-CSE-MsgGUID: 82x6kEh9TOuY0rg9gs93EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71355565"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="71355565"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 15:31:55 -0800
X-CSE-ConnectionGUID: PMCaOjJvTi6vYgp5t2qNyA==
X-CSE-MsgGUID: Ct1sfCWaSyyUmCDPq/PJZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="196215921"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2025 15:31:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTq8V-000000001EW-3f6V;
	Thu, 11 Dec 2025 23:31:51 +0000
Date: Fri, 12 Dec 2025 00:31:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.12/emt 9/9] ncdevmem.c:6:10: fatal error: stdio.h: No
 such file or directory
Message-ID: <202512120013.1b1oHYlR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/intel/linux-intel-lts.git 6.12/emt
head:   aac28a88afc1d68448c7e5672fed4da83e10fe8b
commit: 85585b4bc8d80095a825028e2088b568035ac467 [9/9] selftests: add ncdevmem, netcat for devmem TCP
:::::: branch date: 10 days ago
:::::: commit date: 1 year, 3 months ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512120013.1b1oHYlR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120013.1b1oHYlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512120013.1b1oHYlR-lkp@intel.com/

Note: the intel-lts/6.12/emt HEAD aac28a88afc1d68448c7e5672fed4da83e10fe8b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ncdevmem.c:6:10: fatal error: stdio.h: No such file or directory
       6 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
