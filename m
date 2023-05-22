Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A5E10F9
	for <oe-kbuild@lists.linux.dev>; Mon, 22 May 2023 06:51:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3094871953bso2706692f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 21 May 2023 23:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738272; x=1687330272;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cks/I+E1RSxlLoqm9z0OX20VEKZhG/X4ISND5hJYIcM=;
        b=a2O31w/EBtHd+uD8/QWMyb5ud4SeTdXu+pFwcFL7ODErD0fsCXCRZUHQLnwPc7nMLI
         rmT2wDfuCZP26Ed4m6YOK1OoNXOksomW5fEWmGntC+cPp9/y/ZQeIxs+E6hSURUtNOW8
         UCtF4il4pT4gUYwLGP1zmqqgKGkEmOy3J2OOZC2itZUHUVV8xj1u2LsOMkVb49HbDzYh
         vnpUAwKAVYvcdnUFWovGIFBQsSdLLi+jGmKgEuh3eJv/l6HwG/GwRaJBe7CFjndnRSLO
         BMFl053bPi+2Cnhnm7vZCJpuYkZBawfZbYPK9G4TLwAWl5uF6qPEv9fSpp41NQ+wAmmf
         jZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738272; x=1687330272;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cks/I+E1RSxlLoqm9z0OX20VEKZhG/X4ISND5hJYIcM=;
        b=h0pbQ/yWfdpcw2ajdtCM/DEwNZRtTnYQs3nW2jYvQG2nXoyzVVfnPd1qBCjRJhKXlM
         wS04P+CGJBYN262yZ20zi186AmUw3oI6wJDaJ6bc4FGGatSzPh5dyiWAk5ZMPCyeB0sj
         592tILiePwuAqjVCs47P7BqFM/4zp04MX7ibofgYfRTYw092HJs1fUARHNXXWNi5LYj5
         ASgUqlxli+DIJkAz+RVX5/4Gd4s6+sexPpgz/TeVsBrZ3wJFsuPOaAQ8Qv20BMrSmP8R
         o/LuwkOWmBtzlHd6gN1+wSxM6FVkYr4NyhGqpEn+AvgHIOF2UP3kBAIfwyvo14kkXsEZ
         ndwQ==
X-Gm-Message-State: AC+VfDw19FJjVFkF+RPUw61CBOPLap5vF8aMlvVAj852o5iuoX/nOact
	rG/A31kRECDC+jwxitsRiP8P0a17legwElRYPWE=
X-Google-Smtp-Source: ACHHUZ6AEyW+VSbffKx1wxnVJ3faV12vzE8Em+qeuI8U9Fgx6CGukMj4YwM2XVkZhJfXGq8FsBCOuw==
X-Received: by 2002:a5d:494b:0:b0:307:8b3e:2858 with SMTP id r11-20020a5d494b000000b003078b3e2858mr6375277wrs.45.1684738271569;
        Sun, 21 May 2023 23:51:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o5-20020a5d62c5000000b003068f5cca8csm6615030wrv.94.2023.05.21.23.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 23:51:10 -0700 (PDT)
Date: Mon, 22 May 2023 09:50:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Tadokoro <davidbtadokoro@usp.br>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1263
 amdgpu_dm_plane_handle_cursor_update() error: we previously assumed 'afb'
 could be null (see line 1222)
Message-ID: <16bdc393-7f1d-4823-8982-8c47cc80400b@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d635f6cc934bcd467c5d67148ece74632fd96abf
commit: 8bf0d9cdf36b0bebf17b733e3f5158783d765df3 drm/amd/display: add prefix to amdgpu_dm_plane.h functions
config: ia64-randconfig-m041-20230514
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305210251.IqE6U5XP-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c:1263 amdgpu_dm_plane_handle_cursor_update() error: we previously assumed 'afb' could be null (see line 1222)

vim +/afb +1263 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_plane.c

8bf0d9cdf36b0b David Tadokoro   2023-03-05  1214  void amdgpu_dm_plane_handle_cursor_update(struct drm_plane *plane,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1215  				 struct drm_plane_state *old_plane_state)
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1216  {
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1217  	struct amdgpu_device *adev = drm_to_adev(plane->dev);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1218  	struct amdgpu_framebuffer *afb = to_amdgpu_framebuffer(plane->state->fb);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1219  	struct drm_crtc *crtc = afb ? plane->state->crtc : old_plane_state->crtc;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1220  	struct dm_crtc_state *crtc_state = crtc ? to_dm_crtc_state(crtc->state) : NULL;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1221  	struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20 @1222  	uint64_t address = afb ? afb->address : 0;
                                                                           ^^^
Is this check required?

5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1223  	struct dc_cursor_position position = {0};
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1224  	struct dc_cursor_attributes attributes;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1225  	int ret;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1226  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1227  	if (!plane->state->fb && !old_plane_state->fb)
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1228  		return;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1229  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1230  	DC_LOG_CURSOR("%s: crtc_id=%d with size %d to %d\n",
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1231  		      __func__,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1232  		      amdgpu_crtc->crtc_id,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1233  		      plane->state->crtc_w,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1234  		      plane->state->crtc_h);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1235  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1236  	ret = get_cursor_position(plane, crtc, &position);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1237  	if (ret)
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1238  		return;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1239  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1240  	if (!position.enable) {
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1241  		/* turn off cursor */
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1242  		if (crtc_state && crtc_state->stream) {
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1243  			mutex_lock(&adev->dm.dc_lock);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1244  			dc_stream_set_cursor_position(crtc_state->stream,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1245  						      &position);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1246  			mutex_unlock(&adev->dm.dc_lock);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1247  		}
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1248  		return;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1249  	}
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1250  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1251  	amdgpu_crtc->cursor_width = plane->state->crtc_w;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1252  	amdgpu_crtc->cursor_height = plane->state->crtc_h;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1253  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1254  	memset(&attributes, 0, sizeof(attributes));
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1255  	attributes.address.high_part = upper_32_bits(address);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1256  	attributes.address.low_part  = lower_32_bits(address);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1257  	attributes.width             = plane->state->crtc_w;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1258  	attributes.height            = plane->state->crtc_h;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1259  	attributes.color_format      = CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1260  	attributes.rotation_angle    = 0;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1261  	attributes.attribute_flags.value = 0;
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1262  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20 @1263  	attributes.pitch = afb->base.pitches[0] / afb->base.format->cpp[0];
                                                                           ^^^^^                  ^^^^^
It's not checked here.

5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1264  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1265  	if (crtc_state->stream) {
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1266  		mutex_lock(&adev->dm.dc_lock);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1267  		if (!dc_stream_set_cursor_attributes(crtc_state->stream,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1268  							 &attributes))
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1269  			DRM_ERROR("DC failed to set cursor attributes\n");
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1270  
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1271  		if (!dc_stream_set_cursor_position(crtc_state->stream,
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1272  						   &position))
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1273  			DRM_ERROR("DC failed to set cursor position\n");
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1274  		mutex_unlock(&adev->dm.dc_lock);
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1275  	}
5d945cbcd4b16a Rodrigo Siqueira 2022-07-20  1276  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

