Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027AF2E0413
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769258818; cv=none; b=UDSdogwij71w4vm7Rfc75ezAjmWTTKHbq0u5Bd0H2DbKdDJhtj04mAPXVYa9Xp9ZsNdXSQgX1PH7aPbq9tYtWx82HyHmVzW+VYQct8iapLhiRfTr1T2IE6rGljZFtLEpOjLD9udMqCQTpS4k8Im+xS56MFuh2IDPgwLzyxahZfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769258818; c=relaxed/simple;
	bh=p4GcQqiSqUa0Lp76XFrgP+yJeZREo4SJZVh+SqClYDM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cY0xg6BYXKDsLqsSMXnCj0hCS4dP285D11YUwxcCyFoDDuOM2CIEBOmqIvapMSVSHAJ5tjzgCqBzuOiBvtDZWJO5K8TYuQFbEPRuoKSjXfO/0j4AhdHdVm7vC2WFjk8BpvuCEz+mZFmiNs1lLHhYTURP7F7t4jFBuVkBfgBWvp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqFNyHgj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqFNyHgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769258817; x=1800794817;
  h=date:from:to:cc:subject:message-id;
  bh=p4GcQqiSqUa0Lp76XFrgP+yJeZREo4SJZVh+SqClYDM=;
  b=PqFNyHgjt3lzePWwfmnIKI811lRlrBnGCgdN+p/VkFB97RznyxG4wF6q
   khHdAmPWeNItR1/9SHGaT9epLHW5+C8CYzQPEMVBkvEbOZSVMox1LYgdZ
   U7hquO+DeC69h7KvQs9ZFpzvJI+IunBHlrBgw0wyJaMEbAoh5keq9Gj5X
   8OnhyWWKn9tRctD7tv/8gFqpa2FmVckc+KSEsmgA5cfeBnEaYXYxXT9Rp
   tEqPhNqJdjvScw346cQnCBJ2StgaBBfO/WSSa/KQ0I+t5W3kLCMeR7AaQ
   kl1+GbUoytiac3LS5xO6HiJT8kml7qxd8OzyTGpiuXn3Brcvo0WJ+9OhZ
   Q==;
X-CSE-ConnectionGUID: Gj5hPXELQWmlCJAMYf/JmQ==
X-CSE-MsgGUID: To+FCDSUTvqCSxuNMJYPaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81929168"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="81929168"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 04:46:57 -0800
X-CSE-ConnectionGUID: 9vvIt1P2QbCnRhEoXOyv+g==
X-CSE-MsgGUID: ROa0Kn3wQW6ap8VD3BYHJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="206512428"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 Jan 2026 04:46:55 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjd2T-000000000yf-1IUj;
	Sat, 24 Jan 2026 12:46:53 +0000
Date: Sat, 24 Jan 2026 13:46:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb:
 geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
Message-ID: <202601241341.URM2T8Bw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gabriel Gonzales <semfault@disroot.org>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62085877ae6592be830c2267e35dc469cb706308
commit: 9b1a6c925c88ed9331a2cae64fb3580e05345ded arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
date:   11 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260124/202601241341.URM2T8Bw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241341.URM2T8Bw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601241341.URM2T8Bw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1321.27-1387.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1279.11-1289.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: / (xiaomi,ginkgo): qcom,msm-id:0: [394] is too short
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
