Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887F03C0F;
	Mon, 27 Mar 2023 15:30:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p34so5277834wms.3;
        Mon, 27 Mar 2023 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679931041;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXK7oru0AfEDzPeFckyjSP+WN6K9DgaXywL/sEsWdG8=;
        b=Zc+L1zUKJ0H3CT88qLp3HiweUNg3om2uvYGypmY+vW/4ISbpztkS5Y6CEuxrhsHCYr
         ofbLcfvMD1ofC4/pAU9iqPJjJmsTeBpwMRiWkyAfrbN5FMVPosSGklzDcjucDraoKEn1
         6es2Zy6Cu/L8CdUKGR4feg5+6atAL5dUU/e6qCEbR4PvACs5obMleYYMFHFo8EqAwIVd
         tCT9irmFk/r7tRg7Bz1MYe+eYhMnwqZlLznc71J/MpsOPUmYprhUZuzXslsxhX9GYXAd
         PlFAhVNLjqCaxG3UJU7zzj/sAxHifrWDUbO1jR+Ta2OZqVuoz82e8Xp3lnkQU7+TMGDQ
         /GSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679931041;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AXK7oru0AfEDzPeFckyjSP+WN6K9DgaXywL/sEsWdG8=;
        b=47QPmC7AHrifx5ctTDIBTGmrGybXnET+JCZVd3MLP3vbykAJCsLsB+7jew23j8I1az
         Dt9Z2p8iYA3aB9LTxV07xPLy1fJHXxF5FkFXRUCnW46ZTM+REGwVzFeYRY/46iIPbjC1
         vLiccc7nm43lU4b614DM/mxk81Apzd29nrWokTSMWAvGJMQn/eBvpQ3r4xVPEhAwlWB1
         MDnNZzkOamV/Gc0jE+CEueOL1z5Zz4hkUUGMpPkjVubmPT0fbT0Mml7Opznv8CQf+u9b
         yMkXUgy8yuphu/r5lQhcigehnxYYo1SskCjlCJ0ujLihziGI163YOYjhL36ztILhFhSc
         AJpA==
X-Gm-Message-State: AO0yUKVa4m2w++shu2Kd/0cWoFOLu7wDFL7rpzdiFBJMjxtqpHCpgkSa
	yEk7oEZOlzms5AsRAXsDs5GBYlD/014=
X-Google-Smtp-Source: AK7set9keKbzHNTF+88AoF2fitfnHHHTCS0FOElmF4LDzPt3fRfceuc1GqEfKtAbtzUEgQhGGmslCg==
X-Received: by 2002:a1c:ed05:0:b0:3eb:395b:8b62 with SMTP id l5-20020a1ced05000000b003eb395b8b62mr9292509wmh.39.1679931041322;
        Mon, 27 Mar 2023 08:30:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m31-20020a05600c3b1f00b003ef5bb63f13sm9426633wms.10.2023.03.27.08.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 08:30:40 -0700 (PDT)
Date: Mon, 27 Mar 2023 18:30:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Sunil V L <sunilvl@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [avpatel:alexghiti_test 30/78] arch/riscv/kernel/cpufeature.c:141
 riscv_fill_hwcap() error: uninitialized symbol 'isa'.
