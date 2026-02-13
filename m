Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90FF34B40C
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 17:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771005359; cv=none; b=Dl5mX5cmkqfG+Vlt7SA+NwH33xfwHsHlwpOKK56rVjq4nirJ6wF3D46jk/Iw47hoyOUJQVR7a0Tv2voiK4aQrzunhwjuwQvlvcy33kT6q6JPW79agYnLLwJX13vo2fw+wS+UCev6TSdf4fpmfMcK0eV+19zvwfMNHz7NLByEo8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771005359; c=relaxed/simple;
	bh=61YDlN9TxunrC0tbbRNa2Q9MHcFOU7Cq9lLMtCohGT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k+6hG9GnV6y50SPSgeD/3svpcy8Dko8+mhTEkbzT2C5S/Wo2ljlLoBU/F0ZtzBs2XhcbZE8BwWJvql8Gme1TqCNgq7m23KvCfOAemZm220dMglhkYBQWd5F4BUgXFhhbUuZJEjg3YML7K2h6fCbVnu07uY2WcMDJHu7O3FfpHJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEWiUpnr; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEWiUpnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771005357; x=1802541357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61YDlN9TxunrC0tbbRNa2Q9MHcFOU7Cq9lLMtCohGT4=;
  b=TEWiUpnrEE96RXFuYG6fycSx8vf+eS3rHPMnMJkuFklrPgRNGXM638lA
   BsuFQIDEZKk94hQbJ/0MD1ElgngNAHyoAAekxjallshhlQJK+j+QQoqAM
   LHRDZsHRpxoChX1ras4XFc+CbL9NUjxzjSJh8s1DYLy98ZU5ZyaerIaEq
   jBUKykCBzGnirYS6w9mS60BTJ3MMZ2ObnRIVfFXF8nhazLnSlPM0EsP4v
   bwNfIwCyPFDJKuRAAmG6jZ0w0vksSwYs0mVACfydQzF8vdhwnEiR4BwIG
   rCskw1gyAlVRUWTcUJflyeIBvotzd2mIvsGJayKoLgnQaSBWy1XQA6nHX
   g==;
X-CSE-ConnectionGUID: MnzgcqAvSaOCTavhCL3/3Q==
X-CSE-MsgGUID: arXI8ikiROSghIM/5F3OEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71219246"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="71219246"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 09:55:55 -0800
X-CSE-ConnectionGUID: aycp1w9CR1ye5z8w6TseWw==
X-CSE-MsgGUID: pLvEVfa0TqS2Ojg7a+sN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="217957385"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2026 09:55:52 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqxON-000000001dt-2bzx;
	Fri, 13 Feb 2026 17:55:47 +0000
Date: Fri, 13 Feb 2026 18:55:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] LRW UART: dt-bindings: Add binding for LRW UART
Message-ID: <202602131838.XcBQaI5G-lkp@intel.com>
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
In-Reply-To: <20260213093334.9217-2-qtliu@mail.ustc.edu.cn>
References: <20260213093334.9217-2-qtliu@mail.ustc.edu.cn>
TO: LiuQingtao <qtliu@mail.ustc.edu.cn>
TO: gregkh@linuxfoundation.org
CC: jirislaby@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: neil.armstrong@linaro.org
CC: bjorn.andersson@oss.qualcomm.com
CC: marex@nabladev.com
CC: dev@kael-k.io
CC: mani@kernel.org
CC: prabhakar.mahadev-lad.rj@bp.renesas.com
CC: linux-serial@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: liu.wenhong35@zte.com.cn
CC: liu.qingtao2@zte.com.cn
CC: hu.yuye@zte.com.cn
CC: dai.hualiang@zte.com.cn
CC: deng.weixian@zte.com.cn
CC: jia.yunxiang@zte.com.cn
CC: bai.lu5@zte.com.cn
CC: yang.susheng@zte.com.cn
CC: shen.lin1@zte.com.cn
CC: tan.hu@zte.com.cn
CC: zuo.jiang@zte.com.cn

Hi LiuQingtao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus robh/for-next usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/LiuQingtao/LRW-UART-dt-bindings-Add-binding-for-LRW-UART/20260213-173610
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20260213093334.9217-2-qtliu%40mail.ustc.edu.cn
patch subject: [PATCH v1 1/2] LRW UART: dt-bindings: Add binding for LRW UART
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: arc-randconfig-2051-20260213 (https://download.01.org/0day-ci/archive/20260213/202602131838.XcBQaI5G-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131838.XcBQaI5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602131838.XcBQaI5G-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml: maintainers:0: 'Christopher Ruehl chris.ruehl@gtsys.com.hk' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
   Documentation/devicetree/bindings/input/syna,rmi4.yaml: maintainers:1: 'Matthias Schiffer <matthias.schiffer@ew.tq-group.com' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
   Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml: maintainers:0: 'Frank Li <Frank Li@nxp.com>' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml
>> Documentation/devicetree/bindings/serial/lrw,lrw-uart.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/serial/lrw-uart.yaml
    	file: Documentation/devicetree/bindings/serial/lrw,lrw-uart.yaml
   Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml: maintainers:2: 'Seung-Woo Kim <sw0312.kim@samsung.com' does not match '^(.+ <[\\S]+@[\\S]+>|[\\S]+@[\\S]+)$'
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
