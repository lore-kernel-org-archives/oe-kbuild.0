Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AEF38B7AA
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 19:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781551673; cv=none; b=fpmc5sXo5KlSYH7Efp7JQhsl3Kk55JO2y8qLzVGC/6MD2fEgLytA+Z03wxa+VkpZ/MlXmHS+hgX3MWtrWh51BDMJgyX9peiDfs93PzBtTQn/MFmJCidkDAx3nQWbnq1kDwCFnsJUXcupQg5jit7BRbMVJ9aC23hHEP8A3EvwCN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781551673; c=relaxed/simple;
	bh=q7qRMXtVUeCJiA1qAP200XoSbj83hcZ+0GtsU7CvTCA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lKC/dsTjI0CSxMgoYE9llj+S3UsNvk1d+TiUigcXiiyrEfDxlZtK0SFJlmuwo9LT6SOs8STpVUsN7bxrkQK8Y1Cb8dVVOidP28M6ivwCn/yNV9PhXYvMg4tDfcV/1nAtQIWvTF0uqvK/cFy+9mrwLkv7KOvorNHpPis62hvEiXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jb9Q5lHS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jb9Q5lHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781551671; x=1813087671;
  h=date:from:to:cc:subject:message-id;
  bh=q7qRMXtVUeCJiA1qAP200XoSbj83hcZ+0GtsU7CvTCA=;
  b=jb9Q5lHSV34xO4I4/irZ5An90drBnqVu2WvnlYgwuo0d+8R8R3bjp69D
   jUMuUCScYCmU1/itgEBI/Uttug3mcz/IgCn0myS2xGZorh5xqZ8qcpx9D
   JUAmdDiLn4MSvGm2+LyfDkt4UEXhcRbRGsiInvZSwC+umFudF6nYvV1++
   JOlJGIIWK661ptEit27Hou3VFPrKfDWLZfX6Im/Z+SJg69n+Bp7aM7I+z
   zx7eMUQXbIAqdd7uIQqvGnCyJS2RWiQBisrhVmyCdxoshZe5hptnACpNo
   4IF9bE4qqBPYRYnU7pZjrWhr/sJJiXeoUEq6Lx+LU/87G9RJvwunbyy4n
   g==;
X-CSE-ConnectionGUID: julVn9TdQ0iadKbK4Fj3Iw==
X-CSE-MsgGUID: CzJQrjRvQ/ezozl/SaLC3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="84867140"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="84867140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 12:27:50 -0700
X-CSE-ConnectionGUID: av4OS5OkR+uKLnbjibsa5w==
X-CSE-MsgGUID: jjSYmpsRRheVnvXTAE0DTw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jun 2026 12:27:49 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZCyJ-000000004xd-35pz;
	Mon, 15 Jun 2026 19:27:47 +0000
Date: Mon, 15 Jun 2026 21:27:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@6af8800
 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
Message-ID: <202606152155.3J4ZGm0X-lkp@intel.com>
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
TO: Dmitry Baryshkov <lumag@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e0611827f3349d0a2ac121c023a6d3260dcecdb
commit: db24f1fa263fdb473a23af461f82b4bc97af28b1 arm64: dts: qcom: add apq8096sg-db820c, AP8096SG variant of DB820c
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2054-20260615 (https://download.01.org/0day-ci/archive/20260615/202606152155.3J4ZGm0X-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606152155.3J4ZGm0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: db24f1fa263f ("arm64: dts: qcom: add apq8096sg-db820c, AP8096SG variant of DB820c")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606152155.3J4ZGm0X-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@76f8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
