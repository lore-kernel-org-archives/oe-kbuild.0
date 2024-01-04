Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3EC21361
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXKKquWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704369366; x=1735905366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=psY1hc2PdoF3GA1O5zZaCCIMA7d86X07X/berJSxT28=;
  b=SXKKquWui7HIHde7qzEd1CGM4gQjnyIsi22sZzR5rePqPNL4wIhzo1KQ
   bPQMJk3cu0E5Borl/MTr+dkTfe8KWItjgY6ZVMrjn2EcS1batfAdAWOEk
   mgBt5cLLhzGx5YFPRB0B+jJutXY7w2oTRS81I+lKwJedLN9uY5n86hJ+e
   0eEOjaJfMWOvZntHm6H6Kja/OhjhsAZZr9qpVdjF0UjYP6HBicu4eeh1T
   mqXq+y5zNO94RV3KvZCGZQIQ6TCxwbMwzMn+j9ZezuoMyw9x7SWACZnLt
   fCMKkMuCUgZGy71gAJYHZJNlZis/zPjzA/Zb0IAMRmGLQfi71II6zopUO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="387674621"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="387674621"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 03:56:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="850777625"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="850777625"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2024 03:56:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLMKN-000NGL-35;
	Thu, 04 Jan 2024 11:55:59 +0000
Date: Thu, 4 Jan 2024 19:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8588/12403]
 drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c:32:16-17: WARNING
 opportunity for min()
Message-ID: <202401041939.WDiechnL-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Shinas Rasheed <srasheed@marvell.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d0b3c8aa5e37775cd7c3ac07b256218df0fd6678
commit: c130e589d50bbf43eb77d45b806b38cf95e2bad9 [8588/12403] octeon_ep: PF-VF mailbox version support
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-r053-20240104 (https://download.01.org/0day-ci/archive/20240104/202401041939.WDiechnL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401041939.WDiechnL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c:32:16-17: WARNING opportunity for min()

vim +32 drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c

cde29af9e68e75 Shinas Rasheed 2023-12-15  23  
cde29af9e68e75 Shinas Rasheed 2023-12-15  24  static void octep_pfvf_validate_version(struct octep_device *oct,  u32 vf_id,
cde29af9e68e75 Shinas Rasheed 2023-12-15  25  					union octep_pfvf_mbox_word cmd,
cde29af9e68e75 Shinas Rasheed 2023-12-15  26  					union octep_pfvf_mbox_word *rsp)
cde29af9e68e75 Shinas Rasheed 2023-12-15  27  {
cde29af9e68e75 Shinas Rasheed 2023-12-15  28  	u32 vf_version = (u32)cmd.s_version.version;
cde29af9e68e75 Shinas Rasheed 2023-12-15  29  
c130e589d50bbf Shinas Rasheed 2023-12-15  30  	dev_dbg(&oct->pdev->dev, "VF id:%d VF version:%d PF version:%d\n",
c130e589d50bbf Shinas Rasheed 2023-12-15  31  		vf_id, vf_version, OCTEP_PFVF_MBOX_VERSION_CURRENT);
c130e589d50bbf Shinas Rasheed 2023-12-15 @32  	if (vf_version < OCTEP_PFVF_MBOX_VERSION_CURRENT)
c130e589d50bbf Shinas Rasheed 2023-12-15  33  		rsp->s_version.version = vf_version;
cde29af9e68e75 Shinas Rasheed 2023-12-15  34  	else
c130e589d50bbf Shinas Rasheed 2023-12-15  35  		rsp->s_version.version = OCTEP_PFVF_MBOX_VERSION_CURRENT;
c130e589d50bbf Shinas Rasheed 2023-12-15  36  
c130e589d50bbf Shinas Rasheed 2023-12-15  37  	oct->vf_info[vf_id].mbox_version = rsp->s_version.version;
c130e589d50bbf Shinas Rasheed 2023-12-15  38  	dev_dbg(&oct->pdev->dev, "VF id:%d negotiated VF version:%d\n",
c130e589d50bbf Shinas Rasheed 2023-12-15  39  		vf_id, oct->vf_info[vf_id].mbox_version);
c130e589d50bbf Shinas Rasheed 2023-12-15  40  
c130e589d50bbf Shinas Rasheed 2023-12-15  41  	rsp->s_version.type = OCTEP_PFVF_MBOX_TYPE_RSP_ACK;
cde29af9e68e75 Shinas Rasheed 2023-12-15  42  }
cde29af9e68e75 Shinas Rasheed 2023-12-15  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
