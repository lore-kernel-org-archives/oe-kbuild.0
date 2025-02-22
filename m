Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2A211A3E
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Feb 2025 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740252376; cv=none; b=Wrw3VVdE+dKYkp1zeOACmcV9ydxFT3aIlTE+etO+b+e97Jto1+++QU5Hcqj4lKjE/VTCxCzQ5J06lErFuLhz8KqLpKqbT17TNF4lMRomgHlOZaFDsYMe+ZZHJGMnX9Jf6qN1AITowzTaYMT9m1PeNnAVdPVycGz0t8XGD9yIGQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740252376; c=relaxed/simple;
	bh=Gkydp1Hy+o1MTre6uarO/qfFB767qA849dFBjTvgzS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EV6CA2YRc9X9/PtGur6DYl37oyC5MEcYtR6VeR6IYtVzasFisGAX0/hu7dy9/Y7Uty2PRvFKgxKj0fddYzjgnumi3BsVdqfiV58H2Jt80KoR+ws6sHQE7J3Vw8bHQeWPNhhNWdqsrRaUBXLtYaCkxCy/OayqA/RaiDgTGveGw3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+F9rbVm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+F9rbVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740252374; x=1771788374;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Gkydp1Hy+o1MTre6uarO/qfFB767qA849dFBjTvgzS0=;
  b=e+F9rbVmu59mLp3bnXNomp0yY2cKhv5AsrQAnm0T9S1It0WqxfI+Ikxh
   sq4Ebdpoide6C40qHny9k53VM4bnLGCALNgcl73y4ScsEOq2TFtjx9qjm
   uOMOK/MNiR0sj3nnmPXrvg46FHKYk91l1S6KiUWkZ1GT9YR9oQtSjIWX+
   DjqTvw3xdJjH0onoH7d1tS82iBbQHeYo8RDNNeuaqKy0Mbn7hRRKbpmir
   PV2vgXRaKoEJAQB38KLNtXhThBmcV/vYTssZwgkCdleK+bfrRbpkUDckS
   E6sg+b/Ip2opqcsgb9uNExN5Nx57lO57Q0Z8IC3aeEB3X2zboAeA/aTM1
   g==;
X-CSE-ConnectionGUID: OXG9AFBjQxeKRpFPy1G6WA==
X-CSE-MsgGUID: V+ZuRY7hSH2ZH0XhjYAfuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51678572"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="51678572"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 11:26:11 -0800
X-CSE-ConnectionGUID: jRvqEUbBS2S5UkvrROWtYA==
X-CSE-MsgGUID: +GnRD5aITq+XvfDIZWFZ/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115862515"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Feb 2025 11:26:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlv8W-0006q9-2v;
	Sat, 22 Feb 2025 19:26:05 +0000
Date: Sun, 23 Feb 2025 03:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pci:dt-bindings 1/3] arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb:
 pcie@10000000: reg-names:2: 'elbi' was expected
Message-ID: <202502230326.JO5SFOGI-lkp@intel.com>
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
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250222 (https://download.01.org/0day-ci/archive/20250223/202502230326.JO5SFOGI-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230326.JO5SFOGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502230326.JO5SFOGI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@10000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@18000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@18000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@18000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@18000000: reg-names:3: 'atu' was expected
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@20000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@20000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@20000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pcie@20000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@10000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@18000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@18000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@18000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@18000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@20000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@20000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@20000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pcie@20000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@10000000: reg-names:3: 'atu' was expected
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
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@10000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@18000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@18000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@18000000: reg-names:2: 'elbi' was expected
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@18000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@20000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@20000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@20000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pcie@20000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: usb@8af8800: interrupt-names: ['pwr_event'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: usb@8af8800: interrupts-extended: [[1, 0, 134, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@10000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@10000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@10000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@10000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@18000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@18000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@18000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@18000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@20000000: reg-names:0: 'parf' was expected
--
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@20000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@20000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pcie@20000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pci@28000000: reg-names:0: 'parf' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pci@28000000: reg-names:1: 'dbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pci@28000000: reg-names:2: 'elbi' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
>> arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: pci@28000000: reg-names:3: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
