Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDAA266583
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739544153; cv=none; b=nt8RTty1RtFeFp3tv7y0Xo/hFDBdZzGf9n+F9EBrkyqCC9a2zpC4fkb8aaATExd7w4Z8opSjd/B7P09lbNksn/NFPL5fnxCpGaexFck+p/+qJLgqRM0JziUdmWbsUyrqssL+WWAMSu91dj6DrMN5TrJd0KJCBbDf/uJUN7K0DZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739544153; c=relaxed/simple;
	bh=/hFRqo78Ekm9g5FTrhvJLClp80bSRuKsAEF9GDz0Hts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfQGsQ7gf/GLR5ovFWu2V9XZrI7JxmZdZmQj6KsR/Ff+2cpPQjOqI/L7ZvVlfLSLMF02OUzzSnviv14i6HhmaU6ILIrTZxMYWHFwECJT0DNly0rLcuBm+STqP8dC2o4qgh5Zlb6RS1Z10dQ52VSTHtw5K7WQYO8VP11dhtKqyvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eptbSoli; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eptbSoli"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab7c07e8b9bso374933366b.1
        for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 06:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739544149; x=1740148949; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5A8Gla8Q///5jr1e+UVgogTbKkTus0cG6K56L7NjpIo=;
        b=eptbSoliOSln2VoPPd+qUi9R3YTr+1TcRMbAh8U/si8zC9NzhsOtyKIYY1OIDM2haq
         DzD8h4FJOSKcy1aig8jOXQUVwGojpl54+EEdEYeDcj+HjY0KSKGd7O/GKdIdLwIiiLTS
         RmC8qd7dnElM9cmgN7Di3s2JSKz1ZobpcVelEuWrC0LVETlv1hQdk3bdf1k1AXbCPVfl
         FrlAfwfsE5dndKSz/w+oC0cSSJkp9A081AMl/EynJsduraoriKF+Pzf1yAxHDZ/BHy2e
         e6++WFjx24SbXtrIhif68vmsgThJHQMwpUhfvZpGMmVJtkx6iJ5rlT6Y/BGyXtHhHrv+
         kThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739544149; x=1740148949;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5A8Gla8Q///5jr1e+UVgogTbKkTus0cG6K56L7NjpIo=;
        b=S5Pl1fCrXZk8Z9gDmSjE2ty9ZHuTx11rPGeQ124XlykiPETw1WJyX08nsel0Lg411i
         cnzRYQRQd+c4p3TBTEetlQXQIMyCyVP5bhKVtI4omIZRAPGfMcycyJNXReYkcaHcN1Se
         8o+HiZfF6nB5t8vrjD82RWF6hgBElV8vAU3Y64ZpakULQN+OPXPmNxBXkyg18xIWoOdF
         LaP/VQrlXyatsyth1gRw2vNTZ8BOmraTRFrin9gYjayxCagZj4qjj8bJ3Z+xlXB1LPGr
         wsiCJF2esxr1i5cDKXx/MiSwtOnFXZTpZ9gUiuyoKk+b02ag6s1ybTA95ws1CD9yBc3v
         jtzQ==
X-Gm-Message-State: AOJu0Yx/ND1+8uCc9HaE8AkbUKivkhk0TZyuOaKkV4MU/ejzmRxXqzHP
	MGr2coPGdBTpQxP11VB/m7O+uYvWaj+I9fcr5SUg0l0T9JJMV61I3P3x5KVHbWGVeD6AFGGE8cS
	+UM8=
X-Gm-Gg: ASbGnctlChzny3PgJDqYQe3Vi/FUCr7CvU9YVAVRVr46qLFEXEzZklOw1zuL4cVq0Sd
	3BPdNem4eLidU8AEmvYwz9FrPz1dZA1WgNgWxZopnhUpcqo5x/RTRaAHm7dU4UPTlAB9bnSPuD/
	xk2gvDRfiCzp6SUNubfEFFKnv2xhjnQRfx4SSlWIXamCxm0jfL4v1jpXNlZlZlGQZDyPCcS9G/i
	gRDbiRiZ4R7RuHBubIf37GGBv+GGHMd/t2p+89qWCQcpBsDpo3RXRnbdS0q1eBSWHw+VIlhZnzr
	RNklzwK7bo9hpr471JGY
X-Google-Smtp-Source: AGHT+IHTsnNF3Z8oPb7KOJ0Szwe2eAivT4doFj5mcvOerXR4qOqV2S8aY3wuae3qVBS6+tsVgOsgtg==
X-Received: by 2002:a17:906:7807:b0:ab7:6369:83fc with SMTP id a640c23a62f3a-ab7f34af3d5mr1042895666b.38.1739544149543;
        Fri, 14 Feb 2025 06:42:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba533bdd39sm349560366b.167.2025.02.14.06.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:42:29 -0800 (PST)
Date: Fri, 14 Feb 2025 17:42:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Karan Tilak Kumar <kartilak@cisco.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Gian Carlo Boffa <gcboffa@cisco.com>,
	Arulprabhu Ponnusamy <arulponn@cisco.com>,
	Arun Easi <aeasi@cisco.com>
