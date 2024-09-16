Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B31136345
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 07:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726472137; cv=none; b=TxHmcrCzEcYWDbxR6Seyl3jF/8yqRC6MXN4t19uLM3PBntA7CYb5P+1SbwB0Hom8NX655jcGePdTpXlHSjjcFUUuWjkNqoM9BmT5+2CzCgm90ULFIjepj+UweGQrU0S7+KoSeG2xs04nMDXqr2hUXJMV02KdDXeFgGfbjaqJyeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726472137; c=relaxed/simple;
	bh=ELDAGEWFbIuabo50LtqwuRApSXREsRqoJ7re32LR5Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cOOYIAsIxmKBvNJXA2hsSuh7cGFdeyXhkEalmRsin4UGdeymZu20Wz7Ksm92J4kN9+JOjQInRbbJWS0M8jIh/kdw5etV6FGQ3p8xLOhiouXIFsorIF6ngNZIMA3OCWcczoLz5pG/KnK82o/UZ6oi0MCcE8GWIW9fTAy1SQmAnmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYUi6jBP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYUi6jBP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so3083478f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 16 Sep 2024 00:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726472133; x=1727076933; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOdceN0DS/wzREp2UcEaAzSKm4y+YZSwxFm6SuUMfwU=;
        b=jYUi6jBPDoIdmA/6whYmdX+R0dZojG6TifBgPsFGWcUxlm/HFPKVncrFqI5Cb+i6Dn
         Xg/Zf+pFZGxbeLmyfb7uvRK0R9sO8/ncOcV+5fVl+vcMpOhHGYcfVzCY87nvKJOHbECY
         QO+zmIgeqQiyv0mq3MFT+S6D0FbYokNwzHZvfo2aBHMmFoM1M1lwu2ge2l1E7DavWQ4d
         GglfqE+spEDRi81k6DbKwxmzUlOhEy6Oq/RY8rMGDG0/cs+KuPocn0okf4YhpjpDi8wA
         74zA6J0XSQLjc5tbV6XN4usBL+sVSR2+s+zNg+SZ73/2h7HgVdaF0BrIi/ZCuClCtqJE
         x3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726472133; x=1727076933;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOdceN0DS/wzREp2UcEaAzSKm4y+YZSwxFm6SuUMfwU=;
        b=Z7VObicWyuLGoWncUo9+xhJqncoALZTex7VFWZQZz88UWK0JPeuF5L0ymWBywhMg1e
         SLknMG4pbjOr9d9ApKj+kaPaG2/MFFJfeAxdU/r6y90JPELCMvIVCCL8JwaTt+tvlb2+
         Tt1TgAQzsiZGnSQuWRsOCOwjpfmpQezYF4PDHFor0LVWpgCwQvWdQPz+j2gH326FKavC
         78DsXrLHE+8J0Tukxrnl/wCw0mW5A8T5bEwnuJbgcPu2yBlbsMZX0qjXFK3iksEIdCFv
         eH44MCVhyziNADPBuFuIfoPwWVQHNzFNKCH9gjICL9nzW6iSnIlQMhHIhreAJH7rZQaT
         BjZw==
X-Gm-Message-State: AOJu0YwQdzEdqApUoWPA9k2VWP0SmUBiZ/9Cp+OPvinZce034FW7M7oM
	NfR7jDkiZpyEW85z5Qh1co9TPU/tl+Rggv4Olf4fn9dd5o7MZFOW1KW/Roydy5GhQ9cXhFXPyK0
	7
X-Google-Smtp-Source: AGHT+IFtTDEFWVBXJac4ig3M604bac0B8FGKuMCE7pMZuhx+QezYxRXyYU8IXTUzNVsZ6dNXUoz7Xw==
X-Received: by 2002:a05:6000:542:b0:374:c0a3:fbb1 with SMTP id ffacd0b85a97d-378c2d12e01mr7587179f8f.35.1726472132662;
        Mon, 16 Sep 2024 00:35:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb89e1fsm2378444a12.72.2024.09.16.00.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 00:35:32 -0700 (PDT)
Date: Mon, 16 Sep 2024 10:35:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Srujana Challa <schalla@marvell.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Shijith Thotton <sthotton@marvell.com>,
	Nithin Dabilpuram <ndabilpuram@marvell.com>
Subject: drivers/vdpa/octeon_ep/octep_vdpa_hw.c:143 octep_process_mbox()
 warn: missing error code? 'ret'
