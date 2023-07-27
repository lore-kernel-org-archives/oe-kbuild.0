Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6090920F1
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 05:06:49 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31438512cafso547998f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 26 Jul 2023 22:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690434407; x=1691039207;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=milfg91uG9nlhd9aFLAx/8EHBpoWNiimDW9/5MxR5qE=;
        b=SqR9wDcJ/K9nwJZJepovao+MkVJ0TdNofeVh2YnRg6VO5GiudH5oFn9h/1FfQVVRvE
         8ZlNCHSEvsdhsZZLJ/5/Qf6CQU21Up1ossb+IZGHnWbf3PBHoWsebzYMi7f6OFiplMtg
         vxOHMSqN7wXgOitTUOvdlJvqxngxskbpjADUWJ5O9YwOwTDGd5d65DZWQXSIRGR3uIvh
         eJFw4HlIr+gmRESJdtIIdDKmvInlWwYviZwGGR/2npA+DAy/Vx2D9df3Cyh2YOuxOaUw
         UrJW3ILC8IxAsiSNhTUwdSZjzW5ONxcy9Uev32d5oWZE0JPFcth5s74HwccZfDhaNYbq
         PLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690434407; x=1691039207;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=milfg91uG9nlhd9aFLAx/8EHBpoWNiimDW9/5MxR5qE=;
        b=i9joPBTTSu26XLJAtx6m8Qjv7OHIGioM8/ydrQeE1R1snenRbH4z6bm2cKrpKIaIzJ
         phWpFNKR0NU1b69XOn748o75t4hTAfrOqo8nPMDTMOw13JRwX1BTiBAA9gr9XiwSqHSQ
         BDNnxYSx2ZBtG+VlF9tNsyWnl1fA0fTSo04lx7FyryMU6g5H0QsrdrzuIfyYInoa2+Xq
         mAtqCZ4/W6DfRM/JmX3Azd19+ONPX7CJ6OSAq12mPPqu1ewfS+ATLb+6LoXtMWKogOng
         GBDW45sRjWnq9CQAHPRQR8lEu9cfmyF9Ql42rIZ/50/lK1PnyLAPAVOSCEfmTUdg5oo+
         06ag==
X-Gm-Message-State: ABy/qLZpsXBTscdY9Mpb2jx2N1BcUCGmTxLEriPdImtzDdUP6cIsz3Pt
	MceUzQDTPRCfEs3yaGXTXG1If4b7gT/w2S52anY=
X-Google-Smtp-Source: APBJJlG46aaIJPrxFkx4O+Yb8zxZMWWUWxRjBLDV7QlqtwQ/xfDUhdChhPo0mRSZ0sY0wDCljBBp8w==
X-Received: by 2002:adf:f4c6:0:b0:314:ca7:f30b with SMTP id h6-20020adff4c6000000b003140ca7f30bmr767822wrp.54.1690434407115;
        Wed, 26 Jul 2023 22:06:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n7-20020a5d6b87000000b003175fef2a32sm820827wrx.55.2023.07.26.22.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:06:46 -0700 (PDT)
Date: Thu, 27 Jul 2023 08:06:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Anjelique Melendez <quic_amelende@quicinc.com>, pavel@ucw.cz,
	lee@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	agross@kernel.org, andersson@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, luca.weiss@fairphone.com,
	konrad.dybcio@linaro.org, u.kleine-koenig@pengutronix.de,
	quic_subbaram@quicinc.com, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
	Anjelique Melendez <quic_amelende@quicinc.com>
Subject: Re: [PATCH v2 3/7] soc: qcom: add QCOM PBS driver
Message-ID: <85e4f0ef-baf8-4588-a10c-d64821c8c518@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725193423.25047-4-quic_amelende@quicinc.com>

