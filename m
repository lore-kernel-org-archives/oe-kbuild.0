Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711F77080D
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632234; cv=none; b=kijvJgXm7ytdaLYvCBjdOU/cCH9of01+4ndeISqBp5koBLSt+cZf8r/Np14aR4qBzksGlfSquVwG0vOdJZ9dAGyHLL8Q4KSmjDtkublMicklS35ET9pNnmfniUjxGJuYUmAWjpXwh+mHgzk7AaFSAJFkv0Kuyl+DPo7YC0P3JiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632234; c=relaxed/simple;
	bh=cZ65g9Mee8Gpb7zzxkAbuAyPnwli0YQQirnDbhCk7mA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TEBxNHi4MumE4GGjhkmqi5bCOrl/JVgguxjpSERX7isttdhI8Bu4/7rALv4EBxKWJ3FgqNzhyhpLdMdNgXNufmL0HjLxWEmXB8Bj+tH6HRAw05Qu7oH/TGZu+3k7evOHjbklIZBUK+5X/oixf5DDsaJwWfaYHbCZbkxsp6NEUds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJNtNF9x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJNtNF9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772632233; x=1804168233;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cZ65g9Mee8Gpb7zzxkAbuAyPnwli0YQQirnDbhCk7mA=;
  b=JJNtNF9xu/JFa+f5/s64qdgLtMBsv/fHPkqnXv/psUXwiYqkXElGt3W0
   Q6Q7hw+R+fGwHPbYGlkrKKXsI+BVGr+2asaNCJ3+91QM7tn7j+p9yRLzb
   r2DECd1EScBCRunMQ5B3JmiEMwH9B+FdGSHrvXooiKTx1Cb76iZ/P12Nf
   M6Fb67YkNM2XzAmnG2CE1+sv7xig/qGYwR07SUunWGZi1RxHdLKh4Vtfz
   U78pNreWSAKwG2MfBp+1wSw2mrXzFVfG+kZZaCWWPr8ew76+Gn9O8glah
   mGDvR+5P+ME4MQpYw/O3XiZh7eLYMSw1wT9YhFNC7Hl07ASjS3K1RapvR
   Q==;
X-CSE-ConnectionGUID: qcgUVRz5QMuOUsOLbazZhQ==
X-CSE-MsgGUID: AvVxitP2SQWMiIbAUA3bJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72716430"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72716430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:50:31 -0800
X-CSE-ConnectionGUID: wBkRY46kTy+9d8FsGnHTew==
X-CSE-MsgGUID: yOxvGGSsRMKw5Bei7V3W2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217502194"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Mar 2026 05:50:31 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmcN-000000001iV-3Hj0
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:50:27 +0000
Date: Wed, 4 Mar 2026 14:50:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] drm/xe: Add watch_queue-based device event
 notification
Message-ID: <202603041444.dsixkspP-lkp@intel.com>
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
In-Reply-To: <20260304125220.165004-3-thomas.hellstrom@linux.intel.com>
References: <20260304125220.165004-3-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/watch_queue-Add-a-DRM_XE_NOTIFY-watch-type-and-export-init_watch/20260304-205630
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260304125220.165004-3-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH 2/2] drm/xe: Add watch_queue-based device event notification
:::::: branch date: 49 minutes ago
:::::: commit date: 49 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041444.dsixkspP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#32: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
