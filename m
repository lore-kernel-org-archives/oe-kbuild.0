Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5026F3D0D6
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xVAMt53r"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b4c2ef5cdso17851515e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 09:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701278235; x=1701883035; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQjYLlkvdy9WsOfefeV5jPzAVy1sCma1k4+24riX/0E=;
        b=xVAMt53rxslpnMx4WQ1runsi6Rg8iYo70pFNSFnla3A6W6dma62AkPU66jCX3yDGtd
         1a2F17USfIDYD5nA2NytVhmiPrMPCpcRhVE7nm8PVUg6ftxKuNjrCMnrq8KMHGPDlmsY
         aC+EgYR3axPCAcVmTSFiM61p9x8zSI+cwRK0RVUo5LjNgIuS+hptipgTdBGI3JEGVhSA
         HTTLAy18fLc83v9gtqXB3CxVzCNEpoQYeLo1deSMF2JyCB6cSIXFvvhaGzhjp0OB8R1B
         LATq+C8wvmi0uWQgxJXbE6zJuzqxFZ/t1h9xTvzuaMBG/coLoasx+KHsB9VpmaQI0rzA
         1ORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701278235; x=1701883035;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQjYLlkvdy9WsOfefeV5jPzAVy1sCma1k4+24riX/0E=;
        b=uGtKgY3/68bLVsnZj9h1Q1LtFjqBU2UTASEtJwm8Ixn8XPLjR/sAAIxaZRmdVAkpj9
         IiSJtNW45mNK/pGQpHBZ6Z9UijtITVSK1oAK5WMY8u8IzQ06ppDHQyDhPMBUAsVhCNFC
         M7hLEV4FYtbyAp6l1Uv6/DM/2Py1CtHrGptAUYRO1ffXRL3ecycF90K7JHcyaXq5K3Z6
         b0jWtuuxLviOqnjMWHJZCDuBu+HQCAapSv2cmBCjNyJiJ+jIkCpq8uxkLPXE6PaQVKgE
         rhZ/SyYirextHEAA3D50J8qZLEl/HEpdMLrxMnV0VU8kXYf6xf6m8y//pIAYqTEUVgVq
         rpjA==
X-Gm-Message-State: AOJu0Yw6+qmL4MCBVhbVIRn4s72978oReB0IyAMiaIfUWFrEz0D6TwRI
	UPouYzlDPvVRnNtcl1FEsVvwHBudlqkOe/qdFcY=
X-Google-Smtp-Source: AGHT+IFiGMtcc/w6A0g2PQpHuJr2aGoT/Qk6jsvbe4KFeQcAp1sf/PVRvdbL95OFk1itqG+rJAP3cg==
X-Received: by 2002:a05:6000:c12:b0:332:ffcc:861b with SMTP id dn18-20020a0560000c1200b00332ffcc861bmr8160569wrb.1.1701278235435;
        Wed, 29 Nov 2023 09:17:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j1-20020adfe501000000b003331b0e30e6sm1763724wrm.32.2023.11.29.09.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 09:17:15 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Nov 2023 20:17:11 +0300
To: oe-kbuild@lists.linux.dev, Meng Li <li.meng@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V11 5/7] cpufreq: amd-pstate: Update amd-pstate preferred
 core ranking dynamically
Message-ID: <0c9be646-1687-4ea1-9736-345714619b2b@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129065437.290183-6-li.meng@amd.com>

Hi Meng,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Meng-Li/x86-Drop-CPU_SUP_INTEL-from-SCHED_MC_PRIO-for-the-expansion/20231129-160700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231129065437.290183-6-li.meng%40amd.com
patch subject: [PATCH V11 5/7] cpufreq: amd-pstate: Update amd-pstate preferred core ranking dynamically
config: i386-randconfig-141-20231129 (https://download.01.org/0day-ci/archive/20231130/202311300033.L6FNuSrE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300033.L6FNuSrE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311300033.L6FNuSrE-lkp@intel.com/

smatch warnings:
drivers/cpufreq/amd-pstate.c:763 amd_pstate_update_highest_perf() error: potentially dereferencing uninitialized 'cpudata'.

vim +/cpudata +763 drivers/cpufreq/amd-pstate.c

b631665e8af8a7 Meng Li 2023-11-29  756  static void amd_pstate_update_highest_perf(unsigned int cpu)
b631665e8af8a7 Meng Li 2023-11-29  757  {
b631665e8af8a7 Meng Li 2023-11-29  758  	struct cpufreq_policy *policy;
b631665e8af8a7 Meng Li 2023-11-29  759  	struct amd_cpudata *cpudata;
b631665e8af8a7 Meng Li 2023-11-29  760  	u32 prev_high = 0, cur_high = 0;
b631665e8af8a7 Meng Li 2023-11-29  761  	int ret;
b631665e8af8a7 Meng Li 2023-11-29  762  
b631665e8af8a7 Meng Li 2023-11-29 @763  	if ((!amd_pstate_prefcore) || (!cpudata->hw_prefcore))
                                                                                ^^^^^^^^^^^^^^^^^^^^
Uninitialized.

Normally the Clang devs would be the first to report this but they're
sleeping on the ball this time.  :P  #FRISTPOST #LOL

b631665e8af8a7 Meng Li 2023-11-29  764  		return;
b631665e8af8a7 Meng Li 2023-11-29  765  
b631665e8af8a7 Meng Li 2023-11-29  766  	ret = amd_pstate_get_highest_perf(cpu, &cur_high);
b631665e8af8a7 Meng Li 2023-11-29  767  	if (ret)
b631665e8af8a7 Meng Li 2023-11-29  768  		return;
b631665e8af8a7 Meng Li 2023-11-29  769  
b631665e8af8a7 Meng Li 2023-11-29  770  	policy = cpufreq_cpu_get(cpu);
b631665e8af8a7 Meng Li 2023-11-29  771  	cpudata = policy->driver_data;
b631665e8af8a7 Meng Li 2023-11-29  772  	prev_high = READ_ONCE(cpudata->prefcore_ranking);
b631665e8af8a7 Meng Li 2023-11-29  773  
b631665e8af8a7 Meng Li 2023-11-29  774  	if (prev_high != cur_high) {
b631665e8af8a7 Meng Li 2023-11-29  775  		WRITE_ONCE(cpudata->prefcore_ranking, cur_high);
b631665e8af8a7 Meng Li 2023-11-29  776  
b631665e8af8a7 Meng Li 2023-11-29  777  		if (cur_high < CPPC_MAX_PERF)
b631665e8af8a7 Meng Li 2023-11-29  778  			sched_set_itmt_core_prio((int)cur_high, cpu);
b631665e8af8a7 Meng Li 2023-11-29  779  	}
b631665e8af8a7 Meng Li 2023-11-29  780  
b631665e8af8a7 Meng Li 2023-11-29  781  	cpufreq_cpu_put(policy);
b631665e8af8a7 Meng Li 2023-11-29  782  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

