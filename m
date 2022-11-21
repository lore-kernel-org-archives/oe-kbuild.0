Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A33EEC0;
	Mon, 21 Nov 2022 10:51:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id x17so5773215wrn.6;
        Mon, 21 Nov 2022 02:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4FGldqynRCiqXRUo4xNSPtxVlcysCrx4pWfhhlBwkcw=;
        b=Lmmmq7sHpH5fpbXVqwOinjSKvQwU40CB7/b7UDWZeq26oGx8H5ju4XMfg8yBET+9Fk
         UWpdIzUP8Nbg8jZiBPEbAD7sa15jhANGfUF3zHt6NKVPGPArbSr21MdUdW1BVZjjjXPJ
         djsjpEpj9msJdhzGyZTlFqFzqlKm2SuYKEWlS3fcpxbfcAApBhrMwShe6w/KgN/AAk+D
         Nqs7VtSON4b4Syv3ZJR9ApCr1bRFZHHEHPMInGuOOonhueXi+7qhxyvUAP/fncAZj6PO
         OjrzerBN7EPFwlH/LjknVnvzFtWAOnIbgPoZaFykRZEOZTKKg/Aw5tVI0l8sdeGPvxQ9
         7NAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FGldqynRCiqXRUo4xNSPtxVlcysCrx4pWfhhlBwkcw=;
        b=XGeMbRsT+4pHjLy+0wZMmnj280lEmmj24DgvSdHLbnnuKyhGXbBBTlCnKdZ9fpkHYF
         BcK6nxj0swC2DzXDLsASHqNqwwIB1S5EKaY0EjUj6nTO1hQFavCChum/gxgEZONwaAnu
         azY4BJeME9a4asOwAveETWjIK3dJAflLp8hDA2SxeQ3ruPkha39Es5Z6N1GAl+UliQQ4
         RtqcrLAv75/w+V9apBt/7VZKbhIjTwxMM0+wmgp1/5ggFeQV3BQe6jYuGlNmM0JHbSuC
         VdIk8qJlyiznGKxfdBp7+DMBd4p5fhdSn9AGgBMOOM641B0oe9G3dExnb5Rn6enL3QlB
         AVhA==
X-Gm-Message-State: ANoB5pnvSmBIgd4juesv76HOXQZtE3GKpzPg0iFBy1gmEDfthtyW/A0q
	FyNgcqlTKnCIfmUWvazU2XTkrQAO5JK6zg==
X-Google-Smtp-Source: AA0mqf4C+pAcZgGuV/YeJodklufdO1mng9kRRGeXzP1Fn5ejgXJLOQWDHOXEgm/ccmziqim/r9ZFdw==
X-Received: by 2002:adf:e50f:0:b0:22c:cc75:5aab with SMTP id j15-20020adfe50f000000b0022ccc755aabmr10301515wrm.143.1669027859075;
        Mon, 21 Nov 2022 02:50:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id dn12-20020a05600c654c00b003cf6c2f9513sm13659737wmb.2.2022.11.21.02.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 02:50:58 -0800 (PST)
Date: Mon, 21 Nov 2022 13:50:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
Message-ID: <202211210539.6lHevRnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114102956.914468-4-ckeepax@opensource.cirrus.com>
Message-ID: <20221121105055.JxIlYwqY0aZ21He57U463Pr-q3GKmfwiLfxYVXwWvIw@z>

