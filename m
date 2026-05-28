Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7D2347C6
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779997944; cv=none; b=Gfe8oV29ixtBF098/M+Qv6nMwPMUD1U0V+8wrtZTh9kkmpB/0wjZYzRQPiuvVBpckxFNNx4/iAEux5Ajg5V0vqKMg7Q+zsQ38170TPZGpx/2bWUEj50TK3hksorHjVRv6F2bVuYB4MSDKZLvHX/PD+SYJP1PlKkqIt5mSbjgEnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779997944; c=relaxed/simple;
	bh=anDoB/P3LGJ8y3RC8ZzLHld+hy0V/KR8/wYaZwF01Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHVvjJuDR6i7QVn8MjCkF1UHfEOQCQUUJaeTh3e0src3iOvY+9uWguCj5ffC9c0MYnQidbwgKcfuELy/7OZqVxaEhjlqoGHTiT/1BTDMCKS+vsQJX4CTvHIZIH1E6ivqnUmmaAfhOvrkumKmGRr2nB2KOES3No1kfjJzLi4CfIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvRWgEsb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvRWgEsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779997942; x=1811533942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=anDoB/P3LGJ8y3RC8ZzLHld+hy0V/KR8/wYaZwF01Yc=;
  b=CvRWgEsbId9zSzNqyNJCLijGw1O4CVqIYZ4Gsk8PeZMR7JXOfppS9x/j
   OJ8zKo6f50WiqbOAgSVSYsSyYkdq88ufg+1s39UXBV1d4y+yVxVTVSQPP
   u/QPcYxzIChwISJgNaXQSNxJokFVyea0aZODAHYCMLT1azYw76McOBDNk
   lpEdJFO0sUt3Qj/tCI89qz2IQJYb/BK78ekCWNbh8W83oeQh8akHEWN/h
   ItKCtf7x2fwDEN41Mqk0R6TJ39D3RKKm4hINr38iKnHJGrsTGu03jbRaI
   aIMUExe1rQl8W+OmLecY/rP8xUccuvboQgKUrFDfDtzlELzfu9eFgu3CN
   w==;
X-CSE-ConnectionGUID: jKBSQEnITjCEtkZmRM4hgQ==
X-CSE-MsgGUID: hAbu/f/3TpqyPtBPw3WjeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80701453"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80701453"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 12:52:22 -0700
X-CSE-ConnectionGUID: skqc9Ea5RpCk+eYyzlrk7A==
X-CSE-MsgGUID: Jp4Lk7VASHKufraRKL8vrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="246657326"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2026 12:52:20 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSgmA-000000000ZR-2YwT;
	Thu, 28 May 2026 19:52:18 +0000
Date: Thu, 28 May 2026 21:51:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: socfpga: agilex5: popuplate reset property
 for I3C and NAND
Message-ID: <202605282107.UuzlYVFc-lkp@intel.com>
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
In-Reply-To: <20260527151239.55650-1-dinguyen@kernel.org>
References: <20260527151239.55650-1-dinguyen@kernel.org>
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: dinguyen@kernel.org
CC: adrian.ho.yin.ng@altera.com
CC: devicetree@vger.kernel.org

Hi Dinh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.1-rc5 next-20260528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dinh-Nguyen/arm64-dts-socfpga-agilex5-popuplate-reset-property-for-I3C-and-NAND/20260528-001248
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260527151239.55650-1-dinguyen%40kernel.org
patch subject: [PATCH] arm64: dts: socfpga: agilex5: popuplate reset property for I3C and NAND
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260528/202605282107.UuzlYVFc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605282107.UuzlYVFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605282107.UuzlYVFc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: i3c@10da0000 (altr,agilex5-dw-i3c-master): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i3c/snps,dw-i3c-master.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: i3c@10da1000 (altr,agilex5-dw-i3c-master): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i3c/snps,dw-i3c-master.yaml
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: nand-controller@10b80000 (cdns,hp-nfc): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/cdns,hp-nfc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
