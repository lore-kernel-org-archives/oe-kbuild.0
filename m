Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112021A238E
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146930; cv=none; b=S6ybbR5XnZ/b5WnXPw4nKzCWkUf65tWZZij3I3JnAhY4I1pJvZs2B+pOEdqsqimuax9QtEmWT4pTzIc/YGZXhPWZv82ddBX4AD54QwnEGpJXVKBZbAPuKcQSsnQzZR7fWghxBc9m6/GAKMBkrjdTBqPyqFIjnEsxqUHoDHmP8ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146930; c=relaxed/simple;
	bh=FwZKRCw8iT8978ldsjaRlYdpJhgTsERdkb+N3lNjX/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9c8YSmlbX/UvplfYdmWY6OR+trsSeOuBU7TxUCeqmekxAMvWMRArUlITzh4nAwp+aNAmv+PynwU9Rlcvqz/Izaxi2iCv5MYboRmSf13y6y8bRPOCH6atPlVSylL5+Mw4i0s75MWiV6uD9t6xRHWbBL/ujuFozNYOvTtA9mmt6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mYL85l7M; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mYL85l7M"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0af41faa5so3174197f8f.2
        for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146926; x=1747751726; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=28KEA+cf7exzULPtaOdve61V0mLdHEa4yWh1byFce8Y=;
        b=mYL85l7MfaWZyJcSDTu9XGCQ0072LSXAeL1bdz4trL7gRbkTUS94hPassoLZBKew/+
         ihi/xksO/t/Uqql5cKxeiMp4BjpYmv8U/BPw98Ubmx1jXrJllEX2phMOScUIcKMSXe1z
         tBdWqu93hbxPyJrjazwvHf5PiNH6XEzcMvt04AzyJgZLkJME9mn0Je75TwFyxdhJ70WA
         V/4CQyKDE3uGoRdkkIcbGaBHS9XJIhz1nBpwl66fbmB+cVqe1NRg2KOzywU1xH5vHgwF
         O5GejOj2iw8TCS2BiS/LwDm0LlrF+9HqZthKIOVUtHVKx/gyMtnP1LKTuC/6n7dMJSd6
         UtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146926; x=1747751726;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=28KEA+cf7exzULPtaOdve61V0mLdHEa4yWh1byFce8Y=;
        b=c+Iwz96yB7AK/hNY5i6mxHpS3utWIhzT8rIP5wiXXme9pIN9XCCj32KSL9ANr3y5zg
         9ef7d6xLukXq8Nw6cxmR+OYvaTUfe957V32hbcDPHD1YFnB/LV2VE7cHmJyWMZ2uR97q
         +zE4lWDw5xcnDnEwTm9TzoMqnSX698JIu7r+hxjYcADCANJ2TjFEms6fGk6JHmJihXnm
         C9hHB7iVm6vbSnhsG6uiZaeetsk992AC+NhKJqBb1MggG/36AZm/5AaUy9Sg4MK5uIpp
         tn4D8nVtNTPJqJmcmtSTixftFwyfHJrZA6CXoKlDjz89rTfMIdyMly3AJuv7nsq7Odpc
         bWBQ==
X-Gm-Message-State: AOJu0YypAfZwvBaCWMPsY+T+xjy+7RB4SHXLkxIdj0iNMVY0jkMV+gNE
	6wtdQ2OfmrU+STyxpdpXlxEgbiOGHvnYxmtf7wCDf5KTf6Zbxrx+0d7LVbVRaBxZp2Hi+2kL400
	yoOu61A==
X-Gm-Gg: ASbGncu2RJYXeNEBisRSi7nbIwT2gRHd0BQ2es95peWwCdxt/rCzpbCe9u718kt0vAk
	WMh0ELqL2Bi784davmwDAQ1b9XwnblcGXUaM9zachT2BmYHoUBjX8xVFJh7EbtODbDCDZ8y8ara
	yG5pGC0OjFcXcTUqQleE3tvsl1CpguBpnustkAVaTTbnl2/5cm0Rowl0uUkbyLGFcGP7fP9wTfw
	fc7VH0P6oP4ceH+jasrn/GYpETQRU9wthzJQAS3RT3Bba/BVGtWwQ6/Qufdu2H5sSWr+GF08oKE
	2qBvFL+321v2vdph//q48KPG9QuQcDgRG8V61p9w5BiXWRamQ5s0FvQA03uo9UYCSjtP3CBWxMu
	GrU/nGfWDxAq4nl4R
