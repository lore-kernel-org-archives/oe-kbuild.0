Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576DC2F3C22
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 07:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761116429; cv=none; b=nCtb64oPoBHNY8F9V5oW+kTDYUGX/v7rhHA8Rhrt5XBz77oVSUfz7Ca67UHnlyMNL6FJwiHB9uVoNSE3QtwEdyi8DgkAobD1Hr691Ve3UDNJQ1NOw035KM/rZOPT1/Mp8nMrsXapZpUWDFKHZ4L7kgMCwN9XU277z2a5NLz/xa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761116429; c=relaxed/simple;
	bh=+lkw0gmwYWxNDRxLgRFeHVaT42rdFPC5CN5TNEfZLWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AfGX22ukVHpHh/KSZStR/PF/fseeV619T/2KN+KmCFKNQBnS/uqiPhKMizAmdyIQlveOQcIrQaTBcIT+DZF8aol7y89ouM7UMG/Nvi2a7rilJVDmn9EUrY81lNVqV7IDb0T93DLOuxzjtcOQQxjd5lWWLIhfkV1kakbIwirYdVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LTdMPOT/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTdMPOT/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-427015003eeso1602710f8f.0
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 00:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761116416; x=1761721216; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qv5bMEGvN9X32946bfYvNIl8D9oMhZpgA7zbomHxa9Y=;
        b=LTdMPOT/mHdYow7m4AAYgZarBsZQlKZuSYHNyrYP67zgDb+0e10R5tLDswDS/1rToQ
         eb+voTPtmySwwC8fj1p+LBdakxneYiUcoQx3lDlFS/ybFSVJiTOjiuPPMOwBFIo3s7BO
         7rm4M0HJ6b6BH9j1TyqZRG6jor1+/6ZbYEQX2BG1tO69vtJgizAJ4KSIbmRp1t691DyZ
         Y1o3wr510LtfvtAbGTYGBOgfl0+6AAj6CZB8TV0LDPygLmYsxIzrc08wJoZVW6OiK00L
         txSFmgEaOfQVrDHDcjejTVS/xfkrVK19HkHxwSo/GNk1g7FlK4xSaM91vi5UKoVZtS4j
         pjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761116416; x=1761721216;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qv5bMEGvN9X32946bfYvNIl8D9oMhZpgA7zbomHxa9Y=;
        b=P5Pn4qp12rQEwlSwKslksA2HHKhvEUFVGMGFzzllKIZBMyq2CSV5AEOn9ah0Z/2Zz3
         pt1tNNWH2s4EKTETwi3qbGNZ49TEP5aFMJeVBvR1oenXdt1cKaCHJ3JnJG3i2WyzY7eO
         my78wEquQL6+100Scx40F8UCSEm8HPMGVlEZu99v1Ttv1sfoSYR8sH7K0j07Hd+8NHpK
         hsVLBnt+1uxGQdH0QR3YPu+2L2PMNsx8aQtB/QKp9x6dbyek6jH9rm9yiJbxVZYhGd9u
         dzmiPMhg9uJt1F4HPZGzvNHl9reFEz/RAdl6iyron+lkzvdFF1gryQ6gaQ/NAZKXYNAG
         7/Rg==
X-Gm-Message-State: AOJu0YzfHoxNLTZLJUMlP2ZtZ/ZW1aWKhNzdLzUXp7JZqvksbu/sLbkK
	rbzCnniWp3mKmvERb/klzVzee7yhiWVORPOQl8rUAfw55azA+0OY0sJd+8d4qolxrKD+r6k/gxz
	UGhcK
X-Gm-Gg: ASbGncueqb161IRBCKpB6QR6DVsKMoNjbrByICuOgLvdNqT6hUuV1MXKKn0Lo+Usv3o
	YU05M4HotmAIwH6O1s40qaPeQzj8nZRxKsFRJbn/BMVmOtNleX0Cww7Ao/kHDHnIoC9+tPVH8k6
	MRFwwc+f4b2ccgxCdRvC8lDs6CdPFQTYoEtCpulpnUTfQ/Hx7/xj28jhR7XZ/z6jNbAVDaZSly+
	WrjEJXiFEcqCAhIUNpdd3TYyD69dhg9pH2tCLI/3S1Bzu0w11xoGg4IdRCtd60OAovc4PtkYtAJ
	k4rhp2ayab03/zSD4/YZlAhEYFo1i/esI95eIFtAaOYQV8jL/ORQ1XJYkRxpVQ7t8MgcvAjqP6Q
	NhGp2vtGakVF4rJiqplx1F+141dzhjm1r5B19WhoosW9XFr7ylN+8sqzzJTCsPt2spdQorGxe0z
	QTpTwp5g==
X-Google-Smtp-Source: AGHT+IF9i76yH8MCk+Tr5Mn1WkODA3/xR31W7KLUDUU/ophtp3akzS53FBIQN5I5N9gZZPPgOgtIdQ==
X-Received: by 2002:a05:6000:2c0e:b0:405:3028:1bce with SMTP id ffacd0b85a97d-42704daed0fmr12707364f8f.32.1761116416304;
        Wed, 22 Oct 2025 00:00:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ce3e2sm23652718f8f.47.2025.10.22.00.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:00:15 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:00:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
	jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
Message-ID: <202510220056.J4uIVWxn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020151402.53013-6-tzimmermann@suse.de>
Message-ID: <20251022070012.n-xbJnw1dBIbZcgGlDUw70SxLjHPIow3cPg_eNDGneU@z>

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-client-Remove-pitch-from-struct-drm_client_buffer/20251020-231709
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251020151402.53013-6-tzimmermann%40suse.de
patch subject: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
config: openrisc-randconfig-r072-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220056.J4uIVWxn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510220056.J4uIVWxn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_client.c:185 drm_client_buffer_delete() warn: variable dereferenced before check 'buffer' (see line 182)

vim +/buffer +185 drivers/gpu/drm/drm_client.c

449148a7300b8b Thomas Zimmermann 2025-10-20  180  void drm_client_buffer_delete(struct drm_client_buffer *buffer)
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  181  {
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20 @182  	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
                                                                                                        ^^^^^^^^^^
buffer is dereferenced here

82e2a75e5a640c Thomas Zimmermann 2025-10-20  183  	int ret;
82e2a75e5a640c Thomas Zimmermann 2025-10-20  184  
449148a7300b8b Thomas Zimmermann 2025-10-20 @185  	if (!buffer)
                                                            ^^^^^^^
checked too late

449148a7300b8b Thomas Zimmermann 2025-10-20  186  		return;
449148a7300b8b Thomas Zimmermann 2025-10-20  187  
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20  188  	drm_gem_vunmap(gem, &buffer->map);
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20  189  
82e2a75e5a640c Thomas Zimmermann 2025-10-20  190  	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
82e2a75e5a640c Thomas Zimmermann 2025-10-20  191  	if (ret)
82e2a75e5a640c Thomas Zimmermann 2025-10-20  192  		drm_err(buffer->client->dev,
82e2a75e5a640c Thomas Zimmermann 2025-10-20  193  			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
82e2a75e5a640c Thomas Zimmermann 2025-10-20  194  
be6ee102341bc4 Emil Velikov      2020-05-15  195  	drm_gem_object_put(buffer->gem);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  196  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  197  	kfree(buffer);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  198  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

