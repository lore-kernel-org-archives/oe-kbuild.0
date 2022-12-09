Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8FEA35;
	Fri,  9 Dec 2022 08:13:55 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so2830711wmi.3;
        Fri, 09 Dec 2022 00:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdIzkxPRYzAjAf7rAqy+8enkPgHjn2/bQAARiyzDu9s=;
        b=aOjEPgeyzBom1sl2udt0Cx/hW1nDoVE/utCMz3s9B5iWJ7J7yqUv4MsDUevsAJIqcE
         QsmVLvr4BcwdHhZo0KS/207HoVFQXcVtIuHb7ZDbeU0wguYF3faFmeTwDCInvAPFDbyX
         aEqe+shHZ89Yn77HQWZToNem8XN/yzDZXFI2/9a2OIWZDapXmC2flbBMaIfgkADxngt8
         EcHYbt/+hOJVXXSWzMZAxynNypGkKHsZ6I06z30xxB0AndOJ1rsxdAAmTSg2ggcn09W8
         xUTrwFEqRQXnBSpmtOBH1laHvsWxOxYAXPzmPFVNofhXHpCH50QxJk63ck6M5GFQNopA
         v17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdIzkxPRYzAjAf7rAqy+8enkPgHjn2/bQAARiyzDu9s=;
        b=7cWpbhnsrEfZNacuimlVp7/8t0WSjb342y/4sOp34jRPZ2X82qUzgW3bQWXI59LRqR
         eJo3c+h+9mg6VdToWet7JFyObWMe9tqhX1SfLTMQ3zdGk60xetR6ADm38D3PBUWVi11F
         rYlBIEM6W/xBRrbhJzsc1sruORWpGQAEkC/06y00E8eU9IfR+lHqaQ8qXVB3mtw64kYR
         nqJ8Fe2g5lIF+5/PJkyQrNzn8jAnX9x1BxjmCui8erBqrShYqgwNAet3f8vT1QY2qGA4
         RXzHFBijjsHkTdieFIa9JoJduhV5mQ+cYYoQRlafFwnBqra2jQSAw2qhMTJzpLwQMAq6
         arhw==
X-Gm-Message-State: ANoB5pkekRRPkNni9qflhEIMMpqdZcr3fL5RIek4uUFMMxO4hoSaiyMj
	+S/o8GtyCH3JJXhIlnTGIRf3ESUKkgMfViy0
X-Google-Smtp-Source: AA0mqf6sd3WIfdth6//GrM1nTQ/vQgfxTTdoMIuDEjsz4F7NrFhm7F3/+lt/VSVabS5p3mSPCmPVNA==
X-Received: by 2002:a05:600c:6543:b0:3d1:fcca:ce24 with SMTP id dn3-20020a05600c654300b003d1fccace24mr3481458wmb.32.1670573634015;
        Fri, 09 Dec 2022 00:13:54 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020a05600c46ca00b003c70191f267sm8037846wmo.39.2022.12.09.00.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 00:13:53 -0800 (PST)
Date: Fri, 9 Dec 2022 11:13:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:port_check_acpi_dsm 6/10] drivers/acpi/utils.c:480
 acpi_get_usb_port_capabilities() error: we previously assumed 'upc_info'
 could be null (see line 477)
Message-ID: <202212090854.RJtMZyrx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221209081350.h9343dpsaFZBUopn7znth9mFjhUkSZBZmSWdKUomxUk@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git port_check_acpi_dsm
head:   9cdf4f678cf5f9b3362e0095978d17ff9aefb588
commit: ae18f045cf63d38e77ffe8b8b2d95a49a316b2bf [6/10] ACPI: utils: add support for reading _UPC USB Port Capabilities
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/acpi/utils.c:480 acpi_get_usb_port_capabilities() error: we previously assumed 'upc_info' could be null (see line 477)

vim +/upc_info +480 drivers/acpi/utils.c

ae18f045cf63d3 Mathias Nyman 2022-11-29  458  acpi_status
ae18f045cf63d3 Mathias Nyman 2022-11-29  459  acpi_get_usb_port_capabilities(acpi_handle handle, struct acpi_upc_info **upc)
ae18f045cf63d3 Mathias Nyman 2022-11-29  460  {
ae18f045cf63d3 Mathias Nyman 2022-11-29  461  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
ae18f045cf63d3 Mathias Nyman 2022-11-29  462  	struct acpi_upc_info *upc_info;
ae18f045cf63d3 Mathias Nyman 2022-11-29  463  	union acpi_object *obj = NULL;
ae18f045cf63d3 Mathias Nyman 2022-11-29  464  	acpi_status status;
ae18f045cf63d3 Mathias Nyman 2022-11-29  465  
ae18f045cf63d3 Mathias Nyman 2022-11-29  466  	status = acpi_evaluate_object(handle, "_UPC", NULL, &buffer);
ae18f045cf63d3 Mathias Nyman 2022-11-29  467  	if (ACPI_FAILURE(status))
ae18f045cf63d3 Mathias Nyman 2022-11-29  468  		goto out;
ae18f045cf63d3 Mathias Nyman 2022-11-29  469  
ae18f045cf63d3 Mathias Nyman 2022-11-29  470  	obj = buffer.pointer;
ae18f045cf63d3 Mathias Nyman 2022-11-29  471  	if (!obj || (obj->type != ACPI_TYPE_PACKAGE) || obj->package.count != 4) {
ae18f045cf63d3 Mathias Nyman 2022-11-29  472  		status = AE_TYPE;
ae18f045cf63d3 Mathias Nyman 2022-11-29  473  		goto out;
ae18f045cf63d3 Mathias Nyman 2022-11-29  474  	}
ae18f045cf63d3 Mathias Nyman 2022-11-29  475  
ae18f045cf63d3 Mathias Nyman 2022-11-29  476  	upc_info = ACPI_ALLOCATE_ZEROED(sizeof(struct acpi_upc_info));
ae18f045cf63d3 Mathias Nyman 2022-11-29 @477  	if (!upc_info)
ae18f045cf63d3 Mathias Nyman 2022-11-29  478  		status = AE_NO_MEMORY;

goto out;

ae18f045cf63d3 Mathias Nyman 2022-11-29  479  
ae18f045cf63d3 Mathias Nyman 2022-11-29 @480  	upc_info->connectable = obj->package.elements[0].integer.value;
ae18f045cf63d3 Mathias Nyman 2022-11-29  481  	upc_info->type = obj->package.elements[1].integer.value;
ae18f045cf63d3 Mathias Nyman 2022-11-29  482  	upc_info->usbc_capabilities = obj->package.elements[2].integer.value;
ae18f045cf63d3 Mathias Nyman 2022-11-29  483  
ae18f045cf63d3 Mathias Nyman 2022-11-29  484  	*upc = upc_info;
ae18f045cf63d3 Mathias Nyman 2022-11-29  485  out:
ae18f045cf63d3 Mathias Nyman 2022-11-29  486  	kfree(obj);
ae18f045cf63d3 Mathias Nyman 2022-11-29  487  	return status;
ae18f045cf63d3 Mathias Nyman 2022-11-29  488  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


