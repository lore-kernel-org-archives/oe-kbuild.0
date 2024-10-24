Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A38B176227
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729756720; cv=none; b=lR6UJSIJITVHBoDvE6DLDIAHpqPhE85+IwmF3USVXLWhuiM++4cAZU5AFHzamOWw2OVV4nnsBTNEokc/FoXVWiybLkNeMJkGB7xYo/q2XlJS2pAEnPfUA0MonwmjCAta/GeMNY9mOYQkBd2noH7HIoX77uKiRe6JNfBhPVV5/EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729756720; c=relaxed/simple;
	bh=Lw0Zc5q+pDKjabrqXu5Q21yUyG+4ml0jrzQg1pf4+mU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XV/2URHJv9GRGw6ScViYzkT/k025agZdrVxjFqQ0pysx4+hKEmgPCofKAb8I9cuJaAUpEo635Ydoizg3PvkdNP7FSmiAbk7fottqoWi9pNDeForWr28/IyY9e4w4/ImpB84W3qH7y9TqS3Cc1aJu0aC6f4uD0s5VXdvZ8ucx2MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4XYyw93Jhpz1ynM5;
	Thu, 24 Oct 2024 15:58:33 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 00CF91400CB;
	Thu, 24 Oct 2024 15:58:26 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Oct 2024 15:58:25 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <rostedt@goodmis.org>
CC: <dan.carpenter@linaro.org>, <mhiramat@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<oe-kbuild@lists.linux.dev>, <lkp@intel.com>, <lihuafei1@huawei.com>
Subject: [PATCH v2] fgraph: Fix missing unlock in register_ftrace_graph()
Date: Thu, 24 Oct 2024 23:59:17 +0800
Message-ID: <20241024155917.1019580-1-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf500004.china.huawei.com (7.202.181.242)

Use guard(mutex)() to acquire and automatically release ftrace_lock,
fixing the issue of not unlocking when calling cpuhp_setup_state()
fails.

Fixes smatch warning:

kernel/trace/fgraph.c:1317 register_ftrace_graph() warn: inconsistent returns '&ftrace_lock'.

Fixes: 2c02f7375e65 ("fgraph: Use CPU hotplug mechanism to initialize idle shadow stacks")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202410220121.wxg0olfd-lkp@intel.com/
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
Changes in v2:
 - Use guard() to acquire and automatically release ftrace_lock.
---
 kernel/trace/fgraph.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 41e7a15dcb50..cd1c2946018c 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -1252,7 +1252,7 @@ int register_ftrace_graph(struct fgraph_ops *gops)
 	int ret = 0;
 	int i = -1;
 
-	mutex_lock(&ftrace_lock);
+	guard(mutex)(&ftrace_lock);
 
 	if (!fgraph_initialized) {
 		ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "fgraph_idle_init",
@@ -1273,10 +1273,8 @@ int register_ftrace_graph(struct fgraph_ops *gops)
 	}
 
 	i = fgraph_lru_alloc_index();
-	if (i < 0 || WARN_ON_ONCE(fgraph_array[i] != &fgraph_stub)) {
-		ret = -ENOSPC;
-		goto out;
-	}
+	if (i < 0 || WARN_ON_ONCE(fgraph_array[i] != &fgraph_stub))
+		return -ENOSPC;
 	gops->idx = i;
 
 	ftrace_graph_active++;
@@ -1313,8 +1311,6 @@ int register_ftrace_graph(struct fgraph_ops *gops)
 		gops->saved_func = NULL;
 		fgraph_lru_release_index(i);
 	}
-out:
-	mutex_unlock(&ftrace_lock);
 	return ret;
 }
 
-- 
2.25.1

