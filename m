Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130062;
	b=mfPvh8HQaDOgA8EWy5gHqKfVKCXMJiT6YBiJbYISw+Z/OKr/gAxkER7yN5moRFoBTlgq
	 Y2+hxAOlaeM0GaMQOgiXyMqJrh35LUkMODoZPflDhKZSJSop7VE13npE8Zg8jeibnW1oh
	 /SqI28Ivk6WJzI/CILU5EkaNRu0CNec42rxwMnETWSqmm9jrSy+3MLJJxGQxJyWKAj19v
	 +ganIhHCQTBJI7uKhQg2hCso6+jnlUnqUJz+J/O45ul4BNJMPX6IN2/9w/tuA8nqZtrNp
	 vmzBaOGm0fRUvRPf1+ljbXlMNclqhUijxD8UpSeyE3GXc79pAnt990O25oEwWdlISvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130062;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wjGSygq8blehrlVDAHd0ZlaUFdYCtOAZkoVYYaX3OVE=;
	b=wQNtVaD6eheFDYZrXewJbHkHAc2UHLJ1X2O14Wj0UfahUu+H//SRLO6em6ed+mJ4ocFV
	 7BJBR2eLmwMPUFgTbkdyuj4+60Xitwj6Sa3Dmhy1d00fcZIZNsgkS0OuTOmUnNV9mLvD2
	 UTlwah3aWkag8+5AmnkxKHynw/e0n4zSAzCCh8/K1/1T/SYEW/c4EHvjvNhSGBIyQhkFU
	 prEudRWZW2Z+wwVP2fAiHBjvBZltosf/oGtb9DUXtgByFMLVAWHu2R69UAaZaUHlL8OTK
	 YImucB9RxjYT569/ROwXVTWoAcwRrqdt+u9JbEnZJz8ZfsnR+5R/ii20SdcT4odfkSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X5bOwiue;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D313A606A320
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 09:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D313A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X5bOwiue
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794130061; x=1825666061;
  h=date:from:to:cc:subject:message-id;
  bh=b44FzBtG8Vp3piq+MR+OejxVlPTvGNR2QxhLXfXWS6U=;
  b=X5bOwiueBWLvB92JUrknmaN4x+fBFXhXhwhKfFqamcbLOxpTeGGLnshL
   dRJCGn749wwFo2y3j9+2L3epxRwgeKyU9MIqunEZiD7P2/Vtm7Kq9+Fs5
   TZ5soUwoaW1OkcIEjkBs3S8RskeU8msn9KJfVOZI8uIGU20i99zrQnUOh
   T9Uqt1JWTcFNljAUzWU/A7IdW0MmOr7BcqckCRmU3vJixaHvMCFsvva2n
   ODP1DHKc8QeZLXZqE6hhfCmaAedc+rLmZWlbYWt0BNx27CCYSRFk/Ww7g
   CxogjJ6RIVoIobojpTGGAi1q45cUbQn7rvdQIB8OPrxNUo0O2SgLgNvbv
   Q==;
X-CSE-ConnectionGUID: 94xsxvW7TbmJR8T4fSDpsw==
X-CSE-MsgGUID: 9xi4IA6pTtehvQN+dJX7NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2914943"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2914943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 01:27:40 -0800
X-CSE-ConnectionGUID: IqY1VPu4Tk28WqA8pxZH2w==
X-CSE-MsgGUID: gxUWPhGnSbKq66XaBApFaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7528276"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 08 Nov 2026 01:27:39 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPzBY-00000000BNl-2Tf3;
	Sun, 08 Nov 2026 09:27:36 +0000
Date: Sun, 08 Nov 2026 10:27:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.5-armsoc/dts64 41/44]
 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: vop@fdd90000
 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611081048.RKpuZZpi-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Andy Yan <andy.yan@rock-chips.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.5-armsoc/dts64
head:   37145821846cb01e1da93753d928e77c42b6bb59
commit: f245313cd545f58dbb777fcfc6aaf33376e25c0a [41/44] arm64: dts: rockchip: Add RK3588 VOP2 resets
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261108/202611081048.RKpuZZpi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081048.RKpuZZpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611081048.RKpuZZpi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-armsom-sige7s.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v1.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000 (rockchip,rk3588-pcie-ep): Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-4k-cam.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dtb: ethernet-switch@29 (realtek,rtl8365mb): False schema does not allow {'#address-cells': 1, '#size-cells': 0, 'ethernet-phy@0': {'reg': [[0]], 'interrupt-parent': [[164]], 'interrupts': [[0]], 'phandle': 166}, 'ethernet-phy@1': {'reg': [[1]], 'interrupt-parent': [[164]], 'interrupts': [[1]], 'phandle': 168}, 'ethernet-phy@2': {'reg': [[2]], 'interrupt-parent': [[164]], 'interrupts': [[2]], 'phandle': 170}, 'ethernet-phy@3': {'reg': [[3]], 'interrupt-parent': [[164]], 'interrupts': [[3]], 'phandle': 172}, 'ethernet-phy@4': {'reg': [[4]], 'interrupt-parent': [[164]], 'interrupts': [[4]]}}
   	from schema $id: http://devicetree.org/schemas/net/dsa/realtek.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: vop@fdd90000 (rockchip,rk3588-vop): 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
