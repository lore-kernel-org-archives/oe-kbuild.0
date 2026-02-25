Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51552765F8
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Feb 2026 20:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772053125; cv=none; b=g77Qanjgd8XBwcPAB4sYfX4WUNSx9y4+fvjv3akWunH+ZjZLFqttqam2cGl48p/ENcpSwI+9nY2jvUYUnek7ZNmEkJBB1GrLo5j+OBBhfK5BbxzLYAzis0rJr11TocoMmpUkS5R0mdxdANZpx1oL6KGm8QjMw4+V/6e7EtQTa6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772053125; c=relaxed/simple;
	bh=rQZB3iStj7GnZrBCmMJztBgeYTEK9WLAEOhw8DKWio8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FoDtkUSVaziNkE00N2680VozbaPbGTpUOYSfXho2uxVotZNgyafO4YhUJ7k6dFsfESTb6LR0hrbu4oUjj+3Wq9c5XwAxNXl7xLRf6pMMEJzMqOW1BSbCM8Ib5JRkinEom24SZZjNLOVYlTGvrGLE6hizf6/FUqCaSLJecC+3L/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyDsP3KE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyDsP3KE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772053124; x=1803589124;
  h=date:from:to:cc:subject:message-id;
  bh=rQZB3iStj7GnZrBCmMJztBgeYTEK9WLAEOhw8DKWio8=;
  b=CyDsP3KEmYz6eAPgxdbnZWiG44pcM0UE19imbCGPBloC3P108/3JzoNU
   //XUQSKYWF0lPT8QbZtKPNLeaQZFPTS746GyFJ9zr8AzLCkG+aULI+iga
   ioFPFYQ4S3Betsv0fjac1bi/7Ek+BD4JLHmd/a3KVX6uG5wWuWGovyKim
   CYu4NFOinmi6APotqLUdZxgoo1ATk0+Zt75q9honX58i4P+gDYMbUlEex
   9GUht5aKPyIPsgsR0nai7TWGuANTK/GKh9ka0/uAWCITeF1ggYJn0wD8Q
   xEZWzPgLLJV9SVdSugotu3ddf5peJr2EqYWDOU9IzOAv41wTLCA21aiuz
   Q==;
X-CSE-ConnectionGUID: 0mcZwZasShySp4imWBsx3A==
X-CSE-MsgGUID: wUINun+ZRg+iPKgjQpq0Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="95718183"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="95718183"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 12:58:41 -0800
X-CSE-ConnectionGUID: FxvoWOM1QwuTdB8ysCI/nw==
X-CSE-MsgGUID: wx9RhukETuWN8Pu2mzDQww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="216236867"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Feb 2026 12:58:40 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvLxu-000000007KD-0f4C;
	Wed, 25 Feb 2026 20:58:38 +0000
Date: Thu, 26 Feb 2026 04:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [leon-rdma:var-tlp-v2 12/28] ERROR: modpost: module
 ib_uverbs uses symbol dma_buf_move_notify from namespace DMA_BUF, but does
 not import it.
Message-ID: <202602260407.BSjEpjHH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git var-tlp-v2
head:   020795e4f34c4e609bfcdbbf48423d8f524afc05
commit: a731c8626507d2df0b34a572719e3e6efcf10530 [12/28] RDMA/core: Promote UMEM to a core component
:::::: branch date: 7 hours ago
:::::: commit date: 8 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260226/202602260407.BSjEpjHH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260407.BSjEpjHH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602260407.BSjEpjHH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module ib_uverbs uses symbol dma_buf_move_notify from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module ib_uverbs uses symbol dma_buf_export from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module ib_uverbs uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module ib_uverbs uses symbol dma_buf_phys_vec_to_sgt from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: module ib_uverbs uses symbol dma_buf_free_sgt from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
