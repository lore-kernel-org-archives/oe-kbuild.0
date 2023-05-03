Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C627704
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 16:57:22 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f19afc4fbfso54641015e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 03 May 2023 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683133039; x=1685725039;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qcEFUNqrSv8hU2EwUJ9bUu4poDYlKJmp96cwk1dCn30=;
        b=o+ayY+VGH7SCkI+isgiDjCaZAYLTvFp7P/aYmnyzRubk6t/g3MxNADA8nmbhl94sIH
         rrKAeJzXO1pDOgRvou0eeDKplIbtjNGhJPIGL+9PSnSkXg3xjT/PC5+jexXw4oJLN9He
         8zkpZuUt0j8SC0OWssg3hDbuegkau0XvD8rTtfAHYkLdsuXWeUCpWspqAl8qLRPR14AB
         5WuyQ328KlsdmaUJC5+rJs+EOBHU1IsjsDMI2nKpuKJ2FEkFnBPhPDA9SNvoxy2IVvs9
         CuMGMmuycFcODr2Hfh5X/qpCbCk8GEEsv+tp2udKYUmokoiTPwbKxy+yNcSQNH4O9NHT
         +QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683133039; x=1685725039;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcEFUNqrSv8hU2EwUJ9bUu4poDYlKJmp96cwk1dCn30=;
        b=d7t/j8MKchzYcgeP1t0A/rfNmuJBlG81z7HgV6eAYCrWCld6NM+7OofdowSI1Mcji1
         IS+OS8sPrSsGoDAxkZMLYAI5/sfCFYmwucKUMycrpgoRYMIuIX4S6lNUIUhJSdRAdbXa
         SPglbjDkuH2TUOm+Tmpu6NIV85VZ9fyICm9/K0juaZdXy1kjjOOn/6Nm5Y62bjl7fvac
         Mmc8K46ojG21rEN59EmYesnkPXQCKTK9mQMTUqT6urwKin8pKenM/K0FgXDLxqoa5w0l
         Fn17Vq32eE/g7rq95/VApFADcGVLP4qweFr/NOW21VTZshkOO5yV5oxnZt9S4PoUbkIL
         KW7g==
X-Gm-Message-State: AC+VfDxs3M23eiun3QayFMAG6FaO1RS4K9Y8bUAFfsFHgHOIWeDNQjcs
	Gm8z65t4tOttiMWPAH5zXsydKaGmAqec5YII7L8=
X-Google-Smtp-Source: ACHHUZ6wLdQMETiiNbn1dbLVdUNgLIYiPmcV0m79sxCMMpTd0hrChGFrc9Zphlr2n7w3s71+5KzsAA==
X-Received: by 2002:a05:600c:299:b0:3f2:50ab:1bba with SMTP id 25-20020a05600c029900b003f250ab1bbamr15515028wmk.19.1683133039587;
        Wed, 03 May 2023 09:57:19 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q7-20020a1cf307000000b003f18b52c73asm2381741wmq.24.2023.05.03.09.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 09:57:17 -0700 (PDT)
Date: Wed, 3 May 2023 19:57:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Piotr Raczynski <piotr.raczynski@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Subject: [tnguy-next-queue:dev-queue 13/36]
 drivers/net/ethernet/intel/ice/ice_irq.c:348 ice_free_irq() error: we
 previously assumed 'entry' could be null (see line 342)
Message-ID: <b9627c98-ec0a-4f87-91e4-478e7150b529@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   cf8d73244f3a7bf78ae4042f4d700da212be3dcc
commit: 1181d50520d25da05f2da1235054fd91964cc3d1 [13/36] ice: add dynamic interrupt allocation
config: openrisc-randconfig-m031-20230430 (https://download.01.org/0day-ci/archive/20230503/202305032317.RAOFS8W5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305032317.RAOFS8W5-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_irq.c:348 ice_free_irq() error: we previously assumed 'entry' could be null (see line 342)

vim +/entry +348 drivers/net/ethernet/intel/ice/ice_irq.c

f71fc417ba04cac Piotr Raczynski 2023-03-23  336  void ice_free_irq(struct ice_pf *pf, struct msi_map map)
f71fc417ba04cac Piotr Raczynski 2023-03-23  337  {
1181d50520d25da Piotr Raczynski 2023-03-23  338  	struct ice_irq_entry *entry;
1181d50520d25da Piotr Raczynski 2023-03-23  339  
1181d50520d25da Piotr Raczynski 2023-03-23  340  	entry = xa_load(&pf->irq_tracker.entries, map.index);
1181d50520d25da Piotr Raczynski 2023-03-23  341  
1181d50520d25da Piotr Raczynski 2023-03-23 @342  	if (!entry)
1181d50520d25da Piotr Raczynski 2023-03-23  343  		dev_err(ice_pf_to_dev(pf), "Failed to get MSIX interrupt entry at index %d",
1181d50520d25da Piotr Raczynski 2023-03-23  344  			map.index);

return;?

1181d50520d25da Piotr Raczynski 2023-03-23  345  
1181d50520d25da Piotr Raczynski 2023-03-23  346  	dev_dbg(ice_pf_to_dev(pf), "Free irq at index %d\n", map.index);
1181d50520d25da Piotr Raczynski 2023-03-23  347  
1181d50520d25da Piotr Raczynski 2023-03-23 @348  	if (entry->dynamic)
1181d50520d25da Piotr Raczynski 2023-03-23  349  		pci_msix_free_irq(pf->pdev, map);
1181d50520d25da Piotr Raczynski 2023-03-23  350  
1261628bc347e3d Piotr Raczynski 2023-03-23  351  	ice_free_irq_res(pf, map.index);
f71fc417ba04cac Piotr Raczynski 2023-03-23  352  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

