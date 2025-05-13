Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DF33985
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 08:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123223; cv=none; b=lASFYKbtCEkYzO1Qs4iYBLjj2KQCbsflElXnzG0N8MLynL5sw8bhLQFRt4vx+fqCXABsjqoa7qK+03CAgWJ67xXaC955Vp59wVB9VW7btoLmVkgK9okwuDBuXxp7Jomp38tN0b2Hc5TRexlfG+kZ1NgALlfpgjWxEncnfmZjqrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123223; c=relaxed/simple;
	bh=1lBQoHN/7PWHMGfYzcAiy+RWiPyzpT1oQU8AO2uIjmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DFOwYs1THtEnPLOku2WQZdYpM1FYsrW5GPmm1gWgHTRiFFsmfS5TFu2tVQkzp7LmRpJuOivJ50ofq1A+VkmpLrCtvxIpo1DY3QruwZ/a3YABPXSxbShR3ncS8sk1SLN8iiw1s26CBNN/ZbqVoNFBvbKXP6gC8FrF+Nmlecnz9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DVak8SK4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVak8SK4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso55327275e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747123216; x=1747728016; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4D7BVolXRAAtXfmL3BcLl8Eiqaw3L/l8xoeqAeraOx0=;
        b=DVak8SK4iR84sEN4drMvimgtJmNrw6RK3g8pjQSX6gLSmyPLgMGaFhrPaF8AsWas1Z
         7rS4JYXxrhqO4EKyIBWCJzNmCB0ZY+cWNalLCuEhJSIoqLyZnlKVN6b4IBgN/6s/1lJT
         +BAk1siU+Xf0k9WwQ8UEOUk4Qtp4LzX4fwdgZnvyzIrS+N3VLQyaK9JYObk0c7q61PKf
         s5txMpo4WXOIckc1PvXeGJCezkJ83+QKxPPQNsek1W4tp75gKRY8lD88X8lFXuH54ifF
         OHlgb5jrN3o3wdfun5gSf5aVV+ZqCtvHQGjAM6YZ4V3PVLgYsm6q9O5tGJOPiohxOmKZ
         zwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123216; x=1747728016;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4D7BVolXRAAtXfmL3BcLl8Eiqaw3L/l8xoeqAeraOx0=;
        b=mZmvWS+OUO9s7H0R56EIUeIH5S7wk6mETRPZ+1hzOp7pDTSjgVIkADWKPimej/IOLk
         vgIMZw+A1qtTWeUjDOXKWhgzAyAYAPVT5ofkI2g7RmdjZeGanBWAZsmd/CPTy+ua/unq
         PsKCjKRlMMI7YKMeicE7wHYb9jq0lSNQ6hR6VTAVIBrml7Bn1OFKctYhs9sadnobCsmg
         xeFK+OrmkaRrpNzzR6UqWZrstYnrZi3Xs/GdtobtRblUXJjck9SAWN2eVRMFv3noZMIh
         1g7ESc0Rr8hQPrZWVg/YIbvcpjk2d4Lm9ajTWeM5fCTVyERN7qw/+orKsVk78LaPa1zz
         56pA==
X-Gm-Message-State: AOJu0YwWPkSmziSgzi0etLK3Er2SIuvAV09GKqojH3dKtRx3FLnPSe5j
	9W4bWd6rqAllRNMe15CgpziwQdImQxQjVMc/KfIVdkDJtHdVgX8ebESabx05b5QPjiDThJnEo5J
	ysFuNEw==
X-Gm-Gg: ASbGncskNIk+9hjxmcq1ZCp+eyyLob/SeLIfijVWo8QzqJaZVy5SVjPh/BG+9dTzkbH
	2hnogNye5fpHaTgVWpNc7+8cDfU9HzgyVtHCRJN9edjkTGP2agU/FW3bDZTds9Fo9iQl5+QO7rF
	NO3GFoMHbG0FYzZBjbWSBE7zKj1lJtnqUWnzwXYpoNciM+2lgKrZ3iEubdUn6XCGYo8vQVk7PxZ
	G/pjHlPERMsGsTjqgsHYl9ek26zr0/gfS59Dup0phWGrJ3VXsXBpFhoV8lU0My8Im9WC+wa07Ys
	+/95mfjbrG/w2ps66cE4BJx+4gg3J+Grd4K9Q0giwV0fU7jwAsxUEDzJDyrizY72PYqKf9vfyu2
	OPg74xw==
