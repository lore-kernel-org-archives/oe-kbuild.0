Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F92223338
	for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991760; cv=none; b=QS8dHDVZb0BN1KKNnZXAYArQ4dklhMe2psRNhW6IcIAkwuiuJYRpFnkRbbY0wxb/fSNuZ5LbBL+ko7rKbdyqPU0G4LqpLatTvJkQD6tWmUjeY+yuFoyEv8HViCXuOTs7u68uEUgLK9EHiZb6gBLfxaVuRLWLXq0y70WA5XDqMQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991760; c=relaxed/simple;
	bh=/TF2ugqfYA1eOh1zu8H7xL+vjzu5FEB96fgp00W2MS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=O24Gy0H6YYB2cPirgXFkacMkuRo/2RiouCXZxsrl+diaSPRJLpS2Cywak8CpLlcKi5PZX5uJiHTLFO3Dc0ZiSuKqq1ipfjAFh492Oxsq4vW+OXVK/8z+Hr9Gbd40kw7I0txbulMCkuDo5VDCMwi9b2bBiMhxxTnszN74zUyXHt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fZcxArnJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZcxArnJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so102910415e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747991756; x=1748596556; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3WXBjLGDXin9jsjtnZSl8cR3pHiWFrfIXJVJ0zqrII=;
        b=fZcxArnJ5J41M1+gjk7QIUFTsrXNjfA8Y7Bbt0SLabb32Gp05h+4xhYNyM1etMZwJ8
         G4YH5KCwXRvytOKMO/dutr0ABzKyP+X7gI+WnsU2esOTgLa+QBNNNupioNe+264rzCl3
         S2dQhnxZrB1n9+aiHrSR/8sWhKXY5ZS+yGLjR3qucxd4b0ofXywXwvq5c/1bzpAwN/lW
         XMXeLnhILvTP/tovEOymYWsufqQ4gErYtaatDzHBqeuxS/bn5nmf9SqHmK4cWgUPUFGL
         DxAVcg9by9VlHBvp2+jr0vOdArnlWtELah83/AfI4yOjBkz9PN+gi4AAoUxBrk/NpWVs
         MMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747991756; x=1748596556;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3WXBjLGDXin9jsjtnZSl8cR3pHiWFrfIXJVJ0zqrII=;
        b=d4MprxywH6qGl1LIBmvEVMu0uCVBWXw/Eh8J1ZtAY5VlCDrLLxKyTWQfLUU8fvGb1a
         RV2Qlqbjun04NYWw3FT1t1Of1bvWfm16EPuLiEUZ29M77R3UWR3RoZgshnbhNW7BsYud
         OmRecT5+N+b6DCqldLqOG4T7PabyU6OKQTwbhFy4YbEn1GF69z92eKgCz26VrkaQgp3p
         rUdEzywbI5KrBFs9RnsPQ7wY5OhcQTwgqBq3tjxUYHL315gS7VGjtkKDYHVACSgG4L/r
         MXUnpQ0GhYuRIHBSqXcQrih3z9hlEhA04sS3SPaCvAIzCv9QmtYGkHiLX+GTYNtu9oj7
         iPiQ==
X-Gm-Message-State: AOJu0Yxq4w0JuCN465ung2uG8jnBJkC+WgOavQBVRSe34p7yEoph222t
	44Flj9y8L9E05XIAtCtu4SIuYfnjggjOkOLfpoaUaDcOek5dAgXG8oNikw5UbdrLI8sUB6etEZz
	yHsuU
X-Gm-Gg: ASbGnctkVMliXspTu0Wlgg2aZ+dxlaSyawt9JgMVqdwh/mpP3m9SuLFO81rmMSld73Q
	ly3A9VP6Yfu0W5jp6eVFHsdZBZEOwnQyRtx8RyOTq2JDVnBd4dJGQT8K1YFK3FhAB91v8Hlp+ge
	8rr+PNuHvvM+l3sgcMdIo3h0b77cM48hIa4gWVjy2dhcCbcc2bwiJEcEpqPRBLaLqmGcwcV1odU
	VUE5bCPh80ZD27VccPaHwmWaYugDRyIrXcALs5X4ISMao49jkGTZyZXKHTTx6h6Bew+lZMtSYRH
	F2W6z4NvEtfpBB0Wf8Wxq41G9WgTqmxqItdEeXYjcgvkWGcvkJsgCuQb
