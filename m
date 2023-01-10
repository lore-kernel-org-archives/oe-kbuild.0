Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3217E5;
	Tue, 10 Jan 2023 05:13:52 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e3so1297882wru.13;
        Mon, 09 Jan 2023 21:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YXKiA6YRkxl/q8A+/e4CAKORR4+gy1o/E1caLflobAo=;
        b=irp/b4jyCN/uXCRVGC/fy5PeN0yY9EZoP9/S8p1i5O8hARSUWl0tbMqTVdRqd68TJC
         tPsBxrmNFytMRaYKrwblJ9NkrWn2QYzcZOjUEOWQL/0WNf+BijCL/3Nv6T7JxRND/4cA
         c0gMXyaSom0YUDE5DQKj+JPgKLubOhUlIVHFoZQ1eNL13z9uXu9E0KIve/++QkXKryPK
         XjR2hmEDndRqJlJrM5J6Rmog80hkQ1RokLISH+m3bYTp7QU+ZdMr3+RjnHqLN4scAEhI
         YtgF1jXkVdqcjBOm3QuH8cN1VGqZvZip9I3D9fIQoAF4wzMljDUU/x9qoSLUGwdaA+4a
         PEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXKiA6YRkxl/q8A+/e4CAKORR4+gy1o/E1caLflobAo=;
        b=JI/MfkJ5qRjNUyFEd4MNGy4V4wNwMwT4SHeSx94B+nTKYm7C/Zjxu46kou9koJ8RzU
         HaU2oYNsl0tI+5uOIMNiS6hvfgzPrMUOcIA4fXiYwbQGtQ059YUy2PIc35He7kZzNZhd
         3zwRS21IGKDK37kIVNvBFOq68A3TxtWriWXB/qLRoUbmRCK+dp6OsvmLSpT5T81OQI9u
         tSDVDzB3j5Dq436I2kzSS3So3OQacBpegEmX7M0TnljZCPL7wymSwvNVW6UmrF67qPNA
         Z+UUU5AO+cmgvrvpXNQqrdkBvwimrzGCImkJ8dykqswRGS3SpI3cISpZ25wGdZaswlsW
         DVWg==
X-Gm-Message-State: AFqh2kqq6r8YdzhQb54m9ZPFfzS2NI4Qpd1hhfUEqaYY9xvpdBXI57ga
	4kgLljCsWYLXoga+gyj/VjXJ/xW/lFo=
X-Google-Smtp-Source: AMrXdXtLxs3Ie/ZMGkkzT1s7SHw4huSprbsW63EzIwR/M5eXyuzjj9+dIEDH/QbRamMWWEyIhNmLWg==
X-Received: by 2002:adf:e303:0:b0:26e:4bdc:6ae1 with SMTP id b3-20020adfe303000000b0026e4bdc6ae1mr42349619wrj.28.1673327630385;
        Mon, 09 Jan 2023 21:13:50 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m13-20020adfe94d000000b002714b3d2348sm10118808wrn.25.2023.01.09.21.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 21:13:49 -0800 (PST)
Date: Tue, 10 Jan 2023 08:13:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Melissa Wen <mwen@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 06/18] drm/drm_color_mgmt: set first lut3d mode as
 default
Message-ID: <202301100801.G3Zk4cwS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109143846.1966301-7-mwen@igalia.com>
Message-ID: <20230110051347.y9_xvJDqOK5Z7Gij1Cqzt4NJ90OQ5Xk0KjengsEBWnQ@z>

Hi Melissa,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-Add-3D-LUT-mode-and-its-attributes/20230109-224640
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230109143846.1966301-7-mwen%40igalia.com
patch subject: [RFC PATCH v2 06/18] drm/drm_color_mgmt: set first lut3d mode as default
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/gpu/drm/drm_color_mgmt.c:307 drm_crtc_enable_lut3d() error: uninitialized symbol 'prop'.

