Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A3DF59
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Dec 2024 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734875050; cv=none; b=AmjaLY2pG3bFJlaTjuyzpbNAfn8/eeeNvMyjBGn3L3gaXHGk6uFvJVpc9NtKnYI8ixV/ESRT63YNpxMi5bXong1R2+iIHiguijhh5ZIJ1wcg4WybzDsUGwouqnqUA+GSa2HKrq3y8cyuLh+K41oRlyU9uT9Lw1bhp2TGW6HVaGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734875050; c=relaxed/simple;
	bh=l1aZEiC6n1iLVvRZbHG66i3t8UBR9DXSdxYmwuwQ99I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RCeXIz7olEOhgI08K6VvNE/mh0k6xlyN6Y6a46k2KMQFGN6pybI15AVzm22DRd3HsL96RzvOqY/x2MI4bE8LJI6QOQjozf8T4NfqxoyXjdcDE4P2b5Btgu1UrJBNfv/GBpGAgjBn4gJ7aLwC1FQa98F+fNXLa0IRUPbfutHWqhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLQ/70Vn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLQ/70Vn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734875048; x=1766411048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l1aZEiC6n1iLVvRZbHG66i3t8UBR9DXSdxYmwuwQ99I=;
  b=hLQ/70Vnsue4kVnkuSkaBw4YAmnxum6jDahwYctJdBf8F53YwKncIwEJ
   njxXk0xOu2wiX8v3zhOZx5RzPKzDiqh54hy3XuVUbPLnseezZeqVFo/Pn
   9EPgHgZ+tLk7IY85j9/EI9684kEcSyT9yuSFMEVP9pwL9mWhvTs+eMsjv
   1kV5D7qeZhhyxbDt+zkUPuK8eODYeAXqTPZGNmWELIru2272DnjJycs5O
   fm+7mag5KJb4WtNJC7ynJ2sO2aVi5rEHXHnBXl7MIS3Zq4jpyCzswwCC6
   QxoX+wRy3ylIFeWnDrpR0fsZK0Jc7uDWb1OSDHccioWb/36sNWTPS8ihq
   A==;
X-CSE-ConnectionGUID: AGQLxsm/R0qLKhsLH17toQ==
X-CSE-MsgGUID: 0ECRPF9uR+eNuzpU7C/fYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="46778226"
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="46778226"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 05:44:07 -0800
X-CSE-ConnectionGUID: e74qkRmASqyod5hQjxKlvQ==
X-CSE-MsgGUID: g2EqjTbxTUeTW5neStgq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,255,1728975600"; 
   d="scan'208";a="98844328"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Dec 2024 05:44:07 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPMFY-0002yt-0K;
	Sun, 22 Dec 2024 13:44:04 +0000
Date: Sun, 22 Dec 2024 21:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 7/7] arm64: dts: ti: k3-am62p-mcu: Mark mcu_mcan0/1 as
 wakeup-source
Message-ID: <202412222145.Jq5F9yWG-lkp@intel.com>
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
In-Reply-To: <20241219-topic-mcan-wakeup-source-v6-12-v6-7-1356c7f7cfda@baylibre.com>
References: <20241219-topic-mcan-wakeup-source-v6-12-v6-7-1356c7f7cfda@baylibre.com>
TO: "Markus Schneider-Pargmann" <msp@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/dt-bindings-can-m_can-Add-wakeup-properties/20241220-040614
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-7-1356c7f7cfda%40baylibre.com
patch subject: [PATCH v6 7/7] arm64: dts: ti: k3-am62p-mcu: Mark mcu_mcan0/1 as wakeup-source
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20241221 (https://download.01.org/0day-ci/archive/20241222/202412222145.Jq5F9yWG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412222145.Jq5F9yWG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412222145.Jq5F9yWG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: can@4e08000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: can@4e18000: Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: camera@10: 'VANA-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: camera@10: 'VDIG-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/imx219.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-imx219.dtb: camera@10: 'VDDL-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property
--
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: can@4e08000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: can@4e08000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: can@4e18000: wakeup-source: 'oneOf' conditional failed, one must be fixed:
   	['suspend', 'poweroff'] is not of type 'boolean'
   	['suspend', 'poweroff'] is too long
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: can@4e18000: wakeup-source: ['suspend', 'poweroff'] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/wakeup-source.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: i2c-switch@71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: i2c-switch@71: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: camera@3c: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: camera@3c: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5640.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk-csi2-tevi-ov5640.dtb: camera@3c: 'DOVDD-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
