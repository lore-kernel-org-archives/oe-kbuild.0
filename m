Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61A27F;
	Sat, 25 Mar 2023 07:19:10 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id t10so16030215edd.12;
        Sat, 25 Mar 2023 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679728748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2Lakoiqf+b405RhNeKhA8+8uQ9GhOVChZGkG8jYViM=;
        b=SHk/jwp+5LHO2Q1bXXdIh01NJhcQUBU7Ayk+q2PUnHkU8WIhKVV5SjHGf3B9eg2d0u
         3jmmJQv0ZYlmPwKNgFmFjyBcfqvlf5idxpmr7P95stObGQK6DXDgffOLTxbyOM+S1NVy
         v9qtwy29u+irKAaM4spqhiS7MLysiP9kVCw7ZOEGeRHplxVxulmtJ3cON2T4wqnMOb/3
         J0uVuotcndB5LIlxiKFZR01FMrrPr5DYLebY8iiaOKjqr7rCxC6h6yKgKkocEGKqrYi4
         ML51gq9OI8b6Vq2rpfrdn19OfB2cTPcT3lo+82Z4dmfM6V2vUR1HD7DtuvS2P6wucBFg
         DCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679728748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2Lakoiqf+b405RhNeKhA8+8uQ9GhOVChZGkG8jYViM=;
        b=e4wvsHOpaQ1iJBP8yPlaEMTdMks357p7MgBCT+z6i90dlZ8+g/QNoT1VScg7CS3lfp
         YHDfQsDdnhnHUL89ZQEXwDpSTY6WBxfD7rq9/mkx0SAgEMrVUn1mzlTOUX6+A/wrK6y6
         0gZFNYVNoOy1lkKWpT2GFLOk/3cyf7lH1Yym5mdDryV+Xd9NBjNeXBx9IY0XggZEZIMB
         PvUBuv5lbyJvZvzmdisPjW/JScjrcz5hBi/WsCa1Fz5uhH+GlFwOvvY1fL1PTDXxJxah
         PmnfSzCv7w6cjfLm44ngYGTX2fBCGMIOIeCJRDcttArmnjXmLdGwI7cXytDQmj8EM1ys
         du6g==
X-Gm-Message-State: AAQBX9dfrgXHDBJtPaBYFWqdIWQveqBXMo0GQNjcq2ruzg1SAA0Zduib
	RkNqYU9w3VnTscy53l6z+y4k7Wut2Uod1A==
X-Google-Smtp-Source: AKy350bAvZiVj8oCyeLBH3lywneVzJCRC7A5JS/wA4y8/HL77c3bNppjANrDX3ohUTzGwfy3EO5oAQ==
X-Received: by 2002:a05:6402:1143:b0:502:25ac:c72a with SMTP id g3-20020a056402114300b0050225acc72amr2920578edw.1.1679728748455;
        Sat, 25 Mar 2023 00:19:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s30-20020a50ab1e000000b004c5d1a15bd5sm11724665edc.69.2023.03.25.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 00:19:08 -0700 (PDT)
Date: Sat, 25 Mar 2023 10:18:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Subject: [cxl:for-6.4/cxl-type-2 10/22] drivers/cxl/core/pci.c:493
 cxl_probe_link() warn: right shifting more than type allows 16 vs 16
Message-ID: <cb1319e7-e4ef-4358-9b3e-cca489395f3f@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.4/cxl-type-2
head:   0b80e8b55828313bcd08c4740646689e648de444
commit: 45bbde21f573f287d5828b5e3ff1eac0320acc3d [10/22] cxl/port: Enumerate flit mode capability
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230325/202303251253.yCqOttoG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303251253.yCqOttoG-lkp@intel.com/

New smatch warnings:
drivers/cxl/core/pci.c:493 cxl_probe_link() warn: right shifting more than type allows 16 vs 16

Old smatch warnings:
drivers/cxl/core/pci.c:496 cxl_probe_link() warn: right shifting more than type allows 16 vs 16

vim +493 drivers/cxl/core/pci.c

