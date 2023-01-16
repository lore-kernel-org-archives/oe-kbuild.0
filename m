Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4B51FB4
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 12:32:21 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso30948367pjf.1
        for <oe-kbuild@lists.linux.dev>; Mon, 16 Jan 2023 04:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6jhXVeZj3sO/tuUlaQsdeBNyp/PhhJvgN96rYmKb5i0=;
        b=pIRuxEOOjHvC13Fw5vC7vy9ty9Uk3lJKccR4rAlq3J68yWTuxFmYr6mjleM12U1os9
         +ea2Buac1sqiNemABGgtvpxECZIpTZ5cW8fkU+Ug3x8tzTlj/qpfBlf0db3q2fIF4/zJ
         WX0wrCYbzSwrjmrsqWwakJGddd/DXEl90WA32FxtsAIhzz7278wGV7zThYSONSj3IUez
         rj7dQHn68WFKgheGfU5Al3BZxEjzV5GHE7wlaSOJUcifpP/ThlKPGnlgWZZI8xWo3ucl
         pLKOBMMPdryiKA29KktG0eOfVN5vh1qLO96rvhazTliD5J6G1Q9Q9gBtpW5vo5qxFGnz
         PRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jhXVeZj3sO/tuUlaQsdeBNyp/PhhJvgN96rYmKb5i0=;
        b=l7LWjVF4q59SKs0U0sbYOjQdtWlSSOWDRkcwkGQHE61I5QFHZAWaNTp1ud5NA4HnGz
         i/DEU1xMqaui8oC2nINlG3UVhMr+a/MXip4ymimi5BE7h/ITNaym3VQeN+5SQr9DLipH
         ROdF3KRUrKw44++NuEXkByHEZzaBybGrG5UOhfxlrjs3n8JUYylbuOLqYnXTJmCmDDaC
         mbxCbm3KDDUgTEqaUl9/2tNZ4+qJlkxtp15bS8yw0zTL7BlU20ZaztEEQ+2raXr0xTBu
         jA+Bs4I8i1G/Sc09vYmI57ys+BqEj1Oi+fIpGSUQmSSVdGk6hL5Je0JXSaPgu0hpI9Qx
         KGJg==
X-Gm-Message-State: AFqh2kqLaBo5Qv96bqODrNrEA7HUDADQjdnwG1r3k3CuNjWAA6BTTbxU
	S5ZVSDN2Y/RGqvzajYcpcYYdKFm59SShnVKc3JO+XQ==
X-Google-Smtp-Source: AMrXdXu3o4PpTxE/H1KZemRNBlTBp4R7zzW6f9SXdERFAFvHV2e8V77Yo57ybKszjl9GCVLJvPSU529Hdi9tujPrdE0=
X-Received: by 2002:a17:903:2484:b0:194:706a:ad18 with SMTP id
 p4-20020a170903248400b00194706aad18mr735042plw.18.1673872340790; Mon, 16 Jan
 2023 04:32:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221219234638.3661-4-mike.leach@linaro.org> <202212240621.sgsPYIdK-lkp@intel.com>
In-Reply-To: <202212240621.sgsPYIdK-lkp@intel.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 16 Jan 2023 12:32:09 +0000
Message-ID: <CAJ9a7ViJZre-X563M6tc+_rbi_LRc11z5THRSw3iK6Fxd4SwYw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] coresight: configfs: Add in binary attributes to
 load files
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	coresight@lists.linaro.org, linux-kernel@vger.kernel.org, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, mathieu.poirier@linaro.org, 
	suzuki.poulose@arm.com, acme@kernel.org, james.clark@arm.com
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for this - I'll fix in next set

Mike

