Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05EC3F881F
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 20:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773951928; cv=none; b=Z45ti7+x+0vVSvoFsR8P+Wk1iGjKoH0zPH6nPKsc+EKuI2K/WPRU3f/nveNJpV7PG+nHjxI1yd+jpg5s8XU5a+ObZu1spErZUC/c9D38dKSzZwZ21/O5mharuXr7uNkgSeXABy5tVlB7Owqg86qsgTZvcU9XriCdzFQyW6jibho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773951928; c=relaxed/simple;
	bh=CtNXhNVjrvRnQqxouCBfiF4P8tMvk7KgHKyW8Y68TyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EahlMSY/SBwZ8SOifokeKrL9KhBtzfoFR/To05pkqyCejEWJLq7lQvQicUUByd7eg61/L3gbIR1smKCdY3UgH8i3Al2/EMXmGm5mg3rnhPX1CH7XT9kB9zyzRNRdm4l4c0wwF6GDFfQqAfWzOcmSrpMwq1vKWjPbbKeZcCqJ29M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYTZQFO9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYTZQFO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773951926; x=1805487926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CtNXhNVjrvRnQqxouCBfiF4P8tMvk7KgHKyW8Y68TyE=;
  b=lYTZQFO9aMRKRwm0AeQHiQJJYtKTVPTHgCnrxEx41Gav10CcChVekW3y
   K2it+bQx1JCU93acpBipqownHUJ1eyBazYQ7tIOhy6datbuQHRNivP0+u
   mh0cK17XIxAl3+LFrs0MQmoechP5ZEdJGr7j/PvaLw4qPGfT1oCIp5G2H
   aPYfPs675bs0ifGfO4d5Q2SYNjm6JbKptNyuFrRwRuCCC0V6uvJNyQQTf
   bSeLedYBR6o1PpH2vUWmYIn1uJZ/bmjVDpZSmmsyd/+L8j92cn8bQZ6RE
   vwpgk0ouSJFrxKki/HgDqCZRrjHZqh5gmQ1ZCpQR2aJNMMqMp1aQLTmtn
   w==;
X-CSE-ConnectionGUID: 3PhS98bnQrubYc2CIPu3Bw==
X-CSE-MsgGUID: I1bdUNmFQ22eAUmJWs18sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78894432"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78894432"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 13:25:25 -0700
X-CSE-ConnectionGUID: n9KPaYJESwKB13UBe60PbQ==
X-CSE-MsgGUID: iWuvGSJSTbOWDeFp5AB0FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222185687"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Mar 2026 13:25:24 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Jvl-000000001cr-2cDA;
	Thu, 19 Mar 2026 20:25:21 +0000
Date: Fri, 20 Mar 2026 04:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Support struct btf_struct_meta via
 KF_IMPLICIT_ARGS
Message-ID: <202603200410.ZnghNupo-lkp@intel.com>
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
In-Reply-To: <20260318223544.1789748-1-ihor.solodrai@linux.dev>
References: <20260318223544.1789748-1-ihor.solodrai@linux.dev>
TO: Ihor Solodrai <ihor.solodrai@linux.dev>
TO: Alexei Starovoitov <ast@kernel.org>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: Daniel Borkmann <daniel@iogearbox.net>
TO: Eduard Zingerman <eddyz87@gmail.com>
CC: bpf@vger.kernel.org
CC: kernel-team@meta.com

Hi Ihor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ihor-Solodrai/selftests-bpf-Update-kfuncs-using-btf_struct_meta-to-new-variants/20260319-070652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260318223544.1789748-1-ihor.solodrai%40linux.dev
patch subject: [PATCH bpf-next v2 1/2] bpf: Support struct btf_struct_meta via KF_IMPLICIT_ARGS
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200410.ZnghNupo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603200410.ZnghNupo-lkp@intel.com/

smatch warnings:
kernel/bpf/verifier.c:12760 is_bpf_rbtree_add_kfunc() error: buffer overflow 'special_kfunc_list' 64 <= 64

vim +/special_kfunc_list +12760 kernel/bpf/verifier.c

3700d7c829341d Ihor Solodrai   2026-03-18  12757  
3700d7c829341d Ihor Solodrai   2026-03-18  12758  static bool is_bpf_rbtree_add_kfunc(u32 func_id)
3700d7c829341d Ihor Solodrai   2026-03-18  12759  {
3700d7c829341d Ihor Solodrai   2026-03-18 @12760  	return func_id == special_kfunc_list[KF_bpf_rbtree_add] ||
3700d7c829341d Ihor Solodrai   2026-03-18  12761  	       func_id == special_kfunc_list[KF_bpf_rbtree_add_impl];
3700d7c829341d Ihor Solodrai   2026-03-18  12762  }
5c8fd7e2b5b0a5 Mykyta Yatsenko 2025-09-23  12763  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
