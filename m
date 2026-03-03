Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54134F495
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546662; cv=none; b=G2r5h7cM5qT3K+dP5VUBTBLjUGNeOIoNoPCFX52mR3wVcXCJJAt/Cope1PdLZB8SYP4N8Dmj/gU8LbRPvuy37UBfQ48vJswP6rVmxcgSib5N9gWYzzTGS0WZTqGTVtazZDbR0cifj/CTCjv0fXid9q8LZOgFnLcovjozeY5on8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546662; c=relaxed/simple;
	bh=jLZrJaH8V81h7hg+gYf76UOZZ6cL24pCiNkDCXSWcf8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOhHOpjYBMMlIQoufTEHvNHsuEmPhGauUvrUl84nqdM7jLXmvscmuYvNO+fVLbmRzdZPdRSCZv8bzMOCVzvlM8FZ8rxXENGFjth/lxvO9ZlUQwWeOpo+HlWJf+PffzQJudrnY9lJnXb27uvMDYqJvr7aLfuLFcojRYYbOBVCUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAEk9/XM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAEk9/XM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772546660; x=1804082660;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jLZrJaH8V81h7hg+gYf76UOZZ6cL24pCiNkDCXSWcf8=;
  b=QAEk9/XMhBYSe8XtWTf5Z7+ixuXa2TkXyTfM7jYgTLJUqdK/TDS9AM4S
   0FHbNfY+LmcQ5aCLUlTRN/7h2dw9XcTHTmkYk4OGfKuvAqKpmtY6Ghxnj
   BfaSDS2OhdBn8sxhNRnbN0/PrfKA2F2JeMv6vGI3bE2HIskTnXKr67Bsy
   qh4POpQSRzih3W8RtlbKJpb5HU0IU32SY4YOnaXpvbpjKzm2tw7cTTe5l
   eDw0yxEZa59WFnVMGZABBZGJUhjOUrzPeYKBEMUknvb7iSJ3H9Let3iLr
   5aCAsTTlwBXh9WonzP98YqKe8hSdtu3JDfaXdEAr1deWyAfu147a7QuIP
   w==;
X-CSE-ConnectionGUID: i3ve9q0AQhKGel/q277mZA==
X-CSE-MsgGUID: 8Bk8PJnBSM2vOfs6Ew8Qpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73494946"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73494946"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 06:04:18 -0800
X-CSE-ConnectionGUID: 2zqNaVsYRhikTk63KMp6xQ==
X-CSE-MsgGUID: /ihb3GIVTXCZ1uwTaV16lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="215514773"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2026 06:04:17 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxQMB-000000001T9-2GjT
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 14:04:15 +0000
Date: Tue, 3 Mar 2026 15:03:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 2/4] drm/xe/userptr: Convert invalidation to two-pass
 MMU notifier
Message-ID: <202603031539.GzmPxSWq-lkp@intel.com>
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
In-Reply-To: <20260303133409.11609-3-thomas.hellstrom@linux.intel.com>
References: <20260303133409.11609-3-thomas.hellstrom@linux.intel.com>
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
patch link:    https://lore.kernel.org/r/20260303133409.11609-3-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 2/4] drm/xe/userptr: Convert invalidation to two-pass MMU notifier
:::::: branch date: 23 minutes ago
:::::: commit date: 23 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031539.GzmPxSWq-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#38: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
