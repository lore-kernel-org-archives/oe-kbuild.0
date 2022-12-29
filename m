Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F7E1C2B;
	Thu, 29 Dec 2022 09:24:54 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so10536163wms.0;
        Thu, 29 Dec 2022 01:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osLtJOc/4PM5X4uBlOLQKHlEYcjzPp8720JlY48ebIc=;
        b=fHcQQDQtGQAVcssMtTLRqFMbtspw8JwpnHg8lO8tJTvbHS+Vn5vGTmNgZTvmI1MntV
         /F+OME2MZnNvnKPTB3LYC0fs0slIT1CV3qtp1b+8oeGkQ41iWZHJeOt7rkmiMsLTXffB
         UAILq3M7H83ri4NinGUy2l2IIxIPxqF7iNuldhvOQomOVtpAhiQ4f8xu8ktZnBQrL1IZ
         rBROWaMBqpAyUGiK565VySK/57eGx5lcdVOa8if4M7gb0Izm6wLxzs6hHOzL7ttcoiSq
         Qq0X04+hLQgsBoYtPiJGT91EopX2ym+t3f2KdSmrWjieLaEqqVHX8FPIdLeMKjFTOZtK
         fv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osLtJOc/4PM5X4uBlOLQKHlEYcjzPp8720JlY48ebIc=;
        b=xXIucqh9bTvYEga1HbMFOCsmLjYuXkYXFLTDZFGlXzUg4BRWAOiTezzPmC6is3bD9J
         Rxf6hUELqRamVxZcKL5iTQE1O1Q6qEAcO2liKn0bwxZgZE1fkJApP55KJu5xKXcuhJBx
         ZtP8h3l8ZXEsmCteRCh6dP3SVjWMzc/TdjhB3w62uZNcLyThLP/tiD2XZDP64CZuuDFq
         48lJ+GLJR107kUieP0NVLjfmyqxDeSW6pq0Tk+1toVCaZDudhjV7rmgqiM4/I9D9GLc6
         1lrCCKifCT1NMgTDCtcZr90Ks9EqYcMbc+ko28brxYx0kZ7bg0pEQoRDe5l721w/OAO9
         LkJw==
X-Gm-Message-State: AFqh2kp84wNjRia9DAeJqtDWCCTEWOTcxUuIfXXs7NWvEGzQ/mTvkbmG
	3o0dUcRSuJ6P5c4++f8LoyADDBYt8f5ThQ==
X-Google-Smtp-Source: AMrXdXsypwyZC4j7d5EUZyhoYOxFhMCPePPMlU/YyWDot9po4OCgJUbdXHW7QXv54z+lGb2u6WCf4Q==
X-Received: by 2002:a05:600c:1d8e:b0:3d6:e23:76a2 with SMTP id p14-20020a05600c1d8e00b003d60e2376a2mr19263586wms.34.1672305893029;
        Thu, 29 Dec 2022 01:24:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m4-20020a05600c3b0400b003c6b7f5567csm46125259wms.0.2022.12.29.01.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 01:24:52 -0800 (PST)
Date: Thu, 29 Dec 2022 12:24:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Ben Skeggs <bskeggs@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Subject: drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:282
 nvkm_chan_cctx_get() warn: inconsistent returns '&cgrp->mutex'.
Message-ID: <202212260844.AYAkoVok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221229092449.4AbLmRnAT5hL2VorAIfmvkTXP_wXW_IMmsbMJSIY8n0@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72a85e2b0a1e1e6fb4ee51ae902730212b2de25c
commit: f48dd2936138882d7755cbbc5d9984015c75980c drm/nouveau/fifo: add new engine context tracking
config: s390-randconfig-m041-20221225
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:282 nvkm_chan_cctx_get() warn: inconsistent returns '&cgrp->mutex'.

vim +282 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c

