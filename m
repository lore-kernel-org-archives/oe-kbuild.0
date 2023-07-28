Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8979EE
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 05:45:50 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b974031aeaso26035841fa.0
        for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 22:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690523148; x=1691127948;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/sQXttJnykhKVDMwbiijzxff1XBZQFDGDEMk6NB3ReU=;
        b=kgLA/R1R1IDZO40aa97Pv2S7Goyt+AhDthxuhRtWcKwutIS6WTZdb213eaJM2Sn9Z+
         M+o07TTT1+v2BXmNZ8m9s3g/jrDNphfJZTlFSXVLixA9qSt4A5vAMhP27cxgAcOf0w5c
         yxrkkA4yPa2KYrPqrDGYqivGHZB4MJBQrRvSGiDcmEQpZ99n61KwdyGYZSoWq/h6K72Q
         U751DTGH7pkMqUb/SOehaSyi5PCufa0CpBBk0nDy0yQb4a4wEmF7dc2kc7VAkuW20U9e
         UwKzr4C65oHBPAHlTiRerQfguua1fKxtVXGAmAi+D8AtlnvVVJx2xrUTdjG9jOtB9UDh
         Yd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690523148; x=1691127948;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/sQXttJnykhKVDMwbiijzxff1XBZQFDGDEMk6NB3ReU=;
        b=iueEzW3t1reKUp2AqQ3OPouSMFHc6kLLuOyJe4mFCx6qP43uP1NYJ8SxXVnNxId95W
         a3O2nYH2b9tFyVXaUiCLBLrCoHlnZnu74KZCK+7DSulBdCrapfmg0LbW+Emi1/tKszcZ
         l9vj6CKSxhSmJ8VtJuL2pz9oQGfL/xkSThHhaSvaHPFxIzSVPrJQ1Dm+y7XncnqqdaOz
         TH+eLRUy2RK3YUPSOi76e/XUruwfmLJKMccedvZLfM75O4dPfTi7HFBYCOUxCzrZ+uH2
         xTTFjWHvLH5VH8PMFoWfzMN/dHHpPAqWTa5qRqbSdK+NUpMCT+b4k0VWFTjfjGb3qsWL
         sZRw==
X-Gm-Message-State: ABy/qLaro8x2PBIMfVN3oYPDoncKKbZ1gguZSP2odhZAn9VsXSdYgS8H
	rQviw9bD42psU35/nHPcwDIueSdo0xDSEHNuKwI=
X-Google-Smtp-Source: APBJJlGyGsI4r7dzgYdqmWjNyQNwwjtQNvH3s0KWZh0XKpQ9Uit9XoQBlL9VtgG1IsIjaGSyBxO2oA==
X-Received: by 2002:a2e:b0ce:0:b0:2b7:1dd:b416 with SMTP id g14-20020a2eb0ce000000b002b701ddb416mr897908ljl.15.1690523147893;
        Thu, 27 Jul 2023 22:45:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r13-20020adff70d000000b00313f9085119sm3765216wrp.113.2023.07.27.22.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 22:45:47 -0700 (PDT)
From: kernel test robot <dan.carpenter@linaro.org>
X-Google-Original-From: kernel test robot <lkp@intel.com>
Date: Fri, 28 Jul 2023 08:45:44 +0300
To: oe-kbuild@lists.linux.dev, Caleb Connolly <caleb.connolly@linaro.org>
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: drivers/power/supply/qcom_pmi8998_charger.c:565
 smb2_status_change_work() error: uninitialized symbol 'usb_online'.
Message-ID: <ZMNWCD66TAhahJ2Y@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57012c57536f8814dec92e74197ee96c3498d24e
commit: 8648aeb5d7b70e13264ff5f444f22081d37d4670 power: supply: add Qualcomm PMI8998 SMB2 Charger driver
config: arm-randconfig-m041-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280638.556PrzIS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280638.556PrzIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307280638.556PrzIS-lkp@intel.com/

smatch warnings:
drivers/power/supply/qcom_pmi8998_charger.c:565 smb2_status_change_work() error: uninitialized symbol 'usb_online'.

vim +/usb_online +565 drivers/power/supply/qcom_pmi8998_charger.c

8648aeb5d7b70e Caleb Connolly 2023-05-26  556  static void smb2_status_change_work(struct work_struct *work)
8648aeb5d7b70e Caleb Connolly 2023-05-26  557  {
8648aeb5d7b70e Caleb Connolly 2023-05-26  558  	unsigned int charger_type, current_ua;
8648aeb5d7b70e Caleb Connolly 2023-05-26  559  	int usb_online, count, rc;
8648aeb5d7b70e Caleb Connolly 2023-05-26  560  	struct smb2_chip *chip;
8648aeb5d7b70e Caleb Connolly 2023-05-26  561  
8648aeb5d7b70e Caleb Connolly 2023-05-26  562  	chip = container_of(work, struct smb2_chip, status_change_work.work);
8648aeb5d7b70e Caleb Connolly 2023-05-26  563  
8648aeb5d7b70e Caleb Connolly 2023-05-26  564  	smb2_get_prop_usb_online(chip, &usb_online);

This can only happen if regmap_read() fails, and in real life they
can't actually fail can they?  We can't really recover if regmap
breaks so in that situation this uninitialized variable would be the
least of our concerns.  Right?

So what I could do is just delete the regmap_read error paths from
the DB.  I just add these two lines to smatch_data/db/kernel.delete.return_states

regmap_read (-22)
regmap_read (-4095)-(-1)

8648aeb5d7b70e Caleb Connolly 2023-05-26 @565  	if (!usb_online)
                                                     ^^^^^^^^^^

8648aeb5d7b70e Caleb Connolly 2023-05-26  566  		return;
8648aeb5d7b70e Caleb Connolly 2023-05-26  567  
8648aeb5d7b70e Caleb Connolly 2023-05-26  568  	for (count = 0; count < 3; count++) {
8648aeb5d7b70e Caleb Connolly 2023-05-26  569  		dev_dbg(chip->dev, "get charger type retry %d\n", count);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
