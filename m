Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0397E;
	Mon,  6 Mar 2023 08:32:03 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x3so34978317edb.10;
        Mon, 06 Mar 2023 00:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678091522;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09+mPuVZfcZ9rLMBatGSj0PpAH+webEkKaDfeisbFXc=;
        b=d56BDuQb45uz65ASd9qDibDiSzprvqRGyH6LBLABcXN8Kn4ONYSgsVhbhuCMH3iA9N
         u68sODmaGpqHv6mRxY7G4q5SzD+Glb1f1cH0iG38XKVubUo9ZheC0hRUomegSehmSHov
         GZeMHpmMyrvpuZD7Jxlb8FB6KZfEh1zDvKjNNSXl+feP/BQ86LqIkyDJFWc4Sm3MtFBr
         NOm3kqQYEDUo9xatIYdBiOvY9T2NmuzJ6Fw+J4VOAJVhlDl20OpWEjS1gI8R7O7ZvoFP
         vpFbuNfRK1hPJrS50R/qQmbO0Z5+lzMPuGHFXpgn1IcAKNKk+o+I67DdxcbeKAA5MTSx
         10wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678091522;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09+mPuVZfcZ9rLMBatGSj0PpAH+webEkKaDfeisbFXc=;
        b=ZnlWqQV0n6toszSa8wv8N+hFQXT05wgK2/jiP+0wlgBIvVYypVWaFtcrF7aMJjZWv0
         OIkCCfmaB7LncJI1GNf23W7o+J6gNjgGC3luwroKiFLCoPItmDNeytl3y98K3JeWZN7F
         jbUgtNKv86zE2CqkDL8UhWDgt4FzLlo+er1/LRniNjoymnDbR86H/CjM3aSuEqckZvwh
         uAlH2I3coRD3fB4rE7qmGuiQ4TKTGh/BsZY/aB3yvQG5+BBizTskITSJeJzLsiKfYsLA
         g/zzahjllPUfRdN5wZrLv8SBcti8aDQwE+7W2kHrIyWlVHanVe2AFnShki8mDNBqKygn
         YHKg==
X-Gm-Message-State: AO0yUKURtycxUnb2d+SB+RFpCYpVcEvDcOjjdCIOV1QsaJMKLKdECEAD
	nxTHHtSlmH4VdxWg/Wgbkc36FFJ4tlP9mg==
X-Google-Smtp-Source: AK7set+Ghl+AJMfORMvDcY+tD6udFtPddvgleb38tQOQE/SDIRJNy+UDHopeeBaCccffAPueiFi5dQ==
X-Received: by 2002:a17:906:3ac1:b0:8af:1a8c:eaa0 with SMTP id z1-20020a1709063ac100b008af1a8ceaa0mr9353980ejd.75.1678091521670;
        Mon, 06 Mar 2023 00:32:01 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y21-20020a50ce15000000b004af71e8cc3dsm4705937edi.60.2023.03.06.00.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:32:01 -0800 (PST)
Date: Sun, 5 Mar 2023 11:04:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jfern:staging 8/8] kernel/rcu/update.c:266 rcu_end_inkernel_boot()
 warn: inconsistent returns '&rcu_boot_end_lock'.
Message-ID: <2afabe18-23c7-4f26-8547-4f77636422ff@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git staging
head:   e6d2024fa329f41ffba24f06090ea57e3b0041ed
commit: e6d2024fa329f41ffba24f06090ea57e3b0041ed [8/8] rcu: Add a minimum time for marking boot as completed
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230305/202303050636.Qhxwao0u-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303050636.Qhxwao0u-lkp@intel.com/

smatch warnings:
kernel/rcu/update.c:266 rcu_end_inkernel_boot() warn: inconsistent returns '&rcu_boot_end_lock'.

vim +266 kernel/rcu/update.c

ee42571f4381f1 Paul E. McKenney        2015-02-19  242  void rcu_end_inkernel_boot(void)
ee42571f4381f1 Paul E. McKenney        2015-02-19  243  {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  244) 	mutex_lock(&rcu_boot_end_lock);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  245) 	rcu_boot_end_called = true;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  246) 
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  247) 	if (rcu_boot_ended)
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  248) 		return;

mutex_unlock(&rcu_boot_end_lock);?

e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  249) 
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  250) 	if (rcu_boot_end_delay) {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  251) 		u64 boot_ms = div_u64(ktime_get_boot_fast_ns(), 1000000UL);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  252) 
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  253) 		if (boot_ms < rcu_boot_end_delay) {
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  254) 			schedule_delayed_work(&rcu_boot_end_work,
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  255) 					rcu_boot_end_delay - boot_ms);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  256) 			mutex_unlock(&rcu_boot_end_lock);
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  257) 			return;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  258) 		}
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  259) 	}
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  260) 
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25  261) 	cancel_delayed_work(&rcu_boot_end_work);
ee42571f4381f1 Paul E. McKenney        2015-02-19  262  	rcu_unexpedite_gp();
3e42ec1aa716f1 Paul E. McKenney        2015-11-25  263  	if (rcu_normal_after_boot)
3e42ec1aa716f1 Paul E. McKenney        2015-11-25  264  		WRITE_ONCE(rcu_normal, 1);
e40bb921119814 Jules Irenge            2020-06-01  265  	rcu_boot_ended = true;
e6d2024fa329f4 Joel Fernandes (Google  2023-02-25 @266) 	mutex_unlock(&rcu_boot_end_lock);
ee42571f4381f1 Paul E. McKenney        2015-02-19  267  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

