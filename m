Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D434A3B4
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774201136; cv=none; b=czOUTAEcdJj1thsVnhDMPD3rcuSAFtBB1/xnL+9PmHKyqExPXwGZgiNSzkaGBiAncTrGSTr3S9+yqTBtFsFfTDVjselAMsadNip3rXuigkz1XqjZOtJWVjebu11kjvWliFY3gi0mUj4r6tnMtDr9Jld0S+HVXVt4itkKXDp9mjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774201136; c=relaxed/simple;
	bh=7Y1A25BHQ6rLCU/Ie8R+L6CrRzLoMQQXbTMuY1c1u0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S5GztbfVD6pOjBTJkFgAi+WLE5DEFpF0GK6Qs1ZmGcv1ztBW7xl8CDqIFgHCEA9vU4/DeqMp4k5Vqo6y8aBd1aRo6zGWbgkxivoivl3TQSt5uCh4T4UOn5kWRXOEPDj8FaZZ1oTbSTh9WXUQM+mKpqP7IjjPR1RCgul9lTvDId0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VS5ByT03; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VS5ByT03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774201132; x=1805737132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Y1A25BHQ6rLCU/Ie8R+L6CrRzLoMQQXbTMuY1c1u0Q=;
  b=VS5ByT03KG0Oj328KWToVVzNnPa02dOfl/MY9uF43nwn2GlVmODJlx/h
   ST3iD70ZKKClzbM3r+CWrhBqaHkMTxVDCsFZaij7gr0H93AuoU3bku301
   M49j7BE4twPVv30TUQvrsJeWWHAvbV0bgHf1rWn1Ps7Jbvp+eLqFSSYaS
   zQHDb5ML4qbFgL024hYS9fIMj/vuLsJeokAaXPO2zlNhCBD0NUGOZ1XRG
   adwgNlHXWunYZ//5V6JofVD5jOT/EZsX7MWq8j1VfbH+nVxPekNSIDdOk
   8xZidPTh5uDzs7wMZd6/tAIRHD3Oq6ZiudnlrimQuo8Tud7gEKxcs5dGX
   w==;
X-CSE-ConnectionGUID: jTIZnz0KRXiu2+rsMOVguQ==
X-CSE-MsgGUID: HXKxU2roSvGjNfG3Y0C3Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86287285"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="86287285"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 10:38:52 -0700
X-CSE-ConnectionGUID: xK6h6XkTRbqJeftBScISdQ==
X-CSE-MsgGUID: oAynIK82TS2NQzB8CR/fkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="221035442"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 22 Mar 2026 10:38:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4MlG-000000006Pd-18JA;
	Sun, 22 Mar 2026 17:38:50 +0000
Date: Sun, 22 Mar 2026 18:38:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] loongarch: boot: dts: Add Loongson-2K0300 support
Message-ID: <202603221812.paxyhoFM-lkp@intel.com>
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
In-Reply-To: <tencent_043BCD1F1043957E96ED022D75601AF05505@qq.com>
References: <tencent_043BCD1F1043957E96ED022D75601AF05505@qq.com>
TO: wjjsn <wjjsn@qq.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: chenhuacai@kernel.org
CC: kernel@xen0n.name
CC: devicetree@vger.kernel.org
CC: loongarch@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: wjjsn <wjjsn@qq.com>

Hi wjjsn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wjjsn/loongarch-boot-dts-Add-Loongson-2K0300-support/20260322-130435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/tencent_043BCD1F1043957E96ED022D75601AF05505%40qq.com
patch subject: [PATCH] loongarch: boot: dts: Add Loongson-2K0300 support
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: loongarch-randconfig-2051-20260322 (https://download.01.org/0day-ci/archive/20260322/202603221812.paxyhoFM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221812.paxyhoFM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603221812.paxyhoFM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k0300-ref.dtb: /: failed to match any schema with compatible: ['loongson,ls2k0300-ref', 'loongson,ls2k0300']
>> arch/loongarch/boot/dts/loongson-2k0300-ref.dtb: /: failed to match any schema with compatible: ['loongson,ls2k0300-ref', 'loongson,ls2k0300']
>> arch/loongarch/boot/dts/loongson-2k0300-ref.dtb: clock-controller@16000400 (loongson,ls2k0300-clk): False schema does not allow ['ref_120m']
   	from schema $id: http://devicetree.org/schemas/clock/loongson,ls2k-clk.yaml
>> arch/loongarch/boot/dts/loongson-2k0300-ref.dtb: clock-controller@16000400 (loongson,ls2k0300-clk): clock-names:0: 'ref_100m' was expected
   	from schema $id: http://devicetree.org/schemas/clock/loongson,ls2k-clk.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
