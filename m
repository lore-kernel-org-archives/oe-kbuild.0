Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F579DA;
	Wed,  8 Mar 2023 16:21:54 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e13so15910751wro.10;
        Wed, 08 Mar 2023 08:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678292512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qtqhlcTip4nFArnyI5p0mIfQuDm8rOeCs2YHPjXpp9g=;
        b=VNlZkOLOu3JGuIRZdYQamdi4edKIfslBo4yeXavSkshJ6b47HMduxiXfUd+kcvMSeT
         7Z0dcpzGREM7mVBpdOy3Go1kEJal71SeXfNDv3ph6jAnhvw+IcTRNEYP4TGh5ZIseKIt
         j0YegxgtJHlU8MJHzXYEBUygDAxc/R3s41nNvM1Sn1y0eTI6veWdluK3EnPGnX16z+gt
         uVSYyvCGpmlE/Kl18J8IbhucF6onvgr++FqrWYQIEiEdsRuHnQweMgHQC/HYUaJM8ne9
         RGgRDMGXMqArH76F0DwLZSP1kXL0p8dxo9ohXIMdYiL6Y58Fb4qcWdL4gSHkERtdn0z2
         gEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678292512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qtqhlcTip4nFArnyI5p0mIfQuDm8rOeCs2YHPjXpp9g=;
        b=e5oeiXYW3j0qmsZy1H0MIrDHFN20UYuLO3T2sNiy4PGezn7SY0hJVR7SUXOZG4I5kE
         EFrUydlGcK8Ke1ti+W4hw2ViVUuZMPL3hMcCQCgSx8RyS58ER2Dgihw6PFqlozb9jG4n
         BGoXDj/6GWP9imqWP9zYuO2yWI1JwY9TyFV8UhPJDdKhRL+5xuYFga1aQz/i+r+hs4u7
         lTRT+3i57eGsHtmCQ9UGTNXsU5Zb5Yv+aGo+VGUz/rxZb+lz6TTaqn3z7HSKpiv8YLCF
         33gBzb9uZ0Ah9IgK4DTY5cmJIj43FE3ZgVNpMY+uO9+dEW77gSJftQvbuXBfhCb5I41H
         LygQ==
X-Gm-Message-State: AO0yUKVIn8ghQ8f9kaPsodv8LbJEJR9GVdMFi+AeO10/afhigJVVMz8q
	FNNp0McZkw0eawNb+wBK8/xGMFXTzI6lhuXT
X-Google-Smtp-Source: AK7set+8qCRqc/Xs79kOozGrr2hu1xISixrRteJ2eeQAtMy9vygl9fRtcE4YwURwSAUeC4INhanSqg==
X-Received: by 2002:a05:6000:4a:b0:2c7:faf:af32 with SMTP id k10-20020a056000004a00b002c70fafaf32mr11531898wrx.14.1678292512396;
        Wed, 08 Mar 2023 08:21:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z4-20020adfd0c4000000b002c5493a17efsm15497536wrh.25.2023.03.08.08.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 08:21:51 -0800 (PST)
Date: Wed, 8 Mar 2023 19:21:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Evgeniy Baskov <baskov@ispras.ru>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:efi-x86-nx 10/24] drivers/firmware/efi/libstub/mem.c:170
 efi_adjust_memory_range_protection() error: uninitialized symbol
 'rounded_start'.
Message-ID: <8e0bd257-dad0-47e2-8e30-916f9042c77d@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-nx
head:   8171142f3e4c96f6be75a6195de59d1607f1bd4b
commit: 6b4ae58e7147165ec019e3899a5d4d14e0396110 [10/24] efi/libstub: Move helper function to related file
config: loongarch-randconfig-m041-20230305 (https://download.01.org/0day-ci/archive/20230309/202303090050.RhPPJRPD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303090050.RhPPJRPD-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/libstub/mem.c:170 efi_adjust_memory_range_protection() error: uninitialized symbol 'rounded_start'.
drivers/firmware/efi/libstub/mem.c:170 efi_adjust_memory_range_protection() error: uninitialized symbol 'rounded_end'.

vim +/rounded_start +170 drivers/firmware/efi/libstub/mem.c

6b4ae58e714716 Evgeniy Baskov 2022-10-25  143  efi_status_t efi_adjust_memory_range_protection(unsigned long start,
6b4ae58e714716 Evgeniy Baskov 2022-10-25  144  						unsigned long size,
6b4ae58e714716 Evgeniy Baskov 2022-10-25  145  						unsigned long attributes)
6b4ae58e714716 Evgeniy Baskov 2022-10-25  146  {
6b4ae58e714716 Evgeniy Baskov 2022-10-25  147  	efi_status_t status;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  148  	efi_gcd_memory_space_desc_t desc;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  149  	efi_physical_addr_t end, next;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  150  	efi_physical_addr_t rounded_start, rounded_end;
                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^

6b4ae58e714716 Evgeniy Baskov 2022-10-25  151  	efi_physical_addr_t unprotect_start, unprotect_size;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  152  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  153  	if (efi_dxe_table == NULL)
6b4ae58e714716 Evgeniy Baskov 2022-10-25  154  		return EFI_UNSUPPORTED;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  155  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  156  	/*
6b4ae58e714716 Evgeniy Baskov 2022-10-25  157  	 * This function should not be used to modify attributes
6b4ae58e714716 Evgeniy Baskov 2022-10-25  158  	 * other than writable/executable.
6b4ae58e714716 Evgeniy Baskov 2022-10-25  159  	 */
6b4ae58e714716 Evgeniy Baskov 2022-10-25  160  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  161  	if ((attributes & ~(EFI_MEMORY_RO | EFI_MEMORY_XP)) != 0)
6b4ae58e714716 Evgeniy Baskov 2022-10-25  162  		return EFI_INVALID_PARAMETER;
6b4ae58e714716 Evgeniy Baskov 2022-10-25  163  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  164  	/*
6b4ae58e714716 Evgeniy Baskov 2022-10-25  165  	 * Disallow simultaniously executable and writable memory
6b4ae58e714716 Evgeniy Baskov 2022-10-25  166  	 * to inforce W^X policy if direct extraction code is enabled.
6b4ae58e714716 Evgeniy Baskov 2022-10-25  167  	 */
6b4ae58e714716 Evgeniy Baskov 2022-10-25  168  
6b4ae58e714716 Evgeniy Baskov 2022-10-25  169  	if ((attributes & (EFI_MEMORY_RO | EFI_MEMORY_XP)) == 0) {
6b4ae58e714716 Evgeniy Baskov 2022-10-25 @170  		efi_warn("W^X violation at [%08lx,%08lx]\n",

Presumably this prints rounded_start and rounded_end.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