Message-ID: <7e8141cb-44e6-477c-b77e-aa9b4bc5af3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98f7e32f20d28ec452afb208f9cffc08448a2652
commit: 8b6c724cdab85d8923dd8c474a5a9464228379c5 virtio: vdpa: vDPA driver for Marvell OCTEON DPU devices
date:   10 weeks ago
config: i386-randconfig-141-20240912 (https://download.01.org/0day-ci/archive/20240916/202409160431.bRhZWhiU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409160431.bRhZWhiU-lkp@intel.com/

New smatch warnings:
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:143 octep_process_mbox() warn: missing error code? 'ret'
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:478 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer

Old smatch warnings:
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:479 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:480 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:481 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer
drivers/vdpa/octeon_ep/octep_vdpa_hw.c:514 octep_hw_caps_read() warn: argument 3 to %016llx specifier is cast from pointer

vim +/ret +143 drivers/vdpa/octeon_ep/octep_vdpa_hw.c

8b6c724cdab85d Srujana Challa 2024-06-14  102  static int octep_process_mbox(struct octep_hw *oct_hw, u16 id, u16 qid, void *buffer,
8b6c724cdab85d Srujana Challa 2024-06-14  103  			      u32 buf_size, bool write)
8b6c724cdab85d Srujana Challa 2024-06-14  104  {
8b6c724cdab85d Srujana Challa 2024-06-14  105  	struct octep_mbox __iomem *mbox = octep_get_mbox(oct_hw);
8b6c724cdab85d Srujana Challa 2024-06-14  106  	struct pci_dev *pdev = oct_hw->pdev;
8b6c724cdab85d Srujana Challa 2024-06-14  107  	u32 *p = (u32 *)buffer;
8b6c724cdab85d Srujana Challa 2024-06-14  108  	u16 data_wds;
8b6c724cdab85d Srujana Challa 2024-06-14  109  	int ret, i;
8b6c724cdab85d Srujana Challa 2024-06-14  110  	u32 val;
8b6c724cdab85d Srujana Challa 2024-06-14  111  
8b6c724cdab85d Srujana Challa 2024-06-14  112  	if (!IS_ALIGNED(buf_size, 4))
8b6c724cdab85d Srujana Challa 2024-06-14  113  		return -EINVAL;
8b6c724cdab85d Srujana Challa 2024-06-14  114  
8b6c724cdab85d Srujana Challa 2024-06-14  115  	/* Make sure mbox space is available */
8b6c724cdab85d Srujana Challa 2024-06-14  116  	ret = octep_wait_for_mbox_avail(mbox);
8b6c724cdab85d Srujana Challa 2024-06-14  117  	if (ret) {
8b6c724cdab85d Srujana Challa 2024-06-14  118  		dev_warn(&pdev->dev, "Timeout waiting for previous mbox data to be consumed\n");
8b6c724cdab85d Srujana Challa 2024-06-14  119  		return ret;
8b6c724cdab85d Srujana Challa 2024-06-14  120  	}
8b6c724cdab85d Srujana Challa 2024-06-14  121  	data_wds = buf_size / 4;
8b6c724cdab85d Srujana Challa 2024-06-14  122  
8b6c724cdab85d Srujana Challa 2024-06-14  123  	if (write) {
8b6c724cdab85d Srujana Challa 2024-06-14  124  		for (i = 1; i <= data_wds; i++) {
8b6c724cdab85d Srujana Challa 2024-06-14  125  			octep_write32_word(mbox, i, *p);
8b6c724cdab85d Srujana Challa 2024-06-14  126  			p++;
8b6c724cdab85d Srujana Challa 2024-06-14  127  		}
8b6c724cdab85d Srujana Challa 2024-06-14  128  	}
8b6c724cdab85d Srujana Challa 2024-06-14  129  	octep_write32_word(mbox, 0, (u32)qid);
8b6c724cdab85d Srujana Challa 2024-06-14  130  	octep_write_sts(mbox, 0);
8b6c724cdab85d Srujana Challa 2024-06-14  131  
8b6c724cdab85d Srujana Challa 2024-06-14  132  	octep_write_hdr(mbox, id, MBOX_REQ_SIG);
8b6c724cdab85d Srujana Challa 2024-06-14  133  
8b6c724cdab85d Srujana Challa 2024-06-14  134  	ret = octep_wait_for_mbox_rsp(mbox);
8b6c724cdab85d Srujana Challa 2024-06-14  135  	if (ret) {
8b6c724cdab85d Srujana Challa 2024-06-14  136  		dev_warn(&pdev->dev, "Timeout waiting for mbox : %d response\n", id);
8b6c724cdab85d Srujana Challa 2024-06-14  137  		return ret;
8b6c724cdab85d Srujana Challa 2024-06-14  138  	}
8b6c724cdab85d Srujana Challa 2024-06-14  139  
8b6c724cdab85d Srujana Challa 2024-06-14  140  	val = octep_read_sig(mbox);
8b6c724cdab85d Srujana Challa 2024-06-14  141  	if ((val & 0xFFFF) != MBOX_RSP_SIG) {
8b6c724cdab85d Srujana Challa 2024-06-14  142  		dev_warn(&pdev->dev, "Invalid Signature from mbox : %d response\n", id);
8b6c724cdab85d Srujana Challa 2024-06-14 @143  		return ret;

return -EINVAL;

The other warnings are because we should use %p to print pointers.  Depening on
the .config the kernel will mask out pointers so that they aren't disclosed to
the users.  Otherwise it risks being an information leak to defeat KSALR.

8b6c724cdab85d Srujana Challa 2024-06-14  144  	}
8b6c724cdab85d Srujana Challa 2024-06-14  145  
8b6c724cdab85d Srujana Challa 2024-06-14  146  	val = octep_read_sts(mbox);
8b6c724cdab85d Srujana Challa 2024-06-14  147  	if (val & MBOX_RC_MASK) {
8b6c724cdab85d Srujana Challa 2024-06-14  148  		ret = MBOX_RSP_TO_ERR(val);
8b6c724cdab85d Srujana Challa 2024-06-14  149  		dev_warn(&pdev->dev, "Error while processing mbox : %d, err %d\n", id, ret);
8b6c724cdab85d Srujana Challa 2024-06-14  150  		return ret;
8b6c724cdab85d Srujana Challa 2024-06-14  151  	}
8b6c724cdab85d Srujana Challa 2024-06-14  152  
8b6c724cdab85d Srujana Challa 2024-06-14  153  	if (!write)
8b6c724cdab85d Srujana Challa 2024-06-14  154  		for (i = 1; i <= data_wds; i++)
8b6c724cdab85d Srujana Challa 2024-06-14  155  			*p++ = octep_read32_word(mbox, i);
8b6c724cdab85d Srujana Challa 2024-06-14  156  
8b6c724cdab85d Srujana Challa 2024-06-14  157  	return 0;
8b6c724cdab85d Srujana Challa 2024-06-14  158  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

