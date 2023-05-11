Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3A11C774
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 10:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683802132; x=1715338132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wrUYYdJ6LKL7XISaOGeZOiSn95xE16cgKD1ut/rkV2w=;
  b=kuwocbOkBLg2tP5D1JiKoSuckFGB8/7jXvMmxEXk9ZJTxXDpNM8PVnW4
   89MwhMy4WZzyrI0B04mf761V8kHYM31iY1/1R7hNQpDoMkHLuUuPgKXdI
   XCkSwe/BiP4O3XQNi44FOVRZLb7I5jBO8FZcDgwu3R2I4vqn5Divlw9cF
   P4ZM9EfSfo117uIHkxYb4P+S2nefTahfcebRDkuKVcvPWlj/hOInHPuZr
   ZULzsPR2nh8DtUQ5HdWM8E281wKgfNVkZFCHg8qOeApT3K2SfvDiqGY55
   Zgvd7evaun/zCXda4VBkVQIq/RQ7JapYTRyJysu6hYidffdaPELvQkHnX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353557837"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="353557837"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 03:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="693749433"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="693749433"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 May 2023 03:48:02 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px3q6-0003xt-0P;
	Thu, 11 May 2023 10:48:02 +0000
Date: Thu, 11 May 2023 18:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 1/2] misc: fastrpc: support complete DMA pool access
 to the DSP
Message-ID: <202305111801.HWy3NJB3-lkp@intel.com>
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
In-Reply-To: <20230507080839.37578-2-me@dylanvanassche.be>
References: <20230507080839.37578-2-me@dylanvanassche.be>
TO: Dylan Van Assche <me@dylanvanassche.be>

Hi Dylan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.4-rc1 next-20230511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dylan-Van-Assche/misc-fastrpc-support-complete-DMA-pool-access-to-the-DSP/20230507-161214
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230507080839.37578-2-me%40dylanvanassche.be
patch subject: [PATCH v3 1/2] misc: fastrpc: support complete DMA pool access to the DSP
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230511/202305111801.HWy3NJB3-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305111801.HWy3NJB3-lkp@intel.com/

New smatch warnings:
drivers/misc/fastrpc.c:2283 fastrpc_rpmsg_probe() warn: possible memory leak of 'data'

Old smatch warnings:
drivers/misc/fastrpc.c:1269 fastrpc_init_create_static_process() error: we previously assumed 'fl->cctx->remote_heap' could be null (see line 1261)

vim +/data +2283 drivers/misc/fastrpc.c

