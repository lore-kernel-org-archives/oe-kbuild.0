Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769B4436;
	Tue, 11 Apr 2023 08:56:07 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id gw11-20020a05600c850b00b003f07d305b32so4935400wmb.4;
        Tue, 11 Apr 2023 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681203365; x=1683795365;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2c6KSjMyOQtE3ZA0DlkwuZyqApj46xlAPVqYsupQKg=;
        b=E7M9iWH31eeBfaKD7RNWNzG/s+ovShwELcJ9ZHEG8gQ+oKBnUQUfb0bfLiFbdpaoeF
         7iRxSRXfLjj7Ps3gSc3Zy/S6N6fB4Lv5tKzRte3jHgAJpG9vQDgILqLk20Ijme2bxvdy
         F2Mjn4dQma0stMDF57PjujotjodnitmMsbYwkokYdmMNZD8o/CXLfa20P/yyTrQOa+pA
         YeZV3qBoW+ZqjptRF7tQkSfpYnlv9Mt+qXq215O8DpBGuDMV0LNMSt8sFFycqFhSzesk
         2EWBLuODAMCwc6aTctbOZYviaDTCYDF3I8Pgbzr9Vv7a6sRAenpZfyINzlNj6+skvtcZ
         DwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681203365; x=1683795365;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2c6KSjMyOQtE3ZA0DlkwuZyqApj46xlAPVqYsupQKg=;
        b=xryx9RKj+HQ00AYQleLaOXNavpVDu7/MoRzocOEDffMUs7jecdFQ0RWsKaXu7ilKqG
         Zad7fmmCQr9rwV+Mc8+uv2j7y1Tsvcrpyg+Sa/b26cVkMWop4k4vNgSY7qM67SBrVSqs
         7CwYj2tM/TrOKQ/VxtvsyBIuRrGc5HS8NWNEH4g7ttlWvb5RJFqhnI8Qv/skV9ckLX46
         nnEMxF9i1ctWn8+47D4stsAo2y2lawCDhmXifVK2n69f6zwfR45LDF9UrWUzslK/AWzb
         Uz+qL+oxTKbrW1w2MsfXy4TfB/Od19wm2Ac5iXhvZNZ9xlNxRZEarknG4chclO0++9e0
         06Ig==
X-Gm-Message-State: AAQBX9e4Eui8zGgK01zmu3PY2Jh4CiVnDPvb5bB94nB6f/19qIOoKUX2
	KklkwD7VFkE/gmyz3xe5doMztfDApdY=
X-Google-Smtp-Source: AKy350YLkmUhmfRi7UtVqBSd48aHEVZWLVUp+Ba4iTnaVnWZ7GykVuhJr78C0jBvJkjJz7bcNEA8pg==
X-Received: by 2002:a1c:4c12:0:b0:3f0:4f83:22f4 with SMTP id z18-20020a1c4c12000000b003f04f8322f4mr5944906wmf.20.1681203363626;
        Tue, 11 Apr 2023 01:56:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q8-20020a1ce908000000b003ed2276cd0dsm16272183wmc.38.2023.04.11.01.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 01:56:03 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:56:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:testing 65/65]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2639
 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'
Message-ID: <79e02451-d658-4941-bd6e-2fe0d2a787ff@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   4c3b188facb2011e9edcdaaf71f2f553e9c230df
commit: 4c3b188facb2011e9edcdaaf71f2f553e9c230df [65/65] iio: imu: lsm6dsx: Add ACPI mount matrix retrieval
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230411/202304111602.SD5o4kh1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304111602.SD5o4kh1-lkp@intel.com/

New smatch warnings:
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2639 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'

Old smatch warnings:
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2642 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2647 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2680 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'

vim +2639 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c

