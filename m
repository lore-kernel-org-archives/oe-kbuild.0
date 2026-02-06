Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360BC316192
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 07:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770363339; cv=none; b=UpatUz0sFMq8uLhNMTjQp7bfxA5z3FRw6gkaEqEg1V43XR/l4RLyGOmq3ixs0uPRGO3sPt8+0vtcsOPQqcI9B+xE8pvgEwVEwKCH68lnonV37+kPdOwE6gXZ5xyZnn80DOVkxTSNa18MwDsINHkfl7DAehXLTRCmsJ1DF+YcH+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770363339; c=relaxed/simple;
	bh=ruiGefZ7S0xndYq76ZaMB+74QjM7QeRqXYnoAYvsc+Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIxvz4cNQjGqhKbrCrDTWmDOPo9elBzLi37PrEOf7vO60NvBqykAvHcjWol8UZ/c7+fn3l2c/bGpyc9HL7GjRJ+uYO0la0WTIH37XnpMBhpjgz0UfOyGGELOOtux44wGSYTq43N6fWLXKVATUrLo6T67PGRLdosS/uFeo6hwsjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Otl/ig0+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Otl/ig0+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770363339; x=1801899339;
  h=date:from:to:subject:message-id:mime-version;
  bh=ruiGefZ7S0xndYq76ZaMB+74QjM7QeRqXYnoAYvsc+Y=;
  b=Otl/ig0+xC1j2WTZQCKf8nQmHGPCCWBoks8EN9U1VhcmUPuw8lr0B1l6
   XGJelZjmtPqSsCIODgpUZyfXgtY1wo4Xb7XwllLiBx4xBNZ4WcUHdI0nY
   fJ3t91zT+7rcBwqeZ9xpWsJuv4vzqVU0mfBlN1lNWOzToqZWMMR61sBS2
   i+5JF4m8soYKu3ixKRpIYgjuuh5MRkQRafCcyOYFq3dK4+1DbdwkNmTPV
   wf9xxo9ywOwUUM3QkPvEF/2TfJ5XYvoEoSgcFRoLIxYl2V10ewLYOC0Mp
   0pc2hHn71S46EHQiL3KRyXGcz7p0If3ySpG+HE0m3sEEbmDu0yJ+SFhjv
   g==;
X-CSE-ConnectionGUID: Zr88KZzETqKS7XKuMvShug==
X-CSE-MsgGUID: JqB8iFZRSs2sG6sjC9rxdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70585595"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="70585595"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 23:35:38 -0800
X-CSE-ConnectionGUID: 3sxVOJd2SKyVapcEHRJuDA==
X-CSE-MsgGUID: vKOlVeW5Rni0HwaJsaPh2w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2026 23:35:38 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voGNM-000000004R3-1n4N
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Feb 2026 07:35:36 +0000
Date: Fri, 6 Feb 2026 08:35:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 10/10] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
Message-ID: <202602060838.4N527abl-lkp@intel.com>
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
In-Reply-To: <20260205171411.34908-11-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-11-srinivas.kandagatla@oss.qualcomm.com>
TO: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
TO: broonie@kernel.org

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-qcom-q6apm-fix-array-out-of-bounds-on-lpass-ports/20260206-011958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260205171411.34908-11-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH 10/10] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260206/202602060838.4N527abl-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'adding'
#10: 
Improve this situation by adding adding a functions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
