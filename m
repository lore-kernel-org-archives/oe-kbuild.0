Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262005;
	b=hCBV5gp969RA4VwBhnHP1/zlAyCh0i15k6AXMdzqyq9h3+kY9Iegt9YOQp2cKUjnsQP2
	 CcLYK5V/5hQSIibVAr7v6uRzQ7ZXGS32fXk3/uQ9dgO5p3QbqhWL2shB0Z8Ak0Nyvlk2U
	 uH8B1xq3a9DEocGpsYp6GzzKHbppP5TjrgMt+pd0Nz58oSUU0C3wVLP8sx3UN3M8ote/+
	 s4GRIeW7XQVndXIwpETfh3ZBrTkI2qlnYecYzaS4ScrUDhrj4sCL+uKbcQE/bc9CFt1bL
	 QU/ZvYuSR4Kp2M2PDMg3crEDMwMICU9NLSqlqhtYKhaH/yvGp+//pBvb4KrMEQizt2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=YD6yeEZzcF/IkGgi5XaflAkW3DzRMMEsfh8rp3u6CHE=;
	b=F8ndDJLQ81pu9abS5My4gxHAmn8Wj5Gqgfm4FnYCun2nf/1KeczWaEfA+PNG5GGoXiuT
	 5iNjkpPThEVgaYKbKdlY/TlAOaBBjoTI8gNoVditrtZVdsBUaWIPnmAc0DbClekOO3s3l
	 9p6GW93dyLIOG7fT9I4I3Q2WjqJZvUfXf3UQ23cxiW+kNdvYjhUo4fqcq+uy6N2v/p7hw
	 7QgPbvbcg6D691r6KeiQfvRI4jGQsyMWDWqBd+Ft71+ohj3kaqvnZ+fQbELVYeZ2xpPBY
	 NYhDEOEp7ufEJSF8mwdGj41mb0XxmoMGyyvuPMK5b7tw/mM5Px0ooYqGDt/m9324ZcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCnJ1pcc;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA13F606A321
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Oct 2026 08:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA13F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PCnJ1pcc
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so17835765e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 29 Oct 2026 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793262003; x=1793866803; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YD6yeEZzcF/IkGgi5XaflAkW3DzRMMEsfh8rp3u6CHE=;
        b=PCnJ1pccJPrNZHAEk9s+qGaQ4ncifZgd8N/H72uPLizsTOfszhsJgpKIMv5W6DTZdu
         txcRPJgvhx7ohQinKJWyLJmB7zC55VJ21Hg+KWsxLuXs0UwdOOcTY+rp9ah/TGiUUFKb
         rIY9HE1SmBY65qitSvOeDUtlUwpc6eIqtXjfeLmXowCYr8SBZvLh4zGMixYzVEhnXkAn
         IRNGAw1V339K4EfV2dSoI+GfUoNfUvoxgfRlUEzpIYS5CqyKLb7TSuDOsLvzB4F2uws6
         snCDxUyEXltOJzsozh5urLI6V2wmI+gBPhqqHyDyAg007fpBLIJFjSPEgvvDG2prn2df
         QUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262003; x=1793866803;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YD6yeEZzcF/IkGgi5XaflAkW3DzRMMEsfh8rp3u6CHE=;
        b=Lb9vprhH/zFTS/ziXYPn+PUjLsKcMNpT0GItMtX8Lf/Ucqw3ne4ndhhDSIZ1eehLA9
         A7GZ6zf7SqO/mnggK+4yxQl/d2ByrA7gOdPWclQe0Ebwf3pxwakMRRVV3L89r/DDgIhS
         jf6UjgeP43aFdtn16YPsgHHiOqnuwjmZRatXcxufNHPCWHEyiOOiCYKL2g5b++eSwaWl
         5ZR+Thwac8G3V067nw+578x1O0+YV5Ok8nCRx1KfNa522jJrUCnMIYXF5BHxX69/NvGc
         58kuL7bwzRgZ+sn6uN0x2QUpaeMP4ssv9jbRWOx3YVShMkk8RWD8dfX0KwTttJJHMGgj
         FEpg==
X-Gm-Message-State: AFq9FYJdDS1/bPdlbshMlWcZ1E3UbT5/0/9NX7QOOlJigkVUw2xhlyiL
	8fNJkLho5y7e3KXNLFFwtnNnM5KeFcr/EO732+ykbfrloBO9HdR+sJo3t++b+iHpfOtkrwQW