Message-ID: <13017ff9-8e1a-40a9-a23f-4568bf566053@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   93aaa7cba9ba7ae91a47812465117e2f9b9e3712
commit: 0f713f9456748d534d3fedde51fe941454109f7f [30/78] RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
config: riscv-randconfig-m031-20230326 (https://download.01.org/0day-ci/archive/20230327/202303272310.T2uiCm4o-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303272310.T2uiCm4o-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/cpufeature.c:141 riscv_fill_hwcap() error: uninitialized symbol 'isa'.

vim +/isa +141 arch/riscv/kernel/cpufeature.c

3df952ae2ac81f Jisheng Zhang  2021-05-16   90  void __init riscv_fill_hwcap(void)
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   91  {
dd81c8ab819d36 Johan Hovold   2019-01-18   92  	struct device_node *node;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10   93  	const char *isa;
58004f26691891 Tsukasa OI     2022-03-14   94  	char print_str[NUM_ALPHA_EXTS + 1];
ad635e723e1737 Sunil V L      2022-05-27   95  	int i, j, rc;
726855549cf8d5 Andrew Jones   2022-11-29   96  	unsigned long isa2hwcap[26] = {0};
0f713f9456748d Sunil V L      2023-03-06   97  	struct acpi_table_header *rhct;
0f713f9456748d Sunil V L      2023-03-06   98  	acpi_status status;
0f713f9456748d Sunil V L      2023-03-06   99  	unsigned int cpu;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  100  
726855549cf8d5 Andrew Jones   2022-11-29  101  	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
726855549cf8d5 Andrew Jones   2022-11-29  102  	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
726855549cf8d5 Andrew Jones   2022-11-29  103  	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
726855549cf8d5 Andrew Jones   2022-11-29  104  	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
726855549cf8d5 Andrew Jones   2022-11-29  105  	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
726855549cf8d5 Andrew Jones   2022-11-29  106  	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  107  
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  108  	elf_hwcap = 0;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  109  
6bcff51539ccae Anup Patel     2020-04-24  110  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
6bcff51539ccae Anup Patel     2020-04-24  111  
0f713f9456748d Sunil V L      2023-03-06  112  	if (!acpi_disabled) {
0f713f9456748d Sunil V L      2023-03-06  113  		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
0f713f9456748d Sunil V L      2023-03-06  114  		if (ACPI_FAILURE(status))
0f713f9456748d Sunil V L      2023-03-06  115  			return;
0f713f9456748d Sunil V L      2023-03-06  116  	}
0f713f9456748d Sunil V L      2023-03-06  117  
0f713f9456748d Sunil V L      2023-03-06  118  	for_each_possible_cpu(cpu) {
fbdc6193dc706c Atish Patra    2019-02-22  119  		unsigned long this_hwcap = 0;
02d52fbd940af7 Atish Patra    2022-03-14  120  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
3f96db125d6812 Atish Patra    2022-03-14  121  		const char *temp;
fbdc6193dc706c Atish Patra    2019-02-22  122  
0f713f9456748d Sunil V L      2023-03-06  123  		if (acpi_disabled) {
0f713f9456748d Sunil V L      2023-03-06  124  			node = of_cpu_device_node_get(cpu);
0f713f9456748d Sunil V L      2023-03-06  125  			if (node) {
0f713f9456748d Sunil V L      2023-03-06  126  				rc = of_property_read_string(node, "riscv,isa", &isa);
0f713f9456748d Sunil V L      2023-03-06  127  				of_node_put(node);
0f713f9456748d Sunil V L      2023-03-06  128  				if (rc) {
7265d103902c0b Johan Hovold   2019-01-18  129  					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
fbdc6193dc706c Atish Patra    2019-02-22  130  					continue;
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  131  				}
0f713f9456748d Sunil V L      2023-03-06  132  			}

"isa" not initialized if of_cpu_device_node_get() return NULL.

0f713f9456748d Sunil V L      2023-03-06  133  		} else {
0f713f9456748d Sunil V L      2023-03-06  134  			rc = acpi_get_riscv_isa(rhct, cpu, &isa);
0f713f9456748d Sunil V L      2023-03-06  135  			if (rc < 0) {
0f713f9456748d Sunil V L      2023-03-06  136  				pr_warn("Unable to get ISA for the hart - %d\n", cpu);
0f713f9456748d Sunil V L      2023-03-06  137  				continue;
0f713f9456748d Sunil V L      2023-03-06  138  			}
0f713f9456748d Sunil V L      2023-03-06  139  		}
e2c0cdfba7f699 Palmer Dabbelt 2017-07-10  140  
3f96db125d6812 Atish Patra    2022-03-14 @141  		temp = isa;
6bcff51539ccae Anup Patel     2020-04-24  142  #if IS_ENABLED(CONFIG_32BIT)
6bcff51539ccae Anup Patel     2020-04-24  143  		if (!strncmp(isa, "rv32", 4))
2a31c54be097c7 Tsukasa OI     2022-03-14  144  			isa += 4;
6bcff51539ccae Anup Patel     2020-04-24  145  #elif IS_ENABLED(CONFIG_64BIT)
6bcff51539ccae Anup Patel     2020-04-24  146  		if (!strncmp(isa, "rv64", 4))
2a31c54be097c7 Tsukasa OI     2022-03-14  147  			isa += 4;
6bcff51539ccae Anup Patel     2020-04-24  148  #endif
3f96db125d6812 Atish Patra    2022-03-14  149  		/* The riscv,isa DT property must start with rv64 or rv32 */
3f96db125d6812 Atish Patra    2022-03-14  150  		if (temp == isa)
3f96db125d6812 Atish Patra    2022-03-14  151  			continue;
02d52fbd940af7 Atish Patra    2022-03-14  152  		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
2a31c54be097c7 Tsukasa OI     2022-03-14  153  		for (; *isa; ++isa) {
2a31c54be097c7 Tsukasa OI     2022-03-14  154  			const char *ext = isa++;
2a31c54be097c7 Tsukasa OI     2022-03-14  155  			const char *ext_end = isa;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

