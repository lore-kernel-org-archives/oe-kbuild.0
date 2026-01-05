Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A1233A9F6
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615910; cv=none; b=MTHZzfiYu0ckBhoW4Lx87s6dnnNfjOroK8gq3MZtlCgbyV0yF5s3hMAO0VR6W3+E8DjkBRTpgPs1QWFRcH6rd0nrf2pnY4/09ONzGDKDdip5Lfkb6FcrnfeABWIvv6bMQa21IU5rHnvVZ28lQOVHS3gSl88vmBO2+wl7VV4Xig4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615910; c=relaxed/simple;
	bh=F94WSDFVRm+NrIR45Tte4W4BwwT67J+ExCFM2ZpbWjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2xTOkkX8E1hR6f7f4TwDq7U9TzqT90whFX1Q4nMMlEjjJzUcOh65+0PN1oMvh0rgxvmFYzvVRMoObJqct8vnSN/uZyJFfZidSe45/iXcvwxDaP3Y6lE8Xu2b0JEcN+F+51jzpN+5KnFKiJHg2C0L/rOnpdwfubhCYvOwAPv7uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=waIRh3wO; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="waIRh3wO"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so29819695e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 04:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767615906; x=1768220706; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DT3pnDjpknN9ygYrWIs2s6mtq9dI87CHEejFASEljXs=;
        b=waIRh3wOfIokrQ7qtMAYvDkF2HntGMGYO+I4otLJbmkMsNgc6b5qbe3VaOpgrB4m70
         NSaayaUztXYQTw+zbTJb3WoBI90ELSNo4GjHGskPbhopw8Uzp4a8J0Yuh2Kik1zIyFWl
         ac6XHxeSZn0kFIbVv7gYiAFsRxhHCiSIM9QutmXwsG0VsrkHm2VTw6oe/KN90ojie7Ge
         oidre/h3lRgJAWODaIIrVCgkEwWMHU34RGQmM6/t4PQUQUSLB76HnVyp5jJEOiGa6u9T
         8FIlQikiP008L4d5TrI7StP+Dgbc3do+nyE/MFamYZdVqmqp712X4C4kJJaZcGrVTRhq
         tXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615906; x=1768220706;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DT3pnDjpknN9ygYrWIs2s6mtq9dI87CHEejFASEljXs=;
        b=GdpZqtdeSBLSw7wIdEte35uVJxDnjCHx1V8hAmi7eIXDaExBl6Pj/hcxy2qR8lp0gv
         xcRMVaPPnlLVMTc/GoioqbJRkinqO8EmqbPLFZP4qnTAkM0u+41jlVUXRK8Z+HLTsW/O
         XH6mV9a9fNCBCPkO8zvzPzGtEnoe+Dxgf5BgkYp1zZ+eiFnTwKSdNUP0WNUy6Mk1yZ0W
         BQksyW+5SsvmcxBfboRISvRUYVDdDrPOsGOFjcawPGD07/uxtD2f6+JaO7jeeK4AurWV
         W7yKig8JA8yov1X4NVi26btYWNDOO3U4hWMxa9GNko1Zh8wsLbVhsl7Zoe6AjD3i25bZ
         TW+g==
X-Gm-Message-State: AOJu0Yz0V3Pnp4f0tsxFHNdkSrOALjD44O0I+SsigXBk66gedGAxhcPE
	20MBKWcSibrgt1d3ECrMqSg0UxjQBqC6P5wNLQVCSuKQL7IuI/CqvHfyB0j1h0qy5WdWoTvqF8w
	K3W6V
