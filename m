Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959E33FD
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Oct 2022 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667126302; x=1698662302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H3WclKQRUx8EFBiprsxR5wl89qOUesg/HZC2E3jm4mc=;
  b=JlIWw4WhTCea946EtZ2mNXdcBZ99/uh8Mqdf2VdNqB3TPT2LzOuWF9GO
   F2ljik+gsgYvjicJIDLy40JHtjvyaSLASNGP1MLus4PcQGCi6PziQzXTI
   Azu1ZHZMOgbep4sVWf5ZFFMAKZuBjQRdq0QVi4dmUZzvXIS4a1jYlNsHh
   oan+oVrVid9JFUphpaP+GjqjU+lUBiFtbm4+gi0aFif5Vwii+bN2PbSM+
   J3IirHZ7bC0clI+IjXFQ+mr/0m6DYndDX/UzzzAplQvW32IVj46pQuCOb
   a+oW5m2ommeRswC31HeaRllBsg1IagSfZOwL4mZbVfGwUQDnjW9iMO3Eh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="288451444"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; 
   d="scan'208";a="288451444"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2022 03:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="962487768"
X-IronPort-AV: E=Sophos;i="5.95,225,1661842800"; 
   d="scan'208";a="962487768"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2022 03:38:20 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1op5hs-000BxS-0z;
	Sun, 30 Oct 2022 10:38:20 +0000
Date: Sun, 30 Oct 2022 18:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/v4l2-core/v4l2-ctrls-api.c:993:11: warning: Parameter
 'dims' can be declared as const array [constParameter]
Message-ID: <202210301815.vYQQi98N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/media/v4l2-core/v4l2-ctrls-api.c:993:11: warning: Parameter 'dims' can be declared as const array [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   882ad2a2a8ffa1defecdf907052f04da2737dc46
commit: 0975274557d15ab9a01c0944f27065e6708a797c media: v4l2-ctrls: add v4l2_ctrl_modify_dimensions
date:   2 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 2 months ago
compiler: mips64el-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 0975274557d15ab9a01c0944f27065e6708a797c
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/v4l2-core/v4l2-ctrls-api.c:993:11: warning: Parameter 'dims' can be declared as const array [constParameter]
         u32 dims[V4L2_CTRL_MAX_DIMS])
             ^
>> io_uring/rsrc.c:1119:34: warning: Parameter 'hpage' can be declared as pointer to const [constParameter]
         int nr_pages, struct page *hpage)
                                    ^

vim +/dims +993 drivers/media/v4l2-core/v4l2-ctrls-api.c

0975274557d15a Hans Verkuil 2022-07-11   991  
0975274557d15a Hans Verkuil 2022-07-11   992  int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
0975274557d15a Hans Verkuil 2022-07-11  @993  				  u32 dims[V4L2_CTRL_MAX_DIMS])
0975274557d15a Hans Verkuil 2022-07-11   994  {
0975274557d15a Hans Verkuil 2022-07-11   995  	unsigned int elems = 1;
0975274557d15a Hans Verkuil 2022-07-11   996  	unsigned int i;
0975274557d15a Hans Verkuil 2022-07-11   997  	void *p_array;
0975274557d15a Hans Verkuil 2022-07-11   998  
0975274557d15a Hans Verkuil 2022-07-11   999  	lockdep_assert_held(ctrl->handler->lock);
0975274557d15a Hans Verkuil 2022-07-11  1000  
0975274557d15a Hans Verkuil 2022-07-11  1001  	if (!ctrl->is_array || ctrl->is_dyn_array)
0975274557d15a Hans Verkuil 2022-07-11  1002  		return -EINVAL;
0975274557d15a Hans Verkuil 2022-07-11  1003  
0975274557d15a Hans Verkuil 2022-07-11  1004  	for (i = 0; i < ctrl->nr_of_dims; i++)
0975274557d15a Hans Verkuil 2022-07-11  1005  		elems *= dims[i];
0975274557d15a Hans Verkuil 2022-07-11  1006  	if (elems == 0)
0975274557d15a Hans Verkuil 2022-07-11  1007  		return -EINVAL;
0975274557d15a Hans Verkuil 2022-07-11  1008  	p_array = kvzalloc(2 * elems * ctrl->elem_size, GFP_KERNEL);
0975274557d15a Hans Verkuil 2022-07-11  1009  	if (!p_array)
0975274557d15a Hans Verkuil 2022-07-11  1010  		return -ENOMEM;
0975274557d15a Hans Verkuil 2022-07-11  1011  	kvfree(ctrl->p_array);
0975274557d15a Hans Verkuil 2022-07-11  1012  	ctrl->p_array_alloc_elems = elems;
0975274557d15a Hans Verkuil 2022-07-11  1013  	ctrl->elems = elems;
0975274557d15a Hans Verkuil 2022-07-11  1014  	ctrl->new_elems = elems;
0975274557d15a Hans Verkuil 2022-07-11  1015  	ctrl->p_array = p_array;
0975274557d15a Hans Verkuil 2022-07-11  1016  	ctrl->p_new.p = p_array;
0975274557d15a Hans Verkuil 2022-07-11  1017  	ctrl->p_cur.p = p_array + elems * ctrl->elem_size;
0975274557d15a Hans Verkuil 2022-07-11  1018  	for (i = 0; i < ctrl->nr_of_dims; i++)
0975274557d15a Hans Verkuil 2022-07-11  1019  		ctrl->dims[i] = dims[i];
0975274557d15a Hans Verkuil 2022-07-11  1020  	for (i = 0; i < elems; i++)
0975274557d15a Hans Verkuil 2022-07-11  1021  		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
0975274557d15a Hans Verkuil 2022-07-11  1022  	cur_to_new(ctrl);
0975274557d15a Hans Verkuil 2022-07-11  1023  	send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_VALUE);
0975274557d15a Hans Verkuil 2022-07-11  1024  	return 0;
0975274557d15a Hans Verkuil 2022-07-11  1025  }
0975274557d15a Hans Verkuil 2022-07-11  1026  EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
71c689dc2e732d Hans Verkuil 2021-04-27  1027  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
