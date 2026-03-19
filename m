Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5123EAB3
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 03:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773889878; cv=none; b=CRs917pemwJXxdw0BKLLiVwW2wPhZZbnzPx+/23vifz3QvXFXh6d3xHlctJxFqWKqCfaLAQvB0y9LBdasAbJq2LPWXLKqfLXROODRVtcR/NynUA8VgB13f0CFGS7UmrhgkpluB2HnkYCumc3h4V4srWsSEk/kFuPTA/uZM7QHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773889878; c=relaxed/simple;
	bh=oAb7KTZrRcqm2+IJGRXbsaxz8iTdpqTPE3ZGBdg4s1U=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cpymry/TgcD2bYzcOjndahNlR6mnKUml5gQOeknOh4hS6tTDxnOVj7VYG2toOrmsFoZx3aLGRoLJaVXOsJgju8BFz7GkrV2e1PXfUIwXMnJbdYNTw+XLJCXmsoDRNEfwFMmfP4tV11zRuU55o1S93PqPMLuxUPRKLeTYeqkfbL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ks5t7aGx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ks5t7aGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773889877; x=1805425877;
  h=date:from:to:subject:message-id:mime-version;
  bh=oAb7KTZrRcqm2+IJGRXbsaxz8iTdpqTPE3ZGBdg4s1U=;
  b=ks5t7aGxV7Q0GjUATZbaFAkLGrKiGFJt59Wx4xNVDATLXohkJQ+c0Q9o
   HQCBFgsChDQDIrqJ2vq1pt2BSm0AqhmUlcSOXmJOFFwFgJApiKrRsipQY
   HnSSKMdcXHWOM2G6sJScOPXlr5Vx1DZJ/aXvmG8MXoebTNTCDBo/EiEP+
   DaG9iWVYTQReLVRR+2zyhdMwDIZdK16NJgvGbfvn3EV4PzpMedxpvVn3A
   FVPRZLu0WK3LHI5oQv/AIJopiLnCpbpTNZBZvxxRgxy6jcCPYHANSrAAy
   kiyr5cqI1b868IAFIeVUfHrmF3a2rs+jo6m5bC2xbYeVMNXNuYCRTLZvV
   Q==;
X-CSE-ConnectionGUID: Q0bi7QqzT7Kre1uliKyRBw==
X-CSE-MsgGUID: Xb2D5CcfSgyZ3V47ywJ/rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86435058"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="86435058"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 20:11:17 -0700
X-CSE-ConnectionGUID: Pu3EkgPlTiGxvY3+UgJTbw==
X-CSE-MsgGUID: dpKgiWNlQ0i6EHRS7JnvEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="226962456"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 18 Mar 2026 20:11:16 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w33mz-000000004lR-2XgV
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Mar 2026 03:11:13 +0000
Date: Thu, 19 Mar 2026 04:10:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v7 1/2] hfsplus: refactor b-tree map page access and add
 node-type validation
Message-ID: <202603190406.ImrKvmxu-lkp@intel.com>
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
In-Reply-To: <20260318073823.3933718-2-shardul.b@mpiricsoftware.com>
References: <20260318073823.3933718-2-shardul.b@mpiricsoftware.com>
TO: Shardul Bankar <shardul.b@mpiricsoftware.com>
TO: slava@dubeyko.com
TO: glaubitz@physik.fu-berlin.de
TO: frank.li@vivo.com
TO: linux-fsdevel@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Shardul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shardul-Bankar/hfsplus-refactor-b-tree-map-page-access-and-add-node-type-validation/20260318-231816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260318073823.3933718-2-shardul.b%40mpiricsoftware.com
patch subject: [PATCH v7 1/2] hfsplus: refactor b-tree map page access and add node-type validation
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603190406.ImrKvmxu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'free'
#264: FILE: fs/hfsplus/btree.c:585:
+		pr_crit("trying to free free bnode %u(%d)\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
