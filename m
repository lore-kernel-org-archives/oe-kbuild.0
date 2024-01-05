Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DD01DDDC
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jan 2024 07:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0aXX4E/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a27e323fdd3so130860066b.2
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Jan 2024 23:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704439702; x=1705044502; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D8KITSOusAldo+TqYE/5U2EXjKl/xJ/pl8u9x608Wlo=;
        b=H0aXX4E/3OVMILi2gT94uFbyZC5UFwHZvk14tU9CtRbPWwjPwEu3QjoCiI8xHVj6Sm
         +9cf1fVhwORgejfVIg40HRL+n+N3TxSm/PnqVcfZ9wa0Kn1ysV73G0WpoCRlNl3dGFU3
         TXtRuxzca/M7+Fm8kEnZt49AvNbDdL2bHDmYvOuhRKWvB9AZovdVgbCnl43dB8Vs6hit
         /Xl912H8BzTw1fEsKaOKjseBGsFqssZqraR0ICs/yUspkNq0kxRo/Z+uV7lhicR/FYay
         4eQSyS/JRLmwzoDuzyy0wsa+VL/hKp+g3F1+LI6v5RRYhpx+hOVTh3sO3+lhzBBdfJsF
         LUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704439702; x=1705044502;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8KITSOusAldo+TqYE/5U2EXjKl/xJ/pl8u9x608Wlo=;
        b=JsvKPi1+D/YrqcZVcrtyfQvfLWbXkCV/3lSzfIa3AMc2QJv1spqFZ3+C3/a/1h7u9b
         HMzEHxNFDbbuldEtva227aK0efwWRU2mNn2kCJefCj0QguAyWDQzLGcucEDpurNhq/sm
         CsMU+EyAGkE/xc0iy+lmuJUTzD9F7SCJ4lDV1dFg/8/2atq3pzhWZjjLmYDIzkXOtD4B
         Nf/6ZoLH+lysGCW3UgUHY3wQyvwVTymccIq05A3ug3VLNkVopd0CQcX0i9yTFR+aPxQ5
         K5+UMLrvm1EjPNtJKslSHBOlrAL6vk6T04lY6MsJ/IrPpXPQlLRzGjcd0vPjMIe0f2oM
         mMhg==
X-Gm-Message-State: AOJu0YzG1Yc5jjAcATGg1Fjxr3cFOnj1r/lLHj1w4jsjg8db5nBLW55b
	05WScGxhXKVcCpTlSy1M7IFCRrlJEdHUvWumrR+ujGlpZlg=
X-Google-Smtp-Source: AGHT+IEFNOe2Swmoz60lwY+cYiY2ajV3wAAeiUteotMRlpQjLMev3o+Q8DUHSj+nwEre9zlaHDUgyA==
X-Received: by 2002:a17:906:1597:b0:a28:e146:70e0 with SMTP id k23-20020a170906159700b00a28e14670e0mr785010ejd.68.1704439702118;
        Thu, 04 Jan 2024 23:28:22 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id vr3-20020a170906bfe300b00a26e53be089sm552682ejb.44.2024.01.04.23.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 23:28:21 -0800 (PST)
Date: Fri, 5 Jan 2024 10:28:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yury Norov <yury.norov@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [norov:group_cpus 8/9] lib/group_cpus.c:352 group_cpus_evenly()
 error: uninitialized symbol 'npresmsk'.
Message-ID: <6c28687b-f6d1-46ad-89a9-3ebd24bdd79c@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux group_cpus
head:   1117349d164c1dec91f4ace657c7964c587cee24
commit: 4c2e6aa6ff56057cd68a80f19e9d06ef4ce51d46 [8/9] lib/group_cpus: rework group_cpus_evenly()
config: i386-randconfig-141-20240104 (https://download.01.org/0day-ci/archive/20240105/202401050452.IcgrcQON-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401050452.IcgrcQON-lkp@intel.com/

New smatch warnings:
lib/group_cpus.c:352 group_cpus_evenly() error: uninitialized symbol 'npresmsk'.

Old smatch warnings:
lib/group_cpus.c:353 group_cpus_evenly() error: uninitialized symbol 'nmsk'.
lib/group_cpus.c:378 group_cpus_evenly() warn: unsigned 'nr_present' is never less than zero.
lib/group_cpus.c:395 group_cpus_evenly() warn: unsigned 'nr_others' is never less than zero.

vim +/npresmsk +352 lib/group_cpus.c

f7b3ea8cf72f3d Ming Lei   2022-12-27  348  struct cpumask *group_cpus_evenly(unsigned int numgrps)
f7b3ea8cf72f3d Ming Lei   2022-12-27  349  {
4c2e6aa6ff5605 Yury Norov 2023-12-25  350  	cpumask_var_t *node_to_cpumask __free(free_node_to_cpumask) = alloc_node_to_cpumask();
4c2e6aa6ff5605 Yury Norov 2023-12-25  351  	struct cpumask *masks __free(kfree) = kcalloc(numgrps, sizeof(*masks), GFP_KERNEL);
4c2e6aa6ff5605 Yury Norov 2023-12-25 @352  	cpumask_var_t npresmsk __free(free_cpumask_var);
4c2e6aa6ff5605 Yury Norov 2023-12-25  353  	cpumask_var_t nmsk __free(free_cpumask_var);

__free() functions have to be initialized before the first return.
(Generally they are just initialized to NULL at the start).

	cpumask_var_t npresmsk __free(free_cpumask_var) = NULL;
	cpumask_var_t nmsk __free(free_cpumask_var) = NULL;

Otherwise it's an unitialized variable bug.

4c2e6aa6ff5605 Yury Norov 2023-12-25  354  	unsigned int curgrp, nr_present, nr_others;
4c2e6aa6ff5605 Yury Norov 2023-12-25  355  
4c2e6aa6ff5605 Yury Norov 2023-12-25  356  	if (!masks || !node_to_cpumask || !alloc_cpumask_var(&nmsk, GFP_KERNEL)
4c2e6aa6ff5605 Yury Norov 2023-12-25  357  			|| !alloc_cpumask_var(&npresmsk, GFP_KERNEL))
f7b3ea8cf72f3d Ming Lei   2022-12-27  358  		return NULL;
f7b3ea8cf72f3d Ming Lei   2022-12-27  359  
f7b3ea8cf72f3d Ming Lei   2022-12-27  360  	build_node_to_cpumask(node_to_cpumask);
f7b3ea8cf72f3d Ming Lei   2022-12-27  361  
0263f92fadbb9d Ming Lei   2023-11-20  362  	/*
0263f92fadbb9d Ming Lei   2023-11-20  363  	 * Make a local cache of 'cpu_present_mask', so the two stages

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

