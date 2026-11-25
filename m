Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626979;
	b=2SO0EUAQH0ScBhgtc45MdcWpKiqB3VnDGHn9PyJI4YRCom84bjbwUqRJr4H4xRy6YFmK
	 cPtiAfEqm9spWRKwoWgOCVNvrjvTeQ1qpbO1Xvu8wx+CBRJBePVXqzlWPkKnKXAjphlZL
	 yu3/KG52GtiJtx7Dewkymvjkmcv7bEuFbnMUfb3n49QuIlHutjgJIS6Q1vcsHng4rm6FV
	 ihqGBQfE3/QT/Dbj31T4Yy7MKnC0dthv9mNws4j8CePVsa7TN5TZb/4RfpZ9Y1NvHUOGf
	 3xItkmn8wtEFd2kol+WoBG3xjM/xJKRUmCd7zvkxacLvkeMAPUGZA7w6BHfRWpEL/jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626979;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=KQefqJae7DkFKFVCm3MFkcQ8Ww2j5D2XzNPXX/tmJfk=;
	b=zRexlm+OVjTa2acifvvQCphB9fFZwHT3VV3qST8q75LX3loHj0QXKJPDmvFRPU6F4iob
	 LmH0t/tEYW5JgGqmZM3A+u2UBsJbStR1RUpAdJrK0M625svHbQ3fjlIy/Qvn13SGHbx7O
	 ogM2XTCebRON1oZOUBe1gyrDwdrnIJiuhF90TrpMZH203Am85+lrtaqbuU+o+c54qBC39
	 Vr6A3OPt91Z9YK/ugSIV8cB69hVDAKM9EII8oSp8Gj7dYFtduXtKdq9Eq/GWVSWnkwNgb
	 zwLjB/fGERZ+rXyNiPBZ+4V1pL0V587lo+BZ+GprltYtoqDu3pBYWz/tLZBqE0NvSsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9Inou8m;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D872606A321
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 17:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D872606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b9Inou8m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795626978; x=1827162978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWAP8huZpoUTIvQjRCtPr8pkaqutXGX4nJY7FU4gnts=;
  b=b9Inou8m+hAObdcIBE5dLJk94LOa3WnkfY2Tzx/gRD3ps2BsbddUbW6y
   QWMcQtHhD1PaJSt8adDDs9VcmnI4wfngbF6JyUu+Vepq4wLdxN9tuEKqZ
   2l/49qB8uViPrC76siVu9BvkJQMNOgWYEDZEntgjSuZ4cL//fginnOU0H
   FS5EEn/lSenjSWTsIDhtjUSzIdfAg+JnxGMPWxxzD3oQPKzRErEahTvKF
   zsn/tnmhLK9MyN1+GdsN9slJnWYbplKatBSVNZzDdzWYGfvG4n/b1DT7Q
   uzTXAKxv99UdhyFDSf9MlGudW8GvgPCGYhTV+5RlOQyM+VmrraG5X1d1P
   Q==;
X-CSE-ConnectionGUID: j+/2XqERR3OgnEacj6BKJQ==
X-CSE-MsgGUID: Ao6DT5jcTO66Sv1oLDU9/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4504405"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4504405"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 08:45:06 -0800
X-CSE-ConnectionGUID: UIbtpS6zR6CJtKjLElgVNg==
X-CSE-MsgGUID: J4qbMQqwTdKz9EMEBFoAew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11897457"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 08:45:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWG7C-00000001S7I-0GTW;
	Wed, 25 Nov 2026 16:45:02 +0000
Date: Thu, 26 Nov 2026 00:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20261126004052.sdzwOT4E-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <awXJ__-grexFFPb4@sirena.org.uk>
References: <awXJ__-grexFFPb4@sirena.org.uk>
TO: Mark Brown <broonie@kernel.org>
TO: Simona Vetter <simona.vetter@ffwll.ch>
TO: Intel Graphics <intel-gfx@lists.freedesktop.org>
TO: DRI <dri-devel@lists.freedesktop.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
CC: Linux Next Mailing List <linux-next@vger.kernel.org>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261123]
[cannot apply to drm-tip/drm-tip linus/master v7.4-rc4 v7.4-rc3 v7.4-rc2 v7.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-drm-misc-tree/20261124-173143
base:   next-20261123
patch link:    https://lore.kernel.org/r/awXJ__-grexFFPb4%40sirena.org.uk
patch subject: linux-next: build failure after merge of the drm-misc tree
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20261126/20261126004052.sdzwOT4E-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126004052.sdzwOT4E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126004052.sdzwOT4E-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c: In function 'vc_sm_clean_up_dmabuf':
>> drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:217:17: error: implicit declaration of function 'dma_buf_unmap_sgt_unlocked'; did you mean 'dma_buf_vunmap_unlocked'? [-Wimplicit-function-declaration]
     217 |                 dma_buf_unmap_sgt_unlocked(buffer->attach, buffer->sgt,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 dma_buf_vunmap_unlocked
   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c: In function 'vc_sm_cma_import_dmabuf_internal':
>> drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:437:15: error: implicit declaration of function 'dma_buf_map_sgt_unlocked'; did you mean 'dma_buf_vmap_unlocked'? [-Wimplicit-function-declaration]
     437 |         sgt = dma_buf_map_sgt_unlocked(attach, DMA_BIDIRECTIONAL);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
         |               dma_buf_vmap_unlocked
>> drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c:437:13: error: assignment to 'struct sg_table *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     437 |         sgt = dma_buf_map_sgt_unlocked(attach, DMA_BIDIRECTIONAL);
         |             ^


vim +217 drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c

6e0a8f1a83473ae Dave Stevenson 2026-11-12  208  
6e0a8f1a83473ae Dave Stevenson 2026-11-12  209  /*
6e0a8f1a83473ae Dave Stevenson 2026-11-12  210   * Cleans up imported dmabuf.
6e0a8f1a83473ae Dave Stevenson 2026-11-12  211   * Should be called with mutex held.
6e0a8f1a83473ae Dave Stevenson 2026-11-12  212   */
6e0a8f1a83473ae Dave Stevenson 2026-11-12  213  static void vc_sm_clean_up_dmabuf(struct vc_sm_buffer *buffer)
6e0a8f1a83473ae Dave Stevenson 2026-11-12  214  {
6e0a8f1a83473ae Dave Stevenson 2026-11-12  215  	/* Handle cleaning up imported dmabufs */
6e0a8f1a83473ae Dave Stevenson 2026-11-12  216  	if (buffer->sgt) {
0720963f866f108 Mark Brown     2026-11-24 @217  		dma_buf_unmap_sgt_unlocked(buffer->attach, buffer->sgt,
6e0a8f1a83473ae Dave Stevenson 2026-11-12  218  					   DMA_BIDIRECTIONAL);
6e0a8f1a83473ae Dave Stevenson 2026-11-12  219  		buffer->sgt = NULL;
6e0a8f1a83473ae Dave Stevenson 2026-11-12  220  	}
6e0a8f1a83473ae Dave Stevenson 2026-11-12  221  	if (buffer->attach) {
6e0a8f1a83473ae Dave Stevenson 2026-11-12  222  		dma_buf_detach(buffer->imported_dma_buf, buffer->attach);
6e0a8f1a83473ae Dave Stevenson 2026-11-12  223  		buffer->attach = NULL;
6e0a8f1a83473ae Dave Stevenson 2026-11-12  224  	}
6e0a8f1a83473ae Dave Stevenson 2026-11-12  225  }
6e0a8f1a83473ae Dave Stevenson 2026-11-12  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
