Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D7219ED
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 09:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9sgPA4j"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c878e228b4so46355881fa.1
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 01:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700644995; x=1701249795; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhC1asTv/RX7QF9kMol6kJpFTRWUtwkcm7USZ02jYEQ=;
        b=u9sgPA4jOTPgh5Ap9P6xojgOwu+XJtb1q6fJtTpOq77VNiOTjf3J9WRrAZKotcBYKT
         F+Vv8ca7Snk8UP85O15exSwvEhVac1gwTYkKIQRhvP9eBVB9Xklsw7+2q2AW7AGGVbqp
         e0tuBrQPvZaohIA6V2Ekk19+75nc14zaKVArd+INs86vM16OKB4E3+8ySST92IgblfAa
         uvijPY1hkD7IgTDH5GbUFHfHREzYYa1ay+xf7ongO4i3oXJxmcbjIcLc0WA2NszK+pYO
         cf+yKBTvunrD4o4CELfIjT2CrEVr6eEJx1s6KAPBrFzXMveiedwwU3ohV3jSTkipSfav
         4Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700644995; x=1701249795;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhC1asTv/RX7QF9kMol6kJpFTRWUtwkcm7USZ02jYEQ=;
        b=DqmbvzSpnlnA7vGPRZHhpl5Z67rBCwnRD+dZJJTQWoTT762gscGJm8zIOkSvzsq65v
         p4AaVjzRzZd8/r48BPfils/B3s5boSs+K4wTA/prhq96aQjAZ9yz9/tElQm3fo6MaeyD
         9Jx7IQoaMzaZKRNlMgsM92R4UFkgixLGo4hdWjTsVrrImJemqGWc6AsubI2rJ42og5JZ
         RNj1872MiCiKpVVTsK/+pCfYuwCBW/ksdi1eGeOJ9pGB0JjqiGtyWMHviU3rbnfHZ1Cg
         DZGrTS77R3vV8Wzk+vA+/Xq5X/sKKuA/3Hb1lV7yGgciE12xvi+V3dffbUXhDSyxTT2X
         pmhQ==
X-Gm-Message-State: AOJu0YyQNUeZ1NyPU0SB0ya2bgRqU2tn3fWsRB5ZpgtdP4mK9V32zq6l
	AUSycPxw+n4I56eo8nSsFhZaMsF6nHwLwX23orE=
X-Google-Smtp-Source: AGHT+IFC9A4xkbgVPJSLpWSTZPDF0VLLciqEZwb/ASpE58NNXzwVw56OuwAKDW2H2DK7/NKV8m71bQ==
X-Received: by 2002:a05:651c:50c:b0:2c5:19ab:7270 with SMTP id o12-20020a05651c050c00b002c519ab7270mr1295603ljp.35.1700644995201;
        Wed, 22 Nov 2023 01:23:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c19c900b0040a4751efaasm1518204wmq.17.2023.11.22.01.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 01:23:14 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Nov 2023 04:23:11 -0500
To: oe-kbuild@lists.linux.dev, SEO HOYOUNG <hy50.seo@samsung.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com, avri.altman@wdc.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, beanhuo@micron.com, bvanassche@acm.org,
	kwangwon.min@samsung.com, kwmad.kim@samsung.com,
	sh425.lee@samsung.com, sc.suh@samsung.com, quic_nguyenb@quicinc.com,
	cpgs@samsung.com, grant.jung@samsung.com, junwoo80.lee@samsung.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	SEO HOYOUNG <hy50.seo@samsung.com>
Subject: Re: [PATCH v3] scsi: ufs: core: fix racing issue during
 ufshcd_mcq_abort
Message-ID: <5cd4171c-d992-4e3c-96c7-91bb0ae9feb6@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121071128.7743-1-hy50.seo@samsung.com>

Hi SEO,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/SEO-HOYOUNG/scsi-ufs-core-fix-racing-issue-during-ufshcd_mcq_abort/20231121-151923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231121071128.7743-1-hy50.seo%40samsung.com
patch subject: [PATCH v3] scsi: ufs: core: fix racing issue during ufshcd_mcq_abort
config: powerpc-randconfig-r071-20231122 (https://download.01.org/0day-ci/archive/20231122/202311220618.OnEhSic6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311220618.OnEhSic6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311220618.OnEhSic6-lkp@intel.com/

smatch warnings:
drivers/ufs/core/ufs-mcq.c:515 ufshcd_mcq_sq_cleanup() warn: variable dereferenced before check 'cmd' (see line 511)

vim +/cmd +515 drivers/ufs/core/ufs-mcq.c

8d7290348992f2 Bao D. Nguyen   2023-05-29  498  int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
8d7290348992f2 Bao D. Nguyen   2023-05-29  499  {
8d7290348992f2 Bao D. Nguyen   2023-05-29  500  	struct ufshcd_lrb *lrbp = &hba->lrb[task_tag];
8d7290348992f2 Bao D. Nguyen   2023-05-29  501  	struct scsi_cmnd *cmd = lrbp->cmd;
8d7290348992f2 Bao D. Nguyen   2023-05-29  502  	struct ufs_hw_queue *hwq;
8d7290348992f2 Bao D. Nguyen   2023-05-29  503  	void __iomem *reg, *opr_sqd_base;
8d7290348992f2 Bao D. Nguyen   2023-05-29  504  	u32 nexus, id, val;
8d7290348992f2 Bao D. Nguyen   2023-05-29  505  	int err;
8d7290348992f2 Bao D. Nguyen   2023-05-29  506  
aa9d5d0015a8b7 Po-Wen Kao      2023-06-12  507  	if (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_RTC)
aa9d5d0015a8b7 Po-Wen Kao      2023-06-12  508  		return -ETIMEDOUT;
aa9d5d0015a8b7 Po-Wen Kao      2023-06-12  509  
5363c9d813101c SEO HOYOUNG     2023-11-21  510  	if (!ufshcd_cmd_inflight(cmd) ||
5363c9d813101c SEO HOYOUNG     2023-11-21 @511  	    test_bit(SCMD_STATE_COMPLETE, &cmd->state))
                                                                                          ^^^^^^^^^^^
The patch adds a new unchecked dereference

5363c9d813101c SEO HOYOUNG     2023-11-21  512  		return 0;
5363c9d813101c SEO HOYOUNG     2023-11-21  513  
8d7290348992f2 Bao D. Nguyen   2023-05-29  514  	if (task_tag != hba->nutrs - UFSHCD_NUM_RESERVED) {
8d7290348992f2 Bao D. Nguyen   2023-05-29 @515  		if (!cmd)
                                                                     ^^^
But the old code assumed "cmd" could be NULL

8d7290348992f2 Bao D. Nguyen   2023-05-29  516  			return -EINVAL;
8d7290348992f2 Bao D. Nguyen   2023-05-29  517  		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(cmd));
8d7290348992f2 Bao D. Nguyen   2023-05-29  518  	} else {
8d7290348992f2 Bao D. Nguyen   2023-05-29  519  		hwq = hba->dev_cmd_queue;
8d7290348992f2 Bao D. Nguyen   2023-05-29  520  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

