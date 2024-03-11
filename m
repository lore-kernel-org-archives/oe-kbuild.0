Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C468BFD
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Mar 2024 05:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710134774; cv=none; b=AWHUM3qV122hmxikm/NgdgubivcGSsYqXuAQBhyjyJUCc4Fbby269hYS9JneZ/74jHrRUKwgXkaByPq69PP5k3jXwAxZjKoile7OJ9ZZaJHNQWQboxIQV4jbZVLjjRpyfJLQ0Dg1h/Jw3B0pdfCjzf5koQA8grX0ohERinPw3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710134774; c=relaxed/simple;
	bh=yUDW/fwoJIeQpIZIGKNfqge21MDz3OIIs6ywtRDXdZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JwgydboLYp0wjN0slS2ztzPzVVW6dAOVmj3yaE3TtU79YOMQLa/aei8sTewiI+jWDb61e9c36iZvzVbJGjqSykTpEw2pk6HOfpSVXDQyBCoEuQHqSNAC/lGgurmzYW8eEMKNgQpdxii7ab0+rs/3XCFIBkKUcuqrM+K7e8z9tIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OtHApKpQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OtHApKpQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-413286f8985so3968305e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 22:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710134770; x=1710739570; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOlTd1XnDPAY74dQ3xemh8A6pnHKhsrOLL88PokMnLc=;
        b=OtHApKpQd0L0jiupsxFAe1Zu5J+L6ysKRpDp4hd1PurFiEhTjUD7fNra1CyLDbnHtg
         vuKR+qJIMUCrFdxU9RxWe0vyxzO+pOt/6QCO1pTA7WZSjj6KEGTatZ6gq3oye07HPK5b
         9/k39vRU2uFHQn+hDFlj0EDPWMmMoT73p41aqXB6pdU+bVTkbf8zIuCAGiwZ29pw3jgO
         aNQRbyNnbESoQ6dK4WXnDhp7Tq7EKsPBe10vl9s4guNSUdRs2zHjCEixEMP8KhOenpJv
         3CzII0GrQu+q1A0+iBW7vzbjNiDsNfqfjY7aa90AnzKocAQQxGuYY8Zplw8kJkdzM6WC
         /xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710134770; x=1710739570;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOlTd1XnDPAY74dQ3xemh8A6pnHKhsrOLL88PokMnLc=;
        b=YQEGq1umuLDbhscmY4vq9UxuAcmdci+ob3ztnINWty0pnxJN/WjTzgMeAw/QdM5zZq
         hdh6LtoRoIpFJ20hWigLPG93wSqZIK9O/d6jMBY2ffjTYYz5a89hNrInKe3OkriKxntH
         dvX0sXbDTjSU/B2TzWGTSo2j1IMh63cDB86Bf2FiAqfojc9DzAIyY6IxCycbp8EABk2/
         nvV7RrnQ0NfdRerMd2dQg53jjJU/6oq6wBhhYukXdGNNIfUKJpexV58ylZK/i2ZzCYPF
         b5WP8vjpRdvdDpBFS5c2OXZ0rFda5nxOb8D/ujOVPlTvo8tH7JRMVQx+vn+E+3OLBboc
         M5wg==
X-Gm-Message-State: AOJu0Yz6eTbsf1XWNEqUk0j8Xue6Wuuh+uW1RP95Ft9rxoWj89LdeNl5
	r94II5j/0cjZjQbOkKaAXB8jmbHMhEVWNyO8bpaSfq8WlwS7TSNUcJ5xvSyi3L6IHlnC+7gLhrl
	g
X-Google-Smtp-Source: AGHT+IGaKiwrsxbFVObyt068tmh4cH4q7wAdph2jbY6/DLgmPo93xky/ezXahhnz+gYQmYhQXHUBjg==
X-Received: by 2002:a05:600c:154f:b0:413:1346:913a with SMTP id f15-20020a05600c154f00b004131346913amr4276392wmg.26.1710134769911;
        Sun, 10 Mar 2024 22:26:09 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a17-20020adffad1000000b0033dc7e50488sm5363181wrs.96.2024.03.10.22.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 22:26:09 -0700 (PDT)
Date: Mon, 11 Mar 2024 08:26:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pierre Gondois <pierre.gondois@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [linux-next:master 12015/12944]
 drivers/firmware/arm_scmi/powercap.c:723 scmi_powercap_domain_init_fc()
 error: buffer overflow 'fc' 2 <= 6
