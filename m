Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D093F7AB9
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593817; cv=none; b=UvrR+TpCgYd1RLr0QGSChpjhYeVymavFN2XOn86ZZ9qdoAJ9DpXyNRDAWiNyUf8BqDIhjGKphCPPtJs4Ins42iaOwkxP224tYXjcA9g5C8UlAZR4DMm8ar1RKUjhjGzu7NDsE6CrLOHpqsl4fRScxH/PVRN0iFUFb22aAeszQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593817; c=relaxed/simple;
	bh=2CceWHjsk841g1ibYYQNEzaqHQK2gQhpGazQWtOK+VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXIwDQm4OLlaZcKW0Z27KKnFa7tc0TfV0UFDqfXo4ERck4Ud2ZOagH7hrtUcF8SKFXQLJMU3rnyyiyMynKfF83HLcdvD9a9FgGGJiVAt5AH5NGB5+ooBLEqq3VdiXgU7VMAR33psKvEeht9CcYxlgK1v6lJgNjZsPkjRsPdiXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYDzZoQx; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYDzZoQx"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb64371a2aso967496a34.0
        for <oe-kbuild@lists.linux.dev>; Thu, 09 Jul 2026 03:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593814; x=1784198614; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pteYtlmBZ+ziJgHaE/q1ZTT8oCJJM0UmmxtNS6yDVPI=;
        b=SYDzZoQx5/kRcdZikJC0l7u8JjWfPQTUskrh5brDu32Y8F9CVRySnkodQpBJvXZnDh
         BUXd5/POnyE7NpkoauTGsmY8YgNVFcV9MkQY4qhNmsLL3NjFKddXf/+vsA22nstDQ5Yn
         QviOrhHmlfe9C8IduRxBvnLGVvjOeMjVO4DyDxwzsLivGTLBqZYdEzSBtF7oRhIV1Tn+
         qhZAV+ck53kYSsdTjRfygzqUqDq6/YjNU2HtVIduPABHf+eMBJdGO/12rjrBdR9F7ajP
         wZgF3dHVUOpyDmF3fo4b/qd3nHN5z9Ixen5GdVg0bTPnRBaBdk1Lmmrjq/PX0lKTCc6H
         /15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593814; x=1784198614;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pteYtlmBZ+ziJgHaE/q1ZTT8oCJJM0UmmxtNS6yDVPI=;
        b=JwcYlXJlDZoDO/1rkFd6wKUjm3+Ct0TMnomc2Orqce6sf56Kq/gMhsV1YSycCJx9Tv
         1FN66Z0i3ea3EUndw+NqA6y+AMrvUo1hFiPUWFB+Me2ZM7yySFArbX3ZAwS1NH2Cu5zh
         kMMQfPAG5an9Flg+soN99pNNnf2JZC69QUVR0LkHyMe+gVkv+hMC3gW7yenkx8XmL0AB
         469wii0rff94+vv4KzHSbVB38xRKHXSeDe0wrkq63/+SCMMJZ8IwfneccI7ebGpcWtL1
         4UM3mB7iMQODaxQcoUL7UmAiuBGl2jd/9kR+imQEYWIf/k1qSEbjFRmF4AQtbYYZB1RB
         euCA==
X-Gm-Message-State: AOJu0YzUjK+S9AJrMS730WElpACgBfYLyLduAofBbDSAK43OSQ1h6Xaw
	NYqPetvA0vV0R9+g1jD2Yz8/3ilpZJp9nuYT8DyaI+ZRfQpFC0L4pBlyUwZnx6YYo9o=
