Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A734199B8
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jan 2025 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735713404; cv=none; b=ASZDHyK3yOmCjmIzK6SeQcKC9SWcx7AF6j3PYvZ7O38jc1woC0Cja5f0ZFQl3foksiy5zQ6bkbAj6VtqzwpmYDUqtI4WITVp9vnq3O9XX38eluyasJotvJSluaL42MyVlM26yq/g13ze1EAHWw0i2jYBE9J67KLkZFOUVCEN7f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735713404; c=relaxed/simple;
	bh=nL8xkb51BljpkNG//BtwhYS8XSVHNvAMkwsarZWkJpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cr3ASfBYJwE9RMGxBP2JG2/hvGslgt0olnbLddTkuPru4gd2s72vKvSR0RfEFr3J8+XW4w0e3dkKrceESr7rDO0pdAUMtp81KKFEldQ7YuASKVc9/OL76tJvp797bjHLp1MW0EatbgRINrrlbwrjbw+uiPoPIFpF9t0fdaPPdVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilIRy+26; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilIRy+26"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735713401; x=1767249401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nL8xkb51BljpkNG//BtwhYS8XSVHNvAMkwsarZWkJpY=;
  b=ilIRy+261Ct3mOROiyqBgJGoFnZ8tL1jJ+xDlUcjxqTM+R9kxbOTJUNK
   t/d9h/c/dP5R7YkvkpsJs8Kg7P6eMmisy5c3G41yeWfVQ7SnVzFFqVEYL
   iSHfR6fFP5/hoxCIfmM/5ZA4nzzu5atXt2ERqGk6ME6Bp5zKzXXVAYYrb
   KoH+w8LOKz7ByJ5zbf6PWzcBYv8tcbLUuOQa3/0iZUShTwUWVUgmWGkh2
   7JrrAyBhXyT9oCj7pBd5QXd5CBJupPjwwXlhaOHQPOhFH8rM/PYwPU2IX
   PPADNdLBjehVFS2RS9SOgcn1knx+LtUO3xvoJCYU4ZXWsgEoK9doX9wsB
   A==;
X-CSE-ConnectionGUID: RhI4Wic5SDa8BoTwFqe92A==
X-CSE-MsgGUID: oEWyqCKLRWi01NeV3JXp3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35875282"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="35875282"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 22:36:40 -0800
X-CSE-ConnectionGUID: R1nx1Vi7T/iVUOXO6sfmRQ==
X-CSE-MsgGUID: 5FrHy0AsTU+6miujVgof0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="101313256"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Dec 2024 22:36:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSsLN-0007fj-1s;
	Wed, 01 Jan 2025 06:36:37 +0000
Date: Wed, 1 Jan 2025 14:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 1/3] arm64: dts: rockchip: Add vop for rk3576
Message-ID: <202501011420.xhpelu4T-lkp@intel.com>
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
In-Reply-To: <20241231095728.253943-2-andyshrk@163.com>
References: <20241231095728.253943-2-andyshrk@163.com>
TO: Andy Yan <andyshrk@163.com>
TO: heiko@sntech.de
CC: detlev.casanova@collabora.com
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: Andy Yan <andy.yan@rock-chips.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Yan/arm64-dts-rockchip-Add-vop-for-rk3576/20241231-180455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241231095728.253943-2-andyshrk%40163.com
patch subject: [PATCH v3 1/3] arm64: dts: rockchip: Add vop for rk3576
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-053-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011420.xhpelu4T-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011420.xhpelu4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501011420.xhpelu4T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1676.20-1742.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: iommu@27d07e00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-iommu', 'rockchip,rk3568-iommu'] is too long
   	'rockchip,rk3576-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	'rockchip,rk3576-iommu' is not one of ['rockchip,rk3588-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/iommu@27d07e00: failed to match any schema with compatible: ['rockchip,rk3576-iommu', 'rockchip,rk3568-iommu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
