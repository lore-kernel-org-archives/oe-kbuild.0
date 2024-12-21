Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186621F3D52
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734792108; cv=none; b=GKjVv9PnQoZQbNlaXZ4VGFkkxKzQt4Deue/bHgLyZKQ5sFjIpv/D1+zutrZy5SOzSJoOzpVQfPKGEajyiO9DjRKWBdLu7MYYMJcos+38xiwyI9bw9nsf4glIEnxPm4GqkpAwMQ2gN2KRa5LJycUDLn8eILE3w1FtUq1BVZn3Mgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734792108; c=relaxed/simple;
	bh=uOFsuWPakTjcQ1X7r9L+09gOiB0v1bNadvG5vMW5Bxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mDUSLj2ueCUtN38lovVKNxYRkrvb3gcW63zmD79UtlwPKZyU7AkS+gr1CBxKPtjulYIy1KH4ZMFKTL+scwULsZWjvnuP0yi2NcayZzgg4QQN9OFmQ3k+uUSfFZuUA1tdjZ0PQsOkcRswPBz7vrmJT91wwQOgOSZXl1ncrnpN6Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUkaYU7S; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUkaYU7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734792106; x=1766328106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uOFsuWPakTjcQ1X7r9L+09gOiB0v1bNadvG5vMW5Bxs=;
  b=HUkaYU7Sfu9rHwGSjBtNtb6f/MAbXowAAfifZTcD/RRE4BVxjUCe6ICQ
   aE5ApuBMpop2SJfVVMVXXHkhvVimCwdz4cDa7h8SwGzhZQnnJS+OmQ5qi
   cCt3oXvwjQ44XkhEXCADHtM7FJiZDOEqqcInynMNOngVHbktGrqzlboZo
   juQwcTtT8vPE5fA/69/DoUl4206O8rxDRSRH5aAzqI6XttqepsTq4hFAQ
   mkJTwBhfOCQIJPKNz06hWKlQDaK584Mfg7CTKq3tiTIo6LOMFSwdgGwJ1
   kRIbr8j2eT4Fd8bvA73+vPPr9OACCffjXNZx+Zer5BNmh0itnpxMGQDCi
   A==;
X-CSE-ConnectionGUID: 3Ba0jHp8RcmkXGLmolt3wg==
X-CSE-MsgGUID: M1jzP4yoQJeTyTy7ckUVoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="52848617"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="52848617"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 06:41:45 -0800
X-CSE-ConnectionGUID: gwOv/e4QSDOCMJv4ZzlgPw==
X-CSE-MsgGUID: 5iMiVEp/TL+L04rds61Dig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="98555993"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2024 06:41:44 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP0fl-0002Dr-2P;
	Sat, 21 Dec 2024 14:41:41 +0000
Date: Sat, 21 Dec 2024 22:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 08/19] arm64: dts: qcom: Disable USB U1/U2 entry for
 SA8775P
Message-ID: <202412212259.OaRwU2ae-lkp@intel.com>
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
In-Reply-To: <20241213095237.1409174-9-quic_prashk@quicinc.com>
References: <20241213095237.1409174-9-quic_prashk@quicinc.com>
TO: Prashanth K <quic_prashk@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: cros-qcom-dts-watchers@chromium.org
CC: Prashanth K <quic_prashk@quicinc.com>

Hi Prashanth,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prashanth-K/arm64-dts-qcom-Disable-USB-U1-U2-entry-for-SM8350/20241213-175853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241213095237.1409174-9-quic_prashk%40quicinc.com
patch subject: [PATCH v2 08/19] arm64: dts: qcom: Disable USB U1/U2 entry for SA8775P
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-051-20241220 (https://download.01.org/0day-ci/archive/20241221/202412212259.OaRwU2ae-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412212259.OaRwU2ae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412212259.OaRwU2ae-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-qce', 'qcom,qce'] is too long
   	['qcom,sa8775p-qce', 'qcom,qce'] is too short
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
   	'qcom,ipq4019-qce' was expected
   	'qcom,sm8150-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: hwlock@1f40000: 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-qce', 'qcom,qce'] is too long
   	['qcom,sa8775p-qce', 'qcom,qce'] is too short
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
   	'qcom,ipq4019-qce' was expected
   	'qcom,sm8150-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: hwlock@1f40000: 'snps,dis-u1-entry-quirk', 'snps,dis-u2-entry-quirk' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
