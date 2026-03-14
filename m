Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F6133BBBD
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Mar 2026 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773461723; cv=none; b=mTkGaEuOMTCsMhifdSojP+TGdEoeLOgbbyaZkUgqa7W7bJcAjnrsXAf0Jrvx83U4EujXl6ry3ndHygvK3YbRlbESmxT5SGu89JMtOysSQPT9IDokhz7DCacYsYmxRKgUDIrPdmxa/HfvVFKzNqW/qpyJtI7wFNmp8A9u9VDwmOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773461723; c=relaxed/simple;
	bh=OVCiHNe5vRI6zrHK6kfYKhFoyuADWeJdV9ELLicayI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xk7P+izFIczT+WokFC50AhXfToowngrWmY/k6DzYBELKW1Y2yQNfdZOepceIn6o93jMZqD1NyTdjCnXrQ1N/HKKO2nVrrgr9oAzjmhLD3jOQHl7DcXdrSuae/Igv4FWsE8Je52zseUCzuwFVYIsevaevL60tz31bLqDVDs8/6vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CY0PMSl7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CY0PMSl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773461721; x=1804997721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OVCiHNe5vRI6zrHK6kfYKhFoyuADWeJdV9ELLicayI0=;
  b=CY0PMSl7bOJWpuWSesU0DW0Jd/rJzfZ60xhL/5CKM9TkNsgoVzoiewyD
   TpNxJ3cWcaa8VwpG6bOw5EJP2CB81Mu1E4ZwhxbuK0SFwgVKUfGZ+8TcP
   uZ6qvNI8Hc2eO45f9DwQi11MT82WcFbi570HAer+0aa7QCyX+CAY4aBNr
   Cg9N9D2YJWlThFyuct4g+A1YpfqkbFU58ORt89oFMZPl9LDlXuCNf22Xf
   4p218zBiyIFe2wlh2TQd/tDOS0w/2rFwx8tz9iDAN1G4aGzgXSOc3Gp7f
   dyEr1QEr4THArjbVwBTA89I2anYB/uyKlj6ZfJgcmbVff2B1yGGXegMR+
   w==;
X-CSE-ConnectionGUID: DvTScV4MRQCwCbQcig3+3A==
X-CSE-MsgGUID: QsJU5GmZTryS0gVFL6PETQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="85191194"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="85191194"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 21:15:20 -0700
X-CSE-ConnectionGUID: N48usIDSS+2l/4j1RrYwWQ==
X-CSE-MsgGUID: ytaqClYvSGaYIc8sfw8oFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="220605854"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 13 Mar 2026 21:15:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1GPE-000000003kb-1dEF;
	Sat, 14 Mar 2026 04:15:16 +0000
Date: Sat, 14 Mar 2026 05:15:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] scsi: ufs: rockchip,rk3576-ufshc: dt-bindings: Add
 new mphy reset item
Message-ID: <202603140558.ckFRG5PQ-lkp@intel.com>
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
In-Reply-To: <1773368467-109650-1-git-send-email-shawn.lin@rock-chips.com>
References: <1773368467-109650-1-git-send-email-shawn.lin@rock-chips.com>
TO: Shawn Lin <shawn.lin@rock-chips.com>
TO: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
TO: "Martin K . Petersen" <martin.petersen@oracle.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Bart Van Assche <bvanassche@acm.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-scsi@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: Shawn Lin <shawn.lin@rock-chips.com>

Hi Shawn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on jejb-scsi/for-next mkp-scsi/for-next linus/master v7.0-rc3 next-20260313]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shawn-Lin/scsi-ufs-rockchip-rk3576-ufshc-dt-bindings-Add-new-mphy-reset-item/20260313-114506
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1773368467-109650-1-git-send-email-shawn.lin%40rock-chips.com
patch subject: [PATCH v3] scsi: ufs: rockchip,rk3576-ufshc: dt-bindings: Add new mphy reset item
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2051-20260313 (https://download.01.org/0day-ci/archive/20260314/202603140558.ckFRG5PQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603140558.ckFRG5PQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603140558.ckFRG5PQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): reset-names: ['biu', 'sys', 'ufs', 'grf'] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: ufshc@2a2d0000 (rockchip,rk3576-ufshc): resets: [[21, 286], [21, 289], [21, 290], [21, 292]] is too short
   	from schema $id: http://devicetree.org/schemas/ufs/rockchip,rk3576-ufshc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
