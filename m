Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A077622;
	Mon, 27 Mar 2023 04:09:51 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id j24so7242683wrd.0;
        Sun, 26 Mar 2023 21:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679890189;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l7ijLTIesAOEpn36Fs42xeH/9XS1VZZGszE+oGRCXj0=;
        b=nRFIUVWQPecoMEHzKmyeLvjTcp/yjMztl4Pg0OOaG8c+ImjWC64i/lOL7hFiE1UqSX
         U4IGBSV4MEE8UmS8xQN+/sgPQ11QMkGhQhatGpXJHvAIhOxJoo8GFV+KXI6pFBeYFhTD
         D5J3r6GOqCIRV5KXr393hmZr/jh280QtfOE5I/RitL7occNpSq3UPSBipgTiOdj4ltxt
         2H8v98bxRssnPxcUlpQhnHs0snHLhZ03REm/Vy7kVsOxbq5Hlbgwl93q0rB5MZZTqFn8
         yhDWWFDeW1BCsZGPuUygdPsmdGQuT6rrkbzxnZnGjtKVuxCKHCZKuzXoLiGCRDXJhtW6
         yJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679890189;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7ijLTIesAOEpn36Fs42xeH/9XS1VZZGszE+oGRCXj0=;
        b=wj7EwyLb3pmrZ5TSKExpEtOuTi0vEU/U/cuWj0G+BKvreUqCAKp5osljEEU4ZNjvuC
         2COs5gp7noW8NBx5R41SqfB1FW3ch+UV1hrWUp8l7bObLEtj0jXKEwuPTJ24jN4DZPHz
         F0xhOVVhvWR+5szKJCXHHZhTmeqQeChjKS5Qfae6nLumGIrasLKyCc6ZYcpzT5c7HKPA
         Bvwwn/mmEj6yCnA0tkD2oAITQBQ95oK4M+ktk4P16o77cE5fuKwUw7+kJexXJlhk2t+2
         RtsmOixJ8CQUtmSvMk1k+Kd0AO4B1XjCbs3EUtGdx49moYuGd0e1iM3Q+4YxgILheIXl
         CW9w==
X-Gm-Message-State: AAQBX9fqkcIANZGc9ZhEMn/PLIOEgHafZO6/NG++72ebh0GUcfrLus6c
	I/NUGJc9q/ZPooxxdSwOrPj5M0oOkOQ=
X-Google-Smtp-Source: AKy350aPtQ3/HJnPD7bxSqU78HCNLeKUq9YcfPVBKGfxJ65U31vR/MXIZDGYGxEq5i77c837P1WT5Q==
X-Received: by 2002:adf:f2c6:0:b0:2d1:5b75:28f0 with SMTP id d6-20020adff2c6000000b002d15b7528f0mr8409709wrp.39.1679890189402;
        Sun, 26 Mar 2023 21:09:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d5102000000b002c71b4d476asm23832783wrt.106.2023.03.26.21.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 21:09:48 -0700 (PDT)
Date: Mon, 27 Mar 2023 07:09:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Dylan Van Assche <me@dylanvanassche.be>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Dylan Van Assche <me@dylanvanassche.be>
Subject: Re: [PATCH 2/2] misc: fastrpc: support complete DMA pool access to
 the DSP
Message-ID: <c138a832-4b10-4f7b-9e7e-4386e8de0465@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325134410.21092-3-me@dylanvanassche.be>

Hi Dylan,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dylan-Van-Assche/dt-bindings-misc-qcom-fastrpc-add-qcom-assign-all-memory-property/20230325-214518
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230325134410.21092-3-me%40dylanvanassche.be
patch subject: [PATCH 2/2] misc: fastrpc: support complete DMA pool access to the DSP
config: microblaze-randconfig-m041-20230326 (https://download.01.org/0day-ci/archive/20230327/202303270739.ODb2LA29-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303270739.ODb2LA29-lkp@intel.com/

New smatch warnings:
drivers/misc/fastrpc.c:2273 fastrpc_rpmsg_probe() warn: possible memory leak of 'data'

vim +/data +2273 drivers/misc/fastrpc.c

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

Move this code before the data = kzalloc() allocation to avoid a memory
leak.

99edd50174e519 Dylan Van Assche         2023-03-25  2274  
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2275  	if (vmcount) {
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2276  		data->vmcount = vmcount;
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2277  		data->perms = BIT(QCOM_SCM_VMID_HLOS);
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2278  		for (i = 0; i < data->vmcount; i++) {
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2279  			data->vmperms[i].vmid = vmids[i];
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  2280  			data->vmperms[i].perm = QCOM_SCM_PERM_RWX;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

