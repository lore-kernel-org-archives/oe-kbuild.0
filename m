Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAD96ABD
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Mar 2023 23:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679875198; x=1711411198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5TtfMx6aK5X7BbHCuYU+gB1/4BwQKAmwf+9CJgCf6Y=;
  b=G1otPJDCO6HjzYVfCEI2/iwV12wevKgqvngnhRPd1mgtG1/zmZcmhkU3
   hCckxyEBh3NFuSLslny/aXQfgHK0BYBUtosdNGP7ubOzRvVXInlq9DBwU
   BuwUqIS/lkBg4bNkWjCrmu00y/Cg/j6xTpe6TWqrI2DwYS9alhaj1JNHK
   istgVYXgzQ3SKgUGZbq/fD/Ug9mlIK3KvMmAXHJsznXTLMcOfwysIhlM/
   neJ9arusdDqtHSEJLmWYpq3Xrgc0HCcUi3HVx+GPAn/e7hw56o/opaJE0
   O4TVkGKy+q9eCq3hQLXqqSHHz7sJ6iP2+hOmyMNuZ0gI66o8sDuOtUjFP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="324030769"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="324030769"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2023 16:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="794111798"
X-IronPort-AV: E=Sophos;i="5.98,293,1673942400"; 
   d="scan'208";a="794111798"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2023 16:59:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgaHD-000HQ3-2T;
	Sun, 26 Mar 2023 23:59:55 +0000
Date: Mon, 27 Mar 2023 07:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] misc: fastrpc: support complete DMA pool access to
 the DSP
Message-ID: <202303270739.ODb2LA29-lkp@intel.com>
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
In-Reply-To: <20230325134410.21092-3-me@dylanvanassche.be>
References: <20230325134410.21092-3-me@dylanvanassche.be>
TO: Dylan Van Assche <me@dylanvanassche.be>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
TO: Amol Maheshwari <amahesh@qti.qualcomm.com>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: phone-devel@vger.kernel.org
CC: Dylan Van Assche <me@dylanvanassche.be>

