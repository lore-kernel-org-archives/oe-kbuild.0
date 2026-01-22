Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F346AF30
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 06:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769062079; cv=none; b=mi+Dgqp9Irt3hK1W/joauIqOqPvptEUk0y+LzHqA/sDaTlQEAvy8Q/2OjLzBWEi6fYs0tLMPCGhkTslDZBZep0pxA1JdHHGU38mzp3O1XdAMK5hgaWLviX2z+1957CfPbmPr6wlyOep4TS5yVGMYiEEWipYu2XJHXlnvCJETgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769062079; c=relaxed/simple;
	bh=1o5NqahfDQ5VNbcqleS+o4wBaycfjfXYCwkC1X8D/Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DAPa93gr0e/o2NIxqnve1niIoRgmwx6YDMeqORfsED/A5yqiiChjIYxGGEd6huzwW5b6lD6yz9bAuQ6Bw86ssfgMN4TvTQQjpaSH9f6fXr6DArpUJLPKRtyUABvJh2bDjizeQuqIONmb2vkHkkxdhcVNci3zwGKziPNOHf/ZZNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TCmtl1qn; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCmtl1qn"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4358fb60802so299635f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 22:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769062073; x=1769666873; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNY/LXM5CUd8SovQrwoI4Q/jBB7ob8o4qFKazdU5gjs=;
        b=TCmtl1qn1mWaybOJeqLIrTWE/+e6Aqk5lkTvvApRDe74k4BBa2cEocCQc9nG6U0LHw
         s6GkmI3tPeet5QmkEY6RAxXo9Nmc/VFAA6mH/jJ4ju6lZTb3FSZZsPxAefJT7VNYMXG1
         Byv2Vr9vPCSKIS0GegFSjLrGSw+bkfBnueKYDwyHXOENgY8M0Q84U/WLNS9GWTJ49PbU
         dkygCGz5kkwi3erSkuZo0Nt6Fk1iG0ERH8FIg5ymFIf9L7tYngncCSB9IQ+6q2bNvCgo
         vCc3sTygziO4gso4LZhAVaQYv1FD59+p+UymEYTfLdZS+odckcC7EY2f7hm1TKe7pU2x
         jskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769062073; x=1769666873;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNY/LXM5CUd8SovQrwoI4Q/jBB7ob8o4qFKazdU5gjs=;
        b=uT6zR6WIZ1I0/a3O3uIsmDQXH5v9wCN2qLBws/IaHKq+HOQ2IgRjBYjSI1bwqENkii
         a4Z0LR+45Tyn9a9NOYuBiaeYsm32HL7zHnkYmy96Z3WDJFj/z/NMca1VGs+VPrcv2Qj2
         7USTsCaGVEKQyqwCUOVZNFTBO4gZR6P9ClMQvUq0lixpkFLEqcRJ/o5iI9uYlPsgPqMi
         JRI7dm89o8LDSLA07dM9qxJV/ZQxNNVpAWzIc0s1JlDpRspQ6Dg8Y422KcFnsaDL7DpR
         4Wwbeh4Q+Wo9fYznrEnEgEnArRGKL5MBNL6wd3ZN5Un0c2SHeTRFc0IEpNTLBCkIsL2W
         07dQ==
X-Gm-Message-State: AOJu0YxOtxdWZGmGJxnJbFD+uWgtyOxLMBhwjUw1Q+v+CH71LhJR6Zit
	8JKs9+PzTWr5ZV033egX55a0kB3SKfjeU9O0avS1WgrRVbWw2oEw3/orar5Z0AcH9Y8reROmJf3
	OeR57uVw=
X-Gm-Gg: AZuq6aLVFfw2YeHRiAvRFryhLB6Of2jexJFbTyyMhaamJ/Brdwcan13Trk0KpyRa80b
	4NGg2GJEvZmXVgf3J/FH+OQDkHTg2rRRPehqJbcWQcftP5tA4T/sRKnNbWhGXThukRNJOBSPXdV
	KagEi5Al98uKAwYqwTrD4FhC+bpey49HfoKKzZ11yDNEmYmH+zdXBVGitXvKWL/t16DFQw4LY+q
	9hY5mpuE4hXlr8sc1JTYC9YrKQ31j9BBn7PySXW4l17UrrIgM6nxysvbD6aHkuVczS6TVaEeIMf
	28A1PX/Pjj0l4B3IOeSbmbme82LMzwzpQ7rILtlreoUQGiCA1tI1Pr9d/0kLoThD8D1vnVcmVIj
	MxX/X4BuJaP+ETdysPgeOEH3mngfAVe4WiopQRH1H7sELZPRLgpbgPKgaJFVb2ul5KccfsWdjly
	w5w6uyfLtdv8yMKftZ
