Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD22D7E0FF
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Feb 2026 15:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769959679; cv=none; b=muTyzNRQLusvbnYiFzNOtsdPhfQx8xyec6RdvfMzmkjpGEqyNBf4K7oIHXYN72f2MAngDgDbJc9tSbpFWB9Du4zh2zlNhd1cdVaeKh50cREA20Ydb+YjSBsmx6p1dnUsFxtMC/YJZtfvgZU7JnLjo+bSoHJ9dw5dtxe8WgUlzMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769959679; c=relaxed/simple;
	bh=erRsiqxSE2bLu7Zpd/e/B4Q6M7AFklkqWZVzE+I9Xa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lWx6Fu33ID/nczV6xVRMFaz7j2TVyDpV7gYKJdOFwG7Q/nPhLfsG9EB9tl/rNewmfp0W1VieWS7bXDA8gc35jUIzYhy7X/W+pA8R7mkPY+EZy8DuNdT+eX7Knfd/mD9cEbzOe1Icq/zuOhoeGZ3LTT+UHojv1YMEl0gTDR0xPyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ac2ICeJl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ac2ICeJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769959676; x=1801495676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=erRsiqxSE2bLu7Zpd/e/B4Q6M7AFklkqWZVzE+I9Xa4=;
  b=Ac2ICeJl4x1YGHrqsCWbyJppLWV2A1BxqM0KsrVfCngXVP1AhF2VgbRB
   WDMtRpwduEY2q672s8WnChhIFh0DrgQ52IUAl8jRc/JVnziFT4NBBIWmk
   MVtJYYqKFtq7zjY1AobNBTIa3DaPt9+51Di2md0X61I0xZ1DO5eo/+emz
   pkm8dfjV/Jx+ILk/tCBc5sXTrEfoM4weAwbsTEHi1UPXqrVGZIeDrucAF
   JAPGYR7jivKlLjocSIOnt1pIfBddcqsQVD/VyXsJZ/n1cSFNkSulbzmNf
   6/QPmEeeR79t9JoE8Mv52uHZD7DI1TKvcYmh250scfWKBCIIeTbT1NI9V
   Q==;
X-CSE-ConnectionGUID: WhX00Le8RHKgvIGw523spg==
X-CSE-MsgGUID: JtXtNuElSuCOl5ey3fIlug==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71301457"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="71301457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 07:27:55 -0800
X-CSE-ConnectionGUID: 1KcWswzrTcqTlgT8DGas9Q==
X-CSE-MsgGUID: xXb/IvSeS7yUuzW3B2VM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="246893088"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Feb 2026 07:27:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmZMd-00000000eoi-1wwj;
	Sun, 01 Feb 2026 15:27:51 +0000
Date: Sun, 1 Feb 2026 23:27:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
Message-ID: <202602012347.NI0P3lrp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260201072124.566587-1-liushuyu@aosc.io>
References: <20260201072124.566587-1-liushuyu@aosc.io>
TO: Zixing Liu <liushuyu@aosc.io>
TO: WANG Xuerui <kernel@xen0n.name>
TO: Huacai Chen <chenhuacai@kernel.org>
TO: Bibo Mao <maobibo@loongson.cn>
CC: Kexy Biscuit <kexybiscuit@aosc.io>
CC: Mingcong Bai <jeffbai@aosc.io>
CC: Zixing Liu <liushuyu@aosc.io>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Tianrui Zhao <zhaotianrui@loongson.cn>
CC: Paul Walmsley <pjw@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Alexandre Ghiti <alex@ghiti.fr>
CC: kvm@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: loongarch@lists.linux.dev
CC: linux-riscv@lists.infradead.org

