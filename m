Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2308F69
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Oct 2023 10:09:19 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9b2a3fd5764so1316639166b.3
        for <oe-kbuild@lists.linux.dev>; Mon, 02 Oct 2023 03:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696241358; x=1696846158; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZL+wIOoKHC8FB8yMF4CXu0Kci6UDNY0J5F6ohmaWXg=;
        b=SaqJ4i4uykEedJzVpGfbTO0n9EwwsemaGbn3kfj9E8F6h/8qz1lCHAx1E1mcmebRr2
         IP8+wyJErG8uOCPYl8aTqtd6BoDD4ORmZG1/Myep+JLLwEmDX1caj/CucH9jiQLcE6FE
         YCLgKYkK43RHO7R8uYQbhns4gZ5KlHDCvXkQE19gv+Sz1OdeAbS+ejIQZ+9ip3bwD+EV
         8wjcY5tCvqyYdPmLXJVxfD54zX3Z1QkkKRd6bb3LlAWK6Q34ze6EttfGU8kcYVe5R2ev
         Rf4/gRr9EdesucwL8Lk4pz3J09i4JDtoFyCuJRBQAh4UF8JDe0NMFH8NlvopI5fqbEZU
         QUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696241358; x=1696846158;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZL+wIOoKHC8FB8yMF4CXu0Kci6UDNY0J5F6ohmaWXg=;
        b=gCAb8bT022cKZpmDS2dqKP80blmVpSoksR8R88CXS+YCDQp2AQzflCLc2aPkKmaUJu
         e8UPXufG0OdO9kW9p4OWzkKqAcB6dIZ72JTnrYiOs8rWuSqCyfEXGZv0GC2nJ5gvVWB9
         zeQsVDA70IkG9yPssdtclVeHKwi+YpUuDk/JS5sXIHOkYi/+pk0xtqogsJ4jq21XR5AM
         YgJ+yKHdJ2a6QEIwgNuH42eUMRznpJIYGUFBBLBKDkQQYI2UO3OcSCU3LES9+5FL9DTO
         +Z87PwGjhqhefDaYJZcrXR0urNl3c77ZutC4IisZ57KhVnC2IJEKifIgSuRbetHLsYT4
         9YYA==
X-Gm-Message-State: AOJu0YwvRkrMhUXBCKwzxyNyZJpTHvXWNO9D1AJQ9IZUzeRqy0jWv4Ma
	cG5euboUg4NjaEaTheXJDkTmUoLPUGU5OHjQsJY=
X-Google-Smtp-Source: AGHT+IHlL+ImA/CPcxfarB+e/hgMgxqPtMsguUi/WKnO1uda4s+8JfbbeIvR1RsLLQK9w5Vk2LXZrw==
X-Received: by 2002:a17:906:1d2:b0:9ad:ad5a:939b with SMTP id 18-20020a17090601d200b009adad5a939bmr9057275ejj.7.1696241357987;
        Mon, 02 Oct 2023 03:09:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z6-20020a1c4c06000000b00405959469afsm6888671wmf.3.2023.10.02.03.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 03:09:17 -0700 (PDT)
Date: Mon, 2 Oct 2023 13:09:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sagi Shahar <sagis@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-next 244/321] arch/x86/kvm/x86.c:13864
 pre_move_enc_context_from() warn: missing error code 'ret'
