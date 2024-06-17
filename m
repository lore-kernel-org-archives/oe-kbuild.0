Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9165813AD3E
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718633364; cv=none; b=cTZeryOjI2/UIDW42dVPM0akM5Hx6fs6KDP7uFeP8aDbyON47VQep7F6YIyLNDe59QfvRTBKCiF1fyvtkuJjFXSJwxhnWlY1qrd9JPZETtUwxDz+LpSGUmB5wAZVLPa/XMznA4pX5gG6F48eAmUcVBzbW18HDf+vr2PqgOKeic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718633364; c=relaxed/simple;
	bh=JNLtlCaocgHRSAUl/maYg/yXvEqsvEDMA01DcyYsPSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=F1HCC79OWf0VSr9BOADHTHfk2QIxs+3VkZteuc5STvZNV/jvsUpurEq3Nghqi5PsON28O+efF8YnLTKBYMyD9unsk+D9nk0GQ1yFtd52Xq6R8mtasVN0CoefuUP0VH5lQhWFNaBa/5N11LXYT65NgGQlj/bDmVqI/eRxYPykjn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Br/V2avH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Br/V2avH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4217a96de38so32107825e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 07:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718633360; x=1719238160; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1gYFbVZSR1dJf0iOwy3Gs/2RtGXxduy8gw+Ee2OK2y0=;
        b=Br/V2avHGXV4WC+kCJZlWy2YV1z/j2rsTU3I9lUnNSgfRWiZJFyZc0jXhelqK4aT50
         wVFTZlxTI7uh+WeCKTNfxVMKBYntnybfVv56vZAz0q/qcnlf0TPOo9J8aoHf2+wfAwhW
         Zl5JPNTFo9+p3RBVfmXcvgIr53xXpDS48Mg2cN5cAiSdQxJlIYjmHuXaQB/62gUETmiT
         agNuwkHKD09+aIHr1Comu65249WBDtKoLioho2oR0UP0nLMPf7i8TeqR6+NpJLQ8j7KA
         sAdmPfEH0v88dlOBiQnEDGSRIYB9BSHAG8gBg8+vwqK1DgLHxzR/qqeICZv+f0IMGNyZ
         A+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633360; x=1719238160;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gYFbVZSR1dJf0iOwy3Gs/2RtGXxduy8gw+Ee2OK2y0=;
        b=P3aLe/W1CbV6x1ca9i1GmdZJjXGbuD5C8DB8hDWyrKTbs+k0vHNgsfy4pUqelPGlRs
         JfUcuahjQNKcuLz3FK5wULJeRcNO5o8ioJjhe6IbRABTEASjTfPxxQrHh7m59nABLrEg
         3wcgIwUcgCLlDDA76FybDWawEQixhlQGAvoCk6XGhbyZ/ITrxaDKQxfVaolng0B+EohJ
         BkvjWwJAVdx8ig7tiC+PN74COA1eY/q12eB5bAH3AO8OkQA9tRm/5eFMOgSRqdDg4PV/
         ldiRY8bxKp3avUkrreZb9hpvhI3qOneTRqtP810Xpo0BN/QbHwkI22Q1B1YahX3pbk8q
         s8Fw==
X-Gm-Message-State: AOJu0YxS3BuU4vU1emDmK/L+XznfzswHlWtUUL79fC6p6OfEC5zNaWVx
	fbB1eum27FuOyWT8sFgQHV5BDPqEIWeETWgKgHVe7af8iHPMNWcqJ16CP9NPYokHlQxO7Ti0J3C
	t
X-Google-Smtp-Source: AGHT+IF89ub/bTYppiV6Zahl61F3KmzNpcO+gb7uLo/5I8P47UFh48RCrUXbcRA1pdZXpLdtZkFucQ==
X-Received: by 2002:a05:600c:3550:b0:421:e3d6:920b with SMTP id 5b1f17b1804b1-42304811e38mr79919105e9.3.1718633359775;
        Mon, 17 Jun 2024 07:09:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de646sm199893195e9.35.2024.06.17.07.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:09:19 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:09:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 08/12] drm/ttm: Add a virtual base class for graphics
 memory backup
Message-ID: <de143b6f-461d-4c26-8ab7-bd07795696ed@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614102548.4364-9-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Allow-TTM-LRU-list-nodes-of-different-types/20240614-182911
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20240614102548.4364-9-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v4 08/12] drm/ttm: Add a virtual base class for graphics memory backup
config: x86_64-randconfig-161-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170559.WdDkFEiU-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406170559.WdDkFEiU-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ttm/ttm_backup_shmem.c:130 ttm_backup_shmem_create() error: dereferencing freed memory 'sbackup'

vim +/sbackup +130 drivers/gpu/drm/ttm/ttm_backup_shmem.c

827540d42dec01 Thomas Hellström 2024-06-14  119  struct ttm_backup *ttm_backup_shmem_create(loff_t size)
827540d42dec01 Thomas Hellström 2024-06-14  120  {
827540d42dec01 Thomas Hellström 2024-06-14  121  	struct ttm_backup_shmem *sbackup =
827540d42dec01 Thomas Hellström 2024-06-14  122  		kzalloc(sizeof(*sbackup), GFP_KERNEL | __GFP_ACCOUNT);
827540d42dec01 Thomas Hellström 2024-06-14  123  
827540d42dec01 Thomas Hellström 2024-06-14  124  	if (!sbackup)
827540d42dec01 Thomas Hellström 2024-06-14  125  		return ERR_PTR(-ENOMEM);
827540d42dec01 Thomas Hellström 2024-06-14  126  
827540d42dec01 Thomas Hellström 2024-06-14  127  	sbackup->filp = shmem_file_setup("ttm shmem backup", size, 0);
827540d42dec01 Thomas Hellström 2024-06-14  128  	if (IS_ERR(sbackup->filp)) {
827540d42dec01 Thomas Hellström 2024-06-14  129  		kfree(sbackup);
                                                                      ^^^^^^^
Freed

827540d42dec01 Thomas Hellström 2024-06-14 @130  		return ERR_CAST(sbackup->filp);
                                                                                ^^^^^^^^^^^^^
Use after free

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

