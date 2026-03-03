Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7B371CE7
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546664; cv=none; b=WubV3xlIT7eKmNnjREAoaDRbcrm/Y3kRPIoB9kW6yraLymZ8MIA+HAykTm7K3Ez/ttXmlZdHu53Ho9nGxX+6FPLXYhcnxhTMrxDBlaQ3f3A4JrHtdagLrKEqLTl5xmFwGgQKpe/cbshZ5YDvbhJMMmHGuJP6KshNdEMMi8L5W3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546664; c=relaxed/simple;
	bh=Mnha1OJwFA54cQRk7jw5Zd+m92BnvRZdGCsx37PFcKE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p6ZXxG3389LuN5u5o7D2ZLWBZWuu4j9ZTtKrBOlomKvYh26obK8bREl4C5/9a6uzf9OXEhFCj38t5Cdii3dRHX3t4mFKWyBC7C9asX6LyKD8uHb2n/hIMI/41V2t3F+EqAWSxK1vEbkH4sgkv8FRbyYcxRkrMzWfw+W8Nbd1xDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoFINwWO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoFINwWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772546663; x=1804082663;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Mnha1OJwFA54cQRk7jw5Zd+m92BnvRZdGCsx37PFcKE=;
  b=HoFINwWO1zbEy/y0ai57oiY4lDlVyTkBp+zOcCfpKRvicealb7fcAf6V
   BZYjkhlyiTEFuHhJhu7l2YPROegM6BaTWgJQj/Vt28b0VoMIO99u7LBmE
   qTEyh8abcaWKpZY0y8aEehXuYforZNiT+DrjQ0emOj+HxLghdzte4tOMt
   MTRTYrSNGokFuFZC4+04hHLRMDnTEzwgAMMRrgn4+p8pyOSvTHCBK4JV7
   9rNqbNBRXinUZkmNM7uEyCCz9MpRFA4+W+oTvizBc34AxM0k1ZDnrMEc2
   KnULY99+ZHTZ3yeEYvtR2bx9gOW9rQWNlIYEFPDYg2hhecS4CU3IWCLgb
   g==;
X-CSE-ConnectionGUID: MwyLfzJtRn61byect/P0Mg==
X-CSE-MsgGUID: gvrYY4zATqu7EQd8bDFbCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73494948"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73494948"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 06:04:18 -0800
X-CSE-ConnectionGUID: pwKi3O/SQOudjA3fDdRMFg==
X-CSE-MsgGUID: uTd/mKtaTN+zVk4OzuPXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="215514777"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2026 06:04:18 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxQMB-000000001TI-2oPQ
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 14:04:15 +0000
Date: Tue, 3 Mar 2026 15:03:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 4/4] drm/xe/userptr: Defer Waiting for TLB
 invalidation to the second pass if possible
Message-ID: <202603031520.jERtCRDA-lkp@intel.com>
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
In-Reply-To: <20260303133409.11609-5-thomas.hellstrom@linux.intel.com>
References: <20260303133409.11609-5-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
TO: intel-xe@lists.freedesktop.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/mm-mmu_notifier-Allow-two-pass-struct-mmu_interval_notifiers/20260303-213841
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260303133409.11609-5-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 4/4] drm/xe/userptr: Defer Waiting for TLB invalidation to the second pass if possible
:::::: branch date: 24 minutes ago
:::::: commit date: 24 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031520.jERtCRDA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#45: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
