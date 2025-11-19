Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC23557EF
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552829; cv=none; b=X0P+7zwK+tjxOAIXih6w+UtT8npcAsRhWdZ/5ONcsGV6DXh7Q96AVyBqqwi2sxosrsgMnPKXXvHx4+rB18CFqyBUyrlRKkaBi4hR3tB+88ac1swhD4oDdSAxykArt9d6c1MHwLPGSi59V7OlBr9e3Mb9nN+uSMqsSPu1BG4g/nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552829; c=relaxed/simple;
	bh=/gzT8hIoDY53jrMWspdCqIjmpSXQ051DwbdByXvabwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ut5tC3T2HH5ceiY3YZ3qbJrl4Mkr19At1RjGBLCnbRDgTj1vgTREi6A1djZMnZComItUwuvZTTWuY1nDlPkoiGNveXejRQRnUkekExazCwYEZn+FCYXZX8uhjMrpPo4aTrXKH6SGfSPYrswqTxSJdsudhyZTNtMK78QrHjAszno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=spC+Ywrt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="spC+Ywrt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477770019e4so69246355e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 03:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763552823; x=1764157623; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9D2EBpLbg3EFanyEXEgbE/AO09iKXG8w/LxIx4Nedk=;
        b=spC+Ywrt3jdVi9yXBCGaAONgeJkcNvhlkkigAaV9TDPt8HfHsGKGEBPRnbMLw2hT5s
         uzR/5EgG98ocwQXKI96VFs8gFXHwM3NRa2D4oLNxr0wIEtRqcJXvZXGuToeyRHAVxXzM
         SvHYuQUGTqKywzfUSMmS1upzBjAAx4yxqbdGuHRxBj9XuJsv97MY18Rf1bOUC1nftEUB
         GyBzCGxDoeGRhM9kA1UF7mCsjLInsspx0XGEcXvNzorI0Cg+//WPF3v1t1jtN5zZzknR
         voqXvYHzlnrNqAZFDIki79hmf1n5RlEn2KzG93NIfnYXWJcIKp/K4C9boa7TwFo1Njb0
         bCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763552823; x=1764157623;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9D2EBpLbg3EFanyEXEgbE/AO09iKXG8w/LxIx4Nedk=;
        b=FSHBhqZjEQNI3rk+r75AhuV9pWhhi6pWTapM7B2Pua0k773IwXgkZzIIDJTWKaBR9p
         3s1055eUSHQSeOGuGHUZxKvF+kxg3sle2NtFGfDaZWvsVkr/Nke7fN6CKuTEhTdGUFv8
         jbEzKt04Jb7L6UrFt4w0rE+lT84DWR+ujwu9ozr2lzxk1jvQdf+UZ1wLsRjLZNIUvts+
         rFiVpjxf7xbbjqUlXlBaLAJLDe9uukDVDR2C1lYM74CtVdIpqjK54eSbzi8QjOtxZwXk
         oi24BfwwPNEgk1P81CEvqaOvcD5eTpre8NHpBgNxMlvMqgFrZDn0U1CdIHWqYP/Y6t9n
         4mLw==
X-Gm-Message-State: AOJu0Yxa27D3YV0httCUJdWJvN7bYg0WN3SAUg5H2TIWL7Qxlagdn27t
	3/1EQPB8dMb/t+MSKauyzuAZS6WCj0uyEXX8rsRzTjD4NitTKpCN1z5Dsg78YUnCYr7isrOTxRP
	l4wYB
X-Gm-Gg: ASbGncvF6bZxjUszqDmjYjsqximK0y9bc3Dny17KB0keGS/+gj3SsDyDUbjpW/FqnIW
	F6DYT0Y8Mo/u00cj2P+/IpBPXjaxcL6uW5yBQ3H2VIdiwGLM6xLcsfGQi4tBpd2e1LH0dcNC/iT
	TlY8VR73G75rC9n8eTm7lxK+J5h7M4wngNli8Cll7jPIfddJseH8FVVJ42HflwYEnnkrOaKUpSK
	1iIGVk0S6V+8SySMCBh587Mi9RbZfD6K1jjNcdu2ULAO4KBPispt4IdPXExHPMe+yLtOQAHSh7b
	tK+DP1oic0epLdPu+EugfeRJuUzeqf86Ikbf0SIEeQAUi1aoxRa3b26RsYe0Sgl+CvDOQIyKEnV
	gT3d0jqjYYPTRDEiYroR6Km3Y/AHdgBkdsRHm9wGGCKx6xdX28nUJKwl7562IHoy/EdRFHVDKIs
	lAbwwwdeX3OZpTpc5v
