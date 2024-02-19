Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A57928684
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708339484; cv=none; b=jZG9lFDyKhPNEoobc3e0ncavbB5zKKkF4LCZlZ7oM0OdZXN84PZc6xpjSh1Sb3z1A9s/fLb6Bi+GVCSDvckCNfxGr/JGJTEoBjJutKGiahMN+c3vjQBurzpf2XGGWCXU0LKIcIyiwRWGV7mJHcMSep7ifLICpskTenB51A8BJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708339484; c=relaxed/simple;
	bh=DnA99VMRy24DLi48y/UTSwFOrBR3wFFYSzpPgb90O8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mublNmC89AGMcDS4muVjMEH964vgptHnptrkUfReT/1kzDGrEK9ejcvSGbVMsI17PF0EzNluVhg+3Q0QHM3CFAdm6+bFJyHnx84LKdsMkUS0mgqZUHtmNb4L0KxzLXgXq9jNDFakgN+tzUn/jlQKwZVatTCwnUf1IZD8aa2D00I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BAsbPknM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BAsbPknM"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3e6f79e83dso134005766b.2
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Feb 2024 02:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708339480; x=1708944280; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4FSYkTuvjhXVCRfJGPu8mVaZQpkO+jeIZbww2cGIJQ=;
        b=BAsbPknM2z6SaXO5nSG2H3mqLqzI7OWJ/TI4iSZo+nVkr5pfHWD/sYNFmvN1txt0lm
         u31UnSnM6BbgUIugjPB8bOQtnY9dgl1GKS0X82zQ+0ZdmFBRadJK9RBONNzRAtmcyqLw
         0o10cZ63dZM/mbAnrn+vftkAxhDjYJ2YmeSpJmAHsRNjY2SDuillYyOvU1z03AfmYSUS
         dhF+xacA1vARORMLTP6K+hAwHjXDjUrvqyVnk7YVOL5t6UY/leAkh8Na4RYpsLiYPFoq
         3SqPe1KsoXqcjPz8WYWCriE7dBhXD4ul76+0qW/0HCoBGJw8tnviDho4qcY5DC1fR/ED
         mNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708339480; x=1708944280;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4FSYkTuvjhXVCRfJGPu8mVaZQpkO+jeIZbww2cGIJQ=;
        b=MsgkEMyKWzuRVr+lZgQS/bzoP3Gg2h0rtEWKT6a4XQKbgKVGybmyxyUf0ffDYGUu8o
         FECPHvYE0hDoOdY6wJvDt9Al0YKSzYDWJfjvCkciKESvk+WGiiFVKNqS8RxOgZYCmcNG
         NOBS7GwdAkMP60s7m0uzeA00a9Xjtsux+ob0O4k8YeF30pkvBGwHKIMIVh0cNC+ea/ui
         bW7gRfAFZJvPkrlBd9SvxVewDHz1CNMXYtkH3GX3LxZcOy9AuQZXdA/+Ib4w0ljdq9He
         5XMYYhtQFSQ1xGruf7mXPP+GGr4x6GDwEhhVFzlkSYQ3QMURo2TeLoBQoQj7mHDfNN0K
         ffyg==
X-Gm-Message-State: AOJu0YzdJHR3nDOe3XTXAVBC5YNbC+DnXVP7s2R6rDT4ee3NPmVEo9v6
	kXpDx9GartAvF8oEZR/O6z7zibtnHjYY4lbWysAYxQIX/WKeMu04xLdh8f8/oYiO9WphQY9t6CP
	S
X-Google-Smtp-Source: AGHT+IG3LGmPySzMSkCnfpT6JIzXAvfEaUj4Y1QO6e4t2Mj9MNxR+wZJFsb3LSqpyVShVmPPSInXrA==
X-Received: by 2002:a17:906:5f8b:b0:a3c:f4d6:657e with SMTP id a11-20020a1709065f8b00b00a3cf4d6657emr7812745eju.69.1708339480562;
        Mon, 19 Feb 2024 02:44:40 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ty5-20020a170907c70500b00a3da9857e46sm2800209ejc.99.2024.02.19.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 02:44:40 -0800 (PST)
Date: Mon, 19 Feb 2024 13:44:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-hmem-report 8/17] drivers/acpi/numa/hmat.c:742
 hmat_update_target_attrs() warn: was || intended here instead of &&?
