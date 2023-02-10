Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D757E2
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Feb 2023 04:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676002043; x=1707538043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rahBWCLKjesXeemz/Gh+KFKxcagA3Gpbk92e9gFIwyE=;
  b=kvowy4XuJwxnKLY/Ut7Te5iPKsHehnE1+w24MSG+3aWhTBAtaQw6ahfv
   l7iJGjdR5+R/jdmS/SV/Ri16sx4n+5eDssUrhtsHooup6VheqtJLAtj1H
   T3BxtNEc2YaHWGaTLQbSOkF16OP75Nst9sHUWkJ7ZSqpCrYn6YfEZSLEI
   JOao03fWYduJSjY3QH6HSBzZ/jMgQ1qy4WUqoCKITWGBh8PXusdcoZ1P+
   luRsk2VyHAIsKsXGYQMJyqj5v5ZBMUSQb2WR3AV+ligrHiF4QIDP5BdNE
   yjY8h7vf35TAS22fPMiSLCztUKo6ySCfTbNRTovk8zR45ADNwxez/b61L
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="332473364"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="332473364"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 20:07:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="617763860"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="617763860"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Feb 2023 20:07:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQKgx-0005XA-0w;
	Fri, 10 Feb 2023 04:07:19 +0000
Date: Fri, 10 Feb 2023 12:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/platform/samsung/s5p-g2d/g2d.c:103 g2d_queue_setup()
 warn: passing a valid pointer to 'PTR_ERR'
Message-ID: <202302101134.8Trt2uJA-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   38c1e0c65865426676123cc9a127526fa02bcac6
commit: a7f3b2d32dabd8e59854ec39ba257050b5e4949e media: platform: rename s5p-g2d/ to samsung/s5p-g2d/
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-m041-20230208 (https://download.01.org/0day-ci/archive/20230210/202302101134.8Trt2uJA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302101134.8Trt2uJA-lkp@intel.com/

smatch warnings:
drivers/media/platform/samsung/s5p-g2d/g2d.c:103 g2d_queue_setup() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:120 g2d_buf_prepare() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:319 vidioc_g_fmt() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:381 vidioc_s_fmt() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:408 vidioc_g_selection() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:459 vidioc_try_selection() warn: passing a valid pointer to 'PTR_ERR'
drivers/media/platform/samsung/s5p-g2d/g2d.c:490 vidioc_s_selection() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +103 drivers/media/platform/samsung/s5p-g2d/g2d.c

918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06   94  
df9ecb0cad14b9 drivers/media/platform/s5p-g2d/g2d.c Hans Verkuil 2015-10-28   95  static int g2d_queue_setup(struct vb2_queue *vq,
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06   96  			   unsigned int *nbuffers, unsigned int *nplanes,
36c0f8b32c4bd4 drivers/media/platform/s5p-g2d/g2d.c Hans Verkuil 2016-04-15   97  			   unsigned int sizes[], struct device *alloc_devs[])
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06   98  {
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06   99  	struct g2d_ctx *ctx = vb2_get_drv_priv(vq);
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  100  	struct g2d_frame *f = get_frame(ctx, vq->type);
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  101  
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  102  	if (IS_ERR(f))
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06 @103  		return PTR_ERR(f);
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  104  
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  105  	sizes[0] = f->size;
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  106  	*nplanes = 1;
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  107  
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  108  	if (*nbuffers == 0)
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  109  		*nbuffers = 1;
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  110  
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  111  	return 0;
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  112  }
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  113  
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  114  static int g2d_buf_prepare(struct vb2_buffer *vb)
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  115  {
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  116  	struct g2d_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  117  	struct g2d_frame *f = get_frame(ctx, vb->vb2_queue->type);
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  118  
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  119  	if (IS_ERR(f))
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06 @120  		return PTR_ERR(f);
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  121  	vb2_set_plane_payload(vb, 0, f->size);
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  122  	return 0;
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  123  }
918847341af0f5 drivers/media/video/s5p-g2d/g2d.c    Kamil Debski 2011-10-06  124  

:::::: The code at line 103 was first introduced by commit
:::::: 918847341af0f5f1907fc0b52549f0dc29192c03 [media] v4l: add G2D driver for s5p device family

:::::: TO: Kamil Debski <k.debski@samsung.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