f48dd293613888 Ben Skeggs 2022-06-01  241  int
f48dd293613888 Ben Skeggs 2022-06-01  242  nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvkm_engn *engn, struct nvkm_cctx **pcctx,
f48dd293613888 Ben Skeggs 2022-06-01  243  		   struct nvkm_client *client)
f48dd293613888 Ben Skeggs 2022-06-01  244  {
f48dd293613888 Ben Skeggs 2022-06-01  245  	struct nvkm_cgrp *cgrp = chan->cgrp;
f48dd293613888 Ben Skeggs 2022-06-01  246  	struct nvkm_vctx *vctx;
f48dd293613888 Ben Skeggs 2022-06-01  247  	struct nvkm_cctx *cctx;
f48dd293613888 Ben Skeggs 2022-06-01  248  	int ret;
f48dd293613888 Ben Skeggs 2022-06-01  249  
f48dd293613888 Ben Skeggs 2022-06-01  250  	/* Look for an existing channel context for this engine+VEID. */
f48dd293613888 Ben Skeggs 2022-06-01  251  	mutex_lock(&cgrp->mutex);
f48dd293613888 Ben Skeggs 2022-06-01  252  	cctx = nvkm_list_find(cctx, &chan->cctxs, head,
f48dd293613888 Ben Skeggs 2022-06-01  253  			      cctx->vctx->ectx->engn == engn && cctx->vctx->vmm == chan->vmm);
f48dd293613888 Ben Skeggs 2022-06-01  254  	if (cctx) {
f48dd293613888 Ben Skeggs 2022-06-01  255  		refcount_inc(&cctx->refs);
f48dd293613888 Ben Skeggs 2022-06-01  256  		*pcctx = cctx;
f48dd293613888 Ben Skeggs 2022-06-01  257  		mutex_unlock(&chan->cgrp->mutex);

This code is correct, but smatch wants people to use "&cgrp->mutex"
constistently instead of "&chan->cgrp->mutex".

f48dd293613888 Ben Skeggs 2022-06-01  258  		return 0;
f48dd293613888 Ben Skeggs 2022-06-01  259  	}
f48dd293613888 Ben Skeggs 2022-06-01  260  
f48dd293613888 Ben Skeggs 2022-06-01  261  	/* Nope - create a fresh one.  But, sub-context first. */
f48dd293613888 Ben Skeggs 2022-06-01  262  	ret = nvkm_cgrp_vctx_get(cgrp, engn, chan, &vctx, client);
f48dd293613888 Ben Skeggs 2022-06-01  263  	if (ret) {
f48dd293613888 Ben Skeggs 2022-06-01  264  		CHAN_ERROR(chan, "vctx %d[%s]: %d", engn->id, engn->engine->subdev.name, ret);
f48dd293613888 Ben Skeggs 2022-06-01  265  		goto done;
f48dd293613888 Ben Skeggs 2022-06-01  266  	}
f48dd293613888 Ben Skeggs 2022-06-01  267  
f48dd293613888 Ben Skeggs 2022-06-01  268  	/* Now, create the channel context - to track engine binding. */
f48dd293613888 Ben Skeggs 2022-06-01  269  	CHAN_TRACE(chan, "ctor cctx %d[%s]", engn->id, engn->engine->subdev.name);
f48dd293613888 Ben Skeggs 2022-06-01  270  	if (!(cctx = *pcctx = kzalloc(sizeof(*cctx), GFP_KERNEL))) {
f48dd293613888 Ben Skeggs 2022-06-01  271  		nvkm_cgrp_vctx_put(cgrp, &vctx);
f48dd293613888 Ben Skeggs 2022-06-01  272  		ret = -ENOMEM;
f48dd293613888 Ben Skeggs 2022-06-01  273  		goto done;
f48dd293613888 Ben Skeggs 2022-06-01  274  	}
f48dd293613888 Ben Skeggs 2022-06-01  275  
f48dd293613888 Ben Skeggs 2022-06-01  276  	cctx->vctx = vctx;
f48dd293613888 Ben Skeggs 2022-06-01  277  	refcount_set(&cctx->refs, 1);
f48dd293613888 Ben Skeggs 2022-06-01  278  	refcount_set(&cctx->uses, 0);
f48dd293613888 Ben Skeggs 2022-06-01  279  	list_add_tail(&cctx->head, &chan->cctxs);
f48dd293613888 Ben Skeggs 2022-06-01  280  done:
f48dd293613888 Ben Skeggs 2022-06-01  281  	mutex_unlock(&cgrp->mutex);
f48dd293613888 Ben Skeggs 2022-06-01 @282  	return ret;
f48dd293613888 Ben Skeggs 2022-06-01  283  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

