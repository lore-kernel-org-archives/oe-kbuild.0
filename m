Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377AF39B49A
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552418; cv=none; b=JauWXXsQ2IjKqFdGmXaml/a2USFQx5/EZCCEFVjuoAfCyY38cW/Ffn8Pcdpgr7nyOgWmOTg8/wQtEdWx5DK/zVgewfwtUjUkOQleJZQhsOdOerWPhqhYUkBd+fPCLvf9WT4LZF00MSai6i7/igG4/gszjpL8mL9MlC/i/IurV74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552418; c=relaxed/simple;
	bh=ko9l9mdhtQlxEv+xItV4uafeiASchLSWCKG+op6SHoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EgWBCvYK4Ex0Rs8qmjTy2/h/AxLfKM3KwUfpadbDFQk1ydtwDEYxFcaV42dJNtcBaLnyySpUp/uWKXyHnuSYz2r8cxGUBQ3O7xxchclt/xSWMSaT2+gzcOwicYEC3KYgprpsFe2sQLAZ1pn0O6b+5uQt9YZa6N0uxVBZ3YJApnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjBbVXWU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjBbVXWU"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfa33a983so2824248f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 07 Apr 2026 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775552415; x=1776157215; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LL0ec9tpaclw1G1MDrARCNTVU2VUg2IUpXqiX/KPKL4=;
        b=BjBbVXWU/ieEff67DC2zxkZHxvFNr3CBs92ym5kAdAsQna3ATTb5okVGl//qso5S5V
         kpyB5jtANKm6JWgVxJ2DbePAQe1A8qSncY4eCwHveJMTWp9wuL26QOGTTTtFEPmH38rQ
         xj+b5xMf8UYaFIL1ozcX/1OEr5IhVCvndWlmH4IkF1E/J52U6m1xxlw0qCcsENCSaFyC
         pPYa/pjxpP0KuVpQMO3Gvjwstxw6CfJMAMZAoTRb78ZlANexqm5tQLL20+AhwzPdM9oT
         uAabV7ICCzTL+onUDREfm23gewzphZNtHR/UG0nt4SRk1HWMSH/qfT4RgRk1Z4BsTwWE
         v4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775552415; x=1776157215;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL0ec9tpaclw1G1MDrARCNTVU2VUg2IUpXqiX/KPKL4=;
        b=QLPR0T+5+02gQGa8akOPRJYCMWhQcR5futp8W7qVHi2dw1Z3bfUqwcLGV6YMlP8rPX
         3R6Th52M5ewuDl889dHhd8nTC9IAp4s6q4mBSQCrMJPTTCgtth1slmDMWqeHzBeQpSD2
         IoBI30ORWgdumUFaxRp8L8boy3eNwPuJ7VdwGZ5jzgQCpViGtJO9YvVzSrfyKIKek8mP
         M4m9SvVtH8ogsa7ksz5hoquSSwzcopEsn9Sdey2iF7zQI2l3rEwaumH0wMcjdsmo+ncD
         Nfq4NoOSnpasQIRICNxCF2sV/RC61lPFdoICRMG4KWE+uDtAyxPrriOoOTD/v4/389Bl
         xL6g==
X-Gm-Message-State: AOJu0YxeNQaIoyHZjqV1gkPNP+50wfZiGt4kEEOMT0snEk157DgadwWW
	ZOsJL7ENP/jC1+gpA8QlZ8sKuLPV7YmBKcjY0KxvBiyskNP+FM0HHmaYJ/Lzeg==
X-Gm-Gg: AeBDieta2w7ijwZpLkRDNeDYjAuAIXBnSUTdtWYUQKWlNVhTODvf/JeGCEwLM2U8G0R
	MhvssGvaAxrrdnRG7yV68pp8TVXXY44kW678ikD/EKTk21QyKdMavbDadYIhp/N/K7fx+lz3tql
	6mYvrw8JbTmoQDt0CvyW47rahgHsqR4rvoGIwW2Yxc2n36cpImYy4hYPCqh2weFsa/AAtnSMDC0
	2fDtFUbWnYw9kmBSZd8o6atD08XE294vuU2hZnvo8ywNfyOfgTylzRB0X6cLb2nt7F+YmgP7BfI
	HMOtutnHTDQdlIj9l5pcc2FyRHztTueykB5LrWhVc172qu2kK72e3AaXXtFro0IGcyLv+XjLGyI
	NoZpwOgIeflNHUUt0DCc9HEphE1b32fUycz5DvSFGOiP7doEBerekbhyM9XrubQXqnVDzI90l1W
	rPM3+yvb4VwcQyeG9AMPGA01FlVbbWpw==
X-Received: by 2002:a05:6000:2489:b0:439:caf7:a5e5 with SMTP id ffacd0b85a97d-43d292e14d7mr21617959f8f.31.1775552414415;
        Tue, 07 Apr 2026 02:00:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a7223sm44354473f8f.5.2026.04.07.02.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:00:13 -0700 (PDT)
Date: Tue, 7 Apr 2026 12:00:10 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Rosen Penev <rosenp@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 9740/12133] drivers/soc/qcom/wcnss_ctrl.c:269
 wcnss_download_nv() warn: 'fw' from request_firmware() not released on
 lines: 225.
