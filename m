Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8D91A2C0B
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 03:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751079878; cv=none; b=jpP3gKQ7shgSMqa3qc688b31u7MwD7jnGZxIMjzODM8GBlBEWacqsSYNNe0CPjTWQl5pzTI+dxud7QnPwvQOa3yB/xs/YyzYmTzX0YfLin9mQAM+ucL6V8BT9V+xARi+maV9yJK1s9x/g1OS1rc/THN5TIxM08kxErpxSlsCV1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751079878; c=relaxed/simple;
	bh=e2HPA9/wexrugXoBcyL63QFmQkVRMg3Vbgzl8tLlmv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TMjQScloU+CTA46NWyg0MtdqyjTCkPXkmL7+wlgQ8yg4jpSvHOgApgqUjvrJA5jgfBWU1S9av5uponsENJHyI1kIZNpcSDFOkbfNEWJOvlKhhZpKlOhAp1L+AVOlYIgGAJG9mugC1jkbshppLzJZWZi2g2FhUPjoMF46YHJC7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eEfNeenY; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eEfNeenY"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-735ae68cc78so1702553a34.1
        for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 20:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751079876; x=1751684676; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mrEXq+k4C9jjEUBgclh5S8eupzCvj0cpocVaBAvBRg=;
        b=eEfNeenYnq0QOSIDuJTkYDcOQGwLaQ336NqBmg4nU5k5DL7eTXoyySShAw9lOJiCyk
         6PsoTSNhcgV0OySiHNuOdmHI/Aa/gl2SyVjzgKfrA6yrHkch7G+kb6HTfmQdGKiIVazn
         IQgAS9dUSK8l6gVZhH+iaHoYD041Q3ClSR2L0n6iSJq7otcsdJ9bE/oTlrlrc/948H0b
         AwWpmA9/uupHFgpm745CYGEgBhZ4HixgdYMRuinJ4ISRm3K6P6pt3yyPgNXhaz5DL3Wp
         XpUaCPdeBMIyligTwxZcQJfsbsWEnGHH4GyMHPXkQ1wvBAkH/tr6tva50N7nrEDCK1Ts
         5tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751079876; x=1751684676;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mrEXq+k4C9jjEUBgclh5S8eupzCvj0cpocVaBAvBRg=;
        b=DQcLd/EodQK1TQaaPSgHLkhfXUgXKm436s6lIg7me5CkDuJSKiG2wtWRAiI//JZDGy
         GgScJnaIUTkRTC2PQ59lRKttSzDFSxJ3kmdbyEmIponRuBWB5q/lydmOe+zIGoyysB7H
         k/+uHnGfVOf7boz4jS10+QcpWlAue2CLcOqjEGkCj5FEbIDgIVMr+8YNxZj8fF+gyPb3
         9uTSLOu6K8RfO5dU7JeG0JSAZSodoGlB1w1UkbSnsR73Y4kNcbP3YvQcKDbxTS3Rpr17
         KrhG94DTCqRCMpKEVIap6c+BnNZcXDtHli2gv2aybn5Qfnz1S7Cg+u2aSE7TeA6EwIZ0
         6OMQ==
X-Gm-Message-State: AOJu0YzHRneMcfbygLTsT7bDtgo2l8NyVkwfJXOubhOCnvJtIEP/RDza
	c6To7W5Q600QGByDAzjzEUaZ3AXYEKkJJAik1H2Fd6GQnun8FDuvJ8zR4b8wqucAW2H9NcAidWh
	GxjopSkw=
X-Gm-Gg: ASbGncuvqhqXKlx1O3rnQpV1z2nuMn32/6vlVkuVst5d7fRhkRJFDl2M8fN/cWgP4ve
	Pyi7YIJEkx4qEP3eITefyHxj//pvPgJEV+exp3cDupFYOdE3cBVBZsqCWU/mVpJKJj4MoxoOJlx
	z1w2YH9nS7PDqOFLPspC4YjZBTzr2W2deyR13Fv/0HfkZUtI3XTeMkY6UqBqX2MH545pvkp6SRj
	W2rxJBLpSoq++/6TrMMZ8Li1r5i/Ji5NTFU/Jksx1786t2j85EzUtzMgJaeTen9c1dArYPcglVq
	NqUuzv1id6cZtNmm6g7huSyEY8ddW4yMyesxEup97eJzsIxaOzpjCQiU2FW3NiVpC63vKQ==
