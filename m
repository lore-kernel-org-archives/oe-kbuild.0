Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE323C0F
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679930898; x=1711466898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BhRE/RIDL/4VmXdGCeM2O8PTD7Qu3PF5y1uYTWKjX0k=;
  b=MzqOohhPHADdzIWjau6R7JjE3jNOYYIPTiGscuccAamviHi25yItRD12
   d+r1oQj0zysKWLhYLhYdJH/kFkLvdVVo5WsWBWFJR2FkEQ98QNsCoIyyK
   2GSlvXfZ991hio6Brrke02jJqSXg7HpwGb40JzyrFd3RYoLMxB1pgRCvX
   gGjU7KQ7k4WdzXgmbehYDQbwuSeD6Zu0ChX68MLxVdpBT0+UYtSHlSK4x
   zoZ054oEzof/4kvfo3FCvfUlYVK0ZRo0HZs2AQ86UNl0VDBgMBSLrZPm0
   ZtOLjc5Bc8AvNN/2gHcW5+UB5HI+T7x2juUUqnIrbjCVOHwBI+510GYhN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="339018811"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="339018811"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 08:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="827074832"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="827074832"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Mar 2023 08:28:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgolb-000HoB-1S;
	Mon, 27 Mar 2023 15:28:15 +0000
Date: Mon, 27 Mar 2023 23:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:alexghiti_test 30/78] arch/riscv/kernel/cpufeature.c:141
 riscv_fill_hwcap() error: uninitialized symbol 'isa'.
