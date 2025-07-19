Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D978F3A
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752904662; cv=none; b=LZc51oe/KbLt8uTKxTosOpQHbKGeOGGekqBzE0HEjcaZs82NHVPnUdrkETvO6M5Znt6dcEsA5vRSxOGCTcUlxaMXxUYmPodqKoUHFNZofaKAUpJDJku0FjjRUombFF0pZVMdpVMA6flXtNTS0dQmN7LssDjzd0EMdBh9lCnDxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752904662; c=relaxed/simple;
	bh=cA65ymtQYcqm2yATDAmJQ9bmb3lup7bAhGZVq+oQfLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gtmM61hJax7pn8WqkPQ0/lcrhE3VgNOYTvAIJBxgTmT3ufxWJrozf6PDGqqi3cgBLBdoeOjACQfoWpeeanMU3VGf/RFzTO0ta4KfZWnSsiwccsM+KDnvurJmwQjnnS/1a/Nfi3r1bRXcj4GexzD8RQ7Uzi0GuTij9nkg+XZ5RuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuGW2Wku; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuGW2Wku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752904660; x=1784440660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cA65ymtQYcqm2yATDAmJQ9bmb3lup7bAhGZVq+oQfLs=;
  b=nuGW2Wkuj58rP6Y0QI1cI+/yzPM91hI5ynUkAX0Ts8r4yOptNhWYudiT
   fuozBRG4UEYa/nwAaX46Gbfj0NB9tAcmAqQm4aBpdj+pFio/htlUHDUHz
   dXkqfKPfoIZVVNYiSixSJA6xoOc2aKcc41va2DIAWLaGd4z9ydq1N4YvO
   si4EtF2Fs8XMtaaiUidzUeWcTRPnbo6qRPZAdWjNrFrW5raj5o2pLwvp2
   eTgPO6uuDD1P4Z75O1mKZmhhzsDX5giw32RPwx33tlcDv205V0t/Mq3uv
   ip4fUEs/8TmdG8CUJw1NlnBQ3bKqfahcGk/7wmnDizW95XPmicjqAvM0/
   A==;
X-CSE-ConnectionGUID: m5YfYlrbQQ2JGHLFhsIAZw==
X-CSE-MsgGUID: nXz6t/vISqKv7iu54QXVkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="77729857"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="77729857"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 22:57:39 -0700
X-CSE-ConnectionGUID: ibRvrYaKTLqrwWurp0Yrxg==
X-CSE-MsgGUID: jgLDtcIjSrWircR7cpu58A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="162427581"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2025 22:57:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud0Zj-000FGx-2i;
	Sat, 19 Jul 2025 05:57:35 +0000
Date: Sat, 19 Jul 2025 13:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/4] arm64: dts: mediatek: mt8395-genio-1200-evk: Move
 common parts to dtsi
Message-ID: <202507191343.RpArk3Gv-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250718083202.654568-2-macpaul.lin@mediatek.com>
References: <20250718083202.654568-2-macpaul.lin@mediatek.com>
TO: Macpaul Lin <macpaul.lin@mediatek.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Sean Wang <sean.wang@mediatek.com>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-mediatek@lists.infradead.org
TO: openembedded-core@lists.openembedded.org
TO: patches@lists.linux.dev
TO: stable@vger.kernel.org
CC: Bear Wang <bear.wang@mediatek.com>
CC: Pablo Sun <pablo.sun@mediatek.com>
CC: Ramax Lo <ramax.lo@mediatek.com>
CC: Macpaul Lin <macpaul.lin@mediatek.com>
CC: MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>

Hi Macpaul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core krzk/for-next linus/master v6.16-rc6]
[cannot apply to next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Macpaul-Lin/arm64-dts-mediatek-mt8395-genio-1200-evk-Move-common-parts-to-dtsi/20250718-163459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250718083202.654568-2-macpaul.lin%40mediatek.com
patch subject: [PATCH 2/4] arm64: dts: mediatek: mt8395-genio-1200-evk: Move common parts to dtsi
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507191343.RpArk3Gv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191343.RpArk3Gv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507191343.RpArk3Gv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3017.17-3074.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3091.17-3127.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1172 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi

908b552bbd6311 Macpaul Lin 2025-07-18  1170  
908b552bbd6311 Macpaul Lin 2025-07-18  1171  &vdosys0 {
908b552bbd6311 Macpaul Lin 2025-07-18 @1172  	port {
908b552bbd6311 Macpaul Lin 2025-07-18  1173  		#address-cells = <1>;
908b552bbd6311 Macpaul Lin 2025-07-18  1174  		#size-cells = <0>;
908b552bbd6311 Macpaul Lin 2025-07-18  1175  
908b552bbd6311 Macpaul Lin 2025-07-18  1176  		vdosys0_ep_main: endpoint@0 {
908b552bbd6311 Macpaul Lin 2025-07-18  1177  			reg = <0>;
908b552bbd6311 Macpaul Lin 2025-07-18  1178  			remote-endpoint = <&ovl0_in>;
908b552bbd6311 Macpaul Lin 2025-07-18  1179  		};
908b552bbd6311 Macpaul Lin 2025-07-18  1180  	};
908b552bbd6311 Macpaul Lin 2025-07-18  1181  };
908b552bbd6311 Macpaul Lin 2025-07-18  1182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