X-Gm-Gg: AY/fxX4zoWpLto4m3GkB06etvMPCwrYhXXFmX1RXLqp9HcCtDNOuC8mtil5AOHKn9jr
	gcq0QYZ1zaxJu6j3KygrQguSbKecR9Y4EKFMSAyZ764s1lOlexhxSsfNMEIJt6Zd00LGxLzsaSn
	Hrj58czQZ41A4FcK8JPRXLW2I6kCX97mqbdQQdFIyARBxu8kvgqgRBfx9L4XiPQzzMbz3DvwS0b
	qzbSi4pTDRR9A+CLgSOLFw7eNW5c+SehwGbXEJNNCNJ5e0jvWKekdchktDKCbXz0ilQsoGS4IX0
	MYii3EGTqKqHBxbXUM3e9/CzmGEvg2X6eXhCNlbPfNU3CjmsyOKnqxFBwgSMOYg6c3pvT/0ofcu
	I8w5C4AWCuwEGtmMI5Qx2jBliPDp31i6ahpw1bR7i3nTmiGg31CxqVK6r/sS43c6uhJ4Ln68oCX
	hBTYE7wfPu1IgOQkgZ
X-Google-Smtp-Source: AGHT+IHmAWAnmy61ZiDLNiFuZuU7bfRZMbr/IK49jKERbJ9mENHjldiHWq0LGVSRZRIDyPPKbTReTA==
X-Received: by 2002:a05:600c:46d5:b0:477:632c:5b91 with SMTP id 5b1f17b1804b1-47d1954e3e4mr719204415e9.16.1767615906175;
        Mon, 05 Jan 2026 04:25:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6ba30531sm60872835e9.1.2026.01.05.04.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:25:04 -0800 (PST)
Date: Mon, 5 Jan 2026 15:25:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Timothy Pearson <tpearson@raptorengineering.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: drivers/pci/hotplug/pnv_php.c:710 pnv_php_alloc_slot() warn: address
 of NULL pointer 'php_slot->bus'
