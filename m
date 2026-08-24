Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A72641D129
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Aug 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576902; cv=none; b=Klj1IRFTkaL56bQUBxixhqvrhMo49TZsQUutMtTtasQy6KiKTBeprQjSjm+rQz23dl0oGKPnP7hZgGPy7pMxf+YUnL6Zpj6OifcoGazQ8zD9uZJkoCcgfEYHVsL8UfPp/okHXd7RGaTNdlNr12No65G08Gn97b5LdvUeojW6RIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576902; c=relaxed/simple;
	bh=D/28YAe1ptQdKEQ285j4sgcFLdoHgymuVALCem931s8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DyRkEeT3KfZ+9+G/jNxldpWIbzCoKMvhdjswJmWUxup8GFelu/cXs/dEOxo7NgABO9JmUSMAEjhmCeGDG2aB84K84gh/DWIw12iMZGobZ1INxsRaFp8INYLjPPPVI1nprhqXCvAYm431wVclnpk+RHXoncluYE+mccusdBR2d7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbKqXUT/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbKqXUT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787576901; x=1819112901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/28YAe1ptQdKEQ285j4sgcFLdoHgymuVALCem931s8=;
  b=UbKqXUT/LVzGirZ3llA+2zTL6RSyVMuID7wnnIa/NN5XnZ6mdc1VhDzG
   AxBqDMr4/M3fDfWC/PQd/sTBXTv2f33oBETVwcF8CDoRr0wR4G6ks+rw5
   tn4WmJwGQi3em94dXT7vESBtyO/K5PqXWO/HvgB338FT+FeNlpYcLeXnm
   msVSJv541NLRoZY0LigUQyFxOt1dw5o1HxXrcXngKfOD/1PE5+OySXITH
   ioKZF5DouERGp6R9YTL+STAh53c/utzbKMnPh9C0Gc4OfuK/aljNhPnd2
   v2XjXf+6u+FtZvme+50DLHVPHXnHayuWRqh+qrgQXiH8h1SeI9Rr1912l
   g==;
X-CSE-ConnectionGUID: MfHrn9DORg6saI9lIu2ojQ==
X-CSE-MsgGUID: dxMaPGZgSfyxnAluuX8vGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="99188022"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="99188022"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 06:08:21 -0700
X-CSE-ConnectionGUID: 96UiJSsiQTawJmheTt3RNg==
X-CSE-MsgGUID: PXHdHl1XTR2xJNrltfC1oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="268946619"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Aug 2026 06:08:18 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyUPM-0000000034N-2v9g;
	Mon, 24 Aug 2026 13:08:13 +0000
Date: Mon, 24 Aug 2026 21:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH] dma: swiotlb: Size shared default pools for memory
 encryption
Message-ID: <202608242109.rcbFVYC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260811134056.756015-1-aneesh.kumar@kernel.org>
References: <20260811134056.756015-1-aneesh.kumar@kernel.org>
TO: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>

Hi Aneesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260821]
[cannot apply to powerpc/next powerpc/fixes arm64/for-next/core s390/features tip/x86/mm soc/for-next linus/master v7.2 v7.2-rc7 v7.2-rc6 v7.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/dma-swiotlb-Size-shared-default-pools-for-memory-encryption/20260811-191056
base:   next-20260821
patch link:    https://lore.kernel.org/r/20260811134056.756015-1-aneesh.kumar%40kernel.org
patch subject: [RFC PATCH] dma: swiotlb: Size shared default pools for memory encryption
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260824/202608242109.rcbFVYC1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608242109.rcbFVYC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608242109.rcbFVYC1-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: swiotlb_adjust_cc_attributes+0xa (section: .text) -> memblock_phys_mem_size (section: .init.text)
WARNING: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses symbol 'devm_iio_channel_get' from namespace 'IIO_CONSUMER', but does not import it.
WARNING: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses symbol 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but does not import it.
--
ld: kernel/dma/swiotlb.o: in function `swiotlb_adjust_cc_attributes':
>> swiotlb.c:(.text+0x17fe): undefined reference to `__udivdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
