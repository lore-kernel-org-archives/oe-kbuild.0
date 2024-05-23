Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D823D13BAD7
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716467440; cv=none; b=epeOOfrNyy7J2NERjXyu8EwB3xrpwZW5pr/qkCYp2wEIgm81e6IAk3fk2PtG/MTTdVO/5c1hSBhGApxcPoogPUNxw2ZKcCT87dxHvQLaVC7sIb4xx9ODJ266GzsXkqzn+fbNW24+/txZMM/0Mv6rDXqIdkDEaUCqWV11f9TEWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716467440; c=relaxed/simple;
	bh=Bjz/ig/gLbIXoRDfEEu5wQSlFToKNYmRgh2HDGqS07I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGlK57MkZyF38G/GbokeRgbgBbHVZYoKytVm8okfaa22DxQT8FaJAKuB5hjuxA5THq00mavot9JToScz19UA5rRdUnW6/dY7V/05BWNUSo4Y82lU3v2GKUVgukD5q/h1CooOC4uS3eFNlqOgT6HHEUA6g/rLYeacKSBJO28dsDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f0ovOkFM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f0ovOkFM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42017f8de7aso53079055e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 05:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716467437; x=1717072237; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sxpjAXqiH/+EfsCOuAq8y02ih0xRop+9c4sjd7YvDrY=;
        b=f0ovOkFM+vFKI1UtCR4lZK+lmN9C8dNQ+uX7QX7rWxZg721w8dU84/JrSwFtd9D8Q+
         BhOnRLFlaL6spwVcQ6WbVQSVNb2Mw19gyhKUGhgqAFQSTtxpMRRrF7cCfILFHhU0Pysq
         2ohpt+Fa0c9CRsrjqNRSLMxkspwCBRe+0zfpI4ctSPmJtTGXABf3R028qzASAMZGiIWa
         rnUzBtAIIXR+x4lYSNE6pj5RlZEqAA2XpeByi+o+XFyULcFqwBcUntVDwceyn/lZeFql
         bWnNYIdBVTRvWpyg+dbNP4UbaM4m6B9bbXxGgvGMJ07OmlJC0gYWlOYlMpPqsn1sSj59
         JA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716467437; x=1717072237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxpjAXqiH/+EfsCOuAq8y02ih0xRop+9c4sjd7YvDrY=;
        b=Rq4hZ2aW9dd0XxNNqC52HkY47LElX/R8j8dAWhqKc6gZm8FiT8zRNkD7bAGWh/4wUE
         QNjlOd+l10i3yZJBVBYlA/a92v5IH/lSzKoJfWNMxwmD5b8T/YH93dZk8oFZ2tH7mizE
         lbcA/LgH2nqdKAZb3fWB1hX2HwMyvR9fce48BQeea+rF7HG3sDZU0q9UxlSdYy8CQUBN
         2W0xZZTNApauukAL6IK/ziav8mmVf3SysuCsV6HBG3LFVCm7/xnHkRybzfdMjam5MeS9
         +S1l4pPMR5PHY47TWLjMx8/La4oEp/PkEfWRcIGP5V+/Br7Ce0ZcnIn0q5DqVeVMI91w
         MAEw==
X-Gm-Message-State: AOJu0Yy6BloyfXUxe715qSfCshcWZAOPdh9JUmp2F0XSDLRLkMVbE8aO
	0cF+kjjUki9GPcsFozkJ9+oiKi1wIFkuJO6lDV5IDiHl4eRQ3UIZvRozll6Ooz7jKyZI896t8Ex
	YT7U=
X-Google-Smtp-Source: AGHT+IHsPYPK5nLhbLq8ov1G8vIMZXbft1sDAvZ24WiHuV5r2ypulRQGNKivfF6NhXredx7u8RAeDg==
X-Received: by 2002:a05:600c:1c15:b0:418:5ed2:5aa6 with SMTP id 5b1f17b1804b1-420fd34d36bmr38811025e9.31.1716467436686;
        Thu, 23 May 2024 05:30:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f7c047sm24088605e9.26.2024.05.23.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:30:36 -0700 (PDT)
Date: Thu, 23 May 2024 15:30:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kiran K <kiran.k@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Chandrashekar <chandrashekar.devegowda@intel.com>
Subject: drivers/bluetooth/btintel_pcie.c:386 btintel_pcie_recv_frame() warn:
 variable dereferenced before check 'data' (see line 380)
Message-ID: <7446b314-53f8-4ec7-9ff7-ae47defc43fb@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea5f6ad9ad9645733b72ab53a98e719b460d36a6
commit: 6e65a09f927566f257322358d429b267548473eb Bluetooth: btintel_pcie: Add *setup* function to download firmware
config: alpha-randconfig-r081-20240516 (https://download.01.org/0day-ci/archive/20240517/202405170424.97VIwnBn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405170424.97VIwnBn-lkp@intel.com/

smatch warnings:
drivers/bluetooth/btintel_pcie.c:386 btintel_pcie_recv_frame() warn: variable dereferenced before check 'data' (see line 380)

vim +/data +386 drivers/bluetooth/btintel_pcie.c

6e65a09f927566 Kiran K          2024-05-07  371  static int btintel_pcie_recv_frame(struct btintel_pcie_data *data,
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  372  				       struct sk_buff *skb)
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  373  {
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  374  	int ret;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  375  	u8 pkt_type;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  376  	u16 plen;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  377  	u32 pcie_pkt_type;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  378  	struct sk_buff *new_skb;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  379  	void *pdata;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07 @380  	struct hci_dev *hdev = data->hdev;
                                                                               ^^^^^^^^^^
data dereferenced

c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  381  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  382  	spin_lock(&data->hci_rx_lock);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  383  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  384  	/* The first 4 bytes indicates the Intel PCIe specific packet type */
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  385  	pdata = skb_pull_data(skb, BTINTEL_PCIE_HCI_TYPE_LEN);
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07 @386  	if (!data) {
                                                            ^^^^^
Presumably this was supposed to check "pdata".

c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  387  		bt_dev_err(hdev, "Corrupted packet received");
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  388  		ret = -EILSEQ;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  389  		goto exit_error;
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  390  	}
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  391  
c2b636b3f788d1 Tedd Ho-Jeong An 2024-05-07  392  	pcie_pkt_type = get_unaligned_le32(pdata);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

