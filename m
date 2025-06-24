Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03CE2C1598
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772481; cv=none; b=GxqrzxRsneEnUP6kG5RnA/SIsn+s/dG+b/Dt9NkG+ThiPLLCWTLNvf1S03KxJdIdFLZyjcSYqtDnLCAVH4D4ujlKnpbBgsGIoa9o3e7Ch4+9a+JaTCOApw4De1s0xsOG19wYlSAs0O9DX6mV2/FNZNWgtn9WI+WFwLVo1gGmmOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772481; c=relaxed/simple;
	bh=jmFpIMRpxsSLGoUiR8GyCNXZX+mlzOk8oXjCkCEDPXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BzMK6MBOKZUZXZpm9fKY+cnOWHT6sgF7AHtsDktt807Ipt4iW0wpehOPVagw3lyqoZAO5YfU3NSBk4uThU808ZnEhqYR1m5d+bKhIrfnEJ87awAHta7kaqKLxp44yNtg1ue/kKIt49ECIJ7Igi+Jh1QyKGDLRSAvDkVbHboy11A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xzrfBtT/; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xzrfBtT/"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6060a70ba80so2817215eaf.2
        for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750772477; x=1751377277; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9hpwa0JDrScKcOzTuCWX6BzMr27AQ60ja08V3b6kazw=;
        b=xzrfBtT/uPQ2HMfcnZtJWR8u0/aFYGPoNhnPGhKb8ikZ+/FP9qLX4o+AKVTHwJ/CKo
         h/U1PrMWs4X5NfmjY8iSFhPzkzwk0T2SvyBdEM2n4b8Q8U8UmwfRbv3SkizVwmby69RL
         5VmdrkWkMbQHCyc11docYKo0ZxirfSz1Lq7EP5MLYHlQnR8iDgHzLr1nT0CqPylLXDRq
         ep0k7sBp+WUGwhJnnaw14M5pXzyIiMC65X+r7lniqepmvDyD0PtIQgAmmDMFcRz93e44
         79LdFPyZXfGlJ2578k4wzCWIulxS9snsb3ncj+E5P2YYtKIr1BXB2ZGuuV6y8UNvH67L
         QHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772477; x=1751377277;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hpwa0JDrScKcOzTuCWX6BzMr27AQ60ja08V3b6kazw=;
        b=kql2l+D3XmZh62otG81kOXz6+60w61WWO563R0YWGkCMQSJDCINIosS0+gI53+Lwhk
         560Fc1IiVrNYHeDJSBgAzunSdKNqseuNjMDBQOVHHvRgFC8snKxUULwZQY//3On5y4cX
         LXcE+znbdYkq1KYIsvF2qu1AHMxDopI3NLeGMLa2nvTM5lblHmFbELy5a30hRjRkx1+b
         5QgoA/gnFgDJf/PZdUPPVvn/h214SBODFS+89b9RsyU6dYB6dKflydXltsxMsINzXYOr
         e2n4oozEB6DUqmQnLGljMZAtd5k17V8/UJw1eff8KPVsqau8PLnFCMVht2j0kF5CPZ/P
         HrBQ==
X-Gm-Message-State: AOJu0YwyvO9eCcHgYD4/CnZusjr3l7t9WTnL/YZU/+TkeT/+1IQGqZXz
	43VeqPEI76Y4vcCZxdubGQ0GLS9RqK6ZeNPUktKJgN9RVxW80lOZu+YLNdXqR6yheCNPdpMa0+H
	0a15k
X-Gm-Gg: ASbGncvekMRu33wH/NmB565JghDmriG5ybTYU7cO5/GiPWrCPiX13uR5g4FIE+riaat
	hD6FmZ7i+1QQeAdauUWT5dWquxjozJAtGurNJYwyED83Yv3D8ZfYRjBG3ksiGSLy3wbAXM/FQsS
	8l0sJPXgn68l49AtyqLF+1Wv+peJ7qqxA2/pvmQuJ2jygjchUuCsgZ+NsRdN+7imRLhTopnK4Vm
	DfKJXSJxHOPu4VhZz7tuTZr/bg/KdHtnFGlDWUGyNDSl5kr63wqy2D6K3kO7ceGJi2isgdxhu+p
	zPjva2TPcCAn+5CyQICgkY+yFGWgP6EIpb9uS5CjiJ7RfjNxprs01SWYM7agUH2i64/YlCYyJLl
	n6OP/
