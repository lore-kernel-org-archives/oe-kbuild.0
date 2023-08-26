Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6897337F
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Aug 2023 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693013582; x=1724549582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vdOhuxzt6hdZYt08MzcyYDaLWWs89RjHemGQrJCgX3o=;
  b=QRnx8vOKeZsB6RlAvw5pcqPdXVYPN/yR6uJ33Qk/+3rkUYf00UJ4aZWM
   cGlg6pcPw506gE3+xA44u9ElzUB9Og6VplJgCb4/a5aUp+0nA+RqGrMiN
   eabUMNjYMpbvMWckPNl1OFvTaRTsOfdgWNphUcAr0a+ToiiNpiwAXUjdS
   tuXBzRFQOfZemZkBqxwpv7bf51EzciWfkNfjN62hiAM0EeNXO9d8WK0lH
   dzCt26kDvpyw1VSzA2lVRrrio9vcnEurlsyaEmJLR8BPIVubMc/aX4+wV
   ZWyiMwxAN2+tp6MY0URvbnCdWTtBmea9/iSluLyXCdaiE352dnhz91q3w
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="377573542"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="377573542"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 18:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="772681732"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="772681732"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2023 18:33:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZiAd-0004Dj-0s;
	Sat, 26 Aug 2023 01:32:59 +0000
Date: Sat, 26 Aug 2023 09:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 6173/12910]
 drivers/gpu/drm/nouveau/nouveau_exec.c:399:22-28: ERROR: invalid reference
 to the index variable of the iterator on line 373
Message-ID: <202308260944.BZ73xcUr-lkp@intel.com>
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
TO: Danilo Krummrich <dakr@redhat.com>
CC: Dave Airlie <airlied@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6269320850097903b30be8f07a5c61d9f7592393
commit: b88baab828713ce0b49b185444b2ee83bed373a8 [6173/12910] drm/nouveau: implement new VM_BIND uAPI
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-r051-20230730 (https://download.01.org/0day-ci/archive/20230826/202308260944.BZ73xcUr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260944.BZ73xcUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308260944.BZ73xcUr-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nouveau_exec.c:399:22-28: ERROR: invalid reference to the index variable of the iterator on line 373
--
>> drivers/gpu/drm/nouveau/nouveau_uvmm.c:1532:23-25: ERROR: invalid reference to the index variable of the iterator on line 41

vim +399 drivers/gpu/drm/nouveau/nouveau_exec.c

b88baab828713c Danilo Krummrich 2023-08-04  352  
b88baab828713c Danilo Krummrich 2023-08-04  353  int
b88baab828713c Danilo Krummrich 2023-08-04  354  nouveau_exec_ioctl_exec(struct drm_device *dev,
b88baab828713c Danilo Krummrich 2023-08-04  355  			void __user *data,
b88baab828713c Danilo Krummrich 2023-08-04  356  			struct drm_file *file_priv)
b88baab828713c Danilo Krummrich 2023-08-04  357  {
b88baab828713c Danilo Krummrich 2023-08-04  358  	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
b88baab828713c Danilo Krummrich 2023-08-04  359  	struct nouveau_cli *cli = nouveau_cli(file_priv);
b88baab828713c Danilo Krummrich 2023-08-04  360  	struct nouveau_abi16_chan *chan16;
b88baab828713c Danilo Krummrich 2023-08-04  361  	struct nouveau_channel *chan = NULL;
b88baab828713c Danilo Krummrich 2023-08-04  362  	struct nouveau_exec_job_args args = {};
b88baab828713c Danilo Krummrich 2023-08-04  363  	struct drm_nouveau_exec __user *req = data;
b88baab828713c Danilo Krummrich 2023-08-04  364  	int ret = 0;
b88baab828713c Danilo Krummrich 2023-08-04  365  
b88baab828713c Danilo Krummrich 2023-08-04  366  	if (unlikely(!abi16))
b88baab828713c Danilo Krummrich 2023-08-04  367  		return -ENOMEM;
b88baab828713c Danilo Krummrich 2023-08-04  368  
b88baab828713c Danilo Krummrich 2023-08-04  369  	/* abi16 locks already */
b88baab828713c Danilo Krummrich 2023-08-04  370  	if (unlikely(!nouveau_cli_uvmm(cli)))
b88baab828713c Danilo Krummrich 2023-08-04  371  		return nouveau_abi16_put(abi16, -ENOSYS);
b88baab828713c Danilo Krummrich 2023-08-04  372  
b88baab828713c Danilo Krummrich 2023-08-04 @373  	list_for_each_entry(chan16, &abi16->channels, head) {
b88baab828713c Danilo Krummrich 2023-08-04  374  		if (chan16->chan->chid == req->channel) {
b88baab828713c Danilo Krummrich 2023-08-04  375  			chan = chan16->chan;
b88baab828713c Danilo Krummrich 2023-08-04  376  			break;
b88baab828713c Danilo Krummrich 2023-08-04  377  		}
b88baab828713c Danilo Krummrich 2023-08-04  378  	}
b88baab828713c Danilo Krummrich 2023-08-04  379  
b88baab828713c Danilo Krummrich 2023-08-04  380  	if (!chan)
b88baab828713c Danilo Krummrich 2023-08-04  381  		return nouveau_abi16_put(abi16, -ENOENT);
b88baab828713c Danilo Krummrich 2023-08-04  382  
b88baab828713c Danilo Krummrich 2023-08-04  383  	if (unlikely(atomic_read(&chan->killed)))
b88baab828713c Danilo Krummrich 2023-08-04  384  		return nouveau_abi16_put(abi16, -ENODEV);
b88baab828713c Danilo Krummrich 2023-08-04  385  
b88baab828713c Danilo Krummrich 2023-08-04  386  	if (!chan->dma.ib_max)
b88baab828713c Danilo Krummrich 2023-08-04  387  		return nouveau_abi16_put(abi16, -ENOSYS);
b88baab828713c Danilo Krummrich 2023-08-04  388  
b88baab828713c Danilo Krummrich 2023-08-04  389  	if (unlikely(req->push_count > NOUVEAU_GEM_MAX_PUSH)) {
b88baab828713c Danilo Krummrich 2023-08-04  390  		NV_PRINTK(err, cli, "pushbuf push count exceeds limit: %d max %d\n",
b88baab828713c Danilo Krummrich 2023-08-04  391  			 req->push_count, NOUVEAU_GEM_MAX_PUSH);
b88baab828713c Danilo Krummrich 2023-08-04  392  		return nouveau_abi16_put(abi16, -EINVAL);
b88baab828713c Danilo Krummrich 2023-08-04  393  	}
b88baab828713c Danilo Krummrich 2023-08-04  394  
b88baab828713c Danilo Krummrich 2023-08-04  395  	ret = nouveau_exec_ucopy(&args, req);
b88baab828713c Danilo Krummrich 2023-08-04  396  	if (ret)
b88baab828713c Danilo Krummrich 2023-08-04  397  		goto out;
b88baab828713c Danilo Krummrich 2023-08-04  398  
b88baab828713c Danilo Krummrich 2023-08-04 @399  	args.sched_entity = &chan16->sched_entity;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
