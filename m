Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF9347C6
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774212118; cv=none; b=OXS56tnw6cxld0gSE6p8soCx9P5tV6Tp3MT7Dp6GplozNo3IOoSbinI9J9NEzPyV6P5e0NWDz5H+QQbFoENWLFzo9fCMnRI1HrBRZxh3tha9P7jsuz8lCZpRVyg5xKLERzs/JMflqsXjlXOqstUMX3T8D9PWwH3UD++1ApujwsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774212118; c=relaxed/simple;
	bh=8LBzQZVQmJhMBr31kl+Q2fdkugBnbtB/ie+TRXHRZ9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hIRgpWvq/RUUvSWkNuvLeFxm87TEJk9U9uzzbvyBue223hTMUr8jYM4JzVqTvjednmVsfWcJxNZBQS1i7LmL1LRUfZJaYIHUbAuvpTH/V20wXcWGp/hdwEHcVkQoNZIe2CuIG1NJO7naG7aIILpl/Ak4ps1+zfqzKmXbJOC35gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=koabb/CT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="koabb/CT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774212116; x=1805748116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8LBzQZVQmJhMBr31kl+Q2fdkugBnbtB/ie+TRXHRZ9o=;
  b=koabb/CTq9QyvRa4TQCbh2VMuI/LysBXbo2TpJDuhWFVI9BMuL/+MepL
   62JaeSasjfh+ac8hyJkD8zc1pKsmicjgjE0HryQvQonUBfKQW+BBDbyul
   /PEIzdgajBp5JLa7WY5bm/nVhQ3DErEu0BUDQOEYkVAvOygLIt0A3tz3U
   7B0LgRPlPTo+fGZ1mDzgKh4qw+Q6TkuUZe4KJmbjwiGcEquMM2dHjYiwn
   6k+tpCUunrOJhbnof48fwy343LEC3QiHE0xG0b2lQlNrzyhUQDwu/KoPe
   Z/92vtp0LEUKWXDDVW2D8mkmZqJS5GMPYTkAF4sm4cQsygiOIzVpuy2zO
   g==;
X-CSE-ConnectionGUID: hVJyU7FsRmeq3dqdQwbmKA==
X-CSE-MsgGUID: dVqVZLKQSp2PsWqYRJ46zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74931695"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="74931695"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 13:41:55 -0700
X-CSE-ConnectionGUID: mZsxqzzAQlWhIphFVEb82w==
X-CSE-MsgGUID: On4lD/V8RGyPiKtYl1XYRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="247695636"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Mar 2026 13:41:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4PcO-000000006Rx-3Ai3;
	Sun, 22 Mar 2026 20:41:52 +0000
Date: Sun, 22 Mar 2026 21:40:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] clk: loongson2: add support for ls2k1000
 compatible
Message-ID: <202603222114.kQXoI5jn-lkp@intel.com>
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
In-Reply-To: <tencent_0FA97DD3D0AFBC69288051AA7FB32817E308@qq.com>
References: <tencent_0FA97DD3D0AFBC69288051AA7FB32817E308@qq.com>
TO: wjjsn <wjjsn@qq.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: chenhuacai@kernel.org
TO: zhuyinbo@loongson.cn
TO: mturquette@baylibre.com
TO: sboyd@kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: loongarch@lists.linux.dev
CC: kernel@xen0n.name
CC: devicetree@vger.kernel.org
CC: wjjsn <wjjsn@qq.com>

Hi wjjsn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v6.16-rc1 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wjjsn/clk-loongson2-add-support-for-ls2k1000-compatible/20260322-175829
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/tencent_0FA97DD3D0AFBC69288051AA7FB32817E308%40qq.com
patch subject: [PATCH v2 2/2] clk: loongson2: add support for ls2k1000 compatible
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: loongarch-randconfig-2051-20260322 (https://download.01.org/0day-ci/archive/20260322/202603222114.kQXoI5jn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222114.kQXoI5jn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603222114.kQXoI5jn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: clock-controller@1fe00480 (loongson,ls2k1000-clk): compatible: ['loongson,ls2k1000-clk', 'loongson,ls2k-clk'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/loongson,ls2k-clk.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
