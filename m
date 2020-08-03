Content-Type: multipart/mixed; boundary="===============5729819101214998565=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [RFC PATCH] sched: wake_idle_domain_mutex can be static
Date: Tue, 04 Aug 2020 05:36:08 +0800
Message-ID: <20200803213608.GA74513@f4ae2de9a7f5>
In-Reply-To: <202008040548.LXOEDIDn%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5729819101214998565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200728070131.1629670-1-xii@google.com>
References: <20200728070131.1629670-1-xii@google.com>
TO: Xi Wang <xii@google.com>
TO: Ingo Molnar <mingo@redhat.com>
TO: Peter Zijlstra <peterz@infradead.org>
CC: Juri Lelli <juri.lelli@redhat.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: Steven Rostedt <rostedt@goodmis.org>
CC: Mel Gorman <mgorman@suse.de>
CC: linux-kernel(a)vger.kernel.org
CC: linux-fsdevel(a)vger.kernel.org
CC: Xi Wang <xii@google.com>


Signed-off-by: kernel test robot <lkp@intel.com>
---
 fair.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index bb1003075e2e6..944657fc93032 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6749,7 +6749,7 @@ select_task_rq_fair(struct task_struct *p, int prev_c=
pu, int sd_flag, int wake_f
 extern int sysctl_sched_wake_idle_domain;
 extern int sysctl_sched_wake_idle_presearch_domain;
 =

-DEFINE_MUTEX(wake_idle_domain_mutex);
+static DEFINE_MUTEX(wake_idle_domain_mutex);
 =

 int proc_sched_wake_idle_domain_handler(struct ctl_table *table,
 		int write, void __user *buffer, size_t *lenp, loff_t *ppos)
--===============5729819101214998565==--