X-Gm-Gg: AYBFou3bt6UDcJt+osmFbj9IplWlKnEBaqYf9CHYDDwjTztqrYXUtm2C++lRjFj3k49
	6Qs7sz9f2IXW2YvB/Biu72vX277cfcVIl8mdYFFJ+yEIdqqtg5mJARd+OCi2Lh/pUO5AHoqmIa+
	uAzL/pE0dh6O6beKIrky3AnurkBjGfIr320ZjAR6X4OKt62VZABy+oH33AtKkZSWyhF7z/58Coz
	a3u+1xcSnRI78yL9cU0RqybvD5Dv5+BN8vsAbGUCx+1SnmmtY7pDvcvR1422+QTwBIgLfzTqqdk
	qPvyApbdBVNFZrd4psVA6wMZsnmXvjQ3Cnb5+pAtPZb3REATub0Uclx2Xqxu8HNE7l4CQ9mcNhd
	Gis1NTgYjVjU/Dk0Sf3PeRgSp5B5x6agfQYdHkzd/kUhNgnFAynl76DJ74v+gulDH2MrLBvQYXD
	1lttuv9sUVWjYPHdNmrIyyiaOzRsXRJNNdaDkYCSdonZzv/ZAH3ltSIHKgZqCD7AsySUp0LoJxJ
	VFN8azsc/9n3FRJ0HreOizOc/DW/ubAHDBCpO5cCtPuLGCYuxJCA8dInR2eEqYEybSLuxmd3thC
	ymu/Qeqvl/ivqWnISV7yIFKS2ABeK+OAN2tE8SptiqHP2kDenOCEnatVG7OzgzCpA0mmKd9mT3Z
	QQrQUxeAmyjQhMcq8wRrvElWgwBvbu/4yG8yfPWeUE4rfa4MrunUWVQjbdtz0BJY4suQ=
X-Received: by 2002:a05:600c:620f:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a967e8d69cmr98876805e9.35.1793262003012;
        Thu, 29 Oct 2026 01:20:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm31161541f8f.7.2026.10.29.01.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:20:02 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:19:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [avpatel:sse_test_v10 4/9] arch/riscv/kernel/sbi_sse.c:66 do_sse()
 error: memcmp() '&regs->a6' too small (8 vs 16)
Message-ID: <202610290605.80V5NQDW-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20261029081958.FpBSBdNrlzw_M7UX3zQjmK9JsqxPQpb5W16gotVustg@z>

