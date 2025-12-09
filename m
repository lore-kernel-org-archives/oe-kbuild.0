Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE22D6E64
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Dec 2025 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765288869; cv=none; b=O2qQZ0h2Wucbkd+lqRqrNPIFIT8YCraCGdaKPw4S4c4cGkTqTBBw2fJdffrwjSCmsV6q4ckqM/EibiEsQ7EczyfosTVVNQFs6uxkMr4z5/OFY2RmBwMZdd29v2akVxukI6BAmdDEALdOyoxKMOQC2eXG/Ysvlv2Zgwqjt66nN+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765288869; c=relaxed/simple;
	bh=sY8ISgCmZZ3tdDZokVi4nlQEDOa5mwfOIFTfsDP0QbA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F6Z2YDILXL+WG7mU0N1KTa2TFtSB/4361qwHv1xuOvIqIn6EBRFkz/q+0Cb6bZJXiB8poxrwMPAIE/sfU2usG+bCN8wibZs/jwaDphS1HOLUu1G2PrxFcfRPVKUVNyf7HKomHKYX6pZae3zr8EVtZsEVTDCZw5UqA0EgSnZ5RBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVrRV/0n; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVrRV/0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765288868; x=1796824868;
  h=date:from:to:subject:message-id:mime-version;
  bh=sY8ISgCmZZ3tdDZokVi4nlQEDOa5mwfOIFTfsDP0QbA=;
  b=BVrRV/0ngzlY88h5+Ufixo9R9GA5eprD/hLYLM/1XB6QLOFu7zHYcxwN
   YaQrD5tUcE7VwFnKPPQzXYXRih9wtBJfh8gjo8JdpyuX+iNCFgi7nrsba
   yWvqNKvUTZQQn1DlY5zWC2UHbKd2Woev+Rp/EiH1iHYpHMOeNymMghGcD
   yIcYI3XqMevDU9dUtvXhM8ttZ9X2jh1xvLsX2YxqLYyIVQUusKSE9aDzX
   +twHczzAuKyFZgL/n10PJPS84uBxtjB1xNnExnN3tYaa9q4DbIWQrpPfF
   /ACfmuQz25CtKWfTGtkKwmIcjXMtWIiuoGoxrsXUANG7ZMstwq8nxO4qD
   g==;
X-CSE-ConnectionGUID: 8S1VSSVHSPi20J1KPMtL2A==
X-CSE-MsgGUID: b4reTZpSSlS7QEfwn6TfEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="69835979"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="69835979"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:01:06 -0800
X-CSE-ConnectionGUID: 67APx/izQ5aYnm5jPVHwqQ==
X-CSE-MsgGUID: gbIDhhGWRzG1L8wTgmj0kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="195842945"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 09 Dec 2025 06:01:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSyH1-000000000EH-0EXr
	for oe-kbuild@lists.linux.dev;
	Tue, 09 Dec 2025 14:01:03 +0000
Date: Tue, 9 Dec 2025 15:00:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [andi-shyti:i2c/i2c-host-fixes 109/719] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Divya Koppera
 <Divya.Koppera@microchip.com >'
Message-ID: <202512091514.ObzEkrXq-lkp@intel.com>
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
TO: Horatiu Vultur <horatiu.vultur@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-fixes
head:   bf73845cc1394cefe52dd2c91478b606e1892e76
commit: 6e3f2aac46e6c14bf84dd8d6ff3b1087c2d7f51f [109/719] net: phy: micrel: lan8814 fix reset of the QSGMII interface
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512091514.ObzEkrXq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Divya Koppera <Divya.Koppera@microchip.com >'
#15: 
Reviewed-by: Divya Koppera <Divya.Koppera@microchip.com >

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