X-Received: by 2002:adf:e88b:0:b0:435:9635:2943 with SMTP id ffacd0b85a97d-435a5f757a6mr2857800f8f.17.1769062072600;
        Wed, 21 Jan 2026 22:07:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm43165202f8f.2.2026.01.21.22.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 22:07:52 -0800 (PST)
Date: Thu, 22 Jan 2026 09:07:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <202601220733.dS3GMZRD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121060857.237777-1-acelan.kao@canonical.com>
Message-ID: <20260122060749.XnIkfghqt9kUoHRDjM4fuya6hyq8K_3vpl6L2TKdQY0@z>

Hi Chia-Lin,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chia-Lin-Kao-AceLan/thunderbolt-Fix-PCIe-device-enumeration-with-delayed-rescan/20260121-141206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20260121060857.237777-1-acelan.kao%40canonical.com
patch subject: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed rescan
config: arm64-randconfig-r073-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220733.dS3GMZRD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601220733.dS3GMZRD-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/tb.c:128 tb_pci_rescan_work_fn() error: uninitialized symbol 'dev'.
drivers/thunderbolt/tb.c:2392 tb_tunnel_pci() error: uninitialized symbol 'dev'.

vim +/dev +128 drivers/thunderbolt/tb.c

d6d458d42e1e15 Mika Westerberg       2024-08-20  102  static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
d6d458d42e1e15 Mika Westerberg       2024-08-20  103  					  int retry, unsigned long delay);
4f807e47ee9a75 Mika Westerberg       2018-09-17  104  
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  105) static void tb_pci_rescan_work_fn(struct work_struct *work)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  106) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  107) 	struct tb_pci_rescan_work *rescan_work =
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  108) 		container_of(work, typeof(*rescan_work), work.work);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  109) 	struct tb *tb = rescan_work->tb;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  110) 	struct pci_bus *bus = rescan_work->bus;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  111) 	int devices_after = 0;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  112) 	struct pci_dev *dev;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  113) 	struct tb_switch *sw;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  114) 	struct tb_port *port;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  115) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  116) 	mutex_lock(&tb->lock);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  117) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  118) 	sw = tb_switch_find_by_route(tb, rescan_work->route);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  119) 	if (!sw) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  120) 		tb_dbg(tb, "Switch at route %llx disappeared, skipping rescan\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  121) 		       rescan_work->route);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  122) 		goto out_unlock;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  123) 	}
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  124) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  125) 	port = &sw->ports[rescan_work->port];
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  126) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  127) 	pci_lock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21 @128) 	for_each_pci_dev(dev)
                                                                         ^^^

eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  129) 		devices_after++;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  130) 	pci_unlock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  131) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  132) 	if (devices_after > rescan_work->devices_before) {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  133) 		tb_port_dbg(port, "pciehp enumerated %d new device(s)\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  134) 			    devices_after - rescan_work->devices_before);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  135) 	} else {
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  136) 		tb_port_info(port, "pciehp failed to enumerate devices, triggering rescan\n");
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  137) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  138) 		pci_lock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  139) 		pci_rescan_bus(bus);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  140) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  141) 		devices_after = 0;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  142) 		for_each_pci_dev(dev)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  143) 			devices_after++;
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  144) 		pci_unlock_rescan_remove();
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  145) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  146) 		if (devices_after > rescan_work->devices_before)
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  147) 			tb_port_info(port, "rescan found %d new device(s)\n",
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  148) 				     devices_after - rescan_work->devices_before);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  149) 		else
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  150) 			tb_port_warn(port, "no devices found even after rescan\n");
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  151) 	}
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  152) 
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  153) 	tb_switch_put(sw);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  154) out_unlock:
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  155) 	mutex_unlock(&tb->lock);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  156) 	kfree(rescan_work);
eb51ddfd22dbc5 Chia-Lin Kao (AceLan  2026-01-21  157) }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

