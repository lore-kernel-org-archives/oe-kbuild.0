Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C82564;
	Thu,  4 Jan 2024 00:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9bYBEd+"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a28da6285c1so13002566b.0;
        Wed, 03 Jan 2024 16:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704328922; x=1704933722; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uvc23dpXpHqY1dPGQelfcNuv5lz83JAZe/DEXvpEDEA=;
        b=X9bYBEd+qjdg5nUR5S5kO/eEJ8XTQ4la0Jfhzxp6TQJJVkgJvlb3Ni2G0Fa1jzumeQ
         yy3EXl9n3gKbspRLGYB9Ta8RN1nIJulhbfw9+WMKUoCfT2f+DnxaLPBlpbqEQVa81wfR
         oL9+KPxEJEszwReRFw2RjICCKSPdorPzfBY4DDR6Su8sH83vjBwyFBV+ZFrKNSIhpIpS
         N6/Rp9zalrJcx3jwgVC4YqvHvM3FIrcUxaATcagXOPyFDt4DdKl5isLxDb4/wwN4hqmH
         bCLRrSnyuNUdHJX0KyFz5BB50vTgDhKbHwKp/8GHj6sf0w6tAbp8V/DX7Pum5XQnGh3E
         8rPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704328922; x=1704933722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uvc23dpXpHqY1dPGQelfcNuv5lz83JAZe/DEXvpEDEA=;
        b=UszDd4mpQwh4Fx4aDun7qbHJQkWs/EzVxsuwucyMCt8SYH/qDjZSOB8xQh7NnlR8PC
         CeOpUeOvNFwrldLJT0+V9MNtGZn29JVjU6QsRofcCEPJKLvyWUFQJnvzUWpIToFsbYKe
         LiX5cx9l6K770Pd7s3Uf7LVfGGBD6plu2DLrV7ScP0JGDLUiMmg1eStTjlo/FkN7u/dP
         iMP5tlBAYrbhjSyeylhbgEGlVdlpn9Bg0Iq6op6KWs8psaiAqpsi9jKxrTX2/X3Z0CRg
         NTkN/ffpPjL3k8pH1mXtBCAY18WCVvgAgLr0d7T+0E+ZuG/UC6kg//B5m/fWOnxCcKOa
         UEvQ==
X-Gm-Message-State: AOJu0YxArppxR4VWnLZOzQC4NqAI6wOg0Ni9igpEtOLSJCR/+XxeS+GZ
	7PlD1JgKHwvn5sDqnNHe6nt9VotrhRSLHNeFjb8=
X-Google-Smtp-Source: AGHT+IFvICkj21iJ/z9l3iQ0XLjxtVI/HKqcIzua/MxUvlJc0w1EtMthq89sml2MufmrHCuneqQXLEZLIly4yBwppYw=
X-Received: by 2002:a17:906:6bca:b0:a23:1b07:5c1b with SMTP id
 t10-20020a1709066bca00b00a231b075c1bmr1802836ejs.10.1704328921723; Wed, 03
 Jan 2024 16:42:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231222043308.3090089-9-airlied@gmail.com> <f8594217-59b7-431c-9fdc-15e2ef6197ab@moroto.mountain>
In-Reply-To: <f8594217-59b7-431c-9fdc-15e2ef6197ab@moroto.mountain>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Jan 2024 10:41:50 +1000
Message-ID: <CAPM=9txv+ULnX-f-dG=Ki2iZH5L7Sge-Jcd-asyPiBpVH962=g@mail.gmail.com>
Subject: Re: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jan 2024 at 00:47, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Hi Dave,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-gsp-drop-some-acpi-related-debug/20231222-180432
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20231222043308.3090089-9-airlied%40gmail.com
> patch subject: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
> config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231227/202312271917.55xuDMdc-lkp@intel.com/config)
> compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312271917.55xuDMdc-lkp@intel.com/

This is a false positive, I think the code is operating like I'd
expect, we maybe could restructure it to avoid this warning?

The idea is you send an rpc msg, if there's a reply you get a reply,
if no reply you get NULL and if an error you get an error.

So in the case you get an error or NULL you just want to return 0 for
the NULL as it's successful, and error otherwise.

Would using PTR_ERR_OR_ZERO make smatch happy? (even if it's not
really what we want).

Dave.
>
> New smatch warnings:
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:659 r535_gsp_rpc_rm_ctrl_push() warn: passing zero to 'PTR_ERR'
> drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1063 r535_dp_aux_xfer() warn: passing a valid pointer to 'PTR_ERR'
>
> Old smatch warnings:
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1887 nvkm_gsp_radix3_sg() error: uninitialized symbol 'addr'.
>
> vim +/PTR_ERR +659 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>
> af265ee961627a Dave Airlie 2023-12-22  649  static int
> af265ee961627a Dave Airlie 2023-12-22  650  r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32 repc)
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  651  {
> af265ee961627a Dave Airlie 2023-12-22  652      rpc_gsp_rm_control_v03_00 *rpc = container_of((*argv), typeof(*rpc), params);
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  653      struct nvkm_gsp *gsp = object->client->gsp;
> af265ee961627a Dave Airlie 2023-12-22  654      int ret = 0;
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  655
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  656      rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
> af265ee961627a Dave Airlie 2023-12-22  657      if (IS_ERR_OR_NULL(rpc)) {
> af265ee961627a Dave Airlie 2023-12-22  658              *argv = NULL;
> af265ee961627a Dave Airlie 2023-12-22 @659              return PTR_ERR(rpc);
>
> If nvkm_gsp_rpc_push() returns NULL (probably a failure) then this
> returns PTR_ERR(NULL) which is zero/success.
>
> af265ee961627a Dave Airlie 2023-12-22  660      }
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  661
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  662      if (rpc->status) {
> af265ee961627a Dave Airlie 2023-12-22  663              ret = r535_rpc_status_to_errno(rpc->status);
> 555bb9c29a45be Dave Airlie 2023-12-22  664              if (ret != -EAGAIN)
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  665                      nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  666                                 object->client->object.handle, object->handle, rpc->cmd, rpc->status);
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  667      }
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  668
> af265ee961627a Dave Airlie 2023-12-22  669      if (repc)
> af265ee961627a Dave Airlie 2023-12-22  670              *argv = rpc->params;
> af265ee961627a Dave Airlie 2023-12-22  671      else
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  672              nvkm_gsp_rpc_done(gsp, rpc);
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  673
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  674      return ret;
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  675  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