X-Google-Smtp-Source: AGHT+IEIQNB9vXn483lHvLJjj700RgdbzHfAUE56Wc6QSRX5AYvxFzu5TfYpGMA0L0F7fB4pfrcJZw==
X-Received: by 2002:a05:6830:6f42:b0:739:fe04:7aec with SMTP id 46e09a7af769-73afc6821ffmr3875325a34.26.1751079875682;
        Fri, 27 Jun 2025 20:04:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb124960sm624104a34.66.2025.06.27.20.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 20:04:35 -0700 (PDT)
Date: Sat, 28 Jun 2025 06:04:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pranav Tyagi <pranav.tyagi03@gmail.com>,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, ming.li@zohomail.com,
	rrichter@amd.com, peterz@infradead.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: Re: [PATCH v2] cxl/memdev: automate cleanup with __free()
Message-ID: <ef5ee5ac-5c8d-4717-aa84-7db085a556a9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623083841.364002-1-pranav.tyagi03@gmail.com>

Hi Pranav,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranav-Tyagi/cxl-memdev-automate-cleanup-with-__free/20250623-164014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20250623083841.364002-1-pranav.tyagi03%40gmail.com
patch subject: [PATCH v2] cxl/memdev: automate cleanup with __free()
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280653.WmzTbwEN-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506280653.WmzTbwEN-lkp@intel.com/

smatch warnings:
drivers/cxl/core/memdev.c:881 cxl_fw_write() error: uninitialized symbol 'transfer'.
drivers/cxl/core/memdev.c:881 cxl_fw_write() error: uninitialized symbol 'transfer'.

vim +/transfer +881 drivers/cxl/core/memdev.c