vim +/prop +307 drivers/gpu/drm/drm_color_mgmt.c

5cd16ab3bc0875 Melissa Wen 2023-01-09  282  void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
f7cbe77028bfa2 Melissa Wen 2023-01-09  283  			   uint shaper_lut_size,
f7cbe77028bfa2 Melissa Wen 2023-01-09  284  			   bool first_value_as_default)
5cd16ab3bc0875 Melissa Wen 2023-01-09  285  {
5cd16ab3bc0875 Melissa Wen 2023-01-09  286  	struct drm_device *dev = crtc->dev;
5cd16ab3bc0875 Melissa Wen 2023-01-09  287  	struct drm_mode_config *config = &dev->mode_config;
f7cbe77028bfa2 Melissa Wen 2023-01-09  288  	struct drm_property_enum *prop;
f7cbe77028bfa2 Melissa Wen 2023-01-09  289  	uint init_value = 0;
5cd16ab3bc0875 Melissa Wen 2023-01-09  290  
5cd16ab3bc0875 Melissa Wen 2023-01-09  291  	if (!config->lut3d_mode_property)
5cd16ab3bc0875 Melissa Wen 2023-01-09  292  		return;
5cd16ab3bc0875 Melissa Wen 2023-01-09  293  
5cd16ab3bc0875 Melissa Wen 2023-01-09  294  	drm_object_attach_property(&crtc->base,
5cd16ab3bc0875 Melissa Wen 2023-01-09  295  				   config->lut3d_property, 0);
f7cbe77028bfa2 Melissa Wen 2023-01-09  296  
f7cbe77028bfa2 Melissa Wen 2023-01-09  297  	if (first_value_as_default) {
f7cbe77028bfa2 Melissa Wen 2023-01-09  298  		prop = list_first_entry_or_null(&config->lut3d_mode_property->enum_list,
f7cbe77028bfa2 Melissa Wen 2023-01-09  299  						typeof(*prop), head);
f7cbe77028bfa2 Melissa Wen 2023-01-09  300  		init_value = prop ? prop->value : 0;
f7cbe77028bfa2 Melissa Wen 2023-01-09  301  	}

prop is not initialized on else path.

f7cbe77028bfa2 Melissa Wen 2023-01-09  302  
5cd16ab3bc0875 Melissa Wen 2023-01-09  303  	drm_object_attach_property(&crtc->base,
f7cbe77028bfa2 Melissa Wen 2023-01-09  304  				   config->lut3d_mode_property,
f7cbe77028bfa2 Melissa Wen 2023-01-09  305  				   init_value);
f7cbe77028bfa2 Melissa Wen 2023-01-09  306  
f7cbe77028bfa2 Melissa Wen 2023-01-09 @307  	if (crtc->state && prop)
                                                                   ^^^^

f7cbe77028bfa2 Melissa Wen 2023-01-09  308  		crtc->state->lut3d_mode = init_value;
5cd16ab3bc0875 Melissa Wen 2023-01-09  309  
5cd16ab3bc0875 Melissa Wen 2023-01-09  310  	if (!shaper_lut_size)
5cd16ab3bc0875 Melissa Wen 2023-01-09  311  		return;
5cd16ab3bc0875 Melissa Wen 2023-01-09  312  
5cd16ab3bc0875 Melissa Wen 2023-01-09  313  	drm_object_attach_property(&crtc->base,
5cd16ab3bc0875 Melissa Wen 2023-01-09  314  				   config->shaper_lut_property, 0);
5cd16ab3bc0875 Melissa Wen 2023-01-09  315  	drm_object_attach_property(&crtc->base,
5cd16ab3bc0875 Melissa Wen 2023-01-09  316  				   config->shaper_lut_size_property,
5cd16ab3bc0875 Melissa Wen 2023-01-09  317  				   shaper_lut_size);
5cd16ab3bc0875 Melissa Wen 2023-01-09  318  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

