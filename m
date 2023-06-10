Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9BC134;
	Sat, 10 Jun 2023 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IcKUTt0Jz4Ee5PzOnQqhV+geQ1WvqJXgqT7HxiBDQZg=; b=OK6nenn2+8pIjFhjRXQF88OMzW
	LRIqDGi8kDw0p7YZxv42MFaeDB0U8P6Wgh24UpCyUuRW0sUcynzjg6KCpD3+FuAz3Xb57AW8nMoSU
	bocjtczyJJD2qCSGOJqx5b703uHhclCbiydC019RAnExcYrr9oQdXwOju/na55ox+7rXnGONNizVF
	hL6g5aI2iC0EN/PGbpdyV4HUcxsw5fhTiuK2jkslvl5eHAd8je3E1E9CU7i+oSflboJEwsKqsqWTa
	Oswn41K6iwhXumXPBQpmCaUYBzn/V3TuxmOsap+bBQQ5lp2hznw46eWOfKIw4heSyfWVS8oDPBLl0
	+UDiXUJw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q7wiu-007w9T-2p;
	Sat, 10 Jun 2023 11:25:37 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 15BB93001AE;
	Sat, 10 Jun 2023 13:25:36 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id EA597240FDF94; Sat, 10 Jun 2023 13:25:35 +0200 (CEST)
Date: Sat, 10 Jun 2023 13:25:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:core/guards 51/58] kernel/events/core.c:12288
 __do_sys_perf_event_open() warn: 'task' is an error pointer or valid
Message-ID: <20230610112535.GC4253@hirez.programming.kicks-ass.net>
References: <7e99e673-715a-4949-acdb-607ea28a2175@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e99e673-715a-4949-acdb-607ea28a2175@kadam.mountain>

On Sat, Jun 10, 2023 at 11:34:41AM +0300, Dan Carpenter wrote:

> e5d1367f17ba6a kernel/perf_event.c   Stephane Eranian        2011-02-14  12286  	if (pid != -1 && !(flags & PERF_FLAG_PID_CGROUP)) {
> c6be5a5cb62592 kernel/perf_event.c   Peter Zijlstra          2010-10-14  12287  		task = find_lively_task_by_vpid(pid);
> d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09 @12288  		if (!task)
> d5731952629b97 kernel/events/core.c  Peter Zijlstra          2023-06-09  12289  			return -ESRCH;
> 
> This should be:
> 
> 	 if (IS_ERR(task))
> 		return PTR_ERR(task);

Looks like this is the only actual callsite of that function, so lets
fix it like so:

diff --git a/kernel/events/core.c b/kernel/events/core.c
index cb506acfa088..11defaa1add7 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4668,9 +4668,6 @@ find_lively_task_by_vpid(pid_t vpid)
 		get_task_struct(task);
 	rcu_read_unlock();
 
-	if (!task)
-		return ERR_PTR(-ESRCH);
-
 	return task;
 }
 