X-Google-Smtp-Source: AGHT+IGjGaxb3ZPnyECShzGCSghtyGYFdfWofCholoJMn/DMDkmH2hwI57MfaiVucMPpyvK0jvNZ9w==
X-Received: by 2002:adf:ed92:0:b0:3a1:fcd4:eada with SMTP id ffacd0b85a97d-3a1fcd4ecdemr10094236f8f.4.1747146926088;
        Tue, 13 May 2025 07:35:26 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ed0a5sm16231692f8f.21.2025.05.13.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:35:25 -0700 (PDT)
Date: Tue, 13 May 2025 17:35:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zaid Alali <zaidal@os.amperecomputing.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: [rafael-pm:bleeding-edge 135/136] drivers/acpi/apei/einj-core.c:769
 einj_probe() warn: missing unwind goto?
Message-ID: <0899a8f6-5880-49dc-b699-e369719280e1@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   9148437b5790361af63c5ffb89112c380fda2472
commit: e54b1dc1c4f083cb66a70d8ccc866de47fc36d7a [135/136] ACPI: APEI: EINJ: Remove redundant calls to einj_get_available_error_type()
config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110745.UJtyemor-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505110745.UJtyemor-lkp@intel.com/

smatch warnings:
drivers/acpi/apei/einj-core.c:769 einj_probe() warn: missing unwind goto?

vim +769 drivers/acpi/apei/einj-core.c

