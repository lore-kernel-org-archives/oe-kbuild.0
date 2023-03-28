Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710BD33D9;
	Tue, 28 Mar 2023 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tCBTxDVdoLcE409lLKwvhPJrvjGn24H6cSgTTCSn3dM=; b=PnlNCohPImClILJzQRBl6hdove
	ji2dSu7DV+vGPq+zkPB6ttaeoIu48cAFGTfHdLwic9OfG0VNSDHGQZvJ3fu/SSzpvsCt+iYAdSfTB
	iVmrqkIa2kaiVXPTmhxuDQ1GA/PZDH5ltDrLn7ocDmQlH8JtNYn2Nr98sYTABLLCDVmqw4jmkHbaG
	XNWhvmXZgWEdW/FvRLPLEgFaXI/VIvTx1ulLPTnFwkGa7J1+ETzRkAisTvo7rVBSwuRRPFaYsxiXb
	6Xc0G9F6ZqJ+OEL2rpVX7voEFckYzBMDXtYueoM69wCmh3r1TI+FlMnln4ivTT6TA0kQkGVxBo7bx
	GSSwnIkg==;
Received: from [191.255.122.45] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1ph8Ta-009wi5-Pd; Tue, 28 Mar 2023 14:30:59 +0200
Message-ID: <a180230d-3f4c-b124-d678-7653bc3336d2@igalia.com>
Date: Tue, 28 Mar 2023 09:30:53 -0300
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [linux-next:master 646/7309] arch/parisc/kernel/firmware.c:1271
 pdc_soft_power_button_panic() error: uninitialized symbol 'flags'.
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
References: <acbcffb2-5913-45c2-98ef-fe2f06501807@kili.mountain>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <acbcffb2-5913-45c2-98ef-fe2f06501807@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/03/2023 07:23, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a6faf7ea9fcb7267d06116d4188947f26e00e57e
> commit: cf559f6a9e3a7228f402dc43cff08d0a47ee8b7c [646/7309] parisc: Replace regular spinlock with spin_trylock on panic path
> config: parisc-randconfig-m031-20230326 (https://download.01.org/0day-ci/archive/20230328/202303281743.gzT66f6u-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202303281743.gzT66f6u-lkp@intel.com/
> 
> New smatch warnings:
> arch/parisc/kernel/firmware.c:1271 pdc_soft_power_button_panic() error: uninitialized symbol 'flags'.
> 
> Old smatch warnings:
> arch/parisc/kernel/firmware.c:779 pdc_stable_read() warn: inconsistent indenting
> arch/parisc/kernel/firmware.c:805 pdc_stable_write() warn: inconsistent indenting
> arch/parisc/kernel/firmware.c:830 pdc_stable_get_size() warn: inconsistent indenting
> arch/parisc/kernel/firmware.c:850 pdc_stable_verify_contents() warn: inconsistent indenting
> arch/parisc/kernel/firmware.c:869 pdc_stable_initialize() warn: inconsistent indenting
> 
> vim +/flags +1271 arch/parisc/kernel/firmware.c
> 
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1260  int pdc_soft_power_button_panic(int sw_control)
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1261  {
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1262  	int retval;
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1263  	unsigned long flags;
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1264  
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1265  	if (!spin_trylock_irqsave(&pdc_lock, flags)) {
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1266  		pr_emerg("Couldn't enable soft power button\n");
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1267  		return -EBUSY; /* ignored by the panic notifier */
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1268  	}
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1269  
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1270  	retval = mem_pdc_call(PDC_SOFT_POWER, PDC_SOFT_POWER_ENABLE, __pa(pdc_result), sw_control);
> cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20 @1271  	spin_unlock_irqrestore(&pdc_lock, flags);
> 
> This is a weird warning.  I wonder if it has to do with the BOOTLOADER
> stuff at the start of the file:
> 
> arch/parisc/kernel/firmware.c
>     67  
>     68  #if defined(BOOTLOADER)
>     69  # undef  spin_lock_irqsave
>     70  # define spin_lock_irqsave(a, b) { b = 1; }
>     71  # undef  spin_unlock_irqrestore
>     72  # define spin_unlock_irqrestore(a, b)
>     73  #else
>     74  static DEFINE_SPINLOCK(pdc_lock);
>     75  #endif
> 

Interesting finding, but spin_trylock_irqsave() is not redefined in this
block, so it's a bit confusing...
