Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356842BAE2
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718005965; cv=none; b=qKoHZqxCGasN7HwhL7N+GstRPFQMRMe52ADfxOWwbmcaVFXyF4WW7aH1JMvJUsLHZ0M4iCmsBwR3OiEU+OYSH/e1EVSw7VapOsHSsD+FXMubtAyyIAH7f8nceiasWH/IaCAYmMU1FQhlShBy3WUTsYcI0k/jGgL+axPoahzIv2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718005965; c=relaxed/simple;
	bh=KH4qjRBhmsl1Zn3SaHOOUkYq11i39PjnscOAr92S5TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=smnuYZuHSETuDDD1nFW9aIgZsBPFhJddXpVDYHWadp5yiK5qhoIGdA9pHqOAZwEVPZ4j3u9Bi7K2zKM6jxM1LrbiPzC6jt2rIiPOq29aqGoXZeFblPm+51IUj/qLN0NUNpGGQRv6o88fHsQ75Bf46FCSQhUTJBZat4DtJvafvek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O7FiaFQB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O7FiaFQB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-421eab59723so3459025e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 10 Jun 2024 00:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718005962; x=1718610762; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEr/3KbfySfs9QZIPsPKzzybAjgPEX4Rb7osYycFo8g=;
        b=O7FiaFQB6TKu7rwGhroM0Tbl3KoY3eAOrQtC5FdxmQZjfFO3zJO4VXRE14iKtxdXPy
         hV5YVBLoNN56cRb4iLPzNzjhedaiu5sW91YMZ//62OJP+kVY2wHixUjfo7pOR0+TSziA
         0nSHzHxnpdJ6qRB0DttNg0Qwj0g5LbsGLIOJ6yI4z5Xw2qMPjpSOA6ElWOHA/IJlV2ZT
         aDMNq+lPKjUkJEGDaawQDZ9Oj7fmIvYw/9QDG09o+useU2ADNHqIjIJFP93wtbYJoQA8
         b0aAh1fh2D/VaX5yKs2DTpy39ilPFotXzop4eKl4gmaxq/N7qvo275Mg8p73+boOgdO5
         MVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718005962; x=1718610762;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEr/3KbfySfs9QZIPsPKzzybAjgPEX4Rb7osYycFo8g=;
        b=bTigfuwYl6PzihKqhbbCQCUqcaKksbwVCryhlWldhVI35fVgClnv4pxouXr3aS/j+j
         xMeA3M69dlzgAiGvc+CalxcfANWxAkCY74DJavZEIci0qkLIr9g9W035vIeafvcdLIV/
         2+yml6X2oIKpDpXHGvTCZgNytuzjwEz+ATm0nfKcteoXzASUHv49hCL6mpV9HptT5lvH
         rRcabcbx52ZfnMjc+Rtznpxe7REkibSx/BD5V3n6djWQPbxOq7IPxoVTxX/mai/4GTGi
         nhpc7ioq8q2SjMVlnCuWKDeNb5khG3gCOBQLX7Vw+VkVMPw24l3WbKH2ZkpTN/JXRJvu
         x7Gg==
X-Gm-Message-State: AOJu0YzGuoo0bX+xqOiomGcFoVmv2980YD/Sd1JItXQmBvCXoNn2AV1R
	CGJHBhSSnEZ4y7ErqTQURgjUeF049mGb9QEW8SFa2uaojUenAltB3tKnb6Uc9W+XfOkJ5jDGIgf
	W
X-Google-Smtp-Source: AGHT+IG3DvGUemxrZlT0OAUHBf77mkwvO0bJp3enmayTyexNMITEnRZCvUnahoONy11Qu01vJ0RvWw==
X-Received: by 2002:a05:600c:4450:b0:422:13b2:584 with SMTP id 5b1f17b1804b1-42213b2073emr3098175e9.37.1718005962181;
        Mon, 10 Jun 2024 00:52:42 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421cd1fdec7sm28513155e9.25.2024.06.10.00.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 00:52:41 -0700 (PDT)
Date: Mon, 10 Jun 2024 10:52:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Junfeng Guo <junfeng.guo@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Qi Zhang <qi.z.zhang@intel.com>, Ahmed Zaki <ahmed.zaki@intel.com>
Subject: [tnguy-next-queue:dev-queue 20/95]
 drivers/net/ethernet/intel/ice/ice_parser.c:971 __ice_pg_nm_cam_match()
 error: memcmp() '&item->key.val' too small (9 vs 13)
Message-ID: <83877bb7-8c1b-4189-9b24-41c968212613@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   2746dc17cbf54ef20cc09a7ec6862477a326fae1
commit: 678aebbf361736b67e2d83264fb1f2b49ecf6bc0 [20/95] ice: add parser internal helper functions
config: x86_64-randconfig-161-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100753.38qaQzo9-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406100753.38qaQzo9-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/ice_parser.c:971 __ice_pg_nm_cam_match() error: memcmp() '&item->key.val' too small (9 vs 13)

vim +971 drivers/net/ethernet/intel/ice/ice_parser.c

678aebbf361736 Junfeng Guo 2024-05-27  967  static bool __ice_pg_nm_cam_match(struct ice_pg_nm_cam_item *item,
678aebbf361736 Junfeng Guo 2024-05-27  968  				  struct ice_pg_cam_key *key)
678aebbf361736 Junfeng Guo 2024-05-27  969  {
678aebbf361736 Junfeng Guo 2024-05-27  970  	return (item->key.valid &&
678aebbf361736 Junfeng Guo 2024-05-27 @971  		!memcmp(&item->key.val, &key->val, sizeof(key->val)));

This will read beyond the end of the "item->key.val".  They're similar
structs but key->val has u32 next_proto; at the end.

678aebbf361736 Junfeng Guo 2024-05-27  972  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

