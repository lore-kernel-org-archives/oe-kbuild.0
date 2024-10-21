Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095141D14FB
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495696; cv=none; b=pxO1B1EfviOg6ZaznhY9d43rjG8U9QbeWYXTgUM70Ok33t1mx5ZtVhZLn34j90jcItU7HnJQT2dDG4llJsG09ojgbNbhj8wy4gB7Jk4yT/i2IiLQXAGMzGDQmup1IhBS/QTv76FsiTe0J+yGDcl6Yenm1ArTzLrADn3xDgOWyS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495696; c=relaxed/simple;
	bh=yLt4P+aFKsbYRKyQBp9kIVZtjx4+ma6tx6NpxMwTg08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=egEos6DDA+aM1rphxejrF5YOWStnv2Qs/gxHN0o9NW9YHsTCYSQmnkrlCiRzqibgiEkdRoww9KJCq1UjKMl5Yat9m9UYCAhrjaxdtMWNIAcDfqouhJsOd/3gTXVtW4noD72PL8SpN+dePDe5+T7g4kFaKMj46qxMxCXRrHXt7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BMTHXH3k; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BMTHXH3k"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so32804875e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 00:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729495691; x=1730100491; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbzFOFCkLwBY6/I+BFLuJ0WlPPJIPe8WCwwU3mX1OLM=;
        b=BMTHXH3kuEsNlfSMhlCxjr1k5xmr+UNzUMwWng/TLgJ7d7qI5+d1+wpATn9f/4YcJR
         aJYSy4Nl+LT7cEqnhlj/Pb2ARcfCwnu0zLJ+cnpynI2p3IJPTofGJyi5VZU48aR4FtGN
         wok0xomp4hrydMq//gktCTgqUCs4Aj8lkoJz5DB5wB8lednLk2t9oZAD5+Ly2Erv06st
         SH4TSTqnRnJqSEhCVcC75cJFq9AePSs8AnFs7mvnlEYRe38tHZjb8oJM2LgcDg+M13Mz
         tHStvVM/ePoCtNaNnG/Ph8vkuI7J4NCbdhh1bizHQ8RMz9KiuAwJ4LW+x0tVhwveeAK0
         +FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495691; x=1730100491;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbzFOFCkLwBY6/I+BFLuJ0WlPPJIPe8WCwwU3mX1OLM=;
        b=V2M2qrC56Vd5OR5R/ru5QTrzjaV9xL8ckMJ+7mgzWR2WLzgs5niG/DZOk9IR1S2PhC
         KhuTEM8xtnX/tG5aqG0S9n8Bb8ATRuvsNEz3+LhK8YUUz+Bl/x2fytqzYrbDiHaG6vBJ
         NF1Ch44OCU+wzVXW6fxMGwFVh8zmUO/LjpN1Fj8CxZpJ8xBMecXn9kwFo3qFMb/1V+Hq
         MPgjCjks/bKdbG59xDsg3UXZL8FnUCORXy94kt+ZPw6atTv2q71wGKwmq+KkMnFo9r6o
         LkCkgg41pn5EmgjiAWS5D2GyAQPBSvCRA9T1ZEKSLwfLiIITGHQZ9z5jxVtHlCB5bb57
         t72g==
X-Gm-Message-State: AOJu0YyQHMEd3MAIIkgoRN67VGV6RIfq7OBvuputQSEXUlKfCQvQp4i+
	4Ecqpn4kv0Z2gydtRQWyvipPHMbCLhPg48wfjwj0g45AsNAXiL8SlXCJGCQQHupOQmmyEBP5+dX
	O
X-Google-Smtp-Source: AGHT+IF/fDrVSWGmNnEMi7ykD0TpQR91iOtOLsFC59sXFMSL/cnwNC7Tm2avPeNPtwtwqCyDjTGo5Q==
X-Received: by 2002:a05:600c:5124:b0:431:5bf2:2d4 with SMTP id 5b1f17b1804b1-431616a388cmr85325755e9.29.1729495691015;
        Mon, 21 Oct 2024 00:28:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c3173sm47208225e9.33.2024.10.21.00.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:28:10 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:28:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Brijesh Singh <brijesh.singh@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Michael Roth <michael.roth@amd.com>