9521875bbe0055 Vishal Verma 2023-06-14  874  static enum fw_upload_err cxl_fw_write(struct fw_upload *fwl, const u8 *data,
9521875bbe0055 Vishal Verma 2023-06-14  875  				       u32 offset, u32 size, u32 *written)
9521875bbe0055 Vishal Verma 2023-06-14  876  {
aeaefabc59ec3c Dan Williams 2023-06-25  877  	struct cxl_memdev_state *mds = fwl->dd_handle;
aeaefabc59ec3c Dan Williams 2023-06-25  878  	struct cxl_dev_state *cxlds = &mds->cxlds;
8d8081cecfb994 Dave Jiang   2024-09-05  879  	struct cxl_mailbox *cxl_mbox = &cxlds->cxl_mbox;
9521875bbe0055 Vishal Verma 2023-06-14  880  	struct cxl_memdev *cxlmd = cxlds->cxlmd;
f76a702ca63e85 Pranav Tyagi 2025-06-23 @881  	struct cxl_mbox_transfer_fw *transfer __free(kfree);

cleanup magic variables need to be initialized to NULL etc.

9521875bbe0055 Vishal Verma 2023-06-14  882  	struct cxl_mbox_cmd mbox_cmd;
9521875bbe0055 Vishal Verma 2023-06-14  883  	u32 cur_size, remaining;
9521875bbe0055 Vishal Verma 2023-06-14  884  	size_t size_in;
9521875bbe0055 Vishal Verma 2023-06-14  885  	int rc;
9521875bbe0055 Vishal Verma 2023-06-14  886  
9521875bbe0055 Vishal Verma 2023-06-14  887  	*written = 0;
9521875bbe0055 Vishal Verma 2023-06-14  888  
9521875bbe0055 Vishal Verma 2023-06-14  889  	/* Offset has to be aligned to 128B (CXL-3.0 8.2.9.3.2 Table 8-57) */
9521875bbe0055 Vishal Verma 2023-06-14  890  	if (!IS_ALIGNED(offset, CXL_FW_TRANSFER_ALIGNMENT)) {
9521875bbe0055 Vishal Verma 2023-06-14  891  		dev_err(&cxlmd->dev,
9521875bbe0055 Vishal Verma 2023-06-14  892  			"misaligned offset for FW transfer slice (%u)\n",
9521875bbe0055 Vishal Verma 2023-06-14  893  			offset);
9521875bbe0055 Vishal Verma 2023-06-14  894  		return FW_UPLOAD_ERR_RW_ERROR;

This return will try to free an uninitialized pointer.

9521875bbe0055 Vishal Verma 2023-06-14  895  	}
9521875bbe0055 Vishal Verma 2023-06-14  896  
9521875bbe0055 Vishal Verma 2023-06-14  897  	/*
aeaefabc59ec3c Dan Williams 2023-06-25  898  	 * Pick transfer size based on mds->payload_size @size must bw 128-byte
aeaefabc59ec3c Dan Williams 2023-06-25  899  	 * aligned, ->payload_size is a power of 2 starting at 256 bytes, and
aeaefabc59ec3c Dan Williams 2023-06-25  900  	 * sizeof(*transfer) is 128.  These constraints imply that @cur_size
aeaefabc59ec3c Dan Williams 2023-06-25  901  	 * will always be 128b aligned.
9521875bbe0055 Vishal Verma 2023-06-14  902  	 */
8d8081cecfb994 Dave Jiang   2024-09-05  903  	cur_size = min_t(size_t, size, cxl_mbox->payload_size - sizeof(*transfer));
9521875bbe0055 Vishal Verma 2023-06-14  904  
9521875bbe0055 Vishal Verma 2023-06-14  905  	remaining = size - cur_size;
9521875bbe0055 Vishal Verma 2023-06-14  906  	size_in = struct_size(transfer, data, cur_size);
9521875bbe0055 Vishal Verma 2023-06-14  907  
aeaefabc59ec3c Dan Williams 2023-06-25  908  	if (test_and_clear_bit(CXL_FW_CANCEL, mds->fw.state))
9521875bbe0055 Vishal Verma 2023-06-14  909  		return cxl_fw_do_cancel(fwl);
9521875bbe0055 Vishal Verma 2023-06-14  910  
9521875bbe0055 Vishal Verma 2023-06-14  911  	/*
9521875bbe0055 Vishal Verma 2023-06-14  912  	 * Slot numbers are 1-indexed
9521875bbe0055 Vishal Verma 2023-06-14  913  	 * cur_slot is the 0-indexed next_slot (i.e. 'cur_slot - 1 + 1')
9521875bbe0055 Vishal Verma 2023-06-14  914  	 * Check for rollover using modulo, and 1-index it by adding 1
9521875bbe0055 Vishal Verma 2023-06-14  915  	 */
aeaefabc59ec3c Dan Williams 2023-06-25  916  	mds->fw.next_slot = (mds->fw.cur_slot % mds->fw.num_slots) + 1;
9521875bbe0055 Vishal Verma 2023-06-14  917  
9521875bbe0055 Vishal Verma 2023-06-14  918  	/* Do the transfer via mailbox cmd */
9521875bbe0055 Vishal Verma 2023-06-14  919  	transfer = kzalloc(size_in, GFP_KERNEL);
9521875bbe0055 Vishal Verma 2023-06-14  920  	if (!transfer)
9521875bbe0055 Vishal Verma 2023-06-14  921  		return FW_UPLOAD_ERR_RW_ERROR;
9521875bbe0055 Vishal Verma 2023-06-14  922  
9521875bbe0055 Vishal Verma 2023-06-14  923  	transfer->offset = cpu_to_le32(offset / CXL_FW_TRANSFER_ALIGNMENT);
9521875bbe0055 Vishal Verma 2023-06-14  924  	memcpy(transfer->data, data + offset, cur_size);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

