Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587423CEF8
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147465; cv=none; b=TMSjs/KaYfI6fX4FXYYpY+uANKt1qmaOf/2f/i4ZnUyEpkLyV/IVFueg+wbmziAo1gUGtp+IaOO864WwIKkbHJUCiUetymr2HG69Pz5dPVQqmj3cqNHcbGLFDH9zM7HXOmUmQhSdF9IZe2wVYOAJ84b9iQBCx/996M5sonlklqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147465; c=relaxed/simple;
	bh=xdDG5wmlD2/F5QJnoRq47kR5G8oK4NQvYC30s91zIa0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hDxxIFNFVRY5DhBGk8TOPYV4ccEm1kNIO2nMjFrNOpYdvkO1bfy6VLw6jWVdNacT5DEsShfu3OpWR606RHJhlqNlr4sYMfDod7yAgdqQueaJsS4yapmWi9z3WGQPbnk+2ttcxmAGi//2KLg1AaS6juN8eHyRb9XL+dZZ15WuASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cPyIK+R9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cPyIK+R9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so12271165e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 07:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747147461; x=1747752261; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COerkxIln7e++nlqNopvBWN7m6Frh8qSXypYxxafsww=;
        b=cPyIK+R90L5OlY5wLVP0dQauuu/92Ke3dq8pK/+ojT3iC3kbBKAPDBGDb8S7Iixwj/
         3AqpYcEkTfH/YQkqsEo6URXssjneQmnYmbcrxmT3r5ta3cNuTAnWaCF3nxrtYvG5hTw7
         ooIgwRJetaLYvM7KAJ1COglEI4XAYJcYnL4sPcrVdXlqHyZr8qES6Vk+W4yeybnaYvme
         ZTtMgePSJHvNi7m2kw4lAmKmWfqKOVvCtw03SYB2wA6zwUP+mHmJiK9uc2/QT/WuPgen
         DB/ZAAG2yN77IdaaPzBwUwRVvetWDEu26duPbfjrlBLjY7HNMtpsc5SC2GsjYC9k862c
         lgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147461; x=1747752261;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=COerkxIln7e++nlqNopvBWN7m6Frh8qSXypYxxafsww=;
        b=laVZlInKn/8AA7Zy1BXUK4iCbSXYgrRZ4ZXTpMm+vFYT5aClvD5i/eH19pBpfyOvmO
         B1VC/V+5KCG9UKXrrG8Xk9NSd6Jd+vXyEuwC+eUXwRtyPA2reiFjsCdwu6XwiTjJhuH9
         eKl8Tb/LAEVRBxOtTZ+27joffSc7VWNGzhT9bA/M/MR0OenXKu/IOPCN93oWMv20fwdv
         /7qJdsx8rH8doa0SO1vcgW7P0a6fKCsHY09G++f4OWBfSntnhuWIQn1YtU+ZcMoNmbRD
         YU9/lXYSc647zzgZbeTVCNJDSmUvuSlCdS8jEEQwUc3zE+PYhv3igRTqhSPFFg1A0Abf
         hibQ==
X-Gm-Message-State: AOJu0Yz1PNA3ZRnvm+Fc1u4XUILqlfVnJcCySlFzX+Vep+nCKIM9xLVw
	m6+IhY1NnvTCdBRB24+c8aPlZzPmOpyqD/qJrqjM4skKysZA7SgFIKwY9WkPSNw8q82FH/K5N8S
	FFFV7jQ==
X-Gm-Gg: ASbGnctoC77t4zkEpJbY/hSzAHtiK77Cq0lwJSSACHXbUfLo7vQ9fMSK40xx8rNNwXT
	wCGuGBLpKG4vf26fHGRPDVhvRR/K7YgZ5P/vwXtaf9jxG6CVeZiCOh8oJJq3px9s0DDG7YV3zl+
	BL3j63H9xie3Ku6B9Dos1/MpHbXvLxmOgN4ZC+rPJ8RpyMvGcSywpbDcR1wz4KY3zDF9npfl4EB
	BIr0OjtlxLhtA3ldMdfjsOXjApZpQeoX0GRb6e0iYCPdGLGX7pJRbnQQ4aG84EcpS5DhZm5mo5z
	Xnf0jj4RJ3p94r2VWPq2BLCabs9m2Rdqaf1Mj7RJCe7my+GG58Cf+PakFa1/DGbxtr217OoXb0f
	QEUEnIQ==
X-Google-Smtp-Source: AGHT+IGgCDI5BfDxBYIYTge59ZLvMwLnd/0dXP71Y36XYhfoLmiT63rwk00N7IpeTL5+jqpnpktC5Q==
X-Received: by 2002:a05:600c:3b2a:b0:440:6a1a:d8a0 with SMTP id 5b1f17b1804b1-442d6d18bacmr136140305e9.7.1747147461296;
        Tue, 13 May 2025 07:44:21 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebd6fe86sm22071015e9.0.2025.05.13.07.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:44:21 -0700 (PDT)
Date: Tue, 13 May 2025 17:44:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org
Subject: [pci:ptm-debugfs 1/4] drivers/pci/pcie/ptm.c:275
 context_update_write() error: buffer overflow 'buf' 7 <= 7
Message-ID: <b41c1754-c6b7-4805-9f14-7c643d6c5304@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git ptm-debugfs
head:   356fc3e997f3bf54448a8cb39b49c7d73959d166
commit: 1130deffd29ab25da8091b573e173ef9d889e827 [1/4] PCI: Add debugfs support for exposing PTM context
config: alpha-randconfig-r073-20250511 (https://download.01.org/0day-ci/archive/20250511/202505111829.bSouegRR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505111829.bSouegRR-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/ptm.c:275 context_update_write() error: buffer overflow 'buf' 7 <= 7

vim +/buf +275 drivers/pci/pcie/ptm.c

1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  257  static ssize_t context_update_write(struct file *file, const char __user *ubuf,
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  258  			     size_t count, loff_t *ppos)
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  259  {
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  260  	struct pci_ptm_debugfs *ptm_debugfs = file->private_data;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  261  	char buf[7];
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  262  	int ret;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  263  	u8 mode;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  264  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  265  	if (!ptm_debugfs->ops->context_update_write)
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  266  		return -EOPNOTSUPP;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  267  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  268  	if (count < 1 || count > sizeof(buf))

Should be >= instead of >.

1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  269  		return -EINVAL;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  270  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  271  	ret = copy_from_user(buf, ubuf, count);
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  272  	if (ret)
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  273  		return -EFAULT;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  274  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05 @275  	buf[count] = '\0';
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  276  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  277  	if (sysfs_streq(buf, "auto"))
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  278  		mode = PCIE_PTM_CONTEXT_UPDATE_AUTO;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  279  	else if (sysfs_streq(buf, "manual"))
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  280  		mode = PCIE_PTM_CONTEXT_UPDATE_MANUAL;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  281  	else
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  282  		return -EINVAL;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  283  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  284  	mutex_lock(&ptm_debugfs->lock);
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  285  	ret = ptm_debugfs->ops->context_update_write(ptm_debugfs->pdata, mode);
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  286  	mutex_unlock(&ptm_debugfs->lock);
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  287  	if (ret)
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  288  		return ret;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  289  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  290  	return count;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  291  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

