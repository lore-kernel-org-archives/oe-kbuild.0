Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B9F24BD03
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jun 2026 22:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781042846; cv=none; b=jSDrLLPeE0w9vUcePKAZUNvSHGAvGlFbfqebuVg4EJIUtVkTOfLqUxjT0LJJSzbKabRNijVXEj+5SKfAq8pnxxLnIc4RM0oLu7qby01csVJy0edEAEWkudvH2pyRsQ+BNsPrMbiQM1LjwRIQOhYtj3G8gRyV4x7QGq84poKjxSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781042846; c=relaxed/simple;
	bh=cn9kQAO+Vms5oe6c3TMxkd9qE4Ht5dwqK90iR9Ny2Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukvNY9qOmjs9bI6O3IhBRuEhO1l+Reb7Qiuu5hTuI+iPOf57+5DINLejMqfcNWzqgoxubJkkIwqobeu5sa0akSNfu6TEPCOjLfxXHkw6jqlpPJXHA0dofqzCM1GgjKxZw5poYtKT+OTmS20XEBFMYyohmbuvAlPhprwLTlnFt4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpLxpNXo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpLxpNXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781042846; x=1812578846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cn9kQAO+Vms5oe6c3TMxkd9qE4Ht5dwqK90iR9Ny2Rg=;
  b=VpLxpNXorUd/+UCrzW5qDSk3z/82ROtk1h5tn/Vk1zpjrSqPYyWTgCAX
   DIIR0U8hMCzg89td4LInOI9mwHTPiKKH/weBhQgwqA15F0yevKQE0QF3+
   OSfdCxvzTzeCOjWCyn+QoTQOW9+SEVhIa3XsNYx/7KAuyScsWX16y0T/Z
   mxL5bTHmUQOtVWNlT/oVQJNxo+zwKMd0Wdv1KjUGsb0htucEjz/oqFB3A
   fyZSYPTNgSuSkgkqZtHel2szflv45Iv4qHTRqXwXcFyaB+zfog8FWPrSg
   0yTR4T7pkhM/m3vz1wpQO2XGu6jz+RoUbuCygTACE5tW62O851UgH5z+g
   Q==;
X-CSE-ConnectionGUID: AHHh6nORR0i6TyH2WSiKLg==
X-CSE-MsgGUID: QAI082auRCm1FXyfxSqgow==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99240919"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="99240919"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 15:07:26 -0700
X-CSE-ConnectionGUID: SaBOy8b1RJCCktdu01Yq3A==
X-CSE-MsgGUID: Dkriv/ZcSpKtOHAMpsOq4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="250901866"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Jun 2026 15:07:24 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX4bR-000000003Wb-2f5P;
	Tue, 09 Jun 2026 22:07:21 +0000
Date: Wed, 10 Jun 2026 00:06:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup
 panel compatible
Message-ID: <202606100022.Fqu3j1Fe-lkp@intel.com>
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
In-Reply-To: <20260608-b4-compatible-s6e8fc0-fixup-v1-1-303606b53c1a@gmail.com>
References: <20260608-b4-compatible-s6e8fc0-fixup-v1-1-303606b53c1a@gmail.com>
TO: Yedaya Katsman <yedaya.ka@gmail.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: phone-devel@vger.kernel.org
CC: Yedaya Katsman <yedaya.ka@gmail.com>

Hi Yedaya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6e845bcb78c95af935094040bd4edc3c2b6dd784]

url:    https://github.com/intel-lab-lkp/linux/commits/Yedaya-Katsman/arm64-dts-qcom-sm6125-xiaomi-laurel-sprout-Fixup-panel-compatible/20260608-224515
base:   6e845bcb78c95af935094040bd4edc3c2b6dd784
patch link:    https://lore.kernel.org/r/20260608-b4-compatible-s6e8fc0-fixup-v1-1-303606b53c1a%40gmail.com
patch subject: [PATCH] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Fixup panel compatible
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-2055-20260609 (https://download.01.org/0day-ci/archive/20260610/202606100022.Fqu3j1Fe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100022.Fqu3j1Fe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606100022.Fqu3j1Fe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
   arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dtb: panel@0 (samsung,s6e8fc0-m1906f9): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa5x01-ams561ra01.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
