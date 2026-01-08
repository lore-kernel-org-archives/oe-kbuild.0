Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1736C50096C
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767884772; cv=none; b=n2EweUuLLTZKqUjY9t5MrKYCGpUzpdvANB3PBCyM5+5Vh7t9IsMLXgE3RlKFNHfc9W1qMZoj8Bo9n5sXKDm+e8n4RAjL0u1P4FEG0iHi6cvo44wXST5yITi/Q4hNB+rmLm8v698NwSWiZU5aDbupSZYXa1DdGXn0Ml5JgkmRhvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767884772; c=relaxed/simple;
	bh=qRlE9t+JkivZF49Zz0UrqTy87ciAYoJdKVKSukaSlus=;
	h=Date:From:To:Subject:Message-ID; b=U4TmcSDnKhMCcUs06FyPc0QywTjJ50uvYt534LJXkuXX8ZA9hBKdOHVGS5pQRdDlf+ED+zDP5G/I+gAxJbW6/zfLRw48c/XkVrLjrzeXWFz3YFtgaIvwmB0eVNoDH7NJgjL3i+mpc/O1kva1uyqUqZA3uWW77m2Ye2azIStDFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hNVXOGzP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hNVXOGzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767884771; x=1799420771;
  h=date:from:to:subject:message-id;
  bh=qRlE9t+JkivZF49Zz0UrqTy87ciAYoJdKVKSukaSlus=;
  b=hNVXOGzPxn4U2zpzcm7BNA9HB8xfLadBX+fzq+2dNyXj1087IQ+DKyHV
   dI/+HLs8DqvIDlLSm3A1gnej/PUYifnbsQkVjth1YSAjlzawDBf7sxiRK
   Qiv2OAwC8YMV4C6CRjm6JNwqViVkAEtzLl+b2pYeelLDaHeVX3lNX0/a4
   mYZghOmDzwyca2vNfL5G3M2hI/JQrj/dp0GbFqL+jOFCty09dPNjhbEua
   u5wP331TQPXXhiarM8mG9hHbXEWeoEAt7oWjyCg2dSLIaZDmKYZP/9Ovi
   C5wOLK4ShG0K7KuAttODZwQSBNiYOBIAL7GaCQ+sZ4+PvaXl0/tl0l9W9
   w==;
X-CSE-ConnectionGUID: ngBoBd9nRtOpDGn7XRB+1w==
X-CSE-MsgGUID: sZ+9Z0sgSa+n5hfkrQ00Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69164988"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69164988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 07:06:11 -0800
X-CSE-ConnectionGUID: eGVVnZj4SeWVqD7+yJkXsg==
X-CSE-MsgGUID: BNL5L0HWQxmPfwznYQygIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="207361297"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Jan 2026 07:06:10 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdraR-000000001ns-3PX9
	for oe-kbuild@lists.linux.dev;
	Thu, 08 Jan 2026 15:06:07 +0000
Date: Thu, 08 Jan 2026 16:05:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cilium:max/vxlan-bigtcp 19/20] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
Message-ID: <202601081630.Jpo9MMaR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Maxim Mikityanskiy <maxim@isovalent.com>

tree:   https://github.com/cilium/linux.git max/vxlan-bigtcp
head:   4c58e0510f281f64b0f80a70459bc2885ed6f692
commit: b53d5f04fea8a1998fd56ecb3f218c1e2b69188b [19/20] vxlan: Enable BIG TCP packets
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260108/202601081630.Jpo9MMaR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#21: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#32: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#45: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#56: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#79: 
    Socket Socket  Message  Elapsed

WARNING:REPEATED_WORD: Possible repeated word: 'Socket'
#90: 
    Socket Socket  Message  Elapsed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