tree:   https://github.com/avpatel/linux.git sse_test_v10
head:   b153606b426cd9cdcd8786f48fc3774eb1f61abe
commit: cbb75c80fb5ab84a43c76c8796f793402216b21f [4/9] drivers: firmware: add riscv SSE support
config: riscv-randconfig-r2200-20261029 (https://download.01.org/0day-ci/archive/20261029/202610290605.80V5NQDW-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610290605.80V5NQDW-lkp@intel.com/

smatch warnings:
arch/riscv/kernel/sbi_sse.c:66 do_sse() error: memcmp() '&regs->a6' too small (8 vs 16)

vim +66 arch/riscv/kernel/sbi_sse.c

a15f710cb89bf2 Clément Léger 2026-09-11  33  void noinstr do_sse(struct sse_event_arch_data *arch_evt,
a15f710cb89bf2 Clément Léger 2026-09-11  34  		    struct pt_regs *regs, unsigned long hstatus)
a15f710cb89bf2 Clément Léger 2026-09-11  35  {
a15f710cb89bf2 Clément Léger 2026-09-11  36  	struct riscv_sse_interrupted_context context = { regs, hstatus };
a15f710cb89bf2 Clément Léger 2026-09-11  37  	struct riscv_sse_interrupted_context *previous;
a15f710cb89bf2 Clément Léger 2026-09-11  38  	struct sbiret sret;
a15f710cb89bf2 Clément Léger 2026-09-11  39  
a15f710cb89bf2 Clément Léger 2026-09-11  40  	nmi_enter();
a15f710cb89bf2 Clément Léger 2026-09-11  41  	instrumentation_begin();
a15f710cb89bf2 Clément Léger 2026-09-11  42  
a15f710cb89bf2 Clément Léger 2026-09-11  43  	/* Retrieve missing GPRs from SBI */
a15f710cb89bf2 Clément Léger 2026-09-11  44  	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, arch_evt->evt_id,
a15f710cb89bf2 Clément Léger 2026-09-11  45  			 SBI_SSE_ATTR_INTERRUPTED_A6,
a15f710cb89bf2 Clément Léger 2026-09-11  46  			 (SBI_SSE_ATTR_INTERRUPTED_A7 -
a15f710cb89bf2 Clément Léger 2026-09-11  47  			  SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
a15f710cb89bf2 Clément Léger 2026-09-11  48  			 (unsigned long)arch_evt->interrupted_phys, 0, 0);
a15f710cb89bf2 Clément Léger 2026-09-11  49  	if (sret.error) {
a15f710cb89bf2 Clément Léger 2026-09-11  50  		pr_warn("Failed to read interrupted registers for event %x: %ld\n",
a15f710cb89bf2 Clément Léger 2026-09-11  51  			arch_evt->evt_id, sret.error);
a15f710cb89bf2 Clément Léger 2026-09-11  52  		/* Let the client quiesce its source without using incomplete regs. */
a15f710cb89bf2 Clément Léger 2026-09-11  53  		sse_handle_event(arch_evt, NULL);
a15f710cb89bf2 Clément Léger 2026-09-11  54  		goto out;
a15f710cb89bf2 Clément Léger 2026-09-11  55  	}
a15f710cb89bf2 Clément Léger 2026-09-11  56  
a15f710cb89bf2 Clément Léger 2026-09-11  57  	memcpy(&regs->a6, arch_evt->interrupted,
a15f710cb89bf2 Clément Léger 2026-09-11  58  	       sizeof(*arch_evt->interrupted));
a15f710cb89bf2 Clément Léger 2026-09-11  59  
a15f710cb89bf2 Clément Léger 2026-09-11  60  	/* Make the interrupted frame visible while clients handle this event. */
a15f710cb89bf2 Clément Léger 2026-09-11  61  	previous = this_cpu_read(riscv_sse_interrupted_context);
a15f710cb89bf2 Clément Léger 2026-09-11  62  	this_cpu_write(riscv_sse_interrupted_context, &context);
a15f710cb89bf2 Clément Léger 2026-09-11  63  	sse_handle_event(arch_evt, regs);
a15f710cb89bf2 Clément Léger 2026-09-11  64  	this_cpu_write(riscv_sse_interrupted_context, previous);
a15f710cb89bf2 Clément Léger 2026-09-11  65  
a15f710cb89bf2 Clément Léger 2026-09-11 @66  	if (memcmp(&regs->a6, arch_evt->interrupted,
a15f710cb89bf2 Clément Léger 2026-09-11  67  		   sizeof(*arch_evt->interrupted))) {

This is a false positive.  This type of warning is typically
silenced using a struct_group().  Otherwise with the right
FORTIFY configs set up it triggers a WARN_ONCE() at runtime.

a15f710cb89bf2 Clément Léger 2026-09-11  68  		memcpy(arch_evt->interrupted, &regs->a6,
a15f710cb89bf2 Clément Léger 2026-09-11  69  		       sizeof(*arch_evt->interrupted));

Same.

a15f710cb89bf2 Clément Léger 2026-09-11  70  		sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE,
a15f710cb89bf2 Clément Léger 2026-09-11  71  				 arch_evt->evt_id, SBI_SSE_ATTR_INTERRUPTED_A6,
a15f710cb89bf2 Clément Léger 2026-09-11  72  				 (SBI_SSE_ATTR_INTERRUPTED_A7 -
a15f710cb89bf2 Clément Léger 2026-09-11  73  				  SBI_SSE_ATTR_INTERRUPTED_A6) + 1,
a15f710cb89bf2 Clément Léger 2026-09-11  74  				 (unsigned long)arch_evt->interrupted_phys, 0, 0);
a15f710cb89bf2 Clément Léger 2026-09-11  75  		/*
a15f710cb89bf2 Clément Léger 2026-09-11  76  		 * If writeback fails, COMPLETE resumes with firmware's original
a15f710cb89bf2 Clément Léger 2026-09-11  77  		 * a6/a7 rather than treating the shared buffer as committed.
a15f710cb89bf2 Clément Léger 2026-09-11  78  		 */
a15f710cb89bf2 Clément Léger 2026-09-11  79  		if (sret.error)
a15f710cb89bf2 Clément Léger 2026-09-11  80  			pr_warn("Failed to write interrupted registers for event %x: %ld\n",
a15f710cb89bf2 Clément Léger 2026-09-11  81  				arch_evt->evt_id, sret.error);
a15f710cb89bf2 Clément Léger 2026-09-11  82  	}
a15f710cb89bf2 Clément Léger 2026-09-11  83  
a15f710cb89bf2 Clément Léger 2026-09-11  84  out:
a15f710cb89bf2 Clément Léger 2026-09-11  85  	instrumentation_end();
a15f710cb89bf2 Clément Léger 2026-09-11  86  	nmi_exit();
a15f710cb89bf2 Clément Léger 2026-09-11  87  }
a15f710cb89bf2 Clément Léger 2026-09-11  88  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

