Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2A9390209
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 09:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775209537; cv=none; b=kXhE/CEgztqOHM5IjWuAvHhQTgX8LvMxnxZ631XnHQ3JtQxPHBnzZ1SapY9rIab3Smf8DXcQz9DcAXGAyaFzrTWXOtidvK9lXcmfZtRWI3xh+1CwXL9b64Xiv97EHOIn+/zhGl/Ew+hcgfk3JqHqUCRV1IVXnAUoCPpoB61jKeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775209537; c=relaxed/simple;
	bh=8NkcR1LMpek9u2bIqXEyS1tJnrlMNHfpSrAJum5jxGI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=X10EBD81wDsnybf5BWuhAUvQRWMC/AM0dP5WM537xzFLCxDTqUC3EydOR0IohA3tu9KJDRDBFTzsFr1rrPKYyCnpPbBdq6i/ot19mlbAivykSF/hgeoqMdiPI3V+rbx28BxgTAQr3409uPF/fN1pvmmu3huaCTBHZRtR9WwtPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxZYYJgF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxZYYJgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775209534; x=1806745534;
  h=date:from:to:subject:message-id:mime-version;
  bh=8NkcR1LMpek9u2bIqXEyS1tJnrlMNHfpSrAJum5jxGI=;
  b=IxZYYJgFHSQnU/zufdJazRbcyJd2qIIkwhlLQVomjAN6ufMJHp56Zec3
   RL/aWIO/19GqvInShF0nSmkDldCar/6d3oZTpsxy/IRmnN+VFq6PFjFib
   QNezh34q+vkkSGg6OYiEs4UyxyBcitufMSEODdGgh8aGeXL6kTacg9yIw
   yS/NAvu5hRiATjEKOHtZSl4Epvp/TPZ8RwJv6ARMBH+stHxPm9sP9TdPK
   GHqUn4SeWvpWIyRJJXLYmdOpyuJ848/w3auCXvHxS2+GYscchGduCn8pp
   uMDA6XuNE3ToV+TPAIjeeJW5orGGZtlTdbs3IPIx12fnxskZU3xfFc9uz
   w==;
X-CSE-ConnectionGUID: OZVy03qzSFub8s+/K/7o+g==
X-CSE-MsgGUID: tgQCL1LlT/+wTt8MULLbrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75445196"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75445196"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 02:45:33 -0700
X-CSE-ConnectionGUID: 8ztkCvgoTpKDylhcbhBNcA==
X-CSE-MsgGUID: QowERQrmTAKoiYPrgifNUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228843842"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2026 02:45:32 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8b5m-000000009Gh-1Z4c
	for oe-kbuild@lists.linux.dev;
	Fri, 03 Apr 2026 09:45:30 +0000
Date: Fri, 03 Apr 2026 11:44:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Josh-Hilke/KVM-selftests-Build-and-link-seflt?=
 =?us-ascii?Q?ests-vfio-lib-into-KVM-selftests/20260403-085610?= 4/15]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the *
 on each line
Message-ID: <202604031128.OAWyg3UN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Matlack <dmatlack@google.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Josh-Hilke/KVM-selftests-Build-and-link-sefltests-vfio-lib-into-KVM-selftests/20260403-085610
head:   0ce00986ea2ea0e1048b22ff32b67c5cec65d2a3
commit: 94dcc1fe7be42554e5549b79780bfdc8f2dffe72 [4/15] KVM: selftests: Add vfio_pci_irq_test
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260403/202604031128.OAWyg3UN-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#150: FILE: tools/testing/selftests/kvm/vfio_pci_irq_test.c:111:
+	 * KVM_MAX_IRQ_ROUTES is exclusive.
+	*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
