Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26F1867;
	Tue, 15 Nov 2022 06:37:42 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id cl5so22524940wrb.9;
        Mon, 14 Nov 2022 22:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0UuKsrtaUQJeoL6SglHIU57kxBsjCPLAPtRrqxxSJak=;
        b=aDYn8xC4iZwLEHcvbYuBDXyg+6vze6cdda5CscjPQGhfWiBZwtVH5WEQej6YAUhqtU
         xI8tqaBQJbBndJU2wfh+yigIjD7dgu6GcqduM5t0T2gH1IuEEkvZmXqCC+hOxYhJIuIz
         ge3DIKFr6esYlHA3ROwk7+kJ/UYNjQLpXoryYYPjLLzo4w475MJlbU12k9QUCijC6BU7
         NIzJmZ8A7SWz2R4vnzpjO7yJ7HpAsNFfdHJ63N5QxFbjn5rlu06Xiu1m3T/0rrr4TQZs
         YmUQ7Ha25qMBEH8hUEo83S0G9DUCuYJTXLEUdkS7R0M9zV2+K0YZmAj94L0jzklUbc6L
         ZbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UuKsrtaUQJeoL6SglHIU57kxBsjCPLAPtRrqxxSJak=;
        b=OaH5+dD90ukQ5l/WkYvuT4lw8XLwcekXs1kPfOfROrqwfiIeVWa06uUoMuixQ904W/
         5vG5/wv5oNxfHXds6OICZ39KQzGVJ7V7bDhQWDhUCcHfAlGaJD+OXA9RV6p4HWwJcSGy
         BG81WM1ZqWAvU6qM0gGVDHVChoVAGKED3jPbZlw7nKK4hkVszKsV3+tooVFhTUlAIx+Y
         klKV/hD9Mu/K+oDHLtKS08eq4+whtAjpCc33vQ7uUrmKySX2hPgoMNA54R15POBOd3Z6
         8ZbfrDmwc7mO/+2WomMc9qo/ppgPJ6lr63AnZvj0P+pWjf97psaqT4Dhuw+JBLURkaJ+
         x+5A==
X-Gm-Message-State: ANoB5pm2LVsc1sT8kRSmXwBCMb2cAFsbXLAOzs0uhtzjv36OUQGg5rq9
	RJ5OR8jqb1otWhURV/zGMXTkpybXkSY=
X-Google-Smtp-Source: AA0mqf7TM9Xx4ma8nFWt9AmCGjecDJFIXIL4bv9HkOXZFPxhJUnhGX+sbI19rjp3Rim2FlQlLI60sA==
X-Received: by 2002:adf:e812:0:b0:241:7277:990b with SMTP id o18-20020adfe812000000b002417277990bmr9711630wrm.672.1668494260564;
        Mon, 14 Nov 2022 22:37:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c1d0900b003cf878c4468sm22411983wms.5.2022.11.14.22.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 22:37:40 -0800 (PST)
Date: Tue, 15 Nov 2022 09:37:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Youling Tang <tangyouling@loongson.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Subject: arch/loongarch/kernel/traps.c:250 die() warn: variable dereferenced
 before check 'regs' (see line 244)
Message-ID: <202211150324.eLx8WYhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221115063737.E5gbXXBAN_8aHEjzjE9hkPmUCG-4NdaQ9qP1_sGYyJc@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   094226ad94f471a9f19e8f8e7140a09c2625abaa
commit: 4e62d1d86585e1b62b4f96ee586881dd45a443dc LoongArch: Add kdump support
config: loongarch-randconfig-m031-20221114
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
arch/loongarch/kernel/traps.c:250 die() warn: variable dereferenced before check 'regs' (see line 244)

vim +/regs +250 arch/loongarch/kernel/traps.c

0603839b18f4fb Huacai Chen  2022-05-31  228  void __noreturn die(const char *str, struct pt_regs *regs)
0603839b18f4fb Huacai Chen  2022-05-31  229  {
0603839b18f4fb Huacai Chen  2022-05-31  230  	static int die_counter;
0603839b18f4fb Huacai Chen  2022-05-31  231  	int sig = SIGSEGV;
0603839b18f4fb Huacai Chen  2022-05-31  232  
0603839b18f4fb Huacai Chen  2022-05-31  233  	oops_enter();
0603839b18f4fb Huacai Chen  2022-05-31  234  
0603839b18f4fb Huacai Chen  2022-05-31  235  	if (notify_die(DIE_OOPS, str, regs, 0, current->thread.trap_nr,
0603839b18f4fb Huacai Chen  2022-05-31  236  		       SIGSEGV) == NOTIFY_STOP)
0603839b18f4fb Huacai Chen  2022-05-31  237  		sig = 0;
0603839b18f4fb Huacai Chen  2022-05-31  238  
0603839b18f4fb Huacai Chen  2022-05-31  239  	console_verbose();
0603839b18f4fb Huacai Chen  2022-05-31  240  	raw_spin_lock_irq(&die_lock);
0603839b18f4fb Huacai Chen  2022-05-31  241  	bust_spinlocks(1);
0603839b18f4fb Huacai Chen  2022-05-31  242  
0603839b18f4fb Huacai Chen  2022-05-31  243  	printk("%s[#%d]:\n", str, ++die_counter);
0603839b18f4fb Huacai Chen  2022-05-31 @244  	show_registers(regs);
                                                               ^^^^
Dereferenced without checking.

0603839b18f4fb Huacai Chen  2022-05-31  245  	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
0603839b18f4fb Huacai Chen  2022-05-31  246  	raw_spin_unlock_irq(&die_lock);
0603839b18f4fb Huacai Chen  2022-05-31  247  
0603839b18f4fb Huacai Chen  2022-05-31  248  	oops_exit();
0603839b18f4fb Huacai Chen  2022-05-31  249  
4e62d1d86585e1 Youling Tang 2022-10-12 @250  	if (regs && kexec_should_crash(current))
                                                    ^^^^
Too late.

4e62d1d86585e1 Youling Tang 2022-10-12  251  		crash_kexec(regs);
4e62d1d86585e1 Youling Tang 2022-10-12  252  
0603839b18f4fb Huacai Chen  2022-05-31  253  	if (in_interrupt())
0603839b18f4fb Huacai Chen  2022-05-31  254  		panic("Fatal exception in interrupt");
0603839b18f4fb Huacai Chen  2022-05-31  255  
0603839b18f4fb Huacai Chen  2022-05-31  256  	if (panic_on_oops)
0603839b18f4fb Huacai Chen  2022-05-31  257  		panic("Fatal exception");
0603839b18f4fb Huacai Chen  2022-05-31  258  
0603839b18f4fb Huacai Chen  2022-05-31  259  	make_task_dead(sig);
0603839b18f4fb Huacai Chen  2022-05-31  260  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

