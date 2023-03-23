Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005428C12
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Mar 2023 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679573006; x=1711109006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=btNB++YlWPifxnPECyxjaVHQS0edpe11m9ot5CnY+pU=;
  b=fizpAgGxPuIOLqTMhRdQbRtf6wPOKmtMc1Vpis8nRS79atKwZwUVFF/7
   PH8NI0Eqki0iSvGiX0JR9JisdtHlBcLyp+ydhc1sXEPqUiaF3Vs41AXMa
   wCpBaZJXQnt3+WUtVEZlAImZiQw8FcyIYkWt617IPcYEMpnBBeJL2uZxt
   yM1KYeogKCPZ718L0uSYP5XMGOlkkwSRHlhsa3OGB8+x+SoWFZxsskci+
   WNhSsdjTseM1FGCmN9IaOCs3CLo66JX1/zL3dzUjEueNZiwf1DWxQc/2E
   cbRJGYnSRQoi23F4mcEk2yGUKacQZe44zIiREY4hqaeYHCXLFQ148bXN6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336972525"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="336972525"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 05:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="771427989"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="771427989"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2023 05:03:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfJfA-000EK8-1j;
	Thu, 23 Mar 2023 12:03:24 +0000
Date: Thu, 23 Mar 2023 20:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-5.15 26/27]
 drivers/media/v4l2-core/v4l2-ctrls-api.c:157 user_to_new() warn: if
 statement not indented
