Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FE58BF0
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Oct 2023 07:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kt9aq0II"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697874659; x=1729410659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MtbJouAUKX0fsqrWSRpKHCLiJJK3hA+jM7gWAOlLKDs=;
  b=Kt9aq0IIOYrGop5Vm0WChL6fWxOy5rHf4kh0FVgxxBuf8MQpOzSGtntc
   2ORh5DMlwpCji4g3Jxs+ZyQXg6l8YWAr8V8kV9RCQF65o3vVul4jWyDWZ
   UBJKXksGfNeuq4e7o+sfjnDoH03g9/ZIL7FrDm9Ayn8FWEw8lOaEX8qYq
   wKufjy5LHX/gb8Enf+OAgwxrdrD80LTms9biHTbTi2gjKTAQuwYhuvjqn
   sL6HHFWC04EzefKjLauZlSLD2RuG4D24vxbUehTAUPmcpUIAFjuovO1l9
   aKsSkt71yq7LYNg3/Rhmmj/cRzGUXTixuIRBB/6axuAzZvAMT+R1qvd1Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="365952506"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="365952506"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 00:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="881276746"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="881276746"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Oct 2023 00:50:56 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu6l4-0004aU-1f;
	Sat, 21 Oct 2023 07:50:54 +0000
Date: Sat, 21 Oct 2023 15:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/5] i3c: add slave mode support
Message-ID: <202310211527.TeVTMxA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231018215809.3477437-2-Frank.Li@nxp.com>
References: <20231018215809.3477437-2-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: miquel.raynal@bootlin.com
TO: conor.culhane@silvaco.com
TO: alexandre.belloni@bootlin.com
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: corbet@lwn.net
TO: joe@perches.com
TO: Frank.Li@nxp.com
TO: linux-i3c@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: gregkh@linuxfoundation.org
CC: imx@lists.linux.dev
CC: jirislaby@kernel.org
CC: linux-serial@vger.kernel.org

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-slave-mode-support/20231019-055940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231018215809.3477437-2-Frank.Li%40nxp.com
patch subject: [PATCH 1/5] i3c: add slave mode support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231021/202310211527.TeVTMxA7-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310211527.TeVTMxA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310211527.TeVTMxA7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i3c/slave.c:11:
   include/linux/i3c/slave.h: In function 'i3c_slave_ctrl_alloc_request':
   include/linux/i3c/slave.h:272:23: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     272 |                 req = kzalloc(sizeof(*req), gfp_flags);
         |                       ^~~~~~~
>> include/linux/i3c/slave.h:272:21: warning: assignment to 'struct i3c_request *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     272 |                 req = kzalloc(sizeof(*req), gfp_flags);
         |                     ^
   include/linux/i3c/slave.h: In function 'i3c_slave_ctrl_free_request':
   include/linux/i3c/slave.h:298:17: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
     298 |                 kfree(req);
         |                 ^~~~~
         |                 kvfree
   In file included from drivers/i3c/slave.c:13:
   include/linux/slab.h: At top level:
>> include/linux/slab.h:227:6: warning: conflicting types for 'kfree'; have 'void(const void *)'
     227 | void kfree(const void *objp);
         |      ^~~~~
   include/linux/i3c/slave.h:298:17: note: previous implicit declaration of 'kfree' with type 'void(const void *)'
     298 |                 kfree(req);
         |                 ^~~~~
   include/linux/slab.h:718:37: error: conflicting types for 'kzalloc'; have 'void *(size_t,  gfp_t)' {aka 'void *(unsigned int,  unsigned int)'}
     718 | static inline __alloc_size(1) void *kzalloc(size_t size, gfp_t flags)
         |                                     ^~~~~~~
   include/linux/i3c/slave.h:272:23: note: previous implicit declaration of 'kzalloc' with type 'int()'
     272 |                 req = kzalloc(sizeof(*req), gfp_flags);
         |                       ^~~~~~~
   cc1: some warnings being treated as errors


vim +272 include/linux/i3c/slave.h

a63b2858bd837d Frank Li 2023-10-18  256  
a63b2858bd837d Frank Li 2023-10-18  257  /**
a63b2858bd837d Frank Li 2023-10-18  258   * i3c_slave_ctrl_alloc_request() - Alloc an I3C transfer
a63b2858bd837d Frank Li 2023-10-18  259   * @ctrl: I3C slave controller device
a63b2858bd837d Frank Li 2023-10-18  260   * gfp_flags: additional gfp flags used when allocating the buffers
a63b2858bd837d Frank Li 2023-10-18  261   *
a63b2858bd837d Frank Li 2023-10-18  262   * Returns: Zero for success, or an error code in case of failure
a63b2858bd837d Frank Li 2023-10-18  263   */
a63b2858bd837d Frank Li 2023-10-18  264  static inline struct i3c_request *
a63b2858bd837d Frank Li 2023-10-18  265  i3c_slave_ctrl_alloc_request(struct i3c_slave_ctrl *ctrl, gfp_t gfp_flags)
a63b2858bd837d Frank Li 2023-10-18  266  {
a63b2858bd837d Frank Li 2023-10-18  267  	struct i3c_request *req = NULL;
a63b2858bd837d Frank Li 2023-10-18  268  
a63b2858bd837d Frank Li 2023-10-18  269  	if (ctrl && ctrl->ops && ctrl->ops->alloc_request)
a63b2858bd837d Frank Li 2023-10-18  270  		req = ctrl->ops->alloc_request(ctrl, gfp_flags);
a63b2858bd837d Frank Li 2023-10-18  271  	else
a63b2858bd837d Frank Li 2023-10-18 @272  		req = kzalloc(sizeof(*req), gfp_flags);
a63b2858bd837d Frank Li 2023-10-18  273  
a63b2858bd837d Frank Li 2023-10-18  274  	if (req)
a63b2858bd837d Frank Li 2023-10-18  275  		req->ctrl = ctrl;
a63b2858bd837d Frank Li 2023-10-18  276  
a63b2858bd837d Frank Li 2023-10-18  277  	return req;
a63b2858bd837d Frank Li 2023-10-18  278  }
a63b2858bd837d Frank Li 2023-10-18  279  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
