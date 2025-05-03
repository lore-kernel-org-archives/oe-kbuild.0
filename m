Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B0DEEC3
	for <oe-kbuild@lists.linux.dev>; Sat,  3 May 2025 03:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746243183; cv=none; b=g/iMB4Txnoc7krsj4EwE9HjrvconlNFUy3HG82P0yAJamLJWVilUjMybtZmzg957b2byaYti5cak5O/Op/LjsHmRbk04o1VzD8QsyKCTVK+DeTe2CfiMUSROn0/WXGQTKzowVZ+uhw+QFTWAwghydRc5m2riVDfzY4IdMNlxhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746243183; c=relaxed/simple;
	bh=jCzEVxr7hBRNx0ZkzGE8hWqNH9Xo9PaApEEzbeM5eDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FB+7AuhUioft81cu+nupWK8vBC54sOexUo3ydbHouDmaE2BaR9hZ2UJuGkuKuMc2ZDJRG8Xi8Vm5iynKxev+VvX5ahNw/ZlNMsQrXVEbzIHMADz6/vagNWr3YMW8BBdfWWbC4dyIW8wq5R9/E6Eg3sUpvxy5Lp1NCkR0bWBKHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiXzmUbk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiXzmUbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746243180; x=1777779180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCzEVxr7hBRNx0ZkzGE8hWqNH9Xo9PaApEEzbeM5eDQ=;
  b=aiXzmUbktrmJvfpQMKtcrttwA2yxLCtD02IMsMS36LvjdSeqtL9V8sTy
   pSYgh0wU9ujBckfYPO4OShWz+lWk6IN4HglLjlTtTJc3xvO9xqtDra6c6
   Q4HsnoUdkpPGCea2GPiNN8Cg8Kjg8HX8xJ0b5bzfb9vSCU3sJ8cdsgCRw
   Qx+d2oo2ugrH6qcKPR1gg4gQNQsC9Xj+Vb/phb3ZnMsihPGuNC6SgRpfG
   9XcgXCqzLfuFXKZ6+0MpCRYfQDfDzhPayMcW9m0LOCxJ+RrTErmaAjNwZ
   YLpDgLMEUUl9OpIOR0VXpppZZQ/8/3CBLBXsH2WLfppbMMFqphIqSfYhb
   A==;
X-CSE-ConnectionGUID: 3lRW226zTT28glJ1LROC+Q==
X-CSE-MsgGUID: JEh/hrtzTdiE8drAEZszSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58552341"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="58552341"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 20:33:00 -0700
X-CSE-ConnectionGUID: ABI5f0KESq+1+3pcQM8ipQ==
X-CSE-MsgGUID: RmOhCQTnRFq6RTpneEqZQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="135318568"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2025 20:32:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB3cW-0005BB-2b;
	Sat, 03 May 2025 03:32:56 +0000
Date: Sat, 3 May 2025 11:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
Message-ID: <202505031059.mRsmGExu-lkp@intel.com>
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
In-Reply-To: <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
TO: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: cros-qcom-dts-watchers@chromium.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: kernel@oss.qualcomm.com
CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
CC: Prasad Kumpatla <quic_pkumpatl@quicinc.com>

Hi Prasad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33035b665157558254b3c21c3f049fd728e72368]

url:    https://github.com/intel-lab-lkp/linux/commits/Prasad-Kumpatla/arm64-dts-qcom-qcs6490-audioreach-Add-gpr-node/20250429-172836
base:   33035b665157558254b3c21c3f049fd728e72368
patch link:    https://lore.kernel.org/r/20250429092430.21477-6-quic_pkumpatl%40quicinc.com
patch subject: [PATCH v2 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-053-20250502 (https://download.01.org/0day-ci/archive/20250503/202505031059.mRsmGExu-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031059.mRsmGExu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505031059.mRsmGExu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[224, 56, 1], [224, 102, 1], [224, 103, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[360, 361]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[360, 361]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: sound (qcom,qcs6490-rb3gen2-sndcard): '#address-cells', '#size-cells' do not match any of the regexes: '.*-dai-link$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#
--
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[224, 56, 1], [224, 102, 1], [224, 103, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[360, 361]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[360, 361]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: sound (qcom,qcs6490-rb3gen2-sndcard): '#address-cells', '#size-cells' do not match any of the regexes: '.*-dai-link$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
