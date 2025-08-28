Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2B25D1EE
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Aug 2025 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756393757; cv=none; b=XeyVndOu38IAc67W1Jtkfc7pbuYVzLJF9ezEq4Cpwyr2tsR17sS8EPtt8JgfCnJkUeaOdFpOoz0REiJU9DieTJtaCysKE2md+6cBT3vtSKvPlrCLcDKgFa6b8vX9xso+sS7lQO2NdVofZDffGkTdCmF3T8TWDrrV6GnPTIZimhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756393757; c=relaxed/simple;
	bh=BYSC7hq+cBnccuidhxlUIPd/9y6Vhe5CmukEkZmi7Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NlzVkQgLzfkyrxOml5UvK5oz5Rd5yi3X4NjdyPedCQqwJmSW8CR+K+NfAVPhPHdC56ohH5Dm0ha4RhBK7bewU9TvH+WiHmraRQBDwS1PbgzUuew85FnqDb1doCJ0afhAximDFSMUizrnpHNDMBIDMfI/s18Ia9utg5u/pyXV6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqk1dpjK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqk1dpjK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756393755; x=1787929755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BYSC7hq+cBnccuidhxlUIPd/9y6Vhe5CmukEkZmi7Lg=;
  b=cqk1dpjKLNZOwnVl1AG0Dw11CnOzBsyWZXNjS+fpd6UoElBQa5HsyOs6
   j+vuIf3D7OGl2e2Z5ec/9nf/F/XrzkLJ6k4Ci33gPX1kbKjBunMlnJhQS
   BzOxlnnJLbYwJE11lnY5Refv2sSOhDscDY0eoaRJdsyuKcKniQOu4ct0d
   KGsgocuA+KzgNfD/FAlVL51o029pWz6H5F88V5L3fQ9i1sdLQM39F+EKb
   vf/szPf4OaXr3CJP9ci7/YdF+y3g2VYcH1/v/cPzc3z9GVTfHBBOaDQgP
   ORifpGmGUR5YoNLaepXeE8OTqf1IAhImOiwzXrm8WokbsFVrK159+xGuI
   A==;
X-CSE-ConnectionGUID: +qw4etSjSPuctZSdq6LZ1g==
X-CSE-MsgGUID: n5wlfVi/SKyIVsiZylODeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58814609"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58814609"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 08:09:15 -0700
X-CSE-ConnectionGUID: WDhLaY2rSvKq2r1zREpVpA==
X-CSE-MsgGUID: hrzCPxDkRXaP1hxB1MeX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="201052715"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Aug 2025 08:09:13 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ureF7-000Tlz-1O;
	Thu, 28 Aug 2025 15:09:10 +0000
Date: Thu, 28 Aug 2025 23:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 06/11] virtio_net: Implement layer 2 ethtool
 flow rules
Message-ID: <202508282217.SOW1L4jj-lkp@intel.com>
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
In-Reply-To: <20250827183852.2471-7-danielj@nvidia.com>
References: <20250827183852.2471-7-danielj@nvidia.com>
TO: Daniel Jurgens <danielj@nvidia.com>
TO: netdev@vger.kernel.org
TO: mst@redhat.com
TO: jasowang@redhat.com
TO: alex.williamson@redhat.com
TO: virtualization@lists.linux.dev
TO: pabeni@redhat.com
CC: parav@nvidia.com
CC: shshitrit@nvidia.com
CC: yohadt@nvidia.com
CC: Daniel Jurgens <danielj@nvidia.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Jurgens/virtio-pci-Expose-generic-device-capability-operations/20250828-024128
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250827183852.2471-7-danielj%40nvidia.com
patch subject: [PATCH net-next 06/11] virtio_net: Implement layer 2 ethtool flow rules
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-r073-20250828 (https://download.01.org/0day-ci/archive/20250828/202508282217.SOW1L4jj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508282217.SOW1L4jj-lkp@intel.com/

smatch warnings:
drivers/net/virtio_net/virtio_net_ff.c:578 virtnet_ff_cleanup() warn: iterator 'i' not incremented

vim +/i +578 drivers/net/virtio_net/virtio_net_ff.c

c0c4d6e79d4fb6 Daniel Jurgens 2025-08-27  569  
c0c4d6e79d4fb6 Daniel Jurgens 2025-08-27  570  void virtnet_ff_cleanup(struct virtnet_ff *ff)
c0c4d6e79d4fb6 Daniel Jurgens 2025-08-27  571  {
3ba935ddde5a89 Daniel Jurgens 2025-08-27  572  	struct virtnet_ethtool_rule *eth_rule;
3ba935ddde5a89 Daniel Jurgens 2025-08-27  573  	unsigned long i;
3ba935ddde5a89 Daniel Jurgens 2025-08-27  574  
c0c4d6e79d4fb6 Daniel Jurgens 2025-08-27  575  	if (!ff->ff_supported)
c0c4d6e79d4fb6 Daniel Jurgens 2025-08-27  576  		return;
c0c4d6e79d4fb6 Daniel Jurgens 2025-08-27  577  
3ba935ddde5a89 Daniel Jurgens 2025-08-27 @578  	xa_for_each(&ff->ethtool.rules, i, eth_rule)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
