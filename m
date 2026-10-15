Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A021FF2A
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064852; cv=none; b=OA8I3NqTpbmDANv+/W4n/yPR0B/UzouaL4b4yZK7bkIxqI1rNT9HWnDQLTGX+Ng6ZXpPKrN8jLONkqKNfqV0cEiffhOaKSCUCzhnce48icRmPyhUeSztpJ084HFPlGRKP/Oxbm4WInHMN+SkJA3wsgBqixhzqQoBAYrOmcwWUiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064852; c=relaxed/simple;
	bh=hKnILUVodrAmxeVcjruH7x3Ln3FMtujx9/LpiHRyIlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rLZaLkj92uo547hL0wcRHIx0vnYR/hbuTfy33IbgBZKZke53dzqmleu5EpIKjxwdPVgKV4UbuNlFbA9YNvx9mvBxwDFl7WW/9kxpWuaMRAXVxMGW3gsvRg7HTAjlKxmWNrIZ4V8Zj0wqUyoIcUmIp2CeIK1Hr4gzlCo3PUPsLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMcKMegX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMcKMegX"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2895893f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 04:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792064849; x=1792669649; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djQhsxU6gxCV+aecCcsn/9pb4e5+9XMSfoHaIYgtuco=;
        b=aMcKMegX+T4ZABp8Xhx3S8MDvZY1jzrBJR0ocIwLYZ4+FeCAtn90QN6dVui8d8bikr
         j7mMwndmqgK37faNdboHEaneOarJsqH/j7/aKJZDHgHB9dPbl8NkF2tSN9JPWn7IUBgq
         9wgg62iVsIu2pX1UPTCX6IV7y6nqyhMtl72suntrB918a/+ig1TvFIhR4Oh3nFiSQAl6
         YdWaMVtA5mb1hZWmZX4T5t307MZh6hzZE6TKjSsDwXQdfONHsHKRvWAvChCSrd3yU82M
         71r/0gcWIAZ0Ft7e+5LaUb2oqlI+ldej14dUcJ0khuPlfYXbYsP9EL6mPcoJe2HnpIe9
         b/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792064849; x=1792669649;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djQhsxU6gxCV+aecCcsn/9pb4e5+9XMSfoHaIYgtuco=;
        b=twbIaU9jt6ImS3nNx5BA4hmFGK/Y1noBFrwDeU0MC4PUJ5GHq4xMqqLQfwHld4C0g1
         aYXXZrzePGXH73nyZUQBHI73ljNOvucgEEDAVj2k5pdV9Z693BqKv4UCiZ/a4rW6cWSN
         /do3crsVkJ3Nxj+Z07Du6TvTsnEtPsu5oGPgQRozYjCK8lZHw1va38TntpM4io4mj4CT
         nK4HE/ugZRIz5FWvhri69SCisPK3QFNb4Xrr82Lb3rHKGX3kB79RBIEY7NOhafOghWyv
         33xOn4i9pG93ndz+JyebByaOwfLla6CGak/KA3PaB30xwa4Sedxs5U50XOSLfwDoACmr
         UF8g==
X-Gm-Message-State: AFq9FYIKwth2jBYS6G5BLF4Ak36JF5kVqO3MUEXb1svC33dWQsSwxXqc
	HEZ/5PjVJ7HpqMY0qrcDYRe+uxt8L337KD5pKpSYGwGufXNDbD1y0Rn7aEDYZyK3o8Q/vA==
X-Gm-Gg: AYBFou3UUWBWAricjWhDqaFaIg9WNFWJlmiuZC7c0AJ28FkGBCyju4MFM+v3DxHf18w
	K5kW+ZXPOSL2sRBGSOC87iRWmBdJVWQYaaw8EarURKD7/ckRHHzU+O7GMex2YbzRJUe+Xb+PxB3
	vyyq0FyXphVbYQ8j817Qb6QHdPApqEdTFMKhyRCWR4N8V6p7+W6Fq24TE/Zie43jobWVYxO24T6
	Pk8B5pBkJOei95hB1Qt422fFNUvsLd3B8xmhpQNc1//PKVgDhA/gOOvCoDhWXpgMenIewjCl8R0
	eSFMqL7yD1JFuSSo99o/rU6UwPpX0AACWzEZx87USuog9fTl0JCgWVVCb3LxvXoUYm49KKwlyv1
	v+34BzlZ60axuXPsBnvuGF9qXTN8sH2itrlgw451fgp3kVy9hrftni1CCi56jHpDM31apdZ4cZK
	VUBhNU+aa+a/VaQXlulVbDVlG0HdtI2OWFQs4HUZhjuQx0iF0U9rAiQG3vyeREsPIjYGFSsxocg
	k6NnQ==
X-Received: by 2002:a05:6000:299c:10b0:48a:fb3e:d93c with SMTP id ffacd0b85a97d-48dba784b80mr26875621f8f.5.1792064849096;
        Thu, 15 Oct 2026 04:47:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df0f8f624sm6951474f8f.5.2026.10.15.04.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:47:28 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:47:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [linux-next:master 11195/15025]
 drivers/gpu/drm/msm/dp/dp_display.c:1141 msm_dp_ioremap_optional() error: we
 previously assumed 'len' could be null (see line 1132)
Message-ID: <202610080603.9zx0Gqal-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261015114724.vM0Su0svxhvCpSZgntid6r6Lf9zvGNXpy49X6pGDcsg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b018686719706a781c45a874ed51374a2dc4b767
commit: 90bc95ebb04d58015f07b52f46680ab2ef664ccd [11195/15025] drm/msm/dp: add support for programming p1/p2/p3 register blocks
config: arm-randconfig-r2200-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080603.9zx0Gqal-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610080603.9zx0Gqal-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/dp/dp_display.c:1141 msm_dp_ioremap_optional() error: we previously assumed 'len' could be null (see line 1132)

vim +/len +1141 drivers/gpu/drm/msm/dp/dp_display.c

90bc95ebb04d58 Abhinav Kumar    2026-09-29  1126  static void __iomem *msm_dp_ioremap_optional(struct platform_device *pdev,
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1127  					     int idx, size_t *len)
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1128  {
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1129  	struct resource *res;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1130  	void __iomem *base;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1131  
90bc95ebb04d58 Abhinav Kumar    2026-09-29 @1132  	if (len)

len checked here

90bc95ebb04d58 Abhinav Kumar    2026-09-29  1133  		*len = 0;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1134  
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1135  	res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1136  	if (!res)
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1137  		return NULL;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1138  
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1139  	base = devm_ioremap_resource(&pdev->dev, res);
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1140  	if (!IS_ERR(base))
90bc95ebb04d58 Abhinav Kumar    2026-09-29 @1141  		*len = resource_size(res);

but not here.

90bc95ebb04d58 Abhinav Kumar    2026-09-29  1142  
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1143  	return base;
90bc95ebb04d58 Abhinav Kumar    2026-09-29  1144  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

