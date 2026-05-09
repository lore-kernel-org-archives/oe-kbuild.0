Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010B41F37D3
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 02:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778292323; cv=none; b=P2l335VzZTmwegz3shqJrQWt8RKqseHh5p5mzwHxC1LIhbZR+jYXH/dVXnVPUl/3RESaDi5LN5YyNOrtPwNB/kiidue0/qYnLNsYKG5hLRilhXne9RIE8c3yXI2Lg3hqniBEy4JgtAOITttxQP971KFYUo0rGLYqGNQVYk4lbus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778292323; c=relaxed/simple;
	bh=/dt4p89UAJ/toFsSQUNKcjuesKaQVblNzlXak5IAw9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sodhzBEd3SETJsCkKmQbwY5PFFXW5wWsjk9r2DSSk5s3EiOXngUTmmicac3feZK01pI5Pu7jwbnaSE3SPS5OfdtWOShx4zK7opTkxMEoHvuzLS1ApkSHOdnX6x/dXLVq4GVhycqNDPxBoFuQWMC6qNrCXuylsa0ZTkzv+sLZYBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKVWSN2P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKVWSN2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778292322; x=1809828322;
  h=date:from:to:cc:subject:message-id;
  bh=/dt4p89UAJ/toFsSQUNKcjuesKaQVblNzlXak5IAw9E=;
  b=RKVWSN2Ps0jWdd93uICJKRKK6dwBdx2Js6p8NNVxlf9+LDhtAFFsKBYw
   EHEA52AE+6q8niNUP+p/68hfqY9BW81lSGz1jBUgNw1H3v+xASIm+EMih
   FBFi8srlpRX+Jd6Bpe6/EzAZ50fvA5S4ixfiuJYwZi2FwNhypmf6ptE2c
   WC+uQ750vDg35LIN23UDlHm2i69ZXyIrHSqutYWHioFzDD6xbYqP9wK5u
   cY8NJE4Nwy5v4/QaZPaWVmGEI20+lslIDKOHRPRIDnb/lNsg1AgNwuLAc
   dBnhaRT0/2BKb4x7Yb2lJLXRtMnPCq9t9nK2n29yyC7RgPLI/Suap+GPk
   w==;
X-CSE-ConnectionGUID: 1Ga6S8SLScOPwxmrwdlVpw==
X-CSE-MsgGUID: X3TFIOlbRh+KmpoRTsz+dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="66801495"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="66801495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 19:05:21 -0700
X-CSE-ConnectionGUID: W+XxiAHdTnuut9Ud+WfOHg==
X-CSE-MsgGUID: Fy9ZuE7mTTKr18Pd3UtWoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="235949054"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2026 19:05:20 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLX4A-000000007LV-1DGz;
	Sat, 09 May 2026 02:05:18 +0000
Date: Sat, 09 May 2026 04:05:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:zymqmp/dt 12/17]
 arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000
 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
Message-ID: <202605090317.6rJxAD39-lkp@intel.com>
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
CC: arm@kernel.org
TO: Michal Simek <monstr@monstr.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git zymqmp/dt
head:   0e81960419ad186378b4cb55d7939d03c85262ab
commit: 4f96c5db61f238e8a957df2b81d6343a5e38ca59 [12/17] arm64: zynqmp: Add support for kd240 board
:::::: branch date: 8 months ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260509/202605090317.6rJxAD39-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090317.6rJxAD39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605090317.6rJxAD39-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k24-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
