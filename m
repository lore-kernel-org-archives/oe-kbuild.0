Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09445392;
	Wed, 22 Feb 2023 13:53:59 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id bg37-20020a05600c3ca500b003e21e018039so7171644wmb.3;
        Wed, 22 Feb 2023 05:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9RB48KEAWbHAtCefbOrjQ1m5aljxgCXAYZywn/lFIM=;
        b=PLzHbO3h35jRkYwW/EHAj6BMoqKxrRxiKjxgsIMU5mA11YKLrUby39FipTzQ4DS+3H
         N5GVR8SnZiVGDOoTVloKjz50DVUWDkk4bmbyUo40YkMeltzeES1avuhX/UYHX3x5wB1J
         bcYcnFNuGGWg8znml5BY8FUDUO05elTRjAH1DbS33xWGfAO9xfo8aW0zpBJelO1gx/CO
         N17+WRcCjrRRE5oNBhETja0IhWgk+6frsPHfUbAaYVHAvQ1XKfFvbTfNAyuYWintAPYy
         c+fFDOYCx9RSGGHpT2ebOgrJ30/88nJBetJQ27fT8tfi1V7bsw0OphCYY2Rw3fAuCA0+
         or2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p9RB48KEAWbHAtCefbOrjQ1m5aljxgCXAYZywn/lFIM=;
        b=Y+zN7Brwwi95a3yvkOUojnVkgxtoaEA0lPntdx3WLPc2Qz0e7Y9UoLxSeviwydyYtc
         +gwyaGbNLGFYHMvrrH291tNd/6F07SmNzKG4ybkL6yeggGhdslfQL45FdF5IX4sdIEGx
         672R5NwivcSXTTV3XN1EFQDAu6rIShFLQv1DYpheRmRhHQrMm0d95fCWAGi9tJ4CtPPg
         zFQplSDHPfvdlB9S7oqA4bmMZBMfMo3bjsz2ok9GieSQOXtSj8jv3OCsvX6kdJEXyYB1
         /cbCjdtEroRCTUqCDZBavuiM0BgzTA0HA8yZMoMpRLFNKduqC6QWSxMtjaTGB7Hn8BDO
         cwZA==
X-Gm-Message-State: AO0yUKWLy2jVuSNa2k4kzv9nIHJgCNnEJBALtGSEwKwcTF44kAj2U0eK
	2prdwxzkO4HuqqJjFCOx1oRsmNUyX9E=
X-Google-Smtp-Source: AK7set9ccwdpRMP992urQgI3oh4x7bVKRvDfDvwGPDIhpMjVMdHkHgjKnsb8bsjTR2L2/tevLzN9KQ==
X-Received: by 2002:a05:600c:2ed3:b0:3e0:b1:c118 with SMTP id q19-20020a05600c2ed300b003e000b1c118mr6780291wmn.5.1677074037530;
        Wed, 22 Feb 2023 05:53:57 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c444900b003e21f01c426sm7853653wmn.9.2023.02.22.05.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 05:53:56 -0800 (PST)
Date: Wed, 22 Feb 2023 16:53:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Besar Wicaksono <bwicaksono@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: drivers/perf/arm_cspmu/arm_cspmu.c:1075
 arm_cspmu_find_cpu_container() warn: variable dereferenced before check
 'cpu_dev' (see line 1073)
Message-ID: <202302191227.kc0V8fM7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230222135353.-HVUOBh2l6xDRYslHJ-i6zsI417w_bgIQCv9QIhDFw8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   925cf0457d7e62ce08878ffb789189ac08ca8677
commit: e37dfd65731dc4f001fa7dfa7f705e6840017d5a perf: arm_cspmu: Add support for ARM CoreSight PMU driver
config: arm64-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191227.kc0V8fM7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302191227.kc0V8fM7-lkp@intel.com/

smatch warnings:
drivers/perf/arm_cspmu/arm_cspmu.c:1075 arm_cspmu_find_cpu_container() warn: variable dereferenced before check 'cpu_dev' (see line 1073)

vim +/cpu_dev +1075 drivers/perf/arm_cspmu/arm_cspmu.c

e37dfd65731dc4 Besar Wicaksono 2022-11-11  1069  static inline int arm_cspmu_find_cpu_container(int cpu, u32 container_uid)
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1070  {
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1071  	u32 acpi_uid;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1072  	struct device *cpu_dev = get_cpu_device(cpu);
e37dfd65731dc4 Besar Wicaksono 2022-11-11 @1073  	struct acpi_device *acpi_dev = ACPI_COMPANION(cpu_dev);
                                                                                                      ^^^^^^^
Dereference

e37dfd65731dc4 Besar Wicaksono 2022-11-11  1074  
e37dfd65731dc4 Besar Wicaksono 2022-11-11 @1075  	if (!cpu_dev)
                                                             ^^^^^^^
Checked too late.

e37dfd65731dc4 Besar Wicaksono 2022-11-11  1076  		return -ENODEV;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1077  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1078  	while (acpi_dev) {
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1079  		if (!strcmp(acpi_device_hid(acpi_dev),
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1080  			    ACPI_PROCESSOR_CONTAINER_HID) &&
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1081  		    !kstrtouint(acpi_device_uid(acpi_dev), 0, &acpi_uid) &&
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1082  		    acpi_uid == container_uid)
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1083  			return 0;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1084  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1085  		acpi_dev = acpi_dev_parent(acpi_dev);
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1086  	}
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1087  
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1088  	return -ENODEV;
e37dfd65731dc4 Besar Wicaksono 2022-11-11  1089  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

