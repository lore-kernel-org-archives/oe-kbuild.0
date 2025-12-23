Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5989B2D592D
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 03:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766462318; cv=none; b=BjJkFrqnYFoxHNgk5tMTM8jEnnXkd7Qv0UzKa5Ag7lwFBNb3cCxtECbDSuqDVmW8uo8YGqdVhS1fSypKYoHzdKfrSNWTp1LZS1AL4U7KtfkVrtDkkcpQyLhEDcDYdKswkCn0eRpSIHFYQepmSsmBnk9+n2fgpo0fN3jYag4wGPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766462318; c=relaxed/simple;
	bh=JJXC1lAOG7vrWEcDZjbFv4LL2ZLGKXtsiyLyDZhXB5s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XKjbr0Ll0MvCZZtLfcbQm4NuTlMYFZFFieRSS5Aw4KczpMkTz47EkFme7bhApM0nBuPb8tn+1JwPbtQLwvT4G7P56BWCJtELMnQPsRZm3SJP7hA36g3paWWaHxo5zqt7ROWD7OPskeT8JXmoN0qRHHRMD9OvWB+0MMuyE+TBOpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAzav8Eu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAzav8Eu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766462315; x=1797998315;
  h=date:from:to:subject:message-id:mime-version;
  bh=JJXC1lAOG7vrWEcDZjbFv4LL2ZLGKXtsiyLyDZhXB5s=;
  b=AAzav8EuOGbrxu/CPIzRBNvxMffSvB0GG5zkuZACI6EVc1i+Oao4XhKL
   PnuF04TvYgXGXi6Pg/P5uWBoo8ySN6Z4EeIV6RWHh8+kAfEHSHWtowrLP
   5iH6w2gtx1vauiTAKjolDXSu0Ijo0Pr6vE2m5yJHi+dwn3zja6W+B9RPI
   jXRkLBthiWktZGDG0pK1IsOtd3ScUk4OQxdIIb/3Gf8+rY5uB6SyBQfJp
   4LBLyHht0Eot/dlXl0JQWNsDG2rvhtEKR1YSjaV4MyQKBkZVAudb/4k//
   NcHiNSPxRe2OeCXNb96a6vTzPrjYhKaodxNI4LQID0kD2mG44IGrioCUt
   g==;
X-CSE-ConnectionGUID: Fd/q2RlxQF+G+P7tbZqjVQ==
X-CSE-MsgGUID: Ku/cf2E3ReCkuhVQT1nr9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72175657"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="72175657"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 19:58:34 -0800
X-CSE-ConnectionGUID: w+CZZsVtSPK9fvWwdDBYMA==
X-CSE-MsgGUID: ugoYRMxWTQukg6EwIKDObw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="230345437"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2025 19:58:33 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXtXa-000000005m4-1l3G
	for oe-kbuild@lists.linux.dev;
	Tue, 23 Dec 2025 03:58:30 +0000
Date: Tue, 23 Dec 2025 04:57:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v6 19/28] KVM: s390: New gmap code
Message-ID: <202512230445.qxXGFFRJ-lkp@intel.com>
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
In-Reply-To: <20251222165033.162329-20-imbrenda@linux.ibm.com>
References: <20251222165033.162329-20-imbrenda@linux.ibm.com>
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>

Hi Claudio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on s390/features]
[cannot apply to kvms390/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Claudio-Imbrenda/KVM-s390-Refactor-pgste-lock-and-unlock-functions/20251223-012700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20251222165033.162329-20-imbrenda%40linux.ibm.com
patch subject: [PATCH v6 19/28] KVM: s390: New gmap code
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251223/202512230445.qxXGFFRJ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'asce'
#1361: FILE: arch/s390/kvm/gmap.h:235:
+static inline bool gmap_is_shadow_valid(struct gmap *sg, union asce asce, int edat_level)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
