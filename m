Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC585392;
	Wed, 22 Feb 2023 13:56:14 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t13so7746827wrv.13;
        Wed, 22 Feb 2023 05:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfx9GIQthScNznDFCqzH5flRQGeg4eShNoLLTObVoqA=;
        b=Ha643dO7qOiXprayRf0OAdAt/+8RG80sykrJEsfP9GWJt8VQeVB4fmFnwVCIwAwtdP
         +KNCzM/C1wuEDeHxEhQ5BFPmOiv3TlJ9l2zcwDLtlI2vkS9/d+BCdQbxBj/zFNOrTix/
         TOd+VSkQjuBxGyHbEwcMRioKmorTeRuwqyewWEbVzOVTIQzwu/IPRvQhw6KY/Dh9LrL3
         JmPQyEnw9Ij8mAIiXtmx7DNQRNBLfXd1GXfNyRJ4v7Y1OfCKNZ0CBrR5KrqIHOaJxs8v
         GTgdKBy6t0ZK0IqxUTphw6APtCGyLm38tXwPU5QAxL1iCFFYRPExfjamJs+8wG/LCxkV
         MIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfx9GIQthScNznDFCqzH5flRQGeg4eShNoLLTObVoqA=;
        b=DkqC81rzip02+irCoU/LuETmfyPd/XBGCh70BXVUt1LHkf73TpWWdGuJj82Fn6E4uM
         vDeEynCJ6d5Pbb4MiDc14rbhsi73Qm6jlXbOB/d5nVsAfcX+Ou2QPYZg58pl4Iy970L+
         e/HXHw3/cWdTdQV81XQBVucuKIMPBbBlQaD9Ji4KsVXttcSVmc+xFLNzsKeMl9TepCNq
         w2zl3CQa5EbUvJtgZcN9r91/mCCv8ZfVusUXz6SpClVdF1lml8HXYJmKPl2BoPWPyBi+
         zJpNiRLIQQU10hsTvRFbSwbKM/QTOtLWeO2nOnMvEp4ZztWPDZjQZwcZp66yzAik+Ezg
         FQ8Q==
X-Gm-Message-State: AO0yUKUxx1MfrHrcv9LruA1rwB4Y93jMFFLpzgzsqNPCXshNNoBUSmai
	FbbEbsT5kv0RiF/y9v2wC1VG+tpf3+A=
X-Google-Smtp-Source: AK7set/BZUgjOOWNxLFNSLaMwtt4XeAzoHzo3TtmzM8CLiXfvOuloxjE/JqxKdWQIMBs/BXixCtbiQ==
X-Received: by 2002:a5d:5141:0:b0:2c5:9fc4:8844 with SMTP id u1-20020a5d5141000000b002c59fc48844mr7525389wrt.9.1677074172064;
        Wed, 22 Feb 2023 05:56:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d4b8f000000b002c561805a4csm9490203wrt.45.2023.02.22.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 05:56:11 -0800 (PST)
Date: Wed, 22 Feb 2023 16:56:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: arch/arm64/kernel/acpi.c:443 acpi_ffh_address_space_arch_setup()
 warn: possible memory leak of 'ffh_ctxt'
Message-ID: <202302191417.dAl9NuE8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230222135607.kuym82pY75OlzD1LBH3WZZhVXKXSE7fCh8byAXAPc-Q@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: 45494d77f279d0420f06376dcf105b23e300c5a4 Merge branches 'acpi-scan', 'acpi-bus', 'acpi-tables' and 'acpi-sysfs'
config: arm64-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191417.dAl9NuE8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191417.dAl9NuE8-lkp@intel.com/

New smatch warnings:
arch/arm64/kernel/acpi.c:443 acpi_ffh_address_space_arch_setup() warn: possible memory leak of 'ffh_ctxt'

Old smatch warnings:
arch/arm64/kernel/acpi.c:448 acpi_ffh_address_space_arch_setup() warn: possible memory leak of 'ffh_ctxt'

vim +/ffh_ctxt +443 arch/arm64/kernel/acpi.c

1d280ce099db39 Sudeep Holla 2022-11-10  433  int acpi_ffh_address_space_arch_setup(void *handler_ctxt, void **region_ctxt)
1d280ce099db39 Sudeep Holla 2022-11-10  434  {
1d280ce099db39 Sudeep Holla 2022-11-10  435  	enum arm_smccc_conduit conduit;
1d280ce099db39 Sudeep Holla 2022-11-10  436  	struct acpi_ffh_data *ffh_ctxt;
1d280ce099db39 Sudeep Holla 2022-11-10  437  
1d280ce099db39 Sudeep Holla 2022-11-10  438  	ffh_ctxt = kzalloc(sizeof(*ffh_ctxt), GFP_KERNEL);
1d280ce099db39 Sudeep Holla 2022-11-10  439  	if (!ffh_ctxt)
1d280ce099db39 Sudeep Holla 2022-11-10  440  		return -ENOMEM;
1d280ce099db39 Sudeep Holla 2022-11-10  441  
1d280ce099db39 Sudeep Holla 2022-11-10  442  	if (arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
1d280ce099db39 Sudeep Holla 2022-11-10 @443  		return -EOPNOTSUPP;

Do these checks before the ffh_ctxt = kzalloc()?

1d280ce099db39 Sudeep Holla 2022-11-10  444  
1d280ce099db39 Sudeep Holla 2022-11-10  445  	conduit = arm_smccc_1_1_get_conduit();
1d280ce099db39 Sudeep Holla 2022-11-10  446  	if (conduit == SMCCC_CONDUIT_NONE) {
1d280ce099db39 Sudeep Holla 2022-11-10  447  		pr_err("%s: invalid SMCCC conduit\n", __func__);
1d280ce099db39 Sudeep Holla 2022-11-10  448  		return -EOPNOTSUPP;

Same

1d280ce099db39 Sudeep Holla 2022-11-10  449  	}
1d280ce099db39 Sudeep Holla 2022-11-10  450  
1d280ce099db39 Sudeep Holla 2022-11-10  451  	if (conduit == SMCCC_CONDUIT_SMC) {
1d280ce099db39 Sudeep Holla 2022-11-10  452  		ffh_ctxt->invoke_ffh_fn = __arm_smccc_smc;
1d280ce099db39 Sudeep Holla 2022-11-10  453  		ffh_ctxt->invoke_ffh64_fn = arm_smccc_1_2_smc;
1d280ce099db39 Sudeep Holla 2022-11-10  454  	} else {
1d280ce099db39 Sudeep Holla 2022-11-10  455  		ffh_ctxt->invoke_ffh_fn = __arm_smccc_hvc;
1d280ce099db39 Sudeep Holla 2022-11-10  456  		ffh_ctxt->invoke_ffh64_fn = arm_smccc_1_2_hvc;
1d280ce099db39 Sudeep Holla 2022-11-10  457  	}
1d280ce099db39 Sudeep Holla 2022-11-10  458  
1d280ce099db39 Sudeep Holla 2022-11-10  459  	memcpy(ffh_ctxt, handler_ctxt, sizeof(ffh_ctxt->info));
1d280ce099db39 Sudeep Holla 2022-11-10  460  
1d280ce099db39 Sudeep Holla 2022-11-10  461  	*region_ctxt = ffh_ctxt;
1d280ce099db39 Sudeep Holla 2022-11-10  462  	return AE_OK;
1d280ce099db39 Sudeep Holla 2022-11-10  463  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