Message-ID: <202601050123.5JEZ4Znh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260105122501.U9VvGeGdDF99K6fTl7Vok5o1WGa5fK4LMrzM0uL7pzg@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   54e82e93ca93e49cb4c33988adec5c8cb9d0df31
commit: 4668619092554e1b95c9a5ac2941ca47ba6d548a PCI: pnv_php: Clean up allocated IRQs on unplug
config: powerpc64-randconfig-r071-20260104 (https://download.01.org/0day-ci/archive/20260105/202601050123.5JEZ4Znh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601050123.5JEZ4Znh-lkp@intel.com/

smatch warnings:
drivers/pci/hotplug/pnv_php.c:710 pnv_php_alloc_slot() warn: address of NULL pointer 'php_slot->bus'

vim +710 drivers/pci/hotplug/pnv_php.c

66725152fb9f17b Gavin Shan      2016-05-20  678  static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)
66725152fb9f17b Gavin Shan      2016-05-20  679  {
66725152fb9f17b Gavin Shan      2016-05-20  680  	struct pnv_php_slot *php_slot;
66725152fb9f17b Gavin Shan      2016-05-20  681  	struct pci_bus *bus;
66725152fb9f17b Gavin Shan      2016-05-20  682  	const char *label;
66725152fb9f17b Gavin Shan      2016-05-20  683  	uint64_t id;
39f0d6fbdc3f205 Gavin Shan      2016-09-29  684  	int ret;
66725152fb9f17b Gavin Shan      2016-05-20  685  
39f0d6fbdc3f205 Gavin Shan      2016-09-29  686  	ret = of_property_read_string(dn, "ibm,slot-label", &label);
39f0d6fbdc3f205 Gavin Shan      2016-09-29  687  	if (ret)
66725152fb9f17b Gavin Shan      2016-05-20  688  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  689  
66725152fb9f17b Gavin Shan      2016-05-20  690  	if (pnv_pci_get_slot_id(dn, &id))
66725152fb9f17b Gavin Shan      2016-05-20  691  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  692  
66725152fb9f17b Gavin Shan      2016-05-20  693  	bus = pci_find_bus_by_node(dn);
149ba66a90a3b3c Gavin Shan      2016-09-28  694  	if (!bus)
66725152fb9f17b Gavin Shan      2016-05-20  695  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  696  
66725152fb9f17b Gavin Shan      2016-05-20  697  	php_slot = kzalloc(sizeof(*php_slot), GFP_KERNEL);
149ba66a90a3b3c Gavin Shan      2016-09-28  698  	if (!php_slot)
66725152fb9f17b Gavin Shan      2016-05-20  699  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  700  
66725152fb9f17b Gavin Shan      2016-05-20  701  	php_slot->name = kstrdup(label, GFP_KERNEL);
149ba66a90a3b3c Gavin Shan      2016-09-28  702  	if (!php_slot->name) {
66725152fb9f17b Gavin Shan      2016-05-20  703  		kfree(php_slot);
66725152fb9f17b Gavin Shan      2016-05-20  704  		return NULL;
66725152fb9f17b Gavin Shan      2016-05-20  705  	}
66725152fb9f17b Gavin Shan      2016-05-20  706  
4668619092554e1 Timothy Pearson 2025-07-15  707  	/* Allocate workqueue for this slot's interrupt handling */
4668619092554e1 Timothy Pearson 2025-07-15  708  	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
4668619092554e1 Timothy Pearson 2025-07-15  709  	if (!php_slot->wq) {
4668619092554e1 Timothy Pearson 2025-07-15 @710  		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");

The SLOT_WARN() macro looks like:

#define SLOT_WARN(sl, x...) \
        ((sl)->pdev ? pci_warn((sl)->pdev, x) : dev_warn(&(sl)->bus->dev, x))

Neither ->pdev nor ->bus are set so it will crash.

4668619092554e1 Timothy Pearson 2025-07-15  711  		kfree(php_slot->name);
4668619092554e1 Timothy Pearson 2025-07-15  712  		kfree(php_slot);
4668619092554e1 Timothy Pearson 2025-07-15  713  		return NULL;
4668619092554e1 Timothy Pearson 2025-07-15  714  	}
4668619092554e1 Timothy Pearson 2025-07-15  715  
149ba66a90a3b3c Gavin Shan      2016-09-28  716  	if (dn->child && PCI_DN(dn->child))
66725152fb9f17b Gavin Shan      2016-05-20  717  		php_slot->slot_no = PCI_SLOT(PCI_DN(dn->child)->devfn);
66725152fb9f17b Gavin Shan      2016-05-20  718  	else
66725152fb9f17b Gavin Shan      2016-05-20  719  		php_slot->slot_no = -1;   /* Placeholder slot */
66725152fb9f17b Gavin Shan      2016-05-20  720  
66725152fb9f17b Gavin Shan      2016-05-20  721  	kref_init(&php_slot->kref);
66725152fb9f17b Gavin Shan      2016-05-20  722  	php_slot->state	                = PNV_PHP_STATE_INITIALIZED;
66725152fb9f17b Gavin Shan      2016-05-20  723  	php_slot->dn	                = dn;
66725152fb9f17b Gavin Shan      2016-05-20  724  	php_slot->pdev	                = bus->self;
66725152fb9f17b Gavin Shan      2016-05-20  725  	php_slot->bus	                = bus;
66725152fb9f17b Gavin Shan      2016-05-20  726  	php_slot->id	                = id;
66725152fb9f17b Gavin Shan      2016-05-20  727  	php_slot->power_state_check     = false;
66725152fb9f17b Gavin Shan      2016-05-20  728  	php_slot->slot.ops              = &php_slot_ops;
66725152fb9f17b Gavin Shan      2016-05-20  729  
66725152fb9f17b Gavin Shan      2016-05-20  730  	INIT_LIST_HEAD(&php_slot->children);
66725152fb9f17b Gavin Shan      2016-05-20  731  	INIT_LIST_HEAD(&php_slot->link);
66725152fb9f17b Gavin Shan      2016-05-20  732  
66725152fb9f17b Gavin Shan      2016-05-20  733  	return php_slot;
66725152fb9f17b Gavin Shan      2016-05-20  734  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

