Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA24D513
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Oct 2023 06:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVwpC6AN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4075c58ac39so6561115e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 23:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697092064; x=1697696864; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qh/FqmK5/lSlV2dRf/mKoA/boJ1aJkcrMskY/i85Ijc=;
        b=DVwpC6ANbz7FjxucBZKIEbY8eiLkef/wb2SG1t80L9CIjuQUVTQ5iitYyTMsX9BmCL
         ubETseGWdXhHjz2WcckEfGk8W0d4/x9/d6Z8TZw4CYv+L9Xy10SjVjn5jITkzrKIBjij
         FraZJrFgRXn163Lfc5gF2NKSooGJNi6yA2RDy5ujlu/RlVpIbEavc/X66RQqroXlOjSM
         yh2Tnb9+/UJJYX42SSZPwZArB1zG45duleavVxNSzuASx5o2m+cMjuCgX74N0X3O8AAQ
         Dx4D06obnlIr71aYvbRVIYq/KSmyFICMGJAxgNgQ4jCxXnF7h7oc9CFwoPnJ/SP26d63
         70jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697092064; x=1697696864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qh/FqmK5/lSlV2dRf/mKoA/boJ1aJkcrMskY/i85Ijc=;
        b=DLHu7FIyRIvok5rUr56bFmiO5UUIXYopW6LCVae73m27BhDVhObBhWCDzh0lffYRA/
         viIl3idEceGnFIMFoI2Gwxa8RTVMI2N4XGb5xFfOhqUI5WP+bHMikeRm8BhfzWmp5ECs
         csAJn9mFwUgpiJKdgmfzfNWmkCa9pHhgqkhAiYrPj9rYsD6042TmoP6Sw7MGGZ28DHPz
         vd1Ix853t8XB+PHrtCeITEs+hpvD8frqpCXP1mcEgbb28i7WuRVprKiWs1mmpRJAh991
         7YBV9V7SdNWWAn4pbQgU7jab/k5YKt4J7wUd4pmIXEgjlZaKa1JzprCQS/rFRfc0mAB2
         xuEw==
X-Gm-Message-State: AOJu0YzO/1I2D6qLFS5MA8ThiIQsE7Hz9NQ6WueWj1kecydgEN0fjqwf
	3hHGwkJ9ypBOqpznfn6VkwfUDT40zL7jO4OvOuE=
X-Google-Smtp-Source: AGHT+IFKOom+QTQFKBsgi61DlMK8S8xzCP5xg6dkfXy5nGPIUU2fUpDRZMujLqBLW2h7XQbeUiqHbg==
X-Received: by 2002:adf:9bc3:0:b0:32d:87df:6de5 with SMTP id e3-20020adf9bc3000000b0032d87df6de5mr2654429wrc.49.1697092064534;
        Wed, 11 Oct 2023 23:27:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f8-20020adfe908000000b0032d8ce46caasm1470343wrm.93.2023.10.11.23.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:27:44 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:27:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Li zeming <zeming@nfschina.com>,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Li zeming <zeming@nfschina.com>
Subject: Re: [PATCH] profile: Remove =?utf-8?Q?unne?=
 =?utf-8?B?Y2Vzc2FyeSDigJgw4oCZ?= values from err
Message-ID: <767e9a6f-5470-491e-a08a-e5a8ee48b1cb@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919014126.8168-1-zeming@nfschina.com>

Hi Li,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-zeming/profile-Remove-unnecessary-0-values-from-err/20230919-094202
base:   linus/master
patch link:    https://lore.kernel.org/r/20230919014126.8168-1-zeming%40nfschina.com
patch subject: [PATCH] profile: Remove unnecessary ‘0’ values from err
config: i386-randconfig-141-20230921 (https://download.01.org/0day-ci/archive/20231012/202310120931.henXte1M-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120931.henXte1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310120931.henXte1M-lkp@intel.com/

smatch warnings:
kernel/profile.c:491 create_proc_profile() error: uninitialized symbol 'err'.

vim +/err +491 kernel/profile.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  467  
1997ab2b2a8d46 Li zeming                 2023-09-19  468  	int err;
^1da177e4c3f41 Linus Torvalds            2005-04-16  469  
^1da177e4c3f41 Linus Torvalds            2005-04-16  470  	if (!prof_on)
^1da177e4c3f41 Linus Torvalds            2005-04-16  471  		return 0;
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  472  #ifdef CONFIG_SMP
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  473  	err = cpuhp_setup_state(CPUHP_PROFILE_PREPARE, "PROFILE_PREPARE",
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  474  				profile_prepare_cpu, profile_dead_cpu);
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  475  	if (err)
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  476  		return err;
c270a817196a93 Srivatsa S. Bhat          2014-03-11  477  
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  478  	err = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "AP_PROFILE_ONLINE",
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  479  				profile_online_cpu, NULL);
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  480  	if (err < 0)
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  481  		goto err_state_prep;
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  482  	online_state = err;
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  483  	err = 0;
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  484  #endif

err is uninitialized on single processor systems.

c33fff0afbef4f Denis V. Lunev            2008-04-29  485  	entry = proc_create("profile", S_IWUSR | S_IRUGO,
97a32539b9568b Alexey Dobriyan           2020-02-03  486  			    NULL, &profile_proc_ops);
1ad82fd547c716 Paolo Ciarrocchi          2008-01-25  487  	if (!entry)
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13  488  		goto err_state_onl;
271a15eabe0945 David Howells             2013-04-12  489  	proc_set_size(entry, (1 + prof_len) * sizeof(atomic_t));
c270a817196a93 Srivatsa S. Bhat          2014-03-11  490  
e722d8daafb974 Sebastian Andrzej Siewior 2016-07-13 @491  	return err;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

