Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E131DF26E
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Feb 2025 23:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740786817; cv=none; b=EHk+wSBRn+IfyEGJKwLBW7oghizLaxILViscz6K/fSrmDtCcRJ67I+t/9ZoQZ/KyolVcAKnYrCKMwiP2YKHKrtf1CTqwGnWCNvL8/5txg2QdKwk/nMLBTX0g6xXIiDKOvepIPRLd6L47Ck2DTTkr26no7HGI+7QNxsJyQJolRwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740786817; c=relaxed/simple;
	bh=1d5Qdjds3I4GBLyk6nrYaR7uugWzCCxTsTaN5x9gX9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f21DaOMKH2U0qMJKQPggID6sM3ThmyOQ6rczqeOzf7xb9AQA0s7fqE+88104PB5QcXgOWfClt71MolOI2rKbNg/SY3zoagUlR3UdFA+QZ8N/pSCk1DMcOzeW4SGwQKWWDuPR2z3hz5VJ8h1Kpvtv6exAxNhSFTcHxynR/P+Pinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRE258B7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRE258B7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740786815; x=1772322815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1d5Qdjds3I4GBLyk6nrYaR7uugWzCCxTsTaN5x9gX9Q=;
  b=VRE258B7ncXkkFIvoOSb4qGygImBfxOzyA/lceTGmLGwxBI+2voNhNVb
   suUmuI3/Lau4CHL2uNhsgHN+yTSOcmu7O++7GIn4T5m50v56XHrLwymVb
   XyzQu5nM+4yi+j4pW0trZCYUj0L1UE6TjJOugcGm92C+ebYRoQoDJ3kuE
   iIA3Czl97gLUGXaJ5slCJ4lGnBpnVPky2yrpaP+/3II4gsvzNa9Txfrzf
   BM01N770fjVrjld6N8WdFVbVUWPd4fTNkpWlV2mzesiz4uW2C88nRyBe8
   EzuBB7P1WAV9Quu71rNL6x5NbfsyolHoVTs0Z5blh+N36KlA7sz/1CjhK
   g==;
X-CSE-ConnectionGUID: 5QO/xQ0GSv6/0q7Nd7VLfg==
X-CSE-MsgGUID: k97qMYa/TEeQ+pvCUfdhIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="59266699"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="59266699"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 15:53:32 -0800
X-CSE-ConnectionGUID: eR/iLwCpSoi+WEZ20rV37Q==
X-CSE-MsgGUID: EzghDG3SSlyCrgJWGPCI9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="148284895"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 28 Feb 2025 15:53:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toAAb-000FeA-0w;
	Fri, 28 Feb 2025 23:53:29 +0000
Date: Sat, 1 Mar 2025 07:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add overlay for
 tiger-haikou video-demo adapter
Message-ID: <202503010703.86tjcygB-lkp@intel.com>
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
In-Reply-To: <20250226140942.3825223-4-heiko@sntech.de>
References: <20250226140942.3825223-4-heiko@sntech.de>
TO: Heiko Stuebner <heiko@sntech.de>
TO: heiko@sntech.de
CC: quentin.schulz@cherry.de
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: dse@thaumatec.com
CC: Heiko Stuebner <heiko.stuebner@cherry.de>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on next-20250228]
[cannot apply to linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/arm64-dts-rockchip-add-mipi-dcphy-nodes-to-rk3588/20250226-221326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250226140942.3825223-4-heiko%40sntech.de
patch subject: [PATCH v3 3/3] arm64: dts: rockchip: add overlay for tiger-haikou video-demo adapter
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250301/202503010703.86tjcygB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010703.86tjcygB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503010703.86tjcygB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtb: /spdif-tx@fdde0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtb: /rng@fe378000: failed to match any schema with compatible: ['rockchip,rk3588-rng']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtb: spdif-tx@fe4e0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
--
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtb: /spdif-tx@fe4f0000: failed to match any schema with compatible: ['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtb: gpio@27: 'reset-gpios' does not match any of the regexes: '^(.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/nxp,pcf8575.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtb: /phy@feda0000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtb: /phy@fedb0000: failed to match any schema with compatible: ['rockchip,rk3588-mipi-dcphy']
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-demo.dtb: spdif-tx@fddb8000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
   	'rockchip,rk3588-spdif' is not one of ['rockchip,rk3128-spdif', 'rockchip,rk3188-spdif', 'rockchip,rk3288-spdif', 'rockchip,rk3308-spdif']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