Message-ID: <a7438315-f0ac-49e4-a4c6-bcc3a564d110@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   fe7e217f68ed900f742c9c9cea8a9214ce92a484
commit: af0ac0f12386e0de55e335e56a923974d3cb38d9 [8/17] ACPI: HMAT: Introduce 2 levels of generic port access class
config: x86_64-randconfig-161-20240219 (https://download.01.org/0day-ci/archive/20240219/202402191421.F2vc8O3F-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402191421.F2vc8O3F-lkp@intel.com/

smatch warnings:
drivers/acpi/numa/hmat.c:742 hmat_update_target_attrs() warn: was || intended here instead of &&?

vim +742 drivers/acpi/numa/hmat.c

d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  689  static void hmat_update_target_attrs(struct memory_target *target,
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  690  				     unsigned long *p_nodes, int access)
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  691  {
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  692  	struct memory_initiator *initiator;
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  693  	unsigned int cpu_nid;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  694  	struct memory_locality *loc = NULL;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  695  	u32 best = 0;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  696  	int i;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  697  
a3a3e341f169511 drivers/acpi/numa/hmat.c Dave Jiang       2023-12-21  698  	/* Don't update for generic port if there's no device handle */
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  699  	if ((access == NODE_ACCESS_CLASS_GENPORT_SINK_LOCAL ||
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  700  	     access == NODE_ACCESS_CLASS_GENPORT_SINK_CPU) &&
a3a3e341f169511 drivers/acpi/numa/hmat.c Dave Jiang       2023-12-21  701  	    !(*(u16 *)target->gen_port_device_handle))
a3a3e341f169511 drivers/acpi/numa/hmat.c Dave Jiang       2023-12-21  702  		return;
a3a3e341f169511 drivers/acpi/numa/hmat.c Dave Jiang       2023-12-21  703  
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  704  	bitmap_zero(p_nodes, MAX_NUMNODES);
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  705  	/*
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  706  	 * If the Address Range Structure provides a local processor pxm, set
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  707  	 * only that one. Otherwise, find the best performance attributes and
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  708  	 * collect all initiators that match.
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  709  	 */
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  710  	if (target->processor_pxm != PXM_INVAL) {
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  711  		cpu_nid = pxm_to_node(target->processor_pxm);
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  712  		if ((access == ACCESS_COORDINATE_LOCAL ||
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  713  		     access == NODE_ACCESS_CLASS_GENPORT_SINK_LOCAL) &&
1aad530cd525eeb drivers/acpi/numa/hmat.c Dave Jiang       2024-01-10  714  		    node_state(cpu_nid, N_CPU)) {
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  715  			set_bit(target->processor_pxm, p_nodes);
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  716  			return;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  717  		}
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  718  	}
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  719  
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  720  	if (list_empty(&localities))
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  721  		return;
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  722  
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  723  	/*
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  724  	 * We need the initiator list sorted so we can use bitmap_clear for
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  725  	 * previously set initiators when we find a better memory accessor.
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  726  	 * We'll also use the sorting to prime the candidate nodes with known
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  727  	 * initiators.
665ac7e92757fb7 drivers/acpi/hmat/hmat.c Keith Busch      2019-03-11  728  	 */
48d4180939e12c4 drivers/acpi/numa/hmat.c Vishal Verma     2022-11-16  729  	list_sort(NULL, &initiators, initiator_cmp);
48d4180939e12c4 drivers/acpi/numa/hmat.c Vishal Verma     2022-11-16  730  	if (initiators_to_nodemask(p_nodes) < 0)
48d4180939e12c4 drivers/acpi/numa/hmat.c Vishal Verma     2022-11-16  731  		return;
48d4180939e12c4 drivers/acpi/numa/hmat.c Vishal Verma     2022-11-16  732  
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  733  	for (i = WRITE_LATENCY; i <= READ_BANDWIDTH; i++) {
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  734  		loc = localities_types[i];
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  735  		if (!loc)
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  736  			continue;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  737  
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  738  		best = 0;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  739  		list_for_each_entry(initiator, &initiators, node) {
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  740  			u32 value;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  741  
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09 @742  			if ((access == ACCESS_COORDINATE_CPU &&
af0ac0f12386e0d drivers/acpi/numa/hmat.c Dave Jiang       2024-01-09  743  			     access == NODE_ACCESS_CLASS_GENPORT_SINK_CPU) &&

access can't be equal to both.  Was || intended?

1aad530cd525eeb drivers/acpi/numa/hmat.c Dave Jiang       2024-01-10  744  			    !initiator->has_cpu) {
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  745  				clear_bit(initiator->processor_pxm, p_nodes);
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  746  				continue;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  747  			}
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  748  			if (!test_bit(initiator->processor_pxm, p_nodes))
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  749  				continue;
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  750  
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  751  			value = hmat_initiator_perf(target, initiator, loc->hmat_loc);
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  752  			if (hmat_update_best(loc->hmat_loc->data_type, value, &best))
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  753  				bitmap_clear(p_nodes, 0, initiator->processor_pxm);
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  754  			if (value != best)
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  755  				clear_bit(initiator->processor_pxm, p_nodes);
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  756  		}
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  757  		if (best)
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  758  			hmat_update_target_access(target, loc->hmat_loc->data_type, best, access);
d0376aac59a166c drivers/acpi/numa/hmat.c Huang Ying       2023-09-26  759  	}
b9fffe47212c701 drivers/acpi/numa/hmat.c Jonathan Cameron 2020-09-30  760  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

