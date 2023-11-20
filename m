Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79AB179A7
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ac++89k7"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50970c2115eso6232052e87.1
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 04:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700485172; x=1701089972; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nFq2J1bznNq6qgpwN/h9IoM2g3bEEN9t3djnlv7UTR8=;
        b=ac++89k7mgoRuhnF+7AMjOurwOUOJMyRTl106fp0PCJXIF8Q3LWACZM5ytYjjWvY9L
         TH7TAz5pL3OzYOZpxGupQWxIsS1T2/wl+zuf+5wyIo4TTVsDWMHySL8xeeywUI3jl2s3
         NHCHmbzCo5aljjqhXuCC2hb8Jq8IeDZU+WGSnYgyIKWWWluivZOfsjpZUraoEMSaebD6
         uc09IPTabn4xpSymQg5+wliEJJteFjPTT6A6zNEe60AsHGU2UZ9YldltjK0XkLlslSHk
         XKi20Gm1dlYoVjec5fR5wA4UgeqOYbLM6hJYBFETwFkeAJpgmDeRoapQhPuaB5DW2D7n
         /nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700485172; x=1701089972;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFq2J1bznNq6qgpwN/h9IoM2g3bEEN9t3djnlv7UTR8=;
        b=ZueVInW3E0gNnXSOHj85MMEAzgCVMroiW6G2NNMEH5BNxty0VxXV4Q5NUonAg8HuQ3
         ea4qP7M+ICLxKGW4ezHiyuHOsdZPyp/enOo4lD6x6EK2uBENfsUHOVwGgWtzT+c0MtWN
         zFVNbWegql7Apk5pHBPjXeZgcGBzE3NVHEzHs4XnFjgIh0r38v9oG6qNX3QKG3TdBs3G
         +/zgyuJTuQpn3U7S+y4CfBSGgzfuphjRdCMTq78V2wfLOs9qjxBKACU9rtmwbKtdkonS
         YQrK1Xx0IsswrIMo9chaGM02khOEO4jibun5VEkc+98/5zYFIfFkaJ/+VuiRY8yqM2NP
         g9XA==
X-Gm-Message-State: AOJu0YyYu+DAmGLyubnQeMaOxtxVbmaOBRmRL1u5TD/NfKYSIoXLLP+p
	Vsh6S+ixWkzlVirI++W6caee5UcoWKZLK3vNcF0=
X-Google-Smtp-Source: AGHT+IFncXFhmSO/Ii+6Ze9igA6aVHPEFA24QIvIv5o+0k4N/7VHzmGpra3v1ANkRcO0GagTh92tXw==
X-Received: by 2002:ac2:4219:0:b0:509:4655:d8d6 with SMTP id y25-20020ac24219000000b005094655d8d6mr4333479lfh.67.1700485171735;
        Mon, 20 Nov 2023 04:59:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d16-20020adffbd0000000b003313902cef5sm11141717wrs.93.2023.11.20.04.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:59:31 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 07:59:28 -0500
To: oe-kbuild@lists.linux.dev, Sagi Shahar <sagis@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-next 196/273] arch/x86/kvm/x86.c:14007
 pre_move_enc_context_from() warn: missing error code 'ret'
Message-ID: <93ac3561-6437-490c-a03d-f04f3bb2a5fb@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   90fec84219b5d2bf13e61f02777f6a44ab755bc4
commit: bf2a53c6d4d7151ace11879b20cacf6b07bdedcb [196/273] KVM: SEV: Refactor common code out of sev_vm_move_enc_context_from
config: x86_64-randconfig-161-20231117 (https://download.01.org/0day-ci/archive/20231117/202311171500.e2f5AH17-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231117/202311171500.e2f5AH17-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311171500.e2f5AH17-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:14007 pre_move_enc_context_from() warn: missing error code 'ret'

vim +/ret +14007 arch/x86/kvm/x86.c

bf2a53c6d4d715 Sagi Shahar 2023-04-07  13983  int pre_move_enc_context_from(struct kvm *dst_kvm, struct kvm *src_kvm,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13984  			      atomic_t *dst_migration_in_progress,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13985  			      atomic_t *src_migration_in_progress)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13986  {
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13987  	struct kvm_vcpu *src_vcpu;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13988  	unsigned long i;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13989  	int ret = -EINVAL;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13990  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13991  	ret = lock_two_vms_for_migration(dst_kvm, src_kvm,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13992  					 dst_migration_in_progress,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13993  					 src_migration_in_progress);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13994  	if (ret)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13995  		return ret;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13996  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13997  	ret = lock_vcpus_for_migration(dst_kvm, MIGRATION_TARGET);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13998  	if (ret)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  13999  		goto unlock_vms;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14000  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14001  	ret = lock_vcpus_for_migration(src_kvm, MIGRATION_SOURCE);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14002  	if (ret)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14003  		goto unlock_dst_vcpu;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14004  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14005  	if (atomic_read(&dst_kvm->online_vcpus) !=
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14006  	    atomic_read(&src_kvm->online_vcpus))
bf2a53c6d4d715 Sagi Shahar 2023-04-07 @14007  		goto unlock_dst_vcpu;

Missing error code?

bf2a53c6d4d715 Sagi Shahar 2023-04-07  14008  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14009  	kvm_for_each_vcpu(i, src_vcpu, src_kvm) {
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14010  		if (!src_vcpu->arch.guest_state_protected)
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14011  			goto unlock_dst_vcpu;

Here too.

bf2a53c6d4d715 Sagi Shahar 2023-04-07  14012  	}
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14013  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14014  	return 0;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14015  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14016  unlock_dst_vcpu:
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14017  	unlock_vcpus_for_migration(dst_kvm);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14018  unlock_vms:
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14019  	unlock_two_vms_for_migration(dst_kvm, src_kvm,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14020  				     dst_migration_in_progress,
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14021  				     src_migration_in_progress);
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14022  
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14023  	return ret;
bf2a53c6d4d715 Sagi Shahar 2023-04-07  14024  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

