Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F681547F5
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252236; cv=none; b=sJt8gXue5ptJZkF8RN3AXwQpT6Xh8t4yYebKrj9UljXc8KsKQvFWO7jN3nQ4AZKjME5ZIYu5SKLtok9dhRJ+QnP+iKeFfeocumamhreQ7FSms18T3uuVx84Hhbk56/rSU0dvZeJqPkM3iAZix8yFW2qKDVlh6y72pj0MKlye5WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252236; c=relaxed/simple;
	bh=iEIy3NZF1yhBhKkWPmwSOs6prrPvxY5Xf+yw9Nq+CzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYz4LiYdxx+nud+btFCuAZt7UtHIjub+wiCT4YSwHDNW+6d0354VsIrKqkoY/tyXV5E3ltnMPuyFovFOATkiVQvUHXOgZQ3xr1ctzfVd9T5Mgp0wtOcW6nsf1AlDHX6IGZHIUSx6WFCJevQKADTwOLtbVE4vcmM2NLJ5+t8TP50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TIzWxbcJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TIzWxbcJ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37ccc600466so6138f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Sep 2024 01:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252232; x=1727857032; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXNnyq1EhkrNnfdG59+VCuGM+D0gdvA57yIgYF62SiQ=;
        b=TIzWxbcJUHJUqbjh0uW/qPmSAksYzjrdANgLEZNDrNBb/U0pFL6t7993pl8Brj6wpW
         qktmwvTr+hY8D5+NYqWjh+Qltl2DmKo1/ekyLw4P3b/BP2S46TQHZMF87vT+PLjNlRg4
         vBvNiwKwHfwyKrsPWzYJVtChPw0mibIBRsiGReNralAVk1ZkVDP9TbltVxeZha3kHM6S
         YCSuUIS/szi0dkfuLjgXv3cw46u06jbSROenh1sqVmgEewON3I6FSOSEUUuirUQSlKRQ
         BWbFyTKtLRJKJ4XeoDfxGFTLa5AKc212+IFANy5XL2lETCzMq0Ja3YInmPNTghdKbs0c
         xK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252232; x=1727857032;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXNnyq1EhkrNnfdG59+VCuGM+D0gdvA57yIgYF62SiQ=;
        b=djAbffHMR+mbCzHKW9jM338unWgYfFJOef6fw99FvI618FSfASSgkxqef0xyHWSp1b
         ZO2ipsad2Pxhszq4uhFNX4v9JgV424gIk/bHkIbNHB+8xt3ESKUSgqAcH4ZZ8t1avHMw
         SFk8m+Nsrkyh96hU5vG+KGJ91JvgARTtlGeWhTXRQwXRR7cMZ7CLYNyDBVkdj0xIMAd6
         rwLuDDkWWZALMeLrWZ0tuMhzB0hC6Ol13RBtptQauRD4PjlaT/YY3boSUstI0ObgFBiA
         oSL6hYJPobkczpEplvlmInfbcvquBkey21BDEX2jSw5apPUIbo5xhPjU90MoNvHFI4as
         tQCw==
X-Gm-Message-State: AOJu0Yy0dNxDArBJIbdNRz3zIJO/CIP+OXvtM2PWYYqjjoblIZtRSGFY
	dqarktbwMfPUUZZATvmCfunSXVW1PA8egIARGdZDWuXhaeetDJ4w64+qzJduTILkGYeuF1x8d/l
	c
X-Google-Smtp-Source: AGHT+IHWtsFV5hh+0tqLWVwxCAR0ZQVY2DD/BzDSk3GiSx88WDNvO3cWX+j0a5WzAQ2xDdacSMCVsA==
X-Received: by 2002:a05:6000:180c:b0:371:a70d:107e with SMTP id ffacd0b85a97d-37cc246baa0mr1070907f8f.6.1727252231936;
        Wed, 25 Sep 2024 01:17:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc31f57bsm3287938f8f.107.2024.09.25.01.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:17:11 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:17:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 4156/30000]
 drivers/gpu/drm/virtio/virtgpu_vq.c:750 virtio_gpu_cmd_get_edids() error:
 'cmd_p' dereferencing possible ERR_PTR()
Message-ID: <a7774fb9-88b3-4c0c-bca4-50a0e3bc44e7@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: d4f5248ba0ac929a5d79faf185766987fac4a73b [4156/30000] UPSTREAM: drm/virtio: add edid support
config: i386-randconfig-141-20240913 (https://download.01.org/0day-ci/archive/20240922/202409222012.3X1WV06O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409222012.3X1WV06O-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/virtio/virtgpu_vq.c:750 virtio_gpu_cmd_get_edids() error: 'cmd_p' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/gpu/drm/virtio/virtgpu_vq.c:381 virtio_gpu_cmd_create_resource() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:400 virtio_gpu_cmd_unref_resource() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:416 virtio_gpu_cmd_resource_inval_backing() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:433 virtio_gpu_cmd_set_scanout() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:455 virtio_gpu_cmd_resource_flush() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:484 virtio_gpu_cmd_transfer_to_host_2d() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:508 virtio_gpu_cmd_resource_attach_backing() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:646 virtio_gpu_cmd_get_display_info() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:668 virtio_gpu_cmd_get_capset_info() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:721 virtio_gpu_cmd_get_capset() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:767 virtio_gpu_cmd_context_create() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:784 virtio_gpu_cmd_context_destroy() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:799 virtio_gpu_cmd_context_attach_resource() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:816 virtio_gpu_cmd_context_detach_resource() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:834 virtio_gpu_cmd_resource_create_3d() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:861 virtio_gpu_cmd_transfer_to_host_3d() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:883 virtio_gpu_cmd_transfer_from_host_3d() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:906 virtio_gpu_cmd_submit() error: 'cmd_p' dereferencing possible ERR_PTR()
drivers/gpu/drm/virtio/virtgpu_vq.c:934 virtio_gpu_object_attach() error: we previously assumed 'obj->pages' could be null (see line 925)

vim +/cmd_p +750 drivers/gpu/drm/virtio/virtgpu_vq.c

d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  730  int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  731  {
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  732  	struct virtio_gpu_cmd_get_edid *cmd_p;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  733  	struct virtio_gpu_vbuffer *vbuf;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  734  	void *resp_buf;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  735  	int scanout;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  736  
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  737  	if (WARN_ON(!vgdev->has_edid))
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  738  		return -EINVAL;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  739  
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  740  	for (scanout = 0; scanout < vgdev->num_scanouts; scanout++) {
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  741  		resp_buf = kzalloc(sizeof(struct virtio_gpu_resp_edid),
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  742  				   GFP_KERNEL);
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  743  		if (!resp_buf)
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  744  			return -ENOMEM;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  745  
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  746  		cmd_p = virtio_gpu_alloc_cmd_resp
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  747  			(vgdev, &virtio_gpu_cmd_get_edid_cb, &vbuf,
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  748  			 sizeof(*cmd_p), sizeof(struct virtio_gpu_resp_edid),
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  749  			 resp_buf);

No error checking

d4f5248ba0ac92 Gerd Hoffmann 2018-10-30 @750  		cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_EDID);
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  751  		cmd_p->scanout = cpu_to_le32(scanout);
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  752  		virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  753  	}
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  754  
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  755  	return 0;
d4f5248ba0ac92 Gerd Hoffmann 2018-10-30  756  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