Hi Charles,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/Minor-SoundWire-clean-ups/20221114-183333
patch link:    https://lore.kernel.org/r/20221114102956.914468-4-ckeepax%40opensource.cirrus.com
patch subject: [PATCH 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
config: loongarch-randconfig-m041-20221114
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/soundwire/debugfs.c:61 sdw_slave_reg_show() warn: possible memory leak of 'buf'

vim +/buf +61 drivers/soundwire/debugfs.c

bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   48  static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   49  {
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   50  	struct sdw_slave *slave = s_file->private;
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   51  	char *buf;
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   52  	ssize_t ret;
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   53  	int i, j;
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   54  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   55  	buf = kzalloc(RD_BUF, GFP_KERNEL);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   56  	if (!buf)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   57  		return -ENOMEM;
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   58  
f3345eda607ecc Charles Keepax       2022-11-14   59  	ret = pm_runtime_resume_and_get(&slave->dev);
f3345eda607ecc Charles Keepax       2022-11-14   60  	if (ret < 0 && ret != -EACCES)
f3345eda607ecc Charles Keepax       2022-11-14  @61  		return ret;

kfree(buf);

f3345eda607ecc Charles Keepax       2022-11-14   62  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   63  	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   64  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   65  	/* DP0 non-banked registers */
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   66  	ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP0\n");
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   67  	for (i = SDW_DP0_INT; i <= SDW_DP0_PREPARECTRL; i++)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   68  		ret += sdw_sprintf(slave, buf, ret, i);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   69  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   70  	/* DP0 Bank 0 registers */
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   71  	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   72  	ret += sdw_sprintf(slave, buf, ret, SDW_DP0_CHANNELEN);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   73  	for (i = SDW_DP0_SAMPLECTRL1; i <= SDW_DP0_LANECTRL; i++)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   74  		ret += sdw_sprintf(slave, buf, ret, i);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   75  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   76  	/* DP0 Bank 1 registers */
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   77  	ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   78  	ret += sdw_sprintf(slave, buf, ret,
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   79  			SDW_DP0_CHANNELEN + SDW_BANK1_OFFSET);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   80  	for (i = SDW_DP0_SAMPLECTRL1 + SDW_BANK1_OFFSET;
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   81  			i <= SDW_DP0_LANECTRL + SDW_BANK1_OFFSET; i++)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   82  		ret += sdw_sprintf(slave, buf, ret, i);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   83  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   84  	/* SCP registers */
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   85  	ret += scnprintf(buf + ret, RD_BUF - ret, "\nSCP\n");
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   86  	for (i = SDW_SCP_INT1; i <= SDW_SCP_BANKDELAY; i++)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   87  		ret += sdw_sprintf(slave, buf, ret, i);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   88  	for (i = SDW_SCP_DEVID_0; i <= SDW_SCP_DEVID_5; i++)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   89  		ret += sdw_sprintf(slave, buf, ret, i);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   90  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   91  	/*
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   92  	 * SCP Bank 0/1 registers are read-only and cannot be
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   93  	 * retrieved from the Slave. The Master typically keeps track
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   94  	 * of the current frame size so the information can be found
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   95  	 * in other places
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   96  	 */
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   97  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   98  	/* DP1..14 registers */
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21   99  	for (i = 1; SDW_VALID_PORT_RANGE(i); i++) {
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  100  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  101  		/* DPi registers */
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  102  		ret += scnprintf(buf + ret, RD_BUF - ret, "\nDP%d\n", i);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  103  		for (j = SDW_DPN_INT(i); j <= SDW_DPN_PREPARECTRL(i); j++)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  104  			ret += sdw_sprintf(slave, buf, ret, j);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  105  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  106  		/* DPi Bank0 registers */
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  107  		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank0\n");
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  108  		for (j = SDW_DPN_CHANNELEN_B0(i);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  109  		     j <= SDW_DPN_LANECTRL_B0(i); j++)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  110  			ret += sdw_sprintf(slave, buf, ret, j);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  111  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  112  		/* DPi Bank1 registers */
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  113  		ret += scnprintf(buf + ret, RD_BUF - ret, "Bank1\n");
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  114  		for (j = SDW_DPN_CHANNELEN_B1(i);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  115  		     j <= SDW_DPN_LANECTRL_B1(i); j++)
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  116  			ret += sdw_sprintf(slave, buf, ret, j);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  117  	}
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  118  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  119  	seq_printf(s_file, "%s", buf);
f3345eda607ecc Charles Keepax       2022-11-14  120  
f3345eda607ecc Charles Keepax       2022-11-14  121  	pm_runtime_mark_last_busy(&slave->dev);
f3345eda607ecc Charles Keepax       2022-11-14  122  	pm_runtime_put(&slave->dev);
f3345eda607ecc Charles Keepax       2022-11-14  123  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  124  	kfree(buf);
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  125  
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  126  	return 0;
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  127  }
bf03473d5bcc85 Pierre-Louis Bossart 2019-08-21  128  DEFINE_SHOW_ATTRIBUTE(sdw_slave_reg);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

