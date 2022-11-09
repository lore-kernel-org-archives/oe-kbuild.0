Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D617F3;
	Wed,  9 Nov 2022 05:08:37 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id bk15so23993184wrb.13;
        Tue, 08 Nov 2022 21:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3jmOsDYD3eDGL/HXAFuu3q5wn5DTfdd7ABqci8j+7Y=;
        b=B8PJ9mjrG1f6p+hcfIm1hl3TORjKvJrBgzgSzoWH0E/sTqBNSgCEFnPDl1Zyf3OSet
         Fdz7067cjgBDhn9eBmrB4yGHWF2yCUeXNA6TfYtRcGBcerdDMZ6HOGLl/W/KAGa84Keg
         C56rxiNLaSbFwNpMomPnVm3urdSNb+t9vQFXesyPMFiEi11D7WA4aTqpBVyKV9FB4Sui
         Pqp3VO93yyUwiM4BxICHT4d1P59Z0RS1zYkQ+VlKbDyubn0/JbAMrtoSzbTYTfJw9ZJ4
         1KpMjHuWsIlgJULBFoAjRwZDMu7EFMmHYq62IUecXdHkI+vZh9TCU0dEN9pIeHBOt9Et
         KHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3jmOsDYD3eDGL/HXAFuu3q5wn5DTfdd7ABqci8j+7Y=;
        b=7LRuvvZaSg7QnGOaDT8ESv1bwjl4mRTDw5emYOi51jvoDEqfyffgX/EQJhcqPDAZEa
         MGw8HMN5FSj62mLrRO2vzTk8osneJoyLj8Tl7zUqvtsqJyR/4HObTXxyg03iPg490Wfh
         B8zD81wre61XmPB90OPI71SXsdSHsp7oF6NpcrUiEYXST8dpD6omO6nl6bhO+mT6avMY
         Sa5TryY5lW+aY0PKEukDRrLF7FJQgdcrXpR/lJ2FinpajjMo68O7dVzjEvlQKRb3SLfv
         CRZE7MoWpx5NfAgtFOfGPqLygf6m/2Z5az10wEtmxO65lMhPlrdbbvgpHquBN2aqn/EN
         zHKQ==
X-Gm-Message-State: ACrzQf1vUsCgrOdZRUFt7U3NKRY1w1ITtaOEvDYcjLRFkwQgN0AxpZUV
	gowCQeE1uXAM3eB8zwmB7xFU9VJBost+2A==
X-Google-Smtp-Source: AMsMyM6IhiQGc9h4+6b5XsGBvBAxgexMWtYjzt9k9qAu3tpLlIDLGnz5Uu5ITn/T7WlkbKlaPzsyNw==
X-Received: by 2002:adf:b353:0:b0:236:5814:f4dc with SMTP id k19-20020adfb353000000b002365814f4dcmr35860498wrd.189.1667970515291;
        Tue, 08 Nov 2022 21:08:35 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b9-20020a05600010c900b002368424f89esm12041478wrx.67.2022.11.08.21.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 21:08:34 -0800 (PST)
Date: Wed, 9 Nov 2022 08:08:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Wenchao Hao <haowenchao@huawei.com>,
	Lee Duncan <lduncan@suse.com>, Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	open-iscsi@googlegroups.com, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linfeilong@huawei.com,
	Wenchao Hao <haowenchao@huawei.com>
Subject: Re: [PATCH v6] scsi:iscsi: Fix multiple iscsi session unbind event
 sent to userspace
Message-ID: <202211090606.r22uKz8I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108014414.3510940-1-haowenchao@huawei.com>
Message-ID: <20221109050830.FEiCusOCLU0GYL0BVFScOwjHpB2kJyWVIoPqZsiGAJ0@z>

Hi Wenchao,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenchao-Hao/scsi-iscsi-Fix-multiple-iscsi-session-unbind-event-sent-to-userspace/20221107-202840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20221108014414.3510940-1-haowenchao%40huawei.com
patch subject: [PATCH v6] scsi:iscsi: Fix multiple iscsi session unbind event sent to userspace
config: m68k-randconfig-m031-20221108
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/scsi/scsi_transport_iscsi.c:1691 iscsi_session_target_state_name() error: buffer overflow 'iscsi_session_target_state_names' 4 <= 4

vim +/iscsi_session_target_state_names +1691 drivers/scsi/scsi_transport_iscsi.c

3aa534a2c8b080 Wenchao Hao 2022-11-07  1686  static const char *iscsi_session_target_state_name(int state)
3aa534a2c8b080 Wenchao Hao 2022-11-07  1687  {
3aa534a2c8b080 Wenchao Hao 2022-11-07  1688  	if (state > ISCSI_SESSION_TARGET_MAX)

Should be >=

3aa534a2c8b080 Wenchao Hao 2022-11-07  1689  		return NULL;
3aa534a2c8b080 Wenchao Hao 2022-11-07  1690  
3aa534a2c8b080 Wenchao Hao 2022-11-07 @1691  	return iscsi_session_target_state_names[state];
3aa534a2c8b080 Wenchao Hao 2022-11-07  1692  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

