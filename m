Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA53EB23;
	Thu, 17 Nov 2022 07:47:20 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g12so2240605wrs.10;
        Wed, 16 Nov 2022 23:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tCwhucR2jYzOzAhHaj93G9eQkKme2+l5tf3lCT/bAk=;
        b=e4lhQwNafr0LYDpkAQZ0GYnRs6FZ05AsH6y63y5FKK3RUN+e9vNrWeH2XLqvMY/qIn
         HbcfR5T8+Hzj3WcCD5F0dBw02oQ+ucZxi9rsLGmddZsvxTapMDwR/Yr2b0s4y1n84GAo
         mUBLPrKQqcYypXO8wUfE6FnMSvkMUyCxvnZ1eW3yFfc40+WbyhoZe+0Ey5CabRLg5XCr
         +sOoRK/FocIsYdOKq1+ZjdIH9vG8KnAp3fIija5VHMhQCQZMtFrC3xaJ7HWKAbpxVqPl
         k5Qxi/8/mu/7scFrCisFgjubNB+tX+U94yNuCgJMERpPi6lLJRQkz2dchBvtKjs7w6Vs
         Kx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tCwhucR2jYzOzAhHaj93G9eQkKme2+l5tf3lCT/bAk=;
        b=emonX0+xPXUZ/HWQXqxecF+7sUk3lptjJeDEEgPoglS6LbnvG9wBxmefRuAx3Tzt9R
         is8EL4iFlWHh5oUgdveVQsmg0gL8q6ueW4V8exM4snE7bISP7tPYTTTLXun1JM8kt8qZ
         FOyo7LgbyxxxJYeL4AQA0QVHPvfagKpRf0jSSPqsX5YmtAH8DsVoUY0dybBwDvyjB++M
         ZE5cmLkJD3qcMIKB/E7u+fVy74Ir2+l6jOX8FphAtLas/FUG1EJS80L88phYqu6OwMzk
         mnaTnvegOXTlUck3j/39LgOyQggyWBa6ypjdwOKQwtV4eSFpdT69o5xr7nqKetArc3hy
         dxJQ==
X-Gm-Message-State: ANoB5pmpMEP64jqZeBDugpH+d/eQAYtbFwTJkpwdVXlPhqZ6rCMjdxEF
	nBhnPK//yOBAUsbt486fU0XOEDMKvoGRyA==
X-Google-Smtp-Source: AA0mqf4xoUqKJ85rBZn4pK66bA0JfhfxdVrz3TCqLEzx4BH6Ag+Yx5Qv+O+vXXxE1GcMz0Fk+oj8ig==
X-Received: by 2002:a05:6000:124d:b0:236:a68f:23e2 with SMTP id j13-20020a056000124d00b00236a68f23e2mr621731wrx.521.1668671238214;
        Wed, 16 Nov 2022 23:47:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c311100b003cf4ec90938sm361808wmo.21.2022.11.16.23.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 23:47:17 -0800 (PST)
Date: Thu, 17 Nov 2022 10:47:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Ben Skeggs <bskeggs@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lyude Paul <lyude@redhat.com>
Subject: [linux-next:master 5613/8327]
 drivers/gpu/drm/nouveau/nouveau_dp.c:237 nouveau_dp_irq() warn: variable
 dereferenced before check 'outp' (see line 232)
Message-ID: <202211170722.QtP5uInh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221117074714.MkABlsrkVe01TMI9pWTrwDBEU_o9Jsr64Q5y9ieNblA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15f3bff12cf6a888ec2ad39652828c60e6836b3d
commit: 773eb04d14a11552b2c3953097ed09cde2ab4831 [5613/8327] drm/nouveau/disp: expose conn event class
config: loongarch-randconfig-m041-20221114
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/nouveau/nouveau_dp.c:237 nouveau_dp_irq() warn: variable dereferenced before check 'outp' (see line 232)

vim +/outp +237 drivers/gpu/drm/nouveau/nouveau_dp.c