X-Google-Smtp-Source: AGHT+IErc1cQ7uKFa9JTPR19qj1Saui5L/XCi2xVWkEt00vpj8C2BFDVqFxExb/6CuDcpsIEAnQTkQ==
X-Received: by 2002:a05:6000:4203:b0:3a3:64c2:2a8b with SMTP id ffacd0b85a97d-3a4c235127cmr2545309f8f.49.1747991756327;
        Fri, 23 May 2025 02:15:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35fa8c6d6sm25016404f8f.26.2025.05.23.02.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:15:55 -0700 (PDT)
Date: Fri, 23 May 2025 12:15:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Francis <David.Francis@amd.com>,
	dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, tvrtko.ursulin@igalia.com,
	Felix.Kuehling@amd.com, David.YatSin@amd.com,
	Chris.Freehill@amd.com, Christian.Koenig@amd.com,
	dcostantino@meta.com, sruffell@meta.com, simona@ffwll.ch,
	mripard@kernel.org, tzimmermann@suse.de,
	David Francis <David.Francis@amd.com>
Subject: Re: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
Message-ID: <202505230705.6EOoxLbq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521140649.4058526-3-David.Francis@amd.com>
Message-ID: <20250523091552.uhLKZOxql8KIE8JuiLSm8Y9Fcux1yQ2YhlXwaHMuCrg@z>

Hi David,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Francis/drm-amdgpu-Adding-amdgpu-CRIU-ioctl/20250521-230706
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250521140649.4058526-3-David.Francis%40amd.com
patch subject: [PATCH 2/3] drm/amdgpu: Adding amdgpu CRIU ioctl
config: loongarch-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230705.6EOoxLbq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505230705.6EOoxLbq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c:160 amdgpu_criu_checkpoint() warn: potential ! vs ~ typo

vim +160 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c

d970da5c8545bbc David Francis 2025-05-21  145  	vm_buckets = kvzalloc(args->num_vms * sizeof(*vm_buckets), GFP_KERNEL);
d970da5c8545bbc David Francis 2025-05-21  146  	if (!vm_buckets) {
d970da5c8545bbc David Francis 2025-05-21  147  		ret = -ENOMEM;
d970da5c8545bbc David Francis 2025-05-21  148  		goto free_vms;
d970da5c8545bbc David Francis 2025-05-21  149  	}
d970da5c8545bbc David Francis 2025-05-21  150  
d970da5c8545bbc David Francis 2025-05-21  151  	idr_for_each_entry(&data->object_idr, gobj, id) {
d970da5c8545bbc David Francis 2025-05-21  152  		struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
d970da5c8545bbc David Francis 2025-05-21  153  		struct drm_amdgpu_criu_bo_bucket *bo_bucket;
d970da5c8545bbc David Francis 2025-05-21  154  		struct amdgpu_vm_bo_base *vm_bo_base;
d970da5c8545bbc David Francis 2025-05-21  155  
d970da5c8545bbc David Francis 2025-05-21  156  		bo_bucket = &bo_buckets[bo_index];
d970da5c8545bbc David Francis 2025-05-21  157  
d970da5c8545bbc David Francis 2025-05-21  158  		bo_bucket->size = amdgpu_bo_size(bo);
d970da5c8545bbc David Francis 2025-05-21  159  		bo_bucket->offset = amdgpu_bo_mmap_offset(bo);
d970da5c8545bbc David Francis 2025-05-21 @160  		bo_bucket->alloc_flags = bo->flags & (!AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);

This looks like it was supposed to clear the AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE
bit.

	bo_bucket->alloc_flags = bo->flags & ~AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;

Currently it just sets "bo_bucket->alloc_flags = 0;"

d970da5c8545bbc David Francis 2025-05-21  161  		bo_bucket->preferred_domains = bo->preferred_domains;
d970da5c8545bbc David Francis 2025-05-21  162  
d970da5c8545bbc David Francis 2025-05-21  163  		if (is_import(bo))
d970da5c8545bbc David Francis 2025-05-21  164  			bo_bucket->flags |= AMDGPU_CRIU_BO_FLAG_IS_IMPORT;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

