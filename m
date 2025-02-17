Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A6A1BC2A
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739801743; cv=none; b=hcw7FJt2r/fikJ6AwlRuDxx2FS+nlq8OA7O0rlDmx/YnnG05oVQTVMA+b3YkpAYqyx87DxgBBt+OUfLl4eWqaWddwH28CWjyysJp4N0F+8nPif+a0NVvTFYf585S35h+MUIEsx+yZwXVPnjG0QNyLAI1Jl5PfhKXggoHRaZvNVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739801743; c=relaxed/simple;
	bh=bwjmDGB8XFI8TGJb4x7hmjlEqNbrIc+NwoqzxEa4G6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hamYu0oJMiAB1UL+/HVThrtfKbgDDkYMweetWDWoLiiBxBnajbDcgmzNEosT4aFPLB49yDdanv8vhK0VzCCuVVQX/HJDc67d8zaS6rbKAPPnRRvueYMIHt5E/927quufu0mOV72iF0PClvcqf0vJ4+z3KUeRhzsXuzSwGIeLX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jUnha83U; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jUnha83U"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so5924226a12.3
        for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739801739; x=1740406539; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWzBZyNJiJHmGiheSMSl46GL1i2p2h1RXygG7spiX6o=;
        b=jUnha83UZS6gon1hca1BRYg4OmcjbMW54/PF5n3YOPbyX+F6Wn7Qyq1BBP6RN4V33G
         kLReOhn7Q+d3exBXW7+hwOzMt1lggqkZU2Q/jskgrZ2FsATdghywO0pLi7Q4DToQhylJ
         XQXNW5wXEEkDFvOhr935yKquIW/ghRWPSBNUMpgqXYS8FVpyvrMviUd/e8Xf4zNeVnHb
         Dv1CbcZd8Xtr8Ld+/jyJCqXyDmsDl0hRUz4q6HgODlh1Zzrme/hdPuutf+gnNV+Yic/6
         WSXF+XMEQ75kcCUcf28ivjHs7gf1R4GMseQGIpQ32GXTh95EtqVdg512nSBxIja/byZR
         0TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739801739; x=1740406539;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWzBZyNJiJHmGiheSMSl46GL1i2p2h1RXygG7spiX6o=;
        b=hkU0/83Hjn2Gn5tYHcPjgzaMZQLZA4H1KlJ2Bbi3hhrysqtIxgzYpunMhOZH4lCNLi
         DJ0kemVXBYy5ZmJMkoFTEyD5SnnWf72qyY1ZyYUYA+WuyDd5sOSDDetpnO+A9Awk8CcK
         xN1gJUvOhkVIhiFQi6P7x/pgcvRH8UMSs17ounWadtUX2nY7CApjn0mGd/ep0VZVMHds
         YP43KeujPjHz6n5LHxH877HcWT/z9Qh38mKRzqt0sOebTkqRjyWHPR5h8LIf3X33oexU
         q8+WYMbgvBxifNPUIvu90UgW59rjggmCCYmRtw0zBVC8dcdAMdB4f8rSabIiAGJ+jG61
         b6mw==
X-Gm-Message-State: AOJu0YzTLq58xkPEUtql3iN1MQwBdicPHdlKMh3cL7VMpWW/5jDuNvJF
	Kv8nRXNJvQ/mTt68xHoJEzq/MOIUmZMmsZGlAj7QcnOPxTswivWp1cXmMzS0wL/9JHpO5uxP1Ug
	m
X-Gm-Gg: ASbGncswN621z9sgAemZBZ/n1KrUwvduDyMWDLro1dauUIoxXLFSiEvGyIbgly/elqe
	A/z469nuwI4lAsFmGU8TFAo0sswlRlm/OM3JA3oDbtckEambBpV/Ty80EYFX0x+QP5pQ+tndwOr
	NKMtqKP+eCMo9rGuKDBsnKoaxI1yVXk3aJSwF1773nc85hZvKgZdFBdEirCsbNDlKNvgLRi1m79
	XVTWif+Ep/hU1+cgMv1KLnw8btLc44/twRf4iZPydZHF65waqB09QANTmoUenqd/wSfV/XbDzbl
	xeHe3vHCrejfjxaTFofp
X-Google-Smtp-Source: AGHT+IFZTvjf9R1KCX6YX9qPyh5ILqbe5k0wWPesNp8yhBMKX6ps+H3SBfKReATGxt9IYirTvBUTZw==
X-Received: by 2002:a05:6402:26ca:b0:5de:3c29:e834 with SMTP id 4fb4d7f45d1cf-5e0361f5a47mr9765962a12.27.1739801739413;
        Mon, 17 Feb 2025 06:15:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece287c54sm7183264a12.69.2025.02.17.06.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:15:39 -0800 (PST)
Date: Mon, 17 Feb 2025 17:15:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_unaligned_test_skip_v1 53/77]
 arch/riscv/kernel/hw_breakpoint.c:53 arch_smp_setup_sbi_shmem() warn:
 unsigned '_x' is never less than zero.
Message-ID: <d2a329c6-9534-4da7-bdfc-d323a83cab91@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_unaligned_test_skip_v1
head:   172aa65b307ae6ac3855f77b6f28d48bfd9c36e5
commit: d3661e2503082cb4cd407a8a4b85287f9bdc2851 [53/77] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250217/202502172257.1bTZKubK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502172257.1bTZKubK-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/hw_breakpoint.c:94 arch_smp_setup_sbi_shmem() error: uninitialized symbol 'rc'.

vim +/_x +53 arch/riscv/kernel/hw_breakpoint.c

