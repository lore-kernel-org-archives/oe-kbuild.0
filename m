Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545561862
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Aug 2024 03:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722569115; cv=none; b=PLMR0xsIODa92L69sXHHND0hbJPfLXbMeazblNsmpHOj/r8ITTzOzpZDViMy0/TmCM+Vsp8P4nt5G1K8M5ySd4ulMkp7onP3IIVCT+J2gwLyvc3g8xP7+/RmK66Lh3prwdoOFQlkwhMwJCwz7qeHm3SewPYMR2yITE1/mFVS9Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722569115; c=relaxed/simple;
	bh=SzpwY4tYkdJvd5VVqv0xCRtkX854LEiI/rMImnQ+DVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pz5mYicPPLxYcJCO/23gNTnSCMikr2nzZz/Xq7/HzGy8XWrmC410KMRi4I+6wS8KII1lj+vQlXBGwDZO6LWg8nFoYpVghQaZzWdXiuR1uf24w71z+Ujl5zEtq6i7WFfXgQW54TzKAiEQfId+u1HGXBs9ZyV9VCEIYTduWVb/GwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYIGclLh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYIGclLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722569113; x=1754105113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SzpwY4tYkdJvd5VVqv0xCRtkX854LEiI/rMImnQ+DVA=;
  b=BYIGclLhvq4hw8TPuVNLBRlma0/tc3mFXQdUabkyRbwgyMKNkGCQI7ZL
   S0FRZHcSNwmnzdORT1TjTiycXxQYcj3q9MxCqkHnA+nnFwjq+/JRfaaDM
   1oEqsiCQh2aRyZRgojbNQs9sQTpE1h1rd3hPQfXa+Kv3M+3w4Q8OlqJoV
   IuFBpTGsOBBSCOe9KG/pRwjLiapRfaaWd0bgspjzjPGREqTt/S3TKBgG0
   LRgGMNpTOY4nRy10lZi++1eeD+0k41B0ZO6uXgiUmuYYyT8+H6lZ73T2U
   fjII2iCb22oBxTH/TzxtsG3uzvhdb/DDWWAoFtJUXm60FoPmLeDLpyTRc
   g==;
X-CSE-ConnectionGUID: evaQ0s9uSN+22LDUHEa6mQ==
X-CSE-MsgGUID: q7l8JgLlRYmCmWdKtpvoeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31197982"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="31197982"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 20:25:01 -0700
X-CSE-ConnectionGUID: nzBZUxuYTiqw8CH0JZIqUQ==
X-CSE-MsgGUID: wxgqs+sjTcqnZVvXsnFIvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="55175432"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Aug 2024 20:25:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZiuY-000wIc-1D;
	Fri, 02 Aug 2024 03:24:58 +0000
Date: Fri, 2 Aug 2024 11:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/for-next 4/4]
 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34:
 regulators: 'boost' does not match any of the regexes:
 '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$',
 'pinctrl-[0-9]+'
Message-ID: <202408021153.Hl36O38B-lkp@intel.com>
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
TO: Chris Morgan <macromorgan@hotmail.com>
CC: "Chen-Yu Tsai" <wens@csie.org>
CC: Andre Przywara <andre.przywara@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
head:   2873085a8cd52a55ed6ae80f94032f912a3f9a91
commit: 2873085a8cd52a55ed6ae80f94032f912a3f9a91 [4/4] arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-randconfig-051-20240802 (https://download.01.org/0day-ci/archive/20240802/202408021153.Hl36O38B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408021153.Hl36O38B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408021153.Hl36O38B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