X-Google-Smtp-Source: AGHT+IEiuhdW8/sSiJzR1DxhRU/+og+q0UhK5YrSTANwnnO94EH7OfmpA0IaX4cQg+vq2e5zOFcNyQ==
X-Received: by 2002:a05:6870:179c:b0:2e9:8ed9:16fc with SMTP id 586e51a60fabf-2eedba8115cmr10962084fac.11.1750772477122;
        Tue, 24 Jun 2025 06:41:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eead8e17c1sm2067862fac.44.2025.06.24.06.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:41:15 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:41:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Badal Nilawar <badal.nilawar@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com, alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org, daniele.ceraolospurio@intel.com,
	jgg@nvidia.com
Subject: Re: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print
 version info
Message-ID: <aa407944-588c-4514-9523-6f13a989f4ae@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618190007.2932322-10-badal.nilawar@intel.com>

Hi Badal,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Badal-Nilawar/mei-bus-add-mei_cldev_mtu-interface/20250619-025825
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250618190007.2932322-10-badal.nilawar%40intel.com
patch subject: [PATCH v3 09/10] drm/xe/xe_late_bind_fw: Extract and print version info
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241449.WdiucfJp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506241449.WdiucfJp-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_late_bind_fw.c:90 parse_cpd_header() error: uninitialized symbol 'offset'.
drivers/gpu/drm/xe/xe_late_bind_fw.c:155 parse_lb_layout() error: uninitialized symbol 'offset'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_late_bind_fw.c:195 xe_late_bind_wait_for_worker_completion() warn: inconsistent indenting

vim +/offset +90 drivers/gpu/drm/xe/xe_late_bind_fw.c

