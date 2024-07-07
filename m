Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CD718E28
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720370089; cv=none; b=BRJnxNBMXN8yjnkr20n3lv4CfeMX0cfAWdfrb7SuXUEicw2zWQf29ZcQaOWp1ql3pczUR7BlYsaa6K2H2dKyeq4DQ4A73DiGjF3gImY0g8MjAoifU6RIH0tJOesDM1mzhYWbp3M9QOd4942ESRWsc/66oYJASwGE2AkYMLxqRUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720370089; c=relaxed/simple;
	bh=crtacC+JrAPz3/PwBeF12ry3pNIRfVkwpptrzCfoE5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=itz0g0fNG6K1p+y/D8Xz3NCUtYb5OmpQDf4sKQcAv2GRURofKcbUgBdAMvlLnUPUgPFu8EhljP5pwIO2SIU9E3+WBPZv+w7klNmeS2cWrjVq//7gR2OUpnVesGuxGUbo/oMw8px97kGX/qROzklMkaQJbJE1IW2nmA9We8nuTzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/JKxG3N; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/JKxG3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720370087; x=1751906087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crtacC+JrAPz3/PwBeF12ry3pNIRfVkwpptrzCfoE5w=;
  b=M/JKxG3Nhppl7eCssuSE6GWvnvKuhDT3yld+s7RACwaCJEowuX8RDkAC
   Se/MSLND3SVX4cz0grpxP/uJNRvHEjC4Ee0Lip8clRuY5Pf4Dk8MMWYJn
   C6SOlGJ/trfvH2hYFW9R1HbkON/40YYpx8rxr1k5WyU8MeG6EroLJYFur
   WLZbgeL+QK6Qzyh/RTOj+9mtZwY33Pjt0yX4nfmonpbDG2ErbztwDe9CO
   EYb+qMx5rg9Vl/mnu6UEn6YR7xUTB3zxLEJi5Qrj2lb75T28TApj39Ex6
   /6UqtrCVdgxqDokr0LtoGsFqVwwR5tDFOnMG++5UJbj5Zid2N41Mb/pdC
   Q==;
X-CSE-ConnectionGUID: JsonKkazSwCakkNvQ8KBIQ==
X-CSE-MsgGUID: 85lfKVUuSRectjNab837ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="12425317"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="12425317"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 09:34:47 -0700
X-CSE-ConnectionGUID: 0IEaYqdGQ9yCdovHWt4u1g==
X-CSE-MsgGUID: vqryBclMQcS6vJrySTpk6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="48027097"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jul 2024 09:34:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQUqZ-000V74-1X;
	Sun, 07 Jul 2024 16:34:43 +0000
Date: Mon, 8 Jul 2024 00:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.11-armsoc/dts64 29/54]
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: i2s-8ch@ff898000:
 '#sound-dai-cells' is a required property
Message-ID: <202407080024.T3sihsgk-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Alex Bee <knaerzche@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.11-armsoc/dts64
head:   0e1ab7efe34b3acc99387a9921123b8fc5f7af97
commit: 7b4a8097e58b608638d416bd57469f8a9ab70e7b [29/54] arm64: dts: rockchip: Add Neardi LBA3368 board
:::::: branch date: 3 days ago
:::::: commit date: 13 days ago
config: arm64-randconfig-051-20240707 (https://download.01.org/0day-ci/archive/20240708/202407080024.T3sihsgk-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240708/202407080024.T3sihsgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407080024.T3sihsgk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /i2c@ff660000/codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: /mbox@ff6b0000: failed to match any schema with compatible: ['rockchip,rk3368-mailbox']
>> arch/arm64/boot/dts/rockchip/rk3368-lba3368.dtb: i2s-8ch@ff898000: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-i2s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