4c3b188facb201 Jonathan Cameron 2023-01-30  2628  static bool lsm6dsx_get_acpi_mount_matrix(struct device *dev,
                                                         ^^^^

4c3b188facb201 Jonathan Cameron 2023-01-30  2629  					  struct iio_mount_matrix *orientation)
4c3b188facb201 Jonathan Cameron 2023-01-30  2630  {
4c3b188facb201 Jonathan Cameron 2023-01-30  2631  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
4c3b188facb201 Jonathan Cameron 2023-01-30  2632  	struct acpi_device *adev = ACPI_COMPANION(dev);
4c3b188facb201 Jonathan Cameron 2023-01-30  2633  	union acpi_object *obj, *elements;
4c3b188facb201 Jonathan Cameron 2023-01-30  2634  	acpi_status status;
4c3b188facb201 Jonathan Cameron 2023-01-30  2635  	int i, j, val[3];
4c3b188facb201 Jonathan Cameron 2023-01-30  2636  	char *str;
4c3b188facb201 Jonathan Cameron 2023-01-30  2637  
4c3b188facb201 Jonathan Cameron 2023-01-30  2638  	if (!has_acpi_companion(dev))
4c3b188facb201 Jonathan Cameron 2023-01-30 @2639  		return -EINVAL;

return true/false?

4c3b188facb201 Jonathan Cameron 2023-01-30  2640  
4c3b188facb201 Jonathan Cameron 2023-01-30  2641  	if (!acpi_has_method(adev->handle, "ROTM"))
4c3b188facb201 Jonathan Cameron 2023-01-30  2642  		return -EINVAL;
4c3b188facb201 Jonathan Cameron 2023-01-30  2643  
4c3b188facb201 Jonathan Cameron 2023-01-30  2644  	status = acpi_evaluate_object(adev->handle, "ROTM", NULL, &buffer);
4c3b188facb201 Jonathan Cameron 2023-01-30  2645  	if (ACPI_FAILURE(status)) {
4c3b188facb201 Jonathan Cameron 2023-01-30  2646  		dev_warn(dev, "Failed to get ACPI mount matrix: %d\n", status);
4c3b188facb201 Jonathan Cameron 2023-01-30  2647  		return -EINVAL;
4c3b188facb201 Jonathan Cameron 2023-01-30  2648  	}
4c3b188facb201 Jonathan Cameron 2023-01-30  2649  
4c3b188facb201 Jonathan Cameron 2023-01-30  2650  	obj = buffer.pointer;
4c3b188facb201 Jonathan Cameron 2023-01-30  2651  	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count != 3)
4c3b188facb201 Jonathan Cameron 2023-01-30  2652  		goto unknown_format;
4c3b188facb201 Jonathan Cameron 2023-01-30  2653  
4c3b188facb201 Jonathan Cameron 2023-01-30  2654  	elements = obj->package.elements;
4c3b188facb201 Jonathan Cameron 2023-01-30  2655  	for (i = 0; i < 3; i++) {
4c3b188facb201 Jonathan Cameron 2023-01-30  2656  		if (elements[i].type != ACPI_TYPE_STRING)
4c3b188facb201 Jonathan Cameron 2023-01-30  2657  			goto unknown_format;
4c3b188facb201 Jonathan Cameron 2023-01-30  2658  
4c3b188facb201 Jonathan Cameron 2023-01-30  2659  		str = elements[i].string.pointer;
4c3b188facb201 Jonathan Cameron 2023-01-30  2660  		if (sscanf(str, "%d %d %d", &val[0], &val[1], &val[2]) != 3)
4c3b188facb201 Jonathan Cameron 2023-01-30  2661  			goto unknown_format;
4c3b188facb201 Jonathan Cameron 2023-01-30  2662  
4c3b188facb201 Jonathan Cameron 2023-01-30  2663  		for (j = 0; j < 3; j++) {
4c3b188facb201 Jonathan Cameron 2023-01-30  2664  			switch (val[j]) {
4c3b188facb201 Jonathan Cameron 2023-01-30  2665  			case -1: str = "-1"; break;
4c3b188facb201 Jonathan Cameron 2023-01-30  2666  			case 0:  str = "0";  break;
4c3b188facb201 Jonathan Cameron 2023-01-30  2667  			case 1:  str = "1";  break;
4c3b188facb201 Jonathan Cameron 2023-01-30  2668  			default: goto unknown_format;
4c3b188facb201 Jonathan Cameron 2023-01-30  2669  			}
4c3b188facb201 Jonathan Cameron 2023-01-30  2670  			orientation->rotation[i * 3 + j] = str;
4c3b188facb201 Jonathan Cameron 2023-01-30  2671  		}
4c3b188facb201 Jonathan Cameron 2023-01-30  2672  	}
4c3b188facb201 Jonathan Cameron 2023-01-30  2673  
4c3b188facb201 Jonathan Cameron 2023-01-30  2674  	kfree(buffer.pointer);
4c3b188facb201 Jonathan Cameron 2023-01-30  2675  	return 0;
4c3b188facb201 Jonathan Cameron 2023-01-30  2676  
4c3b188facb201 Jonathan Cameron 2023-01-30  2677  unknown_format:
4c3b188facb201 Jonathan Cameron 2023-01-30  2678  	dev_warn(dev, "Unknown ACPI mount matrix format, ignoring\n");
4c3b188facb201 Jonathan Cameron 2023-01-30  2679  	kfree(buffer.pointer);
4c3b188facb201 Jonathan Cameron 2023-01-30  2680  	return -EINVAL;
4c3b188facb201 Jonathan Cameron 2023-01-30  2681  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