Message-ID: <30deb572-af44-46af-acbb-ead586812351@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 2441caa84aac8abf1be9e20db3e6bb921e74c8a2 [12015/12944] firmware: arm_scmi: Populate fast channel rate_limit
config: nios2-randconfig-r071-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100744.7Op3PI8L-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403100744.7Op3PI8L-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/powercap.c:723 scmi_powercap_domain_init_fc() error: buffer overflow 'fc' 2 <= 6

vim +/fc +723 drivers/firmware/arm_scmi/powercap.c

855aa26e5f56d4 Cristian Marussi 2022-07-04  694  static void scmi_powercap_domain_init_fc(const struct scmi_protocol_handle *ph,
855aa26e5f56d4 Cristian Marussi 2022-07-04  695  					 u32 domain, struct scmi_fc_info **p_fc)
855aa26e5f56d4 Cristian Marussi 2022-07-04  696  {
855aa26e5f56d4 Cristian Marussi 2022-07-04  697  	struct scmi_fc_info *fc;
855aa26e5f56d4 Cristian Marussi 2022-07-04  698  
855aa26e5f56d4 Cristian Marussi 2022-07-04  699  	fc = devm_kcalloc(ph->dev, POWERCAP_FC_MAX, sizeof(*fc), GFP_KERNEL);
                                                                                   ^^^^^^^^^^^^^^^
Need to bump this value.  Currently it's 2.

855aa26e5f56d4 Cristian Marussi 2022-07-04  700  	if (!fc)
855aa26e5f56d4 Cristian Marussi 2022-07-04  701  		return;
855aa26e5f56d4 Cristian Marussi 2022-07-04  702  
855aa26e5f56d4 Cristian Marussi 2022-07-04  703  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  704  				   POWERCAP_CAP_SET, 4, domain,
855aa26e5f56d4 Cristian Marussi 2022-07-04  705  				   &fc[POWERCAP_FC_CAP].set_addr,
2441caa84aac8a Pierre Gondois   2024-02-22  706  				   &fc[POWERCAP_FC_CAP].set_db,
2441caa84aac8a Pierre Gondois   2024-02-22  707  				   &fc[POWERCAP_FC_CAP].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  708  
855aa26e5f56d4 Cristian Marussi 2022-07-04  709  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  710  				   POWERCAP_CAP_GET, 4, domain,
2441caa84aac8a Pierre Gondois   2024-02-22  711  				   &fc[POWERCAP_FC_CAP].get_addr, NULL,
2441caa84aac8a Pierre Gondois   2024-02-22  712  				   &fc[POWERCAP_FC_CAP].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  713  
855aa26e5f56d4 Cristian Marussi 2022-07-04  714  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  715  				   POWERCAP_PAI_SET, 4, domain,
855aa26e5f56d4 Cristian Marussi 2022-07-04  716  				   &fc[POWERCAP_FC_PAI].set_addr,
2441caa84aac8a Pierre Gondois   2024-02-22  717  				   &fc[POWERCAP_FC_PAI].set_db,
2441caa84aac8a Pierre Gondois   2024-02-22  718  				   &fc[POWERCAP_FC_PAI].rate_limit);
855aa26e5f56d4 Cristian Marussi 2022-07-04  719  
855aa26e5f56d4 Cristian Marussi 2022-07-04  720  	ph->hops->fastchannel_init(ph, POWERCAP_DESCRIBE_FASTCHANNEL,
855aa26e5f56d4 Cristian Marussi 2022-07-04  721  				   POWERCAP_PAI_GET, 4, domain,
2441caa84aac8a Pierre Gondois   2024-02-22  722  				   &fc[POWERCAP_FC_PAI].get_addr, NULL,
2441caa84aac8a Pierre Gondois   2024-02-22 @723  				   &fc[POWERCAP_PAI_GET].rate_limit);
                                                                                       ^^^^^^^^^^^^^^^^
And this is 6.

855aa26e5f56d4 Cristian Marussi 2022-07-04  724  
855aa26e5f56d4 Cristian Marussi 2022-07-04  725  	*p_fc = fc;
855aa26e5f56d4 Cristian Marussi 2022-07-04  726  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