45bbde21f573f2 Dan Williams 2023-03-05  451  int cxl_probe_link(struct cxl_port *port)
45bbde21f573f2 Dan Williams 2023-03-05  452  {
45bbde21f573f2 Dan Williams 2023-03-05  453  	struct pci_dev *pdev = cxl_port_to_pci(port);
45bbde21f573f2 Dan Williams 2023-03-05  454  	u16 cap, en, hdr, parent_features;
                                                ^^^          ^^^
hdr is a u16.

45bbde21f573f2 Dan Williams 2023-03-05  455  	struct cxl_port *parent_port;
45bbde21f573f2 Dan Williams 2023-03-05  456  	struct device *dev;
45bbde21f573f2 Dan Williams 2023-03-05  457  	int rc, dvsec;
45bbde21f573f2 Dan Williams 2023-03-05  458  
45bbde21f573f2 Dan Williams 2023-03-05  459  	if (!pdev) {
45bbde21f573f2 Dan Williams 2023-03-05  460  		/*
45bbde21f573f2 Dan Williams 2023-03-05  461  		 * Assume host bridges support all features, the root
45bbde21f573f2 Dan Williams 2023-03-05  462  		 * port will dictate the actual enabled set to endpoints.
45bbde21f573f2 Dan Williams 2023-03-05  463  		 */
45bbde21f573f2 Dan Williams 2023-03-05  464  		return 0;
45bbde21f573f2 Dan Williams 2023-03-05  465  	}
45bbde21f573f2 Dan Williams 2023-03-05  466  
45bbde21f573f2 Dan Williams 2023-03-05  467  	dev = &pdev->dev;
45bbde21f573f2 Dan Williams 2023-03-05  468  	dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL,
45bbde21f573f2 Dan Williams 2023-03-05  469  					  CXL_DVSEC_FLEXBUS_PORT);
45bbde21f573f2 Dan Williams 2023-03-05  470  	if (!dvsec) {
45bbde21f573f2 Dan Williams 2023-03-05  471  		dev_err(dev, "Failed to enumerate port capabilities\n");
45bbde21f573f2 Dan Williams 2023-03-05  472  		return -ENXIO;
45bbde21f573f2 Dan Williams 2023-03-05  473  	}
45bbde21f573f2 Dan Williams 2023-03-05  474  
45bbde21f573f2 Dan Williams 2023-03-05  475  	/*
45bbde21f573f2 Dan Williams 2023-03-05  476  	 * Cache the link features for future determination of HDM-D or
45bbde21f573f2 Dan Williams 2023-03-05  477  	 * HDM-DB support
45bbde21f573f2 Dan Williams 2023-03-05  478  	 */
45bbde21f573f2 Dan Williams 2023-03-05  479  	rc = pci_read_config_word(pdev, dvsec + PCI_DVSEC_HEADER1, &hdr);
45bbde21f573f2 Dan Williams 2023-03-05  480  	if (rc)
45bbde21f573f2 Dan Williams 2023-03-05  481  		return rc;
45bbde21f573f2 Dan Williams 2023-03-05  482  
45bbde21f573f2 Dan Williams 2023-03-05  483  	rc = pci_read_config_word(pdev, dvsec + CXL_DVSEC_FLEXBUS_CAP_OFFSET,
45bbde21f573f2 Dan Williams 2023-03-05  484  				  &cap);
45bbde21f573f2 Dan Williams 2023-03-05  485  	if (rc)
45bbde21f573f2 Dan Williams 2023-03-05  486  		return rc;
45bbde21f573f2 Dan Williams 2023-03-05  487  
45bbde21f573f2 Dan Williams 2023-03-05  488  	rc = pci_read_config_word(pdev, dvsec + CXL_DVSEC_FLEXBUS_STATUS_OFFSET,
45bbde21f573f2 Dan Williams 2023-03-05  489  				  &en);
45bbde21f573f2 Dan Williams 2023-03-05  490  	if (rc)
45bbde21f573f2 Dan Williams 2023-03-05  491  		return rc;
45bbde21f573f2 Dan Williams 2023-03-05  492  
45bbde21f573f2 Dan Williams 2023-03-05 @493  	if (PCI_DVSEC_HEADER1_REV(hdr) < 2)

PCI_DVSEC_HEADER1_REV() does a >> 16 so the result is always zero.

45bbde21f573f2 Dan Williams 2023-03-05  494  		cap &= ~CXL_DVSEC_FLEXBUS_REV2_MASK;
45bbde21f573f2 Dan Williams 2023-03-05  495  
45bbde21f573f2 Dan Williams 2023-03-05  496  	if (PCI_DVSEC_HEADER1_REV(hdr) < 1)
45bbde21f573f2 Dan Williams 2023-03-05  497  		cap &= ~CXL_DVSEC_FLEXBUS_REV1_MASK;
45bbde21f573f2 Dan Williams 2023-03-05  498  
45bbde21f573f2 Dan Williams 2023-03-05  499  	en &= cap;
45bbde21f573f2 Dan Williams 2023-03-05  500  	parent_port = to_cxl_port(port->dev.parent);
45bbde21f573f2 Dan Williams 2023-03-05  501  	parent_features = parent_port->features;
45bbde21f573f2 Dan Williams 2023-03-05  502  
45bbde21f573f2 Dan Williams 2023-03-05  503  	/* Enforce port features are plumbed through to the host bridge */
45bbde21f573f2 Dan Williams 2023-03-05  504  	port->features = en & CXL_DVSEC_FLEXBUS_ENABLE_MASK & parent_features;
45bbde21f573f2 Dan Williams 2023-03-05  505  
45bbde21f573f2 Dan Williams 2023-03-05  506  	dev_dbg(dev, "features:%s%s%s%s%s%s%s\n",
45bbde21f573f2 Dan Williams 2023-03-05  507  		en & CXL_DVSEC_FLEXBUS_CACHE_ENABLED ? " cache" : "",
45bbde21f573f2 Dan Williams 2023-03-05  508  		en & CXL_DVSEC_FLEXBUS_IO_ENABLED ? " io" : "",
45bbde21f573f2 Dan Williams 2023-03-05  509  		en & CXL_DVSEC_FLEXBUS_MEM_ENABLED ? " mem" : "",
45bbde21f573f2 Dan Williams 2023-03-05  510  		en & CXL_DVSEC_FLEXBUS_FLIT68_ENABLED ? " flit68" : "",
45bbde21f573f2 Dan Williams 2023-03-05  511  		en & CXL_DVSEC_FLEXBUS_MLD_ENABLED ? " mld" : "",
45bbde21f573f2 Dan Williams 2023-03-05  512  		en & CXL_DVSEC_FLEXBUS_FLIT256_ENABLED ? " flit256" : "",
45bbde21f573f2 Dan Williams 2023-03-05  513  		en & CXL_DVSEC_FLEXBUS_PBR_ENABLED ? " pbr" : "");
45bbde21f573f2 Dan Williams 2023-03-05  514  
45bbde21f573f2 Dan Williams 2023-03-05  515  	return 0;
45bbde21f573f2 Dan Williams 2023-03-05  516  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