965602eabb57d0 Srinivas Kandagatla      2022-02-14  2226  
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2227  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2228  {
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2229  	struct device *rdev = &rpdev->dev;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2230  	struct fastrpc_channel_ctx *data;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2231  	int i, err, domain_id = -1, vmcount;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2232  	const char *domain;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2233  	bool secure_dsp;
8bebea279f7a60 Dylan Van Assche         2023-05-07  2234  	struct device_node *rmem_node;
8bebea279f7a60 Dylan Van Assche         2023-05-07  2235  	struct reserved_mem *rmem;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2236  	unsigned int vmids[FASTRPC_MAX_VMIDS];
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2237  
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2238  	err = of_property_read_string(rdev->of_node, "label", &domain);
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2239  	if (err) {
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2240  		dev_info(rdev, "FastRPC Domain not specified in DT\n");
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2241  		return err;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2242  	}
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2243  
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2244  	for (i = 0; i <= CDSP_DOMAIN_ID; i++) {
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2245  		if (!strcmp(domains[i], domain)) {
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2246  			domain_id = i;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2247  			break;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2248  		}
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2249  	}
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2250  
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2251  	if (domain_id < 0) {
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2252  		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2253  		return -EINVAL;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2254  	}
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2255  
1ce91d45ba77a4 Abel Vesa                2022-11-25  2256  	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
1ce91d45ba77a4 Abel Vesa                2022-11-25  2257  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
1ce91d45ba77a4 Abel Vesa                2022-11-25  2258  
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2259  	vmcount = of_property_read_variable_u32_array(rdev->of_node,
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2260  				"qcom,vmids", &vmids[0], 0, FASTRPC_MAX_VMIDS);
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2261  	if (vmcount < 0)
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2262  		vmcount = 0;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2263  	else if (!qcom_scm_is_available())
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2264  		return -EPROBE_DEFER;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2265  
278d56f970ae6e Bjorn Andersson          2019-08-29  2266  	data = kzalloc(sizeof(*data), GFP_KERNEL);
278d56f970ae6e Bjorn Andersson          2019-08-29  2267  	if (!data)
278d56f970ae6e Bjorn Andersson          2019-08-29  2268  		return -ENOMEM;
278d56f970ae6e Bjorn Andersson          2019-08-29  2269  
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2270  	if (vmcount) {
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2271  		data->vmcount = vmcount;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2272  		data->perms = BIT(QCOM_SCM_VMID_HLOS);
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2273  		for (i = 0; i < data->vmcount; i++) {
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2274  			data->vmperms[i].vmid = vmids[i];
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2275  			data->vmperms[i].perm = QCOM_SCM_PERM_RWX;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2276  		}
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2277  	}
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2278  
8bebea279f7a60 Dylan Van Assche         2023-05-07  2279  	rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
8bebea279f7a60 Dylan Van Assche         2023-05-07  2280  	if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
8bebea279f7a60 Dylan Van Assche         2023-05-07  2281  		rmem = of_reserved_mem_lookup(rmem_node);
8bebea279f7a60 Dylan Van Assche         2023-05-07  2282  		if (!rmem)
8bebea279f7a60 Dylan Van Assche         2023-05-07 @2283  			return -EINVAL;
8bebea279f7a60 Dylan Van Assche         2023-05-07  2284  
8bebea279f7a60 Dylan Van Assche         2023-05-07  2285  		qcom_scm_assign_mem(rmem->base, rmem->size, &data->perms,
8bebea279f7a60 Dylan Van Assche         2023-05-07  2286  				    data->vmperms, data->vmcount);
8bebea279f7a60 Dylan Van Assche         2023-05-07  2287  
8bebea279f7a60 Dylan Van Assche         2023-05-07  2288  	}
8bebea279f7a60 Dylan Van Assche         2023-05-07  2289  
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2290  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2291  	data->secure = secure_dsp;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2292  
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2293  	switch (domain_id) {
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2294  	case ADSP_DOMAIN_ID:
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2295  	case MDSP_DOMAIN_ID:
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2296  	case SDSP_DOMAIN_ID:
7f1f481263c3ce Jeya R                   2022-02-14  2297  		/* Unsigned PD offloading is only supported on CDSP*/
7f1f481263c3ce Jeya R                   2022-02-14  2298  		data->unsigned_support = false;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2299  		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2300  		if (err)
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2301  			goto fdev_error;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2302  		break;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2303  	case CDSP_DOMAIN_ID:
7f1f481263c3ce Jeya R                   2022-02-14  2304  		data->unsigned_support = true;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2305  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2306  		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2307  		if (err)
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2308  			goto fdev_error;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2309  
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2310  		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2311  		if (err)
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2312  			goto fdev_error;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2313  		break;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2314  	default:
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2315  		err = -EINVAL;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2316  		goto fdev_error;
0978de9fc7335c Srinivas Kandagatla      2020-05-11  2317  	}
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2318  
278d56f970ae6e Bjorn Andersson          2019-08-29  2319  	kref_init(&data->refcount);
278d56f970ae6e Bjorn Andersson          2019-08-29  2320  
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2321  	dev_set_drvdata(&rpdev->dev, data);
9bde43a0e2f469 Abel Vesa                2022-11-25  2322  	rdev->dma_mask = &data->dma_mask;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2323  	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2324  	INIT_LIST_HEAD(&data->users);
76e8e4ace1ed2c Abel Vesa                2022-11-25  2325  	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2326  	spin_lock_init(&data->lock);
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2327  	idr_init(&data->ctx_idr);
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2328  	data->domain_id = domain_id;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2329  	data->rpdev = rpdev;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2330  
11819ed2b70da9 Christophe JAILLET       2022-11-25  2331  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
11819ed2b70da9 Christophe JAILLET       2022-11-25  2332  	if (err)
11819ed2b70da9 Christophe JAILLET       2022-11-25  2333  		goto populate_error;
11819ed2b70da9 Christophe JAILLET       2022-11-25  2334  
11819ed2b70da9 Christophe JAILLET       2022-11-25  2335  	return 0;
11819ed2b70da9 Christophe JAILLET       2022-11-25  2336  
11819ed2b70da9 Christophe JAILLET       2022-11-25  2337  populate_error:
11819ed2b70da9 Christophe JAILLET       2022-11-25  2338  	if (data->fdevice)
11819ed2b70da9 Christophe JAILLET       2022-11-25  2339  		misc_deregister(&data->fdevice->miscdev);
11819ed2b70da9 Christophe JAILLET       2022-11-25  2340  	if (data->secure_fdevice)
11819ed2b70da9 Christophe JAILLET       2022-11-25  2341  		misc_deregister(&data->secure_fdevice->miscdev);
11819ed2b70da9 Christophe JAILLET       2022-11-25  2342  
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2343  fdev_error:
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2344  	kfree(data);
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2345  	return err;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2346  }
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2347  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