On Sat, 24 Dec 2022 at 07:16, Dan Carpenter <error27@gmail.com> wrote:
>
> Hi Mike,
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Leach/coresight-syscfg-Extend-configfs-for-config-load/20221220-074850
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> patch link:    https://lore.kernel.org/r/20221219234638.3661-4-mike.leach%40linaro.org
> patch subject: [PATCH v5 3/6] coresight: configfs: Add in binary attributes to load files
> config: arm-randconfig-m041-20221218
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
>
> smatch warnings:
> drivers/hwtracing/coresight/coresight-syscfg-configfs.c:595 cscfg_cfg_load_write() warn: possible memory leak of 'load_descs'
>
> vim +/load_descs +595 drivers/hwtracing/coresight/coresight-syscfg-configfs.c
>
> 97b8fd654556b1 Mike Leach 2022-12-19  543  static ssize_t cscfg_cfg_load_write(struct config_item *item, const void *buffer, size_t size)
> 97b8fd654556b1 Mike Leach 2022-12-19  544  {
> 97b8fd654556b1 Mike Leach 2022-12-19  545       struct cscfg_fs_load_descs *load_descs = 0;
> 97b8fd654556b1 Mike Leach 2022-12-19  546       struct cscfg_load_owner_info *owner_info = 0;
> 97b8fd654556b1 Mike Leach 2022-12-19  547       int err = 0;
> 97b8fd654556b1 Mike Leach 2022-12-19  548
> 97b8fd654556b1 Mike Leach 2022-12-19  549       /* ensure we cannot simultaneously load and unload */
> 97b8fd654556b1 Mike Leach 2022-12-19  550       if (!mutex_trylock(&cfs_mutex))
> 97b8fd654556b1 Mike Leach 2022-12-19  551               return -EBUSY;
> 97b8fd654556b1 Mike Leach 2022-12-19  552
> 97b8fd654556b1 Mike Leach 2022-12-19  553       /* check configfs load / unload ops are permitted */
> 97b8fd654556b1 Mike Leach 2022-12-19  554       if (!cscfg_fs_load_enabled || unload_owner_info) {
> 97b8fd654556b1 Mike Leach 2022-12-19  555               err = -EBUSY;
> 97b8fd654556b1 Mike Leach 2022-12-19  556               goto exit_unlock;
> 97b8fd654556b1 Mike Leach 2022-12-19  557       }
> 97b8fd654556b1 Mike Leach 2022-12-19  558
> 97b8fd654556b1 Mike Leach 2022-12-19  559       if (size > CSCFG_FILE_MAXSIZE) {
> 97b8fd654556b1 Mike Leach 2022-12-19  560               pr_err("cscfg: Load error - Input file too large.\n");
> 97b8fd654556b1 Mike Leach 2022-12-19  561               err = -EINVAL;
> 97b8fd654556b1 Mike Leach 2022-12-19  562               goto exit_unlock;
> 97b8fd654556b1 Mike Leach 2022-12-19  563       }
> 97b8fd654556b1 Mike Leach 2022-12-19  564
> 97b8fd654556b1 Mike Leach 2022-12-19  565       load_descs = kzalloc(sizeof(struct cscfg_fs_load_descs), GFP_KERNEL);
> 97b8fd654556b1 Mike Leach 2022-12-19  566       owner_info = kzalloc(sizeof(struct cscfg_load_owner_info), GFP_KERNEL);
> 97b8fd654556b1 Mike Leach 2022-12-19  567       if (!load_descs || !owner_info) {
> 97b8fd654556b1 Mike Leach 2022-12-19  568               err = -ENOMEM;
> 97b8fd654556b1 Mike Leach 2022-12-19  569               goto exit_memfree;
>
> This exit leaks (will never happen in real life though).
>
> 97b8fd654556b1 Mike Leach 2022-12-19  570       }
> 97b8fd654556b1 Mike Leach 2022-12-19  571
> 97b8fd654556b1 Mike Leach 2022-12-19  572       owner_info->owner_handle = load_descs;
> 97b8fd654556b1 Mike Leach 2022-12-19  573       owner_info->type = CSCFG_OWNER_CONFIGFS;
> 97b8fd654556b1 Mike Leach 2022-12-19  574
> 97b8fd654556b1 Mike Leach 2022-12-19  575       err = cscfg_file_read_buffer(buffer, size, load_descs);
> 97b8fd654556b1 Mike Leach 2022-12-19  576       if (err) {
> 97b8fd654556b1 Mike Leach 2022-12-19  577               pr_err("cscfg: Load error - Failed to read input file.\n");
> 97b8fd654556b1 Mike Leach 2022-12-19  578               goto exit_memfree;
> 97b8fd654556b1 Mike Leach 2022-12-19  579       }
> 97b8fd654556b1 Mike Leach 2022-12-19  580
> 97b8fd654556b1 Mike Leach 2022-12-19  581       err = cscfg_load_config_sets(load_descs->config_descs, load_descs->feat_descs, owner_info);
> 97b8fd654556b1 Mike Leach 2022-12-19  582       if (err) {
> 97b8fd654556b1 Mike Leach 2022-12-19  583               pr_err("cscfg: Load error - Failed to load configuaration file.\n");
> 97b8fd654556b1 Mike Leach 2022-12-19  584               goto exit_memfree;
> 97b8fd654556b1 Mike Leach 2022-12-19  585       }
> 97b8fd654556b1 Mike Leach 2022-12-19  586
> 97b8fd654556b1 Mike Leach 2022-12-19  587       mutex_unlock(&cfs_mutex);
> 97b8fd654556b1 Mike Leach 2022-12-19  588       return size;
> 97b8fd654556b1 Mike Leach 2022-12-19  589
> 97b8fd654556b1 Mike Leach 2022-12-19  590  exit_memfree:
> 97b8fd654556b1 Mike Leach 2022-12-19  591       cscfg_configfs_free_owner_info(owner_info);
> 97b8fd654556b1 Mike Leach 2022-12-19  592
> 97b8fd654556b1 Mike Leach 2022-12-19  593  exit_unlock:
> 97b8fd654556b1 Mike Leach 2022-12-19  594       mutex_unlock(&cfs_mutex);
> 97b8fd654556b1 Mike Leach 2022-12-19 @595       return err;
> 97b8fd654556b1 Mike Leach 2022-12-19  596  }
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