Message-ID: <202303232056.JGQxLz6c-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   0d75c643cb6de73b439e21bae1beab2350753291
commit: 43b2acadebeb69d7317bb321696b9cf5aceb557e [26/27] UPSTREAM: media: v4l2-ctrls-api.c: add back dropped ctrl->is_new = 1
:::::: branch date: 4 hours ago
:::::: commit date: 5 hours ago
config: nds32-randconfig-m031-20230322 (https://download.01.org/0day-ci/archive/20230323/202303232056.JGQxLz6c-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303232056.JGQxLz6c-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-api.c:157 user_to_new() warn: if statement not indented
drivers/media/v4l2-core/v4l2-ctrls-api.c:159 user_to_new() warn: inconsistent indenting

vim +157 drivers/media/v4l2-core/v4l2-ctrls-api.c

71c689dc2e732d Hans Verkuil 2021-04-27   99  
6f9b5b1a63184c Hans Verkuil 2022-07-08  100  /* Helper function: copy the caller-provider value as the new control value */
6f9b5b1a63184c Hans Verkuil 2022-07-08  101  static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
71c689dc2e732d Hans Verkuil 2021-04-27  102  {
71c689dc2e732d Hans Verkuil 2021-04-27  103  	int ret;
71c689dc2e732d Hans Verkuil 2021-04-27  104  	u32 size;
71c689dc2e732d Hans Verkuil 2021-04-27  105  
6f9b5b1a63184c Hans Verkuil 2022-07-08  106  	ctrl->is_new = 0;
6f9b5b1a63184c Hans Verkuil 2022-07-08  107  	if (ctrl->is_dyn_array &&
6f9b5b1a63184c Hans Verkuil 2022-07-08  108  	    c->size > ctrl->p_dyn_alloc_elems * ctrl->elem_size) {
6f9b5b1a63184c Hans Verkuil 2022-07-08  109  		void *old = ctrl->p_dyn;
6f9b5b1a63184c Hans Verkuil 2022-07-08  110  		void *tmp = kvzalloc(2 * c->size, GFP_KERNEL);
6f9b5b1a63184c Hans Verkuil 2022-07-08  111  
6f9b5b1a63184c Hans Verkuil 2022-07-08  112  		if (!tmp)
6f9b5b1a63184c Hans Verkuil 2022-07-08  113  			return -ENOMEM;
6f9b5b1a63184c Hans Verkuil 2022-07-08  114  		memcpy(tmp, ctrl->p_new.p, ctrl->elems * ctrl->elem_size);
6f9b5b1a63184c Hans Verkuil 2022-07-08  115  		memcpy(tmp + c->size, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
6f9b5b1a63184c Hans Verkuil 2022-07-08  116  		ctrl->p_new.p = tmp;
6f9b5b1a63184c Hans Verkuil 2022-07-08  117  		ctrl->p_cur.p = tmp + c->size;
6f9b5b1a63184c Hans Verkuil 2022-07-08  118  		ctrl->p_dyn = tmp;
6f9b5b1a63184c Hans Verkuil 2022-07-08  119  		ctrl->p_dyn_alloc_elems = c->size / ctrl->elem_size;
6f9b5b1a63184c Hans Verkuil 2022-07-08  120  		kvfree(old);
6f9b5b1a63184c Hans Verkuil 2022-07-08  121  	}
6f9b5b1a63184c Hans Verkuil 2022-07-08  122  
71c689dc2e732d Hans Verkuil 2021-04-27  123  	if (ctrl->is_ptr && !ctrl->is_string) {
6f9b5b1a63184c Hans Verkuil 2022-07-08  124  		unsigned int elems = c->size / ctrl->elem_size;
71c689dc2e732d Hans Verkuil 2021-04-27  125  		unsigned int idx;
71c689dc2e732d Hans Verkuil 2021-04-27  126  
6f9b5b1a63184c Hans Verkuil 2022-07-08  127  		if (copy_from_user(ctrl->p_new.p, c->ptr, c->size))
6f9b5b1a63184c Hans Verkuil 2022-07-08  128  			return -EFAULT;
6f9b5b1a63184c Hans Verkuil 2022-07-08  129  		ctrl->is_new = 1;
6f9b5b1a63184c Hans Verkuil 2022-07-08  130  		if (ctrl->is_dyn_array)
6f9b5b1a63184c Hans Verkuil 2022-07-08  131  			ctrl->new_elems = elems;
6f9b5b1a63184c Hans Verkuil 2022-07-08  132  		else if (ctrl->is_array)
6f9b5b1a63184c Hans Verkuil 2022-07-08  133  			for (idx = elems; idx < ctrl->elems; idx++)
6f9b5b1a63184c Hans Verkuil 2022-07-08  134  				ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
71c689dc2e732d Hans Verkuil 2021-04-27  135  		return 0;
71c689dc2e732d Hans Verkuil 2021-04-27  136  	}
71c689dc2e732d Hans Verkuil 2021-04-27  137  
71c689dc2e732d Hans Verkuil 2021-04-27  138  	switch (ctrl->type) {
71c689dc2e732d Hans Verkuil 2021-04-27  139  	case V4L2_CTRL_TYPE_INTEGER64:
6f9b5b1a63184c Hans Verkuil 2022-07-08  140  		*ctrl->p_new.p_s64 = c->value64;
71c689dc2e732d Hans Verkuil 2021-04-27  141  		break;
71c689dc2e732d Hans Verkuil 2021-04-27  142  	case V4L2_CTRL_TYPE_STRING:
71c689dc2e732d Hans Verkuil 2021-04-27  143  		size = c->size;
71c689dc2e732d Hans Verkuil 2021-04-27  144  		if (size == 0)
71c689dc2e732d Hans Verkuil 2021-04-27  145  			return -ERANGE;
71c689dc2e732d Hans Verkuil 2021-04-27  146  		if (size > ctrl->maximum + 1)
71c689dc2e732d Hans Verkuil 2021-04-27  147  			size = ctrl->maximum + 1;
6f9b5b1a63184c Hans Verkuil 2022-07-08  148  		ret = copy_from_user(ctrl->p_new.p_char, c->string, size) ? -EFAULT : 0;
71c689dc2e732d Hans Verkuil 2021-04-27  149  		if (!ret) {
6f9b5b1a63184c Hans Verkuil 2022-07-08  150  			char last = ctrl->p_new.p_char[size - 1];
71c689dc2e732d Hans Verkuil 2021-04-27  151  
6f9b5b1a63184c Hans Verkuil 2022-07-08  152  			ctrl->p_new.p_char[size - 1] = 0;
71c689dc2e732d Hans Verkuil 2021-04-27  153  			/*
71c689dc2e732d Hans Verkuil 2021-04-27  154  			 * If the string was longer than ctrl->maximum,
71c689dc2e732d Hans Verkuil 2021-04-27  155  			 * then return an error.
71c689dc2e732d Hans Verkuil 2021-04-27  156  			 */
6f9b5b1a63184c Hans Verkuil 2022-07-08 @157  			if (strlen(ctrl->p_new.p_char) == ctrl->maximum && last)
43b2acadebeb69 Hans Verkuil 2022-12-12  158  			ctrl->is_new = 1;
71c689dc2e732d Hans Verkuil 2021-04-27 @159  				return -ERANGE;
71c689dc2e732d Hans Verkuil 2021-04-27  160  		}
71c689dc2e732d Hans Verkuil 2021-04-27  161  		return ret;
71c689dc2e732d Hans Verkuil 2021-04-27  162  	default:
6f9b5b1a63184c Hans Verkuil 2022-07-08  163  		*ctrl->p_new.p_s32 = c->value;
71c689dc2e732d Hans Verkuil 2021-04-27  164  		break;
71c689dc2e732d Hans Verkuil 2021-04-27  165  	}
6f9b5b1a63184c Hans Verkuil 2022-07-08  166  	ctrl->is_new = 1;
71c689dc2e732d Hans Verkuil 2021-04-27  167  	return 0;
71c689dc2e732d Hans Verkuil 2021-04-27  168  }
71c689dc2e732d Hans Verkuil 2021-04-27  169  

:::::: The code at line 157 was first introduced by commit
:::::: 6f9b5b1a63184c2fb2607c7fc2b18c9c935e90ca UPSTREAM: media: v4l2-ctrls: add support for dynamically allocated arrays.

:::::: TO: Hans Verkuil <hverkuil-cisco@xs4all.nl>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