6cb9441bfe8dd7f drivers/acpi/apei/einj-core.c Sudeep Holla       2025-03-17  744  static int __init einj_probe(struct faux_device *fdev)
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  745  {
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  746  	int rc;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  747  	acpi_status status;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  748  	struct apei_exec_context ctx;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  749  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  750  	status = acpi_get_table(ACPI_SIG_EINJ, 0,
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  751  				(struct acpi_table_header **)&einj_tab);
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  752  	if (status == AE_NOT_FOUND) {
5621fafaac0031e drivers/acpi/apei/einj.c      Ben Cheatham       2024-03-11  753  		pr_debug("EINJ table not found.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  754  		return -ENODEV;
37ea9693869627d drivers/acpi/apei/einj.c      Jay Lu             2022-12-06  755  	} else if (ACPI_FAILURE(status)) {
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  756  		pr_err("Failed to get EINJ table: %s\n",
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  757  				acpi_format_exception(status));
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  758  		return -EINVAL;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  759  	}
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  760  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  761  	rc = einj_check_table(einj_tab);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  762  	if (rc) {
d222678426faa5b drivers/acpi/apei/einj.c      Colin Ian King     2017-01-17  763  		pr_warn(FW_BUG "Invalid EINJ table.\n");
541156a38fd01d9 drivers/acpi/apei/einj.c      Hanjun Guo         2020-05-07  764  		goto err_put_table;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  765  	}
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  766  
e54b1dc1c4f083c drivers/acpi/apei/einj-core.c Zaid Alali         2025-05-06  767  	rc = einj_get_available_error_type(&available_error_type);
e54b1dc1c4f083c drivers/acpi/apei/einj-core.c Zaid Alali         2025-05-06  768  	if (rc)
e54b1dc1c4f083c drivers/acpi/apei/einj-core.c Zaid Alali         2025-05-06 @769  		return rc;

Should be "goto err_put_table;"

e54b1dc1c4f083c drivers/acpi/apei/einj-core.c Zaid Alali         2025-05-06  770  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  771  	rc = -ENOMEM;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  772  	einj_debug_dir = debugfs_create_dir("einj", apei_get_debugfs_dir());
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  773  
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  774  	debugfs_create_file("available_error_type", S_IRUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  775  			    NULL, &available_error_type_fops);
dcaed592b2fc9ca drivers/acpi/apei/einj.c      Rafael J. Wysocki  2019-03-04  776  	debugfs_create_file_unsafe("error_type", 0600, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  777  				   NULL, &error_type_fops);
dcaed592b2fc9ca drivers/acpi/apei/einj.c      Rafael J. Wysocki  2019-03-04  778  	debugfs_create_file_unsafe("error_inject", 0200, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  779  				   NULL, &error_inject_fops);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  780  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  781  	apei_resources_init(&einj_resources);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  782  	einj_exec_ctx_init(&ctx);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  783  	rc = apei_exec_collect_resources(&ctx, &einj_resources);
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  784  	if (rc) {
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  785  		pr_err("Error collecting EINJ resources.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  786  		goto err_fini;
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  787  	}
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  788  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  789  	rc = apei_resources_request(&einj_resources, "APEI EINJ");
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  790  	if (rc) {
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  791  		pr_err("Error requesting memory/port resources.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  792  		goto err_fini;
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  793  	}
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  794  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  795  	rc = apei_exec_pre_map_gars(&ctx);
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  796  	if (rc) {
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  797  		pr_err("Error pre-mapping GARs.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  798  		goto err_release;
dba648300e890fb drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  799  	}
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  800  
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  801  	einj_param = einj_get_parameter_address();
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  802  	if ((param_extension || acpi5) && einj_param) {
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  803  		debugfs_create_x32("flags", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  804  				   &error_flags);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  805  		debugfs_create_x64("param1", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  806  				   &error_param1);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  807  		debugfs_create_x64("param2", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  808  				   &error_param2);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  809  		debugfs_create_x64("param3", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  810  				   &error_param3);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  811  		debugfs_create_x64("param4", S_IRUSR | S_IWUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  812  				   &error_param4);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  813  		debugfs_create_x32("notrigger", S_IRUSR | S_IWUSR,
ee49089dc7d9fc7 drivers/acpi/apei/einj.c      Chen Gong          2012-03-15  814  				   einj_debug_dir, &notrigger);
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  815  	}
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  816  
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  817  	if (vendor_dev[0]) {
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  818  		vendor_blob.data = vendor_dev;
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  819  		vendor_blob.size = strlen(vendor_dev);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  820  		debugfs_create_blob("vendor", S_IRUSR, einj_debug_dir,
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  821  				    &vendor_blob);
9ec6dbfbdc0ade8 drivers/acpi/apei/einj.c      Greg Kroah-Hartman 2019-01-22  822  		debugfs_create_x32("vendor_flags", S_IRUSR | S_IWUSR,
c130bd6f82e5dda drivers/acpi/apei/einj.c      Tony Luck          2012-01-17  823  				   einj_debug_dir, &vendor_flags);
6e320ec1d98f9eb drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  824  	}
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  825  
22fca621bd1bbc5 drivers/acpi/apei/einj.c      Avadhut Naik       2023-11-16  826  	if (vendor_errors.size)
22fca621bd1bbc5 drivers/acpi/apei/einj.c      Avadhut Naik       2023-11-16  827  		debugfs_create_blob("oem_error", 0600, einj_debug_dir,
22fca621bd1bbc5 drivers/acpi/apei/einj.c      Avadhut Naik       2023-11-16  828  				    &vendor_errors);
22fca621bd1bbc5 drivers/acpi/apei/einj.c      Avadhut Naik       2023-11-16  829  
b2f740baa421525 drivers/acpi/apei/einj.c      Borislav Petkov    2016-05-23  830  	pr_info("Error INJection is initialized.\n");
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  831  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  832  	return 0;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  833  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  834  err_release:
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  835  	apei_resources_release(&einj_resources);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  836  err_fini:
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  837  	apei_resources_fini(&einj_resources);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  838  	debugfs_remove_recursive(einj_debug_dir);
541156a38fd01d9 drivers/acpi/apei/einj.c      Hanjun Guo         2020-05-07  839  err_put_table:
541156a38fd01d9 drivers/acpi/apei/einj.c      Hanjun Guo         2020-05-07  840  	acpi_put_table((struct acpi_table_header *)einj_tab);
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  841  
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  842  	return rc;
e40213450b53157 drivers/acpi/apei/einj.c      Ying Huang         2010-05-18  843  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

