Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B5C26AE4
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Jul 2025 03:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753585975; cv=none; b=p3Ei0FPbZed8ifXlKhQfnUkci+rOOwcAnVLGt1XZLmNIW4VPYmboInpJjyH+TMrWsberTATAYcrzaBvLHWNtLEBUAaNR5dOMHaUjaPWRPwLIdZswqKXJxNQX5KhYwy3QYYnh+BTiIdZ5WAROCiXiX24G2aQGazn/MG2qVTuQ+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753585975; c=relaxed/simple;
	bh=wav21dlGuccgGL+u7RDv3rWIUjhc/0gTShw8bqEMVk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hPWLYozGdu3YSjbr7FNHk3uuw/z5WKJCl11viF7edi57R/MTV3xOvzVz/19xNxFPE3q+P0qUuH8hoR2MO4HAovcDOzA+4QvUSE7Pfo+arP0adAtt6Z1noCgphBIZpE5Lg62s0LjGTXUiZhwqF3ZDM8a0vG2pyB7u+x2Hm76XCj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVoejGRN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVoejGRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753585974; x=1785121974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wav21dlGuccgGL+u7RDv3rWIUjhc/0gTShw8bqEMVk8=;
  b=SVoejGRNbFbmbhPFhd6pcge3MKdy7lacYuG6+YMoU2I2dcVVWkPwE035
   xFk74nXtH9OSWOisi0moFWltV5pvykypCtAJVzQKQu9dYkTV1fPzs5ikJ
   bd0PfnyJSNzXbj7njtY8/YXfjamKeXQ95cgTMTqzWog+CiHwZTYTNfwhE
   nh6uxsg41uVahQMC8F5rF9lqTR4Xlo9tnx4Bc0bCk7k8cJBymWAt9oQO3
   KDC2bq2BK4HE3hpEYExULHpojX4FmxPnZMN8nloMDn9fTEZJaMwGtADtL
   sC9tggP6t65HsvN9iG2BqKT/azPZ+Y+QhzRJFOKAFBAM27F8Xx+jVdfDb
   Q==;
X-CSE-ConnectionGUID: jF6Z3wizQU+2A0ElMfmN5w==
X-CSE-MsgGUID: 9t3tZLS3T3epPH0Xmq0WWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="54951352"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="54951352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 20:12:53 -0700
X-CSE-ConnectionGUID: TOYHebpwTJaz3Tyvm5VBRQ==
X-CSE-MsgGUID: dfeyh/dQQuC4+AwHkhkM4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162189884"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2025 20:12:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufrog-000MRT-29;
	Sun, 27 Jul 2025 03:12:50 +0000
Date: Sun, 27 Jul 2025 11:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 11/23] arm64: dts: qcom: sdm630: use dedicated
 elite-audio dtsi
Message-ID: <202507271039.rdvyFNq4-lkp@intel.com>
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
In-Reply-To: <20250723222737.35561-12-srinivas.kandagatla@oss.qualcomm.com>
References: <20250723222737.35561-12-srinivas.kandagatla@oss.qualcomm.com>
TO: srinivas.kandagatla@oss.qualcomm.com
TO: andersson@kernel.org
TO: konradybcio@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: cros-qcom-dts-watchers@chromium.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250723]
[cannot apply to robh/for-next v6.16-rc7 v6.16-rc6 v6.16-rc5 linus/master v6.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-oss-qualcomm-com/arm64-dts-qcom-x1e80100-move-dsp-audio-nodes-to-dedicated-dts/20250724-063627
base:   next-20250723
patch link:    https://lore.kernel.org/r/20250723222737.35561-12-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH 11/23] arm64: dts: qcom: sdm630: use dedicated elite-audio dtsi
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250725 (https://download.01.org/0day-ci/archive/20250727/202507271039.rdvyFNq4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271039.rdvyFNq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507271039.rdvyFNq4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr:qcom,glink-channels:0: 'adsp_apps' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr: 'qcom,domain' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge: Unevaluated properties are not allowed ('apr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): Unevaluated properties are not allowed ('clock-names', 'clocks', 'glink-edge', 'interrupt-names', 'interrupts-extended', 'power-domain-names', 'power-domains', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
--
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr:qcom,glink-channels:0: 'adsp_apps' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge:apr: 'qcom,domain' is a required property
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): glink-edge: Unevaluated properties are not allowed ('apr' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#
>> arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dtb: remoteproc@15700000 (qcom,sdm660-adsp-pas): Unevaluated properties are not allowed ('clock-names', 'clocks', 'glink-edge', 'interrupt-names', 'interrupts-extended', 'power-domain-names', 'power-domains', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,adsp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