Message-ID: <2205ef3e-e70f-44a8-830f-f45a2c974554@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   f879e04c0619fde5c8eecb51a64da52a5ad4908e
commit: 659d9ec85eda12fe80f61b7373f1de7f56a1d5b9 [244/321] KVM: SEV: Refactor common code out of sev_vm_move_enc_context_from
config: x86_64-randconfig-161-20230924 (https://download.01.org/0day-ci/archive/20231002/202310021558.Tt0c8dgU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231002/202310021558.Tt0c8dgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310021558.Tt0c8dgU-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:13864 pre_move_enc_context_from() warn: missing error code 'ret'

Old smatch warnings:
arch/x86/kvm/x86.c:7777 emulator_read_write() warn: missing error code? 'rc'

vim +/ret +13864 arch/x86/kvm/x86.c

659d9ec85eda12 Sagi Shahar 2023-04-07  13840  int pre_move_enc_context_from(struct kvm *dst_kvm, struct kvm *src_kvm,
659d9ec85eda12 Sagi Shahar 2023-04-07  13841  			      atomic_t *dst_migration_in_progress,
659d9ec85eda12 Sagi Shahar 2023-04-07  13842  			      atomic_t *src_migration_in_progress)
659d9ec85eda12 Sagi Shahar 2023-04-07  13843  {
659d9ec85eda12 Sagi Shahar 2023-04-07  13844  	struct kvm_vcpu *src_vcpu;
659d9ec85eda12 Sagi Shahar 2023-04-07  13845  	unsigned long i;
659d9ec85eda12 Sagi Shahar 2023-04-07  13846  	int ret = -EINVAL;
659d9ec85eda12 Sagi Shahar 2023-04-07  13847  
659d9ec85eda12 Sagi Shahar 2023-04-07  13848  	ret = lock_two_vms_for_migration(dst_kvm, src_kvm,
659d9ec85eda12 Sagi Shahar 2023-04-07  13849  					 dst_migration_in_progress,
659d9ec85eda12 Sagi Shahar 2023-04-07  13850  					 src_migration_in_progress);
659d9ec85eda12 Sagi Shahar 2023-04-07  13851  	if (ret)
659d9ec85eda12 Sagi Shahar 2023-04-07  13852  		return ret;
659d9ec85eda12 Sagi Shahar 2023-04-07  13853  
659d9ec85eda12 Sagi Shahar 2023-04-07  13854  	ret = lock_vcpus_for_migration(dst_kvm, MIGRATION_TARGET);
659d9ec85eda12 Sagi Shahar 2023-04-07  13855  	if (ret)
659d9ec85eda12 Sagi Shahar 2023-04-07  13856  		goto unlock_vms;
659d9ec85eda12 Sagi Shahar 2023-04-07  13857  
659d9ec85eda12 Sagi Shahar 2023-04-07  13858  	ret = lock_vcpus_for_migration(src_kvm, MIGRATION_SOURCE);
659d9ec85eda12 Sagi Shahar 2023-04-07  13859  	if (ret)
659d9ec85eda12 Sagi Shahar 2023-04-07  13860  		goto unlock_dst_vcpu;
659d9ec85eda12 Sagi Shahar 2023-04-07  13861  
659d9ec85eda12 Sagi Shahar 2023-04-07  13862  	if (atomic_read(&dst_kvm->online_vcpus) !=
659d9ec85eda12 Sagi Shahar 2023-04-07  13863  	    atomic_read(&src_kvm->online_vcpus))
659d9ec85eda12 Sagi Shahar 2023-04-07 @13864  		goto unlock_dst_vcpu;

Should these

659d9ec85eda12 Sagi Shahar 2023-04-07  13865  
659d9ec85eda12 Sagi Shahar 2023-04-07  13866  	kvm_for_each_vcpu(i, src_vcpu, src_kvm) {
659d9ec85eda12 Sagi Shahar 2023-04-07  13867  		if (!src_vcpu->arch.guest_state_protected)
659d9ec85eda12 Sagi Shahar 2023-04-07  13868  			goto unlock_dst_vcpu;

be error paths?

659d9ec85eda12 Sagi Shahar 2023-04-07  13869  	}
659d9ec85eda12 Sagi Shahar 2023-04-07  13870  
659d9ec85eda12 Sagi Shahar 2023-04-07  13871  	return 0;
659d9ec85eda12 Sagi Shahar 2023-04-07  13872  
659d9ec85eda12 Sagi Shahar 2023-04-07  13873  unlock_dst_vcpu:
659d9ec85eda12 Sagi Shahar 2023-04-07  13874  	unlock_vcpus_for_migration(dst_kvm);
659d9ec85eda12 Sagi Shahar 2023-04-07  13875  unlock_vms:
659d9ec85eda12 Sagi Shahar 2023-04-07  13876  	unlock_two_vms_for_migration(dst_kvm, src_kvm,
659d9ec85eda12 Sagi Shahar 2023-04-07  13877  				     dst_migration_in_progress,
659d9ec85eda12 Sagi Shahar 2023-04-07  13878  				     src_migration_in_progress);
659d9ec85eda12 Sagi Shahar 2023-04-07  13879  
659d9ec85eda12 Sagi Shahar 2023-04-07  13880  	return ret;
659d9ec85eda12 Sagi Shahar 2023-04-07  13881  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

