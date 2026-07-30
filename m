Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BEC3859EB
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 06:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785391948; cv=none; b=vAKBbMQrhMKO7eyIKKvVaTAIl6pDWtc9ClvJWl79zMRJPyGkd5dWG7NEEDOoMIKrTtdWe7xJwxVP5zqHf+PTd8s6ysDtLwWdvXqfvwXpjbhDJ0CbfKyBInDITDvZGZTb3OQcdZS73PseLKGG8BiQCIcd0E3+7G6kOHjT15mqQ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785391948; c=relaxed/simple;
	bh=8c6JBGpdYpjOo4uY0YMEslyIIGJ8kTifLoOZ55RHkuc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=usnj3fJt+9BkxQhqwkndS9cyhPKyYWDokBIg4DNWuPcsH+gcjd+lWVtP1iYCNvK7yM1fQ6nmDCnJ4y0qu1u6aazm4hbI1/t3iZe2soDUZjQ0v29DUkdKc0gLvE5NTwOPPYgNM/LvtjhmdQLeK1ahuFm8DGheJuCnRYCrWKUKImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+lmrNos; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+lmrNos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785391942; x=1816927942;
  h=date:from:to:cc:subject:message-id;
  bh=8c6JBGpdYpjOo4uY0YMEslyIIGJ8kTifLoOZ55RHkuc=;
  b=S+lmrNosg8MveqJCigaP8nhKEwn1yHOvlKjthZLbgdC7+Po+0SS0C3af
   gTS+QWBm5ed/MZ/dlmNsAuyH0703BUMZEjg2hdJt3U7q5NSu8FCKwDz24
   ZhtlHUuqb65tprBtbGw37TzmCZ4FIw3tSbzKKG6XEAtpE4vuwC8wPl99G
   tk7PpYUSkevFZlnGtbfbq26Ek+Ap1xr/QNKWjuN82LG0qvdMrkpFb2YLt
   0SHt0ZjC1L96D3jQNzZVoGhamz4jr3/RjW25qxxXc/273qGIyhboGLWPm
   v+1t7WgVURONxL85sgUK2BwrZP4+gqtq0vbFseLcB60OIJ2+n7G6x0Dix
   A==;
X-CSE-ConnectionGUID: YA7i7rWSRbeOuHsxJrxmpA==
X-CSE-MsgGUID: p0yZdVRgRvSAqYitDHdfKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86041366"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86041366"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 23:12:16 -0700
X-CSE-ConnectionGUID: 1+5kFbJHQF6uak2jw7JsBA==
X-CSE-MsgGUID: WNwITu6pS96SZ+1XluqZFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="256272994"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2026 23:12:15 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpK04-000000002L8-2hN5;
	Thu, 30 Jul 2026 06:12:12 +0000
Date: Thu, 30 Jul 2026 08:11:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.3-armsoc/dts64 33/50]
 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: edp@fdec0000
 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
Message-ID: <202607300843.ivIzy2iy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Hrushiraj Gandhi <hrushirajg23@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.3-armsoc/dts64
head:   6d9430d58714909071853c0949cdc93756aa3ad4
commit: c42f01f053a7be77f534c850911cd8d54777af19 [33/50] arm64: dts: rockchip: add Vicharak Axon board
:::::: branch date: 14 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2055-20260729 (https://download.01.org/0day-ci/archive/20260730/202607300843.ivIzy2iy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300843.ivIzy2iy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607300843.ivIzy2iy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