Hi Dylan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dylan-Van-Assche/dt-bindings-misc-qcom-fastrpc-add-qcom-assign-all-memory-property/20230325-214518
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230325134410.21092-3-me%40dylanvanassche.be
patch subject: [PATCH 2/2] misc: fastrpc: support complete DMA pool access to the DSP
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: microblaze-randconfig-m041-20230326 (https://download.01.org/0day-ci/archive/20230327/202303270739.ODb2LA29-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303270739.ODb2LA29-lkp@intel.com/

New smatch warnings:
drivers/misc/fastrpc.c:2273 fastrpc_rpmsg_probe() warn: possible memory leak of 'data'

Old smatch warnings:
drivers/misc/fastrpc.c:1269 fastrpc_init_create_static_process() error: we previously assumed 'fl->cctx->remote_heap' could be null (see line 1261)

vim +/data +2273 drivers/misc/fastrpc.c

965602eabb57d0 Srinivas Kandagatla      2022-02-14  2226  
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2227  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2228  {
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2229  	struct device *rdev = &rpdev->dev;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2230  	struct fastrpc_channel_ctx *data;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2231  	int i, err, domain_id = -1, vmcount;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2232  	const char *domain;
99edd50174e519 Dylan Van Assche         2023-03-25  2233  	bool secure_dsp, assign_all_mem;
99edd50174e519 Dylan Van Assche         2023-03-25  2234  	struct device_node *rmem_node;
99edd50174e519 Dylan Van Assche         2023-03-25  2235  	struct reserved_mem *rmem;
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
99edd50174e519 Dylan Van Assche         2023-03-25  2270  	assign_all_mem = of_property_read_bool(rdev->of_node, "qcom,assign-all-mem");
99edd50174e519 Dylan Van Assche         2023-03-25  2271  
99edd50174e519 Dylan Van Assche         2023-03-25  2272  	if (assign_all_mem && !vmcount)
99edd50174e519 Dylan Van Assche         2023-03-25 @2273  		return -EINVAL;
99edd50174e519 Dylan Van Assche         2023-03-25  2274  
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2275  	if (vmcount) {
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2276  		data->vmcount = vmcount;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2277  		data->perms = BIT(QCOM_SCM_VMID_HLOS);
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2278  		for (i = 0; i < data->vmcount; i++) {
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2279  			data->vmperms[i].vmid = vmids[i];
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2280  			data->vmperms[i].perm = QCOM_SCM_PERM_RWX;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2281  		}
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2282  	}
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2283  
99edd50174e519 Dylan Van Assche         2023-03-25  2284  	if (assign_all_mem) {
99edd50174e519 Dylan Van Assche         2023-03-25  2285  		rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
99edd50174e519 Dylan Van Assche         2023-03-25  2286  		if (rmem_node) {
99edd50174e519 Dylan Van Assche         2023-03-25  2287  			rmem = of_reserved_mem_lookup(rmem_node);
99edd50174e519 Dylan Van Assche         2023-03-25  2288  			if (rmem)
99edd50174e519 Dylan Van Assche         2023-03-25  2289  				qcom_scm_assign_mem(rmem->base, rmem->size, &data->perms,
99edd50174e519 Dylan Van Assche         2023-03-25  2290  						    data->vmperms, data->vmcount);
99edd50174e519 Dylan Van Assche         2023-03-25  2291  		}
99edd50174e519 Dylan Van Assche         2023-03-25  2292  	}
99edd50174e519 Dylan Van Assche         2023-03-25  2293  
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2294  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2295  	data->secure = secure_dsp;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2296  
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2297  	switch (domain_id) {
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2298  	case ADSP_DOMAIN_ID:
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2299  	case MDSP_DOMAIN_ID:
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2300  	case SDSP_DOMAIN_ID:
7f1f481263c3ce Jeya R                   2022-02-14  2301  		/* Unsigned PD offloading is only supported on CDSP*/
7f1f481263c3ce Jeya R                   2022-02-14  2302  		data->unsigned_support = false;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2303  		err = fastrpc_device_register(rdev, data, secure_dsp, domains[domain_id]);
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2304  		if (err)
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2305  			goto fdev_error;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2306  		break;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2307  	case CDSP_DOMAIN_ID:
7f1f481263c3ce Jeya R                   2022-02-14  2308  		data->unsigned_support = true;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2309  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2310  		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2311  		if (err)
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2312  			goto fdev_error;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2313  
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2314  		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2315  		if (err)
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2316  			goto fdev_error;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2317  		break;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2318  	default:
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2319  		err = -EINVAL;
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2320  		goto fdev_error;
0978de9fc7335c Srinivas Kandagatla      2020-05-11  2321  	}
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2322  
278d56f970ae6e Bjorn Andersson          2019-08-29  2323  	kref_init(&data->refcount);
278d56f970ae6e Bjorn Andersson          2019-08-29  2324  
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2325  	dev_set_drvdata(&rpdev->dev, data);
9bde43a0e2f469 Abel Vesa                2022-11-25  2326  	rdev->dma_mask = &data->dma_mask;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2327  	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2328  	INIT_LIST_HEAD(&data->users);
76e8e4ace1ed2c Abel Vesa                2022-11-25  2329  	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2330  	spin_lock_init(&data->lock);
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2331  	idr_init(&data->ctx_idr);
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2332  	data->domain_id = domain_id;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2333  	data->rpdev = rpdev;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2334  
11819ed2b70da9 Christophe JAILLET       2022-11-25  2335  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
11819ed2b70da9 Christophe JAILLET       2022-11-25  2336  	if (err)
11819ed2b70da9 Christophe JAILLET       2022-11-25  2337  		goto populate_error;
11819ed2b70da9 Christophe JAILLET       2022-11-25  2338  
11819ed2b70da9 Christophe JAILLET       2022-11-25  2339  	return 0;
11819ed2b70da9 Christophe JAILLET       2022-11-25  2340  
11819ed2b70da9 Christophe JAILLET       2022-11-25  2341  populate_error:
11819ed2b70da9 Christophe JAILLET       2022-11-25  2342  	if (data->fdevice)
11819ed2b70da9 Christophe JAILLET       2022-11-25  2343  		misc_deregister(&data->fdevice->miscdev);
11819ed2b70da9 Christophe JAILLET       2022-11-25  2344  	if (data->secure_fdevice)
11819ed2b70da9 Christophe JAILLET       2022-11-25  2345  		misc_deregister(&data->secure_fdevice->miscdev);
11819ed2b70da9 Christophe JAILLET       2022-11-25  2346  
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2347  fdev_error:
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2348  	kfree(data);
3abe3ab3cdab71 Srinivas Kandagatla      2022-02-14  2349  	return err;
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2350  }
f6f9279f2bf0e3 Srinivas Kandagatla      2019-02-08  2351  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