Subject: arch/x86/kvm/svm/sev.c:454 __sev_guest_init() warn: missing error
 code 'ret'
Message-ID: <148feb5b-cdd8-4065-8570-d0304383cc62@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: 88caf544c9305313e1c48ac1a437faa5df8fff06 KVM: SEV: Provide support for SNP_GUEST_REQUEST NAE event
config: x86_64-randconfig-161-20241016 (https://download.01.org/0day-ci/archive/20241019/202410192220.MeTyHPxI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410192220.MeTyHPxI-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/svm/sev.c:454 __sev_guest_init() warn: missing error code 'ret'

vim +/ret +454 arch/x86/kvm/svm/sev.c

4f5defae708992 Paolo Bonzini         2024-04-04  402  static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
4f5defae708992 Paolo Bonzini         2024-04-04  403  			    struct kvm_sev_init *data,
4f5defae708992 Paolo Bonzini         2024-04-04  404  			    unsigned long vm_type)
eaf78265a4ab33 Joerg Roedel          2020-03-24  405  {
eaf78265a4ab33 Joerg Roedel          2020-03-24  406  	struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
1ca5614b84eed5 Brijesh Singh         2024-01-25  407  	struct sev_platform_init_args init_args = {0};
4f5defae708992 Paolo Bonzini         2024-04-04  408  	bool es_active = vm_type != KVM_X86_SEV_VM;
4f5defae708992 Paolo Bonzini         2024-04-04  409  	u64 valid_vmsa_features = es_active ? sev_supported_vmsa_features : 0;
cc4ce37bed8598 Sean Christopherson   2024-01-31  410  	int ret;
eaf78265a4ab33 Joerg Roedel          2020-03-24  411  
8727906fde6ea6 Sean Christopherson   2021-03-30  412  	if (kvm->created_vcpus)
8727906fde6ea6 Sean Christopherson   2021-03-30  413  		return -EINVAL;
8727906fde6ea6 Sean Christopherson   2021-03-30  414  
4f5defae708992 Paolo Bonzini         2024-04-04  415  	if (data->flags)
4f5defae708992 Paolo Bonzini         2024-04-04  416  		return -EINVAL;
4f5defae708992 Paolo Bonzini         2024-04-04  417  
4f5defae708992 Paolo Bonzini         2024-04-04  418  	if (data->vmsa_features & ~valid_vmsa_features)
26c44aa9e076ed Paolo Bonzini         2024-04-04  419  		return -EINVAL;
26c44aa9e076ed Paolo Bonzini         2024-04-04  420  
4af663c2f64a8d Michael Roth          2024-05-01  421  	if (data->ghcb_version > GHCB_VERSION_MAX || (!es_active && data->ghcb_version))
4af663c2f64a8d Michael Roth          2024-05-01  422  		return -EINVAL;
4af663c2f64a8d Michael Roth          2024-05-01  423  
eaf78265a4ab33 Joerg Roedel          2020-03-24  424  	if (unlikely(sev->active))
fdd58834d13204 Sean Christopherson   2024-01-31  425  		return -EINVAL;
eaf78265a4ab33 Joerg Roedel          2020-03-24  426  
a41fb26e616973 Sean Christopherson   2021-11-09  427  	sev->active = true;
4f5defae708992 Paolo Bonzini         2024-04-04  428  	sev->es_active = es_active;
4f5defae708992 Paolo Bonzini         2024-04-04  429  	sev->vmsa_features = data->vmsa_features;
4af663c2f64a8d Michael Roth          2024-05-01  430  	sev->ghcb_version = data->ghcb_version;
4af663c2f64a8d Michael Roth          2024-05-01  431  
4af663c2f64a8d Michael Roth          2024-05-01  432  	/*
4af663c2f64a8d Michael Roth          2024-05-01  433  	 * Currently KVM supports the full range of mandatory features defined
4af663c2f64a8d Michael Roth          2024-05-01  434  	 * by version 2 of the GHCB protocol, so default to that for SEV-ES
4af663c2f64a8d Michael Roth          2024-05-01  435  	 * guests created via KVM_SEV_INIT2.
4af663c2f64a8d Michael Roth          2024-05-01  436  	 */
4af663c2f64a8d Michael Roth          2024-05-01  437  	if (sev->es_active && !sev->ghcb_version)
4af663c2f64a8d Michael Roth          2024-05-01  438  		sev->ghcb_version = GHCB_VERSION_DEFAULT;
605bbdc12bc883 Paolo Bonzini         2024-04-04  439  
1dfe571c12cf99 Brijesh Singh         2024-05-01  440  	if (vm_type == KVM_X86_SNP_VM)
1dfe571c12cf99 Brijesh Singh         2024-05-01  441  		sev->vmsa_features |= SVM_SEV_FEAT_SNP_ACTIVE;
1dfe571c12cf99 Brijesh Singh         2024-05-01  442  
cc4ce37bed8598 Sean Christopherson   2024-01-31  443  	ret = sev_asid_new(sev);
cc4ce37bed8598 Sean Christopherson   2024-01-31  444  	if (ret)
fd49e8ee70b306 Paolo Bonzini         2021-04-22  445  		goto e_no_asid;
eaf78265a4ab33 Joerg Roedel          2020-03-24  446  
1ca5614b84eed5 Brijesh Singh         2024-01-25  447  	init_args.probe = false;
1ca5614b84eed5 Brijesh Singh         2024-01-25  448  	ret = sev_platform_init(&init_args);
eaf78265a4ab33 Joerg Roedel          2020-03-24  449  	if (ret)
eaf78265a4ab33 Joerg Roedel          2020-03-24  450  		goto e_free;
eaf78265a4ab33 Joerg Roedel          2020-03-24  451  
88caf544c93053 Brijesh Singh         2024-07-01  452  	/* This needs to happen after SEV/SNP firmware initialization. */
88caf544c93053 Brijesh Singh         2024-07-01  453  	if (vm_type == KVM_X86_SNP_VM && snp_guest_req_init(kvm))
88caf544c93053 Brijesh Singh         2024-07-01 @454  		goto e_free;

Hard to tell if this is an error path or not.

88caf544c93053 Brijesh Singh         2024-07-01  455  
eaf78265a4ab33 Joerg Roedel          2020-03-24  456  	INIT_LIST_HEAD(&sev->regions_list);
b2125513dfc0dd Peter Gonda           2022-02-11  457  	INIT_LIST_HEAD(&sev->mirror_vms);
26c44aa9e076ed Paolo Bonzini         2024-04-04  458  	sev->need_init = false;
eaf78265a4ab33 Joerg Roedel          2020-03-24  459  
c538dc792ff7e4 Suravee Suthikulpanit 2022-04-08  460  	kvm_set_apicv_inhibit(kvm, APICV_INHIBIT_REASON_SEV);
c538dc792ff7e4 Suravee Suthikulpanit 2022-04-08  461  
eaf78265a4ab33 Joerg Roedel          2020-03-24  462  	return 0;
eaf78265a4ab33 Joerg Roedel          2020-03-24  463  
eaf78265a4ab33 Joerg Roedel          2020-03-24  464  e_free:
1ca5614b84eed5 Brijesh Singh         2024-01-25  465  	argp->error = init_args.error;
7aef27f0b2a8a5 Vipin Sharma          2021-03-29  466  	sev_asid_free(sev);
7aef27f0b2a8a5 Vipin Sharma          2021-03-29  467  	sev->asid = 0;
fd49e8ee70b306 Paolo Bonzini         2021-04-22  468  e_no_asid:
605bbdc12bc883 Paolo Bonzini         2024-04-04  469  	sev->vmsa_features = 0;
fd49e8ee70b306 Paolo Bonzini         2021-04-22  470  	sev->es_active = false;
a41fb26e616973 Sean Christopherson   2021-11-09  471  	sev->active = false;
eaf78265a4ab33 Joerg Roedel          2020-03-24  472  	return ret;
eaf78265a4ab33 Joerg Roedel          2020-03-24  473  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

