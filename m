Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9199448;
	Wed,  8 Feb 2023 07:51:56 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z11so1830584wrl.8;
        Tue, 07 Feb 2023 23:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0e6ruE4RTlHQXWvAP7bt2ACZoAnr2C1OVEjxjInG1eo=;
        b=B4lQxGL8xQVcXETK6Jyt7fLO74Q1D9L25Cflw3T2oNnucEnmQRqbw2PWzsnswsD3en
         xotL7zWW2tyMc+ZAjIjwBBNljYzLUhdVrQXQDU+GM+LIWBhdnLLeLGgcDbLvquuvuedO
         6kknMtaaWXB0XGt33rLxYQZW9xsJ6NBmotzGPciBbG5pQe0qApw09iOAQsOM3uZR5u4S
         UaYOEJxFrCyFXn2lvbTravVRknfXTIps95MNFayAkQYdIVH6ggaSmvzzTFdQJ4qGg/k8
         k41fHlqS0UIJqjwLrGt13tPONytaoYRjUPqQfSAJ8HEr6BB6csDxH7tNVU8NSz/f3+c/
         4jAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e6ruE4RTlHQXWvAP7bt2ACZoAnr2C1OVEjxjInG1eo=;
        b=2OalXldIU6hEweKI3DTxpy+/BNSqaR6HR5L0EuSI+uoBEu9i4x9IwnOZKRhNA6rvlg
         fe4vzKBqdnvoYfoTO4L8U84HotPh71C0QVQyfO04xMYYlRaWQr7TlShMTXJ3l1P4qM6n
         HibWbtafO6qqPJaHQsSAluLejlsIdZMN+UlwA+mW0mFvX1m4XW6h8lg4ksToL5dIIzJs
         49Es4VHjD36d1NWmm5a86A1mfLeptNMRR5lGqaC1eNE7hkniXb6vWox7PRkCoj+YdJYQ
         bP7Kt/+qOwhkjZeE6x2/rstWATiKMWRYmR8SJcUZPjkgb2HHoOdxqI8NkfX7r4IH/SHB
         idWA==
X-Gm-Message-State: AO0yUKW/8LQElG104W/OjfyHN6VkidF4Az17sJETUpfa1setNADoaCLd
	7456iHu5cPzyQr4TrXgW/4Vzq9wTdnmNtg==
X-Google-Smtp-Source: AK7set/e2GqQVZFGe+9n1t+QRaStT/RQQCQ2JiQF3VqBYH6wwwIVGsIhW4eCvuI/Y8iYXgizJnkHJA==
X-Received: by 2002:adf:ce11:0:b0:2c0:227d:ca35 with SMTP id p17-20020adfce11000000b002c0227dca35mr5954640wrn.54.1675842714136;
        Tue, 07 Feb 2023 23:51:54 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c2ca400b003dc51c48f0bsm1109608wmc.19.2023.02.07.23.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:51:53 -0800 (PST)
From: kernel test robot <error27@gmail.com>
X-Google-Original-From: kernel test robot <lkp@intel.com>
Date: Wed, 8 Feb 2023 10:51:49 +0300
To: oe-kbuild@lists.linux.dev, Alexander Gordeev <agordeev@linux.ibm.com>
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: [linux-next:master 8476/11179] arch/s390/include/asm/mem_detect.h:86
 get_mem_detect_end() error: uninitialized symbol 'end'.
Message-ID: <Y+NUlQfrSFqr9PlY@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   38d2b86a665b5e86371a1a30228bce259aa6c101
commit: cbc29f107e51b1cc7d1e7b0bbe0691a1224205f1 [8476/11179] s390/mem_detect: do not update output parameters on failure
config: s390-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230208/202302081457.Ecw3bLE8-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
arch/s390/include/asm/mem_detect.h:86 get_mem_detect_end() error: uninitialized symbol 'end'.
arch/s390/include/asm/mem_detect.h:86 get_mem_detect_end() error: uninitialized symbol 'end'.
arch/s390/boot/vmem.c:256 setup_vmem() error: uninitialized symbol 'start'.
arch/s390/boot/vmem.c:258 setup_vmem() error: uninitialized symbol 'end'.

vim +/end +86 arch/s390/include/asm/mem_detect.h

9b692102d87d13 Vasily Gorbik 2019-08-19  79  static inline unsigned long get_mem_detect_end(void)
9b692102d87d13 Vasily Gorbik 2019-08-19  80  {
9b692102d87d13 Vasily Gorbik 2019-08-19  81  	unsigned long start;
9b692102d87d13 Vasily Gorbik 2019-08-19  82  	unsigned long end;
9b692102d87d13 Vasily Gorbik 2019-08-19  83  
9b692102d87d13 Vasily Gorbik 2019-08-19  84  	if (mem_detect.count) {
9b692102d87d13 Vasily Gorbik 2019-08-19  85  		__get_mem_detect_block(mem_detect.count - 1, &start, &end);
9b692102d87d13 Vasily Gorbik 2019-08-19 @86  		return end;

__get_mem_detect_block() has an error path which doesn't initialize
*end.  I could add __get_mem_detect_block() to the
smatch_data/kernel.ignore_uninitialized_param file to silence this
warning.  But I suspect it causes a build error when you build this
with Clang.

Also I kind of wish we could enable GCC's checking for uninitialized
variables.

Btw, a lot of people are using the CONFIG_ option to automatically
initialize stack variables to zero.  Linus has commented that he wants
that to be the default setting.  So setting "end = 0" at the start
probably has no impact on runtime.

9b692102d87d13 Vasily Gorbik 2019-08-19  87  	}
9b692102d87d13 Vasily Gorbik 2019-08-19  88  	return 0;
9b692102d87d13 Vasily Gorbik 2019-08-19  89  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
