Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543D9175A5
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 02:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774751714; cv=none; b=f0FyBpCxyepQlUPHTAl3WTDlT1QLPmrwcLbEvmk3zcvQLw/mw8KY3y19aeDawriRznZtYnmJ+QCDm+ocslKXRyc8BZIkvvwVwPmI+8UfzF+PX7BzCUgSMAYVwA51IqGvaf0DbBhBFseuYpHk3SkZqZ1mTL3eSHgn/wgqzF0d+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774751714; c=relaxed/simple;
	bh=n4rLPOzd2gmWaCd1zLdU4rvdwZQCExOhi3qFDzszhXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lVuTPjaZWb3MDVMtmHhRCqVFnitq98cSErR6gJ0p0IEWGlmzWciRTkMJrowJQkmSO/Li1udzpYdF293OR/OwOfnINDohgqWBAMzGuhgGTjyKU/pP55bcdqCX5WIGflkOsrm4jo0+ecVfirbgfUm7z6epVG+T0l60vpJHssWfNv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lj9IQzkh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lj9IQzkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774751712; x=1806287712;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n4rLPOzd2gmWaCd1zLdU4rvdwZQCExOhi3qFDzszhXs=;
  b=Lj9IQzkhL3pTJ+EMzp1OlhbrRiZ8+S2mXRPX59i5bgCIlt66UBT5e5sO
   lQ+yoznNATO+1jyagnL3ifwK3U1X9ATZAFGnCf6EL38dOZ1PXOoC/yQKv
   a9yTLVrSVe74sNljBuz5FgREeXzAJgVHLqFGq1+BFWnUu/mPyrGBGl7LC
   ja94EJoijms57cIeJg0OMWRmes3pDXEVF9XZEU+0MsahdnohDp36+dFQU
   +H/yEbfStp258pECZl3lRbzAKZrqM1XjVEQBRVeXbIfoUPBTv7ToALIDR
   6r5UEMOOiLJovCebzPzdp6Kxkm/3Fr7ZjellOmWwxxDw1Xk6OgIx/2XwA
   w==;
X-CSE-ConnectionGUID: 4NQWLMo7QGajTIN2f8aLOA==
X-CSE-MsgGUID: uZ1nPJE4QEWkdbs2o+PKsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75844509"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="75844509"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 19:35:12 -0700
X-CSE-ConnectionGUID: 9NzMRGzdQoiUm+td5H+5ig==
X-CSE-MsgGUID: nSkkBDipRmqi+NjR/d4jhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="227311343"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2026 19:35:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6fzZ-000000007nx-0KWH;
	Sun, 29 Mar 2026 02:35:09 +0000
Date: Sun, 29 Mar 2026 04:35:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] loongarch: boot: dts: Add Loongson-2K0300 support
Message-ID: <202603290426.QQ9CzCWX-lkp@intel.com>
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
In-Reply-To: <tencent_D25EB9D2D600E55537676D2E18523BA72709@qq.com>
References: <tencent_D25EB9D2D600E55537676D2E18523BA72709@qq.com>
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
[also build test WARNING on linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wjjsn/loongarch-boot-dts-Add-Loongson-2K0300-support/20260324-025433
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/tencent_D25EB9D2D600E55537676D2E18523BA72709%40qq.com
patch subject: [PATCH v2 2/2] loongarch: boot: dts: Add Loongson-2K0300 support
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: loongarch-randconfig-2051-20260328 (https://download.01.org/0day-ci/archive/20260329/202603290426.QQ9CzCWX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603290426.QQ9CzCWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603290426.QQ9CzCWX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k0300-ref.dtb: / (loongson,ls2k0300-ref): compatible: 'oneOf' conditional failed, one must be fixed:
   	'loongson,99pi' was expected
   	'loongson,ls2k0500-ref' was expected
   	'loongson,ls2k1000-ref' was expected
   	'loongson,ls2k2000-ref' was expected
   	'loongson,ls2k0500' was expected
   	'loongson,ls2k1000' was expected
   	'loongson,ls2k2000' was expected
   	from schema $id: http://devicetree.org/schemas/loongarch/loongson.yaml
   arch/loongarch/boot/dts/loongson-2k0300-ref.dtb: /: failed to match any schema with compatible: ['loongson,ls2k0300-ref', 'loongson,ls2k0300']
   arch/loongarch/boot/dts/loongson-2k0300-ref.dtb: clock-controller@16000400 (loongson,ls2k0300-clk): False schema does not allow ['ref_120m']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
