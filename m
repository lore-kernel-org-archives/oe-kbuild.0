Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E13829D281
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Feb 2026 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771164915; cv=none; b=aDOUfuJuF8f2RO4Nr2Mpzc5z0hCqJPahGnrXErN8zgVAf10L7yKOWPcKKhtDHLXPFOeWAz36oFX6FpeaSfmgARs8CTUK5DqIaDqkziqB6MnAQOetyiEX8bMnwH/Ks5aqbCm/IWsFVe9R8r661wN2Uxy5t6qKPd/EIGSfXhYzkaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771164915; c=relaxed/simple;
	bh=dgvRpru6IdLUsgDLcRvzTU4Tg8FwUd64mgQ/3MS/RfA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sRO7jRDC2EE2nIhJ+h8YZqUoulhDNuOeurKdRq2mzofRsvx43TEAquH2Qf6S65513DfiFryJV8u3K+Dwb7yvzfA82SWVoDtsuhLTeNCtJ9H9wMRLP8DtcHObzAQTYyJQGJsy+Oj1Oh+AQuqJV70v31F65lRtXW8o1yLyQ77ok/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjQblKOh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjQblKOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771164914; x=1802700914;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dgvRpru6IdLUsgDLcRvzTU4Tg8FwUd64mgQ/3MS/RfA=;
  b=VjQblKOhnhtS3i/9M8eN71TDjogOX5JZ113lmipwDgG/6Dz0b2Qm/OJH
   N1bP76A3zK01vNhO/Tna4C2vAclFTeIre5Ccu+M2txsUsNQpfocWPMa60
   aiypC96vq/9ic1PhXOvGKaeNEICdINUpeWwUtM9f0Q6MPyengmTWNJ14i
   Bg8Dq6RcSmoY13i8s8/0su/11MY4AYTU/R1HHgvHooKYfBqF+MUXQcBnV
   UbP8cTfZxw/lO7ZTwH66AP7GUgGImYupfxpYWntGXrzQ/XoOUSxzrqKf9
   gkAIfcfeiXBMA1i+++SqngO48igzEqlFepeSKnRHcdrvTlgk4qj6PGJzT
   A==;
X-CSE-ConnectionGUID: f3q1slVWRSWeqWmZMVhG4A==
X-CSE-MsgGUID: tlgem2cKS+yN03o4TftVhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="97735725"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="97735725"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 06:15:13 -0800
X-CSE-ConnectionGUID: rgkJ3CLKRqmQEmQxUoxIxw==
X-CSE-MsgGUID: oTwlBeMVQtS6ct0/FDNv6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="212479038"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 15 Feb 2026 06:15:13 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrcty-000000002BR-2tLk
	for oe-kbuild@lists.linux.dev;
	Sun, 15 Feb 2026 14:15:10 +0000
Date: Sun, 15 Feb 2026 15:14:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v4 6/7] fbdev: au1100fb: Fold au1100fb.h into its only
 user
Message-ID: <202602151553.HsANnxdE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <e7fbd64f4dd727174a29349975d3b5598f7f801b.1771163316.git.u.kleine-koenig@baylibre.com>
References: <e7fbd64f4dd727174a29349975d3b5598f7f801b.1771163316.git.u.kleine-koenig@baylibre.com>
TO: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
TO: Helge Deller <deller@gmx.de>

Hi Uwe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bc57657bd3e64feaac5b4bf3fbd7f8a2fd09f4f8]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/fbdev-au1100fb-Don-t-store-device-specific-data-in-global-variables/20260215-215946
base:   bc57657bd3e64feaac5b4bf3fbd7f8a2fd09f4f8
patch link:    https://lore.kernel.org/r/e7fbd64f4dd727174a29349975d3b5598f7f801b.1771163316.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v4 6/7] fbdev: au1100fb: Fold au1100fb.h into its only user
:::::: branch date: 14 minutes ago
:::::: commit date: 14 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260215/202602151553.HsANnxdE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#55: FILE: drivers/video/fbdev/au1100fb.c:85:
+struct au1100fb_panel
+{

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#70: FILE: drivers/video/fbdev/au1100fb.c:100:
+struct au1100fb_regs
+{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
