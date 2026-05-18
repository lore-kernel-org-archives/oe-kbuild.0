Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3898F48C8C2;
	Mon, 18 May 2026 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122775; cv=none; b=tZp4rLy6Fbpx7Ph3JTQ8b0LNSh9pPqNu/+a5dWylSSCKfXu16PwaW7sD+lbXz5GhjPSgjGekcgstVZf1DcnSCSkHtescIXDKq1qdRybc8UT+zdSYuo0bUq4GE5tcEoCaesD1ZLCeuTiIieJr677LehHsgV8g/RdtIWy3eCiRqGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122775; c=relaxed/simple;
	bh=l6idrx7DUeavcAkMTJPzWvtGW/svCPA+1zPFmHSnhT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WV+jEH8GV0jd2RHT+SCc3YZ/CZhrw1ZCbFLwKb9lkSRVDRbGw34qx9W3b561sq8CyYTLnS9ipBoZL904bxHBGKNR+4gbXocBWIakdGL59oDzZfCJa+QUgz6RU0UXbeY4JRym/VeITmPPpei0MjLATqsYvlIuz3AsYpc0Rq0yh4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkO+uL5Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkO+uL5Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32C3C2BCC6;
	Mon, 18 May 2026 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779122774;
	bh=l6idrx7DUeavcAkMTJPzWvtGW/svCPA+1zPFmHSnhT4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=rkO+uL5Q2lcaArQm9JHWfZ8aht7giXyZ6l3egFfllaN78wvqaj90oXGOBOc6+3s3T
	 qGdgtB6H4QJTYb2w/mmFoVHuxjYXd+4Q/cFd7U45BCgB7u+JzX0ystnevteAAt7RCf
	 hQb4OmOO7E24/+ZBZT1BRBJkxe+y2k4HcwuMGq3KZet0SQKfT2vUiqvmuyYiNLo8df
	 moGVRd3mYPJU2TzsRQE4Jli/oDbiqnlS76fRAGxVNVnOYRPfXM0q5MhqjXiNkq1PqD
	 ogSXyKkS6oSblS1Ij5UVPLEUVYr1d7brSMb4C5s8oeSDLV1ACl1dGOQV3FEhJ9oVne
	 naFnHJCYrUh+A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 62F4CCE0890; Mon, 18 May 2026 09:46:14 -0700 (PDT)
Date: Mon, 18 May 2026 09:46:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2026.05.08a 39/43] kernel/rcu/tree_exp.h:822
 rcu_print_task_exp_stall() error: we previously assumed 'rnp->exp_tasks'
 could be null (see line 818)
Message-ID: <30c88bad-2bb6-49b2-933f-01df7d6c8638@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202605171129.6vsB2TG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605171129.6vsB2TG2-lkp@intel.com>