Hi Zixing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on kvm/next linus/master v6.19-rc7]
[cannot apply to kvm/linux-next next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zixing-Liu/KVM-Add-KVM_GET_REG_LIST-ioctl-for-LoongArch/20260201-152421
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260201072124.566587-1-liushuyu%40aosc.io
patch subject: [PATCH v3] KVM: Add KVM_GET_REG_LIST ioctl for LoongArch
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: loongarch-randconfig-r064-20260201 (https://download.01.org/0day-ci/archive/20260201/202602012347.NI0P3lrp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602012347.NI0P3lrp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/loongarch/kvm/vcpu.c:1226:5-6: WARNING: Unsigned expression compared with zero: i < 0

vim +1226 arch/loongarch/kvm/vcpu.c

f93c86c7d256ca Zixing Liu 2026-02-01  1218  
f93c86c7d256ca Zixing Liu 2026-02-01  1219  static int kvm_loongarch_copy_reg_indices(struct kvm_vcpu *vcpu,
f93c86c7d256ca Zixing Liu 2026-02-01  1220  					  u64 __user *uindices)
f93c86c7d256ca Zixing Liu 2026-02-01  1221  {
f93c86c7d256ca Zixing Liu 2026-02-01  1222  	u64 reg;
f93c86c7d256ca Zixing Liu 2026-02-01  1223  	unsigned int i;
f93c86c7d256ca Zixing Liu 2026-02-01  1224  
f93c86c7d256ca Zixing Liu 2026-02-01  1225  	i = kvm_loongarch_walk_csrs(vcpu, uindices);
f93c86c7d256ca Zixing Liu 2026-02-01 @1226  	if (i < 0)
f93c86c7d256ca Zixing Liu 2026-02-01  1227  		return i;
f93c86c7d256ca Zixing Liu 2026-02-01  1228  	uindices += i;
f93c86c7d256ca Zixing Liu 2026-02-01  1229  
f93c86c7d256ca Zixing Liu 2026-02-01  1230  	for (i = 0; i < KVM_MAX_CPUCFG_REGS; i++) {
f93c86c7d256ca Zixing Liu 2026-02-01  1231  		reg = KVM_IOC_CPUCFG(i);
f93c86c7d256ca Zixing Liu 2026-02-01  1232  		if (put_user(reg, uindices++))
f93c86c7d256ca Zixing Liu 2026-02-01  1233  			return -EFAULT;
f93c86c7d256ca Zixing Liu 2026-02-01  1234  	}
f93c86c7d256ca Zixing Liu 2026-02-01  1235  
f93c86c7d256ca Zixing Liu 2026-02-01  1236  	reg = KVM_REG_LOONGARCH_COUNTER;
f93c86c7d256ca Zixing Liu 2026-02-01  1237  	if (put_user(reg, uindices++))
f93c86c7d256ca Zixing Liu 2026-02-01  1238  		return -EFAULT;
f93c86c7d256ca Zixing Liu 2026-02-01  1239  
f93c86c7d256ca Zixing Liu 2026-02-01  1240  	if (!kvm_guest_has_lbt(&vcpu->arch))
f93c86c7d256ca Zixing Liu 2026-02-01  1241  		return 0;
f93c86c7d256ca Zixing Liu 2026-02-01  1242  
f93c86c7d256ca Zixing Liu 2026-02-01  1243  	for (i = 1; i <= NUM_LBT_REGS; i++) {
f93c86c7d256ca Zixing Liu 2026-02-01  1244  		reg = (KVM_REG_LOONGARCH_LBT | KVM_REG_SIZE_U64 | i);
f93c86c7d256ca Zixing Liu 2026-02-01  1245  		if (put_user(reg, uindices++))
f93c86c7d256ca Zixing Liu 2026-02-01  1246  			return -EFAULT;
f93c86c7d256ca Zixing Liu 2026-02-01  1247  	}
f93c86c7d256ca Zixing Liu 2026-02-01  1248  
f93c86c7d256ca Zixing Liu 2026-02-01  1249  	return 0;
f93c86c7d256ca Zixing Liu 2026-02-01  1250  }
f93c86c7d256ca Zixing Liu 2026-02-01  1251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
