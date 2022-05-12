Content-Type: multipart/mixed; boundary="===============8544799919808416374=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [RFC PATCH] mm: rss_stat_free() can be static
Date: Fri, 13 May 2022 05:12:12 +0800
Message-ID: <Yn14LEPLEzZnTlmg@dec1fc178572>
In-Reply-To: <202205130551.e9BVkfHo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8544799919808416374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220512044634.63586-3-ligang.bdlg@bytedance.com>
References: <20220512044634.63586-3-ligang.bdlg@bytedance.com>
TO: Gang Li <ligang.bdlg@bytedance.com>
TO: akpm(a)linux-foundation.org
CC: songmuchun(a)bytedance.com
CC: hca(a)linux.ibm.com
CC: gor(a)linux.ibm.com
CC: agordeev(a)linux.ibm.com
CC: borntraeger(a)linux.ibm.com
CC: svens(a)linux.ibm.com
CC: ebiederm(a)xmission.com
CC: keescook(a)chromium.org
CC: viro(a)zeniv.linux.org.uk
CC: rostedt(a)goodmis.org
CC: mingo(a)redhat.com
CC: peterz(a)infradead.org
CC: acme(a)kernel.org
CC: mark.rutland(a)arm.com
CC: alexander.shishkin(a)linux.intel.com
CC: jolsa(a)kernel.org
CC: namhyung(a)kernel.org
CC: david(a)redhat.com
CC: imbrenda(a)linux.ibm.com
CC: apopple(a)nvidia.com
CC: adobriyan(a)gmail.com
CC: stephen.s.brennan(a)oracle.com
CC: ohoono.kwon(a)samsung.com
CC: haolee.swjtu(a)gmail.com
CC: kaleshsingh(a)google.com
CC: zhengqi.arch(a)bytedance.com
CC: peterx(a)redhat.com
CC: shy828301(a)gmail.com
CC: surenb(a)google.com

kernel/fork.c:878:6: warning: symbol 'rss_stat_free' was not declared. Shou=
ld it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 kernel/fork.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index e549e0b30e2bd..2f5ce61f2aac8 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -875,7 +875,7 @@ void rss_stat_free(struct task_struct *p)
 	kfree(p->rss_stat.numa_count);
 }
 #else
-void rss_stat_free(struct task_struct *p) {}
+static void rss_stat_free(struct task_struct *p) {}
 #endif
 =

 void __put_task_struct(struct task_struct *tsk)
--===============8544799919808416374==--

