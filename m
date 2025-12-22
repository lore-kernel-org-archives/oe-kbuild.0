Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0C1F5821
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 00:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766365171; cv=none; b=UbeJxGDqxRR30w4qbVRbPihzgVX8yWo8DI0FiS3gWctP78qsRiPqU4xu02NfEvxEnZsQUR8gGZR+TN9+KQSQsSAawZ4H2bdMoiSWXwnGbxkp1Mp/5Au7Xxv6DGWvy1qi3hYNtpmanHAusw8HYbgjwSxHm97EvWgdUQr6Cjka9xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766365171; c=relaxed/simple;
	bh=HGc5ZAcevqb5iNmi29IloKmbSDqgh2FCpimMcz+Kqhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wj8pnhtIWDxDngC6qHgHFGETBRHdcv9zIsl4uaqjqFRJop3r9mogrd+QwzOgMn0YFCB11KJd5eSLSquJ6hLM1B1UnB7GDbFmsuPaDfHC3BswoT8WME47lQ/MLrSiB77SmI3WC9UymRjUZ3GjyJIaMVVjFWP0C73sMEZXx/+mkKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=li9+021r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="li9+021r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766365170; x=1797901170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HGc5ZAcevqb5iNmi29IloKmbSDqgh2FCpimMcz+Kqhw=;
  b=li9+021rwml78hUBRvFLs2SDPrFK+Rgz3YCr3RmO4NG+uPEsRV+TBCzs
   sbdGE7FhOh9ZTJ1U/ZAMUdyc2IpAixS5uJOz4MTG3ggBsST1GUkoWvGWj
   DYtyfswRIBlh9DJNkEAwaaW/U4FGuuT1RmknOru6tIBS5UzivoWmGo3+P
   6LgimoP2f1ZuFf3KEYOdRUJHW1D7Y3SOdNeqce3oHgumviZpK0AsFHPJf
   CF/uCJnXqQTDYX2C6FvPLOPN0eg6/NAdOQ/Yd/IN4hSsYaBn2xS83pEHV
   YXPrVSInhpOQxyw3V6m6nKIakSPQFUGTStv+u3sF3uPj17Gm0CDLvAjlS
   w==;
X-CSE-ConnectionGUID: ywY21XDMQq+rHDcs0oa+Hg==
X-CSE-MsgGUID: aL12icXfQ3uH062Cd20+DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72072671"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72072671"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 16:59:29 -0800
X-CSE-ConnectionGUID: 2MoXRKclQ6GXwk71k3rVdw==
X-CSE-MsgGUID: kaAgx6/TSwiDQa4fbG3VLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="204331253"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2025 16:59:29 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXUGk-000000000M5-0m60;
	Mon, 22 Dec 2025 00:59:26 +0000
Date: Mon, 22 Dec 2025 08:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 11/14] drivers/pinctrl/pinctrl-mpfs-mssio.c:748:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512220815.5vmkpDXH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/pinctrl/pinctrl-mpfs-mssio.c:748:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a8805fb8a49841ef67f240537e28ed40ce539661
commit: 4e74c2cd5a9de2859fc73c23634eb34e459e845e [11/14] pinctrl: add polarfire soc mssio pinctrl driver
:::::: branch date: 25 hours ago
:::::: commit date: 29 hours ago
config: openrisc-randconfig-r122-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220815.5vmkpDXH-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220815.5vmkpDXH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512220815.5vmkpDXH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-mpfs-mssio.c:748:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/pinctrl-mpfs-mssio.c:748:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pinctrl/pinctrl-mpfs-mssio.c:749:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/pinctrl-mpfs-mssio.c:749:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pinctrl/pinctrl-mpfs-mssio.c:750:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/pinctrl-mpfs-mssio.c:750:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pinctrl/pinctrl-mpfs-mssio.c:750:1: sparse: sparse: bad integer constant expression
   drivers/pinctrl/pinctrl-mpfs-mssio.c:750:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +748 drivers/pinctrl/pinctrl-mpfs-mssio.c

4e74c2cd5a9de28 Conor Dooley 2025-09-24  747  
4e74c2cd5a9de28 Conor Dooley 2025-09-24 @748  MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
