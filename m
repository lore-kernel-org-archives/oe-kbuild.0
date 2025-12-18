Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C5A330641
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042410; cv=none; b=I9dzUTc0/DGLv/7Y9PMoKnD3QFCtN94JEnqcKUSPLqUsLlx/kO3od7HDlkrpCGBU2CJULS3fVGIRzUfXwKAmxH2F/8W3BmtOJGL0WfiTvh9E3SlbhEpVYnSjN27gX8JvrgvorDAyBijOsVzj21QclZDsQcD5o/tkGRO7/6TXvcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042410; c=relaxed/simple;
	bh=ACl3uOLMkRpLgIhzqKiEvsejn6hkt6kxiaBaRD8a7JA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GP0TSiede2255MFcOyDpGIWrXTcaRLoEDP+VXDs0cQsRlqBZeiqQCT+/zsUAalPEjp8EWkSy3Z9hZrmMWdcTtdFtn/iXAmbp2H7hgE1IxeUlB5SE4yF2qSXTlcoMGGhHlboAdtAEeWmv0nbseHXwbZCIo4Xzcl20aSHVHdyramo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMePmGc6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMePmGc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766042408; x=1797578408;
  h=date:from:to:subject:message-id:mime-version;
  bh=ACl3uOLMkRpLgIhzqKiEvsejn6hkt6kxiaBaRD8a7JA=;
  b=VMePmGc6EJGyTwJPPjVo76fMZ6LbpSyBetvBYI/LGGZhXIAJOqF+Bjin
   DXN4k+O6zFC/ae/yQX0XR5luYBrprKvfltPxacsQDF9197iJ/l1EGaNnn
   oQ/tvudnvI5JeoZvrL/L6wVXp5MZ1j/VNeiys+DMVvYRiRJvvAuy5Ddj4
   3vrWyNV7c96h73Qlc+m7wfNeDpBmNnRn95HKwJUa3E1lPEaeOQR12KvUR
   pQ3JuoV+Db4QxgIZc+m4uvdhhAO71bjlegcXg7koGRaFcCD02m5x84Uds
   xL4nvm0uITzzMscTu7iwjsJuUi6rVgnEmqKO1ggSNtMIsY/IKuyorZ0D3
   A==;
X-CSE-ConnectionGUID: H3J7D531SfOpjZUmYt+GfA==
X-CSE-MsgGUID: SYkPIdxNSoimMWLxYT5+Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67184465"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67184465"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 23:20:06 -0800
X-CSE-ConnectionGUID: M5ApZCXdS5uiPfav1Zmncw==
X-CSE-MsgGUID: aeTk4UUZTFOCctyn1E8V3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198120483"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2025 23:20:06 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW8Iu-000000003s4-0CI9
	for oe-kbuild@lists.linux.dev;
	Thu, 18 Dec 2025 07:20:04 +0000
Date: Thu, 18 Dec 2025 08:19:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [pci:controller/dwc-meson 1/1] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'and'
Message-ID: <202512180816.w57KuUaP-lkp@intel.com>
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
TO: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/dwc-meson
head:   11647fc772e977c981259a63c4a2b7e2c312ea22
commit: 11647fc772e977c981259a63c4a2b7e2c312ea22 [1/1] PCI: meson: Remove meson_pcie_link_up() timeout, message, speed check
:::::: branch date: 76 minutes ago
:::::: commit date: 76 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251218/202512180816.w57KuUaP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'and'
#21: 
boolean check of whether the link is active.  Timeouts and and error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
