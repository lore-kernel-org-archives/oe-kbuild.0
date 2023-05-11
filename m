Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE7A182C8
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 11:04:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so57609275e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683803061; x=1686395061;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0COkSPccYdFhefpvdS3Zo1JS9uGaXGhenEuMhJrMj0=;
        b=lVjumszoopdv/1XXI/PlnvE+9TDDs1BxSWOxBRWOf0Hh1l/dhfGhAiQdXOwzaMDwgN
         fnLHFUE+sj1ViAUuI5f6yMybS+KRc1tQVfbiuYkn948IBWnrPcX0bWZZ7MjviXtxZBwu
         DfwXjC05c69+st9IZIj7U0J50mMxsbdfIkc7yZJ3xuCplfoeZa0wozOeuUm4wO+q4wP/
         z/Ld03CdOnt0E3WiiJBGn1GxBhAzx19aUcZDLzUf56AErIEfKh06zmUBT3q3y67x1VXk
         JmKQn5V9cOepl6DrpOoVLn+Pbv7mKnW5sSmoPKn47eZnRVRQFxvAW+RO+YUEErUeAyAY
         cd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683803061; x=1686395061;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0COkSPccYdFhefpvdS3Zo1JS9uGaXGhenEuMhJrMj0=;
        b=O8T3na1q3nQzHfurKdy6yXcVj355eFQRUR+qZHCiyuLMcunFzyzVITkcsV6htLr1aw
         39WY+XX+DL4iHmOh5NJGgDPZoW6/qEOF4bP1wMNw/SXbew2HWGjEwPGWdEz5sFEK54PY
         EDRJjlSGrQxcCTFRj+deosynMGlZCe4VI19DXYR1aAaMOL7cNL6E2yg0dt89Bu8KoPOk
         ZHxRArSl0tMVDzbjnU9KXFcFv9qYteSyaudEHxePFkr3UycYSloRz6HDRr4WMCdY+LmH
         gRZlQvdw846hUkXChsOmjpWPke7DtxnYYQhiFQeeSpL5mc8rmXdoQ5kNiKy6zBQR3VjL
         3k4g==
X-Gm-Message-State: AC+VfDy6uX87S6wJ3c4CdxY1xXOOr4eIl5FbeE/uDFKcLYUrK5GyON3R
	GkYm1nO+dfXK8lmmM4ep4sTJf/trbEQZA/hmRO8=
X-Google-Smtp-Source: ACHHUZ5/flniX7yS5CgNTFoAL0BlpPOb2S9TCp/K1LSoqYNhp0b1tfvP/6TjTHbRDCdwsg28RR9uYg==
X-Received: by 2002:a7b:c4c3:0:b0:3f3:1cb7:b2a6 with SMTP id g3-20020a7bc4c3000000b003f31cb7b2a6mr14423403wmk.6.1683803060912;
        Thu, 11 May 2023 04:04:20 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s7-20020a1cf207000000b003e91b9a92c9sm25319736wmc.24.2023.05.11.04.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:04:19 -0700 (PDT)
Date: Thu, 11 May 2023 14:04:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dylan Van Assche <me@dylanvanassche.be>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/2] misc: fastrpc: support complete DMA pool access
 to the DSP
Message-ID: <313c4089-55a7-43e3-806b-040641089d13@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230507080839.37578-2-me@dylanvanassche.be>

Hi Dylan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dylan-Van-Assche/misc-fastrpc-support-complete-DMA-pool-access-to-the-DSP/20230507-161214
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230507080839.37578-2-me%40dylanvanassche.be
patch subject: [PATCH v3 1/2] misc: fastrpc: support complete DMA pool access to the DSP
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

Allocated here.

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

Needs goto fdev_error;

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

