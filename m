Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C964D2D5C76
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760545823; cv=none; b=dDILDAjLkJgSIE1yBMqd3e6tRD2+xoQyXoYBE7Ou5gJdmMFNr03XZiIAkTiyMAvvCLrU2tDUyPoSxfDPljFkykgX3VBajCI0GUeZppc7k6yZX1GIwbeU1MQf4HMZTJPUoqXq00f6QqEZvTr4lnXuq412VSMzuDBUR0Htu94obwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760545823; c=relaxed/simple;
	bh=PcnJKfuVQsJGBUH5fjPouCd2YAFL6l73wYup8RCB85Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NcI/Fe2izQ+NnfkUNNPeRQkmH/JfgFMSFxD9KmjyIiWtGhw9mkVhJDc4LTNja0rDe6H42G3wjPWdUdi7jGed5DiB84m/4RzpXwB2nZ+tKmCRIYLWLNfNYcqRgunqzKjgPsFFFqKFUs8OYvcXCFMsVOBq2zSpwwILR56Nxt3UKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDKzlO4r; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDKzlO4r"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46b303f755aso60806445e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760545819; x=1761150619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aJFzXPFpDQS87d8LEEXFvQI0doaKVJlFcUZx53QgtSo=;
        b=fDKzlO4raXlJJHTikzAH9TyocuSKZpF+lb1smaHWiPBhz8eEjj9x/dhOPrVNZOKGvA
         Ddfr3hCakyE1wHVx7o8l6EE6sHgPNrJeHbE9z6hCg2OVHIi5U8FjEQBYmKMTQYoRJpgX
         RyBpSTSL6hOyiE7NAEgrGDqyCixqIm4MloEpKC107uX9I2tn/cVpv15Bmp8BEiVmDRtc
         BGCfFaYGAazyAjE4Z47P88WzfdukyhzQdiukfTm9K2Gmbis8BGGPo1rooA9vOn8zBUyY
         lKYR0dRc1SOC2HaHeZ0LVJunUFxKmHUTxeq3sx6m95yvbt/jo0LRsVIx3CSvxzdQTf2/
         NWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760545819; x=1761150619;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJFzXPFpDQS87d8LEEXFvQI0doaKVJlFcUZx53QgtSo=;
        b=h2+Qq8k7dftXhMdzYWF9rZfRiExwkrDGzBlKkn4O0PVpmI55Y+EIfyqFC7DtMe4Glq
         6hDFTdo6yjEKQPynHeBhiR/OInfhFdPeTMpJZPqaEGob0bWQCz5lg2gGsOXRBH+VBOEu
         LKbcd21OWFBzGiSOPFUa1jUgks5y3vP4mQuohqy+UGkc0ofEnjQmsT342ZqrxOj63TXj
         GcCxjnVILloE0IKljQBLGakB+XyM8kZ3BA38EJmXd9KSj1LOHAuMKAHP7gOiPHV2DV5l
         n/FCccvvI54IVZxoaKygC4iJzMlXVlDCs/KM+8hG9wvowxeT52bCZm+G/kE4U9avySAu
         cmLQ==
X-Gm-Message-State: AOJu0Yy4FYni39elnO/4E7HeJm5ltKs/zKgUrRcz0lcM1YhqhsNX+m8O
	+q4iYR1iq2k3oxm9U2oFR/W4NYEGrhb/v53+OPUOh5CowyiZ4MME8pjqjdIsVWILXHX4dLE7w0P
	dEcKT
X-Gm-Gg: ASbGncuXGP26lvAFjblvBv8cldH/u5Mzpz1y2S15dCZ964fUkZ3FawdC+CNxw7gAVCa
	xn9lVj+JLbyBTiys3qxVdKbcDCGyPHfQZAZyuiOMMi8rxU8Y/Iatj02kM5esQmNmLIOxz0f7fdV
	Mk2gBgm2w4chzCnx+HjCmp9oYeTuIC5H6VB7WVLSgqjpiU9H7hs1x4mVs0PPq0KiyeQSXlNefbL
	GlwfjBzxNPrO73rkdoyYaRm81wCETjpSg5CY/dhmIdqoX9JwJYfT2rT6LJKNwLqldt6of6qOWPl
	AjKJzHXtwY0w5TrngTVvLNlcIwYKIeh4kDrK4aAJY60y8fjQRQnIspYq2Qi7Ce5QaqIbiVtS0yn
	kVtmxc/tOkmnFJRp+sm3hATeW8jf9QutFPBY8yQPwdVa+K4a6K9Y=
X-Google-Smtp-Source: AGHT+IHKxHJ3/ojrKYdZz0teR0HP/P40/HKmZyUjoCkTXwzWaHi7eJSIIlIxOO+bIottWYntL9Ie2A==
X-Received: by 2002:a05:600c:4753:b0:46e:1d8d:cfb6 with SMTP id 5b1f17b1804b1-46fa9af0621mr220694465e9.19.1760545818801;
        Wed, 15 Oct 2025 09:30:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e10e8sm29963485f8f.39.2025.10.15.09.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 09:30:18 -0700 (PDT)
Date: Wed, 15 Oct 2025 19:30:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger
 PAST
Message-ID: <202510152336.GJBjPRZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014013308.174151-3-luiz.dentz@gmail.com>
Message-ID: <20251015163014.Mct3erLubMIXasDvctrNGlc5VrqUz8XPs5DFGUw8PDU@z>

Hi Luiz,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-hci_core-Introduce-HCI_CONN_FLAG_PAST/20251014-094058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20251014013308.174151-3-luiz.dentz%40gmail.com
patch subject: [PATCH v4 3/8] Bluetooth: ISO: Add support to bind to trigger PAST
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251015/202510152336.GJBjPRZF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510152336.GJBjPRZF-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_sync.c:7286 hci_le_past_sync() warn: inconsistent returns '&hdev->lock'.

Old smatch warnings:
net/bluetooth/hci_sync.c:2622 hci_resume_advertising_sync() error: uninitialized symbol 'err'.

vim +7286 net/bluetooth/hci_sync.c

26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7269  static int hci_le_past_sync(struct hci_dev *hdev, void *data)
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7270  {
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7271  	struct past_data *past = data;
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7272  	struct hci_cp_le_past cp;
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7273  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7274  	hci_dev_lock(hdev);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7275  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7276  	if (!hci_conn_valid(hdev, past->conn) ||
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7277  	    !hci_conn_valid(hdev, past->le))
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7278  		return -ECANCELED;

hci_dev_unlock(hdev);

26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7279  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7280  	memset(&cp, 0, sizeof(cp));
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7281  	cp.handle = cpu_to_le16(past->le->handle);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7282  	cp.sync_handle = cpu_to_le16(past->conn->sync_handle);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7283  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7284  	hci_dev_unlock(hdev);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7285  
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13 @7286  	return __hci_cmd_sync_status(hdev, HCI_OP_LE_PAST,
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7287  				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
26071e0198f6b8 Luiz Augusto von Dentz 2025-10-13  7288  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