f9ea24fb9528adc Badal Nilawar 2025-06-19   49  static int parse_cpd_header(struct xe_late_bind *late_bind, u32 fw_id,
f9ea24fb9528adc Badal Nilawar 2025-06-19   50  			    const void *data, size_t size, const char *manifest_entry)
f9ea24fb9528adc Badal Nilawar 2025-06-19   51  {
f9ea24fb9528adc Badal Nilawar 2025-06-19   52  	struct xe_device *xe = late_bind_to_xe(late_bind);
f9ea24fb9528adc Badal Nilawar 2025-06-19   53  	const struct gsc_cpd_header_v2 *header = data;
f9ea24fb9528adc Badal Nilawar 2025-06-19   54  	const struct gsc_manifest_header *manifest;
f9ea24fb9528adc Badal Nilawar 2025-06-19   55  	const struct gsc_cpd_entry *entry;
f9ea24fb9528adc Badal Nilawar 2025-06-19   56  	size_t min_size = sizeof(*header);
f9ea24fb9528adc Badal Nilawar 2025-06-19   57  	struct xe_late_bind_fw *lb_fw;
f9ea24fb9528adc Badal Nilawar 2025-06-19   58  	u32 offset;
                                                ^^^^^^^^^^^

f9ea24fb9528adc Badal Nilawar 2025-06-19   59  	int i;
f9ea24fb9528adc Badal Nilawar 2025-06-19   60  
f9ea24fb9528adc Badal Nilawar 2025-06-19   61  	if (fw_id >= MAX_FW_ID)
f9ea24fb9528adc Badal Nilawar 2025-06-19   62  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19   63  	lb_fw = &late_bind->late_bind_fw[fw_id];
f9ea24fb9528adc Badal Nilawar 2025-06-19   64  
f9ea24fb9528adc Badal Nilawar 2025-06-19   65  	/* manifest_entry is mandatory */
f9ea24fb9528adc Badal Nilawar 2025-06-19   66  	xe_assert(xe, manifest_entry);
f9ea24fb9528adc Badal Nilawar 2025-06-19   67  
f9ea24fb9528adc Badal Nilawar 2025-06-19   68  	if (size < min_size || header->header_marker != GSC_CPD_HEADER_MARKER)
f9ea24fb9528adc Badal Nilawar 2025-06-19   69  		return -ENOENT;
f9ea24fb9528adc Badal Nilawar 2025-06-19   70  
f9ea24fb9528adc Badal Nilawar 2025-06-19   71  	if (header->header_length < sizeof(struct gsc_cpd_header_v2)) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   72  		drm_err(&xe->drm, "%s late binding fw: Invalid CPD header length %u!\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   73  			fw_id_to_name[lb_fw->id], header->header_length);
f9ea24fb9528adc Badal Nilawar 2025-06-19   74  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19   75  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   76  
f9ea24fb9528adc Badal Nilawar 2025-06-19   77  	min_size = header->header_length + sizeof(struct gsc_cpd_entry) * header->num_of_entries;
f9ea24fb9528adc Badal Nilawar 2025-06-19   78  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   79  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   80  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19   81  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19   82  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   83  
f9ea24fb9528adc Badal Nilawar 2025-06-19   84  	/* Look for the manifest first */
f9ea24fb9528adc Badal Nilawar 2025-06-19   85  	entry = (void *)header + header->header_length;
f9ea24fb9528adc Badal Nilawar 2025-06-19   86  	for (i = 0; i < header->num_of_entries; i++, entry++)
f9ea24fb9528adc Badal Nilawar 2025-06-19   87  		if (strcmp(entry->name, manifest_entry) == 0)
f9ea24fb9528adc Badal Nilawar 2025-06-19   88  			offset = entry->offset & GSC_CPD_ENTRY_OFFSET_MASK;
                                                                ^^^^^^^^
Only initialized if found.

f9ea24fb9528adc Badal Nilawar 2025-06-19   89  
f9ea24fb9528adc Badal Nilawar 2025-06-19  @90  	if (!offset) {
                                                     ^^^^^^
Uninitialized.

It's a good idea for developers to set CONFIG_INIT_STACK_ALL_PATTERN=y
in their testing.

f9ea24fb9528adc Badal Nilawar 2025-06-19   91  		drm_err(&xe->drm, "%s late binding fw: Failed to find manifest_entry\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   92  			fw_id_to_name[lb_fw->id]);
f9ea24fb9528adc Badal Nilawar 2025-06-19   93  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19   94  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19   95  
f9ea24fb9528adc Badal Nilawar 2025-06-19   96  	min_size = offset + sizeof(struct gsc_manifest_header);
f9ea24fb9528adc Badal Nilawar 2025-06-19   97  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19   98  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19   99  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  100  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  101  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  102  
f9ea24fb9528adc Badal Nilawar 2025-06-19  103  	manifest = data + offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  104  
f9ea24fb9528adc Badal Nilawar 2025-06-19  105  	lb_fw->version.major = manifest->fw_version.major;
f9ea24fb9528adc Badal Nilawar 2025-06-19  106  	lb_fw->version.minor = manifest->fw_version.minor;
f9ea24fb9528adc Badal Nilawar 2025-06-19  107  	lb_fw->version.hotfix = manifest->fw_version.hotfix;
f9ea24fb9528adc Badal Nilawar 2025-06-19  108  	lb_fw->version.build = manifest->fw_version.build;
f9ea24fb9528adc Badal Nilawar 2025-06-19  109  
f9ea24fb9528adc Badal Nilawar 2025-06-19  110  	return 0;
f9ea24fb9528adc Badal Nilawar 2025-06-19  111  }
f9ea24fb9528adc Badal Nilawar 2025-06-19  112  
f9ea24fb9528adc Badal Nilawar 2025-06-19  113  /* Refer to the "Late Bind based Firmware Layout" documentation entry for details */
f9ea24fb9528adc Badal Nilawar 2025-06-19  114  static int parse_lb_layout(struct xe_late_bind *late_bind, u32 fw_id,
f9ea24fb9528adc Badal Nilawar 2025-06-19  115  			   const void *data, size_t size, const char *fpt_entry)
f9ea24fb9528adc Badal Nilawar 2025-06-19  116  {
f9ea24fb9528adc Badal Nilawar 2025-06-19  117  	struct xe_device *xe = late_bind_to_xe(late_bind);
f9ea24fb9528adc Badal Nilawar 2025-06-19  118  	const struct csc_fpt_header *header = data;
f9ea24fb9528adc Badal Nilawar 2025-06-19  119  	const struct csc_fpt_entry *entry;
f9ea24fb9528adc Badal Nilawar 2025-06-19  120  	size_t min_size = sizeof(*header);
f9ea24fb9528adc Badal Nilawar 2025-06-19  121  	struct xe_late_bind_fw *lb_fw;
f9ea24fb9528adc Badal Nilawar 2025-06-19  122  	u32 offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  123  	int i;
f9ea24fb9528adc Badal Nilawar 2025-06-19  124  
f9ea24fb9528adc Badal Nilawar 2025-06-19  125  	if (fw_id >= MAX_FW_ID)
f9ea24fb9528adc Badal Nilawar 2025-06-19  126  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19  127  
f9ea24fb9528adc Badal Nilawar 2025-06-19  128  	lb_fw = &late_bind->late_bind_fw[fw_id];
f9ea24fb9528adc Badal Nilawar 2025-06-19  129  
f9ea24fb9528adc Badal Nilawar 2025-06-19  130  	/* fpt_entry is mandatory */
f9ea24fb9528adc Badal Nilawar 2025-06-19  131  	xe_assert(xe, fpt_entry);
f9ea24fb9528adc Badal Nilawar 2025-06-19  132  
f9ea24fb9528adc Badal Nilawar 2025-06-19  133  	if (size < min_size || header->header_marker != CSC_FPT_HEADER_MARKER)
f9ea24fb9528adc Badal Nilawar 2025-06-19  134  		return -ENOENT;
f9ea24fb9528adc Badal Nilawar 2025-06-19  135  
f9ea24fb9528adc Badal Nilawar 2025-06-19  136  	if (header->header_length < sizeof(struct csc_fpt_header)) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  137  		drm_err(&xe->drm, "%s late binding fw: Invalid FPT header length %u!\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  138  			fw_id_to_name[lb_fw->id], header->header_length);
f9ea24fb9528adc Badal Nilawar 2025-06-19  139  		return -EINVAL;
f9ea24fb9528adc Badal Nilawar 2025-06-19  140  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  141  
f9ea24fb9528adc Badal Nilawar 2025-06-19  142  	min_size = header->header_length + sizeof(struct csc_fpt_entry) * header->num_of_entries;
f9ea24fb9528adc Badal Nilawar 2025-06-19  143  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  144  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  145  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  146  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  147  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  148  
f9ea24fb9528adc Badal Nilawar 2025-06-19  149  	/* Look for the manifest first */
f9ea24fb9528adc Badal Nilawar 2025-06-19  150  	entry = (void *)header + header->header_length;
f9ea24fb9528adc Badal Nilawar 2025-06-19  151  	for (i = 0; i < header->num_of_entries; i++, entry++)
f9ea24fb9528adc Badal Nilawar 2025-06-19  152  		if (strcmp(entry->name, fpt_entry) == 0)
f9ea24fb9528adc Badal Nilawar 2025-06-19  153  			offset = entry->offset;
f9ea24fb9528adc Badal Nilawar 2025-06-19  154  
f9ea24fb9528adc Badal Nilawar 2025-06-19 @155  	if (!offset) {

Same.

f9ea24fb9528adc Badal Nilawar 2025-06-19  156  		drm_err(&xe->drm, "%s late binding fw: Failed to find fpt_entry\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  157  			fw_id_to_name[lb_fw->id]);
f9ea24fb9528adc Badal Nilawar 2025-06-19  158  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  159  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  160  
f9ea24fb9528adc Badal Nilawar 2025-06-19  161  	min_size = offset + sizeof(struct gsc_cpd_header_v2);
f9ea24fb9528adc Badal Nilawar 2025-06-19  162  	if (size < min_size) {
f9ea24fb9528adc Badal Nilawar 2025-06-19  163  		drm_err(&xe->drm, "%s late binding fw: too small! %zu < %zu\n",
f9ea24fb9528adc Badal Nilawar 2025-06-19  164  			fw_id_to_name[lb_fw->id], size, min_size);
f9ea24fb9528adc Badal Nilawar 2025-06-19  165  		return -ENODATA;
f9ea24fb9528adc Badal Nilawar 2025-06-19  166  	}
f9ea24fb9528adc Badal Nilawar 2025-06-19  167  
f9ea24fb9528adc Badal Nilawar 2025-06-19  168  	return parse_cpd_header(late_bind, fw_id, data + offset, size - offset, "LTES.man");
f9ea24fb9528adc Badal Nilawar 2025-06-19  169  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