Message-ID: <202303272310.T2uiCm4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sunil V L <sunilvl@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>
CC: Andrew Jones <ajones@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git alexghiti_test
head:   93aaa7cba9ba7ae91a47812465117e2f9b9e3712
commit: 0f713f9456748d534d3fedde51fe941454109f7f [30/78] RISC-V: cpufeature: Add ACPI support in riscv_fill_hwcap()
:::::: branch date: 4 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-m031-20230326 (https://download.01.org/0day-ci/archive/20230327/202303272310.T2uiCm4o-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303272310.T2uiCm4o-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/cpufeature.c:141 riscv_fill_hwcap() error: uninitialized symbol 'isa'.

vim +/isa +141 arch/riscv/kernel/cpufeature.c

fb0ff0a95d61f6 Andrew Jones   2022-11-29   89  
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
2a31c54be097c7 Tsukasa OI     2022-03-14  156  			bool ext_long = false, ext_err = false;
2a31c54be097c7 Tsukasa OI     2022-03-14  157  
2a31c54be097c7 Tsukasa OI     2022-03-14  158  			switch (*ext) {
2a31c54be097c7 Tsukasa OI     2022-03-14  159  			case 's':
2a31c54be097c7 Tsukasa OI     2022-03-14  160  				/**
2a31c54be097c7 Tsukasa OI     2022-03-14  161  				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
2a31c54be097c7 Tsukasa OI     2022-03-14  162  				 * No need to set the bit in riscv_isa as 's' & 'u' are
2a31c54be097c7 Tsukasa OI     2022-03-14  163  				 * not valid ISA extensions. It works until multi-letter
2a31c54be097c7 Tsukasa OI     2022-03-14  164  				 * extension starting with "Su" appears.
2a31c54be097c7 Tsukasa OI     2022-03-14  165  				 */
2a31c54be097c7 Tsukasa OI     2022-03-14  166  				if (ext[-1] != '_' && ext[1] == 'u') {
2a31c54be097c7 Tsukasa OI     2022-03-14  167  					++isa;
2a31c54be097c7 Tsukasa OI     2022-03-14  168  					ext_err = true;
2a31c54be097c7 Tsukasa OI     2022-03-14  169  					break;
2a31c54be097c7 Tsukasa OI     2022-03-14  170  				}
2a31c54be097c7 Tsukasa OI     2022-03-14  171  				fallthrough;
2a31c54be097c7 Tsukasa OI     2022-03-14  172  			case 'x':
2a31c54be097c7 Tsukasa OI     2022-03-14  173  			case 'z':
2a31c54be097c7 Tsukasa OI     2022-03-14  174  				ext_long = true;
2a31c54be097c7 Tsukasa OI     2022-03-14  175  				/* Multi-letter extension must be delimited */
2a31c54be097c7 Tsukasa OI     2022-03-14  176  				for (; *isa && *isa != '_'; ++isa)
40a4d0dfbcf00c Tsukasa OI     2022-03-14  177  					if (unlikely(!islower(*isa)
40a4d0dfbcf00c Tsukasa OI     2022-03-14  178  						     && !isdigit(*isa)))
2a31c54be097c7 Tsukasa OI     2022-03-14  179  						ext_err = true;
40a4d0dfbcf00c Tsukasa OI     2022-03-14  180  				/* Parse backwards */
40a4d0dfbcf00c Tsukasa OI     2022-03-14  181  				ext_end = isa;
40a4d0dfbcf00c Tsukasa OI     2022-03-14  182  				if (unlikely(ext_err))
40a4d0dfbcf00c Tsukasa OI     2022-03-14  183  					break;
40a4d0dfbcf00c Tsukasa OI     2022-03-14  184  				if (!isdigit(ext_end[-1]))
40a4d0dfbcf00c Tsukasa OI     2022-03-14  185  					break;
40a4d0dfbcf00c Tsukasa OI     2022-03-14  186  				/* Skip the minor version */
40a4d0dfbcf00c Tsukasa OI     2022-03-14  187  				while (isdigit(*--ext_end))
40a4d0dfbcf00c Tsukasa OI     2022-03-14  188  					;
40a4d0dfbcf00c Tsukasa OI     2022-03-14  189  				if (ext_end[0] != 'p'
40a4d0dfbcf00c Tsukasa OI     2022-03-14  190  				    || !isdigit(ext_end[-1])) {
40a4d0dfbcf00c Tsukasa OI     2022-03-14  191  					/* Advance it to offset the pre-decrement */
40a4d0dfbcf00c Tsukasa OI     2022-03-14  192  					++ext_end;
40a4d0dfbcf00c Tsukasa OI     2022-03-14  193  					break;
40a4d0dfbcf00c Tsukasa OI     2022-03-14  194  				}
40a4d0dfbcf00c Tsukasa OI     2022-03-14  195  				/* Skip the major version */
40a4d0dfbcf00c Tsukasa OI     2022-03-14  196  				while (isdigit(*--ext_end))
40a4d0dfbcf00c Tsukasa OI     2022-03-14  197  					;
40a4d0dfbcf00c Tsukasa OI     2022-03-14  198  				++ext_end;
2a31c54be097c7 Tsukasa OI     2022-03-14  199  				break;
2a31c54be097c7 Tsukasa OI     2022-03-14  200  			default:
2a31c54be097c7 Tsukasa OI     2022-03-14  201  				if (unlikely(!islower(*ext))) {
2a31c54be097c7 Tsukasa OI     2022-03-14  202  					ext_err = true;
2a31c54be097c7 Tsukasa OI     2022-03-14  203  					break;
2a31c54be097c7 Tsukasa OI     2022-03-14  204  				}
2a31c54be097c7 Tsukasa OI     2022-03-14  205  				/* Find next extension */
2a31c54be097c7 Tsukasa OI     2022-03-14  206  				if (!isdigit(*isa))
2a31c54be097c7 Tsukasa OI     2022-03-14  207  					break;
2a31c54be097c7 Tsukasa OI     2022-03-14  208  				/* Skip the minor version */
2a31c54be097c7 Tsukasa OI     2022-03-14  209  				while (isdigit(*++isa))
2a31c54be097c7 Tsukasa OI     2022-03-14  210  					;
2a31c54be097c7 Tsukasa OI     2022-03-14  211  				if (*isa != 'p')
2a31c54be097c7 Tsukasa OI     2022-03-14  212  					break;
2a31c54be097c7 Tsukasa OI     2022-03-14  213  				if (!isdigit(*++isa)) {
2a31c54be097c7 Tsukasa OI     2022-03-14  214  					--isa;
2a31c54be097c7 Tsukasa OI     2022-03-14  215  					break;
2a31c54be097c7 Tsukasa OI     2022-03-14  216  				}
2a31c54be097c7 Tsukasa OI     2022-03-14  217  				/* Skip the major version */
2a31c54be097c7 Tsukasa OI     2022-03-14  218  				while (isdigit(*++isa))
2a31c54be097c7 Tsukasa OI     2022-03-14  219  					;
2a31c54be097c7 Tsukasa OI     2022-03-14  220  				break;
2a31c54be097c7 Tsukasa OI     2022-03-14  221  			}
2a31c54be097c7 Tsukasa OI     2022-03-14  222  			if (*isa != '_')
2a31c54be097c7 Tsukasa OI     2022-03-14  223  				--isa;
40a4d0dfbcf00c Tsukasa OI     2022-03-14  224  

:::::: The code at line 141 was first introduced by commit
:::::: 3f96db125d68127ffef6fdeeb777d94ccf95c09f RISC-V: Do no continue isa string parsing without correct XLEN

:::::: TO: Atish Patra <atishp@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
