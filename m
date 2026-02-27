Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9663D3491CD
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772166031; cv=none; b=lePkp3T4+QzaVGCrg8626yNgHVFM4c2Vp54Yqkb4ZnOo9SrxH9yLrk5yoGziqLYEgMFdz3xZ0SCl7lFj+FvpZ1AGrKA+TNe/FHWR+3CSNdz1islos3iBcXl58ivOtleJg1WNQtONHLax7vwIixa/4iKMxGgHzPaw6GihaMN1Cqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772166031; c=relaxed/simple;
	bh=WA7vplp8Wm9NHnTYl/uUpUaUpxB+49nl9tzt2QtJ//4=;
	h=Date:From:To:Subject:Message-ID; b=JqHvgQVjv2UC1cv0i+wlBkSxi3hmiMECNECWyImN5RXC7VESCj3qtDiivgHlbPVKFRBp5ujcdOopzCg5rrLM1QSj+T4+0c8rwZpJskUPm/M/jmuYVAsFM9kmhVTVlwNoSrWx/4vBQfIAa60Y7cVDVDAosWFuOnfdcV52K9sqaUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrJ48PwY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrJ48PwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772166027; x=1803702027;
  h=date:from:to:subject:message-id;
  bh=WA7vplp8Wm9NHnTYl/uUpUaUpxB+49nl9tzt2QtJ//4=;
  b=nrJ48PwYK2YGoJ5Cd3fGolT2mMf5OvoXBlHBaTkp8Ab69jW+rGbO6ztn
   YF+2aVNZv3iU1lj5udxYk7BP9MGljffRuOQZNldOp2bwTIBnkJp3jxt4b
   E5o7A9HINQ2KWGbr+M2WjgMPnINN4ldyPm1ZswMbOnMJzhK/ESfHzBzTZ
   4I0NB0hTnzh0hvFh7mh2kpEjHLXAcOdaRMzIOvfGbKKnW71o7WZf/WDY8
   dMCJ4vKFJo0sg0ydkLaCyxM+fFN+vH+gMfogXZ17VaSap/UClDUW5Ayci
   YkP9CEZ+BoWqS1SWg8FFuZN0RZ/Vhaj7BaaTEIGgj348fKSD0lcBwV3HT
   Q==;
X-CSE-ConnectionGUID: OpuSGSvuRbuUjiTV6WARDA==
X-CSE-MsgGUID: gu+AvNc+RO6HaIVNVbKYYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73428631"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73428631"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 20:20:26 -0800
X-CSE-ConnectionGUID: vFMXHUg6QRKu+PJUYtnkHA==
X-CSE-MsgGUID: N2uSPdJJR3K2XLwWuDtjqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214980453"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 20:20:25 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvpKx-000000000Sp-2YYe
	for oe-kbuild@lists.linux.dev;
	Fri, 27 Feb 2026 04:20:23 +0000
Date: Fri, 27 Feb 2026 05:19:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [acrn:6.17/linux 5/8] checkpatch: ERROR:SPACING: space
 required before the open parenthesis '('
Message-ID: <202602270557.vOarA1h6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Fei Li <fei1.li@intel.com>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: a0a08e545dd9dc1bc3bdbd625684163595678fa6 [5/8] virt: acrn: add acrn hypervisor log back
:::::: branch date: 55 minutes ago
:::::: commit date: 55 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602270557.vOarA1h6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#460: FILE: drivers/virt/acrn/hvlog.c:394:
+	if(!hvlog_buf_virtaddr_base) {

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#465: FILE: drivers/virt/acrn/hvlog.c:399:
+	pcpu_nr = total_cpus;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
