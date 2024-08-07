Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA7E18D63E
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723015059; cv=none; b=lrfNJIlfoo8mm4yaT+Aand9HVjqQy1YGHyLJpMVU3x56hlJEJWT95Qr4vEsiBCeXnb9GjLSr0gxQSqKJz4HTC9m8eOGyUSZj7lpIQT2oQ1jtG3pqrpXoYGuH+JAQCPJYP7HeNiH9YVJjODIUBBubA45xjkOLndUJGPJ6hd/gUOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723015059; c=relaxed/simple;
	bh=LlWcxfB1KG9oujN0SKc8Dom0vhC3gXQRRFOIuP8sxlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XfaAReDBtsDY3leun2JAWJf6JCbkVMfL3L3eHs8Rp0ZmBrlqqR9C5901Mr0ZOuM/j9T+kNj3JNUvYa+VB3ttkVYOTJs2W+Pcuefwf0zCOMpu4TKa0xLpBvCxs4Ei2ckNFMyGVbgk3eXZVR5deL611rc6oi0P7eEbFunZ5wmbr40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvKey5CX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvKey5CX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723015058; x=1754551058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlWcxfB1KG9oujN0SKc8Dom0vhC3gXQRRFOIuP8sxlc=;
  b=LvKey5CXUX3GQ9mA164373mwkeY1g4dhWiQ/M7moBHjDMPlZ3mEDRHV1
   VaRmHX0yudhHEM5T3wWR76JL/rXBscYK93jf1tJSATbErFPfqir+Fn2gX
   CWW7GGsiYbAWppovWkOOi8eLvPNHQZOY/1crudj4TtGlNwoTXJL9v9zqf
   atYtMGSOIecdDI5Y/+5o+pVN8fmzYhodCHJn0cQm4Otr4C1eDyvxXB2Xy
   v2Mj4CStqsMjnub8EtcKgt1w7uXxTnFKd/qEl6gxn0PIS52+RAXuN6jER
   QgdkIqXdgOMQEPDQfa0jqTyIWd9wzWmI0XDS9sXgvNjHRjOr89DntmARg
   A==;
X-CSE-ConnectionGUID: jupg0bCLTRyp3Oh2e3uGzA==
X-CSE-MsgGUID: Bdr9SUmaTICU5jx+BhqTIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="38578063"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="38578063"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 00:17:37 -0700
X-CSE-ConnectionGUID: bCD7lbSaQzKc7TMTWb10RQ==
X-CSE-MsgGUID: 3Nj8XfEvSNOabRjqY5+XvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="57456731"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Aug 2024 00:17:35 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbavN-0005CW-1l;
	Wed, 07 Aug 2024 07:17:33 +0000
Date: Wed, 7 Aug 2024 15:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V8 2/2] irqchip/loongarch-avec: Add AVEC irqchip support
Message-ID: <202408071452.6SCU404X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240806115557.4750-1-zhangtianyang@loongson.cn>
References: <20240806115557.4750-1-zhangtianyang@loongson.cn>
TO: Tianyang Zhang <zhangtianyang@loongson.cn>
TO: corbet@lwn.net
TO: alexs@kernel.org
TO: siyanteng@loongson.cn
TO: chenhuacai@kernel.org
TO: kernel@xen0n.name
TO: tglx@linutronix.de
TO: jiaxun.yang@flygoat.com
TO: gaoliang@loongson.cn
TO: wangliupu@loongson.cn
TO: lvjianmin@loongson.cn
TO: zhangtianyang@loongson.cn
TO: yijun@loongson.cn
TO: mhocko@suse.com
TO: akpm@linux-foundation.org
TO: dianders@chromium.org
TO: maobibo@loongson.cn
TO: xry111@xry111.site
TO: zhaotianrui@loongson.cn
TO: nathan@kernel.org
TO: yangtiezhu@loongson.cn
TO: zhoubinbin@loongson.cn
CC: loongarch@lists.linux.dev
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Huacai Chen <chenhuacai@loongson.cn>

Hi Tianyang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on tip/x86/core tip/smp/core linus/master v6.11-rc2 next-20240806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyang-Zhang/irqchip-loongarch-avec-Add-AVEC-irqchip-support/20240806-195922
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20240806115557.4750-1-zhangtianyang%40loongson.cn
patch subject: [PATCH V8 2/2] irqchip/loongarch-avec: Add AVEC irqchip support
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: loongarch-randconfig-001-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071452.6SCU404X-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071452.6SCU404X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408071452.6SCU404X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/matrix.o: warning: objtool: irq_matrix_assign_system+0x16c: unreachable instruction


objdump-func vmlinux.o irq_matrix_assign_system:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