Subject: drivers/scsi/fnic/fdls_disc.c:263
 fdls_schedule_oxid_free_retry_work() warn: inconsistent indenting
Message-ID: <f1c717cf-63eb-402a-82cc-91c445055b97@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   128c8f96eb8638c060cd3532dc394d046ce64fe1
commit: a63e78eb2b0f654b138abfc323f6bd7573e26145 scsi: fnic: Add support for fabric based solicited requests and responses
config: i386-randconfig-141-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141403.1PcpwyJp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502141403.1PcpwyJp-lkp@intel.com/

smatch warnings:
drivers/scsi/fnic/fdls_disc.c:263 fdls_schedule_oxid_free_retry_work() warn: inconsistent indenting
drivers/scsi/fnic/fdls_disc.c:989 fdls_send_fabric_logo() warn: inconsistent indenting
drivers/scsi/fnic/fdls_disc.c:1953 fnic_fdls_validate_and_get_frame_type() warn: inconsistent indenting

vim +/cur_jiffies +166 drivers/scsi/fnic/fdls_disc.c

a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  244  void fdls_schedule_oxid_free_retry_work(struct work_struct *work)
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  245  {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  246  	struct fnic_oxid_pool_s *oxid_pool = container_of(work,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  247  		struct fnic_oxid_pool_s, schedule_oxid_free_retry.work);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  248  	struct fnic_iport_s *iport = container_of(oxid_pool,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  249  		struct fnic_iport_s, oxid_pool);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  250  	struct fnic *fnic = iport->fnic;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  251  	struct reclaim_entry_s *reclaim_entry;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  252  	unsigned long delay_j = msecs_to_jiffies(OXID_RECLAIM_TOV(iport));
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  253  	int idx;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  254  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  255  	spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);

Passing fnic->lock_flags is wrong.  spin_lock_irqsave() is not nestable
in the sense that the "flags" variable can't hold two values at once:

	orig_irq = save_original irq states and disable()
	orig_irq = save_original irq states and disable()
	restore(orig_irq)
	restore(orig_irq)

The second restore(orig_irq) is not going to restore the original states
it's going to leave them as disabled.

If fnic->lock_flags is holding anything useful when this is called, then it
is a bug or if anything uses it before we exit that will break us.  Just
declare "unsigned long flags;" locally.

a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  256  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  257  	for_each_set_bit(idx, oxid_pool->pending_schedule_free, FNIC_OXID_POOL_SZ) {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  258  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  259  		FNIC_FCS_DBG(KERN_INFO, fnic->lport->host, fnic->fnic_num,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  260  			"Schedule oxid free. oxid idx: %d\n", idx);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  261  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  262  		spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11 @263  	reclaim_entry = (struct reclaim_entry_s *)
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  264  	kzalloc(sizeof(struct reclaim_entry_s), GFP_KERNEL);


The indenting is off.  The normal way to write this is:

		reclaim_entry = kzalloc(sizeof(*reclaim_entry), GFP_KERNEL);

Remove the cast and change the sizeof().

a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  265  		spin_lock_irqsave(&fnic->fnic_lock, fnic->lock_flags);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  266  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  267  		if (!reclaim_entry) {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  268  			FNIC_FCS_DBG(KERN_WARNING, fnic->lport->host, fnic->fnic_num,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  269  				"Failed to allocate memory for reclaim struct for oxid idx: 0x%x\n",
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  270  				idx);

Remove this DBG.  The truth is that for as long as anyone can remember
the kmalloc() allocator won't fail for tiny allocations.  We're more
likely to formalize this rule than we are to change it at this point.
Still, we check for errors until that day arrives.

But allocations are not supposed to print an error message on error.
It's just messy and it doesn't add any information that isn't already
in the stack traces that kmalloc() prints.

I guess we can't call schedule_delayed_work() without holding the
spin_lock?  It's a strange thing.

a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  271  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  272  			schedule_delayed_work(&oxid_pool->schedule_oxid_free_retry,
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  273  				msecs_to_jiffies(SCHEDULE_OXID_FREE_RETRY_TIME));
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  274  			spin_unlock_irqrestore(&fnic->fnic_lock, fnic->lock_flags);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  275  			return;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  276  		}
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  277  
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  278  		if (test_and_clear_bit(idx, oxid_pool->pending_schedule_free)) {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  279  			reclaim_entry->oxid_idx = idx;
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  280  			reclaim_entry->expires = round_jiffies(jiffies + delay_j);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  281  			list_add_tail(&reclaim_entry->links, &oxid_pool->oxid_reclaim_list);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  282  			schedule_delayed_work(&oxid_pool->oxid_reclaim_work, delay_j);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  283  		} else {
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  284  			/* unlikely scenario, free the allocated memory and continue */
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  285  			kfree(reclaim_entry);
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  286  		}
a63e78eb2b0f65 Karan Tilak Kumar 2024-12-11  287  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