X-Gm-Gg: AfdE7ck/M0/UON8N1zfC5L4rjy8SG5xN+6C9MGsZ+MeUsgiXyzBzW0hIWUb8/6q6Ccn
	yvFtyHIqN9G5snBagaKaM/lI4OJOtOK528RDJy8igxMiO221b15CA69kX8azPmRXyaUFH09BWxQ
	M4aMqcddl1rLoEwgen9hcCqWPLtSRqAAbBF2Q9+ceMWiXPblLB6hBSR/xnyTgnHAvGLbfNXtj1R
	lEIswBlUta6OH0wCkYhUemgBQJe9OcIzhbuoMwWfkgqAOYKZpqXhumlwH5htB+ybhUE9jfAhTLz
	dfiMMRAluA8PDe0l/gUmZ1pHr6z5TjptUkjuir2a921c885tQKoM8yDFv3gT4VYTADkXPqAUixo
	ctmHWjZk1q5IU6Rr/Q+c7bS8lSYbfKFiT+pCRo6saJXVaKP5OfMChHblRkpEz0ebSUxzMD5GJ7v
	ooz+nE9vMpI/cVNxY=
X-Received: by 2002:a05:6830:81ed:b0:7e6:f2ef:e231 with SMTP id 46e09a7af769-7ebcfe542c8mr5970046a34.2.1783593814306;
        Thu, 09 Jul 2026 03:43:34 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcafdf8f2sm3834902a34.11.2026.07.09.03.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:43:32 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:43:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alexander Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 3205/3402]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c:537 amdgpu_device_ip_soft_reset()
 error: we previously assumed 'ip_block' could be null (see line 536)
Message-ID: <202607031711.yLwFhGfp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260709104327.w4SXlZl2JOWU_bInE5ZxSNcAFwIFNvb07J7ErMP8PC0@z>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e3cc8c108f9a91728f9ff6e24cbf3b41c58b8f8b
commit: a6319ac34a1322cc70c8aa7a3b06a558dc4f68a5 [3205/3402] drm/amdgpu: Add IP block soft reset as a GPU recovery method
config: i386-randconfig-r073-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031711.yLwFhGfp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031711.yLwFhGfp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c:537 amdgpu_device_ip_soft_reset() error: we previously assumed 'ip_block' could be null (see line 536)

vim +/ip_block +537 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c

a6319ac34a1322 Timur Kristóf 2026-06-17  523  int amdgpu_device_ip_soft_reset(struct amdgpu_ring *guilty_ring,
a6319ac34a1322 Timur Kristóf 2026-06-17  524  				struct amdgpu_fence *guilty_fence)
a6319ac34a1322 Timur Kristóf 2026-06-17  525  {
a6319ac34a1322 Timur Kristóf 2026-06-17  526  	struct amdgpu_device *adev = guilty_ring->adev;
a6319ac34a1322 Timur Kristóf 2026-06-17  527  	struct amdgpu_ring *rings[AMDGPU_MAX_RINGS];
a6319ac34a1322 Timur Kristóf 2026-06-17  528  	struct amdgpu_ip_block *ip_block;
a6319ac34a1322 Timur Kristóf 2026-06-17  529  	enum amd_ip_block_type ip_type;
a6319ac34a1322 Timur Kristóf 2026-06-17  530  	u32 num_rings, ring_type_mask;
a6319ac34a1322 Timur Kristóf 2026-06-17  531  	int r;
a6319ac34a1322 Timur Kristóf 2026-06-17  532  
a6319ac34a1322 Timur Kristóf 2026-06-17  533  	ip_type = amdgpu_ip_from_ring(guilty_ring->funcs->type);
a6319ac34a1322 Timur Kristóf 2026-06-17  534  	ip_block = amdgpu_device_ip_get_ip_block(adev, ip_type);
a6319ac34a1322 Timur Kristóf 2026-06-17  535  
a6319ac34a1322 Timur Kristóf 2026-06-17 @536  	if (!ip_block || !ip_block->version->funcs->soft_reset) {
                                                    ^^^^^^^^^
a6319ac34a1322 Timur Kristóf 2026-06-17 @537  		dev_warn(adev->dev, "IP block soft reset not supported on %s\n",

The zero day bot chopped off the dereference of ip_block but presumably
the warning is correct.


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

