Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC9D2F42
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219660; cv=none; b=cPVgaJkXMGacFp5AQfe1ctHE8RELinFE10A8JzoWn/VrY63SITT7a7YNjMDHlShRDhUeqK5rN2+xrIFdrHIm3FCtG6X2WgJFpyo+vEulfXcp2Rz+CnmUJe8Zh95nb9aiEiJkGD5K6tuDnmy2SwE03RM7yELpoxgj0fKV9nmWfo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219660; c=relaxed/simple;
	bh=1xIx2WyqnQb29BvSSPaSYSfNrpOSoY6sw6HIkAo53EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oaFRfgUwQSRaKJgK6cA9Rlb5WUe0P5JHaNU9iTg88VshlpxI8B8jB9rBf7nAiOucP5BzJu1O0NG8VPtsO5V2VxCvhohdKsNPaLTb32q+Z0ODQK4iAMIlMb0JPen6LJ4p8kxg+yjPj2ReCktVK7mYJS5nzowNOQtzQoMwq83kLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+txH1Zu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+txH1Zu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741219659; x=1772755659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1xIx2WyqnQb29BvSSPaSYSfNrpOSoY6sw6HIkAo53EE=;
  b=M+txH1Zu0Z/qOZxBWvCRWyLG0iwnTZA5QcBCF95ZksxfkxZeT5V2jKSq
   hmjGKbOGCmV9zrDQwwcAP9SMqefrn2mUiL2wy899y4so7azgiZ9t9ePl2
   mzyQNfoGrCt09NLBJ6A26viQVoYXppupYZ784ShhFAJ0k5BK70bP/5RVb
   RGsrxi/Kfg9ceSu+6ENYro0bdrGZAhOm4VKMXeJSWH7VRxqN/k1OEbWie
   ImOE+zYtAk4AuYxWH2THFLnrwYtLkvM12OXqNIUc/MIxNi+x8nHGoyix1
   2dH0f7zMomRQEPosLRwOOBJBBATNxHikSIyuBMetnXbpGKmDBWH8Pobhb
   w==;
X-CSE-ConnectionGUID: 89AcRxh4R3y3XnUmEB2CvA==
X-CSE-MsgGUID: Z7I/pwzoTneDkUJNvLTM6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42341069"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="42341069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 16:05:32 -0800
X-CSE-ConnectionGUID: nP9Y2maGSyKx+Gqeez9I3g==
X-CSE-MsgGUID: D91WfgcPTnC+xzRzur8zJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="149619647"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2025 16:05:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpyjn-000ML8-3A;
	Thu, 06 Mar 2025 00:05:23 +0000
Date: Thu, 6 Mar 2025 08:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sm6125: Initial support for
 xiaomi-ginkgo
Message-ID: <202503060709.riVw4a7Y-lkp@intel.com>
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
In-Reply-To: <20250304043742.9252-2-semfault@disroot.org>
References: <20250304043742.9252-2-semfault@disroot.org>
TO: Gabriel Gonzales <semfault@disroot.org>
TO: linux-kernel@vger.kernel.org
CC: Gabriel Gonzales <semfault@disroot.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Kees Cook <kees@kernel.org>
CC: Tony Luck <tony.luck@intel.com>
CC: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-hardening@vger.kernel.org

Hi Gabriel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gabriel-Gonzales/arm64-dts-qcom-sm6125-Initial-support-for-xiaomi-ginkgo/20250304-124913
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250304043742.9252-2-semfault%40disroot.org
patch subject: [PATCH v1 2/2] arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250305 (https://download.01.org/0day-ci/archive/20250306/202503060709.riVw4a7Y-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060709.riVw4a7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503060709.riVw4a7Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1321.27-1387.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1279.11-1289.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