d3661e2503082cb Himanshu Chauhan 2024-02-22  40  static int arch_smp_setup_sbi_shmem(unsigned int cpu)
d3661e2503082cb Himanshu Chauhan 2024-02-22  41  {
d3661e2503082cb Himanshu Chauhan 2024-02-22  42  	struct sbi_dbtr_shmem_entry *dbtr_shmem;
d3661e2503082cb Himanshu Chauhan 2024-02-22  43  	unsigned long shmem_pa;
d3661e2503082cb Himanshu Chauhan 2024-02-22  44  	struct sbiret ret;
d3661e2503082cb Himanshu Chauhan 2024-02-22  45  	int rc;
d3661e2503082cb Himanshu Chauhan 2024-02-22  46  
d3661e2503082cb Himanshu Chauhan 2024-02-22  47  	dbtr_shmem = per_cpu_ptr(sbi_dbtr_shmem, cpu);
d3661e2503082cb Himanshu Chauhan 2024-02-22  48  	if (!dbtr_shmem) {
d3661e2503082cb Himanshu Chauhan 2024-02-22  49  		pr_err("Invalid per-cpu shared memory for debug triggers\n");
d3661e2503082cb Himanshu Chauhan 2024-02-22  50  		return -ENODEV;
d3661e2503082cb Himanshu Chauhan 2024-02-22  51  	}
d3661e2503082cb Himanshu Chauhan 2024-02-22  52  
d3661e2503082cb Himanshu Chauhan 2024-02-22 @53  	shmem_pa = __pa(dbtr_shmem);
d3661e2503082cb Himanshu Chauhan 2024-02-22  54  
d3661e2503082cb Himanshu Chauhan 2024-02-22  55  	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
d3661e2503082cb Himanshu Chauhan 2024-02-22  56  			MEM_LO(shmem_pa), MEM_HI(shmem_pa), 0, 0, 0, 0);
d3661e2503082cb Himanshu Chauhan 2024-02-22  57  
d3661e2503082cb Himanshu Chauhan 2024-02-22  58  	if (ret.error) {

ret is uninitialized in the case where sbi_ecall() doesn't return an
error.

d3661e2503082cb Himanshu Chauhan 2024-02-22  59  		switch(ret.error) {
d3661e2503082cb Himanshu Chauhan 2024-02-22  60  		case SBI_ERR_DENIED:
d3661e2503082cb Himanshu Chauhan 2024-02-22  61  			pr_warn("%s: Access denied for shared memory at %lx\n",
d3661e2503082cb Himanshu Chauhan 2024-02-22  62  				__func__, shmem_pa);
d3661e2503082cb Himanshu Chauhan 2024-02-22  63  			rc = -EPERM;
d3661e2503082cb Himanshu Chauhan 2024-02-22  64  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  65  
d3661e2503082cb Himanshu Chauhan 2024-02-22  66  		case SBI_ERR_INVALID_PARAM:
d3661e2503082cb Himanshu Chauhan 2024-02-22  67  		case SBI_ERR_INVALID_ADDRESS:
d3661e2503082cb Himanshu Chauhan 2024-02-22  68  			pr_warn("%s: Invalid address parameter (%lu)\n",
d3661e2503082cb Himanshu Chauhan 2024-02-22  69  				__func__, ret.error);
d3661e2503082cb Himanshu Chauhan 2024-02-22  70  			rc = -EINVAL;
d3661e2503082cb Himanshu Chauhan 2024-02-22  71  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  72  
d3661e2503082cb Himanshu Chauhan 2024-02-22  73  		case SBI_ERR_ALREADY_AVAILABLE:
d3661e2503082cb Himanshu Chauhan 2024-02-22  74  			pr_warn("%s: Shared memory is already set\n",
d3661e2503082cb Himanshu Chauhan 2024-02-22  75  				__func__);
d3661e2503082cb Himanshu Chauhan 2024-02-22  76  			rc = -EADDRINUSE;
d3661e2503082cb Himanshu Chauhan 2024-02-22  77  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  78  
d3661e2503082cb Himanshu Chauhan 2024-02-22  79  		case SBI_ERR_FAILURE:
d3661e2503082cb Himanshu Chauhan 2024-02-22  80  			pr_err("%s: Internal sdtrig state error\n",
d3661e2503082cb Himanshu Chauhan 2024-02-22  81  			       __func__);
d3661e2503082cb Himanshu Chauhan 2024-02-22  82  			rc = -ENXIO;
d3661e2503082cb Himanshu Chauhan 2024-02-22  83  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  84  
d3661e2503082cb Himanshu Chauhan 2024-02-22  85  		default:
d3661e2503082cb Himanshu Chauhan 2024-02-22  86  			pr_warn("%s: Unknown error %lu\n", __func__, ret.error);
d3661e2503082cb Himanshu Chauhan 2024-02-22  87  			rc = -ENXIO;
d3661e2503082cb Himanshu Chauhan 2024-02-22  88  			break;
d3661e2503082cb Himanshu Chauhan 2024-02-22  89  		}
d3661e2503082cb Himanshu Chauhan 2024-02-22  90  	}
d3661e2503082cb Himanshu Chauhan 2024-02-22  91  
d3661e2503082cb Himanshu Chauhan 2024-02-22  92  	pr_warn("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
d3661e2503082cb Himanshu Chauhan 2024-02-22  93  
d3661e2503082cb Himanshu Chauhan 2024-02-22 @94  	return rc;
d3661e2503082cb Himanshu Chauhan 2024-02-22  95  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

