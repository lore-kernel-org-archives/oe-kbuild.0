Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA23F12C8
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jul 2026 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526068; cv=none; b=MHmh6WvFPQTKGUWDEFHUiQI+hn+r8uP+P0Q4Bd8FzYTmAKF1x5qJXvCBQWtpCFihTzGobXU2ubKyA8fB8EhgexukMDOD7MyEHFRubZlSx0TVYkkb/dtPCy5/Ahx4asKrUM+8cx/uLR/aT1KzkQdhR2TVFOoKl/IeUnbMpK3Fi6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526068; c=relaxed/simple;
	bh=ck3UcsdnUoATs8DGe1J0bbmXdTH1bQ45jU+6+s8KuBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LuXbIpRRyIG0CqvrI7kLa2e/vhc0AivRiISmgdWjDTCfgCn2hPFcl8BU/Kea182uNgZjaedmFqHtb+Yb0Ah3/mRrEL0B2B9MIZ3G2wY4+I7fJcEIMQjz8DYJMS8K/tna8JJ88l3+S0LWpmhSRJ1zMoG8Vq2gUjJN6lpX6qRp5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQj52idZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQj52idZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783526067; x=1815062067;
  h=date:from:to:cc:subject:message-id;
  bh=ck3UcsdnUoATs8DGe1J0bbmXdTH1bQ45jU+6+s8KuBU=;
  b=fQj52idZ1jx22bdgor4OMLxh6MHaoOQXBEogQ1C+ztbrwVCzpo5RGpnl
   lP+/MQUby2Lo4/hqJ3TZE7KTTCLrfQHW40FLmpNPKCig7fC38WF2+H+i4
   BncMvxFU0sJHcw0g4KHkrgho4N9ZY3m07c8zKRSQPqUenlzwzca0CTsbW
   OxSAzuYaUY78edtne2qwIu7Q0tDbfydqp1/qTue9ofTusyqyA4OXCOVlM
   IJADRRFmzCuhUG77BmInwdA50Vfiiiwp4RY2V3LCS3Ia4ZZh3lJ0HJIYR
   REZ0Rqf0Vz2K3+8SVRl2Re+V5Q7S6IIgQsPI8hNrYqkaS6dIhRrv7PegV
   Q==;
X-CSE-ConnectionGUID: Dg6YUmwVTb6rdblijBjUKQ==
X-CSE-MsgGUID: nIibQf6PTbmjyRbJsT/2FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84249277"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84249277"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 08:54:26 -0700
X-CSE-ConnectionGUID: RY5irHckRC61yG9M+OSb6g==
X-CSE-MsgGUID: Ot5y+ggcQiO1sJkMv5Xc8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="247949758"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jul 2026 08:54:25 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whUbP-000000002lV-0Apc;
	Wed, 08 Jul 2026 15:54:23 +0000
Date: Wed, 08 Jul 2026 17:53:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 59/196]
 arch/arm64/boot/dts/qcom/talos-evk-el2.dtb: bluetooth (qcom,wcn6855-bt):
 'vddrfa1p7-supply' is a required property
Message-ID: <202607081711.YoOlCiQf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Xin Liu <xin.liu@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.3
head:   e43584952ee7df0f72e8311341d780d84f03159c
commit: 93d60582eb52e50ea11f95397a2b3633b12efa66 [59/196] arm64: dts: qcom: talos: Add EL2 overlay for talos-evk
:::::: branch date: 71 minutes ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260707 (https://download.01.org/0day-ci/archive/20260708/202607081711.YoOlCiQf-lkp@intel.com/config)
compiler: clang version 21.1.6 (https://github.com/llvm/llvm-project a832a5222e489298337fbb5876f8dcaf072c5cca)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081711.YoOlCiQf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607081711.YoOlCiQf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/talos-evk-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p7-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml
>> arch/arm64/boot/dts/qcom/talos-evk-el2.dtb: bluetooth (qcom,wcn6855-bt): Unevaluated properties are not allowed ('vddrfa1p8-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn6855-bt.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
