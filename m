Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCA431BC80
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758055042; cv=none; b=ZU4Sj/J1yln8tiVIltCfE2g3jNEF5qEpo39wx4UYGuQotYHH8undcJu/H5yw/FBIkvLh7DjaK8TA7FVne+GQugry6Sh14CCZTrHPzXmw9pL7Uq/6DC/4tRMQTwGjjY5ONMcP2/EDCC+o4zaepn6CbLRfVI9TSDd9Iq4sbGejq90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758055042; c=relaxed/simple;
	bh=Z80SKrP0sS/6bnyjPQojTzh9RSD8etRdSrEn9Y4Wovg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AerpsCO2q5BTAP964+yE39KIiTcS7LmRHSMGdagvRLaqv7Q1QovOKGNrfgeHrDz3XV5LNgZu0QNhcngk+hT9I/T7URnycWeUL0qhu+wuv/4uvjBxqwL6dQ6GK1Yiwz2T6JdzYOtJ6U+BLjbH8KFGsGm+ywbo4rPaUhdr+8MqC70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZoerUiiU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZoerUiiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758055040; x=1789591040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z80SKrP0sS/6bnyjPQojTzh9RSD8etRdSrEn9Y4Wovg=;
  b=ZoerUiiUZGSlJTngTQuoA0RfAjpzjkYroOm52SnFrGtBD64qzIAhjTHW
   NXb96TTaMH+yIUeAn5S9hMaSem8nGLMJZ4KeXwWlsepx6CuizfMH1E9P3
   6xikRh1ieqVLeakN3mq4kC+iedBZABF3xfExcnKV3TqkknshdpXHCQa+d
   AwsDpZWF0zHQOtNg4PE4k/fVOxDDYJx6npAiYFUek32HC6rqe/pXoPXUf
   emm5SrRFcXwR5+KzRRnrfjbfgquPwiWcFpCxGL/elGAvq1o+Qa6BWHxcI
   azBpnjSEn+TW23p0tzNlUJvgQydm37Kv34eEr0bh+WF/q+c8t7KywEyJc
   Q==;
X-CSE-ConnectionGUID: rh0OAzxsRQ+mihWWiyu/qQ==
X-CSE-MsgGUID: nLK4Q6DUTeOgKqYXs3RVsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="64168851"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="64168851"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 13:37:12 -0700
X-CSE-ConnectionGUID: /PDG+cDTQRqRdeyRcy3qTA==
X-CSE-MsgGUID: 55KaCYJmR0WvOX9TloJ44g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="175827692"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2025 13:37:10 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uycQF-000000002e5-1ftd;
	Tue, 16 Sep 2025 20:37:07 +0000
Date: Tue, 16 Sep 2025 22:36:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.18 190/247]
 arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000
 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is
 too long
Message-ID: <202509162204.ZkcFhFdi-lkp@intel.com>
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
TO: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.18
head:   520f9fec5d6f5a23e7985140dc4dd9986f0ed140
commit: aa04c298619ff2621691ef1df5e243637d777222 [190/247] arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec
:::::: branch date: 4 hours ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2053-20250916 (https://download.01.org/0day-ci/archive/20250916/202509162204.ZkcFhFdi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509162204.ZkcFhFdi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509162204.ZkcFhFdi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4317.10-4327.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[206, 56, 1], [206, 102, 1], [206, 103, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
>> arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