773eb04d14a1155 Ben Skeggs 2022-06-01  225  void
773eb04d14a1155 Ben Skeggs 2022-06-01  226  nouveau_dp_irq(struct work_struct *work)
a0922278f83eae0 Lyude Paul 2020-08-26  227  {
773eb04d14a1155 Ben Skeggs 2022-06-01  228  	struct nouveau_connector *nv_connector =
773eb04d14a1155 Ben Skeggs 2022-06-01  229  		container_of(work, typeof(*nv_connector), irq_work);
a0922278f83eae0 Lyude Paul 2020-08-26  230  	struct drm_connector *connector = &nv_connector->base;
a0922278f83eae0 Lyude Paul 2020-08-26  231  	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
773eb04d14a1155 Ben Skeggs 2022-06-01 @232  	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
                                                                                      ^^^^^^
New dereference.

a0922278f83eae0 Lyude Paul 2020-08-26  233  	struct nv50_mstm *mstm;
016dacb60e6d4b3 Ben Skeggs 2022-06-01  234  	u64 hpd = 0;
a4efad354cf1b9d Lyude Paul 2020-08-26  235  	int ret;
a0922278f83eae0 Lyude Paul 2020-08-26  236  
a0922278f83eae0 Lyude Paul 2020-08-26 @237  	if (!outp)
                                                    ^^^^^
Checked too late.

a0922278f83eae0 Lyude Paul 2020-08-26  238  		return;
a0922278f83eae0 Lyude Paul 2020-08-26  239  
a0922278f83eae0 Lyude Paul 2020-08-26  240  	mstm = outp->dp.mstm;
a0922278f83eae0 Lyude Paul 2020-08-26  241  	NV_DEBUG(drm, "service %s\n", connector->name);
a0922278f83eae0 Lyude Paul 2020-08-26  242  
a0922278f83eae0 Lyude Paul 2020-08-26  243  	mutex_lock(&outp->dp.hpd_irq_lock);
a0922278f83eae0 Lyude Paul 2020-08-26  244  
a0922278f83eae0 Lyude Paul 2020-08-26  245  	if (mstm && mstm->is_mst) {
a0922278f83eae0 Lyude Paul 2020-08-26  246  		if (!nv50_mstm_service(drm, nv_connector, mstm))
773eb04d14a1155 Ben Skeggs 2022-06-01  247  			hpd |= NVIF_CONN_EVENT_V0_UNPLUG;
a0922278f83eae0 Lyude Paul 2020-08-26  248  	} else {
a0922278f83eae0 Lyude Paul 2020-08-26  249  		drm_dp_cec_irq(&nv_connector->aux);
a4efad354cf1b9d Lyude Paul 2020-08-26  250  
a4efad354cf1b9d Lyude Paul 2020-08-26  251  		if (nouveau_dp_has_sink_count(connector, outp)) {
a4efad354cf1b9d Lyude Paul 2020-08-26  252  			ret = drm_dp_read_sink_count(&nv_connector->aux);
a4efad354cf1b9d Lyude Paul 2020-08-26  253  			if (ret != outp->dp.sink_count)
773eb04d14a1155 Ben Skeggs 2022-06-01  254  				hpd |= NVIF_CONN_EVENT_V0_PLUG;
a4efad354cf1b9d Lyude Paul 2020-08-26  255  			if (ret >= 0)
a4efad354cf1b9d Lyude Paul 2020-08-26  256  				outp->dp.sink_count = ret;
a4efad354cf1b9d Lyude Paul 2020-08-26  257  		}
a0922278f83eae0 Lyude Paul 2020-08-26  258  	}
a0922278f83eae0 Lyude Paul 2020-08-26  259  
a0922278f83eae0 Lyude Paul 2020-08-26  260  	mutex_unlock(&outp->dp.hpd_irq_lock);
a4efad354cf1b9d Lyude Paul 2020-08-26  261  
773eb04d14a1155 Ben Skeggs 2022-06-01  262  	nouveau_connector_hpd(nv_connector, NVIF_CONN_EVENT_V0_IRQ | hpd);
a0922278f83eae0 Lyude Paul 2020-08-26  263  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

