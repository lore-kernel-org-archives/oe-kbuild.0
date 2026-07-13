Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC47217F33
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Jul 2026 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783911981; cv=none; b=kc7Z4VaihyHZ2Vxaz58TmEXxwdOmkpcATg6bWfkqLevZlOcjK8iSHZ/9XFUoTvwhfJ6smOZ1e8dtpAVFZYJ0d8sqp1qusSPdK9Pmclr+Xq47XzVNK1QcTHHO+s6dZUM7viBZVGyYVRlQjgv/4OoS5J4yVVWKgrQxRHR0TrzTKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783911981; c=relaxed/simple;
	bh=WAukWdO+kAvxNJMChnx5YRjvICk0mee1Za7/Ew3uX2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FBu4S8xBPgyIzj3pZQCuUdat1vPkSF059S1YbkGjSujlmNYAdD0WFxFUHJT/xnghteXWyk3rUINYN7mS7K0KuB05Ls+8uiyLOb5IicP09jog79LPBuAsWNEr9NMpvdHm2bMtII8CS9ndQB6/g06EhMdJRdsHx/vgNa+YcmJ926M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIW3V1N0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIW3V1N0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783911979; x=1815447979;
  h=date:from:to:cc:subject:message-id;
  bh=WAukWdO+kAvxNJMChnx5YRjvICk0mee1Za7/Ew3uX2Y=;
  b=CIW3V1N0SP5UXUbP+o2AQPvxoTC8RgD+dNsLPYzpkcfBWeUHJEWCBf85
   5vtuUItMHYz/nXm73t2VgxzOV6gEFqeHPlj8AZHuMN+TwlB6rDvPUBtxS
   JTkVj/cFluoZqEfPUAX+aMhn7TRsXoXhU94VQrMjLtMJgwPdwMZp8YBqU
   Po8nr64BQN/ubf/lUmt+/FJ6t6w77Y7htmw/4qc1wLcZ5DGQWklBfhDX0
   9f7eER6Ass8uPKsIFWVXhI8Nd5SFubYyO4VYHwpWINlgpPU2qrOWiudNt
   asZiqLsDAAZsvRMHC6P317CYDDEKOjGOdiecdtQfJLHEl9Dxz0GYBVeql
   g==;
X-CSE-ConnectionGUID: 2m2CrZytQzOyaeAnTs7J+Q==
X-CSE-MsgGUID: RDOpvrpZSl+6bF5qxUeZOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95162897"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95162897"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 20:06:19 -0700
X-CSE-ConnectionGUID: 8FE5SkcbTKGItBSR9NLCaQ==
X-CSE-MsgGUID: IqFJ46a8StuTJTxUOnzZ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259002063"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2026 20:06:18 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj6zl-00000000LJs-0crl;
	Mon, 13 Jul 2026 03:06:13 +0000
Date: Mon, 13 Jul 2026 11:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/chrome/cros_ec_chardev.c:285
 cros_ec_chardev_ioctl_xcmd() warn: potential user controlled sizeof overflow
 '(null)' '20 + 0-u32max'
Message-ID: <202607131009.D6sc9jsR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: "Harry Yoo (Oracle)" <harry@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44696aa3a489d2baf58efa61b37833f100072bee
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler-assisted type-based slab cache partitioning
date:   9 weeks ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 weeks ago
config: i386-randconfig-r071-20260713 (https://download.01.org/0day-ci/archive/20260713/202607131009.D6sc9jsR-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607131009.D6sc9jsR-lkp@intel.com/

smatch warnings:
drivers/platform/chrome/cros_ec_chardev.c:285 cros_ec_chardev_ioctl_xcmd() warn: potential user controlled sizeof overflow '(null)' '20 + 0-u32max'
drivers/platform/chrome/cros_ec_chardev.c:285 cros_ec_chardev_ioctl_xcmd() warn: potential user controlled sizeof overflow '(null)' '20 + 0-u32max'

vim +285 drivers/platform/chrome/cros_ec_chardev.c

96a0a80738461d Enric Balletbo i Serra 2019-09-02  268  
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  269  /*
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  270   * Ioctls
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  271   */
032c59c1d3cd45 Tzung-Bi Shih          2025-07-21  272  static long cros_ec_chardev_ioctl_xcmd(struct chardev_priv *priv, void __user *arg)
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  273  {
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  274  	struct cros_ec_command *s_cmd;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  275  	struct cros_ec_command u_cmd;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  276  	long ret;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  277  
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  278  	if (copy_from_user(&u_cmd, arg, sizeof(u_cmd)))
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  279  		return -EFAULT;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  280  
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  281  	if (u_cmd.outsize > EC_MAX_MSG_BYTES ||
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  282  	    u_cmd.insize > EC_MAX_MSG_BYTES)
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  283  		return -EINVAL;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  284  
b20cf3f89c56b5 Tzung-Bi Shih          2023-03-24 @285  	s_cmd = kzalloc(sizeof(*s_cmd) + max(u_cmd.outsize, u_cmd.insize),
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  286  			GFP_KERNEL);
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  287  	if (!s_cmd)
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  288  		return -ENOMEM;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  289  
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  290  	if (copy_from_user(s_cmd, arg, sizeof(*s_cmd) + u_cmd.outsize)) {
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  291  		ret = -EFAULT;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  292  		goto exit;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  293  	}
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  294  
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  295  	if (u_cmd.outsize != s_cmd->outsize ||
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  296  	    u_cmd.insize != s_cmd->insize) {
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  297  		ret = -EINVAL;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  298  		goto exit;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  299  	}
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  300  
032c59c1d3cd45 Tzung-Bi Shih          2025-07-21  301  	s_cmd->command += priv->cmd_offset;
032c59c1d3cd45 Tzung-Bi Shih          2025-07-21  302  	ret = cros_ec_cmd_xfer(priv->ec_dev, s_cmd);
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  303  	/* Only copy data to userland if data was received. */
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  304  	if (ret < 0)
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  305  		goto exit;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  306  
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  307  	if (copy_to_user(arg, s_cmd, sizeof(*s_cmd) + s_cmd->insize))
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  308  		ret = -EFAULT;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  309  exit:
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  310  	kfree(s_cmd);
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  311  	return ret;
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  312  }
eda2e30c6684d6 Enric Balletbo i Serra 2019-09-02  313  

:::::: The code at line 285 was first introduced by commit
:::::: b20cf3f89c56b5f6a38b7f76a8128bf9f291bbd3 platform/chrome: cros_ec_chardev: fix kernel data leak from ioctl

:::::: TO: Tzung-Bi Shih <tzungbi@kernel.org>
:::::: CC: Tzung-Bi Shih <tzungbi@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
