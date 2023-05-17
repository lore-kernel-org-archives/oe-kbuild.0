Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF2D31EEA
	for <oe-kbuild@lists.linux.dev>; Wed, 17 May 2023 17:34:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f42bcf5df1so10576205e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 17 May 2023 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684344882; x=1686936882;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45ckMM3KNq9UeTwXKcdVUueEtIZIan+RBbBzBSqyF0c=;
        b=qQNzdv/V5iU4YCHC8hZOWE72gHmYGwyGnu9f665Z5OH3jCh0zjv5KWENiTIPALsUPF
         JgcXbwnIoHYsMWrhBNG3Aw93917rhdG6lGA5mfW9B3LnyXMsXqYNnAt4POUkDXTVN8wM
         GjmpQTaUYkCdmUl1K1WXXJdC99uvNCvq3sISXSdTVXE4xl/J9ncNyUayNEax/AMBOxmD
         kcNr4/vgUwpp1R3a/S+ncEe3B3T83xRrJYCQ4BYBHABD+i7JhUgDl36Exl6quQtbn3uU
         h0WJEjp+275rC3xdyniCWE0pCYjMF6Vas9Eqc+QIBaJ1+28P42CaCvf86Y3ODRUh5Si0
         u5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684344882; x=1686936882;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45ckMM3KNq9UeTwXKcdVUueEtIZIan+RBbBzBSqyF0c=;
        b=FATX6+qDr3SV9BgaS6VA+Lh3yTo7GvU7WVahg3HTqtFpZwJm6IypRCyOgOYrP4Fa29
         OPs8vP9SbpOhwJY9xkJ+emeYwtzIxEDaLtcR90X8H2e6wINiH/RtkmKXIxjIcJA0EQSy
         9pOtoD0veQ7lBD6q0HJpE1thR3Shkv8pWscupWg2P+K3ZsZZWMuMv3usqyGs8x+C1Bz6
         vo9LIFLhxxhuMyUxzHBt+GXjUrnUa4/vK/wDggY1oP2rQ3eMzgN44QWT9tZMF4t7sfVW
         qSB47Wv4e1Afx7CsdJk+tbTOh26tZLo4qk+XdDKMqYcLAhIiRU4aPkl/a+OxDB3ir4VZ
         fEbg==
X-Gm-Message-State: AC+VfDxw25c85XfADTIV38JfJowyVYE6oal7L7Ev9c4j/spoOV+YxZw1
	WRCi2dmpXO61VsOiguoyIN6cdjx8UeGaia2+mDY=
X-Google-Smtp-Source: ACHHUZ5mOfD64msDRSYPeroW5IbEzOp+QER3sRmrxIjX+IMK/isTilhVxkRBB40HND5Y1ez601Iy0w==
X-Received: by 2002:adf:f108:0:b0:306:45ff:b527 with SMTP id r8-20020adff108000000b0030645ffb527mr1244713wro.45.1684344882209;
        Wed, 17 May 2023 10:34:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e5-20020adffc45000000b0030630de6fbdsm3719871wrs.13.2023.05.17.10.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 10:34:40 -0700 (PDT)
Date: Wed, 17 May 2023 20:34:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mia Lin <mimi05633@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: drivers/rtc/rtc-nct3018y.c:112 nct3018y_get_alarm_mode() error: we
 previously assumed 'alarm_enable' could be null (see line 96)
Message-ID: <6ac4b277-b8ff-4ffa-8786-80f7709155e2@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
commit: 5adbaed16cc63542057627642d2414f603f2db69 rtc: Add NCT3018Y real time clock driver
config: microblaze-randconfig-m031-20230517
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305180042.DEzW1pSd-lkp@intel.com/

smatch warnings:
drivers/rtc/rtc-nct3018y.c:112 nct3018y_get_alarm_mode() error: we previously assumed 'alarm_enable' could be null (see line 96)
drivers/rtc/rtc-nct3018y.c:112 nct3018y_get_alarm_mode() error: we previously assumed 'alarm_flag' could be null (see line 104)

vim +/alarm_enable +112 drivers/rtc/rtc-nct3018y.c

5adbaed16cc635 Mia Lin 2022-07-13   91  static int nct3018y_get_alarm_mode(struct i2c_client *client, unsigned char *alarm_enable,
5adbaed16cc635 Mia Lin 2022-07-13   92  				   unsigned char *alarm_flag)
5adbaed16cc635 Mia Lin 2022-07-13   93  {
5adbaed16cc635 Mia Lin 2022-07-13   94  	int flags;
5adbaed16cc635 Mia Lin 2022-07-13   95  
5adbaed16cc635 Mia Lin 2022-07-13  @96  	if (alarm_enable) {
                                                    ^^^^^^^^^^^^
If these are NULL

5adbaed16cc635 Mia Lin 2022-07-13   97  		dev_dbg(&client->dev, "%s:NCT3018Y_REG_CTRL\n", __func__);
5adbaed16cc635 Mia Lin 2022-07-13   98  		flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
5adbaed16cc635 Mia Lin 2022-07-13   99  		if (flags < 0)
5adbaed16cc635 Mia Lin 2022-07-13  100  			return flags;
5adbaed16cc635 Mia Lin 2022-07-13  101  		*alarm_enable = flags & NCT3018Y_BIT_AIE;
5adbaed16cc635 Mia Lin 2022-07-13  102  	}
5adbaed16cc635 Mia Lin 2022-07-13  103  
5adbaed16cc635 Mia Lin 2022-07-13 @104  	if (alarm_flag) {
                                                    ^^^^^^^^^^

5adbaed16cc635 Mia Lin 2022-07-13  105  		dev_dbg(&client->dev, "%s:NCT3018Y_REG_ST\n", __func__);
5adbaed16cc635 Mia Lin 2022-07-13  106  		flags =  i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
5adbaed16cc635 Mia Lin 2022-07-13  107  		if (flags < 0)
5adbaed16cc635 Mia Lin 2022-07-13  108  			return flags;
5adbaed16cc635 Mia Lin 2022-07-13  109  		*alarm_flag = flags & NCT3018Y_BIT_AF;
5adbaed16cc635 Mia Lin 2022-07-13  110  	}
5adbaed16cc635 Mia Lin 2022-07-13  111  
5adbaed16cc635 Mia Lin 2022-07-13 @112  	dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
5adbaed16cc635 Mia Lin 2022-07-13  113  		__func__, *alarm_enable, *alarm_flag);
                                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^
The debug code will crash.

5adbaed16cc635 Mia Lin 2022-07-13  114  
5adbaed16cc635 Mia Lin 2022-07-13  115  	return 0;
5adbaed16cc635 Mia Lin 2022-07-13  116  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