On Mon, May 18, 2026 at 08:04:57AM +0300, Dan Carpenter wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2026.05.08a
> head:   86ed69edce527e32495da86900fe50b9ca3266d9
> commit: b32c53e658b25c6ed973a78b40bddc95e1948eac [39/43] rcu: Make rcu_print_task_exp_stall() dump ->dqs_blkd_tasks
> config: parisc-randconfig-r071-20260517 (https://download.01.org/0day-ci/archive/20260517/202605171129.6vsB2TG2-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 13.4.0
> smatch: v0.5.0-9185-gbcc58b9c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202605171129.6vsB2TG2-lkp@intel.com/
> 
> smatch warnings:
> kernel/rcu/tree_exp.h:822 rcu_print_task_exp_stall() error: we previously assumed 'rnp->exp_tasks' could be null (see line 818)
> 
> vim +822 kernel/rcu/tree_exp.h
> 
> d87cda5094585b Paul E. McKenney 2019-01-11  811  static int rcu_print_task_exp_stall(struct rcu_node *rnp)
> d87cda5094585b Paul E. McKenney 2019-01-11  812  {
> 314eeb43e5f228 Paul E. McKenney 2020-01-03  813  	unsigned long flags;
> d87cda5094585b Paul E. McKenney 2019-01-11  814  	int ndetected = 0;
> 314eeb43e5f228 Paul E. McKenney 2020-01-03  815  	struct task_struct *t;
> d87cda5094585b Paul E. McKenney 2019-01-11  816  
> 314eeb43e5f228 Paul E. McKenney 2020-01-03  817  	raw_spin_lock_irqsave_rcu_node(rnp, flags);
> b32c53e658b25c Paul E. McKenney 2026-05-16 @818  	if (!rnp->exp_tasks && list_empty(&rnp->dqs_blkd_tasks)) {
>                                                             ^^^^^^^^^^^^^^^
> If rnp->exp_tasks is NULL
> 
> 3c1566bca3f834 Zqiang           2022-12-24  819  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> 3c1566bca3f834 Zqiang           2022-12-24  820  		return 0;
> 3c1566bca3f834 Zqiang           2022-12-24  821  	}
> d87cda5094585b Paul E. McKenney 2019-01-11 @822  	t = list_entry(rnp->exp_tasks->prev,
>                                                                        ^^^^^^^^^^^^^^^^^^^^
> then this will crash.

Good catch!!!

Please see below for an alleged fix.  Also, it appears to me that
these commits have similar problems with similar fixes:

e7cc1cc2ca28 ("rcu: Make rcu_print_detail_task_stall_rnp() dump ->dqs_blkd_tasks")
e9c5b5b6bbff ("rcu: Make rcu_print_task_stall() dump ->dqs_blkd_tasks")


> d87cda5094585b Paul E. McKenney 2019-01-11  823  		       struct task_struct, rcu_node_entry);
> d87cda5094585b Paul E. McKenney 2019-01-11  824  	list_for_each_entry_continue(t, &rnp->blkd_tasks, rcu_node_entry) {
> d87cda5094585b Paul E. McKenney 2019-01-11  825  		pr_cont(" P%d", t->pid);
> d87cda5094585b Paul E. McKenney 2019-01-11  826  		ndetected++;
> d87cda5094585b Paul E. McKenney 2019-01-11  827  	}
> b32c53e658b25c Paul E. McKenney 2026-05-16  828  	list_for_each_entry(t, &rnp->dqs_blkd_tasks, rcu_node_entry) {
> b32c53e658b25c Paul E. McKenney 2026-05-16  829  		pr_cont(" Q%d", t->pid);
> b32c53e658b25c Paul E. McKenney 2026-05-16  830  		ndetected++;
> b32c53e658b25c Paul E. McKenney 2026-05-16  831  	}
> 314eeb43e5f228 Paul E. McKenney 2020-01-03  832  	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> d87cda5094585b Paul E. McKenney 2019-01-11  833  	return ndetected;
> d87cda5094585b Paul E. McKenney 2019-01-11  834  }
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


diff --git a/kernel/rcu/tree_exp.h b/kernel/rcu/tree_exp.h
index e635dc12f72465..18ed1478498883 100644
--- a/kernel/rcu/tree_exp.h
+++ b/kernel/rcu/tree_exp.h
@@ -819,11 +819,13 @@ static int rcu_print_task_exp_stall(struct rcu_node *rnp)
 		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 		return 0;
 	}
-	t = list_entry(rnp->exp_tasks->prev,
-		       struct task_struct, rcu_node_entry);
-	list_for_each_entry_continue(t, &rnp->blkd_tasks, rcu_node_entry) {
-		pr_cont(" P%d", t->pid);
-		ndetected++;
+	if (rnp->exp_tasks) {
+		t = list_entry(rnp->exp_tasks->prev,
+			       struct task_struct, rcu_node_entry);
+		list_for_each_entry_continue(t, &rnp->blkd_tasks, rcu_node_entry) {
+			pr_cont(" P%d", t->pid);
+			ndetected++;
+		}
 	}
 	list_for_each_entry(t, &rnp->dqs_blkd_tasks, rcu_node_entry) {
 		pr_cont(" Q%d", t->pid);
