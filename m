Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3931A08BC
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Oct 2024 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549751; cv=none; b=fsAtCgOmzrHrUYRg/+BxncpZqU6U1by+2htZ3Q/559JwZnKiPRHcYBjKszATlMYiLCBkKFXTB7yWXXiBmRi8VoAdF93w/8x5rwnqzNrtOsoexMnXmtsxAhNi6P3hOeKnwMihsN8zJ5tkoGPMyFohPUSPasfKrQn5DKzBpFJXl8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549751; c=relaxed/simple;
	bh=liESgrUNAjNr62K9nnrQ8ZXrQKqAIZWrvyhjoeAUnJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XmXMrHgxVPpkC3Bz0wR4d5XHKe1Nn6dXLEr1DK328QtsCgyc/LbmTH0p1oHjmdU1Qweh/srjCaZqVdV/Kz7zPvFy8s4yUkN7zsB53UARI6CdmYTfUyh+cbw8sMS+u/Jb5H8D/QWfT1eZJFLNyzUmB76qIY/7tDO+DTYD7S0scp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHnbGvtM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHnbGvtM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37cc846fbc4so398648f8f.2
        for <oe-kbuild@lists.linux.dev>; Thu, 10 Oct 2024 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728549747; x=1729154547; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ED+cepi9AKIjMRyR1qXeMbEFRTtBTVfdWiXsEi6z2Ks=;
        b=DHnbGvtMrBOh2BXfdwRkXR/Qxql1+KSdhQQTHg1iZF3Pc7HQ6Vjql8BxyuaYWF/1QN
         FVNLdDyLoCed2Pi+XjGSxo1PNapq2yip71HCEX+jXTNK/3MBdtF6q/ffCgzKSHUREPsd
         jeC1M7dOHgAhxjxBmx2ZRKsgPiHI40PHEu3MyQmsYF6nSPRllLItLmowNOQlp3znCBtG
         BnQ24LCckpXVa5t70mSo6BQdduxQ14DzsByeA5yH1vWjY+BX+vaGl99SumafnU2WYzU/
         0ajmM0sCrQIjq35QyPJQJvZir1TfNEaV7wkSMFHzjq/jD6MKHIMVegW8pyHnKPIEU5AD
         lmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549747; x=1729154547;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ED+cepi9AKIjMRyR1qXeMbEFRTtBTVfdWiXsEi6z2Ks=;
        b=iaeTCy4hcax9K3OI221wTFrHlmlT+3U8S20LQheFjiLDmqYpDF+u9tKSLhCwSEbGcD
         1OMvv9pC9vSZ/saSJdXp9pMiR+TfHMnz5sZqyJoJ680iWoe+GcNejvlS/fCWRaCd9klE
         RFtl0RTH1LDlRDO294PYAEQQ0dm/EaDI/o4XKoPUvi23IbdPaTZFk6nNZ8lPxxNjmAjj
         5q4UpEuMnzpO+O4pprggn4Cjipq8OcT3npF6vPW+cDsyWsYacgfBNsa8pI/zuopGqNx9
         TfmiwlezhZP7BiVxwnARe7PZMasNMK53md/fqArBi1oRVcKP0qQyXZgwbyPIyFogdvVi
         HL8Q==
X-Gm-Message-State: AOJu0YxA1be/eDB3u2/MZDGE/ThHYWoxmhez3g5q3fjaLnrFPtWMyVRw
	Z2Pmx/eQqquYOr7DofXLbSL34M9HnbgdECtW1A30CeSLkMXWUH/gp2GYA0K/9/CClBvI19ycL/2
	h
X-Google-Smtp-Source: AGHT+IH8Dd3Q2ssIxbkX3XdNsQQ9uYYsbdFWsigd/TF3OZGZ094HwBLU5Itcskr2lHZCtjSjSSXnRw==
X-Received: by 2002:a5d:4a92:0:b0:37d:4e59:549a with SMTP id ffacd0b85a97d-37d4e595983mr578154f8f.16.1728549747322;
        Thu, 10 Oct 2024 01:42:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd057sm863827f8f.35.2024.10.10.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 01:42:26 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:42:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4286/30000]
 drivers/gpu/drm/virtio/virtgpu_ioctl.c:776 virtio_gpu_context_init_ioctl()
 warn: inconsistent returns '&vfpriv->context_lock'.
Message-ID: <bc926e4c-644a-41e1-bac3-af0ab806380f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   a008d597f5ebedde0d000d27364ddb38be189ae4
commit: 8815d47cf0d4cf662b4209e3a3edfe7bef0a4bca [4286/30000] CHROMIUM: drm/virtio: implement context init: support init ioctl
config: x86_64-randconfig-161-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101617.JslGNk0O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410101617.JslGNk0O-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/virtio/virtgpu_ioctl.c:776 virtio_gpu_context_init_ioctl() warn: inconsistent returns '&vfpriv->context_lock'.

vim +776 drivers/gpu/drm/virtio/virtgpu_ioctl.c

8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  714  static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  715  					 void *data, struct drm_file *file)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  716  {
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  717  	int ret = 0;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  718  	uint32_t num_params, i, param, value;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  719  	size_t len;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  720  	struct drm_virtgpu_context_set_param *ctx_set_params;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  721  	struct virtio_gpu_device *vgdev = dev->dev_private;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  722  	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  723  	struct drm_virtgpu_context_init *args = data;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  724  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  725  	num_params = args->num_params;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  726  	len = num_params * sizeof(struct drm_virtgpu_context_set_param);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  727  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  728  	if (!vgdev->has_context_init || !vgdev->has_virgl_3d)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  729  		return -EINVAL;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  730  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  731  	/* Number of unique parameters supported at this time. */
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  732  	if (num_params > 1)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  733  		return -EINVAL;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  734  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  735  	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  736  				     len);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  737  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  738  	if (IS_ERR(ctx_set_params))
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  739  		return PTR_ERR(ctx_set_params);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  740  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  741  	mutex_lock(&vfpriv->context_lock);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  742  	if (vfpriv->context_created) {
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  743  		ret = -EEXIST;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  744  		goto out_unlock;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  745  	}
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  746  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  747  	for (i = 0; i < num_params; i++) {
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  748  		param = ctx_set_params[i].param;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  749  		value = ctx_set_params[i].value;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  750  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  751  		switch (param) {
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  752  		case VIRTGPU_CONTEXT_PARAM_CAPSET_ID:
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  753  			if (value > MAX_CAPSET_ID)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  754  				return -EINVAL;

goto out_lock

8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  755  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  756  			if ((vgdev->capset_id_mask & (1 << value)) == 0)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  757  				return -EINVAL;

same

8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  758  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  759  			/* Context capset ID already set */
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  760  			if (vfpriv->context_init &
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  761  			    VIRTIO_GPU_CONTEXT_INIT_CAPSET_ID_MASK)
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  762  				return -EINVAL;

same

8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  763  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  764  			vfpriv->context_init |= value;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  765  			break;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  766  		default:
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  767  			return -EINVAL;

same

8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  768  		}
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  769  	}
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  770  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  771  	virtio_gpu_create_context_locked(vgdev, vfpriv);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  772  	virtio_gpu_notify(vgdev);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  773  
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  774  out_unlock:
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  775  	mutex_unlock(&vfpriv->context_lock);
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27 @776  	return ret;
8815d47cf0d4cf Anthoine Bourgeois 2020-03-27  777  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