Hi Anjelique,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjelique-Melendez/dt-bindings-soc-qcom-Add-qcom-pbs-bindings/20230726-034011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230725193423.25047-4-quic_amelende%40quicinc.com
patch subject: [PATCH v2 3/7] soc: qcom: add QCOM PBS driver
config: parisc-randconfig-m041-20230726 (https://download.01.org/0day-ci/archive/20230727/202307270539.1JVFQf6W-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270539.1JVFQf6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307270539.1JVFQf6W-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/qcom-pbs.c:97 qcom_pbs_wait_for_ack() warn: should this be 'retries == -1'

vim +97 drivers/soc/qcom/qcom-pbs.c

c261225d90e1d3 Anjelique Melendez 2023-07-25   68  static int qcom_pbs_wait_for_ack(struct pbs_dev *pbs, u8 bit_pos)
c261225d90e1d3 Anjelique Melendez 2023-07-25   69  {
c261225d90e1d3 Anjelique Melendez 2023-07-25   70  	u16 retries = 2000, delay = 1000;
c261225d90e1d3 Anjelique Melendez 2023-07-25   71  	int ret;
c261225d90e1d3 Anjelique Melendez 2023-07-25   72  	u8 val;
c261225d90e1d3 Anjelique Melendez 2023-07-25   73  
c261225d90e1d3 Anjelique Melendez 2023-07-25   74  	while (retries--) {

Change this to while (--retries) {

c261225d90e1d3 Anjelique Melendez 2023-07-25   75  		ret = qcom_pbs_read(pbs, PBS_CLIENT_SCRATCH2, &val);
c261225d90e1d3 Anjelique Melendez 2023-07-25   76  		if (ret < 0)
c261225d90e1d3 Anjelique Melendez 2023-07-25   77  			return ret;
c261225d90e1d3 Anjelique Melendez 2023-07-25   78  
c261225d90e1d3 Anjelique Melendez 2023-07-25   79  		if (val == 0xFF) {
c261225d90e1d3 Anjelique Melendez 2023-07-25   80  			/* PBS error - clear SCRATCH2 register */
c261225d90e1d3 Anjelique Melendez 2023-07-25   81  			ret = qcom_pbs_write(pbs, PBS_CLIENT_SCRATCH2, 0);
c261225d90e1d3 Anjelique Melendez 2023-07-25   82  			if (ret < 0)
c261225d90e1d3 Anjelique Melendez 2023-07-25   83  				return ret;
c261225d90e1d3 Anjelique Melendez 2023-07-25   84  
c261225d90e1d3 Anjelique Melendez 2023-07-25   85  			dev_err(pbs->dev, "NACK from PBS for bit %u\n", bit_pos);
c261225d90e1d3 Anjelique Melendez 2023-07-25   86  			return -EINVAL;
c261225d90e1d3 Anjelique Melendez 2023-07-25   87  		}
c261225d90e1d3 Anjelique Melendez 2023-07-25   88  
c261225d90e1d3 Anjelique Melendez 2023-07-25   89  		if (val & BIT(bit_pos)) {
c261225d90e1d3 Anjelique Melendez 2023-07-25   90  			dev_dbg(pbs->dev, "PBS sequence for bit %u executed!\n", bit_pos);
c261225d90e1d3 Anjelique Melendez 2023-07-25   91  			break;
c261225d90e1d3 Anjelique Melendez 2023-07-25   92  		}
c261225d90e1d3 Anjelique Melendez 2023-07-25   93  
c261225d90e1d3 Anjelique Melendez 2023-07-25   94  		usleep_range(delay, delay + 100);
c261225d90e1d3 Anjelique Melendez 2023-07-25   95  	}
c261225d90e1d3 Anjelique Melendez 2023-07-25   96  
c261225d90e1d3 Anjelique Melendez 2023-07-25  @97  	if (!retries) {

Otherwise this check needs to be: "if (retries == USHRT_MAX)".

Btw, I really feel like people are generally better off declaring list
iterators as int whenever possible.  I have written a very rude blog
to that effect.
https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/

c261225d90e1d3 Anjelique Melendez 2023-07-25   98  		dev_err(pbs->dev, "Timeout for PBS ACK/NACK for bit %u\n", bit_pos);
c261225d90e1d3 Anjelique Melendez 2023-07-25   99  		return -ETIMEDOUT;
c261225d90e1d3 Anjelique Melendez 2023-07-25  100  	}
c261225d90e1d3 Anjelique Melendez 2023-07-25  101  
c261225d90e1d3 Anjelique Melendez 2023-07-25  102  	return 0;
c261225d90e1d3 Anjelique Melendez 2023-07-25  103  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