X-Google-Smtp-Source: AGHT+IFiGGF5t4LB7OJUN4VhYrrQraoO6HJ7edFBvyGZPNJ0fKT3VZeqsDTZIKeJiuRWRqquBZWNZA==
X-Received: by 2002:a05:600c:1c23:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-477aed0fb8bmr50036895e9.19.1763552823194;
        Wed, 19 Nov 2025 03:47:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477b0ffef34sm44204105e9.2.2025.11.19.03.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:47:02 -0800 (PST)
Date: Wed, 19 Nov 2025 14:46:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roberto Sassu <roberto.sassu@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:ima-snapshots-v1-devel-v1 1/1]
 security/integrity/ima/ima_fs.c:321 ima_measurements_snap_write() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202511170428.8scOuqUb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251119114659.2uPizMFlaMBDqo4Qe1b-rWZPL0RWWFtFfyptHvC75JE@z>

tree:   https://github.com/robertosassu/linux ima-snapshots-v1-devel-v1
head:   b0bd002b6caa9d5d4f4d0db2a041b1fd91f33f8a
commit: b0bd002b6caa9d5d4f4d0db2a041b1fd91f33f8a [1/1] ima: Add support for measurement list snapshots
config: i386-randconfig-141-20251116 (https://download.01.org/0day-ci/archive/20251117/202511170428.8scOuqUb-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511170428.8scOuqUb-lkp@intel.com/

smatch warnings:
security/integrity/ima/ima_fs.c:321 ima_measurements_snap_write() warn: maybe return -EFAULT instead of the bytes remaining?

vim +321 security/integrity/ima/ima_fs.c

b0bd002b6caa9d Roberto Sassu 2025-11-13  309  static ssize_t ima_measurements_snap_write(struct file *file,
b0bd002b6caa9d Roberto Sassu 2025-11-13  310  					   const char __user *buf,
b0bd002b6caa9d Roberto Sassu 2025-11-13  311  					   size_t datalen, loff_t *ppos)
b0bd002b6caa9d Roberto Sassu 2025-11-13  312  {
b0bd002b6caa9d Roberto Sassu 2025-11-13  313  	unsigned char req[SNAPSHOT_REQ_LENGTH];
b0bd002b6caa9d Roberto Sassu 2025-11-13  314  	int ret;
b0bd002b6caa9d Roberto Sassu 2025-11-13  315  
b0bd002b6caa9d Roberto Sassu 2025-11-13  316  	if (*ppos > 0 || datalen != SNAPSHOT_REQ_LENGTH)
b0bd002b6caa9d Roberto Sassu 2025-11-13  317  		return -EINVAL;
b0bd002b6caa9d Roberto Sassu 2025-11-13  318  
b0bd002b6caa9d Roberto Sassu 2025-11-13  319  	ret = copy_from_user(req, buf, datalen);
b0bd002b6caa9d Roberto Sassu 2025-11-13  320  	if (ret < 0)
b0bd002b6caa9d Roberto Sassu 2025-11-13 @321  		return ret;

Yep.  This should be:

	if (copy_from_user(req, buf, datalen))
		return -EFAULT;

b0bd002b6caa9d Roberto Sassu 2025-11-13  322  
b0bd002b6caa9d Roberto Sassu 2025-11-13  323  	if (req[1] != '\n')
b0bd002b6caa9d Roberto Sassu 2025-11-13  324  		return -EINVAL;
b0bd002b6caa9d Roberto Sassu 2025-11-13  325  
b0bd002b6caa9d Roberto Sassu 2025-11-13  326  	switch (req[0]) {
b0bd002b6caa9d Roberto Sassu 2025-11-13  327  	case SNAPSHOT_REQ_MAKE:
b0bd002b6caa9d Roberto Sassu 2025-11-13  328  		ret = ima_queue_make_snapshot();
b0bd002b6caa9d Roberto Sassu 2025-11-13  329  		break;
b0bd002b6caa9d Roberto Sassu 2025-11-13  330  	case SNAPSHOT_REQ_DEL:
b0bd002b6caa9d Roberto Sassu 2025-11-13  331  		ret = ima_queue_delete_snapshot();
b0bd002b6caa9d Roberto Sassu 2025-11-13  332  		break;
b0bd002b6caa9d Roberto Sassu 2025-11-13  333  	default:
b0bd002b6caa9d Roberto Sassu 2025-11-13  334  		ret = -EINVAL;
b0bd002b6caa9d Roberto Sassu 2025-11-13  335  		break;
b0bd002b6caa9d Roberto Sassu 2025-11-13  336  	}
b0bd002b6caa9d Roberto Sassu 2025-11-13  337  
b0bd002b6caa9d Roberto Sassu 2025-11-13  338  	if (ret < 0)
b0bd002b6caa9d Roberto Sassu 2025-11-13  339  		return ret;
b0bd002b6caa9d Roberto Sassu 2025-11-13  340  
b0bd002b6caa9d Roberto Sassu 2025-11-13  341  	return datalen;
b0bd002b6caa9d Roberto Sassu 2025-11-13  342  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

