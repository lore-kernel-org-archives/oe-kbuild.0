Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC811B2182
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Feb 2025 13:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740229802; cv=none; b=TA3jXu6sJE4wo+UKJ7C9nF50F1nazN2OYFKpRniyHiiHfGnt9pa640KnEnJ/ZcRYuI1YuKt2sE5qBivudUfoVF8V1cfDaD4SLib3tyB2YhjcS+6dh3qLKFmqGDaJYYOrSf7P30hikQS1uxKA58Din4U0/DhKXQQZwRr26rWvlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740229802; c=relaxed/simple;
	bh=NEeB5OhNUiPn2xkkWGZS8IIkZ/wO7443CE5KqzGXE6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xwr9MTZ6omwtCFDsqJClpwHEingQQX35fAct9afNgq29/JlfU7CPHq1dd0V4DIvQI2ImYcn9NvMvF/aHgjFkZeDPMml3US5jnIqFhiOl3wzYYrVwnGFTsZA2DGNsBcWTmdw6gcrZqkX8MHuX+AK0m+nAnTBhq2DbvVwDAZ0Eo60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Efl1jXhm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Efl1jXhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740229800; x=1771765800;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NEeB5OhNUiPn2xkkWGZS8IIkZ/wO7443CE5KqzGXE6o=;
  b=Efl1jXhmts/MiSOSHSTisc29MDQVl5A0kSr8qJWp7OM7C2xbNtd1K+WO
   Gk7941ntds6eK+7AAonO2YQ5NJRBl7FD0gJ8IUQfbwtwbhJ0d6sbMnVes
   DkOy/h/odYiLjr4aiMvdo1wWfQxMM2CE3lHovVfGZtOouGhmGKqYcZ0yk
   itTYQ9fBeE6s/pS2k61wOwx1rp/UrzueR0UYC3ZarXz+Mxcr+8OMw1ukD
   qjobbxtqTH21yL3zC2heDOHN64nFGyHp6gzHANUSKleHcKmJBv0jXxdaC
   KllvP3Zf+f3V6zMCaNVruE+HO91zclaEMoaCmHYHprwQdHAU6zX3kIA7V
   Q==;
X-CSE-ConnectionGUID: DBMpA7WuR1+RHuEJE7U/rg==
X-CSE-MsgGUID: n5iFvE1JTgCQRUByWgK1TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="52441887"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="52441887"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 05:09:59 -0800
X-CSE-ConnectionGUID: ZucAG/L5QZq93+y3CZM58A==
X-CSE-MsgGUID: BtTB02u+Sveov4Tm5dcKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115330823"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Feb 2025 05:09:58 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlpGV-0006aB-2f;
	Sat, 22 Feb 2025 13:09:55 +0000
Date: Sat, 22 Feb 2025 21:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:dt-bindings 1/3] arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb:
 pcie@10000000: reg-names:0: 'parf' was expected
Message-ID: <202502222149.pevVJY0p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-pci@vger.kernel.org
TO: Varadarajan Narayanan <quic_varada@quicinc.com>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git dt-bindings
head:   396ecc1626d45496e283fe139afd0ed89b9f02cd
commit: 829aa3693f8de47bf54129c0f996024e56c24ebf [1/3] dt-bindings: PCI: qcom: Use SDX55 'reg' definition for IPQ9574
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250222 (https://download.01.org/0day-ci/archive/20250222/202502222149.pevVJY0p-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502222149.pevVJY0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502222149.pevVJY0p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@10000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@18000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@18000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@18000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@18000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@20000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@20000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@20000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@20000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@10000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@18000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@18000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@18000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@18000000: reg-names:3: 'atu' was expected
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@20000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@20000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@20000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@10000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@18000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@18000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@18000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@18000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@20000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@20000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@20000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@20000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@10000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@18000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@18000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@18000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@18000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@20000000: reg-names:0: 'parf' was expected
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@20000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@20000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@20000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@10000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@18000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@18000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@18000000: reg-names:2: 'elbi' was expected
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@18000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@20000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@20000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@20000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@20000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