Message-ID: <202604060902.awXdPsBh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260407090010.bzGxBjKoDap9uYUYZ5OvFwR-gbS7-ReDZqPgh2z7IRQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
commit: 908061f0ad30aa08ce211c6a8f95d29102e570bd [9740/12133] soc: qcom: wcnss: simplify allocation of req
config: sparc64-randconfig-r072-20260406 (https://download.01.org/0day-ci/archive/20260406/202604060902.awXdPsBh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604060902.awXdPsBh-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/wcnss_ctrl.c:269 wcnss_download_nv() warn: 'fw' from request_firmware() not released on lines: 225.

vim +/fw +269 drivers/soc/qcom/wcnss_ctrl.c

6be2b3d0848d1e Bjorn Andersson     2016-06-06  200  static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  201  {
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  202  	const struct firmware *fw;
ac3f2784200d49 Bjorn Andersson     2021-03-11  203  	struct device *dev = wcnss->dev;
908061f0ad30aa Rosen Penev         2026-03-26  204  	struct wcnss_download_nv_req *req;
82ec0c290d1a73 Bjorn Andersson     2021-03-11  205  	const char *nvbin = NVBIN_FILE;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  206  	const void *data;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  207  	ssize_t left;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  208  	int ret;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  209  
82ec0c290d1a73 Bjorn Andersson     2021-03-11  210  	ret = of_property_read_string(dev->of_node, "firmware-name", &nvbin);
82ec0c290d1a73 Bjorn Andersson     2021-03-11  211  	if (ret < 0 && ret != -EINVAL)
b066a2c430f3f8 Krzysztof Kozlowski 2024-07-03  212  		return ret;
82ec0c290d1a73 Bjorn Andersson     2021-03-11  213  
82ec0c290d1a73 Bjorn Andersson     2021-03-11  214  	ret = request_firmware(&fw, nvbin, dev);
                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

6be2b3d0848d1e Bjorn Andersson     2016-06-06  215  	if (ret < 0) {
82ec0c290d1a73 Bjorn Andersson     2021-03-11  216  		dev_err(dev, "Failed to load nv file %s: %d\n", nvbin, ret);
b066a2c430f3f8 Krzysztof Kozlowski 2024-07-03  217  		return ret;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  218  	}
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  219  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  220  	data = fw->data;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  221  	left = fw->size;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  222  
908061f0ad30aa Rosen Penev         2026-03-26  223  	req = kzalloc_flex(*req, fragment, NV_FRAGMENT_SIZE);
908061f0ad30aa Rosen Penev         2026-03-26  224  	if (!req)
908061f0ad30aa Rosen Penev         2026-03-26  225  		return -ENOMEM;

Need to release_firmware() before returning.

908061f0ad30aa Rosen Penev         2026-03-26  226  
908061f0ad30aa Rosen Penev         2026-03-26  227  	req->frag_size = NV_FRAGMENT_SIZE;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  228  	req->hdr.type = WCNSS_DOWNLOAD_NV_REQ;
908061f0ad30aa Rosen Penev         2026-03-26  229  	req->hdr.len = struct_size(req, fragment, NV_FRAGMENT_SIZE);
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  230  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  231  	req->last = 0;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  232  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  233  	req->seq = 0;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  234  	do {
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  235  		if (left <= NV_FRAGMENT_SIZE) {
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  236  			req->last = 1;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  237  			req->frag_size = left;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  238  			req->hdr.len = sizeof(*req) + left;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  239  		}
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  240  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  241  		memcpy(req->fragment, data, req->frag_size);
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  242  
5052de8deff561 Bjorn Andersson     2017-03-27  243  		ret = rpmsg_send(wcnss->channel, req, req->hdr.len);
6be2b3d0848d1e Bjorn Andersson     2016-06-06  244  		if (ret < 0) {
ac3f2784200d49 Bjorn Andersson     2021-03-11  245  			dev_err(dev, "failed to send smd packet\n");
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  246  			goto release_fw;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  247  		}
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  248  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  249  		/* Increment for next fragment */
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  250  		req->seq++;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  251  
90c29ed7627b6b Bjorn Andersson     2018-02-27  252  		data += NV_FRAGMENT_SIZE;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  253  		left -= NV_FRAGMENT_SIZE;
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  254  	} while (left > 0);
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  255  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  256  	ret = wait_for_completion_timeout(&wcnss->ack, WCNSS_REQUEST_TIMEOUT);
6be2b3d0848d1e Bjorn Andersson     2016-06-06  257  	if (!ret) {
ac3f2784200d49 Bjorn Andersson     2021-03-11  258  		dev_err(dev, "timeout waiting for nv upload ack\n");
6be2b3d0848d1e Bjorn Andersson     2016-06-06  259  		ret = -ETIMEDOUT;
6be2b3d0848d1e Bjorn Andersson     2016-06-06  260  	} else {
6be2b3d0848d1e Bjorn Andersson     2016-06-06  261  		*expect_cbc = wcnss->ack_status == WCNSS_ACK_COLD_BOOTING;
6be2b3d0848d1e Bjorn Andersson     2016-06-06  262  		ret = 0;
6be2b3d0848d1e Bjorn Andersson     2016-06-06  263  	}
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  264  
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  265  release_fw:
ea7a1f275cf0b5 Bjorn Andersson     2015-09-21  266  	release_firmware(fw);
908061f0ad30aa Rosen Penev         2026-03-26  267  	kfree(req);
6be2b3d0848d1e Bjorn Andersson     2016-06-06  268  
6be2b3d0848d1e Bjorn Andersson     2016-06-06 @269  	return ret;
6be2b3d0848d1e Bjorn Andersson     2016-06-06  270  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

