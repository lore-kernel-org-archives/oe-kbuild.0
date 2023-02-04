Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175317C
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Feb 2023 04:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675484373; x=1707020373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mc3++qH7HOVTxmMjqfC+sqzQWLAhbRg/M00kph6R0rQ=;
  b=Un+jTvXxC4xHSU0fs/b1BVbBAF5PGbaP0QsBr10wlAHP4jZcfGqnx2U6
   BFLe86xXMWiyLWGeffE8lzdnUK2l7I6UOEvIg57sbJSRjqc4YiHTHR3id
   YtFpEI3gjT3NCqMRexOBsDqsj9cqJ10gX7EJ3FBe9rhUS39nU0yPns/HK
   K7sXHXtNu+MejKGQm3dMLzhqjvj/uX1zRgeqeIh4sWdut863TiYO/OG8+
   h6VtPzRn2NF6kQTQoV7SYH9KqD3/k8uWawv16r5Y+VDdh4neuHv1qq0ca
   vcpV6hYXfSx6a2JiIyrYIbttofI7YeBW6plTktSPMU+gbz0JQmGgshGi8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="356261289"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="356261289"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 20:19:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="667851218"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="667851218"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Feb 2023 20:19:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOA1S-00011t-1u;
	Sat, 04 Feb 2023 04:19:30 +0000
Date: Sat, 4 Feb 2023 12:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/v4l2-core/v4l2-ctrls-api.c:993:11: warning: Parameter
 'dims' can be declared as const array [constParameter]
Message-ID: <202302041208.AG32orMW-lkp@intel.com>
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
head:   0136d86b78522bbd5755f8194c97a987f0586ba5
commit: 0975274557d15ab9a01c0944f27065e6708a797c media: v4l2-ctrls: add v4l2_ctrl_modify_dimensions
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
compiler: riscv32-linux-gcc (GCC) 12.1.0
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

vim +/dims +993 drivers/media/v4l2-core/v4l2-ctrls-api.c

0975274557d15ab Hans Verkuil 2022-07-11   991  
0975274557d15ab Hans Verkuil 2022-07-11   992  int __v4l2_ctrl_modify_dimensions(struct v4l2_ctrl *ctrl,
0975274557d15ab Hans Verkuil 2022-07-11  @993  				  u32 dims[V4L2_CTRL_MAX_DIMS])
0975274557d15ab Hans Verkuil 2022-07-11   994  {
0975274557d15ab Hans Verkuil 2022-07-11   995  	unsigned int elems = 1;
0975274557d15ab Hans Verkuil 2022-07-11   996  	unsigned int i;
0975274557d15ab Hans Verkuil 2022-07-11   997  	void *p_array;
0975274557d15ab Hans Verkuil 2022-07-11   998  
0975274557d15ab Hans Verkuil 2022-07-11   999  	lockdep_assert_held(ctrl->handler->lock);
0975274557d15ab Hans Verkuil 2022-07-11  1000  
0975274557d15ab Hans Verkuil 2022-07-11  1001  	if (!ctrl->is_array || ctrl->is_dyn_array)
0975274557d15ab Hans Verkuil 2022-07-11  1002  		return -EINVAL;
0975274557d15ab Hans Verkuil 2022-07-11  1003  
0975274557d15ab Hans Verkuil 2022-07-11  1004  	for (i = 0; i < ctrl->nr_of_dims; i++)
0975274557d15ab Hans Verkuil 2022-07-11  1005  		elems *= dims[i];
0975274557d15ab Hans Verkuil 2022-07-11  1006  	if (elems == 0)
0975274557d15ab Hans Verkuil 2022-07-11  1007  		return -EINVAL;
0975274557d15ab Hans Verkuil 2022-07-11  1008  	p_array = kvzalloc(2 * elems * ctrl->elem_size, GFP_KERNEL);
0975274557d15ab Hans Verkuil 2022-07-11  1009  	if (!p_array)
0975274557d15ab Hans Verkuil 2022-07-11  1010  		return -ENOMEM;
0975274557d15ab Hans Verkuil 2022-07-11  1011  	kvfree(ctrl->p_array);
0975274557d15ab Hans Verkuil 2022-07-11  1012  	ctrl->p_array_alloc_elems = elems;
0975274557d15ab Hans Verkuil 2022-07-11  1013  	ctrl->elems = elems;
0975274557d15ab Hans Verkuil 2022-07-11  1014  	ctrl->new_elems = elems;
0975274557d15ab Hans Verkuil 2022-07-11  1015  	ctrl->p_array = p_array;
0975274557d15ab Hans Verkuil 2022-07-11  1016  	ctrl->p_new.p = p_array;
0975274557d15ab Hans Verkuil 2022-07-11  1017  	ctrl->p_cur.p = p_array + elems * ctrl->elem_size;
0975274557d15ab Hans Verkuil 2022-07-11  1018  	for (i = 0; i < ctrl->nr_of_dims; i++)
0975274557d15ab Hans Verkuil 2022-07-11  1019  		ctrl->dims[i] = dims[i];
0975274557d15ab Hans Verkuil 2022-07-11  1020  	for (i = 0; i < elems; i++)
0975274557d15ab Hans Verkuil 2022-07-11  1021  		ctrl->type_ops->init(ctrl, i, ctrl->p_cur);
0975274557d15ab Hans Verkuil 2022-07-11  1022  	cur_to_new(ctrl);
0975274557d15ab Hans Verkuil 2022-07-11  1023  	send_event(NULL, ctrl, V4L2_EVENT_CTRL_CH_VALUE);
0975274557d15ab Hans Verkuil 2022-07-11  1024  	return 0;
0975274557d15ab Hans Verkuil 2022-07-11  1025  }
0975274557d15ab Hans Verkuil 2022-07-11  1026  EXPORT_SYMBOL(__v4l2_ctrl_modify_dimensions);
71c689dc2e732d4 Hans Verkuil 2021-04-27  1027  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
