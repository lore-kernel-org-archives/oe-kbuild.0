Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F401D54FA
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767372938; cv=none; b=RFhBfmPlem52EgsNX1zf8/zp4SLJKiyBxJ6JBJ4W6kg50bINGjbtvhznro5X9gJDskXUVYAlbNL2VLCEF4cbUZgV09gUrcR8aiTaSeOkAHyCrcAqNsW50DKO5DeW6ewZ4GuhZvq8+hxBguuyXJ59kHLiNB/P/Z7vFWQrvGovqD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767372938; c=relaxed/simple;
	bh=fgWpyd8JkQRaDBS0WKD+6CtRWr4SnYuGSuWRJP48xC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvnFbmUPYs3JcVqNpHGJXNkca4zIcjk/fTIHNIh2ouArxaYbaXM38UwVW0wvgXnKiC1Bv8fQ1/HsbhkurOwtxVJFjAIFLmk8BnGRNLB+243dEmn9ulY9Fr5doh6Pmu+oV7o7Ud4ZlpTsCplXm+GqGhTP0NEALyGZgb+1Z7JpsLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BoDW0W4l; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BoDW0W4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767372936; x=1798908936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fgWpyd8JkQRaDBS0WKD+6CtRWr4SnYuGSuWRJP48xC8=;
  b=BoDW0W4lnddM+zjsB/NDjwCW4ZFICTp75awUrQmcns7c/kwDoCl448OY
   97DsawM91QHrU4XLMBrYA9xIt9JwY47/MP40bWuhKVOLh/Y6Rj3eWlfpv
   1Ojj+ZdVHe5Y+lklHykfXFqrG0efqcAUxRv9/vMqSmDyo3bZT/is3mRRI
   r8FN7xO+GM4N9T/en0AlcyCtmVGBsIDlmkGQBOXCT4cyU6NhekBRILI7V
   rDwn3Py33Wzinac1NQrRyYesbabdpjp3G6NcTzVyfcnmou1eCq0M2m/bf
   3/vhfn8Y98w131+1i9f3fMPOG9lWiFdZOoJZrTLi8T0Qtl9ib0Q4GOnni
   g==;
X-CSE-ConnectionGUID: i5FQj+biTMeMKM/WN/jU5A==
X-CSE-MsgGUID: d4OjTwj4RWinlAyn/WljQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="86447569"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="86447569"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 08:55:08 -0800
X-CSE-ConnectionGUID: mwXsLFHjQF6Clv9ZwD5cmw==
X-CSE-MsgGUID: Ehh82b5PR0ahvzYf7Uyw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="239301807"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 02 Jan 2026 08:55:07 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbiQb-000000000S9-1G5E;
	Fri, 02 Jan 2026 16:55:05 +0000
Date: Fri, 2 Jan 2026 17:55:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <202601021756.yWClvCed-lkp@intel.com>
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
In-Reply-To: <20251229071258.456254-1-sumit.garg@kernel.org>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
TO: Sumit Garg <sumit.garg@kernel.org>
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: andersson@kernel.org
CC: konradybcio@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: akhilpo@oss.qualcomm.com
CC: vikash.garodia@oss.qualcomm.com
CC: dikshita.agarwal@oss.qualcomm.com
CC: robin.clark@oss.qualcomm.com
CC: lumag@kernel.org
CC: linux-kernel@vger.kernel.org
CC: Sumit Garg <sumit.garg@oss.qualcomm.com>
CC: Prakash Gupta <guptap@qti.qualcomm.com>

Hi Sumit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Garg/arm64-dts-qcom-agatti-Address-Gunyah-memory-alignment-needs/20251229-151411
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251229071258.456254-1-sumit.garg%40kernel.org
patch subject: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2051-20260101 (https://download.01.org/0day-ci/archive/20260102/202601021756.yWClvCed-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601021756.yWClvCed-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601021756.yWClvCed-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/agatti.dtsi:1977.27-2050.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/agatti.dtsi:1935.11-1945.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: display-subsystem@5e00000 (qcom,qcm2290-mdss): iommus: [[38, 1056, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,qcm2290-mdss.yaml
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: video-codec@5a00000 (qcom,qcm2290-venus): iommus: [[38, 2144, 0], [38, 2176, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
