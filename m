Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CED728BA98
	for <oe-kbuild@lists.linux.dev>; Thu,  8 May 2025 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746735525; cv=none; b=XWMuAfnnQv/JSylcclxgq0ZlMB0/VhwrNMwUfdygSFPpzUz6GXOg8McSnO/fsQqVpm8Y0HzvdMsiWPKPjd84JCZA2NUvOuLlh1tlI5ZMdBx0EvWD+b24UCIegOoHOo4Tit4xmDMv2i5XeDyjdiPUTuW/XP2vkmRrNdXLUJ2ShNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746735525; c=relaxed/simple;
	bh=kXH4fi54CeCjaytlaXB0/shX2EOUhcvnlZREjUAfRIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gdyWU6yj5U+DkQfdDnrLG0uI5ukJw6HWVAPEeus5d8W1uJMP2K9UZt6Sp9OVhkt10QviANozAlKCqm2Glw8FGMfo/aIidkPsz1JEm2socHJSftqBNTxquk+dwmimY9l2gONCBeKBp0Ruuv30Kg206CCt9hM1CT2ntrOxMtSUCnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZg4lXpZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZg4lXpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746735523; x=1778271523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kXH4fi54CeCjaytlaXB0/shX2EOUhcvnlZREjUAfRIU=;
  b=iZg4lXpZERuQtRvySOZesO4N6QFQSJjb+L1O7XImEgZANqBmeqVSSZFi
   SusOp+dvzRuwR6EzaM5Q+zKWh+E9FrAPlJgj2nKrkk5eZAJiIAqabcHL1
   UOJtXvloR45rtCUGNz2MkCsTWNm+C+GXEq0/8CifEAOEozbmfhN9W7eVz
   nHY953yOjmPMqo3U5//+xarVTUg+kck2lfqU+6VbwTNFrAghZ7gFPxAGP
   gfG8WrE/nIp8/AOR4EofSG8Jl4oHLET+VLS9B+y2l5ol0iQS7Vgr/HMBK
   2N/NQNULcM0XQmJlUR8R7EqoQEAV0/4ylqXTRf9a71LV5DG4NAj55RffN
   A==;
X-CSE-ConnectionGUID: nS60oHULQS2QfVhU+AuBDQ==
X-CSE-MsgGUID: mSmhOD2xQ/i2N3ZNhC+/pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48623606"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48623606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 13:18:42 -0700
X-CSE-ConnectionGUID: bwsoL496Rw+4uvhC8xkKuQ==
X-CSE-MsgGUID: MwT2/d/JS9e7GvKefHjKgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="159699411"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 13:18:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD7hX-000BLL-1w;
	Thu, 08 May 2025 20:18:39 +0000
Date: Fri, 9 May 2025 04:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/8] arm64: tegra: Add p3971-0089+p3834-0008 support
Message-ID: <202505090457.qMTY9MLk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250507143802.1230919-8-thierry.reding@gmail.com>
References: <20250507143802.1230919-8-thierry.reding@gmail.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Thierry Reding <thierry.reding@gmail.com>
CC: Jon Hunter <jonathanh@nvidia.com>
CC: linux-tegra@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Thierry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tegra/for-next vkoul-dmaengine/next abelloni/rtc-next arm64/for-next/core linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thierry-Reding/dt-bindings-dma-Add-Tegra264-compatible-string/20250507-224445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250507143802.1230919-8-thierry.reding%40gmail.com
patch subject: [PATCH 7/8] arm64: tegra: Add p3971-0089+p3834-0008 support
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-052-20250508 (https://download.01.org/0day-ci/archive/20250509/202505090457.qMTY9MLk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090457.qMTY9MLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505090457.qMTY9MLk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@0/serial@c5f0000: failed to match any schema with compatible: ['arm,sbsa-uart']
>> arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bus@0/pmc@c800000: failed to match any schema with compatible: ['nvidia,tegra264-pmc']
>> arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: bpmp (nvidia,tegra264-bpmp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra264-bpmp', 'nvidia,tegra186-bpmp'] is too long
   	'nvidia,tegra264-bpmp' is not one of ['nvidia,tegra194-bpmp', 'nvidia,tegra234-bpmp']
   	'nvidia,tegra186-bpmp' was expected
   	from schema $id: http://devicetree.org/schemas/firmware/nvidia,tegra186-bpmp.yaml#
>> arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dtb: /bpmp: failed to match any schema with compatible: ['nvidia,tegra264-bpmp', 'nvidia,tegra186-bpmp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
