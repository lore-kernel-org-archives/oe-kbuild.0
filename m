Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831317C77
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Feb 2025 03:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739849488; cv=none; b=fSXQzhUcsclLjl/hoqBh8XOcnVo6yEyFFG0ANNUGx67a2KYbZdgkjg+LkDPsuCmLfpjN410N3NQs/ofQ76lMw73Q0/3Rdo0RsODAxIx+msKgcq/TVJtvv8FelzZpaW6zdvV1NJ+GX3W/1SIwLXTGugligJSxpUxv/eBm6fE12kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739849488; c=relaxed/simple;
	bh=hjptQaNgIasPVsUrTcv47u1+88YMFXMTPu+8NnKvOc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgZvKl7vLLOZvMWmcvmkdqJKHpg2QOnfpZ4YtrpQC0/KDJ7SDjwISNzgal3/h5prmcFHprNcVTaHXKENDe1LfHttnbGwiKVR01Y8t2utT0BHpQoGbRy8MHLtrImqctC1u1to6MuAs1XWws1MIq5czo1so4FaF52lXoh1dpG2ESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jt1fSsqP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jt1fSsqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739849487; x=1771385487;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hjptQaNgIasPVsUrTcv47u1+88YMFXMTPu+8NnKvOc4=;
  b=jt1fSsqPFi00L09tY6S6ett+vJ58VGpfICNtA/Dc0L+jscAHgGCdrwQV
   5e5qKZzBTjDkk7avBSLwKz99r0wg7EHUMihTfBgyQAeBYNq3LYt7evtEW
   aIiryJglcbVW9/DERafSU72E/GVK6nkZEkoytIZRTElW/+u+lNHo2iP8f
   0AIE7gnIQu71zZYMuGlggit0ZWA7It6r8X7PslvTZfpCnjWKQpZsPfbVM
   sKarzYiMc0Qz3s1ZttEr1F+8dlVA9r31GX1AMWq/RwrOtTlpE+W7nYkJk
   QTD57u+F4vMJqSrspThgjHieX9g2L0M5TwxsfZIYNLPvy/55x/8IgAXDJ
   w==;
X-CSE-ConnectionGUID: EmA8h2BEQsqHqGF/58hRwA==
X-CSE-MsgGUID: xK9a7wfGTB6a40ME96LO/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="51938637"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="51938637"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 19:31:26 -0800
X-CSE-ConnectionGUID: dKCBhADqRwCrJODsaOQE6A==
X-CSE-MsgGUID: Hoh+LikUSTSKbQBKA2w50A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="114470597"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2025 19:30:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkEJj-00007m-01;
	Tue, 18 Feb 2025 03:30:40 +0000
Date: Tue, 18 Feb 2025 11:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/net/netmem.h:130 virt_to_netmem() warn: unsigned '_x' is
 never less than zero.
Message-ID: <202502181138.uEuhSLnc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: "Toke Høiland-Jørgensen" <toke@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2408a807bfc3f738850ef5ad5e3fd59d66168996
commit: 024bfd2e9d80d7131f1178eb2235030b96f7ef0e page_pool: make page_pool_put_page_bulk() handle array of netmems
date:   2 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 2 months ago
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250218/202502181138.uEuhSLnc-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502181138.uEuhSLnc-lkp@intel.com/

New smatch warnings:
include/net/netmem.h:130 virt_to_netmem() warn: unsigned '_x' is never less than zero.

Old smatch warnings:
net/core/xdp.c:452 __xdp_return() warn: unsigned '_x' is never less than zero.
include/linux/mm.h:1287 virt_to_head_page() warn: unsigned '_x' is never less than zero.
net/core/xdp.c:688 __xdp_build_skb_from_frame() error: uninitialized symbol 'nr_frags'.

vim +/_x +130 include/net/netmem.h

18ddbf5cf0e755 Mina Almasry      2024-02-14  121  
9bd9f72a74344b Alexander Lobakin 2024-12-03  122  /**
9bd9f72a74344b Alexander Lobakin 2024-12-03  123   * virt_to_netmem - convert virtual memory pointer to a netmem reference
9bd9f72a74344b Alexander Lobakin 2024-12-03  124   * @data: host memory pointer to convert
9bd9f72a74344b Alexander Lobakin 2024-12-03  125   *
9bd9f72a74344b Alexander Lobakin 2024-12-03  126   * Return: netmem reference to the &page backing this virtual address.
9bd9f72a74344b Alexander Lobakin 2024-12-03  127   */
9bd9f72a74344b Alexander Lobakin 2024-12-03  128  static inline netmem_ref virt_to_netmem(const void *data)
9bd9f72a74344b Alexander Lobakin 2024-12-03  129  {
9bd9f72a74344b Alexander Lobakin 2024-12-03 @130  	return page_to_netmem(virt_to_page(data));
9bd9f72a74344b Alexander Lobakin 2024-12-03  131  }
9bd9f72a74344b Alexander Lobakin 2024-12-03  132  

:::::: The code at line 130 was first introduced by commit
:::::: 9bd9f72a74344b54cfb6fcabf1173e6c6e5c6952 netmem: add a couple of page helper wrappers

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
