Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFEF22E3E7
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766328245; cv=none; b=JQJ2W7Fj52kBOwcDpSsAjiJspGgaxShhYDrm9IRtt8NVTJ+ERbhqudabZjdSEramg/6dW3Mu1LGFlLs0qnnEi4CqW9ont8YjQ8e+XXXkbiamHNBwc34XKxXaTe0/gu8782EkPUneYixGx3OlEDzlbFlkOjaGZnHN5+nzJtd1KHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766328245; c=relaxed/simple;
	bh=doulYZpJqIQz4Gdro9ekiV9OSb6I9rhHd2e+ZfKbtH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eerim90DohNZmBCxzS8HfFAITNzUZWl4sXWtnK30q7EXBOGf4ub0fO96V5RBuMxdZjGazckzjrDT94zg1ikPPHP8VY0yv8xkhpoAiEVH/gQd5rvlMYA/+xLeVOelJw+Zu0lRAs25Bh5geakIfnGBoEfGAlllhjbXCkbD+Kc5c/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNCBslhg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNCBslhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766328242; x=1797864242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=doulYZpJqIQz4Gdro9ekiV9OSb6I9rhHd2e+ZfKbtH8=;
  b=NNCBslhgl8I6jiTRlvYPEATTXLNuZBTf5p+fiF/06um5MACEBL7zFbWn
   orhyf3TzkF+C2HjEAgKRcJCxt7Zufm3KWABy6nZStP/8wvVhDZ52vdf0s
   H9rBe6JiA2W/yrHHoMv9aa4MlfCFwV4Lk4YR/u6j33aqqiRd+jh/S8lDv
   OJ07v3bwwoI++WgaLHWr1MvCJdt30XnB8lfrxIi7BLbmbBj6AVPQ2oQGr
   2B0tFcP8UQXCnbR8CejuU33Vk6X2jZoLGSmnH5VSfR8FZohP5SfGV3R5z
   3XHVT6dF982BAnM6hd0/R9Sp8giCxXH0OGajj9HvNi+9AZ6NMAjoYEopm
   g==;
X-CSE-ConnectionGUID: umpW9EZ9QySVIhcVDP+MYw==
X-CSE-MsgGUID: icfgyGIIT9uh7hCbJAVAlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79664330"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="79664330"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 06:44:01 -0800
X-CSE-ConnectionGUID: XEB2HU07Rq2rHIoG3IxpyQ==
X-CSE-MsgGUID: ns+p/U/AQhyofQ5HV61F6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199279947"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2025 06:44:01 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXKf9-0000000055Q-0j8g;
	Sun, 21 Dec 2025 14:43:59 +0000
Date: Sun, 21 Dec 2025 15:43:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/9] arm64: dts: qcom: ipq9574: add wcss remoteproc nodes
Message-ID: <202512211551.cPhdOwoz-lkp@intel.com>
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
In-Reply-To: <20251219043425.888585-4-mr.nuke.me@gmail.com>
References: <20251219043425.888585-4-mr.nuke.me@gmail.com>
TO: Alexandru Gagniuc <mr.nuke.me@gmail.com>
TO: andersson@kernel.org
TO: mathieu.poirier@linaro.org
TO: krzk+dt@kernel.org
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Alexandru Gagniuc <mr.nuke.me@gmail.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Alexandru,

kernel test robot noticed the following build warnings:

[auto build test WARNING on remoteproc/rproc-next]
[also build test WARNING on clk/clk-next robh/for-next linus/master v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Gagniuc/dt-bindings-remoteproc-qcom-add-IPQ9574-image-loader/20251219-123945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20251219043425.888585-4-mr.nuke.me%40gmail.com
patch subject: [PATCH 4/9] arm64: dts: qcom: ipq9574: add wcss remoteproc nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/archive/20251221/202512211551.cPhdOwoz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211551.cPhdOwoz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512211551.cPhdOwoz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
--
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
--
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
--
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
--
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: usb@8af8800 (qcom,ipq9574-dwc3): interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