X-Google-Smtp-Source: AGHT+IHqpoT66C/0UgUmKDin0anmvZ+Q/xF1r2yiozJRTYT3VriCuDezWmWMXYySr2wsYFAG39vUEA==
X-Received: by 2002:a05:600c:cca:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-442d6cfa8d8mr120252085e9.1.1747123215819;
        Tue, 13 May 2025 01:00:15 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm194214025e9.33.2025.05.13.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 01:00:15 -0700 (PDT)
Date: Tue, 13 May 2025 11:00:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Swapnil Sapkal <swapnil.sapkal@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>
Subject: [superm1:linux-next 4/4] drivers/cpufreq/amd-pstate-ut.c:262
 amd_pstate_ut_check_driver() error: uninitialized symbol 'ret'.
Message-ID: <9fa7e533-96c4-497b-9e6c-687065d46454@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
head:   d26d16438bc5fd5524121244cc133f9872a63210
commit: d26d16438bc5fd5524121244cc133f9872a63210 [4/4] amd-pstate-ut: Reset amd-pstate driver mode after running selftests
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110608.VZ20jjP5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505110608.VZ20jjP5-lkp@intel.com/

smatch warnings:
drivers/cpufreq/amd-pstate-ut.c:262 amd_pstate_ut_check_driver() error: uninitialized symbol 'ret'.

vim +/ret +262 drivers/cpufreq/amd-pstate-ut.c

a7875346c68910 Mario Limonciello 2025-02-14  242  static int amd_pstate_ut_check_driver(u32 index)
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  243  {
93497752dfed19 Qianqiang Liu     2024-09-11  244  	enum amd_pstate_mode mode1, mode2 = AMD_PSTATE_DISABLE;
d26d16438bc5fd Swapnil Sapkal    2025-04-30  245  	enum amd_pstate_mode orig_mode = amd_pstate_get_status();
d26d16438bc5fd Swapnil Sapkal    2025-04-30  246  	int ret;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  247  
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  248  	for (mode1 = AMD_PSTATE_DISABLE; mode1 < AMD_PSTATE_MAX; mode1++) {
a7875346c68910 Mario Limonciello 2025-02-14  249  		int ret = amd_pstate_set_mode(mode1);

int accidentally declared twice.

3e39e68dfbb6d4 Mario Limonciello 2024-08-31  250  		if (ret)
a7875346c68910 Mario Limonciello 2025-02-14  251  			return ret;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  252  		for (mode2 = AMD_PSTATE_DISABLE; mode2 < AMD_PSTATE_MAX; mode2++) {
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  253  			if (mode1 == mode2)
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  254  				continue;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  255  			ret = amd_pstate_set_mode(mode2);
d26d16438bc5fd Swapnil Sapkal    2025-04-30  256  			if (ret)
d26d16438bc5fd Swapnil Sapkal    2025-04-30  257  				goto out;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  258  		}
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  259  	}
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  260  
d26d16438bc5fd Swapnil Sapkal    2025-04-30  261  out:
d26d16438bc5fd Swapnil Sapkal    2025-04-30 @262  	if (ret)

Uninitialized.

d26d16438bc5fd Swapnil Sapkal    2025-04-30  263  		pr_warn("%s: failed to update status for %s->%s: %d\n", __func__,
d26d16438bc5fd Swapnil Sapkal    2025-04-30  264  			amd_pstate_get_mode_string(mode1),
d26d16438bc5fd Swapnil Sapkal    2025-04-30  265  			amd_pstate_get_mode_string(mode2), ret);
d26d16438bc5fd Swapnil Sapkal    2025-04-30  266  
d26d16438bc5fd Swapnil Sapkal    2025-04-30  267  	amd_pstate_set_mode(orig_mode);
d26d16438bc5fd Swapnil Sapkal    2025-04-30  268  	return ret;
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  269  }
3e39e68dfbb6d4 Mario Limonciello 2024-08-31  270  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

