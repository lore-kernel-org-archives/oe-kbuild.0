Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA6138D;
	Tue,  3 Jan 2023 08:01:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so22466659wms.4;
        Tue, 03 Jan 2023 00:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGe2dNB2O4DsKtHDiJtdu6ZDVemkFhiQQFAUL63hwnc=;
        b=YgAGjs3aYWKp0FP4eoXSs3SrEkWUWSTVhLGesQBqLAKt2i2ZxYBIIeadHgt9Nibdo7
         vGqtInYcEt6n2L7465PGlNGk/nMk18HMVm2LxrWDyj8yom5v4G5nr6J1BAKmKjwCD0cy
         SQr5TWtHEvm4/qApb5VkdUYIOu1UYvDPyzSq8sldsd2h3XUfLXvOxsrLzqq5iU6+dkFy
         97H452KhgAoQoDPhbUer4vpmjz4fC4nvjaZfj6X/16AupX5BLzxZuyjo2EBoVmSepLTz
         NHASVhzir0UMQCHjwRDGSi/MGiKxV8tXk6eR12ohQ3qhx0F8xAGjwQmUtFawrYbA9zSD
         eZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGe2dNB2O4DsKtHDiJtdu6ZDVemkFhiQQFAUL63hwnc=;
        b=esN7WHHJoz+8R66m3SsF4eCG4qBAiBvKXS/kVmQNf5G66w085kWDRg0K/zz8IfXsIl
         VrLjlX7s9Jia1s1mxmVrpnit6+mrKMC62rdZzQ0NYA04hhNTalzyjtSYkZMiEgqII0hY
         NNq6hVQ9N7k2TyLImg6iM6jd/xCw2ZSmePs3WroHVBA+a1O+oXOw+66LzLODjAIVOcO0
         YBfk7+QfvpBk7SN1vveLmxNjpl1six+RevGA9Om41hDOtHumeZZCIegLJQgQHaZPGWd2
         cfR3sGNdM/jtLoWsMIg0HL70MywLZuJgwZHjD9IDosreMdqvaMnrbYB5fibe8nym4/EG
         hbBA==
X-Gm-Message-State: AFqh2koVxOU5OECK5ThxG/m/XkRec1wiXkM2K7LR8mEhGM66pYbz421P
	3dhRkbGN3FbtjQsG9GUqRmFUkG13LNqGDQ==
X-Google-Smtp-Source: AMrXdXvFtbAoAaFKpX+Rat5ImAisAP6yESMRxvuUT+kssNxjABlldmaOx3Bo/YLhHUt1xAt1Ys1BUw==
X-Received: by 2002:a05:600c:54cb:b0:3cf:d0be:1231 with SMTP id iw11-20020a05600c54cb00b003cfd0be1231mr37428713wmb.13.1672732873668;
        Tue, 03 Jan 2023 00:01:13 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b003d1e3b1624dsm49940467wms.2.2023.01.03.00.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 00:01:13 -0800 (PST)
Date: Tue, 3 Jan 2023 11:01:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Luben Tuikov <luben.tuikov@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:473
 amdgpu_bo_validate_size() error: we previously assumed 'man' could be null
 (see line 458)
Message-ID: <202212300020.CFmsapaG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20230103080104.L9dI7-PL3liJ6rVaLyz_3XK4iiOXLJoeWM8qLmiIS2I@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1b929c02afd37871d5afb9d498426f83432e71c2
commit: 7554886daa31eacc8e7fac9e15bbce67d10b8f1f drm/amdgpu: Fix size validation for non-exclusive domains (v4)
config: ia64-randconfig-m041-20221229
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:473 amdgpu_bo_validate_size() error: we previously assumed 'man' could be null (see line 458)

vim +/man +473 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c

79c631239a83ae Andrey Grodzovsky 2017-11-10  444  static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
79c631239a83ae Andrey Grodzovsky 2017-11-10  445  					  unsigned long size, u32 domain)
79c631239a83ae Andrey Grodzovsky 2017-11-10  446  {
9de59bc201496f Dave Airlie       2020-08-04  447  	struct ttm_resource_manager *man = NULL;
79c631239a83ae Andrey Grodzovsky 2017-11-10  448  
79c631239a83ae Andrey Grodzovsky 2017-11-10  449  	/*
79c631239a83ae Andrey Grodzovsky 2017-11-10  450  	 * If GTT is part of requested domains the check must succeed to
7554886daa31ea Luben Tuikov      2022-12-10  451  	 * allow fall back to GTT.
79c631239a83ae Andrey Grodzovsky 2017-11-10  452  	 */
79c631239a83ae Andrey Grodzovsky 2017-11-10  453  	if (domain & AMDGPU_GEM_DOMAIN_GTT) {
6c28aed6e5b7fa Dave Airlie       2020-08-04  454  		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
79c631239a83ae Andrey Grodzovsky 2017-11-10  455  
7554886daa31ea Luben Tuikov      2022-12-10  456  		if (man && size < man->size)
79c631239a83ae Andrey Grodzovsky 2017-11-10  457  			return true;
7554886daa31ea Luben Tuikov      2022-12-10 @458  		else if (!man)
7554886daa31ea Luben Tuikov      2022-12-10  459  			WARN_ON_ONCE("GTT domain requested but GTT mem manager uninitialized");

WARN()

79c631239a83ae Andrey Grodzovsky 2017-11-10  460  		goto fail;
7554886daa31ea Luben Tuikov      2022-12-10  461  	} else if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
6c28aed6e5b7fa Dave Airlie       2020-08-04  462  		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
79c631239a83ae Andrey Grodzovsky 2017-11-10  463  
7554886daa31ea Luben Tuikov      2022-12-10  464  		if (man && size < man->size)
79c631239a83ae Andrey Grodzovsky 2017-11-10  465  			return true;
79c631239a83ae Andrey Grodzovsky 2017-11-10  466  		goto fail;
79c631239a83ae Andrey Grodzovsky 2017-11-10  467  	}
79c631239a83ae Andrey Grodzovsky 2017-11-10  468  
79c631239a83ae Andrey Grodzovsky 2017-11-10  469  	/* TODO add more domains checks, such as AMDGPU_GEM_DOMAIN_CPU */
79c631239a83ae Andrey Grodzovsky 2017-11-10  470  	return true;
79c631239a83ae Andrey Grodzovsky 2017-11-10  471  
79c631239a83ae Andrey Grodzovsky 2017-11-10  472  fail:
299c776cebb01c Michel Dänzer     2017-11-15 @473  	DRM_DEBUG("BO size %lu > total memory in domain: %llu\n", size,
4499c90e902f39 Christian König   2022-03-11  474  		  man->size);

Followed by crash.

79c631239a83ae Andrey Grodzovsky 2017-11-10  475  	return false;
79c631239a83ae Andrey Grodzovsky 2017-11-10  476  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

